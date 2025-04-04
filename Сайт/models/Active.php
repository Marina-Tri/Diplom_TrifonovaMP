<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "Active".
 *
 * @property int $ID
 * @property int|null $ID_user
 * @property int|null $ID_film
 * @property int|null $Evaluation
 * @property int|null $Like_
 *
 * @property Films $film
 * @property User $user
 */
class Active extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'Active';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['ID_film'], 'required'],
            [['ID_user', 'ID_film', 'Evaluation', 'Like_'], 'integer'],
            [['ID_film'], 'exist', 'skipOnError' => true, 'targetClass' => Films::class, 'targetAttribute' => ['ID_film' => 'ID']],
            [['ID_user'], 'exist', 'skipOnError' => true, 'targetClass' => User::class, 'targetAttribute' => ['ID_user' => 'ID']],
            [['ID_user'], 'default', 'value' => Yii::$app->User->identity->ID],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'ID' => 'ID',
            'ID_user' => 'Пользователь',
            'ID_film' => 'Фильм или сериал',
            'Evaluation' => 'Оценка',
            'Like_' => 'Лайк',
        ];
    }

    /**
     * Gets query for [[Film]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getFilms()
    {
        return $this->hasOne(Films::class, ['ID' => 'ID_film']);
    }

    /**
     * Gets query for [[User]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::class, ['ID' => 'ID_user']);
    }
}
