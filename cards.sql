-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Фев 19 2024 г., 09:52
-- Версия сервера: 8.0.36-0ubuntu0.22.04.1
-- Версия PHP: 8.2.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `cards`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cards`
--

CREATE TABLE `cards` (
  `id` int NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `comments` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `cards`
--

INSERT INTO `cards` (`id`, `name`, `email`, `comments`) VALUES
(1, 'Андрей', 'faa@kkdkk', 'Hello World!'),
(4, 'Андрей', 'faa@kkdkk', 'hello'),
(5, 'Андрей', 'faa@kkdkk', 'a'),
(6, 'Андрей', 'faa@kkdkk', 'hhhhh'),
(7, 'Андрей', 'faa@kkdkk', 'ввв'),
(8, 'Андрей', 'faa@kkdkk', 'лллл'),
(9, 'Андрей', 'faa@kkdkk', 'ПППП'),
(11, 'Андрей', 'faa@kkdkk', 'jjjj'),
(12, 'Андрей', 'faa@tut.by', 'РРррр'),
(13, 'Андрей', 'faa@com.com', 'hhFKFHKKF'),
(14, 'Андрей', 'faa@com.com', 'safffv'),
(15, 's', 'ss@com.com', 'ss'),
(16, 'Андрей', 'faa@com.com', 'ввввв'),
(17, 'Андрей ', 'faa@com.com', 'ввв'),
(18, '  ввв', 'faa@com.com', '    ыьылылыл'),
(19, 'Ан дрей', 'faa@com.com', 'Hello world'),
(20, ' Андрей ', 'faa@com.com', 'ввввв'),
(21, 'Андрей', 'faa@com.com', 'ммммммм'),
(22, 'Андрей', 'faa@com.com', 'ff');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cards`
--
ALTER TABLE `cards`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
