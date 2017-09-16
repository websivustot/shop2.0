<?php
class CategoriesController extends Controller
{

    public $view = 'categories';

    public function index($data)
    {
//var_dump($data);
        $categories = Category::getCategories(isset($data['id']) ? $data['id'] : 0);
        $goods = Good::getGoods(isset($data['id']) ? $data['id'] : 0);
        foreach ($categories as $category => $value) {
          var_dump($value["id_category"]);
          $goods = array_merge ($goods, Good::getGoods($value["id_category"]));
        }

        //var_dump($goods);
        return ['subcategories' => $categories, 'goods' => $goods];
    }
}
?>
