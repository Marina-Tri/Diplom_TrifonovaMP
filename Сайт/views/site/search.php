<?php
use yii\bootstrap5\ActiveForm;
use yii\bootstrap5\Html;
use yii\helpers\Url;

$this->title = 'Поиск';
?>

<h1><?= Html::encode($this->title) ?></h1>

<div class="search-form">
    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'search')->textInput(['placeholder' => 'Введите название'])->label(false) ?>

    <div class="form-group">
        <?= Html::submitButton('Искать', ['class' => 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>
</div>

<div class="search-results">
    <h2>Результаты поиска:</h2>
    <?php if (!empty($results)): ?>
        <?php foreach ($results as $result): ?>
            <div class="border-bottom border-secondary border-2 mb-3 p-2">
                <div class="row">
                    <div class="col-12 col-md-3">
                    <?= \yii\helpers\Html::a(
                        \yii\helpers\Html::img($result['URL_Image'], ['class' => 'img-fluid']),
                        ['films/view', 'ID' => $result['ID']],
                        ['title' => \yii\helpers\Html::encode($result['Name'])]
                    ) ?>
                    </div>
                    <div class="col-12 col-md-7">
                        <p>
                            <h4><?= \yii\helpers\Html::a(\yii\helpers\Html::encode($result['Name']), ['films/view', 'ID' => $result['ID']], ['class' => 'film-title badge bg-info text-wrap']) ?></h4>
                            Страна: <?= \yii\helpers\Html::encode($result['Country']) ?><br>
                            Год выпуска: <?= \yii\helpers\Html::encode(substr($result['Release_Year'], 0, 4)) ?><br>
                            Жанры: <?= \yii\helpers\Html::encode($result['Genre']) ?><br>
                            Возрастной рейтинг: <?= \yii\helpers\Html::encode($result['Age_Rating']) ?>
                        </p>
                    </div>
                    <div class="col-12 col-md-2">
                        <p><strong>Оценка:</strong> <?= Html::encode($result['Evaluation_Average']) ?></p>
                    </div>
                </div>
            </div>
        <?php endforeach; ?>
    <?php elseif (!empty($model->search)): ?>
        <p>Нет результатов для вашего запроса.</p>
    <?php endif; ?>
</div>
