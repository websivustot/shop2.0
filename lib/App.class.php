<?php

class App
{
    public static function Init()
    {
        date_default_timezone_set('Europe/Moscow');
        // создаем объекn singleton из класса db
        //db::getInstance();
        // проверяем, если не в консольном режиме (cli) и есть суперглобальный массив, то разбираем строку в методе web()
        if (php_sapi_name() !== 'cli' && isset($_SERVER) && isset($_GET)) {
            self::web(isset($_GET['path']) ? $_GET['path'] : '');
        }

    }

    protected static function web($url)
    {

        $url = explode("/", $url);
        //if (isset($url[0])) {
        if (!empty($url[0])) {
            $_GET['page'] = $url[0]; // первую часть урл назначаем страницей
            if (isset($url[1])) {
                if (is_numeric($url[1])) { // если вторая часть цифровая, то назначаем id
                    $_GET['id'] = $url[1];
                } else {
                    $_GET['action'] = $url[1]; // иначе action
                }
                if (isset($url[2])) {
                    $_GET['id'] = $url[2]; // если есть третья часть, то точно id
                }
            }
        }
        else{
            $_GET['page'] = 'Index'; // В противном случае индексная страница
        }

        if (isset($_GET['page'])) {
            $controllerName = ucfirst($_GET['page']) . 'Controller'; // формируем имя контроллера, первая заглавная
            $methodName = isset($_GET['action']) ? $_GET['action'] : 'index'; // имя действия, если нет - index
            $controller = new $controllerName(); // создаем объект класса с именем контроллера, напр IndexController
            $data = [ // данные на основе методов контроллера
                'content_data' => $controller->$methodName($_GET), //данные контента формируются при выполнении метода контроллера
                'title' => $controller->title,
                'categories' => Category::getCategories(0)
            ];
            //var_dump($data);
            $view = $controller->view . '/' . $methodName . '.html'; // формируем имя шаблона

            if (!isset($_GET['asAjax'])) {  // если не аякс выводим в шаблон
                $loader = new Twig_Loader_Filesystem(Config::get('path_templates'));
                $twig = new Twig_Environment($loader);
                $template = $twig->loadTemplate($view);

                echo $template->render($data);
            } else {
                echo json_encode($data); // иначе просто передаем данные
            }
        }
    }


}
