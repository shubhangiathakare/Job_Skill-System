-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 12, 2025 at 07:01 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jobskilldb`
--

-- --------------------------------------------------------

--
-- Table structure for table `applied_job`
--

CREATE TABLE `applied_job` (
  `id` int(11) NOT NULL,
  `appliedDate` varchar(255) DEFAULT NULL,
  `companyName` varchar(255) DEFAULT NULL,
  `jobId` int(11) NOT NULL,
  `jobSeekerEmail` varchar(255) DEFAULT NULL,
  `jobTitle` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `applied_job`
--

INSERT INTO `applied_job` (`id`, `appliedDate`, `companyName`, `jobId`, `jobSeekerEmail`, `jobTitle`, `location`, `status`) VALUES
(3, '2025-08-12', 'Google', 5, 'h@gmail.com', 'Ui Ux Designer', 'Shirpur', 'Accepted');

-- --------------------------------------------------------

--
-- Table structure for table `employer`
--

CREATE TABLE `employer` (
  `contact` double NOT NULL,
  `companyname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employer`
--

INSERT INTO `employer` (`contact`, `companyname`, `email`, `name`, `password`) VALUES
(1001299238, 'Microsoft', 'm@gmail.com', 'Mahima', '101'),
(1223344567, 'Google', 's@gmail.com', 'Shubhangi', '101');

-- --------------------------------------------------------

--
-- Table structure for table `job1`
--

CREATE TABLE `job1` (
  `id` int(11) NOT NULL,
  `companyName` varchar(255) DEFAULT NULL,
  `contact` double NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `postedBy` double NOT NULL,
  `salary` double NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `job1`
--

INSERT INTO `job1` (`id`, `companyName`, `contact`, `description`, `location`, `postedBy`, `salary`, `title`, `type`) VALUES
(4, 'Google', 1223344567, 'Needed Jr SDE for new posts for mananging improvement areas', 'Mumbai', 1223344567, 700000, 'Jr SDE', 'Full-time'),
(5, 'Google', 1223344567, 'Need UI UX designer for desiging beautiful clean UIs and Front End for a better user Experience', 'Shirpur', 1223344567, 200000, 'Ui Ux Designer', 'Contract');

-- --------------------------------------------------------

--
-- Table structure for table `job_seeker`
--

CREATE TABLE `job_seeker` (
  `email` varchar(255) NOT NULL,
  `contact` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `job_seeker`
--

INSERT INTO `job_seeker` (`email`, `contact`, `name`, `password`) VALUES
('h@gmail.com', 2233445566, 'Harshali', '112'),
('v@gmail.com', 1223344567, 'Vedant', '1122');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `applied_job`
--
ALTER TABLE `applied_job`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employer`
--
ALTER TABLE `employer`
  ADD PRIMARY KEY (`contact`);

--
-- Indexes for table `job1`
--
ALTER TABLE `job1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_seeker`
--
ALTER TABLE `job_seeker`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `applied_job`
--
ALTER TABLE `applied_job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `job1`
--
ALTER TABLE `job1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
