-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 04, 2020 at 05:13 PM
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
-- Table structure for table `cards`
--

CREATE TABLE `cards` (
  `card_category` enum('C','D','H','S') NOT NULL,
  `card_value` enum('2','3','4','5','6','7','8','9','10','J','Q','K','A') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cards_img`
--

CREATE TABLE `cards_img` (
  `card_color` enum('C','D','H','S','0') NOT NULL,
  `card_value` enum('0','2','3','4','5','6','7','8','9','10','J','Q','K','A') NOT NULL,
  `card_img` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cards_img`
--

INSERT INTO `cards_img` (`card_color`, `card_value`, `card_img`) VALUES
('C', '2', '2_C'),
('C', '3', '3C'),
('C', '4', '4C'),
('C', '5', '5C'),
('C', '6', '6C'),
('C', '7', '7C'),
('C', '8', '8C'),
('C', '9', '9C'),
('C', '10', '10C'),
('C', 'J', 'JC'),
('C', 'Q', 'QC'),
('C', 'K', 'KC'),
('C', 'A', 'AC'),
('D', '2', '2D'),
('D', '3', '3D'),
('D', '4', '4D'),
('D', '5', '5D'),
('D', '6', '6D'),
('D', '7', '7D'),
('D', '8', '8D'),
('D', '9', '9D'),
('D', '10', '10D'),
('D', 'J', 'JD'),
('D', 'Q', 'QD'),
('D', 'K', 'KD'),
('D', 'A', 'AD'),
('H', '2', '2H'),
('H', '3', '3H'),
('H', '4', '4H'),
('H', '5', '5H'),
('H', '6', '6H'),
('H', '7', '7H'),
('H', '8', '8H'),
('H', '9', '9H'),
('H', '10', '10H'),
('H', 'J', 'JH'),
('H', 'Q', 'QH'),
('H', 'K', 'KH'),
('H', 'A', 'AH'),
('S', '2', '2S'),
('S', '3', '3S'),
('S', '4', '4S'),
('S', '5', '5S'),
('S', '6', '6S'),
('S', '7', '7S'),
('S', '8', '8S'),
('S', '9', '9S'),
('S', '10', '10S'),
('S', 'J', 'JS'),
('S', 'Q', 'QS'),
('S', 'K', 'KS'),
('S', 'A', 'AS'),
('0', '0', 'back');

-- --------------------------------------------------------

--
-- Table structure for table `cards_scores`
--

CREATE TABLE `cards_scores` (
  `card_category` enum('C','D','H','S') NOT NULL,
  `card_value` enum('2','3','4','5','6','7','8','9','10','J','Q','K','A') NOT NULL,
  `card_score` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cards_scores`
--

INSERT INTO `cards_scores` (`card_category`, `card_value`, `card_score`) VALUES
('C', '2', 2),
('C', '3', 3),
('C', '4', 4),
('C', '5', 5),
('C', '6', 6),
('C', '7', 7),
('C', '8', 8),
('C', '9', 9),
('C', '10', 10),
('C', 'J', 10),
('C', 'Q', 10),
('C', 'K', 10),
('C', 'A', 11),
('D', '2', 2),
('D', '3', 3),
('D', '4', 4),
('D', '5', 5),
('D', '6', 6),
('D', '7', 7),
('D', '8', 8),
('D', '9', 9),
('D', '10', 10),
('D', 'J', 10),
('D', 'Q', 10),
('D', 'K', 10),
('D', 'A', 11),
('H', '2', 2),
('H', '3', 3),
('H', '4', 4),
('H', '5', 5),
('H', '6', 6),
('H', '7', 7),
('H', '8', 8),
('H', '9', 9),
('H', '10', 10),
('H', 'J', 10),
('H', 'Q', 10),
('H', 'K', 10),
('H', 'A', 11),
('S', '2', 2),
('S', '3', 3),
('S', '4', 4),
('S', '5', 5),
('S', '6', 6),
('S', '7', 7),
('S', '8', 8),
('S', '9', 9),
('S', '10', 10),
('S', 'J', 10),
('S', 'Q', 10),
('S', 'K', 10),
('S', 'A', 11);

-- --------------------------------------------------------

--
-- Table structure for table `game_status`
--

CREATE TABLE `game_status` (
  `status` enum('not active','initialized','started','ended','aborded') NOT NULL DEFAULT 'not active',
  `p_turn` enum('C','P') DEFAULT NULL,
  `result` enum('C','P','D') NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `username` varchar(20) DEFAULT NULL,
  `player_type` enum('C','P') NOT NULL,
  `token` varchar(32) DEFAULT NULL,
  `last_action` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`card_category`,`card_value`);

--
-- Indexes for table `cards_img`
--
ALTER TABLE `cards_img`
  ADD PRIMARY KEY (`card_color`,`card_value`,`card_img`);

--
-- Indexes for table `cards_scores`
--
ALTER TABLE `cards_scores`
  ADD PRIMARY KEY (`card_category`,`card_value`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
