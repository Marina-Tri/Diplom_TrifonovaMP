<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "Films".
 *
 * @property int $ID
 * @property string|null $Name
 * @property string|null $Description
 * @property int|null $Season
 * @property int|null $Series
 * @property float|null $Evaluation_Average
 * @property string|null $Release_Year
 * @property string|null $Country
 * @property string|null $Genre
 * @property string|null $Age_Rating
 * @property string|null $URL_Image
 * @property string|null $Date_at
 * @property string|null $Web_Url
 *
 * @property Active[] $actives
 */
class Films extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'Films';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['Description', 'Genre', 'URL_Image', 'Web_Url'], 'string'],
            [['Season', 'Series'], 'integer'],
            [['Evaluation_Average'], 'number'],
            [['Release_Year', 'Date_at'], 'safe'],
            [['Name', 'Country'], 'string', 'max' => 255],
            [['Age_Rating'], 'string', 'max' => 4],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'ID' => 'ID',
            'Name' => 'Название',
            'Description' => 'Описание',
            'Season' => 'Сезон',
            'Series' => 'Серии',
            'Evaluation_Average' => 'Оценка',
            'Release_Year' => 'Год выпуска',
            'Country' => 'Страна',
            'Genre' => 'Жанр',
            'Age_Rating' => 'Возрастной рейтинг',
            'URL_Image' => 'Url изображения',
            'Date_at' => 'Дата добавление',
            'Web_Url' => 'Web Url',
        ];
    }

    /**
     * Gets query for [[Actives]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getActive()
    {
        return $this->hasMany(Active::class, ['ID_film' => 'ID']);
    }
}
