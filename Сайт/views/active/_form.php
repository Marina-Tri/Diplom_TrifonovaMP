<?php

use yii\bootstrap5\ActiveForm;
use yii\bootstrap5\Html;
use yii\helpers\ArrayHelper;
use app\models\Films;

/** @var yii\web\View $this */
/** @var app\models\Active $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="active-form">
    <div class="row">
        <div class="col-lg-5">
            <?php $form = ActiveForm::begin(
                [
                    'fieldConfig' => [
                        'template' => "{label}\n{input}\n{error}",
                        'labelOptions' => ['class' => 'col-lg-1 col-form-label mr-lg-3 text-nowrap'],
                        'inputOptions' => ['class' => 'col-lg-3 form-control'],
                        'errorOptions' => ['class' => 'col-lg-7 invalid-feedback'],
                    ],
                ]
            );
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
            ?>

            <?= $form->field($model, 'ID_film')->dropdownList($items=ArrayHelper::map(Films::find()->all(), 'ID','Name'), ['prompt'=>'Выберите фильм или сериал']) ?>

            <?= $form->field($model, 'Evaluation')->dropDownList($evaluation, ['prompt' => 'Выберите оценку']) ?>

            <?= $form->field($model, 'Like_')->dropDownList($like_, ['prompt' => 'Выберите наличие лайка']) ?>

            <div class="form-group">
                <?= Html::submitButton('Оценить', ['class' => 'btn btn-primary']) ?>
            </div>

            <?php ActiveForm::end(); ?>
        </div>
    </div>

</div>
