<?php
class CartController extends Controller
{

    public $view = 'cart';
    
    public function index($data)
    {
        //var_dump($data);
        //$goods = Good::getGood($data['id']);
        //var_dump($goods[0]["id_category"]);
        //$categories = Category::getCategories($goods[0]['id_category']);
        if (isset($_SESSION['cart'])) {
          $cart = Cart::getCart($_SESSION['cart']);
          //var_dump($cart);
        }

        //var_dump($categories);
        return ['cart' => $cart, 'h1' => 'Корзина'];
    }

    public function add($data)
    {
        if(isset($_SESSION['user_id'])) {
          $user_id = $_SESSION['user_id'];
        }
        else {
          $user_id = 'noName';
        }
        $cart = ['user_id' => $user_id, 'good_id' => $_GET['good_id'], 'quantity' => $_GET['quantity']];
        $_SESSION['cart'][] = $cart;
        return [ 'message' => 'Good is added to cart', 'cart' => $cart ];

    }
}
?>
