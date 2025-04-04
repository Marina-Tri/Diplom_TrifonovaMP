<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "Request".
 *
 * @property int $ID
 * @property int|null $ID_user
 * @property string|null $Reason
 * @property string|null $Details
 * @property int|null $ID_status
 *
 * @property Status $status
 * @property User $user
 */
class Request extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'Request';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['Reason'], 'required'],
            [['ID_user', 'ID_status'], 'integer'],
            [['Reason', 'Details'], 'string'],
            [['ID_status'], 'exist', 'skipOnError' => true, 'targetClass' => Status::class, 'targetAttribute' => ['ID_status' => 'ID']],
            [['ID_user'], 'exist', 'skipOnError' => true, 'targetClass' => User::class, 'targetAttribute' => ['ID_user' => 'ID']],
            [['ID_user'], 'default', 'value' => Yii::$app->User->identity->ID],
            [['ID_status'], 'default', 'value' => 1],
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
            'Reason' => 'Причина',
            'Details' => 'Комментарий',
            'ID_status' => 'Статус',
        ];
    }

    /**
     * Gets query for [[Status]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getStatus()
    {
        return $this->hasOne(Status::class, ['ID' => 'ID_status']);
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
