-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2018 at 04:33 PM
-- Server version: 5.7.17
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `escapegame`
--

-- --------------------------------------------------------

--
-- Table structure for table `trajet`
--

CREATE TABLE `trajet` (
  `Ville` varchar(45) NOT NULL,
  `Forcalquier` int(11) NOT NULL,
  `Fontienne` int(11) NOT NULL,
  `St-Etienne-les-Orgues` int(11) NOT NULL,
  `Ongle` int(11) NOT NULL,
  `Banon` int(11) NOT NULL,
  `Oppedette` int(11) NOT NULL,
  `Dauphin` int(11) NOT NULL,
  `Mane` int(11) NOT NULL,
  `Lurs` int(11) NOT NULL,
  `Oraison` int(11) NOT NULL,
  `Les_Mees` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trajet`
--

INSERT INTO `trajet` (`Ville`, `Forcalquier`, `Fontienne`, `St-Etienne-les-Orgues`, `Ongle`, `Banon`, `Oppedette`, `Dauphin`, `Mane`, `Lurs`, `Oraison`, `Les_Mees`) VALUES
('Forcalquier', 0, 10, 16, 14, 24, 35, 9, 5, 12, 17, 25),
('Fontienne', 10, 0, 7, 12, 24, 35, 19, 14, 16, 24, 28),
('St-Etienne-les-Orgues', 16, 7, 0, 6, 18, 28, 24, 17, 22, 29, 23),
('Ongle', 14, 12, 6, 0, 14, 24, 21, 14, 25, 31, 28),
('Banon', 24, 24, 18, 14, 0, 16, 25, 24, 35, 41, 40),
('Oppedette', 35, 35, 28, 24, 16, 0, 30, 31, 46, 49, 51),
('Dauphin', 9, 19, 24, 21, 25, 31, 0, 7, 21, 20, 28),
('Mane', 5, 14, 17, 14, 24, 31, 7, 0, 16, 21, 29),
('Lurs', 12, 16, 22, 25, 35, 46, 21, 16, 0, 14, 19),
('Oraison', 17, 24, 29, 31, 41, 49, 20, 21, 14, 0, 15),
('Les_Mees', 25, 28, 23, 28, 40, 51, 28, 29, 19, 15, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `trajet`
--
ALTER TABLE `trajet`
  ADD PRIMARY KEY (`Ville`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
