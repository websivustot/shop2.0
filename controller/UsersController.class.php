<?php
class UsersController extends Controller
{

    public $view = 'users';

    public function index($data) // действие при /users/
    {

        if (!isset($_SESSION['user_id'])) {
          header("Location: /users/login/");
          exit;
        }
        $user = User::getUser(isset($data['id']) ? $data['id'] : 0);
        return ['user' => $user];
    }
    public function registration()
    {

      if ($_SERVER['REQUEST_METHOD'] == 'POST') {

        if ($_POST['newuser']) $login = $_POST['newuser'];
        if ($_POST['newpass']) $password = md5($_POST['newpass']);

        if(!User::isUser($login)){
          $user = User::createUser($login,$password);
          //var_dump($user);
          return ['user' => $user];
        }
        return  ['message' => 'Пользователь с таким именем уже существует!'];
      }


    }
    public function login($data)
    {
        $user = User::getUser(isset($data['id']) ? $data['id'] : 0);
        return ['user' => $user];
    }
}
?>
