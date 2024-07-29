-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 23, 2024 at 11:11 AM
-- Server version: 5.7.23-23
-- PHP Version: 8.1.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `estesjkw_radiohoster`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `server_key` varchar(2500) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `username`, `password`, `server_key`, `create_at`) VALUES
(1, 'Admin', 'admin@email.com', '$2y$10$vrARjldXebr5mCZEAcSQIuwsLVc2TRzp2tlkkIkd2IC8MeuhqCBE6', 'dsad dsad sada', '2019-02-26 10:16:31');

-- --------------------------------------------------------

--
-- Table structure for table `applist`
--

CREATE TABLE `applist` (
  `id` int(11) NOT NULL,
  `app_name` varchar(255) NOT NULL,
  `radio_stream` varchar(255) NOT NULL,
  `tv_stream` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `whatsapp` varchar(255) NOT NULL,
  `youtube` varchar(255) NOT NULL,
  `twitter` varchar(255) NOT NULL,
  `instagram` varchar(255) NOT NULL,
  `facebook_id` varchar(255) NOT NULL,
  `admob_id` varchar(255) NOT NULL,
  `admob_banner_id` varchar(255) NOT NULL,
  `admob_interstitial_id` varchar(255) NOT NULL,
  `admob_native_id` varchar(255) NOT NULL,
  `start_color` varchar(255) NOT NULL,
  `end_color` varchar(255) NOT NULL,
  `cover_image` varchar(2500) NOT NULL,
  `background_image` varchar(2500) NOT NULL,
  `about_us` varchar(2500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `our_service` varchar(2500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `privacy_policy` varchar(255) NOT NULL,
  `song_request` varchar(255) NOT NULL,
  `message_us` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `applist`
--

INSERT INTO `applist` (`id`, `app_name`, `radio_stream`, `tv_stream`, `website`, `facebook`, `whatsapp`, `youtube`, `twitter`, `instagram`, `facebook_id`, `admob_id`, `admob_banner_id`, `admob_interstitial_id`, `admob_native_id`, `start_color`, `end_color`, `cover_image`, `background_image`, `about_us`, `our_service`, `privacy_policy`, `song_request`, `message_us`, `status`, `create_at`) VALUES
(1, 'RadioHD', 'https://english-ekamsoftware.radioca.st/stream', '', 'https://ekamsoftwares.com/', '', '919888880886', '', 'https://twitter.com/', 'https://www.instagram.com/', '', '', 'ca-app-pub-3940256099942544/9214589741', 'ca-app-pub-3940256099942544/1033173712', 'ca-app-pub-3940256099942544/2247696110', '#C56CD6', '#CC3333', 'uploads/banner/89526_FB_IMG_1720027222686.jpg', 'uploads/banner/27144_splash.jpg', 'We develop apps both for android and iOS mobile as well as apple and android TV along with website for your radio station. ', 'Complete IT solution.', 'https://sekhontech.com/privacy.html', 'https://webstests.com/radiohoster/songrequest.php', 'https://webstests.com/radiohoster/contactus.html', 1, '2022-12-03 05:15:31');

-- --------------------------------------------------------

--
-- Table structure for table `device_token`
--

CREATE TABLE `device_token` (
  `id` int(11) NOT NULL,
  `device_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `device_token` varchar(2500) COLLATE utf8_unicode_ci NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `device_token`
--

INSERT INTO `device_token` (`id`, `device_id`, `device_token`, `create_at`) VALUES
(1, 'jsoidsaiddjksjdklasdjskdjsal', 'hjskdsjdhask', '2024-07-22 14:37:22'),
(2, 'sgasfv', 'dfgwergfatg', '2024-07-22 15:05:35'),
(3, 'c3cec27913323efe', '', '2024-07-22 15:06:54'),
(4, 'a342cfad20571f6a', '', '2024-07-23 00:15:37');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_setting`
--

CREATE TABLE `tbl_setting` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `description` varchar(2500) NOT NULL,
  `tracking_id` varchar(255) NOT NULL,
  `address` varchar(2500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `host` varchar(2500) CHARACTER SET utf8 NOT NULL,
  `username` varchar(2500) CHARACTER SET utf8 NOT NULL,
  `password` varchar(2500) CHARACTER SET utf8 NOT NULL,
  `encryption` varchar(2500) CHARACTER SET utf8 NOT NULL,
  `port` varchar(255) NOT NULL,
  `reply_to` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_setting`
--

INSERT INTO `tbl_setting` (`id`, `title`, `logo`, `email`, `contact`, `description`, `tracking_id`, `address`, `host`, `username`, `password`, `encryption`, `port`, `reply_to`) VALUES
(1, 'RadioHD', 'uploads/logo/71548_IhvOOguaRwWMdd77L7SJKA.png', 'contacto@mundostreaming.cl', '56966921023', 'All major Indian FM radio stations ready for you to enjoy free music and much more.', 'fsdf fdsf sfdsfds', 'Santiago de Chile', 'smtp.gmail.com', 'ekamsoftwares1234@gmail.com', 'ekamsoftwares', 'tls', '465', 'no-reply@multibroadcast.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `applist`
--
ALTER TABLE `applist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `device_token`
--
ALTER TABLE `device_token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_setting`
--
ALTER TABLE `tbl_setting`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `applist`
--
ALTER TABLE `applist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `device_token`
--
ALTER TABLE `device_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_setting`
--
ALTER TABLE `tbl_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
