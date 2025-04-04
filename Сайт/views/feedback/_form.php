<?php

use yii\bootstrap5\ActiveForm;
use yii\bootstrap5\Html;

/** @var yii\web\View $this */
/** @var app\models\Feedback $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="feedback-form">

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
    ?>

    <?= $form->field($model, 'Message')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'Evaluation')->dropDownList($evaluation, ['prompt' => 'Выберите оценку']) ?>

    <div class="form-group">
        <?= Html::submitButton('Отправить', ['class' => 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
