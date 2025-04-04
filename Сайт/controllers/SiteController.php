<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\Response;
use yii\filters\VerbFilter;
use app\models\LoginForm;
use app\models\ContactForm;
use yii\data\ActiveDataProvider;
use app\models\Films;
use yii\db\Query;
use yii\base\Model;

class SiteController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::class,
                'only' => ['logout'],
                'rules' => [
                    [
                        'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::class,
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex()
    {
        $dataProvider1 = new ActiveDataProvider([
            'query' => Films::find()->orderBy(['Date_at' => SORT_DESC]),
            'pagination' => [
                'pageSize' => 15,
            ],
        ]);

        $dataProvider2 = new ActiveDataProvider([
            'query' => Films::find()->orderBy(['Evaluation_Average' => SORT_DESC]),
            'pagination' => [
                'pageSize' => 5,
            ],
        ]);

        return $this->render('index', [
            'dataProvider1' => $dataProvider1,
            'dataProvider2' => $dataProvider2,
        ]);
    }

    public function actionCatalog()
    {
        // Создаем динамическую модель с атрибутами для фильтрации
        $model = new \yii\base\DynamicModel(['Country', 'Genre', 'Release_Year']);
        $model->addRule(['Country', 'Genre', 'Release_Year'], 'string');

        $countriesRaw = Films::find()
            ->select('Country')
            ->column(); // Получаем массив значений

        // Объединение значений, разделенных запятыми, и удаление дубликатов
        $countries = [];
        foreach ($countriesRaw as $countryString) {
            $countryList = explode(',', $countryString); // Разделяем по запятой
            foreach ($countryList as $country) {
                $countries[trim($country)] = trim($country); // Убираем пробелы и добавляем в массив
            }
        }

        $genresRaw = Films::find()
        ->select('Genre')
        ->column(); // Получаем массив значений

        // Объединение значений, разделенных запятыми, и удаление дубликатов
        $genres = [];
        foreach ($genresRaw as $genreString) {
            $genreList = explode(',', $genreString); // Разделяем по запятой
            foreach ($genreList as $genre) {
                $genres[trim($genre)] = trim($genre); // Убираем пробелы и добавляем в массив
            }
        }

        // $years содержит значения в формате 'YYYY-MM-DD'
        $yearsRaw = Films::find()
        ->select('Release_Year')
        ->orderBy(['Release_Year' => SORT_DESC])
        ->column(); // Получаем массив значений

        // Извлечение только годов и удаление дубликатов
        $years = array_unique(array_map(function($date) {
            return substr($date, 0, 4); // Извлечение первых четырех символов (года)
        }, $yearsRaw));
        
        $yearsList = array_values($years);

        $years = [];
        foreach ($yearsList as $year) {
            $years[$year] = $year;
        }

        // Создаем базовый запрос
        $query = Films::find()->orderBy(['Date_at' => SORT_DESC]);

        // Проверяем, загружены ли данные из формы фильтрации
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            // Сохраняем значения фильтра в сессии
            
            if ($model->Country && $model->Country !== '') {
                $query->andWhere(['like', 'Country', $model->Country]);
            }
            if ($model->Genre && $model->Genre !== '') {
                $query->andWhere(['like', 'Genre', $model->Genre]);
            }
            if ($model->Release_Year && $model->Release_Year !== '') {
                $query->andWhere(['like', 'Release_Year', $model->Release_Year]);
            }
        }

        // Создаем DataProvider с отфильтрованным запросом
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            //'pagination' => [
            //    'pageSize' => 10,
            //],
        ]);

        return $this->render('catalog', [
            'dataProvider' => $dataProvider,
            'model' => $model, // Передаем модель для формы фильтрации
            'countries' => $countries, // Передаем список стран
            'genres' => $genres, // Передаем список жанров
            'years' => $years, // Передаем список годов
        ]);
    }

    /**
     * Login action.
     *
     * @return Response|string
     */
    public function actionLogin()
    {
        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->goBack();
        }

        $model->Password = '';
        return $this->render('login', [
            'model' => $model,
        ]);
    }

    /**
     * Logout action.
     *
     * @return Response
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }

    /**
     * Displays contact page.
     *
     * @return Response|string
     */
    public function actionContact()
    {
        $model = new ContactForm();
        if ($model->load(Yii::$app->request->post()) && $model->contact(Yii::$app->params['adminEmail'])) {
            Yii::$app->session->setFlash('contactFormSubmitted');

            return $this->refresh();
        }
        return $this->render('contact', [
            'model' => $model,
        ]);
    }

    /**
     * Displays about page.
     *
     * @return string
     */
    public function actionAbout()
    {
        return $this->render('about');
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
            $results = $query->select('*')
                ->from('Films')
                ->where(['like', 'Name', $searchTerm])
                ->all();
        }
        // Передаем результаты в представление
        return $this->render('search', [
            'model' => $model,
            'results' => $results,
        ]);
    }
}
