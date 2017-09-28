-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Сен 28 2017 г., 12:38
-- Версия сервера: 5.5.53
-- Версия PHP: 5.6.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `shop2`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `good_id` int(11) NOT NULL,
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updating` date DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id_category` int(11) NOT NULL,
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updating` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `name` varchar(255) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id_category`, `date_creation`, `date_updating`, `name`, `parent_id`, `status`) VALUES
(1, '2017-08-31 14:15:41', '0000-00-00 00:00:00', 'Ноутбуки', 0, 1),
(2, '2017-08-31 14:15:41', '0000-00-00 00:00:00', 'Компьютеры', 0, 1),
(3, '2017-08-31 14:15:41', '0000-00-00 00:00:00', 'Планшеты', 0, 1),
(4, '2017-08-31 14:15:41', '0000-00-00 00:00:00', 'Смартфоны', 0, 1),
(5, '2017-08-31 14:15:41', '0000-00-00 00:00:00', 'Комплектующие', 0, 1),
(6, '2017-08-31 14:15:41', '0000-00-00 00:00:00', 'Игры', 0, 1),
(7, '2017-09-10 12:12:24', '0000-00-00 00:00:00', 'Apple', 1, 1),
(8, '2017-09-10 12:13:14', '0000-00-00 00:00:00', 'HP', 1, 1),
(9, '2017-09-10 12:13:34', '0000-00-00 00:00:00', 'Lenovo', 1, 1),
(10, '2017-09-16 10:22:44', '0000-00-00 00:00:00', 'Станции', 2, 1),
(11, '2017-09-16 10:23:05', '0000-00-00 00:00:00', 'Моноблоки', 2, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `goods`
--

CREATE TABLE `goods` (
  `id` int(11) NOT NULL,
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updating` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `price` decimal(9,2) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `id_category` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `goods`
--

INSERT INTO `goods` (`id`, `date_creation`, `date_updating`, `price`, `name`, `description`, `id_category`, `status`) VALUES
(9, '2017-09-10 13:23:04', '0000-00-00 00:00:00', '124.00', 'Ноутбук Apple MacBook Pro 13.3\" Silver MNQG2', 'Экран 13.3\" разрешение 2560 x 1600\r\nПроцессор Intel® Core™ i5 2.9 ГГц', 7, 1),
(10, '2017-09-12 19:10:50', '0000-00-00 00:00:00', '61.00', 'Ноутбук HP Pavilion 17-ab200ur, 1DM85EA', 'Описание Ноутбук HP Pavilion 17-ab200ur, 1DM85EA', 8, 1),
(11, '2017-09-12 19:15:50', '0000-00-00 00:00:00', '69000.00', 'Ноутбук HP Omen 17-an017ur, 2CM06EA', 'Описание Ноутбук HP Omen 17-an017ur, 2CM06EA', 8, 1),
(12, '2017-09-12 19:18:01', '0000-00-00 00:00:00', '55000.00', 'Ноутбук HP Pavilion 15-bc200ur, 1DM81EA', 'Описание Ноутбук HP Pavilion 15-bc200ur, 1DM81EA', 8, 1),
(13, '2017-09-16 10:24:37', '0000-00-00 00:00:00', '40000.00', 'Компьютер HP Omen 880-076ur, 2BW86EA', 'Описание Компьютер HP Omen 880-076ur, 2BW86EA', 10, 1),
(14, '2017-09-16 10:25:40', '0000-00-00 00:00:00', '48000.00', 'Компьютер KEY GM Mid G-340-8G1000 ', 'Описание Компьютер KEY GM Mid G-340-8G1000 с Microsoft Windows 10 Профессиональная ', 10, 1),
(15, '2017-09-16 10:26:19', '0000-00-00 00:00:00', '50000.00', 'Моноблок ASUS Z240IEGT-GA053T, 90PT01T1-M00930', 'Описание Моноблок ASUS Z240IEGT-GA053T, 90PT01T1-M00930', 11, 1),
(16, '2017-09-16 15:55:51', '0000-00-00 00:00:00', '10000.00', 'Просто компьютер', 'описание компьютера', 2, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updating` date DEFAULT NULL,
  `phone` varchar(30) NOT NULL,
  `user_id` int(11) NOT NULL,
  `adress` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `pages`
--

INSERT INTO `pages` (`id`, `name`) VALUES
(1, 'Главная'),
(2, 'О Магазине'),
(3, 'Каталог');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `status`) VALUES
(1, 'юзер1', 'd41d8cd98f00b204e9800998ecf8427e', 0),
(2, 'юзер2', 'd41d8cd98f00b204e9800998ecf8427e', 0),
(3, 'admin', '21232f297a57a5a743894a0e4a801fc3', 0),
(5, 'user1', '827ccb0eea8a706c4c34a16891f84e7b', 0),
(7, 'user2', '827ccb0eea8a706c4c34a16891f84e7b', 0),
(11, 'alzolot@mail.ru', 'c4ca4238a0b923820dcc509a6f75849b', 1),
(13, 'websivustot@gmail.com', 'c81e728d9d4c2f636f067f89cc14862c', 1),
(14, 'ad@dssds.fh', '202cb962ac59075b964b07152d234b70', 1),
(15, 'sdasdd', 'c4ca4238a0b923820dcc509a6f75849b', 1),
(16, 'aooo', '6364d3f0f495b6ab9dcf8d3b5c6e0b01', 1),
(17, 'sdfsd', 'eccbc87e4b5ce2fe28308fd9f2a7baf3', 1),
(18, 'rtwer', '8277e0910d750195b448797616e091ad', 1),
(19, 'erwerer', 'f180b29a9891fbe63b35b071f28b348c', 1),
(20, 'ttttt', 'c4ca4238a0b923820dcc509a6f75849b', 1),
(21, 'fffff', 'c4ca4238a0b923820dcc509a6f75849b', 1),
(22, 'ccc', 'c4ca4238a0b923820dcc509a6f75849b', 1),
(23, 'gdfgdfdf', '8277e0910d750195b448797616e091ad', 1),
(24, 'sdfdff', '9e3669d19b675bd57058fd4664205d2a', 1),
(25, 'чсмсмм', '73efe4c82385891a68cb8e147db92d0a', 1),
(26, 'мтимтми', '39c6130d6ab0915a1471db1a9489e7fc', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_category`);

--
-- Индексы таблицы `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT для таблицы `goods`
--
ALTER TABLE `goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
