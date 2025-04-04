<?php

use app\models\Feedback;
use yii\bootstrap5\Html;
use yii\bootstrap5\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;
use yii\bootstrap5\LinkPager;

/** @var yii\web\View $this */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = 'Обратная связь';
?>
<div class="feedback-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Оставить отзыв', ['create'], ['class' => 'btn btn-primary']) ?>
    </p>

    <?php foreach ($dataProvider -> models as $model) {
        ?>
        <div class="card text-white my-3 rounded border border-secondary border-2 col-12 col-md-5" style="background-color: #31363F;">
            <div class="card-header"><h3><strong>Отзыв №<?php echo $model->ID ?></strong></h3></div>
            <div class="card-body">
                <h4 class="card-title"><strong>Отзыв:</strong> <?php echo $model->Message ?></h4>
                <h5><p class="card-text">
                    <p><strong>Оценка:</strong> <?php echo $model->Evaluation ?></p>
                </p></h5>
            </div>
        </div>
        <?php
    }
    echo LinkPager::widget([
        'pagination' => $dataProvider -> pagination,
        'options' => ['class' => 'pagination'], // Центрирование пагинации
        'linkOptions' => ['class' => 'page-link text-white bg-secondary'], // Класс для ссылок
        'activePageCssClass' => 'active', // Класс для активной страницы
        'disabledPageCssClass' => 'disabled', // Класс для отключенной страницы
        ])
    ?>


</div>
