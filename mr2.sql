-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Дек 25 2024 г., 11:10
-- Версия сервера: 5.7.21-20-beget-5.7.21-20-1-log
-- Версия PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `vkusnitz_rm`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Active`
--
-- Создание: Дек 02 2024 г., 13:07
--

DROP TABLE IF EXISTS `Active`;
CREATE TABLE `Active` (
  `ID` int(11) NOT NULL,
  `ID_user` int(11) DEFAULT NULL,
  `ID_film` int(11) DEFAULT NULL,
  `Evaluation` int(1) DEFAULT NULL,
  `Like_` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Active`
--

INSERT INTO `Active` (`ID`, `ID_user`, `ID_film`, `Evaluation`, `Like_`) VALUES
(2, 4, 5, 10, 1),
(3, 4, 9, 5, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `Error`
--
-- Создание: Окт 28 2024 г., 15:11
--

DROP TABLE IF EXISTS `Error`;
CREATE TABLE `Error` (
  `ID` int(11) NOT NULL,
  `ID_Support` int(11) DEFAULT NULL,
  `ID_Dev` int(11) DEFAULT NULL,
  `ID_Platform` int(11) DEFAULT NULL,
  `Message` text,
  `ID_Work` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Feedback`
--
-- Создание: Окт 28 2024 г., 15:12
--

DROP TABLE IF EXISTS `Feedback`;
CREATE TABLE `Feedback` (
  `ID` int(11) NOT NULL,
  `ID_user` int(11) DEFAULT NULL,
  `Message` text,
  `Evaluation` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Films`
--
-- Создание: Окт 28 2024 г., 14:36
--

DROP TABLE IF EXISTS `Films`;
CREATE TABLE `Films` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Description` text,
  `Season` int(11) DEFAULT NULL,
  `Series` int(11) DEFAULT NULL,
  `Evaluation_Average` float DEFAULT NULL,
  `Release_Year` date DEFAULT NULL,
  `Country` varchar(255) DEFAULT NULL,
  `Genre` text,
  `URL_Image` text,
  `Date_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `Web_Url` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Films`
--

INSERT INTO `Films` (`ID`, `Name`, `Description`, `Season`, `Series`, `Evaluation_Average`, `Release_Year`, `Country`, `Genre`, `URL_Image`, `Date_at`, `Web_Url`) VALUES
(5, 'Нефть', 'Начало XX века. Предприниматель Дэниэл Плэйнвью ищет золото и серебро, а находит нефть. За несколько лет он становится преуспевающим нефтяником, разработавшим уже несколько скважин. Однажды он узнает про новое месторождение. Уцепившись за этот шанс разбогатеть, Дэниэл делает всё, чтобы добиться своего.', 1, 1, 7.8, '2007-00-00', 'США', 'Драма', 'https://avatars.mds.yandex.net/get-kinopoisk-image/1773646/7b79e1d9-c5e1-4386-a5a6-3f84d9bfb891/300x450', '2024-12-13 15:34:28', 'https://www.kinopoisk.ru/film/196604/'),
(6, 'Малхолланд Драйв', 'Загадочная девушка, после автомобильной аварии страдающая потерей памяти, выбирает себе имя Рита с рекламного плаката к фильму с Ритой Хейворт и пытается начать новую жизнь в Голливуде. Но тайны прошлого неотступно преследуют ее. \nКто были те двое мужчин, что сидели в одной машине с ней и погибли в аварии? Почему полиция подозревает, что она была ими похищена? И случайно ли в ее жизни появляется новая подруга, начинающая актриса Бетти?', 1, 1, 7.7, '2001-00-00', 'США, Франция', 'Триллер, Драма, Детектив', 'https://kinopoisk-ru.clstorage.net/p1Yc61138/6f20087UZY1/m8gwayfnsK-wjIEEJe3v314uyNP969-_d1s07VOZmrSFXMwQXQ2dR4e1gj6DMqTyHqmnDV4KzcMlYICMKcMFJQ5NcHzjtWW6pwqHEPM4bk0buxyCuznKLnAf47uEUla-idaQmdLHlUyf5BIuhWWzJM64sRraSQsS9XwbCayMFrYfC7ZqLvI4ZL0UzMSnYmWdDKDCEKzjGvgqET8uGd-YNUFdFx-TxpECX-AXp5_qMmlB8LpancNVUrH30NFgSh4yGEgxK6p3Pe4xXEtErW8tnIzrSBul4Vw24Nv65BXfH_qFXZuQkMZWglfgFeGbavgtwPj0k5TJm9q1u50dLIeT_d2MOSmiuLskv9rNBSWkLxfI6MKbZOscs2ETMmQbW9i-Ct9e3tuLV8CSbVHjHOqzYUD4s1sfh5OaMv1fnWkP27BajX0p6fe57PeaBkbtLaYcRiSF1m1jVzzgUzXn2l7f80tV0VPXTVrMGSJWLpvkc2bGeDjaVMNdn3x4WNfuAxo1UY8zpKL09i_30YbI4CqkGoAvgtCtpFC759B_a9bfGjQCHVuUlQhZD9HnXi4X7L8pDf14kRJFmZKw-F0c4YtQ_F4LOaWv_Xbo-tdCRCPnJtTEoQWXbuGXsaUcteeRHFN3SF5WENhPnE_datYiU2U1bon19xrUA5pScbKeW-QJWPGRBPTlZ_y-qjrZRU-s5W0UT-HNHWAvFTdu1L_vmpOTPABdmlCWC51IWaXaoxUheGWDMPHZ2I6THruw3xfhS1_w38Y6qurwtu4wG0HJI64omIDlDBQs51v4rdt0rJmeG7MD31wSnU9YyF_hEeBTK3mvz_XzExDG0V3-OZaVoYDVc1BPNGqg9HcrOhqPDqYhbtyDJ0wc4yfSdymVvyPcF5w-hBReH96FVgtYaJLjHibyKUF28pKaSlaX-HFaVelCEzTXC7Krrbk-ZjAaTcFnamRahq8FlqLsnr6iFffl0tzcNEkU1JkTCNaKGGUeK5pn9atEurNVGwsRFzS51tujRN9xmEDxYaexeS99WkEO7S4olACgC5Bvb9p8IpxzKNscXfYMlxZR3cxajpTsH2US7_sqiP62HRzKVBg-ftZaIEnd9dFPNeQjcPbm_VZEj-akKhWB74HQbaHat6ka9KrRlR00xdxamVpLXQdWat9tHG4zrcH2sV3aSN7Ye_5d3CxEXbVTzX3jbXmyqjIRhQQnrCfRyehKXOJhkzvpnfyimZlfOMPYnlpVzNlDX-2aLtyutCNL93kVVIAYGjK5Vlgpxlb4V0_xqeVysKv-m0THI-KoGE-hxdrubtxx6JA1qNMRVzpJWxbQ2g2awNWhnSmeIfwtRL3yU1oGmhX-spjQ40ofPFLHsWyj8Delv9PBT2NlrNEHLQnaJ-PfNCpd9i_dHRx6Rd8fFtQIFU6Qa5Ki2il_Zos3OBWdRpXdMLOZmyFBF3Gaw3Dt4P06JX6bBY1r6OZTByyJVCpmnTtpEzXsEJEbsIcS2Rxcg5WL0ixWoFNkOuPFPTYZVsEQH3R3FlHtDhoxVsg5aqb_Pa290wVI7eemHwasSR4l7FJwLNy64lNVXTJLHx_eHwwSC9UjXC_Xo7_mDrn-UBvPmBByvV-TaEhfvdBAtSymvT3t_1rDhSKpq9XHL8ra5ajbOOKUdOYYFhv1Ddud1pWImEqYLFHmFa7zrMl885FaDlJUeXpRWu6EGj3eh_jhK36zqzldjAZvr2tZzeCC1qTj1zZpXPCgk1bSfIfQXlRXB19MnaBd7p8s_yJJ9jkbXQHSl361kNlpAVp-nYVxLm-6Mmf5G4TI7qQnGARmzV2oYJw2Ltq-aJwdEzLJG1sUW4eVg56i0WZSpbKqCHf_GFwCmteztxDabYCQMNBEuOKu8X4vuBvPiCAnZtjA6MoeIqpfP66RveaZ1tE0wBIcGduEmUPRopLoVetw74h5sNofC50Ye3aWG6QBX33ezHOkobJ453_UjEytJiuSxiSH3mtq2rLhkXbi2pFS-IIWnRDbDZVLlyubYVNqvS4Bd7uSGwiR0rT9WpQiiJy1nQa8Ja4wcap9nktNLy4uEM4hSp4n4lZxYp_34hzYlXKAFBsXFUaVz1grXKrS6jDviHw_0FMOmNNz_t9bq0GWtFJPPqQiOj9mMJPHiSOhrxgA68rS5GZddqFXtC1aVRE1BdNUWJjIFk0WoNQvm6t_ZwYxuJGYB9lcsjiV0i0OXLSdATWi4va6Zjaaxs9gJmwRASSCH2spGn9gEzTvlt9YckEVHdveiNlC1ykWqh1tv2PAOjGZ28YZnfl9ll1hQxL5Fgf4amB59q9wVcOA72lsUMjhzZfl79N37p93rBDQk7jE09xWG4Sdy95sky7X6__qRzqwWFRLWFz7td7apcZSsx9E8-vreP_k_9FNjqIg7VvGbAIcpC_Qf2YZe6SU0VDwy9-dGFvA0UXULBuhVe77qw4_PJUbwFTeMbCeG2hB3jDRhn5u6rb1pDTWxshl5q3ZC6iPGuMmXjmn0v0nG14f84LXWdeUAJGGH-LTrluuc2RHMPGcmMpe3Dr6nh8jBxW5moZyZWu1_eC43YEOrqRnWkHrQBusJ5NwJ5pwrBJeH_BElVIS1UkSx57vlaeQYvfhQ_d3Xp5IVB81Mpyd7MdQcVIBdOcvtzul9VqDh-9gb1yN7gnT4G4S-W7c9GPSnFi2jJ7bnFuH10zUp5MpWqR7ZMzy_hWUDtIW_L3dX-QIUnZWh7rla3p1pHhXgcYiKWrTjqGNXmhpkL9tl33lnN1bOM1SGdQQwN3Lla9eaN0lO-6HMvuUV0Aam7P6lZhlwxbx2oxx6Sd_dyZ838HC5erkVIDtg1QqbJ_6IJq9q1uT1LKIXp6Y08SWx9plFKrQ57_rAXh-WhDJVBTxOFXbKYGSeZeIdqztvbNl95xGRODgItRF4UeS6CjU82HV_SOeFFh-hBocV5xBn8SeJJlj2iS7ZY-1-ZKewN6T8o', '2024-12-13 15:34:28', 'https://www.kinopoisk.ru/film/466/'),
(7, 'Унесённые призраками', 'Тихиро с мамой и папой переезжает в новый дом. Заблудившись по дороге, они оказываются в странном пустынном городе, где их ждет великолепный пир. Родители с жадностью набрасываются на еду и к ужасу девочки превращаются в свиней, став пленниками злой колдуньи Юбабы. Теперь, оказавшись одна среди волшебных существ и загадочных видений, Тихиро должна придумать, как избавить своих родителей от чар коварной старухи.', 1, 1, 8.5, '2001-00-00', 'Япония', 'Аниме, Мультфильм, Фэнтези, Приключения, Семейный', 'https://kinopoisk-ru.clstorage.net/p1Yc61138/6f20087UZY1/m8gwayfnsK-wjIEEJe3v314uyNP969-_d1s07VOZmrSFXMwQXQ2dR4e1g_1Cs-TzWK9zmcqe2QKxJseMKdRDo06NpPqwYmcvIkxRESb57w2ZexzD7n9NLrAN8LvFCZa5CdZX3dWBVs8eKlIukzTzpQ7_dttczxpF9LabFniGWDDdibap5rn15T5WTI_mreASSexEHWho1_5mV_5nUJQbd4Ie3FpTwFfLUOpWKxoufCRDcD7QHIiQG7TyEN2gSp44WY71Lqc9cOC02gQIZqftWkhsD5djYdW4qJ00opqYG_BN2tzW3MNXDNDiVilcKvzuB_E2ntWBmtU89lyQbAZTtZZLMSalNb9mflSCjicvJljDKAwd46Df-C0c_Goalp83CVVeE5KIGg2SJ9ttXq18pUtxNtkdCtTdfHEaUuxD2_3bzDBipX7wZLYcwkVk56_RyKbAWq6pV7OinbxtmVeaMEQU1JwfhNwAnqyUapMqcmVM97ZSnEGQE3k_n1WmxNc8XscyLCg18yt1HInF6uqo085gy12oaZC0JZo_JxVbG_WDXZwW2MaZA11kUWKTpnqpAzwzEtcHFtd08x9QbctfdpfItiYpOPqrshGPAWYpZVEAJEXa76rVcy_Y8-2ZHNi8wBffG1yL3sYdaNzqn-LzI0S4O51cwVDUtDJVkyrO3X6aB7nrafD7Y_DRgQZtpmcawK8FEmWkG_GpEzvnkRdXfItf3NccxZrHGuwT5h6kt25Psv6bn83d3fj4V9Jmy595m0l7JSZ992u020MC6yksX0xgAdNs6NO_ZtA0LNIUWvQEXF4RXs7eAprqVy1d4r1vhf47mVUFlZ-7vd6b5ItU8xjG8ivmN_OqcdFCzCysoxkIY8OTZCcTNulUeuddUdNziduVE1ONFAxZ7d6uXq-w5ANwuJjUjxkYcbuWVyTDljVfQbatJzq-4zzbQg7jbegTjmZL2u5m2Hog3_qvm18YM4MWlZnVQJmM2K3TIpYr8eOBdXTZEw5YX_F3XtuqiZD5Gg797u0wtqR1lgICLOesX0DgRNToq1s-4l9zK1ZW2LJBUxZbHY5dANwhWiPYo3ntALkw3FsJmRr-fZnbKwqd-55H8ipotHcrvBYOB63sJl3BYQteqKmVPinU9azUXFHyg5pdF9UJ2gdV49zj0K34JYfwONsbzxuQPjgZUK0GkHvexXBib_p-b_DZScYmLS5QBSkMlSQmVXellHKk3BRdsI-cWdMWBl2DEepbppNtOKIJejkTU0HTVvxxXlspAxJwk8Hy7iVydW3xFcMH5Slg38yvRRqiKlo475V_bdZe1biNFtpbnImcwJJgF6GUL7fqB3VzmBVPVdTzvVWVocmeOVfEeq7gNPfq_1SLgm1p59sF58nWouPXO6pXsq5RUNnzzRpeUlqHmU8cJd2uH2u_aUy6-VJTiBXbO3NUlOoLlTEaDH5vYXf653-Vw0avYWqRh-fIVizuUnmlFPxtkp1V9AfYk5RQDxLP2Weaah3i8izJ9PNcX0OSXvk3kBsgx9o8WsB1JuYx-OD3VotGaudl0cvmSJZm4di27lEz4pzekbKFFJ5SkkydSFlglWCSZjWpzD93lBYOnNb2MVpS4kKcedZG_aqgMbrgtxQCgKcoK9wBJ8sVoiGcP6afeyyYldL0QlJa0JrGGcIYLZptW6Q45Yb4spnXT10csjqdXCvEUDxWSDrnbbx5bvHSBc8kZS0cjS0EXa5g1zOoFLOo3h6SPcvYURMYBJYFHigWYVMuuukIeDhTXUhSnHE9Up2oQ9V8FQs4bqL4ve89EkPH6uQmUMzkghIlbFR4qFM15hYR2fyFlpoWWAgWz9ErFO3b4zOkgDm5lV5JUdQx8FAdq0dUtltG-aduOfajdVNDjKoqpREMIAwVZuaeu6HTfuWYFBI-g5-TUVWIFcMRZBSuVeR9ZsW5t9qcCljT_jiRm2qO1XkWSHFsKDa1pb2UjM9up6RcRibAWKavXj4snH4unFdVvU_dl9BciJzPGSKdp9zi_KsEMLnR1A5b3zT3GlflCFy63gu7o6k5N6zwlsYIbyWsWcQuxZXm49ay7x9wr5yRHHrF35VWW0bXz53tnWAXY3wmxbmyVZZGXdY1MBnSKoGVsN_E8iEotT3iPNvLhKspI9jM4A8VqiBSuejcuOxT15H-glpSGRTLWUwfoxbokio9aU03_9LXjVSXuvHfmKMH2nrfC7wqLnXxZzzdwoXtaqQbxeHAXWevHf7hHfxskRsbt8UelFCXjRmDEGKfKhes-6lJ8fRb386VV3u6mpssS5c0koC65-b3fiv1mw2AouXrG4QoBRLvIds36ZNwL9KdFHwPm1KRGkgVx5lr2q-TZn3pwHb02h5BGBa6uFLTq48SdNiJ-exnfH8ivhSJDqyoopqPJojdZGAbNOEb9iPaGRW_R5Re0FQIUYsXYZonHOR47YE_8VbTDpMaOHJXk2pClfhbRzth4n2xKP7fjoXqb2TaDetMUGInErqn2j2lWZaa8ETdVhSbx5HL1KpU7xPqOGVOdv6b2o2ZEDp5HZNuCdMz0gw7ben8siC6U4XCLKQmEI6hD59jaBN37lp1KNKfmvBHGxQfXobYSJUrWakaIfThy3I5HRiLGxr5dtWR7MYTdhrEvGtruLDm_x4CwKXl4hiIbQrWqyRa9mcTM6wdX1i3AdMfltAIFo0eYRGvlOsybU79PJRTgV2c8L9a0C7O3HQdwDqlafx9qP6TD8LkKKsdB25FUiasXXQhEHglmxEZtI-S01SYQ1GHmSAZYtVssy3EtvyR0kITVH3wHZjpTxcwmkwxbmWweKp8l4eC4O9ok4BgCVws7lh7ZF115dXWVzsF19_T1IBVzJVv0ygXYXGpwTC2FBwFmhryst9YqgNVtBIBNWkgerpuPxzEBWbqYlUApQWY6iwcMG0cOqVdE9C3ydubURvP0MWWK5Kl3muyrU--e5PUi5OQdY', '2024-12-13 15:34:28', 'https://www.kinopoisk.ru/film/370/'),
(8, 'Догвилль', 'Юная Грейс, сбежав от банды гангстеров, находит спасение в маленьком городке Догвилль где-то в Скалистых горах. Местные жители – один прекраснее другого – готовы ее укрыть. А взамен им совсем ничего не надо, ну, разве что помочь по дому или присмотреть за детьми. Но постепенно милый Догвилль превращается для девушки в тюрьму.', 1, 1, 8, '2003-00-00', 'Дания, Нидерланды, Швеция, Германия, Великобритания, Франция, Финляндия, Норвегия, Италия', '\r\nТриллер, Драма, Детектив', 'https://kinopoisk-ru.clstorage.net/28k9uo403/a7b894Jz_4/VmXTdHp2mwxY0ZiKUO5EF3DMvvBtptFU52B-xEBGkl-hfTT91Hwv2cT1MnkZIYbYGM4BSANvKHN9SAMXLW0otBRllnMlZ9NQX4-AxgO3GEc5hOekeOiZAqN9bZkbGb1viU8dj_JDB_nolHQ5XjvUhUCOFEZZLiZkagxxKm5ne-x4aORWRmPHEH_O15J_73AQeLuh5U_a5X7-D0LYf2KXe4JGJ5baRyfb2ZZoNkZ354RMgydMfyUYB2ItRjM7X0HdVH3sYlFRwxds8eWhYOJaIkqGmv57y9JL_ihW-WJYjX2weyil7kkE9dGUdDlHc8-dYaAdfEcwDxh7Kn8tKnJYymhp6Xt-R9Aua_jAlmPQQzhiiLH-QcLFZfcnduxXX5BnqVwck-pVHMrzsHAIQ0_SrX6oCVpCMyYFUBZqOAlNVshHbOVCfn_-A2_X2oVXxGIKZJCRxErs7GDrHlLKXXmtdbt_NL_oWij65JNMPEt005V8jj15ZjQ0OV0AWhY6enrTbWnkWktp1BRQ1N6DUOpYGE6XmuJd2-V-wgNd20pog3mYRhyi-1k52uuOajhNfdaCf4QDfVsWOhNPOl4HJGJ823Zc71xcVsM4U-fitV_DRwFti7_seNjnfP8Ecv98eadUp0s1g9lXK_TzqlsKSFryq0SUDmd2LSMGQBpENi9OetpFbfZwcWTBFm7E-5x8zGQ7Zae1x0zF-nbFN0_ae0uRVqRaDIf1aA_L8bhWA2xl7J17iQxZdRkiPVEufQ0ofFb6TVffdk9yzBJN29mpSfJZHkmohPBVwcRY5xVy5W1Qr36tYzaq-Hghx-aZbiZNQe2PWospWF8-AyZcCVgaPkNo_2lLxV1lSPAWSsffg2nnUwhFm7TlUObfVt00Q8pJZo9Zjnw4istGB-3Wg00aTUf4ukylDGxfDiQLWQx8EhxBW_dDUchAQEnDC2rG1ZRZ2XEbXqqk41LL3mX2KWzVdmaoZb9KOLrfewbczJhuHXxs655YjApaWi8FOmoXeA0aW3vhVWHUQHtU2ytz8uOHctNwA2uYmdZj5PJj6SFQ-l1loF-uTBed1VMA8OupTjlLQfend6cjYlMbGgBgMUgtOExd7GJqyEdjb-w7c9b6tVnJcxt_oKLBddPGRfImUeJkfa95mVcwme93DMbUjHEhRHzYm0CYDkJmEhgFXRBJMilOftxFdNR-THPCGVjD3rVL8kwfSaOg_2Dg3UPEKETgWWyVWoJhPqrLZC_J8p90LWdY7IZnig9wRAopM1U-fxIFYX_2cWrlfnJg2SByzNOhcM9yNmehif983O5p3TR__15Ho3-FRzip9mks-Nm3Sxh7WteoaqY-UVweCANWAWARIUF7-lRQz0RmdfIWT-P8tFfFWhNwiZPFaNz6YMUiZMRHb7JchEcNqfJgP_3FsEcgflPQpGmkD3l4Dzk_VgBDNwllctJIXcJGZ1bfE1bhxL14yXMDQ6SH-XT5-0bCCkT4RnmpQqxLNLzkfzTa8qpGD2VR2Kp2rwFhcw0iAWEvXicjcGXwb0f3eEFf0jZz49ueRe1lI3q1hdFazNde6xd0zmlbkVG8djGIxFcp9vC-RixLVOaWRokQSncLAztqLVcnOlxd00FG9HZdQ8QoTODli1P1cBpgs4nie-P9QtAheMJoaoB0hncZqOlLBtHusWs2eGP-r16XMUNcETUNXihGOT5MctROYtF5bUjXDE7I87tC9HU5UKuf8Hrt32X8OWz9ZHy3VbFcBpb-XArWxKtXD2dy0bRpsQJEcT8cAX0weiE2YmTQSHXefWBv-yx708ekRONpHG2gofZa-sZQ4hd6wndzkUOuXg6xyV4D3PW_Sx9kVsmZS4MmfHYECix_KHwlBUJq2k1g6UBsbNICWvbPoV7WURZ_uKLwTf7ARfkpYOtgeJhSolg0tPdDDc3Ol3YqSHv-gGe4PmFeOCwNbQpJEghgXPBhZdBWTU70JH3L85Z_9nAbZ4C_7Vzb33XCGED9d2OaV7t5M6rRZh3oz4J1PXpE8ZVYjgxvdAUdIH4fTyQfXFH8WHXAcENE9C1s1sWVR8RZJEGks9ly-fx--gNz2XtLj0aefD28_EUDy8iqZQ19RvOnX4QwXWE-Bi50C0onNlJV6FJg8V9EQPcpWdDBg13STBd6hL__ScTkZMEnWN1oQJRzuHcUiupTJc_Eq3EeX37NpFu7F05qMgABfzt2BCJ-YMFCS85hZkD6DXHRx6Ro00cha6ic3GjN7lDfOWbXQn6kYIt8MbL-fTTT5KhKOn5N6plgpQNPdAQJLVkbSTQYYHP1dm7GY01r8RVr792UffppBkaTgtNI3N1_8A5z2mlAkXGrbCqR0Hkf2veJTiJYV9qgTZI1cEUaChtgE3gAHX1G2m1O5UB_Q8ATZM7EuELkWDRFhbjHVurYVfwDfsFqYZFCpE8Kl9tHHejsqGEkZEPFvWevFGpUJDQ8eh1bMwp5SdJTVO1cX2fxFkb054tG6nc5aoay4XLBz3neFULERlukR6FJC6j7Vxjw27BgK0RPxqFcozR4fA4sOWEDQz0Ha0bfb3zleHpv2zhXxt-AW_diMG2UlMFW8Ptl_jtRxndqkUGveB6_1Vs-xOOiSARLef2-V7McY1QNPg9cEn45A29Zw0pB4nB4StArU_Pwn0vIbwVcj4fAVOzVV9odWOVWfrpzvXgUuN5ZNObngHIiaHrzpESxAmVALioTegtPIgxDRvNSfuRwUnzkAG3V46J_yUM3YqC14nXH92DXDFzmdlmraIpNKJXQRhbX4rFaBkh617pmiTNhfQo4GVMcXTAlbWPVSGnWU39M5BhExP6EWdVuNH6svNl33dVL6xhQ-kZlg3GeZAeR5XYP0-muewJrTNuKdIkDa0olOCVwDWswL0ti-1NA819BSOQ4TO_slXTDZChruIr-dOD9evoYZMBkcaZJv2IapNR0IdzMnFEvZV7Yn0mwL19bNQAZcCM', '2024-12-13 15:34:28', 'https://www.kinopoisk.ru/film/7226/'),
(9, 'Аватар', 'Бывший морпех Джейк Салли прикован к инвалидному креслу. Несмотря на немощное тело, Джейк в душе по-прежнему остается воином. Он получает задание совершить путешествие в несколько световых лет к базе землян на планете Пандора, где корпорации добывают редкий минерал, имеющий огромное значение для выхода Земли из энергетического кризиса.', 1, 1, 8, '2009-00-00', '\r\nСША, Великобритания', 'Фантастика, Боевик, Драма, Приключения', 'https://kinopoisk-ru.clstorage.net/28k9uo403/a7b894Jz_4/VmXTdHp2mwxY0ZiKUO5EF3DMvvBtptFU52B-xEBGkl-hfTT91Hwv2cT1MnsQLI_eFs5QSFQ7e3t5GANGLWontBQ3nyQlPIdVCY-DwQK5F0Nt17KherGZAqN9bZkbGb1viU8dj_JDB_nolHQ5XjvUhUCOFEZZLiZkagxxKm5ne-x4aORWRmPHEH_O15J_73AQeLuh5U_a5X7-D0LYf2KXe4JGJ5baRyfb2ZZoNkZ354RMgydMfyUYB2ItRjM7X0HdVH3sYlFRwxds8eWhYOJaIkqGmv57y9JL_ihW-WJYjX2weyil7kkE9dGUdDlHc8-dYaAdfEcwDxh7Kn8tKnJYymhp6Xt-R9Aua_jAlmPQQzhiiLH-QcLFZfcnduxXX5BnqVwck-pVHMrzsHAIQ0_SrX6oCVpCMyYFUBZqOAlNVshHbOVCfn_-A2_X2oVXxGIKZJCRxErs7GDrHlLKXXmtdbt_NL_oWij65JNMPEt005V8jj15ZjQ0OV0AWhY6enrTbWnkWktp1BRQ1N6DUOpYGE6XmuJd2-V-wgNd20pog3mYRhyi-1k52uuOajhNfdaCf4QDfVsWOhNPOl4HJGJ823Zc71xcVsM4U-fitV_DRwFti7_seNjnfP8Ecv98eadUp0s1g9lXK_TzqlsKSFryq0SUDmd2LSMGQBpENi9OetpFbfZwcWTBFm7E-5x8zGQ7Zae1x0zF-nbFN0_ae0uRVqRaDIf1aA_L8bhWA2xl7J17iQxZdRkiPVEufQ0ofFb6TVffdk9yzBJN29mpSfJZHkmohPBVwcRY5xVy5W1Qr36tYzaq-Hghx-aZbiZNQe2PWospWF8-AyZcCVgaPkNo_2lLxV1lSPAWSsffg2nnUwhFm7TlUObfVt00Q8pJZo9Zjnw4istGB-3Wg00aTUf4ukylDGxfDiQLWQx8EhxBW_dDUchAQEnDC2rG1ZRZ2XEbXqqk41LL3mX2KWzVdmaoZb9KOLrfewbczJhuHXxs655YjApaWi8FOmoXeA0aW3vhVWHUQHtU2ytz8uOHctNwA2uYmdZj5PJj6SFQ-l1loF-uTBed1VMA8OupTjlLQfend6cjYlMbGgBgMUgtOExd7GJqyEdjb-w7c9b6tVnJcxt_oKLBddPGRfImUeJkfa95mVcwme93DMbUjHEhRHzYm0CYDkJmEhgFXRBJMilOftxFdNR-THPCGVjD3rVL8kwfSaOg_2Dg3UPEKETgWWyVWoJhPqrLZC_J8p90LWdY7IZnig9wRAopM1U-fxIFYX_2cWrlfnJg2SByzNOhcM9yNmehif983O5p3TR__15Ho3-FRzip9mks-Nm3Sxh7WteoaqY-UVweCANWAWARIUF7-lRQz0RmdfIWT-P8tFfFWhNwiZPFaNz6YMUiZMRHb7JchEcNqfJgP_3FsEcgflPQpGmkD3l4Dzk_VgBDNwllctJIXcJGZ1bfE1bhxL14yXMDQ6SH-XT5-0bCCkT4RnmpQqxLNLzkfzTa8qpGD2VR2Kp2rwFhcw0iAWEvXicjcGXwb0f3eEFf0jZz49ueRe1lI3q1hdFazNde6xd0zmlbkVG8djGIxFcp9vC-RixLVOaWRokQSncLAztqLVcnOlxd00FG9HZdQ8QoTODli1P1cBpgs4nie-P9QtAheMJoaoB0hncZqOlLBtHusWs2eGP-r16XMUNcETUNXihGOT5MctROYtF5bUjXDE7I87tC9HU5UKuf8Hrt32X8OWz9ZHy3VbFcBpb-XArWxKtXD2dy0bRpsQJEcT8cAX0weiE2YmTQSHXefWBv-yx708ekRONpHG2gofZa-sZQ4hd6wndzkUOuXg6xyV4D3PW_Sx9kVsmZS4MmfHYECix_KHwlBUJq2k1g6UBsbNICWvbPoV7WURZ_uKLwTf7ARfkpYOtgeJhSolg0tPdDDc3Ol3YqSHv-gGe4PmFeOCwNbQpJEghgXPBhZdBWTU70JH3L85Z_9nAbZ4C_7Vzb33XCGED9d2OaV7t5M6rRZh3oz4J1PXpE8ZVYjgxvdAUdIH4fTyQfXFH8WHXAcENE9C1s1sWVR8RZJEGks9ly-fx--gNz2XtLj0aefD28_EUDy8iqZQ19RvOnX4QwXWE-Bi50C0onNlJV6FJg8V9EQPcpWdDBg13STBd6hL__ScTkZMEnWN1oQJRzuHcUiupTJc_Eq3EeX37NpFu7F05qMgABfzt2BCJ-YMFCS85hZkD6DXHRx6Ro00cha6ic3GjN7lDfOWbXQn6kYIt8MbL-fTTT5KhKOn5N6plgpQNPdAQJLVkbSTQYYHP1dm7GY01r8RVr792UffppBkaTgtNI3N1_8A5z2mlAkXGrbCqR0Hkf2veJTiJYV9qgTZI1cEUaChtgE3gAHX1G2m1O5UB_Q8ATZM7EuELkWDRFhbjHVurYVfwDfsFqYZFCpE8Kl9tHHejsqGEkZEPFvWevFGpUJDQ8eh1bMwp5SdJTVO1cX2fxFkb054tG6nc5aoay4XLBz3neFULERlukR6FJC6j7Vxjw27BgK0RPxqFcozR4fA4sOWEDQz0Ha0bfb3zleHpv2zhXxt-AW_diMG2UlMFW8Ptl_jtRxndqkUGveB6_1Vs-xOOiSARLef2-V7McY1QNPg9cEn45A29Zw0pB4nB4StArU_Pwn0vIbwVcj4fAVOzVV9odWOVWfrpzvXgUuN5ZNObngHIiaHrzpESxAmVALioTegtPIgxDRvNSfuRwUnzkAG3V46J_yUM3YqC14nXH92DXDFzmdlmraIpNKJXQRhbX4rFaBkh617pmiTNhfQo4GVMcXTAlbWPVSGnWU39M5BhExP6EWdVuNH6svNl33dVL6xhQ-kZlg3GeZAeR5XYP0-muewJrTNuKdIkDa0olOCVwDWswL0ti-1NA819BSOQ4TO_slXTDZChruIr-dOD9evoYZMBkcaZJv2IapNR0IdzMnFEvZV7Yn0mwL19bNQAZcCM', '2024-12-13 15:34:28', 'https://www.kinopoisk.ru/film/251733/'),
(10, 'Старикам тут не место', 'Обычный работяга обнаруживает в пустыне гору трупов, набитый героином грузовик и соблазнительную сумму в два миллиона долларов наличными. Он решает взять деньги себе, и результатом становится волна насилия, которую не может остановить вся полиция Западного Техаса.', 1, 1, 7.8, '2007-00-00', 'США', 'Триллер, Драма, Криминал, Вестерн', 'https://kinopoisk-ru.clstorage.net/28k9uo403/a7b894Jz_4/VmXTdHp2mwxY0ZiKUO5EF3DMvvBtptFU52B-xEBGkl-hfTT91Hwv2cT1MnsQLI_eFs4CTQBofXt-SQMUKml2tBQ8wXElZ9QFD4-HwQC2QUE7hLOsLOiZAqN9bZkbGb1viU8dj_JDB_nolHQ5XjvUhUCOFEZZLiZkagxxKm5ne-x4aORWRmPHEH_O15J_73AQeLuh5U_a5X7-D0LYf2KXe4JGJ5baRyfb2ZZoNkZ354RMgydMfyUYB2ItRjM7X0HdVH3sYlFRwxds8eWhYOJaIkqGmv57y9JL_ihW-WJYjX2weyil7kkE9dGUdDlHc8-dYaAdfEcwDxh7Kn8tKnJYymhp6Xt-R9Aua_jAlmPQQzhiiLH-QcLFZfcnduxXX5BnqVwck-pVHMrzsHAIQ0_SrX6oCVpCMyYFUBZqOAlNVshHbOVCfn_-A2_X2oVXxGIKZJCRxErs7GDrHlLKXXmtdbt_NL_oWij65JNMPEt005V8jj15ZjQ0OV0AWhY6enrTbWnkWktp1BRQ1N6DUOpYGE6XmuJd2-V-wgNd20pog3mYRhyi-1k52uuOajhNfdaCf4QDfVsWOhNPOl4HJGJ823Zc71xcVsM4U-fitV_DRwFti7_seNjnfP8Ecv98eadUp0s1g9lXK_TzqlsKSFryq0SUDmd2LSMGQBpENi9OetpFbfZwcWTBFm7E-5x8zGQ7Zae1x0zF-nbFN0_ae0uRVqRaDIf1aA_L8bhWA2xl7J17iQxZdRkiPVEufQ0ofFb6TVffdk9yzBJN29mpSfJZHkmohPBVwcRY5xVy5W1Qr36tYzaq-Hghx-aZbiZNQe2PWospWF8-AyZcCVgaPkNo_2lLxV1lSPAWSsffg2nnUwhFm7TlUObfVt00Q8pJZo9Zjnw4istGB-3Wg00aTUf4ukylDGxfDiQLWQx8EhxBW_dDUchAQEnDC2rG1ZRZ2XEbXqqk41LL3mX2KWzVdmaoZb9KOLrfewbczJhuHXxs655YjApaWi8FOmoXeA0aW3vhVWHUQHtU2ytz8uOHctNwA2uYmdZj5PJj6SFQ-l1loF-uTBed1VMA8OupTjlLQfend6cjYlMbGgBgMUgtOExd7GJqyEdjb-w7c9b6tVnJcxt_oKLBddPGRfImUeJkfa95mVcwme93DMbUjHEhRHzYm0CYDkJmEhgFXRBJMilOftxFdNR-THPCGVjD3rVL8kwfSaOg_2Dg3UPEKETgWWyVWoJhPqrLZC_J8p90LWdY7IZnig9wRAopM1U-fxIFYX_2cWrlfnJg2SByzNOhcM9yNmehif983O5p3TR__15Ho3-FRzip9mks-Nm3Sxh7WteoaqY-UVweCANWAWARIUF7-lRQz0RmdfIWT-P8tFfFWhNwiZPFaNz6YMUiZMRHb7JchEcNqfJgP_3FsEcgflPQpGmkD3l4Dzk_VgBDNwllctJIXcJGZ1bfE1bhxL14yXMDQ6SH-XT5-0bCCkT4RnmpQqxLNLzkfzTa8qpGD2VR2Kp2rwFhcw0iAWEvXicjcGXwb0f3eEFf0jZz49ueRe1lI3q1hdFazNde6xd0zmlbkVG8djGIxFcp9vC-RixLVOaWRokQSncLAztqLVcnOlxd00FG9HZdQ8QoTODli1P1cBpgs4nie-P9QtAheMJoaoB0hncZqOlLBtHusWs2eGP-r16XMUNcETUNXihGOT5MctROYtF5bUjXDE7I87tC9HU5UKuf8Hrt32X8OWz9ZHy3VbFcBpb-XArWxKtXD2dy0bRpsQJEcT8cAX0weiE2YmTQSHXefWBv-yx708ekRONpHG2gofZa-sZQ4hd6wndzkUOuXg6xyV4D3PW_Sx9kVsmZS4MmfHYECix_KHwlBUJq2k1g6UBsbNICWvbPoV7WURZ_uKLwTf7ARfkpYOtgeJhSolg0tPdDDc3Ol3YqSHv-gGe4PmFeOCwNbQpJEghgXPBhZdBWTU70JH3L85Z_9nAbZ4C_7Vzb33XCGED9d2OaV7t5M6rRZh3oz4J1PXpE8ZVYjgxvdAUdIH4fTyQfXFH8WHXAcENE9C1s1sWVR8RZJEGks9ly-fx--gNz2XtLj0aefD28_EUDy8iqZQ19RvOnX4QwXWE-Bi50C0onNlJV6FJg8V9EQPcpWdDBg13STBd6hL__ScTkZMEnWN1oQJRzuHcUiupTJc_Eq3EeX37NpFu7F05qMgABfzt2BCJ-YMFCS85hZkD6DXHRx6Ro00cha6ic3GjN7lDfOWbXQn6kYIt8MbL-fTTT5KhKOn5N6plgpQNPdAQJLVkbSTQYYHP1dm7GY01r8RVr792UffppBkaTgtNI3N1_8A5z2mlAkXGrbCqR0Hkf2veJTiJYV9qgTZI1cEUaChtgE3gAHX1G2m1O5UB_Q8ATZM7EuELkWDRFhbjHVurYVfwDfsFqYZFCpE8Kl9tHHejsqGEkZEPFvWevFGpUJDQ8eh1bMwp5SdJTVO1cX2fxFkb054tG6nc5aoay4XLBz3neFULERlukR6FJC6j7Vxjw27BgK0RPxqFcozR4fA4sOWEDQz0Ha0bfb3zleHpv2zhXxt-AW_diMG2UlMFW8Ptl_jtRxndqkUGveB6_1Vs-xOOiSARLef2-V7McY1QNPg9cEn45A29Zw0pB4nB4StArU_Pwn0vIbwVcj4fAVOzVV9odWOVWfrpzvXgUuN5ZNObngHIiaHrzpESxAmVALioTegtPIgxDRvNSfuRwUnzkAG3V46J_yUM3YqC14nXH92DXDFzmdlmraIpNKJXQRhbX4rFaBkh617pmiTNhfQo4GVMcXTAlbWPVSGnWU39M5BhExP6EWdVuNH6svNl33dVL6xhQ-kZlg3GeZAeR5XYP0-muewJrTNuKdIkDa0olOCVwDWswL0ti-1NA819BSOQ4TO_slXTDZChruIr-dOD9evoYZMBkcaZJv2IapNR0IdzMnFEvZV7Yn0mwL19bNQAZcCM', '2024-12-13 15:34:28', 'https://www.kinopoisk.ru/film/195434/'),
(11, 'Вечное сияние чистого разума', 'Застенчивый и меланхоличный Джоэл живёт ничем не примечательной серой и унылой жизнью. Но однажды вместо привычного рабочего маршрута молодой человек вдруг садится на электричку в другом направлении и устремляется к морю. На песчаном берегу Джоэл замечает девушку с ярко-синими волосами. На обратном пути они знакомятся в вагоне электрички и парень понимает, что у них с Клементиной очень много общего, как будто он уже знает эту девушку. Совсем скоро Джоэл поймёт, что действительно был знаком с ней, более того - они были парой.', 1, 1, 8, '2004-00-00', 'США', 'Мелодрама, Фантастика, Драма', 'https://kinopoisk-ru.clstorage.net/28k9uo403/a7b894Jz_4/VmXTdHp2mwxY0ZiKUO5EF3DMvvBtptFU52B-xEBGkl-hfTT91Hwv2cT1N30ZJoncH85SSlRqfCkgHQMWdzgmtBQwlCUlPYYADo-Aw1ezERE71uWsLL2ZAqN9bZkbGb1viU8dj_JDB_nolHQ5XjvUhUCOFEZZLiZkagxxKm5ne-x4aORWRmPHEH_O15J_73AQeLuh5U_a5X7-D0LYf2KXe4JGJ5baRyfb2ZZoNkZ354RMgydMfyUYB2ItRjM7X0HdVH3sYlFRwxds8eWhYOJaIkqGmv57y9JL_ihW-WJYjX2weyil7kkE9dGUdDlHc8-dYaAdfEcwDxh7Kn8tKnJYymhp6Xt-R9Aua_jAlmPQQzhiiLH-QcLFZfcnduxXX5BnqVwck-pVHMrzsHAIQ0_SrX6oCVpCMyYFUBZqOAlNVshHbOVCfn_-A2_X2oVXxGIKZJCRxErs7GDrHlLKXXmtdbt_NL_oWij65JNMPEt005V8jj15ZjQ0OV0AWhY6enrTbWnkWktp1BRQ1N6DUOpYGE6XmuJd2-V-wgNd20pog3mYRhyi-1k52uuOajhNfdaCf4QDfVsWOhNPOl4HJGJ823Zc71xcVsM4U-fitV_DRwFti7_seNjnfP8Ecv98eadUp0s1g9lXK_TzqlsKSFryq0SUDmd2LSMGQBpENi9OetpFbfZwcWTBFm7E-5x8zGQ7Zae1x0zF-nbFN0_ae0uRVqRaDIf1aA_L8bhWA2xl7J17iQxZdRkiPVEufQ0ofFb6TVffdk9yzBJN29mpSfJZHkmohPBVwcRY5xVy5W1Qr36tYzaq-Hghx-aZbiZNQe2PWospWF8-AyZcCVgaPkNo_2lLxV1lSPAWSsffg2nnUwhFm7TlUObfVt00Q8pJZo9Zjnw4istGB-3Wg00aTUf4ukylDGxfDiQLWQx8EhxBW_dDUchAQEnDC2rG1ZRZ2XEbXqqk41LL3mX2KWzVdmaoZb9KOLrfewbczJhuHXxs655YjApaWi8FOmoXeA0aW3vhVWHUQHtU2ytz8uOHctNwA2uYmdZj5PJj6SFQ-l1loF-uTBed1VMA8OupTjlLQfend6cjYlMbGgBgMUgtOExd7GJqyEdjb-w7c9b6tVnJcxt_oKLBddPGRfImUeJkfa95mVcwme93DMbUjHEhRHzYm0CYDkJmEhgFXRBJMilOftxFdNR-THPCGVjD3rVL8kwfSaOg_2Dg3UPEKETgWWyVWoJhPqrLZC_J8p90LWdY7IZnig9wRAopM1U-fxIFYX_2cWrlfnJg2SByzNOhcM9yNmehif983O5p3TR__15Ho3-FRzip9mks-Nm3Sxh7WteoaqY-UVweCANWAWARIUF7-lRQz0RmdfIWT-P8tFfFWhNwiZPFaNz6YMUiZMRHb7JchEcNqfJgP_3FsEcgflPQpGmkD3l4Dzk_VgBDNwllctJIXcJGZ1bfE1bhxL14yXMDQ6SH-XT5-0bCCkT4RnmpQqxLNLzkfzTa8qpGD2VR2Kp2rwFhcw0iAWEvXicjcGXwb0f3eEFf0jZz49ueRe1lI3q1hdFazNde6xd0zmlbkVG8djGIxFcp9vC-RixLVOaWRokQSncLAztqLVcnOlxd00FG9HZdQ8QoTODli1P1cBpgs4nie-P9QtAheMJoaoB0hncZqOlLBtHusWs2eGP-r16XMUNcETUNXihGOT5MctROYtF5bUjXDE7I87tC9HU5UKuf8Hrt32X8OWz9ZHy3VbFcBpb-XArWxKtXD2dy0bRpsQJEcT8cAX0weiE2YmTQSHXefWBv-yx708ekRONpHG2gofZa-sZQ4hd6wndzkUOuXg6xyV4D3PW_Sx9kVsmZS4MmfHYECix_KHwlBUJq2k1g6UBsbNICWvbPoV7WURZ_uKLwTf7ARfkpYOtgeJhSolg0tPdDDc3Ol3YqSHv-gGe4PmFeOCwNbQpJEghgXPBhZdBWTU70JH3L85Z_9nAbZ4C_7Vzb33XCGED9d2OaV7t5M6rRZh3oz4J1PXpE8ZVYjgxvdAUdIH4fTyQfXFH8WHXAcENE9C1s1sWVR8RZJEGks9ly-fx--gNz2XtLj0aefD28_EUDy8iqZQ19RvOnX4QwXWE-Bi50C0onNlJV6FJg8V9EQPcpWdDBg13STBd6hL__ScTkZMEnWN1oQJRzuHcUiupTJc_Eq3EeX37NpFu7F05qMgABfzt2BCJ-YMFCS85hZkD6DXHRx6Ro00cha6ic3GjN7lDfOWbXQn6kYIt8MbL-fTTT5KhKOn5N6plgpQNPdAQJLVkbSTQYYHP1dm7GY01r8RVr792UffppBkaTgtNI3N1_8A5z2mlAkXGrbCqR0Hkf2veJTiJYV9qgTZI1cEUaChtgE3gAHX1G2m1O5UB_Q8ATZM7EuELkWDRFhbjHVurYVfwDfsFqYZFCpE8Kl9tHHejsqGEkZEPFvWevFGpUJDQ8eh1bMwp5SdJTVO1cX2fxFkb054tG6nc5aoay4XLBz3neFULERlukR6FJC6j7Vxjw27BgK0RPxqFcozR4fA4sOWEDQz0Ha0bfb3zleHpv2zhXxt-AW_diMG2UlMFW8Ptl_jtRxndqkUGveB6_1Vs-xOOiSARLef2-V7McY1QNPg9cEn45A29Zw0pB4nB4StArU_Pwn0vIbwVcj4fAVOzVV9odWOVWfrpzvXgUuN5ZNObngHIiaHrzpESxAmVALioTegtPIgxDRvNSfuRwUnzkAG3V46J_yUM3YqC14nXH92DXDFzmdlmraIpNKJXQRhbX4rFaBkh617pmiTNhfQo4GVMcXTAlbWPVSGnWU39M5BhExP6EWdVuNH6svNl33dVL6xhQ-kZlg3GeZAeR5XYP0-muewJrTNuKdIkDa0olOCVwDWswL0ti-1NA819BSOQ4TO_slXTDZChruIr-dOD9evoYZMBkcaZJv2IapNR0IdzMnFEvZV7Yn0mwL19bNQAZcCM', '2024-12-13 15:34:28', 'https://www.kinopoisk.ru/film/5492/'),
(12, 'Безумный Макс: Дорога ярости', 'Преследуемый призраками прошлого Макс уверен, что лучший способ выжить — скитаться в одиночестве. Но он попадает в плен и вынужденно присоединяется к бунтарям, бегущим через пустыню от тирании Несмертного Джо. Они забрали у него кое-что очень ценное, и разъярённый диктатор бросает все силы в погоню за мятежниками.', 1, 1, 7.8, '2015-00-00', 'Австралия, США', 'Боевик, Фантастика', 'https://kinopoisk-ru.clstorage.net/28k9uo403/a7b894Jz_4/VmXTdHp2mwxY0ZiKUO5EF3DMvvBtptFU52B-xEBGkl-hfTT91Hwv2cT1MngbLIzVHs5TG1I8fXt-TANBLWojtBQ9xSMlPNEFCY-HllXmRhc81uGkfbyZAqN9bZkbGb1viU8dj_JDB_nolHQ5XjvUhUCOFEZZLiZkagxxKm5ne-x4aORWRmPHEH_O15J_73AQeLuh5U_a5X7-D0LYf2KXe4JGJ5baRyfb2ZZoNkZ354RMgydMfyUYB2ItRjM7X0HdVH3sYlFRwxds8eWhYOJaIkqGmv57y9JL_ihW-WJYjX2weyil7kkE9dGUdDlHc8-dYaAdfEcwDxh7Kn8tKnJYymhp6Xt-R9Aua_jAlmPQQzhiiLH-QcLFZfcnduxXX5BnqVwck-pVHMrzsHAIQ0_SrX6oCVpCMyYFUBZqOAlNVshHbOVCfn_-A2_X2oVXxGIKZJCRxErs7GDrHlLKXXmtdbt_NL_oWij65JNMPEt005V8jj15ZjQ0OV0AWhY6enrTbWnkWktp1BRQ1N6DUOpYGE6XmuJd2-V-wgNd20pog3mYRhyi-1k52uuOajhNfdaCf4QDfVsWOhNPOl4HJGJ823Zc71xcVsM4U-fitV_DRwFti7_seNjnfP8Ecv98eadUp0s1g9lXK_TzqlsKSFryq0SUDmd2LSMGQBpENi9OetpFbfZwcWTBFm7E-5x8zGQ7Zae1x0zF-nbFN0_ae0uRVqRaDIf1aA_L8bhWA2xl7J17iQxZdRkiPVEufQ0ofFb6TVffdk9yzBJN29mpSfJZHkmohPBVwcRY5xVy5W1Qr36tYzaq-Hghx-aZbiZNQe2PWospWF8-AyZcCVgaPkNo_2lLxV1lSPAWSsffg2nnUwhFm7TlUObfVt00Q8pJZo9Zjnw4istGB-3Wg00aTUf4ukylDGxfDiQLWQx8EhxBW_dDUchAQEnDC2rG1ZRZ2XEbXqqk41LL3mX2KWzVdmaoZb9KOLrfewbczJhuHXxs655YjApaWi8FOmoXeA0aW3vhVWHUQHtU2ytz8uOHctNwA2uYmdZj5PJj6SFQ-l1loF-uTBed1VMA8OupTjlLQfend6cjYlMbGgBgMUgtOExd7GJqyEdjb-w7c9b6tVnJcxt_oKLBddPGRfImUeJkfa95mVcwme93DMbUjHEhRHzYm0CYDkJmEhgFXRBJMilOftxFdNR-THPCGVjD3rVL8kwfSaOg_2Dg3UPEKETgWWyVWoJhPqrLZC_J8p90LWdY7IZnig9wRAopM1U-fxIFYX_2cWrlfnJg2SByzNOhcM9yNmehif983O5p3TR__15Ho3-FRzip9mks-Nm3Sxh7WteoaqY-UVweCANWAWARIUF7-lRQz0RmdfIWT-P8tFfFWhNwiZPFaNz6YMUiZMRHb7JchEcNqfJgP_3FsEcgflPQpGmkD3l4Dzk_VgBDNwllctJIXcJGZ1bfE1bhxL14yXMDQ6SH-XT5-0bCCkT4RnmpQqxLNLzkfzTa8qpGD2VR2Kp2rwFhcw0iAWEvXicjcGXwb0f3eEFf0jZz49ueRe1lI3q1hdFazNde6xd0zmlbkVG8djGIxFcp9vC-RixLVOaWRokQSncLAztqLVcnOlxd00FG9HZdQ8QoTODli1P1cBpgs4nie-P9QtAheMJoaoB0hncZqOlLBtHusWs2eGP-r16XMUNcETUNXihGOT5MctROYtF5bUjXDE7I87tC9HU5UKuf8Hrt32X8OWz9ZHy3VbFcBpb-XArWxKtXD2dy0bRpsQJEcT8cAX0weiE2YmTQSHXefWBv-yx708ekRONpHG2gofZa-sZQ4hd6wndzkUOuXg6xyV4D3PW_Sx9kVsmZS4MmfHYECix_KHwlBUJq2k1g6UBsbNICWvbPoV7WURZ_uKLwTf7ARfkpYOtgeJhSolg0tPdDDc3Ol3YqSHv-gGe4PmFeOCwNbQpJEghgXPBhZdBWTU70JH3L85Z_9nAbZ4C_7Vzb33XCGED9d2OaV7t5M6rRZh3oz4J1PXpE8ZVYjgxvdAUdIH4fTyQfXFH8WHXAcENE9C1s1sWVR8RZJEGks9ly-fx--gNz2XtLj0aefD28_EUDy8iqZQ19RvOnX4QwXWE-Bi50C0onNlJV6FJg8V9EQPcpWdDBg13STBd6hL__ScTkZMEnWN1oQJRzuHcUiupTJc_Eq3EeX37NpFu7F05qMgABfzt2BCJ-YMFCS85hZkD6DXHRx6Ro00cha6ic3GjN7lDfOWbXQn6kYIt8MbL-fTTT5KhKOn5N6plgpQNPdAQJLVkbSTQYYHP1dm7GY01r8RVr792UffppBkaTgtNI3N1_8A5z2mlAkXGrbCqR0Hkf2veJTiJYV9qgTZI1cEUaChtgE3gAHX1G2m1O5UB_Q8ATZM7EuELkWDRFhbjHVurYVfwDfsFqYZFCpE8Kl9tHHejsqGEkZEPFvWevFGpUJDQ8eh1bMwp5SdJTVO1cX2fxFkb054tG6nc5aoay4XLBz3neFULERlukR6FJC6j7Vxjw27BgK0RPxqFcozR4fA4sOWEDQz0Ha0bfb3zleHpv2zhXxt-AW_diMG2UlMFW8Ptl_jtRxndqkUGveB6_1Vs-xOOiSARLef2-V7McY1QNPg9cEn45A29Zw0pB4nB4StArU_Pwn0vIbwVcj4fAVOzVV9odWOVWfrpzvXgUuN5ZNObngHIiaHrzpESxAmVALioTegtPIgxDRvNSfuRwUnzkAG3V46J_yUM3YqC14nXH92DXDFzmdlmraIpNKJXQRhbX4rFaBkh617pmiTNhfQo4GVMcXTAlbWPVSGnWU39M5BhExP6EWdVuNH6svNl33dVL6xhQ-kZlg3GeZAeR5XYP0-muewJrTNuKdIkDa0olOCVwDWswL0ti-1NA819BSOQ4TO_slXTDZChruIr-dOD9evoYZMBkcaZJv2IapNR0IdzMnFEvZV7Yn0mwL19bNQAZcCM', '2024-12-13 15:34:28', 'https://www.kinopoisk.ru/film/453406/'),
(13, 'Начало', 'Кобб – талантливый вор, лучший из лучших в опасном искусстве извлечения: он крадет ценные секреты из глубин подсознания во время сна, когда человеческий разум наиболее уязвим. Редкие способности Кобба сделали его ценным игроком в привычном к предательству мире промышленного шпионажа, но они же превратили его в извечного беглеца и лишили всего, что он когда-либо любил.', 1, 1, 8.7, '2010-00-00', 'США, Великобритания', '\r\nФантастика, Боевик, Триллер, Драма, Детектив', 'https://kinopoisk-ru.clstorage.net/28k9uo403/a7b894Jz_4/VmXTdHp2mwxY0ZiKUO5EF3DMvvBtptFU52B-xEBGkl-hfTT91Hwv2cT1MngbLIzVHs5cSFJkLHspQAMRKj8ktBQwwSUlZ9QEX4-GxQO5F0s_1uimfb6ZAqN9bZkbGb1viU8dj_JDB_nolHQ5XjvUhUCOFEZZLiZkagxxKm5ne-x4aORWRmPHEH_O15J_73AQeLuh5U_a5X7-D0LYf2KXe4JGJ5baRyfb2ZZoNkZ354RMgydMfyUYB2ItRjM7X0HdVH3sYlFRwxds8eWhYOJaIkqGmv57y9JL_ihW-WJYjX2weyil7kkE9dGUdDlHc8-dYaAdfEcwDxh7Kn8tKnJYymhp6Xt-R9Aua_jAlmPQQzhiiLH-QcLFZfcnduxXX5BnqVwck-pVHMrzsHAIQ0_SrX6oCVpCMyYFUBZqOAlNVshHbOVCfn_-A2_X2oVXxGIKZJCRxErs7GDrHlLKXXmtdbt_NL_oWij65JNMPEt005V8jj15ZjQ0OV0AWhY6enrTbWnkWktp1BRQ1N6DUOpYGE6XmuJd2-V-wgNd20pog3mYRhyi-1k52uuOajhNfdaCf4QDfVsWOhNPOl4HJGJ823Zc71xcVsM4U-fitV_DRwFti7_seNjnfP8Ecv98eadUp0s1g9lXK_TzqlsKSFryq0SUDmd2LSMGQBpENi9OetpFbfZwcWTBFm7E-5x8zGQ7Zae1x0zF-nbFN0_ae0uRVqRaDIf1aA_L8bhWA2xl7J17iQxZdRkiPVEufQ0ofFb6TVffdk9yzBJN29mpSfJZHkmohPBVwcRY5xVy5W1Qr36tYzaq-Hghx-aZbiZNQe2PWospWF8-AyZcCVgaPkNo_2lLxV1lSPAWSsffg2nnUwhFm7TlUObfVt00Q8pJZo9Zjnw4istGB-3Wg00aTUf4ukylDGxfDiQLWQx8EhxBW_dDUchAQEnDC2rG1ZRZ2XEbXqqk41LL3mX2KWzVdmaoZb9KOLrfewbczJhuHXxs655YjApaWi8FOmoXeA0aW3vhVWHUQHtU2ytz8uOHctNwA2uYmdZj5PJj6SFQ-l1loF-uTBed1VMA8OupTjlLQfend6cjYlMbGgBgMUgtOExd7GJqyEdjb-w7c9b6tVnJcxt_oKLBddPGRfImUeJkfa95mVcwme93DMbUjHEhRHzYm0CYDkJmEhgFXRBJMilOftxFdNR-THPCGVjD3rVL8kwfSaOg_2Dg3UPEKETgWWyVWoJhPqrLZC_J8p90LWdY7IZnig9wRAopM1U-fxIFYX_2cWrlfnJg2SByzNOhcM9yNmehif983O5p3TR__15Ho3-FRzip9mks-Nm3Sxh7WteoaqY-UVweCANWAWARIUF7-lRQz0RmdfIWT-P8tFfFWhNwiZPFaNz6YMUiZMRHb7JchEcNqfJgP_3FsEcgflPQpGmkD3l4Dzk_VgBDNwllctJIXcJGZ1bfE1bhxL14yXMDQ6SH-XT5-0bCCkT4RnmpQqxLNLzkfzTa8qpGD2VR2Kp2rwFhcw0iAWEvXicjcGXwb0f3eEFf0jZz49ueRe1lI3q1hdFazNde6xd0zmlbkVG8djGIxFcp9vC-RixLVOaWRokQSncLAztqLVcnOlxd00FG9HZdQ8QoTODli1P1cBpgs4nie-P9QtAheMJoaoB0hncZqOlLBtHusWs2eGP-r16XMUNcETUNXihGOT5MctROYtF5bUjXDE7I87tC9HU5UKuf8Hrt32X8OWz9ZHy3VbFcBpb-XArWxKtXD2dy0bRpsQJEcT8cAX0weiE2YmTQSHXefWBv-yx708ekRONpHG2gofZa-sZQ4hd6wndzkUOuXg6xyV4D3PW_Sx9kVsmZS4MmfHYECix_KHwlBUJq2k1g6UBsbNICWvbPoV7WURZ_uKLwTf7ARfkpYOtgeJhSolg0tPdDDc3Ol3YqSHv-gGe4PmFeOCwNbQpJEghgXPBhZdBWTU70JH3L85Z_9nAbZ4C_7Vzb33XCGED9d2OaV7t5M6rRZh3oz4J1PXpE8ZVYjgxvdAUdIH4fTyQfXFH8WHXAcENE9C1s1sWVR8RZJEGks9ly-fx--gNz2XtLj0aefD28_EUDy8iqZQ19RvOnX4QwXWE-Bi50C0onNlJV6FJg8V9EQPcpWdDBg13STBd6hL__ScTkZMEnWN1oQJRzuHcUiupTJc_Eq3EeX37NpFu7F05qMgABfzt2BCJ-YMFCS85hZkD6DXHRx6Ro00cha6ic3GjN7lDfOWbXQn6kYIt8MbL-fTTT5KhKOn5N6plgpQNPdAQJLVkbSTQYYHP1dm7GY01r8RVr792UffppBkaTgtNI3N1_8A5z2mlAkXGrbCqR0Hkf2veJTiJYV9qgTZI1cEUaChtgE3gAHX1G2m1O5UB_Q8ATZM7EuELkWDRFhbjHVurYVfwDfsFqYZFCpE8Kl9tHHejsqGEkZEPFvWevFGpUJDQ8eh1bMwp5SdJTVO1cX2fxFkb054tG6nc5aoay4XLBz3neFULERlukR6FJC6j7Vxjw27BgK0RPxqFcozR4fA4sOWEDQz0Ha0bfb3zleHpv2zhXxt-AW_diMG2UlMFW8Ptl_jtRxndqkUGveB6_1Vs-xOOiSARLef2-V7McY1QNPg9cEn45A29Zw0pB4nB4StArU_Pwn0vIbwVcj4fAVOzVV9odWOVWfrpzvXgUuN5ZNObngHIiaHrzpESxAmVALioTegtPIgxDRvNSfuRwUnzkAG3V46J_yUM3YqC14nXH92DXDFzmdlmraIpNKJXQRhbX4rFaBkh617pmiTNhfQo4GVMcXTAlbWPVSGnWU39M5BhExP6EWdVuNH6svNl33dVL6xhQ-kZlg3GeZAeR5XYP0-muewJrTNuKdIkDa0olOCVwDWswL0ti-1NA819BSOQ4TO_slXTDZChruIr-dOD9evoYZMBkcaZJv2IapNR0IdzMnFEvZV7Yn0mwL19bNQAZcCM', '2024-12-13 15:34:29', 'https://www.kinopoisk.ru/film/447301/'),
(14, 'Однажды в… Голливуде', '1969 год, золотой век Голливуда уже закончился. Известный актёр Рик Далтон и его дублер Клифф Бут пытаются найти свое место в стремительно меняющемся мире киноиндустрии.', 1, 1, 7.7, '2019-00-00', 'США, Великобритания, Китай', 'Драма, Ккомедия', 'https://kinopoisk-ru.clstorage.net/28k9uo403/a7b894Jz_4/VmXTdHp2mwxY0ZiKUO5EF3DMvvBtptFU52B-xEBGkl-hfTT91Hwv2cT1MnsQLI_eFs5TGQVlfSl-TANGfDAntBQ2wyMlPdRWCo-EkAaxFRc6hOakLruZAqN9bZkbGb1viU8dj_JDB_nolHQ5XjvUhUCOFEZZLiZkagxxKm5ne-x4aORWRmPHEH_O15J_73AQeLuh5U_a5X7-D0LYf2KXe4JGJ5baRyfb2ZZoNkZ354RMgydMfyUYB2ItRjM7X0HdVH3sYlFRwxds8eWhYOJaIkqGmv57y9JL_ihW-WJYjX2weyil7kkE9dGUdDlHc8-dYaAdfEcwDxh7Kn8tKnJYymhp6Xt-R9Aua_jAlmPQQzhiiLH-QcLFZfcnduxXX5BnqVwck-pVHMrzsHAIQ0_SrX6oCVpCMyYFUBZqOAlNVshHbOVCfn_-A2_X2oVXxGIKZJCRxErs7GDrHlLKXXmtdbt_NL_oWij65JNMPEt005V8jj15ZjQ0OV0AWhY6enrTbWnkWktp1BRQ1N6DUOpYGE6XmuJd2-V-wgNd20pog3mYRhyi-1k52uuOajhNfdaCf4QDfVsWOhNPOl4HJGJ823Zc71xcVsM4U-fitV_DRwFti7_seNjnfP8Ecv98eadUp0s1g9lXK_TzqlsKSFryq0SUDmd2LSMGQBpENi9OetpFbfZwcWTBFm7E-5x8zGQ7Zae1x0zF-nbFN0_ae0uRVqRaDIf1aA_L8bhWA2xl7J17iQxZdRkiPVEufQ0ofFb6TVffdk9yzBJN29mpSfJZHkmohPBVwcRY5xVy5W1Qr36tYzaq-Hghx-aZbiZNQe2PWospWF8-AyZcCVgaPkNo_2lLxV1lSPAWSsffg2nnUwhFm7TlUObfVt00Q8pJZo9Zjnw4istGB-3Wg00aTUf4ukylDGxfDiQLWQx8EhxBW_dDUchAQEnDC2rG1ZRZ2XEbXqqk41LL3mX2KWzVdmaoZb9KOLrfewbczJhuHXxs655YjApaWi8FOmoXeA0aW3vhVWHUQHtU2ytz8uOHctNwA2uYmdZj5PJj6SFQ-l1loF-uTBed1VMA8OupTjlLQfend6cjYlMbGgBgMUgtOExd7GJqyEdjb-w7c9b6tVnJcxt_oKLBddPGRfImUeJkfa95mVcwme93DMbUjHEhRHzYm0CYDkJmEhgFXRBJMilOftxFdNR-THPCGVjD3rVL8kwfSaOg_2Dg3UPEKETgWWyVWoJhPqrLZC_J8p90LWdY7IZnig9wRAopM1U-fxIFYX_2cWrlfnJg2SByzNOhcM9yNmehif983O5p3TR__15Ho3-FRzip9mks-Nm3Sxh7WteoaqY-UVweCANWAWARIUF7-lRQz0RmdfIWT-P8tFfFWhNwiZPFaNz6YMUiZMRHb7JchEcNqfJgP_3FsEcgflPQpGmkD3l4Dzk_VgBDNwllctJIXcJGZ1bfE1bhxL14yXMDQ6SH-XT5-0bCCkT4RnmpQqxLNLzkfzTa8qpGD2VR2Kp2rwFhcw0iAWEvXicjcGXwb0f3eEFf0jZz49ueRe1lI3q1hdFazNde6xd0zmlbkVG8djGIxFcp9vC-RixLVOaWRokQSncLAztqLVcnOlxd00FG9HZdQ8QoTODli1P1cBpgs4nie-P9QtAheMJoaoB0hncZqOlLBtHusWs2eGP-r16XMUNcETUNXihGOT5MctROYtF5bUjXDE7I87tC9HU5UKuf8Hrt32X8OWz9ZHy3VbFcBpb-XArWxKtXD2dy0bRpsQJEcT8cAX0weiE2YmTQSHXefWBv-yx708ekRONpHG2gofZa-sZQ4hd6wndzkUOuXg6xyV4D3PW_Sx9kVsmZS4MmfHYECix_KHwlBUJq2k1g6UBsbNICWvbPoV7WURZ_uKLwTf7ARfkpYOtgeJhSolg0tPdDDc3Ol3YqSHv-gGe4PmFeOCwNbQpJEghgXPBhZdBWTU70JH3L85Z_9nAbZ4C_7Vzb33XCGED9d2OaV7t5M6rRZh3oz4J1PXpE8ZVYjgxvdAUdIH4fTyQfXFH8WHXAcENE9C1s1sWVR8RZJEGks9ly-fx--gNz2XtLj0aefD28_EUDy8iqZQ19RvOnX4QwXWE-Bi50C0onNlJV6FJg8V9EQPcpWdDBg13STBd6hL__ScTkZMEnWN1oQJRzuHcUiupTJc_Eq3EeX37NpFu7F05qMgABfzt2BCJ-YMFCS85hZkD6DXHRx6Ro00cha6ic3GjN7lDfOWbXQn6kYIt8MbL-fTTT5KhKOn5N6plgpQNPdAQJLVkbSTQYYHP1dm7GY01r8RVr792UffppBkaTgtNI3N1_8A5z2mlAkXGrbCqR0Hkf2veJTiJYV9qgTZI1cEUaChtgE3gAHX1G2m1O5UB_Q8ATZM7EuELkWDRFhbjHVurYVfwDfsFqYZFCpE8Kl9tHHejsqGEkZEPFvWevFGpUJDQ8eh1bMwp5SdJTVO1cX2fxFkb054tG6nc5aoay4XLBz3neFULERlukR6FJC6j7Vxjw27BgK0RPxqFcozR4fA4sOWEDQz0Ha0bfb3zleHpv2zhXxt-AW_diMG2UlMFW8Ptl_jtRxndqkUGveB6_1Vs-xOOiSARLef2-V7McY1QNPg9cEn45A29Zw0pB4nB4StArU_Pwn0vIbwVcj4fAVOzVV9odWOVWfrpzvXgUuN5ZNObngHIiaHrzpESxAmVALioTegtPIgxDRvNSfuRwUnzkAG3V46J_yUM3YqC14nXH92DXDFzmdlmraIpNKJXQRhbX4rFaBkh617pmiTNhfQo4GVMcXTAlbWPVSGnWU39M5BhExP6EWdVuNH6svNl33dVL6xhQ-kZlg3GeZAeR5XYP0-muewJrTNuKdIkDa0olOCVwDWswL0ti-1NA819BSOQ4TO_slXTDZChruIr-dOD9evoYZMBkcaZJv2IapNR0IdzMnFEvZV7Yn0mwL19bNQAZcCM', '2024-12-13 15:34:29', 'https://www.kinopoisk.ru/film/1047883/');

-- --------------------------------------------------------

--
-- Структура таблицы `Gender`
--
-- Создание: Окт 29 2024 г., 12:37
--

DROP TABLE IF EXISTS `Gender`;
CREATE TABLE `Gender` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Gender`
--

INSERT INTO `Gender` (`ID`, `Name`) VALUES
(1, 'Мужской'),
(2, 'Женский');

-- --------------------------------------------------------

--
-- Структура таблицы `Platform`
--
-- Создание: Окт 28 2024 г., 15:07
--

DROP TABLE IF EXISTS `Platform`;
CREATE TABLE `Platform` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Platform`
--

INSERT INTO `Platform` (`ID`, `Name`) VALUES
(1, 'Сайт'),
(2, 'Telegram-бот MR'),
(3, 'Telegram-бот поддержка');

-- --------------------------------------------------------

--
-- Структура таблицы `Request`
--
-- Создание: Окт 29 2024 г., 12:41
--

DROP TABLE IF EXISTS `Request`;
CREATE TABLE `Request` (
  `ID` int(11) NOT NULL,
  `ID_user` int(11) DEFAULT NULL,
  `Reason` text,
  `Details` text,
  `ID_status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Role`
--
-- Создание: Сен 19 2024 г., 17:24
--

DROP TABLE IF EXISTS `Role`;
CREATE TABLE `Role` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Role`
--

INSERT INTO `Role` (`ID`, `Name`) VALUES
(1, 'Пользователь'),
(2, 'Модератор'),
(3, 'Тех. поддержка'),
(4, 'Администратор');

-- --------------------------------------------------------

--
-- Структура таблицы `Status`
--
-- Создание: Окт 28 2024 г., 14:31
--

DROP TABLE IF EXISTS `Status`;
CREATE TABLE `Status` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Status`
--

INSERT INTO `Status` (`ID`, `Name`) VALUES
(1, 'Новое'),
(2, 'Рассматривается'),
(3, 'Подтверждено'),
(4, 'Отклонено');

-- --------------------------------------------------------

--
-- Структура таблицы `User`
--
-- Создание: Дек 25 2024 г., 08:04
-- Последнее обновление: Дек 25 2024 г., 08:09
--

DROP TABLE IF EXISTS `User`;
CREATE TABLE `User` (
  `ID` int(11) NOT NULL,
  `Username` varchar(255) DEFAULT NULL,
  `FIO` varchar(255) DEFAULT NULL,
  `ID_Gender` int(11) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Password` varchar(1024) DEFAULT NULL,
  `Telegram_ID` bigint(20) DEFAULT NULL,
  `ID_role` int(11) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `User`
--

INSERT INTO `User` (`ID`, `Username`, `FIO`, `ID_Gender`, `Age`, `Password`, `Telegram_ID`, `ID_role`, `Email`) VALUES
(2, 'Rin', 'Трифонова Марина Павловна', 2, 21, '76cf3256f6877873459f8c8f9d2ea460', 1072951964, 4, NULL),
(3, 'Ari', 'Бузанова Арина Владимировна', 2, 18, '1e2078b18f1bf1e9d424a1087c71efcb2216e05bcd37c78cfd30471f', 1234292696, 4, NULL),
(4, 'Konaca', 'Ямковой Владислав Егорович', 1, 18, 'b75539e49148afb5f09336321b1beb9cfd67b11a26d911dc734e7c85', 1667713887, 4, NULL),
(14, 'Valina', 'Тестовый акк', 2, 28, '9a4c7d17ea07e65ee74205023de343e974b3a3ed7cdb2fc74f6d6285', 5400660310, 1, 'ad@ad.ru');

-- --------------------------------------------------------

--
-- Структура таблицы `Work`
--
-- Создание: Окт 28 2024 г., 15:08
--

DROP TABLE IF EXISTS `Work`;
CREATE TABLE `Work` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Work`
--

INSERT INTO `Work` (`ID`, `Name`) VALUES
(1, 'Новое'),
(2, 'На рассмотрении'),
(3, 'Идёт работа'),
(4, 'Завершено');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Active`
--
ALTER TABLE `Active`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_user` (`ID_user`),
  ADD KEY `ID_film` (`ID_film`);

--
-- Индексы таблицы `Error`
--
ALTER TABLE `Error`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Support` (`ID_Support`),
  ADD KEY `ID_Platform` (`ID_Platform`),
  ADD KEY `ID_Work` (`ID_Work`),
  ADD KEY `ID_Dev` (`ID_Dev`);

--
-- Индексы таблицы `Feedback`
--
ALTER TABLE `Feedback`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_user` (`ID_user`);

--
-- Индексы таблицы `Films`
--
ALTER TABLE `Films`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `Gender`
--
ALTER TABLE `Gender`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `Platform`
--
ALTER TABLE `Platform`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `Request`
--
ALTER TABLE `Request`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Username` (`ID_user`),
  ADD KEY `ID_status` (`ID_status`);

--
-- Индексы таблицы `Role`
--
ALTER TABLE `Role`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `Status`
--
ALTER TABLE `Status`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD UNIQUE KEY `Telegram_ID` (`Telegram_ID`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `ID_role` (`ID_role`),
  ADD KEY `ID_Gender` (`ID_Gender`);

--
-- Индексы таблицы `Work`
--
ALTER TABLE `Work`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Active`
--
ALTER TABLE `Active`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `Error`
--
ALTER TABLE `Error`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Feedback`
--
ALTER TABLE `Feedback`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Films`
--
ALTER TABLE `Films`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `Gender`
--
ALTER TABLE `Gender`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `Platform`
--
ALTER TABLE `Platform`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `Request`
--
ALTER TABLE `Request`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Role`
--
ALTER TABLE `Role`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `Status`
--
ALTER TABLE `Status`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `User`
--
ALTER TABLE `User`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `Work`
--
ALTER TABLE `Work`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Active`
--
ALTER TABLE `Active`
  ADD CONSTRAINT `Active_ibfk_1` FOREIGN KEY (`ID_film`) REFERENCES `Films` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Active_ibfk_2` FOREIGN KEY (`ID_user`) REFERENCES `User` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Error`
--
ALTER TABLE `Error`
  ADD CONSTRAINT `Error_ibfk_1` FOREIGN KEY (`ID_Work`) REFERENCES `Work` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Error_ibfk_2` FOREIGN KEY (`ID_Platform`) REFERENCES `Platform` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Error_ibfk_3` FOREIGN KEY (`ID_Support`) REFERENCES `User` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Error_ibfk_4` FOREIGN KEY (`ID_Dev`) REFERENCES `User` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Feedback`
--
ALTER TABLE `Feedback`
  ADD CONSTRAINT `Feedback_ibfk_1` FOREIGN KEY (`ID_user`) REFERENCES `User` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Request`
--
ALTER TABLE `Request`
  ADD CONSTRAINT `Request_ibfk_2` FOREIGN KEY (`ID_status`) REFERENCES `Status` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Request_ibfk_3` FOREIGN KEY (`ID_user`) REFERENCES `User` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `User`
--
ALTER TABLE `User`
  ADD CONSTRAINT `User_ibfk_1` FOREIGN KEY (`ID_role`) REFERENCES `Role` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `User_ibfk_2` FOREIGN KEY (`ID_Gender`) REFERENCES `Gender` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
