<?php

class User extends Model {
    protected static $table = 'users';

    protected static function setProperties()
    {
        self::$properties['name'] = [
            'type' => 'varchar',
            'size' => 512
        ];

        self::$properties['password'] = [
            'type' => 'text',
        ];

        self::$properties['status'] = [
            'type' => 'int',
        ];
    }

    public static function createUser($user,$password)
    {
        return db::getInstance()->Query(
            'INSERT INTO users (name, password, status) VALUES (:user, :password, :status)',
            ['status' => Status::Active, 'user' => $user, 'password' => $password]);

    }

    public static function getUser($userId)
    {
        return db::getInstance()->Select(
            'SELECT id, name FROM users WHERE status=:status AND id = :user_id',
            ['status' => Status::Active, 'user_id' => $userId]);

    }
}
