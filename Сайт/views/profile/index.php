<?php

use app\models\User;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;

/** @var yii\web\View $this */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = 'Профиль';
?>
<div class="user-index">
    

        <h1><?= Html::encode($this->title) ?></h1>

        <?php foreach ($dataProvider -> models as $model) {
            ?>
            <div class="card text-white my-3 rounded border border-secondary border-2 col-12 col-md-5" style="background-color: #31363F;">
                <div class="card-header"><h3><?php echo $model->FIO ?></h3></div>
                <div class="card-body">
                    <h4 class="card-title"><strong>Логин:</strong> <?php echo $model->Username ?></h4>
                    <h5><p class="card-text">
                        <p><strong>Пол:</strong> <?php echo $model->gender->Name ?></p>
                        <p><strong>Возраст:</strong> <?php echo $model->Age ?></p>
                        <p><strong>Роль:</strong> <?php echo $model->role->Name ?></p>
                        <p><strong>Почта:</strong> <?php echo $model->Email ?></p>
                    </p></h5>
                    <?= Html::a('Изменить', ['update', 'ID' => $model->ID], ['class' => 'btn btn-primary']) ?>
                </div>
            </div>
            <?php
        }
        ?>
</div>
