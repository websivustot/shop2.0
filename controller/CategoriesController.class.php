<?php
class CategoriesController extends Controller
{

    public $view = 'categories';

    public function index($data)
    {
        $categories = Category::getCategories(isset($data['id']) ? $data['id'] : 0);

        $goods = Good::getGoods(isset($data['id']) ? $data['id'] : 0);
        var_dump($goods);
        return ['subcategories' => $categories, 'goods' => $goods];
    }
}
?>
