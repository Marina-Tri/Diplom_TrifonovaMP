<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\models\Active $model */

$this->title = 'Добавление оценки';
?>
<div class="active-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
