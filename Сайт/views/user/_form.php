<?php

use yii\bootstrap5\ActiveForm;
use yii\helpers\Html;
use app\models\Gender;
use yii\helpers\ArrayHelper;

/** @var yii\web\View $this */
/** @var app\models\User $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="user-form">

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
            ); ?>

            <?= $form->field($model, 'Username')->textInput(['maxlength' => true]) ?>

            <?= $form->field($model, 'FIO')->textInput(['maxlength' => true]) ?>

            <?= $form->field($model, 'ID_Gender')->dropdownList($items=ArrayHelper::map(Gender::find()->all(), 'ID','Name'), ['prompt'=>'Выберите пол']) ?>

            <?= $form->field($model, 'Age')->textInput() ?>

            <?= $form->field($model, 'Password')->passwordInput(['maxlength' => true]) ?>

            <?= $form->field($model, 'Email')->textInput(['maxlength' => true]) ?>

            <div class="form-group">
                <?= Html::submitButton('Зарегистрироваться', ['class' => 'btn btn-primary']) ?>
            </div>

            <?php ActiveForm::end(); ?>

        </div>
    </div>
</div>
