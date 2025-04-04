<?php
use app\models\Films;
use app\models\Active;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;
use yii\bootstrap5\ActiveForm;

/** @var yii\web\View $this */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = $model->Name;
?>

<div class="film-view">

    <div class="row">
        <div class="my-1 col-12 col-md-3">
            <div class="p-3 text-center" style="background-color: #31363F;">
                <h5>Реклама</h5>
            </div>
        </div>
        <div class="my-1 col-12 col-md-9">
            <div class="rounded border border-secondary border-2 p-2" style="background-color: #31363F;">
                <h1 class="text-center"><?= Html::encode($this->title) ?></h1>
                <div class="row">
                    <div class="col-md-3">
                        <img src="<?= Html::encode($model->URL_Image) ?>" class="img-fluid" alt="Film Image">
                    </div>
                    <div class="col-md-6">
                        <p><strong>Страна:</strong> <?= Html::encode($model->Country) ?></p>
                        <p><strong>Год выпуска:</strong> <?= substr($model->Release_Year, 0, 4) ?></p>
                        <p><strong>Жанры:</strong> <?= Html::encode($model->Genre) ?></p>
                        <p><strong>Возрастной рейтинг:</strong> <?= Html::encode($model->Age_Rating) ?></p>
                        <p><strong>Сезоны:</strong> <?= Html::encode($model->Season) ?></p>
                        <p><strong>Серии:</strong> <?= Html::encode($model->Series) ?></p>
                        <p><strong>Подробнее на</strong> <a href="<?= Html::encode($model->Web_Url) ?>" class="badge bg-info">КиноПоиск</a></p>
                    </div>
                    <div class="col-md-3">
                        <p><strong>Оценка:</strong> <?= Html::encode($model->Evaluation_Average	) ?></p>
                        <?php if (!Yii::$app->user->isGuest): ?>
                            <p>
                                <?= Html::a('Оценить', ['active/create'], ['class' => 'btn btn-primary']) ?>
                            </p>
                        <?php endif; ?>
                    </div>
                </div>
                <div class="row">
                    <div class="my-1 col-12">
                        <br>
                        <h2 class="text-center">Описание</h2>
                        <p><?= Html::encode($model->Description) ?></p>
                    </div> 
                </div>
            </div>
        </div>
    </div>
</div>