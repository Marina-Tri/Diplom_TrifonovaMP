<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\models\Role;
use yii\helpers\ArrayHelper;

/** @var yii\web\View $this */
/** @var app\models\User $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="user-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'ID_role')->dropdownList($items=ArrayHelper::map(Role::find()->all(), 'ID','Name'), ['prompt'=>'Выберите роль']) ?>

    <div class="form-group">
        <?= Html::submitButton('Изменить', ['class' => 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
