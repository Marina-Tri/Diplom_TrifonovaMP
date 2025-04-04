<?php

/** @var yii\web\View $this */
/** @var string $content */

use app\assets\AppAsset;
use app\widgets\Alert;
use yii\bootstrap5\Breadcrumbs;
use yii\helpers\Html;
use yii\bootstrap5\Nav;
use yii\bootstrap5\NavBar;

AppAsset::register($this);

$this->registerCsrfMetaTags();
$this->registerMetaTag(['charset' => Yii::$app->charset], 'charset');
$this->registerMetaTag(['name' => 'viewport', 'content' => 'width=device-width, initial-scale=1, shrink-to-fit=no']);
$this->registerMetaTag(['name' => 'description', 'content' => $this->params['meta_description'] ?? '']);
$this->registerMetaTag(['name' => 'keywords', 'content' => $this->params['meta_keywords'] ?? '']);
$this->registerLinkTag(['rel' => 'icon', 'type' => 'image/x-icon', 'href' => Yii::getAlias('@web/favicon.ico')]);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>" class="h-100">
<head>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>
<body class="d-flex flex-column h-100">
<?php $this->beginBody() ?>

<header id="header">
    <?php
    NavBar::begin([
        'brandLabel' => Html::img('@web/images/logo.png', ['alt' => 'Movie Review', 'height' => '25']),
        'brandUrl' => Yii::$app->homeUrl,
        'options' => ['class' => 'navbar-expand-lg navbar-dark header border-bottom border-secondary fixed-top']
    ]);
    echo Nav::widget([
        'options' => ['class' => 'navbar-nav'],
        'items' => [
            ['label' => 'Главная', 'url' => ['/site/index']],
            ['label' => 'Каталог', 'url' => ['/site/catalog']],
            ['label' => 'Поиск', 'url' => ['/site/search']],
            ['label' => 'О нас', 'url' => ['/site/about']],
            [
                'label' => 'Панель администратора',
                'items' => [
                    ['label' => 'Статистика', 'url' => ['/admin/index']],
                    ['label' => 'Поиск пользователя', 'url' => ['/admin/search']],
                ],
                'options' => ['class' => 'dropdown'],
                'visible' => !Yii::$app->user->isGuest&&Yii::$app->user->identity->validateAdmin(),
            ],
            [
                'label' => 'Профиль',
                'items' => [
                    ['label' => 'Редактировать профиль', 'url' => ['/profile/index']],
                    ['label' => 'Активности', 'url' => ['/active/index']],
                    ['label' => 'Обратная связь', 'url' => ['/feedback/index']],
                    ['label' => 'Техподдержка', 'url' => ['/request/index']],
                ],
                'options' => ['class' => 'dropdown'],
                'visible' => !Yii::$app->user->isGuest,
            ],
            ['label' => 'Регистрация', 'url' => ['/user/create'], 'visible' => Yii::$app->user->isGuest],
            Yii::$app->user->isGuest
                ? ['label' => 'Вход', 'url' => ['/site/login']]
                : '<li class="nav-item">'
                    . Html::beginForm(['/site/logout'])
                    . Html::submitButton(
                        'Выход (' . Yii::$app->user->identity->Username . ')',
                        ['class' => 'nav-link btn btn-link logout']
                    )
                    . Html::endForm()
                    . '</li>'
        ]
    ]);
    NavBar::end();
    ?>
</header>

<main id="main" class="flex-shrink-0 main" role="main">
    <div class="container">
        <?php if (!empty($this->params['breadcrumbs'])): ?>
            <?= Breadcrumbs::widget(['links' => $this->params['breadcrumbs']]) ?>
        <?php endif ?>
        <?= Alert::widget() ?>
        <?= $content ?>
    </div>
</main>

<footer id="footer" class="mt-auto py-3 footer border-top border-secondary d-flex justify-content-center align-items-center">
    <div class="container">
        <div class="row text">
            <div class="col-md-4 text-center text-md-start">&copy; Сайт разработан для дипломной работы в техникуме, он не является полноценным сервисом.
            Сайт использует поддомен, для получения информации об авторе перейдите на konacadev.ru <?= date('Y') ?></div>
            <div class="col-md-4 text-center">
                Поддержите нас:<br>
                <a href="https://www.donationalerts.com/r/rin128" class="badge bg-info text-wrap my-1">Поддержать Rin128 (Разработчик сайта)</a><br>
                <a href="https://www.donationalerts.com/r/konaca_" class="badge bg-info text-wrap my-1"> Поддержать Konaca (Разработчик основного Telegram-бота) </a><br>
                <a href="https://www.donationalerts.com/r/ari1818f" class="badge bg-info text-wrap my-1">Поддержать Ari1818F (Разработчик Telegram-бота технической поддержки)</a>
            </div>
            <div class="col-md-4 text-center text-md-end"><?= Yii::powered() ?></div>
        </div>
    </div>
</footer>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
