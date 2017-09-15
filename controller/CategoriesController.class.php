<?php
class CategoriesController extends Controller
{

    public $view = 'categories';

    public function index($data)
    {
var_dump($data);
        $categories = Category::getCategories(isset($data['id']) ? $data['id'] : 0);
        $goods = [];
        foreach ($categories as $category => $value) {
          $goods = array_merge ($goods, Good::getGoods($value["id_category"]));
        }

        //echo "goods";var_dump($goods);
        return ['subcategories' => $categories, 'goods' => $goods];
    }
}
?>
