-- phpMyAdmin SQL Dump
-- version 4.6.6deb1+deb.cihar.com~xenial.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 14, 2018 at 08:55 PM
-- Server version: 5.7.24-0ubuntu0.16.04.1
-- PHP Version: 5.6.39-1+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `booking`
--

-- --------------------------------------------------------

--
-- Table structure for table `{prefix}_category`
--

CREATE TABLE `{prefix}_category` (
  `id` int(11) UNSIGNED NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `topic` varchar(128) CHARACTER SET utf8 NOT NULL,
  `color` varchar(16) CHARACTER SET utf8 NOT NULL,
  `published` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `{prefix}_category`
--

INSERT INTO `{prefix}_category` (`id`, `type`, `category_id`, `topic`, `color`, `published`) VALUES
(46, 'department', 1, 'บริหาร', '', 0),
(47, 'department', 2, 'จัดซื้อจัดจ้าง', '', 0),
(48, 'department', 3, 'บุคคล', '', 0),
(53, 'use', 1, 'ประชุม', '', 0),
(54, 'use', 2, 'สัมนา', '', 0),
(55, 'use', 3, 'จัดเลี้ยง', '', 0),
(42, 'accessories', 4, 'ของว่าง', '', 0),
(41, 'accessories', 3, 'เครื่องฉายแผ่นใส', '', 0),
(40, 'accessories', 2, 'จอโปรเจ็คเตอร์', '', 0),
(39, 'accessories', 1, 'เครื่องคอมพิวเตอร์', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `{prefix}_language`
--

CREATE TABLE `{prefix}_language` (
  `id` int(11) NOT NULL,
  `key` text COLLATE utf8_unicode_ci NOT NULL,
  `la` text COLLATE utf8_unicode_ci,
  `th` text COLLATE utf8_unicode_ci,
  `en` text COLLATE utf8_unicode_ci,
  `owner` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `js` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `{prefix}_reservation`
--

CREATE TABLE `{prefix}_reservation` (
  `id` int(11) UNSIGNED NOT NULL,
  `room_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `topic` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `attendees` int(11) NOT NULL,
  `begin` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `{prefix}_reservation_data`
--

CREATE TABLE `{prefix}_reservation_data` (
  `reservation_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `value` varchar(150) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `{prefix}_rooms`
--

CREATE TABLE `{prefix}_rooms` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `detail` text COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `published` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `{prefix}_rooms`
--

INSERT INTO `{prefix}_rooms` (`id`, `name`, `detail`, `color`, `published`) VALUES
(1, 'ห้องประชุม 2', 'ห้องประชุมพร้อมระบบ Video conference\r\nที่นั่งผู้เข้าร่วมประชุม รูปตัว U 2 แถว', '', 1),
(2, 'ห้องประชุม 1', 'ห้องประชุมขนาดใหญ่\r\nพร้อมสิ่งอำนวยความสะดวกครบครัน', '', 1),
(3, 'ห้องประชุมส่วนเทคโนโลยีสารสนเทศ', 'ห้องประชุมขนาดใหญ่ (Hall)\r\nเหมาะสำรับการสัมนาเป็นหมู่คณะ และ จัดเลี้ยง', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `{prefix}_rooms_meta`
--

CREATE TABLE `{prefix}_rooms_meta` (
  `room_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `value` varchar(150) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `{prefix}_rooms_meta`
--

INSERT INTO `{prefix}_rooms_meta` (`room_id`, `name`, `value`) VALUES
(2, 'seats', '20 ที่นั่ง'),
(2, 'number', 'R-0001'),
(2, 'building', 'อาคาร 1'),
(1, 'number', 'R-0002'),
(1, 'seats', '50 ที่นั่ง รูปตัว U'),
(1, 'building', 'อาคาร 2'),
(3, 'building', 'โรงอาหาร'),
(3, 'seats', '100 คน');

-- --------------------------------------------------------

--
-- Table structure for table `{prefix}_user`
--

CREATE TABLE `{prefix}_user` (
  `id` int(11) UNSIGNED NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `salt` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `permission` text COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `sex` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_card` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provinceID` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zipcode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visited` int(11) UNSIGNED DEFAULT '0',
  `lastvisited` int(11) DEFAULT NULL,
  `session_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `social` tinyint(1) NOT NULL DEFAULT '0',
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `province` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `{prefix}_user`
--

INSERT INTO `{prefix}_user` (`id`, `username`, `salt`, `password`, `token`, `status`, `permission`, `name`, `sex`, `id_card`, `address`, `phone`, `provinceID`, `zipcode`, `visited`, `lastvisited`, `session_id`, `ip`, `create_date`, `active`, `social`, `email`, `website`, `country`, `province`) VALUES
(1, 'admin@localhost', '5c13b493b9141', '558b445aeb6fdf6f37cd99f68aa3679dbd8ae31f', '07de192907ec4f969827cfa9b929948cb78f7225', 1, ',can_config,can_manage_room,can_approve_room,', 'แอดมิน', 'm', '', '1 หมู่ 1 ตำบล ลาดหญ้า อำเภอ เมือง', '08080808', '102', '71190', 0, 0, '', '::1', NOW(), 1, 0, NULL, NULL, 'TH', ''),
(2, 'demo@localhost', '5c13b4c610781', 'd61303ebed15f6448dd3ebadd7e416b5350b4d1d', 'c53cf07e732420d3ba7f69970e075eca37188198', 0, '', 'ตัวอย่าง', 'f', '', '', '0123456788', '102', '', 0, 0, '', '::1', NOW(), 1, 0, NULL, NULL, 'LA', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `{prefix}_category`
--
ALTER TABLE `{prefix}_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `{prefix}_language`
--
ALTER TABLE `{prefix}_language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `{prefix}_reservation`
--
ALTER TABLE `{prefix}_reservation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `{prefix}_rooms`
--
ALTER TABLE `{prefix}_rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `{prefix}_rooms_meta`
--
ALTER TABLE `{prefix}_rooms_meta`
  ADD KEY `room_id` (`room_id`) USING BTREE;

--
-- Indexes for table `{prefix}_user`
--
ALTER TABLE `{prefix}_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `{prefix}_category`
--
ALTER TABLE `{prefix}_category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `{prefix}_language`
--
ALTER TABLE `{prefix}_language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `{prefix}_reservation`
--
ALTER TABLE `{prefix}_reservation`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `{prefix}_reservation_data`
--
ALTER TABLE `{prefix}_reservation_data`
  ADD KEY `reservation_id` (`reservation_id`) USING BTREE;

--
-- AUTO_INCREMENT for table `{prefix}_rooms`
--
ALTER TABLE `{prefix}_rooms`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `{prefix}_user`
--
ALTER TABLE `{prefix}_user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;