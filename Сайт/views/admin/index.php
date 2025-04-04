<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;

/** @var yii\web\View $this */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = 'Статистика';
?>
<div class="user-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <div class="row my-4">
        <h2 class="rounded border border-secondary border-2" style="background-color: #31363F;">Общее количество пользователей: <?= Html::encode($totalUsers) ?></h2>
        <div class="col-md-6">
            <h2>Статистика по возрасту</h2>
            <canvas id="ageChart" width="400" height="200"></canvas>
        </div>
        <div class="col-md-6">
            <h2>Статистика по полу</h2>
            <canvas id="genderChart" width="400" height="200"></canvas>
        </div>
    </div>

    <div class="my-4">
        <h2 class="rounded border border-secondary border-2" style="background-color: #31363F;">Общее количество фильмов и сериалов: <?= Html::encode($totalFilms) ?></h2>
        <h2>Статистика по странам</h2>
        <canvas id="countryChart" width="400" height="200"></canvas>
        <h2>Статистика по жанрам</h2>
        <canvas id="genreChart" width="400" height="200"></canvas>
        <h2>Статистика по годам</h2>
        <canvas id="yearChart" width="400" height="200"></canvas>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        // Диаграмма по полу
        const ctxGender = document.getElementById('genderChart').getContext('2d');
        const genderChart = new Chart(ctxGender, {
            type: 'bar',
            data: {
                labels: <?= json_encode($genderLabels) ?>,
                datasets: [{
                    label: 'Количество пользователей по полу',
                    data: <?= json_encode($genderValues) ?>,
                    backgroundColor: [
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 99, 132, 0.2)',
                    ],
                    borderColor: [
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 99, 132, 1)',
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                plugins: {
                    legend: {
                        display: false
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        // Диаграмма по возрасту
        const ctxAge = document.getElementById('ageChart').getContext('2d');
        const ageChart = new Chart(ctxAge, {
            type: 'bar',
            data: {
                labels: <?= json_encode($ageLabels) ?>,
                datasets: [{
                    label: 'Количество пользователей по возрасту',
                    data: <?= json_encode($ageValues) ?>,
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                plugins: {
                    legend: {
                        display: false
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        const ctxCountry = document.getElementById('countryChart').getContext('2d');
        const countryChart = new Chart(ctxCountry, {
            type: 'bar',
            data: {
                labels: <?= json_encode($countryLabels) ?>,
                datasets: [{
                    label: 'Количество фильмов и сериалов по странам',
                    data: <?= json_encode($countryValues) ?>,
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                plugins: {
                    legend: {
                        display: false
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });   
        
        const ctxGenre = document.getElementById('genreChart').getContext('2d');
        const genreChart = new Chart(ctxGenre, {
            type: 'bar',
            data: {
                labels: <?= json_encode($genreLabels) ?>,
                datasets: [{
                    label: 'Количество фильмов и сериалов по жанрам',
                    data: <?= json_encode($genreValues) ?>,
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                plugins: {
                    legend: {
                        display: false
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        const ctxYear = document.getElementById('yearChart').getContext('2d');
        const yearChart = new Chart(ctxYear, {
            type: 'bar',
            data: {
                labels: <?= json_encode($yearLabels) ?>,
                datasets: [{
                    label: 'Количество фильмов и сериалов по годам выпуска',
                    data: <?= json_encode($yearValues) ?>,
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                plugins: {
                    legend: {
                        display: false
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>

</div>
