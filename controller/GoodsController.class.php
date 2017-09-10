<?php
class GoodsController extends Controller
{

    public $view = 'goods';

    public function index($data)
    {
        $categories = Category::getCategories(isset($data['id']) ? $data['id'] : 0);

        $goods = Good::getGoods(isset($data['id']) ? $data['id'] : 0);
        var_dump($goods);
        return ['subcategories' => $categories, 'goods' => $goods];
    }    
}
?>
