<?php

class IndexController extends Controller
{
    public $view = 'index';
    public $title;

    function __construct()
    {
        parent::__construct();
        $this->title .= ' | Главная';
    }

    public function index()
    {
        $goods = Good::getGoods(0);
        var_dump($goods);
        return ['goods' => $goods];
    }


}
