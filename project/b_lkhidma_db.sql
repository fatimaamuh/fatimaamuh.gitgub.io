-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 06, 2023 at 04:10 PM
-- Server version: 5.7.39
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `b_lkhidma_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `Admin`
--

CREATE TABLE `Admin` (
  `A_id` int(11) NOT NULL,
  `Fname` varchar(30) NOT NULL,
  `Lname` varchar(30) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(44) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Booking`
--

CREATE TABLE `Booking` (
  `S_id` int(11) NOT NULL,
  `C_id` int(11) NOT NULL,
  `Complete_Date` date DEFAULT NULL,
  `Undergoing_Date` date DEFAULT NULL,
  `Status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE `Customer` (
  `C_id` int(11) NOT NULL,
  `Name` varchar(60) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Phone` varchar(44) NOT NULL,
  `Area` varchar(44) NOT NULL,
  `Pass` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Review`
--

CREATE TABLE `Review` (
  `R_id` int(11) NOT NULL,
  `C_id` int(11) NOT NULL,
  `S_id` int(11) NOT NULL,
  `R_date` date NOT NULL,
  `Rating` int(50) NOT NULL,
  `Comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `service_id` int(11) NOT NULL,
  `service_name` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `services_belong_worker`
--

CREATE TABLE `services_belong_worker` (
  `sbw_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `worker_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Service_Provider`
--

CREATE TABLE `Service_Provider` (
  `SP_id` int(11) NOT NULL,
  `Fname` varchar(30) NOT NULL,
  `Lname` varchar(30) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Phone` varchar(44) NOT NULL,
  `Area` varchar(44) NOT NULL,
  `Pass` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Admin`
--
ALTER TABLE `Admin`
  ADD PRIMARY KEY (`A_id`);

--
-- Indexes for table `Booking`
--
ALTER TABLE `Booking`
  ADD PRIMARY KEY (`S_id`,`C_id`),
  ADD KEY `C_id` (`C_id`);

--
-- Indexes for table `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`C_id`);

--
-- Indexes for table `Review`
--
ALTER TABLE `Review`
  ADD PRIMARY KEY (`R_id`),
  ADD KEY `C_id` (`C_id`),
  ADD KEY `S_id` (`S_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `services_belong_worker`
--
ALTER TABLE `services_belong_worker`
  ADD PRIMARY KEY (`sbw_id`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `worker_id` (`worker_id`);

--
-- Indexes for table `Service_Provider`
--
ALTER TABLE `Service_Provider`
  ADD PRIMARY KEY (`SP_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `services_belong_worker`
--
ALTER TABLE `services_belong_worker`
  MODIFY `sbw_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Booking`
--
ALTER TABLE `Booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`S_id`) REFERENCES `services` (`service_id`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`C_id`) REFERENCES `Customer` (`C_id`);

--
-- Constraints for table `Review`
--
ALTER TABLE `Review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`C_id`) REFERENCES `Customer` (`C_id`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`S_id`) REFERENCES `services` (`service_id`);

--
-- Constraints for table `services_belong_worker`
--
ALTER TABLE `services_belong_worker`
  ADD CONSTRAINT `services_belong_worker_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`),
  ADD CONSTRAINT `services_belong_worker_ibfk_2` FOREIGN KEY (`worker_id`) REFERENCES `Service_Provider` (`SP_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
