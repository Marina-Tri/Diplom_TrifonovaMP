<?php

use app\models\Films;
use app\models\Active;
use yii\bootstrap5\ActiveForm;
use yii\bootstrap5\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;
use yii\helpers\ArrayHelper;


/** @var yii\web\View $this */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = 'Каталог';
?>
<div class="site-catalog">

    <div class="row">
        <div class="my-1 col-12 col-md-3">
            <div class="p-3 text-center rounded border border-secondary border-2" style="background-color: #31363F;">
                <div class="border-bottom border-secondary border-2 mb-1">
                    <h2 class="text-center">Фильтры</h2>
                </div>
                <?php $form = ActiveForm::begin(); ?>

                <?= $form->field($model, 'Country')->label('Страна')->dropDownList($countries, ['prompt' => 'Выберите страну']) ?>
                <?= $form->field($model, 'Genre')->label('Жанр')->dropDownList($genres, ['prompt' => 'Выберите жанр']) ?>
                <?= $form->field($model, 'Release_Year')->label('Год выпуска')->dropDownList($years, ['prompt' => 'Выберите год']) ?>

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
                                    '<img src="' . $model->URL_Image . '" class="img-fluid">',
                                    ['films/view', 'ID' => $model->ID],
                                    ['title' => $model->Name]
                                ); ?>
                            </div>
                            <div class="col-12 col-md-6">
                                <p><h4><?php echo \yii\helpers\Html::a($model->Name, ['films/view', 'ID' => $model->ID], ['class' => 'film-title badge bg-info text-wrap']); ?></h4>
                                Страна: <?php echo $model -> Country ?><br>
                                Год выпуска: <?php echo substr($model->Release_Year, 0, 4); ?><br>
                                Жанры: <?php echo $model -> Genre ?> <br>
                                Возрастной рейтинг: <?php echo $model -> Age_Rating ?>
                                </p>
                            </div>
                            <div class="col-12 col-md-3">
                                <p><h5>Оценка: <?php echo $model -> Evaluation_Average ?></h5></p>
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