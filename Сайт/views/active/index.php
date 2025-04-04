<?php

use app\models\Active;
use app\models\Films;
use yii\bootstrap5\ActiveForm;
use yii\bootstrap5\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;
use yii\helpers\ArrayHelper;

/** @var yii\web\View $this */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = 'Активности';
?>
<div class="active-index">

    <?php if (Yii::$app->session->hasFlash('success')): ?>
    <?php endif; ?>
    <?php if (Yii::$app->session->hasFlash('danger')): ?>
    <?php endif; ?>

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Оценить', ['create'], ['class' => 'btn btn-primary']) ?>
    </p>

    <div class="row">
        <div class="my-1 col-12 col-md-3">
            <div class="p-3 text-center rounded border border-secondary border-2" style="background-color: #31363F;">
                <div class="border-bottom border-secondary border-2 mb-1">
                    <h2 class="text-center">Фильтры</h2>
                </div>
                <?php $form = ActiveForm::begin(); ?>

                <?= $form->field($model, 'Evaluation')->label('Оценка')->dropDownList($evaluation, ['prompt' => 'Выберите оценку']) ?>
                <?= $form->field($model, 'Like_')->checkbox(['class' => 'm-0'])->label('Лайк', ['class' => 'm-0']) ?>

                <div class="form-group">
                    <?= Html::submitButton('Найти', ['class' => 'btn btn-primary']) ?>
                </div>

                <?php ActiveForm::end(); ?>

            </div>
        </div>
        <div class="my-1 col-12 col-md-9">
            <div class="rounded border border-secondary border-2" style="background-color: #31363F;">
                <div class="border-bottom border-secondary border-2 mb-1">
                    <h2 class="text-center">Фильмы и сериалы</h2>
                </div>
                <?php foreach ($dataProvider -> models as $model) {
                    ?>
                    <div class="border-bottom border-secondary border-2 mb-3 p-2">
                        <div class="row">
                            <div class="col-12 col-md-3">
                                <?php echo \yii\helpers\Html::a(
                                    '<img src="' . $model->films->URL_Image . '" class="img-fluid">',
                                    ['films/view', 'ID' => $model->ID_film],
                                    ['title' => $model->films->Name]
                                ); ?>
                            </div>
                            <div class="col-12 col-md-6">
                                <p><h4><?php echo \yii\helpers\Html::a($model->films->Name, ['films/view', 'ID' => $model->ID_film], ['class' => 'film-title badge bg-info text-wrap']); ?></h4>
                                Страна: <?php echo $model->films->Country ?><br>
                                Год выпуска: <?php echo substr($model->films->Release_Year, 0, 4); ?><br>
                                Жанры: <?php echo $model->films->Genre ?> <br>
                                Возрастной рейтинг: <?php echo $model->films->Age_Rating ?>
                                </p>
                            </div>
                            <div class="col-12 col-md-3">
                                <p>
                                    <h5>Оценка: <?php echo $model->films->Evaluation_Average ?></h5>
                                    Моя оценка: <?php echo $model->Evaluation != NULL ? $model->Evaluation : 'Нет' ?><br>
                                    Лайк: <?php echo $model->Like_ == 1 ? 'Да' : 'Нет' ?>
                                </p>
                                <p>
                                    <?= Html::a('Изменить', ['update', 'ID' => $model->ID], ['class' => 'btn btn-primary']) ?>
                                    <?= Html::a('Удалить', ['delete', 'ID' => $model->ID], [
                                        'class' => 'btn btn-danger',
                                        'data' => [
                                            'confirm' => 'Are you sure you want to delete this item?',
                                            'method' => 'post',
                                        ],
                                    ]) ?>
                                </p>
                            </div>
                        </div>
                    </div>
                    <?php
                }
                ?>
            </div>
        </div>
    </div>

</div>
