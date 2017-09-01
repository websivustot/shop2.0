-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Сен 01 2017 г., 12:38
-- Версия сервера: 5.5.53
-- Версия PHP: 5.6.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

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
(1, '2017-08-31 14:15:41', '0000-00-00 00:00:00', 'Category 1', 0, 1),
(2, '2017-08-31 14:15:41', '0000-00-00 00:00:00', 'Category 2', 1, 1),
(3, '2017-08-31 14:15:41', '0000-00-00 00:00:00', 'Category 3', 1, 1),
(4, '2017-08-31 14:15:41', '0000-00-00 00:00:00', 'Category 4', 0, 1),
(5, '2017-08-31 14:15:41', '0000-00-00 00:00:00', 'Category 5', 2, 1),
(6, '2017-08-31 14:15:41', '0000-00-00 00:00:00', 'Category 6', 5, 1);

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
  `category` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `goods`
--

INSERT INTO `goods` (`id`, `date_creation`, `date_updating`, `price`, `name`, `category`, `status`) VALUES
(0, '2017-08-31 14:33:05', '0000-00-00 00:00:00', '100.20', 'Good 1', 1, 1),
(0, '2017-08-31 14:33:05', '0000-00-00 00:00:00', '120.00', 'Good 2', 2, 1),
(0, '2017-08-31 14:33:05', '0000-00-00 00:00:00', '47.80', 'Good 3', 2, 1),
(0, '2017-08-31 14:33:05', '0000-00-00 00:00:00', '100500.00', 'Good 4', 2, 1),
(0, '2017-08-31 14:33:05', '0000-00-00 00:00:00', '2001.00', 'Good 5', 3, 4),
(0, '2017-08-31 14:33:05', '0000-00-00 00:00:00', '1020.20', 'Good 6', 4, 1),
(0, '2017-08-31 14:33:05', '0000-00-00 00:00:00', '1.20', 'Good 7', 4, 1),
(0, '2017-08-31 14:33:05', '0000-00-00 00:00:00', '800.10', 'Good 8', 5, 1);

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
(4, 'user1', '827ccb0eea8a706c4c34a16891f84e7b', 0),
(5, 'user1', '827ccb0eea8a706c4c34a16891f84e7b', 0),
(6, 'user2', '827ccb0eea8a706c4c34a16891f84e7b', 0),
(7, 'user2', '827ccb0eea8a706c4c34a16891f84e7b', 0),
(8, 'user1', '827ccb0eea8a706c4c34a16891f84e7b', 0);

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
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
