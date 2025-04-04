<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use app\models\User;
use app\models\Films;
use yii\data\ActiveDataProvider;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\db\Query;

/**
 * AdminController implements the CRUD actions for User model.
 */
class AdminController extends Controller
{
    /**
     * @inheritDoc
     */
    public function behaviors()
    {
        return array_merge(
            parent::behaviors(),
            [
                'access' => [
                'class' => AccessControl::class,
                'only' => ['*'],
                'rules' => [
                    [
                        'actions' => ['index', 'update', 'search'],
                        'allow' => true,
                        'roles' => ['@'],
                        'matchCallback' => function($rule, $action){
                            return \Yii::$app->user->identity->validateAdmin();
                        }
                    ],
                ],
            ],
                'verbs' => [
                    'class' => VerbFilter::className(),
                    'actions' => [
                        'delete' => ['POST'],
                    ],
                ],
            ]
        );
    }

    /**
     * Lists all User models.
     *
     * @return string
     */
    public function actionIndex()
    {
        $dataProvider = new ActiveDataProvider([
            'query' => User::find(),
            /*
            'pagination' => [
                'pageSize' => 50
            ],
            'sort' => [
                'defaultOrder' => [
                    'ID' => SORT_DESC,
                ]
            ],
            */
        ]);

        $genderStats = User::find()
            ->select(['ID_Gender', 'COUNT(*) as count'])
            ->groupBy('ID_Gender')
            ->asArray()
            ->all();

        $genderLabels = [];
        $genderValues = [];

        $genderNames = [
            1 => 'Мужской',
            2 => 'Женский',
        ];

        foreach ($genderStats as $stat) {
            $genderLabels[] = $genderNames[$stat['ID_Gender']] ?? 'Неизвестно';
            $genderValues[] = $stat['count'];
        }

        // Инициализация массивов для группировки
        $ageGroups = [
            '0-17' => 0,
            '18-24' => 0,
            '25-34' => 0,
            '35-44' => 0,
            '45-54' => 0,
            '55-64' => 0,
            '65+' => 0,
        ];

        // Получаем всех пользователей
        $users = User::find()->all();

        // Группируем пользователей по возрастным диапазонам
        foreach ($users as $user) {
            $age = $user->Age;
            if ($age >= 0 && $age <= 17) {
                $ageGroups['0-17']++;
            } elseif ($age >= 18 && $age <= 24) {
                $ageGroups['18-24']++;
            } elseif ($age >= 25 && $age <= 34) {
                $ageGroups['25-34']++;
            } elseif ($age >= 35 && $age <= 44) {
                $ageGroups['35-44']++;
            } elseif ($age >= 45 && $age <= 54) {
                $ageGroups['45-54']++;
            } elseif ($age >= 55 && $age <= 64) {
                $ageGroups['55-64']++;
            } elseif ($age >= 65) {
                $ageGroups['65+']++;
            }
        }

        // Подготовка данных для диаграммы
        $ageLabels = array_keys($ageGroups);
        $ageValues = array_values($ageGroups);

        // Получаем все фильмы из базы данных
        $films = Films::find()->all();

        // Массив для хранения уникальных жанров и их количества
        $genreCounts = [];

        foreach ($films as $film) {
            // Разделяем жанры по запятой и убираем лишние пробелы
            $genres = array_map('trim', explode(',', $film->Genre));

            foreach ($genres as $genre) {
                // Если жанр уже существует в массиве, увеличиваем счетчик
                if (isset($genreCounts[$genre])) {
                    $genreCounts[$genre]++;
                } else {
                    // Если жанр новый, добавляем его в массив с начальным значением 1
                    $genreCounts[$genre] = 1;
                }
            }
        }

        // Преобразуем массив в формат, подходящий для диаграммы
        $genreLabels = array_keys($genreCounts);
        $genreValues = array_values($genreCounts);

        // Массив для хранения уникальных стран и их количества
        $countryCounts = [];

        foreach ($films as $film) {
            // Разделяем страны по запятой и убираем лишние пробелы
            $countries = array_map('trim', explode(',', $film->Country));

            foreach ($countries as $country) {
                // Если страна уже существует в массиве, увеличиваем счетчик
                if (isset($countryCounts[$country])) {
                    $countryCounts[$country]++;
                } else {
                    // Если страна новая, добавляем ее в массив с начальным значением 1
                    $countryCounts[$country] = 1;
                }
            }
        }

        // Преобразуем массив в формат, подходящий для диаграммы
        $countryLabels = array_keys($countryCounts);
        $countryValues = array_values($countryCounts);

        // Массив для хранения уникальных годов и их количества
        $yearCounts = [];

        foreach ($films as $film) {
            // Получаем год выпуска фильма
            $year = substr($film->Release_Year, 0, 4);

            // Если год уже существует в массиве, увеличиваем счетчик
            if (isset($yearCounts[$year])) {
                $yearCounts[$year]++;
            } else {
                // Если год новый, добавляем его в массив с начальным значением 1
                $yearCounts[$year] = 1;
            }
        }

        // Преобразуем массив в формат, подходящий для диаграммы
        $yearLabels = array_keys($yearCounts);
        $yearValues = array_values($yearCounts);

        // Сортируем метки годов по возрастанию
        sort($yearLabels);
        
        // Сортируем значения в соответствии с отсортированными метками
        $yearValuesSorted = [];
        foreach ($yearLabels as $year) {
            $yearValuesSorted[] = $yearCounts[$year];
        }

        $totalUsers = User::find()->count();
        $totalFilms = Films::find()->count();

        return $this->render('index', [
            'dataProvider' => $dataProvider,
            'genderLabels' => $genderLabels,
            'genderValues' => $genderValues,
            'ageLabels' => $ageLabels,
            'ageValues' => $ageValues,
            'totalUsers' => $totalUsers,
            'totalFilms' => $totalFilms,
            'genreLabels' => $genreLabels,
            'genreValues' => $genreValues,
            'countryLabels' => $countryLabels,
            'countryValues' => $countryValues,
            'yearLabels' => $yearLabels,
            'yearValues' => $yearValuesSorted,
        ]);
    }

