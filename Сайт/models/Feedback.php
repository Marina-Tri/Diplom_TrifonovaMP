<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "Feedback".
 *
 * @property int $ID
 * @property int|null $ID_user
 * @property string|null $Message
 * @property int|null $Evaluation
 *
 * @property User $user
 */
class Feedback extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'Feedback';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['ID_user', 'Evaluation'], 'integer'],
            [['Message'], 'string'],
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
            'Message' => 'Отзыв',
            'Evaluation' => 'Оценка',
        ];
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
