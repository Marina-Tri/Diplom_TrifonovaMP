<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "User".
 *
 * @property int $ID
 * @property string|null $Username
 * @property string|null $FIO
 * @property int|null $ID_Gender
 * @property int|null $Age
 * @property string|null $Password
 * @property int|null $Telegram_ID
 * @property int|null $ID_role
 * @property string|null $Email
 *
 * @property Active[] $actives
 * @property Error[] $errors0
 * @property Error[] $errors1
 * @property Feedback[] $feedbacks
 * @property Gender $gender
 * @property Request[] $requests
 * @property Role $role
 */
class User extends \yii\db\ActiveRecord implements \yii\web\IdentityInterface
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'User';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['Username', 'FIO', 'ID_Gender', 'Age', 'Password', 'Email'], 'required'],
            [['ID_Gender', 'Age', 'Telegram_ID', 'ID_role'], 'integer'],
            [['Username', 'FIO', 'Email'], 'string', 'max' => 255],
            [['Password'], 'string', 'max' => 1024],
            [['Username'], 'unique'],
            [['Telegram_ID'], 'unique'],
            [['Email'], 'unique'],
            [['ID_role'], 'exist', 'skipOnError' => true, 'targetClass' => Role::class, 'targetAttribute' => ['ID_role' => 'ID']],
            [['ID_Gender'], 'exist', 'skipOnError' => true, 'targetClass' => Gender::class, 'targetAttribute' => ['ID_Gender' => 'ID']],
            [['ID_role'], 'default', 'value' => 1],
            [['Email'], 'email'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'ID' => 'ID',
            'Username' => 'Логин',
            'FIO' => 'ФИО',
            'ID_Gender' => 'Пол',
            'Age' => 'Возраст',
            'Password' => 'Пароль',
            'Telegram_ID' => 'Телеграм ID',
            'ID_role' => 'Роль',
            'Email' => 'Почта',
        ];
    }

    /**
     * Gets query for [[Actives]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getActives()
    {
        return $this->hasMany(Active::class, ['ID_user' => 'ID']);
    }

    /**
     * Gets query for [[Errors0]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getErrors0()
    {
        return $this->hasMany(Error::class, ['ID_Support' => 'ID']);
    }

    /**
     * Gets query for [[Errors1]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getErrors1()
    {
        return $this->hasMany(Error::class, ['ID_Dev' => 'ID']);
    }

    /**
     * Gets query for [[Feedbacks]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getFeedbacks()
    {
        return $this->hasMany(Feedback::class, ['ID_user' => 'ID']);
    }

    /**
     * Gets query for [[Gender]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getGender()
    {
        return $this->hasOne(Gender::class, ['ID' => 'ID_Gender']);
    }

    /**
     * Gets query for [[Requests]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRequests()
    {
        return $this->hasMany(Request::class, ['ID_user' => 'ID']);
    }

    /**
     * Gets query for [[Role]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRole()
    {
        return $this->hasOne(Role::class, ['ID' => 'ID_role']);
    }
    public static function findIdentity($id)
    {
        return static::findOne($id);
    }

    /**
     * {@inheritdoc}
     */
    public static function findIdentityByAccessToken($token, $type = null)
    {
        return null;
    }

    /**
     * Finds user by username
     *
     * @param string $username
     * @return static|null
     */
    public static function findByUsername($username)
    {
        return User::findOne(['Username' => $username]);
    }

    /**
     * {@inheritdoc}
     */
    public function getId()
    {
        return $this->ID;
    }

    /**
     * {@inheritdoc}
     */
    public function getAuthKey()
    {
        return null;
    }

    /**
     * {@inheritdoc}
     */
    public function validateAuthKey($authKey)
    {
        return false;
    }

    /**
     * Validates password
     *
     * @param string $password password to validate
     * @return bool if password provided is valid for current user
     */

    public function beforeSave($insert)
    {
        // Проверяем, изменялся ли пароль
        if ($this->isAttributeChanged('Password')) {
            $this->Password = hash('sha224', $this->Password);
        } else {
            // Если пароль не изменялся, оставляем его как есть
            unset($this->Password);
        }
        return parent::beforeSave($insert);
    }

    public function validatePassword($password)
    {
        return $this->Password === hash('sha224', $password);
    }

    public function validateAdmin()
    {
        return in_array($this->role->Name, ['Администратор']);
    }
}