    /**
     * Displays a single User model.
     * @param int $ID ID
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($ID)
    {
        return $this->render('view', [
            'model' => $this->findModel($ID),
        ]);
    }

    /**
     * Creates a new User model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     */
    public function actionCreate()
    {
        $model = new User();

        if ($this->request->isPost) {
            if ($model->load($this->request->post()) && $model->save()) {
                return $this->redirect(['view', 'ID' => $model->ID]);
            }
        } else {
            $model->loadDefaultValues();
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing User model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $ID ID
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($ID)
    {
        $model = $this->findModel($ID);

        if ($this->request->isPost && $model->load($this->request->post()) && $model->save()) {
            Yii::$app->session->setFlash('success', 'Роль изменена');
            return $this->redirect(['search']);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing User model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $ID ID
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($ID)
    {
        $this->findModel($ID)->delete();

        return $this->redirect(['index']);
    }

    public function actionSearch()
    {
        $model = new \yii\base\DynamicModel(['search']);
        $model->addRule(['search'], 'string');

        $results = [];

        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            $searchTerm = $model->search;

            // Создаем запрос
            $query = new Query();
            $results = $query->select('User.*, Gender.Name AS gender_Name, Role.Name AS role_Name')
                ->from('User')
                ->leftJoin('Gender', 'User.ID_Gender = Gender.ID')
                ->leftJoin('Role', 'User.ID_role = Role.ID')
                ->where(['like', 'Username', $searchTerm])
                ->all();
        }
        // Передаем результаты в представление
        return $this->render('search', [
            'model' => $model,
            'results' => $results,
        ]);
    }

    /**
     * Finds the User model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $ID ID
     * @return User the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($ID)
    {
        if (($model = User::findOne(['ID' => $ID])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
