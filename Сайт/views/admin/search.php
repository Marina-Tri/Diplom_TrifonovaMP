<?php
use yii\bootstrap5\ActiveForm;
use yii\helpers\Html;
use yii\helpers\Url;
use app\models\Role;
use app\models\Gender;

$this->title = 'Поиск';
?>

<?php if (Yii::$app->session->hasFlash('success')): ?>
<?php endif; ?>

<h1><?= Html::encode($this->title) ?></h1>

<div class="search-form">
    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'search')->textInput(['placeholder' => 'Введите логин'])->label(false) ?>

    <div class="form-group">
        <?= Html::submitButton('Искать', ['class' => 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>
</div>

<div class="search-results">
    <h2>Результаты поиска:</h2>
    <?php if (!empty($results)): ?>
    <div class="row">
        <?php foreach ($results as $result): ?>
            <div class="card text-white m-2 rounded border border-secondary border-2 col-11 col-md-5" style="background-color: #31363F;">
                <div class="card-header"><h3><?= \yii\helpers\Html::encode($result['FIO']) ?></h3></div>
                <div class="card-body">
                    <h4 class="card-title"><strong>Логин:</strong> <?= \yii\helpers\Html::encode($result['Username']) ?></h4>
                    <h5><p class="card-text">
                        <p><strong>Пол:</strong> <?= \yii\helpers\Html::encode($result['gender_Name']) ?></p>
                        <p><strong>Возраст:</strong> <?= \yii\helpers\Html::encode($result['Age']) ?></p>
                        <p><strong>Роль:</strong> <?= \yii\helpers\Html::encode($result['role_Name']) ?></p>
                        <p><strong>Почта:</strong> <?= \yii\helpers\Html::encode($result['Email']) ?></p>
                    </p></h5>
                    <?= Html::a('Изменить роль', ['update', 'ID' => $result['ID']], ['class' => 'btn btn-primary']) ?>
                </div>
            </div>
        <?php endforeach; ?>
    </div>
    <?php elseif (!empty($model->search)): ?>
        <p>Нет результатов для вашего запроса.</p>
    <?php endif; ?>
</div>
