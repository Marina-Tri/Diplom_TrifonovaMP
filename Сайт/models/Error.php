<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "Error".
 *
 * @property int $ID
 * @property int|null $ID_Support
 * @property int|null $ID_Dev
 * @property int|null $ID_Platform
 * @property string|null $Message
 * @property int|null $ID_Work
 *
 * @property User $dev
 * @property Platform $platform
 * @property User $support
 * @property Work $work
 */
class Error extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'Error';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['ID_Support', 'ID_Dev', 'ID_Platform', 'ID_Work'], 'integer'],
            [['Message'], 'string'],
            [['ID_Work'], 'exist', 'skipOnError' => true, 'targetClass' => Work::class, 'targetAttribute' => ['ID_Work' => 'ID']],
            [['ID_Platform'], 'exist', 'skipOnError' => true, 'targetClass' => Platform::class, 'targetAttribute' => ['ID_Platform' => 'ID']],
            [['ID_Support'], 'exist', 'skipOnError' => true, 'targetClass' => User::class, 'targetAttribute' => ['ID_Support' => 'ID']],
            [['ID_Dev'], 'exist', 'skipOnError' => true, 'targetClass' => User::class, 'targetAttribute' => ['ID_Dev' => 'ID']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'ID' => 'ID',
            'ID_Support' => 'Id Support',
            'ID_Dev' => 'Id Dev',
            'ID_Platform' => 'Id Platform',
            'Message' => 'Message',
            'ID_Work' => 'Id Work',
        ];
    }

    /**
     * Gets query for [[Dev]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getDev()
    {
        return $this->hasOne(User::class, ['ID' => 'ID_Dev']);
    }

    /**
     * Gets query for [[Platform]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPlatform()
    {
        return $this->hasOne(Platform::class, ['ID' => 'ID_Platform']);
    }

    /**
     * Gets query for [[Support]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getSupport()
    {
        return $this->hasOne(User::class, ['ID' => 'ID_Support']);
    }

    /**
     * Gets query for [[Work]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getWork()
    {
        return $this->hasOne(Work::class, ['ID' => 'ID_Work']);
    }
}
