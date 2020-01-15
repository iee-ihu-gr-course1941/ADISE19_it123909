-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 14, 2020 at 07:54 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `schema`
--

-- --------------------------------------------------------

--
-- Table structure for table `deck`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/`test_project_db` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `test_project_db`;


CREATE TABLE `deck` (
  `id` int(11) NOT NULL,
  `card_category` enum('C','D','H','S') NOT NULL,
  `card_value` enum('2','3','4','5','6','7','8','9','10','J','Q','K','A') NOT NULL,
  `card_score` int(11) NOT NULL,
  `img` varchar(20) NOT NULL,
  `player_hand` int(11) DEFAULT NULL,
  `croupier_hand` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `deck`
--

INSERT INTO `deck` (`id`, `card_category`, `card_value`, `card_score`, `img`, `player_hand`, `croupier_hand`) VALUES
(1, 'C', '2', 2, '2C', NULL, NULL),
(2, 'C', '3', 3, '3C', NULL, NULL),
(3, 'C', '4', 4, '4C', NULL, NULL),
(4, 'C', '5', 5, '5C', NULL, NULL),
(5, 'C', '6', 6, '6C', NULL, NULL),
(6, 'C', '7', 7, '7C', NULL, NULL),
(7, 'C', '8', 8, '8C', NULL, NULL),
(8, 'C', '9', 9, '9C', NULL, NULL),
(9, 'C', '10', 10, '10C', NULL, NULL),
(10, 'C', 'J', 10, 'JC', NULL, NULL),
(11, 'C', 'Q', 10, 'QC', NULL, NULL),
(12, 'C', 'K', 10, 'KC', NULL, NULL),
(13, 'C', 'A', 11, 'AC', NULL, NULL),
(14, 'D', '2', 2, '2D', NULL, NULL),
(15, 'D', '3', 3, '3D', NULL, NULL),
(16, 'D', '4', 4, '4D', NULL, NULL),
(17, 'D', '5', 5, '5D', NULL, NULL),
(18, 'D', '6', 6, '6D', NULL, NULL),
(19, 'D', '7', 7, '7D', NULL, NULL),
(20, 'D', '8', 8, '8D', NULL, NULL),
(21, 'D', '9', 9, '9D', NULL, NULL),
(22, 'D', '10', 10, '10D', NULL, NULL),
(23, 'D', 'J', 10, 'JD', NULL, NULL),
(24, 'D', 'Q', 10, 'QD', NULL, NULL),
(25, 'D', 'K', 10, 'KD', NULL, NULL),
(26, 'D', 'A', 11, 'AD', NULL, NULL),
(27, 'H', '2', 2, '2H', NULL, NULL),
(28, 'H', '3', 3, '3H', NULL, NULL),
(29, 'H', '4', 4, '4H', NULL, NULL),
(30, 'H', '5', 5, '5H', NULL, NULL),
(31, 'H', '6', 6, '6H', NULL, NULL),
(32, 'H', '7', 7, '7H', NULL, NULL),
(33, 'H', '8', 8, '8H', NULL, NULL),
(34, 'H', '9', 9, '9H', NULL, NULL),
(35, 'H', '10', 10, '10H', NULL, NULL),
(36, 'H', 'J', 10, 'JH', NULL, NULL),
(37, 'H', 'Q', 10, 'QH', NULL, NULL),
(38, 'H', 'K', 10, 'KH', NULL, NULL),
(39, 'H', 'A', 11, 'AH', NULL, NULL),
(40, 'S', '2', 2, '2S', NULL, NULL),
(41, 'S', '3', 3, '3S', NULL, NULL),
(42, 'S', '4', 4, '4S', NULL, NULL),
(43, 'S', '5', 5, '5S', NULL, NULL),
(44, 'S', '6', 6, '6S', NULL, NULL),
(45, 'S', '7', 7, '7S', NULL, NULL),
(46, 'S', '8', 8, '8S', NULL, NULL),
(47, 'S', '9', 9, '9S', NULL, NULL),
(48, 'S', '10', 10, '10S', NULL, NULL),
(49, 'S', 'J', 10, 'JS', NULL, NULL),
(50, 'S', 'Q', 10, 'QS', NULL, NULL),
(51, 'S', 'K', 10, 'KS', NULL, NULL),
(52, 'S', 'A', 11, 'AS', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `deck_empty`
--

CREATE TABLE `deck_empty` (
  `id` int(11) NOT NULL,
  `card_category` enum('C','D','H','S') NOT NULL,
  `card_value` enum('2','3','4','5','6','7','8','9','10','J','Q','K','A') NOT NULL,
  `card_score` int(11) NOT NULL,
  `img` varchar(20) NOT NULL,
  `player_hand` int(11) DEFAULT NULL,
  `croupier_hand` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `deck_empty`
--

INSERT INTO `deck_empty` (`id`, `card_category`, `card_value`, `card_score`, `img`, `player_hand`, `croupier_hand`) VALUES
(1, 'C', '2', 2, '2C', NULL, NULL),
(2, 'C', '3', 3, '3C', NULL, NULL),
(3, 'C', '4', 4, '4C', NULL, NULL),
(4, 'C', '5', 5, '5C', NULL, NULL),
(5, 'C', '6', 6, '6C', NULL, NULL),
(6, 'C', '7', 7, '7C', NULL, NULL),
(7, 'C', '8', 8, '8C', NULL, NULL),
(8, 'C', '9', 9, '9C', NULL, NULL),
(9, 'C', '10', 10, '10C', NULL, NULL),
(10, 'C', 'J', 10, 'JC', NULL, NULL),
(11, 'C', 'Q', 10, 'QC', NULL, NULL),
(12, 'C', 'K', 10, 'KC', NULL, NULL),
(13, 'C', 'A', 11, 'AC', NULL, NULL),
(14, 'D', '2', 2, '2D', NULL, NULL),
(15, 'D', '3', 3, '3D', NULL, NULL),
(16, 'D', '4', 4, '4D', NULL, NULL),
(17, 'D', '5', 5, '5D', NULL, NULL),
(18, 'D', '6', 6, '6D', NULL, NULL),
(19, 'D', '7', 7, '7D', NULL, NULL),
(20, 'D', '8', 8, '8D', NULL, NULL),
(21, 'D', '9', 9, '9D', NULL, NULL),
(22, 'D', '10', 10, '10D', NULL, NULL),
(23, 'D', 'J', 10, 'JD', NULL, NULL),
(24, 'D', 'Q', 10, 'QD', NULL, NULL),
(25, 'D', 'K', 10, 'KD', NULL, NULL),
(26, 'D', 'A', 11, 'AD', NULL, NULL),
(27, 'H', '2', 2, '2H', NULL, NULL),
(28, 'H', '3', 3, '3H', NULL, NULL),
(29, 'H', '4', 4, '4H', NULL, NULL),
(30, 'H', '5', 5, '5H', NULL, NULL),
(31, 'H', '6', 6, '6H', NULL, NULL),
(32, 'H', '7', 7, '7H', NULL, NULL),
(33, 'H', '8', 8, '8H', NULL, NULL),
(34, 'H', '9', 9, '9H', NULL, NULL),
(35, 'H', '10', 10, '10H', NULL, NULL),
(36, 'H', 'J', 10, 'JH', NULL, NULL),
(37, 'H', 'Q', 10, 'QH', NULL, NULL),
(38, 'H', 'K', 10, 'KH', NULL, NULL),
(39, 'H', 'A', 11, 'AH', NULL, NULL),
(40, 'S', '2', 2, '2S', NULL, NULL),
(41, 'S', '3', 3, '3S', NULL, NULL),
(42, 'S', '4', 4, '4S', NULL, NULL),
(43, 'S', '5', 5, '5S', NULL, NULL),
(44, 'S', '6', 6, '6S', NULL, NULL),
(45, 'S', '7', 7, '7S', NULL, NULL),
(46, 'S', '8', 8, '8S', NULL, NULL),
(47, 'S', '9', 9, '9S', NULL, NULL),
(48, 'S', '10', 10, '10S', NULL, NULL),
(49, 'S', 'J', 10, 'JS', NULL, NULL),
(50, 'S', 'Q', 10, 'QS', NULL, NULL),
(51, 'S', 'K', 10, 'KS', NULL, NULL),
(52, 'S', 'A', 11, 'AS', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `game_status`
--

CREATE TABLE `game_status` (
  `status` enum('not active','initialized','started','ended','aborded') NOT NULL DEFAULT 'not active',
  `p_turn` enum('C','P') DEFAULT NULL,
  `result` enum('C','P','D') DEFAULT NULL,
  `last_change` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `username` varchar(30) DEFAULT NULL,
  `player_type` enum('C','P') NOT NULL,
  `token` varchar(32) DEFAULT NULL,
  `last_action` timestamp NOT NULL DEFAULT current_timestamp(),
  `player_score` int(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `deck`
--
ALTER TABLE `deck`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `deck_empty`
--
ALTER TABLE `deck_empty`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`player_type`);
COMMIT;

DELIMITER $$

!50003 CREATE  PROCEDURE `clean_deck`()
BEGIN
	replace into deck select * from deck_empty;
	update `players` set username=null, token=null;
	update `game_status` set `status`='not active', `p_turn`=null, `result`=null;
    END $$
DELIMITER ;



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
