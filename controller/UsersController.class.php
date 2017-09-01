<?php
class UsersController extends Controller
{

    public $view = 'users';

    public function index($data)
    {
        $user = User::getUser(isset($data['id']) ? $data['id'] : 0);
        return ['user' => $user];
    }
    public function registration()
    {
        $user = User::createUser();
        return ['user' => $user];
    }
    public function login($data)
    {
        $user = User::getUser(isset($data['id']) ? $data['id'] : 0);
        return ['user' => $user];
    }
}
?>
