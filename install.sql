-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 25, 2018 at 10:00 AM
-- Server version: 5.7.18-log
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tree`
--
CREATE DATABASE IF NOT EXISTS `tree` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `tree`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `is_article` tinyint(4) NOT NULL DEFAULT '0',
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `is_article`, `parent_id`) VALUES
(1, 'Root category', 0, 0),
(2, 'Cat 2', 0, 1),
(3, 'Cat 3', 0, 1),
(4, 'Cat 4', 1, 1),
(5, 'Cat 5', 1, 3),
(6, 'Cat 6', 0, 3),
(7, 'Cat 7', 1, 6),
(8, 'Cat 8', 1, 6),
(9, 'Cat 9', 0, 6),
(10, 'Cat 10', 0, 6),
(11, 'Cat 11', 0, 1),
(12, 'Cat 12', 1, 1),
(13, 'Cat 13', 0, 9),
(14, 'Cat 14', 1, 13),
(16, 'Category new not', 1, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
