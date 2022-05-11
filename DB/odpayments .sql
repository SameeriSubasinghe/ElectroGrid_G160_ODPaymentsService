-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2022 at 08:09 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `electrogrid`
--

-- --------------------------------------------------------

--
-- Table structure for table `odpayments`
--

CREATE TABLE `odpayments` (
  `ODPaymentID` int(10) NOT NULL,
  `ODCode` varchar(10) NOT NULL,
  `dueAmount` decimal(10,2) NOT NULL,
  `dueMonthsNo` int(10) NOT NULL,
  `dueMonths` varchar(100) NOT NULL,
  `accountNo` varchar(10) NOT NULL,
  `IsSuspend` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `odpayments`
--

INSERT INTO `odpayments` (`ODPaymentID`, `ODCode`, `dueAmount`, `dueMonthsNo`, `dueMonths`, `accountNo`, `IsSuspend`) VALUES
(2, 'OD103', '5000.00', 3, 'March_2021 , April_2021, May_2021', 'UI205', 0),
(3, 'OD104', '8500.00', 6, 'March_2021 , April_2021, May_2021, June_2021, July_2021, August_2021', 'U126', 1),
(21, 'OD108', '4500.00', 3, 'April_2021, May_2021, June_2021', 'UI209', 0),
(22, 'OD109', '4520.00', 3, 'April_2021, May_2021, June_2021', 'UI208', 0),
(27, 'OD102', '8500.00', 6, 'March_2021 , April_2021, May_2021, June_2021, July_2021, August_2021', 'U126', 1),
(28, 'OD110', '2000.00', 3, 'April_2021, May_2021, June_2021', 'UI208', 0),
(30, 'OD118', '5000.00', 3, 'April_2021, May_2021, June_2021', 'UI209', 0),
(37, 'OD102', '8500.00', 6, 'March_2021 , April_2021, May_2021, June_2021, July_2021, August_2021', 'U126', 0),
(39, 'OD103', '5000.00', 3, 'March_2021 , April_2021, May_2021', 'UI208', 0),
(40, 'OD102', '8500.00', 6, 'March_2021 , April_2021, May_2021, June_2021, July_2021, August_2021', 'U126', 0),
(41, 'OD103', '5000.00', 3, 'March_2021 , April_2021, May_2021', '8000', 0),
(43, 'OD103', '5000.00', 3, 'March_2021 , April_2021, May_2021', 'UI205', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `odpayments`
--
ALTER TABLE `odpayments`
  ADD PRIMARY KEY (`ODPaymentID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `odpayments`
--
ALTER TABLE `odpayments`
  MODIFY `ODPaymentID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
