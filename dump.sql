-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Мар 09 2017 г., 11:31
-- Версия сервера: 5.5.47-0ubuntu0.14.04.1
-- Версия PHP: 5.5.9-1ubuntu4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `emails`
--

-- --------------------------------------------------------

--
-- Структура таблицы `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `title` varchar(150) NOT NULL DEFAULT '',
  `link` text,
  `descr` text,
  `publicated_to` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_checked` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `items`
--

INSERT INTO `items` (`id`, `user_id`, `status`, `title`, `link`, `descr`, `publicated_to`, `last_checked`) VALUES
(1, 1, 2, 'test 1', 'http://board.redfoxius.pro/test1.html', NULL, '2017-03-09 22:00:00', '0000-00-00 00:00:00'),
(2, 1, 2, 'test2', 'http://board.redfoxius.pro/test2.html', NULL, '2017-03-10 22:00:00', '0000-00-00 00:00:00'),
(3, 1, 2, 'test 3', 'http://board.redfoxius.pro/test3.html', NULL, '2017-03-11 22:00:00', '0000-00-00 00:00:00'),
(4, 1, 2, 'test 4', 'http://board.redfoxius.pro/test4.html', NULL, '2017-03-12 22:00:00', '0000-00-00 00:00:00'),
(5, 1, 2, 'test 5', 'http://board.redfoxius.pro/test5.html', NULL, '2017-03-13 22:00:00', '0000-00-00 00:00:00'),
(6, 0, 1, 'test 0', 'http://board.redfoxius.pro/test0.html', NULL, '2017-03-08 22:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`) VALUES
(1, 'me@redfoxus.pro');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
