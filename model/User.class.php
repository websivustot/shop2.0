<?php

class User extends Model {
    protected static $table = 'users';

    protected static function setProperties()
    {
        self::$properties['name'] = [
            'type' => 'varchar',
            'size' => 512
        ];

        self::$properties['parent_id'] = [
            'type' => 'int',
        ];
    }

    public static function getUser($userId)
    {
        return db::getInstance()->Select(
            'SELECT id, name FROM users WHERE status=:status AND id = :user_id',
            ['status' => Status::Active, 'user_id' => $userId]);

    }
}
