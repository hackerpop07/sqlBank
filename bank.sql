-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 18, 2019 at 02:42 PM
-- Server version: 5.7.26-0ubuntu0.18.04.1
-- PHP Version: 7.2.19-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vietcombank`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `account_number` int(100) NOT NULL,
  `account_type` varchar(10) DEFAULT NULL,
  `dates` date DEFAULT NULL,
  `balance` tinyint(4) DEFAULT NULL,
  `customer_number` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_number` int(100) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` tinyint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `tran_number` int(100) NOT NULL,
  `account_number` int(100) NOT NULL,
  `dates` date NOT NULL,
  `amounts` int(100) NOT NULL,
  `descriptions` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`account_number`),
  ADD KEY `customer_number` (`customer_number`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_number`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`tran_number`),
  ADD KEY `account_number` (`account_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `account_number` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_number` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `tran_number` int(100) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`customer_number`) REFERENCES `customers` (`customer_number`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`account_number`) REFERENCES `accounts` (`account_number`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
