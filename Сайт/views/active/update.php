<?php

use yii\helpers\Html;
use app\models\Films;

/** @var yii\web\View $this */
/** @var app\models\Active $model */

$this->title = 'Изменить: ' . $model->films->Name;
?>
<div class="active-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
