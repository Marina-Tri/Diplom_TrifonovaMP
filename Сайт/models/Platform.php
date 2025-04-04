<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "Platform".
 *
 * @property int $ID
 * @property string|null $Name
 *
 * @property Error[] $errors0
 */
class Platform extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'Platform';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['Name'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'ID' => 'ID',
            'Name' => 'Name',
        ];
    }

    /**
     * Gets query for [[Errors0]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getErrors0()
    {
        return $this->hasMany(Error::class, ['ID_Platform' => 'ID']);
    }
}
