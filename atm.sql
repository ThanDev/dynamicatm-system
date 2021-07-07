-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 28, 2021 at 11:19 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bay`
--

-- --------------------------------------------------------

--
-- Table structure for table `atm`
--

CREATE TABLE `atm` (
  `atmID` int(11) NOT NULL,
  `atmX` float NOT NULL,
  `atmY` float NOT NULL,
  `atmZ` float NOT NULL,
  `atmA` float NOT NULL,
  `atmInterior` int(11) NOT NULL,
  `atmWorld` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

--
-- Dumping data for table `atm`
--

INSERT INTO `atm` (`atmID`, `atmX`, `atmY`, `atmZ`, `atmA`, `atmInterior`, `atmWorld`) VALUES
(1, 1547.14, -1680.7, 13.5591, 266.581, 0, 0),
(2, 1186.41, -1292.74, 13.5495, 98.1101, 0, 0),
(6, 1206.86, -1820.56, 13.5944, 356.636, 0, 0),
(8, 1204.03, -1820.6, 13.5943, 6.0304, 0, 0),
(9, 1547.24, -1670.46, 13.5619, 269.726, 0, 0),
(10, 1675.94, -2333.8, -2.6797, 180.634, 0, 0),
(11, 359.231, 168.085, 1008.38, 91.1489, 3, 5),
(14, 359.515, 179.258, 1008.38, 89.3843, 3, 5),
(15, 1108.6, 1056.83, -19.9389, 1.1757, 0, 0),
(16, 1108.64, 1056.96, -19.941, 357.811, 0, 5),
(17, 1780.55, -1884.89, 13.3897, 358.653, 0, 0),
(20, 1306.96, 1251.22, 10.8203, 170.801, 0, 0),
(29, 1300.53, -59.9158, 1002.5, 182.984, 18, 7026),
(30, 1294.18, -59.9641, 1002.5, 181.99, 18, 7026),
(31, 1287.88, -60.1603, 1002.5, 182.321, 18, 7026),
(32, 1281.54, -59.967, 1002.5, 185.637, 18, 7026),
(36, 584.149, -1514.68, 15.1841, 85.4799, 0, 0),
(37, 1287.96, -60.2394, 1002.5, 181.193, 18, 7028),
(38, 1294.24, -60.1015, 1002.5, 180.862, 18, 7028),
(39, 1300.53, -60.3524, 1002.5, 181.857, 18, 7028),
(42, -2026.48, -105.673, 1035.17, 271.657, 3, 7026),
(57, 1632.96, -2309.77, 13.5575, 0.2914, 0, 0),
(61, 412.411, 2536.71, 19.1484, 88.4403, 0, 0),
(62, 2181.9, 1105.6, 12.6484, 154.956, 0, 0),
(63, -2293.7, 2289.8, 4.9433, 357.071, 0, 0),
(64, 1127.04, -2045.27, 69.0078, 89.6966, 0, 0),
(65, -2035.7, -116.539, 1035.17, 89.3599, 3, 7062),
(67, 1928.82, -1785.55, 13.5469, 95.9016, 0, 0),
(68, 1625.06, -2335.57, 13.5396, 182.7, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `atm`
--
ALTER TABLE `atm`
  ADD PRIMARY KEY (`atmID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `atm`
--
ALTER TABLE `atm`
  MODIFY `atmID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
