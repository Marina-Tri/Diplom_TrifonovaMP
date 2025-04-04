<?php

namespace app\controllers;

use Yii;
use app\models\Films;
use app\models\Active;
use yii\filters\AccessControl;
use yii\data\ActiveDataProvider;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\db\Query;
use yii\base\Model;

/**
 * ActiveController implements the CRUD actions for Active model.
 */
class ActiveController extends Controller
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
                    'only' => ['index', 'create', 'update', 'delete'],
                    'rules' => [
                        [
                            'actions' => ['index', 'create', 'update', 'delete'],
                            'allow' => true,
                            'roles' => ['@'],
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
     * Lists all Active models.
     *
     * @return string
     */
    public function actionIndex()
    {
        // Создаем динамическую модель с атрибутами для фильтрации
        $model = new \yii\base\DynamicModel(['Evaluation', 'Like_']);
        $model->addRule(['Evaluation', 'Like_'], 'string');

        $evaluation = [
            '10' => '10',
            '9' => '9',
            '8' => '8',
            '7' => '7',
            '6' => '6',
            '5' => '5',
            '4' => '4',
            '3' => '3',
            '2' => '2',
            '1' => '1',
        ];
        $like_ = [
            '1' => 'Есть',
        ];

        // Создаем базовый запрос
        $query = Active::find()->orderBy(['ID' => SORT_DESC])->where(['ID_user' => Yii::$app->User->identity->ID]);

        // Проверяем, загружены ли данные из формы фильтрации
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            // Сохраняем значения фильтра в сессии
            
            if ($model->Evaluation && $model->Evaluation !== '') {
                $query->andWhere(['Evaluation' => $model->Evaluation]);
            }
            if ($model->Like_ && $model->Like_ !== '') {
                $query->andWhere(['Like_' => $model->Like_]);
            }
        }

        // Создаем DataProvider с отфильтрованным запросом
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            //'pagination' => [
            //    'pageSize' => 10,
            //],
        ]);

        return $this->render('index', [
            'dataProvider' => $dataProvider,
            'model' => $model,
            'evaluation' => $evaluation,
            'like_' => $like_,
        ]);
    }

    /**
     * Displays a single Active model.
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
     * Creates a new Active model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     **/
    public function actionCreate()
    {
        $model = new Active();

        if ($this->request->isPost) {
            if ($model->load($this->request->post()) && $model->save()) {
                Yii::$app->session->setFlash('success', 'Оценка добавлена');
                return $this->redirect(['index']);
            }
        } else {
            $model->loadDefaultValues();
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing Active model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $ID ID
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($ID)
    {
        $model = $this->findModel($ID);

        if ($this->request->isPost && $model->load($this->request->post()) && $model->save()) {
            Yii::$app->session->setFlash('success', 'Изменения сохранены');
            return $this->redirect(['index']);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing Active model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $ID ID
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($ID)
    {
        $this->findModel($ID)->delete();

        Yii::$app->session->setFlash('danger', 'Запись удалена');

        return $this->redirect(['index']);
    }

    /**
     * Finds the Active model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $ID ID
     * @return Active the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($ID)
    {
        if (($model = Active::findOne(['ID' => $ID])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
