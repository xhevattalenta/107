-- phpMyAdmin SQL Dump
-- version 4.0.10.18
-- https://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Dec 11, 2017 at 04:49 AM
-- Server version: 5.6.36-cll-lve
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `107`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `btn_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `btn_type`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Lajmërim', 'category-1', 'success', '2017-11-07 06:40:04', '2017-11-08 10:56:23'),
(2, NULL, 2, 'Njoftim', 'category-2', 'danger', '2017-11-07 06:40:04', '2017-11-13 13:22:25'),
(3, NULL, 2, 'Projekt', 'projekt', 'info', '2017-11-09 08:07:31', '2017-11-13 13:22:30');

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE IF NOT EXISTS `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=71 ;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(3, 1, 'category_id', 'text', 'Category', 0, 1, 1, 1, 1, 0, NULL, 3),
(4, 1, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(5, 1, 'excerpt', 'text_area', 'excerpt', 0, 0, 1, 1, 1, 1, NULL, 5),
(6, 1, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(7, 1, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{"resize":{"width":"1000","height":"null"},"quality":"70%","upsize":true,"thumbnails":[{"name":"medium","scale":"50%"},{"name":"small","scale":"25%"},{"name":"cropped","crop":{"width":"300","height":"250"}}]}', 7),
(8, 1, 'slug', 'text', 'slug', 1, 0, 1, 1, 1, 1, '{"slugify":{"origin":"title","forceUpdate":true}}', 8),
(9, 1, 'meta_description', 'text_area', 'meta_description', 0, 0, 1, 1, 1, 1, NULL, 9),
(10, 1, 'meta_keywords', 'text_area', 'meta_keywords', 0, 0, 1, 1, 1, 1, NULL, 10),
(11, 1, 'status', 'select_dropdown', 'status', 1, 1, 1, 1, 1, 1, '{"default":"DRAFT","options":{"PUBLISHED":"published","DRAFT":"draft","PENDING":"pending"}}', 11),
(12, 1, 'created_at', 'timestamp', 'created_at', 0, 1, 1, 0, 0, 0, NULL, 12),
(13, 1, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, NULL, 13),
(14, 2, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '', 1),
(15, 2, 'author_id', 'text', 'author_id', 1, 0, 0, 0, 0, 0, '', 2),
(16, 2, 'title', 'text', 'title', 1, 1, 1, 1, 1, 1, '', 3),
(17, 2, 'excerpt', 'text_area', 'excerpt', 1, 0, 1, 1, 1, 1, '', 4),
(18, 2, 'body', 'rich_text_box', 'body', 1, 0, 1, 1, 1, 1, '', 5),
(19, 2, 'slug', 'text', 'slug', 1, 0, 1, 1, 1, 1, '{"slugify":{"origin":"title"}}', 6),
(20, 2, 'meta_description', 'text', 'meta_description', 1, 0, 1, 1, 1, 1, '', 7),
(21, 2, 'meta_keywords', 'text', 'meta_keywords', 1, 0, 1, 1, 1, 1, '', 8),
(22, 2, 'status', 'select_dropdown', 'status', 1, 1, 1, 1, 1, 1, '{"default":"INACTIVE","options":{"INACTIVE":"INACTIVE","ACTIVE":"ACTIVE"}}', 9),
(23, 2, 'created_at', 'timestamp', 'created_at', 1, 1, 1, 0, 0, 0, '', 10),
(24, 2, 'updated_at', 'timestamp', 'updated_at', 1, 0, 0, 0, 0, 0, '', 11),
(25, 2, 'image', 'image', 'image', 0, 1, 1, 1, 1, 1, '', 12),
(26, 3, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '', 1),
(27, 3, 'name', 'text', 'name', 1, 1, 1, 1, 1, 1, '', 2),
(28, 3, 'email', 'text', 'email', 1, 1, 1, 1, 1, 1, '', 3),
(29, 3, 'password', 'password', 'password', 0, 0, 0, 1, 1, 0, '', 4),
(30, 3, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsTo","column":"role_id","key":"id","label":"name","pivot_table":"roles","pivot":"0"}', 10),
(31, 3, 'remember_token', 'text', 'remember_token', 0, 0, 0, 0, 0, 0, '', 5),
(32, 3, 'created_at', 'timestamp', 'created_at', 0, 1, 1, 0, 0, 0, '', 6),
(33, 3, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '', 7),
(34, 3, 'avatar', 'image', 'avatar', 0, 1, 1, 1, 1, 1, '', 8),
(35, 5, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '', 1),
(36, 5, 'name', 'text', 'name', 1, 1, 1, 1, 1, 1, '', 2),
(37, 5, 'created_at', 'timestamp', 'created_at', 0, 0, 0, 0, 0, 0, '', 3),
(38, 5, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '', 4),
(39, 4, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, NULL, 1),
(40, 4, 'parent_id', 'select_dropdown', 'parent_id', 0, 0, 1, 1, 1, 1, '{"default":"","null":"","options":{"":"-- None --"},"relationship":{"key":"id","label":"name"}}', 2),
(41, 4, 'order', 'text', 'order', 1, 1, 1, 1, 1, 1, '{"default":1}', 3),
(42, 4, 'name', 'text', 'name', 1, 1, 1, 1, 1, 1, NULL, 4),
(43, 4, 'slug', 'text', 'slug', 1, 1, 1, 1, 1, 1, '{"slugify":{"origin":"name"}}', 5),
(44, 4, 'created_at', 'timestamp', 'created_at', 0, 0, 1, 0, 0, 0, NULL, 6),
(45, 4, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, NULL, 7),
(46, 6, 'id', 'number', 'id', 1, 1, 0, 0, 0, 0, NULL, 1),
(47, 6, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(48, 6, 'created_at', 'timestamp', 'created_at', 0, 0, 0, 0, 0, 0, NULL, 3),
(49, 6, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, NULL, 4),
(50, 6, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(51, 1, 'seo_title', 'text', 'seo_title', 0, 1, 1, 1, 1, 1, NULL, 14),
(52, 1, 'featured', 'checkbox', 'featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(53, 3, 'role_id', 'text', 'role_id', 1, 1, 1, 1, 1, 1, '', 9),
(54, 7, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(55, 7, 'name', 'text', 'Emri dhe Mbiemri', 0, 1, 1, 1, 1, 1, NULL, 2),
(56, 7, 'tel', 'text', 'Telefoni', 0, 1, 1, 1, 1, 1, NULL, 3),
(57, 7, 'image', 'image', 'Foto', 0, 1, 1, 1, 1, 1, NULL, 4),
(58, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 5),
(59, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 6),
(60, 7, 'anetar', 'radio_btn', 'Anetar', 1, 1, 1, 1, 1, 1, '{"default":"1","options":{"0":"Jo","1":"Po"}}', 5),
(61, 8, 'id', 'number', 'Id', 1, 1, 0, 0, 0, 0, NULL, 1),
(62, 8, 'member_id', 'text', 'Member Id', 1, 1, 1, 1, 1, 1, NULL, 2),
(63, 8, 'kontributi', 'text', 'Kontributi', 0, 1, 1, 1, 1, 1, NULL, 3),
(64, 8, 'details', 'text', 'Detajet', 0, 1, 1, 1, 1, 1, NULL, 4),
(65, 8, 'vlera', 'number', 'Vlera', 0, 1, 1, 1, 1, 1, NULL, 5),
(66, 8, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 6),
(67, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(68, 8, 'input_belongsto_member_relationship', 'relationship', 'members', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Member","table":"members","type":"belongsTo","column":"member_id","key":"id","label":"name","pivot_table":"categories","pivot":"0"}', 8),
(69, 8, 'data', 'timestamp', 'Data', 1, 1, 1, 1, 1, 1, NULL, 6),
(70, 4, 'btn_type', 'radio_btn', 'Btn Type', 0, 1, 1, 1, 1, 1, '{"default":"success","options":{"success":"Njoftim","danger":"Lajme","info":"Projekt"}}', 6);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE IF NOT EXISTS `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `created_at`, `updated_at`) VALUES
(1, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', NULL, NULL, 1, 0, '2017-12-05 09:36:59', '2017-12-07 14:07:23'),
(2, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, '2017-12-05 09:37:00', '2017-12-05 09:37:00'),
(3, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', '', '', 1, 0, '2017-12-05 09:37:00', '2017-12-05 09:37:00'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, NULL, NULL, 1, 0, '2017-12-05 09:37:00', '2017-12-07 14:05:10'),
(5, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, '2017-12-05 09:37:00', '2017-12-05 09:37:00'),
(6, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, NULL, NULL, 1, 0, '2017-12-05 09:37:00', '2017-12-05 10:46:18'),
(7, 'members', 'members', 'Member', 'Members', NULL, 'App\\Member', NULL, NULL, NULL, 1, 0, '2017-12-06 07:55:37', '2017-12-06 07:55:37'),
(8, 'inputs', 'inputs', 'Input', 'Inputs', NULL, 'App\\Input', NULL, NULL, NULL, 1, 0, '2017-12-06 11:49:14', '2017-12-06 11:49:14');

-- --------------------------------------------------------

--
-- Table structure for table `inputs`
--

CREATE TABLE IF NOT EXISTS `inputs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `kontributi` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `details` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vlera` decimal(10,0) DEFAULT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=104 ;

--
-- Dumping data for table `inputs`
--

INSERT INTO `inputs` (`id`, `member_id`, `kontributi`, `details`, `vlera`, `data`, `created_at`, `updated_at`) VALUES
(1, 1, 'Anëtarsim', NULL, '100', '2017-11-05 07:00:00', '2017-12-08 21:55:02', '2017-12-08 21:55:02'),
(2, 1, 'Anëtarsim', NULL, '1500', '2017-11-28 07:00:00', '2017-12-08 21:55:24', '2017-12-08 21:55:24'),
(3, 1, 'Kontribut', 'Domain per 1 vjet\r\n1000 denar', NULL, '2017-12-09 16:51:40', '2017-12-08 22:01:03', '2017-12-09 23:51:40'),
(4, 2, 'Anëtarsim', NULL, '1200', '2017-11-05 07:00:00', '2017-12-08 22:14:36', '2017-12-08 22:14:36'),
(5, 3, 'Antarsim', NULL, '1220', '2017-11-05 07:00:00', '2017-12-09 03:58:04', '2017-12-09 03:58:04'),
(6, 6, 'Antarsim', NULL, '100', '2017-11-05 07:00:00', '2017-12-09 03:58:43', '2017-12-09 03:58:43'),
(7, 7, 'Antarsim', NULL, '100', '2017-11-05 07:00:00', '2017-12-09 03:59:06', '2017-12-09 03:59:06'),
(8, 8, 'Antarsim', NULL, '100', '2017-11-05 07:00:00', '2017-12-09 03:59:32', '2017-12-09 03:59:32'),
(9, 9, 'Antarsim', NULL, '100', '2017-11-05 07:00:00', '2017-12-09 03:59:52', '2017-12-09 03:59:52'),
(10, 10, 'Antarsim', NULL, '610', '2017-11-05 07:00:00', '2017-12-09 04:00:16', '2017-12-09 04:00:16'),
(11, 11, 'Antarsim', NULL, '100', '2017-12-05 07:00:00', '2017-12-09 04:00:40', '2017-12-09 04:00:40'),
(12, 12, 'Antarsim', NULL, '600', '2017-11-05 07:00:00', '2017-12-09 04:00:59', '2017-12-09 04:00:59'),
(13, 13, 'Antarsim', NULL, '100', '2017-11-05 07:00:00', '2017-12-09 04:01:15', '2017-12-09 04:01:15'),
(14, 14, 'Antarsim', NULL, '100', '2017-11-05 07:00:00', '2017-12-09 04:01:42', '2017-12-09 04:01:42'),
(15, 15, 'Antarsim', NULL, '500', '2017-11-05 07:00:00', '2017-12-09 04:02:05', '2017-12-09 04:02:05'),
(16, 16, 'Antarsim', NULL, '100', '2017-11-05 07:00:00', '2017-12-09 04:02:24', '2017-12-09 04:02:24'),
(17, 17, 'Antarsim', NULL, '100', '2017-11-05 07:00:00', '2017-12-09 04:02:42', '2017-12-09 04:02:42'),
(18, 18, 'Antarsim', NULL, '100', '2017-11-05 07:00:00', '2017-12-09 04:03:07', '2017-12-09 04:03:07'),
(19, 19, 'Antarsim', NULL, '200', '2017-11-05 07:00:00', '2017-12-09 04:03:47', '2017-12-09 04:03:47'),
(20, 20, 'Antarsim', NULL, '100', '2017-11-05 07:00:00', '2017-12-09 04:04:10', '2017-12-09 04:04:10'),
(21, 21, 'Antarsim', NULL, '100', '2017-11-05 07:00:00', '2017-12-09 04:04:30', '2017-12-09 04:04:30'),
(22, 22, 'Antarsim', NULL, '610', '2017-11-05 07:00:00', '2017-12-09 04:04:56', '2017-12-09 04:04:56'),
(23, 23, 'Antarsim', NULL, '100', '2017-11-05 07:00:00', '2017-12-09 04:05:18', '2017-12-09 04:05:18'),
(24, 24, 'Antarsim', NULL, '100', '2017-11-05 07:00:00', '2017-12-09 04:05:37', '2017-12-09 04:05:37'),
(25, 66, 'Antarsim', NULL, '500', '2017-11-05 07:00:00', '2017-12-09 04:09:53', '2017-12-09 04:09:53'),
(26, 29, 'Antarsim', NULL, '100', '2017-11-05 07:00:00', '2017-12-09 04:10:22', '2017-12-09 04:10:22'),
(27, 30, 'Antarsim', NULL, '100', '2017-11-05 07:00:00', '2017-12-09 04:10:49', '2017-12-09 04:10:49'),
(28, 31, 'Antarsim', NULL, '200', '2017-11-05 07:00:00', '2017-12-09 04:11:10', '2017-12-09 04:11:10'),
(29, 32, 'Antarsim', NULL, '100', '2017-11-05 07:00:00', '2017-12-09 04:12:02', '2017-12-09 04:12:02'),
(30, 33, 'Antarsim', NULL, '100', '2017-11-05 07:00:00', '2017-12-09 04:12:26', '2017-12-09 04:12:26'),
(31, 34, 'Antarsim', NULL, '1220', '2017-11-05 07:00:00', '2017-12-09 04:12:57', '2017-12-09 04:12:57'),
(32, 35, 'Antarsim', NULL, '1220', '2017-11-05 07:00:00', '2017-12-09 04:13:21', '2017-12-09 04:13:21'),
(33, 36, 'Antarsim', NULL, '100', '2017-11-05 07:00:00', '2017-12-09 04:13:50', '2017-12-09 04:13:50'),
(34, 37, 'Antarsim', NULL, '1220', '2017-11-05 07:00:00', '2017-12-09 04:14:10', '2017-12-09 04:14:10'),
(35, 38, 'Antarsim', NULL, '300', '2017-11-05 07:00:00', '2017-12-09 04:14:36', '2017-12-09 04:14:36'),
(36, 39, 'Antarsim', NULL, '1500', '2017-11-05 07:00:00', '2017-12-09 04:14:56', '2017-12-09 04:14:56'),
(37, 40, 'Antarsim', NULL, '400', '2017-11-05 07:00:00', '2017-12-09 04:15:16', '2017-12-09 04:15:16'),
(38, 43, 'Antarsim', NULL, '1000', '2017-11-05 07:00:00', '2017-12-09 04:16:01', '2017-12-09 04:16:01'),
(39, 44, 'Antarsim', NULL, '100', '2017-11-05 07:00:00', '2017-12-09 04:16:20', '2017-12-09 04:16:20'),
(40, 45, 'Antarsim', NULL, '1220', '2017-11-05 07:00:00', '2017-12-09 04:16:36', '2017-12-09 04:16:36'),
(41, 46, 'Antarsim', NULL, '1220', '2017-11-05 07:00:00', '2017-12-09 04:17:01', '2017-12-09 04:17:01'),
(42, 51, 'Antarsim', NULL, '200', '2017-11-05 07:00:00', '2017-12-09 04:17:31', '2017-12-09 04:17:31'),
(43, 53, 'Antarsim', NULL, '1220', '2017-11-05 07:00:00', '2017-12-09 04:17:53', '2017-12-09 04:17:53'),
(44, 60, 'Antarsim', NULL, '100', '2017-11-05 07:00:00', '2017-12-09 04:18:40', '2017-12-09 04:18:40'),
(45, 64, 'Antarsim', NULL, '100', '2017-11-05 07:00:00', '2017-12-09 04:19:01', '2017-12-09 04:19:01'),
(46, 67, 'Antarsim', NULL, '1220', '2017-11-29 07:00:00', '2017-12-09 04:22:39', '2017-12-09 04:22:39'),
(47, 68, 'Antarsim', NULL, '1220', '2017-12-05 07:00:00', '2017-12-09 04:23:40', '2017-12-09 04:23:40'),
(48, 69, 'Antarsim', NULL, '1200', '2017-12-05 07:00:00', '2017-12-09 04:24:23', '2017-12-09 04:24:23'),
(49, 49, 'Antarsim', NULL, '1220', '2017-11-19 07:00:00', '2017-12-09 04:25:06', '2017-12-09 04:25:06'),
(50, 32, 'Antarsim', NULL, '1220', '2017-11-19 07:00:00', '2017-12-09 04:25:34', '2017-12-09 04:25:34'),
(51, 4, 'Antarsim', NULL, '300', '2017-11-16 07:00:00', '2017-12-09 04:26:09', '2017-12-09 04:26:09'),
(52, 21, 'Antarsim', NULL, '1500', '2017-11-16 07:00:00', '2017-12-09 04:26:37', '2017-12-09 04:26:37'),
(53, 70, 'Kontribut', NULL, '500', '2017-12-07 07:00:00', '2017-12-09 04:28:41', '2017-12-09 04:28:41'),
(54, 71, 'Kontribut', NULL, '3000', '2017-12-07 07:00:00', '2017-12-09 04:29:46', '2017-12-09 04:29:46'),
(55, 72, 'Antarsim', NULL, '4000', '2017-11-20 07:00:00', '2017-12-09 04:31:25', '2017-12-09 04:31:25'),
(56, 50, 'Antarsim', NULL, '1210', '2017-11-20 07:00:00', '2017-12-09 04:32:10', '2017-12-09 04:32:10'),
(57, 44, 'Antarsim', NULL, '200', '2017-12-06 07:00:00', '2017-12-09 04:32:45', '2017-12-09 04:32:45'),
(58, 73, 'Kontribut', NULL, '1000', '2017-11-16 07:00:00', '2017-12-09 04:34:21', '2017-12-09 04:34:21'),
(59, 14, 'Antarsim', NULL, '1100', '2017-11-15 07:00:00', '2017-12-09 04:34:43', '2017-12-09 04:34:43'),
(60, 7, 'Antarsim', NULL, '1100', '2017-11-15 07:00:00', '2017-12-09 04:35:05', '2017-12-09 04:35:05'),
(61, 74, 'Kontribut', NULL, '3070', '2017-11-17 07:00:00', '2017-12-09 04:36:31', '2017-12-09 04:36:31'),
(62, 75, 'Kontribut', NULL, '9200', '2017-11-16 07:00:00', '2017-12-09 04:37:46', '2017-12-09 04:37:46'),
(63, 76, 'Kontribut', NULL, '1000', '2017-12-01 07:00:00', '2017-12-09 04:46:07', '2017-12-09 04:46:07'),
(64, 76, 'Kontribut', '20 Pije Per Puntoret', NULL, '2017-12-01 07:00:00', '2017-12-09 04:47:02', '2017-12-09 04:47:02'),
(65, 1, 'Kontribut', 'Ilmi Ismaili', '1000', '2017-12-01 07:00:00', '2017-12-09 04:47:44', '2017-12-09 04:47:44'),
(66, 77, 'Kontribut', NULL, '6140', '2017-12-01 07:00:00', '2017-12-09 04:48:44', '2017-12-09 04:48:44'),
(67, 20, 'Kontribut', '1000 den pagesen e traktorit', NULL, '2017-11-19 07:00:00', '2017-12-09 04:49:47', '2017-12-09 04:49:47'),
(68, 35, 'Kontribut', 'per femij', '500', '2017-11-19 07:00:00', '2017-12-09 04:50:35', '2017-12-09 04:50:35'),
(69, 1, 'Kontribut', 'Hosting per 1 vjet 3000 denar', NULL, '2017-12-09 16:53:18', '2017-12-09 04:51:30', '2017-12-09 23:53:18'),
(70, 78, 'Kontribut', NULL, '3000', '2017-11-05 07:00:00', '2017-12-09 04:54:33', '2017-12-09 04:54:33'),
(71, 1, 'Kontribut', 'Puntorit Idea Park 600 den', NULL, '2017-12-01 07:00:00', '2017-12-09 05:25:24', '2017-12-09 05:25:24'),
(72, 39, 'Kontribut', 'Ngjyrat e shportave Ne emer te Saqip Pajaziti 6080 den', NULL, '2017-12-14 07:00:00', '2017-12-09 05:27:06', '2017-12-09 05:27:06'),
(73, 39, 'Kontribut', 'Doreza 400 pal 520 den', NULL, '2017-11-12 07:00:00', '2017-12-09 05:29:37', '2017-12-09 05:29:37'),
(74, 39, 'Kontribut', 'Pergatitja dhe Ngjyrosija e 11 shportave', NULL, '2017-11-12 07:00:00', '2017-12-09 05:31:28', '2017-12-09 05:31:28'),
(75, 39, 'Kontribut', 'Pergaditija dhe ngjyrosija e 13 shportave', NULL, '2017-12-05 07:00:00', '2017-12-09 05:32:25', '2017-12-09 05:32:25'),
(77, 39, 'Kontribut', '12 Shtepiza te zogjve 7466 den', NULL, '2017-12-09 21:23:11', '2017-12-09 05:35:19', '2017-12-10 04:23:11'),
(78, 39, 'Kontribut', 'Puntori I idea park 500 den', NULL, '2017-12-01 07:00:00', '2017-12-09 05:35:58', '2017-12-09 05:35:58'),
(79, 66, 'Kontribut', '2 meditije te puntorit 40 euro', NULL, '2017-12-01 07:00:00', '2017-12-09 05:37:12', '2017-12-09 05:37:12'),
(80, 66, 'Kontribut', '20 m2 bekatona + rere 100 euro', NULL, '2017-11-19 07:00:00', '2017-12-09 05:39:42', '2017-12-09 05:39:42'),
(81, 66, 'Kontribut', '2 meditije puntori', NULL, '2017-11-19 07:00:00', '2017-12-09 05:40:30', '2017-12-09 05:40:30'),
(82, 34, 'Kontribut', '2 plaka aluband per shenjat 100 euro', NULL, '2017-11-19 07:00:00', '2017-12-09 05:41:13', '2017-12-09 05:41:13'),
(83, 34, 'Kontribut', 'Kulmet e shtepizave per zogjt', NULL, '2017-12-07 07:00:00', '2017-12-09 05:42:03', '2017-12-09 05:42:03'),
(84, 37, 'Kontribut', 'realizimin e shenjave 200 euro', NULL, '2017-11-19 07:00:00', '2017-12-09 05:42:54', '2017-12-09 05:42:54'),
(85, 79, 'Kontribut', 'Realizimin dhe programimin e web faqes\r\n1050 euro', NULL, '2017-12-08 07:00:00', '2017-12-09 05:45:00', '2017-12-09 05:45:00'),
(86, 59, 'Antarsim', NULL, '1200', '2017-11-15 07:00:00', '2017-12-09 05:53:05', '2017-12-09 05:53:05'),
(87, 63, 'Antarsim', NULL, '1220', '2017-11-21 07:00:00', '2017-12-09 05:56:01', '2017-12-09 05:56:01'),
(88, 80, 'Antarsim', NULL, '1200', '2017-11-18 07:00:00', '2017-12-09 05:57:34', '2017-12-09 05:57:34'),
(89, 51, 'Antarsim', NULL, '500', '2017-12-08 07:00:00', '2017-12-09 05:57:54', '2017-12-09 05:57:54'),
(90, 39, 'Kontribut', 'Mbajtset e pasqyrave Ovale', NULL, '2017-11-11 07:00:00', '2017-12-09 06:04:56', '2017-12-09 06:04:56'),
(91, 81, 'Kontribut', NULL, '500', '2017-11-19 07:00:00', '2017-12-09 06:07:03', '2017-12-09 06:07:03'),
(92, 22, 'Antarsim', NULL, '610', '2017-11-19 07:00:00', '2017-12-09 06:18:33', '2017-12-09 06:18:33'),
(93, 50, 'Kontribut', '1 pako me tortelina dhe 1 pako me lengje per femijet', NULL, '2017-11-12 07:00:00', '2017-12-09 06:20:12', '2017-12-09 06:20:12'),
(94, 66, 'Kontribut', '1100 den per reren e pengesave te dyta', NULL, '2017-12-03 07:00:00', '2017-12-09 17:07:26', '2017-12-09 17:07:26'),
(95, 78, 'Kontribut', NULL, '10000', '2017-12-09 07:00:00', '2017-12-10 03:13:11', '2017-12-10 03:13:11'),
(97, 16, 'Antarsim', NULL, '300', '2017-12-09 07:00:00', '2017-12-10 03:14:44', '2017-12-10 03:14:44'),
(98, 35, 'Kontribut', 'Pagesen e kamionit te bekatonave 1000 den', NULL, '2017-11-19 07:00:00', '2017-12-10 03:16:27', '2017-12-10 03:16:27'),
(99, 61, 'Kontribut', 'Pergatitijen e ARKA PRANOI 610 den', NULL, '2017-11-20 07:00:00', '2017-12-10 03:26:44', '2017-12-10 03:26:44'),
(100, 44, 'antarsim', NULL, '900', '2017-12-10 07:00:00', '2017-12-11 03:27:17', '2017-12-11 03:27:17'),
(101, 44, 'kontribut', 'Satki Ismaili', '2100', '2017-12-10 07:00:00', '2017-12-11 03:28:10', '2017-12-11 03:28:10'),
(102, 9, 'Antarsim', NULL, '300', '2017-12-10 07:00:00', '2017-12-11 03:29:52', '2017-12-11 03:29:52'),
(103, 21, 'Kontribut', NULL, '400', '2017-12-10 07:00:00', '2017-12-11 03:33:40', '2017-12-11 03:33:40');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE IF NOT EXISTS `members` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8_unicode_ci DEFAULT 'users/default.png',
  `anetar` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=82 ;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `name`, `tel`, `image`, `anetar`, `created_at`, `updated_at`) VALUES
(1, 'Nagip Ismaili', '071 380 702', 'user/December2017/13335789_1191253554228097_6752554083007951861_n.jpg', 1, '2017-12-08 21:52:38', '2017-12-08 21:52:38'),
(2, 'Emin Bejtulla', '071 356 068', 'user/December2017/eme.jpg', 1, '2017-12-08 22:12:26', '2017-12-10 02:00:49'),
(3, 'Xhevat Ismaili', '071 803 428', 'user/December2017/20622121_2017232931635762_8640812185649651642_n(1).jpg', 1, '2017-12-09 00:31:44', '2017-12-09 00:31:44'),
(4, 'Burim Bakiu', '071 275 980', 'user/December2017/bbbb.jpg', 1, '2017-12-09 00:34:06', '2017-12-09 00:34:06'),
(5, 'Riat Bejtullai', '071 542 522', 'user/December2017/rriki.jpg', 1, '2017-12-09 00:40:33', '2017-12-09 00:40:33'),
(6, 'Liman Ademi', '070 686 902', 'user/December2017/lim.jpg', 1, '2017-12-09 00:42:30', '2017-12-09 00:42:30'),
(7, 'Afrim Aliti', '071 720 214', 'users/default.png', 1, '2017-12-09 00:43:37', '2017-12-09 00:43:37'),
(8, 'Bashkim Selmani', '070 532 224', 'users/default.png', 1, '2017-12-09 00:46:25', '2017-12-09 00:46:25'),
(9, 'Xhabir Bejtullai', '072 545 600', 'user/December2017/xhoko.jpg', 1, '2017-12-09 00:48:19', '2017-12-09 00:48:19'),
(10, 'Ali Sherifi', '071 539 224', 'user/December2017/ALI S.jpg', 1, '2017-12-09 00:49:48', '2017-12-09 00:49:48'),
(11, 'Qani Bejtullai', '071649 328', 'users/default.png', 1, '2017-12-09 00:51:05', '2017-12-09 00:51:05'),
(12, 'Naser Jonuzi', '070 616 075', 'user/December2017/celi.jpg', 1, '2017-12-09 00:52:13', '2017-12-09 00:52:13'),
(13, 'Latif Bejtullai', '070 569 165', 'users/default.png', 1, '2017-12-09 02:01:27', '2017-12-09 02:01:27'),
(14, 'Xhengiz Ademi', '072 666 750', 'user/December2017/xhen.jpg', 1, '2017-12-09 02:03:26', '2017-12-09 02:03:26'),
(15, 'Qëndrim Zendeli', '071 718 796', 'users/default.png', 1, '2017-12-09 02:05:04', '2017-12-09 23:48:13'),
(16, 'ismail Ismaili', '072 587 004', 'users/default.png', 1, '2017-12-09 02:06:27', '2017-12-09 23:49:15'),
(17, 'Murat Selmani', '000 000', 'users/default.png', 1, '2017-12-09 02:08:37', '2017-12-09 02:08:37'),
(18, 'Memet Abdiu', '070 686 424', 'users/default.png', 1, '2017-12-09 02:09:18', '2017-12-09 02:09:18'),
(19, 'Duli Abdiu', '000 000', 'users/default.png', 1, '2017-12-09 02:09:53', '2017-12-09 02:09:53'),
(20, 'Ali Aliu', '078 227 406', 'user/December2017/alll.jpg', 1, '2017-12-09 02:10:55', '2017-12-09 02:10:55'),
(21, 'Gazmend Ismaili', '070 828 843', 'user/December2017/21271037_1978990132317333_6773792703090478894_n.jpg', 1, '2017-12-09 02:13:16', '2017-12-09 02:13:16'),
(22, 'Ilmi Aliu', '078 210 120', 'user/December2017/ilmi.jpg', 1, '2017-12-09 02:15:12', '2017-12-09 02:15:12'),
(23, 'Muhamed Pajaziti', '070 553 591', 'user/December2017/mujo.jpg', 1, '2017-12-09 02:16:54', '2017-12-09 02:16:54'),
(24, 'Sinan Abdurraimi', '072 788 833', 'user/December2017/nani.jpg', 1, '2017-12-09 02:17:57', '2017-12-09 02:17:57'),
(28, 'Xhevit Abdurraimi', '071 777 246', 'users/default.png', 1, '2017-12-09 02:27:39', '2017-12-09 02:27:39'),
(29, 'Samir Ademin', '071 777 072', 'user/December2017/sam.jpg', 1, '2017-12-09 02:30:29', '2017-12-09 02:30:29'),
(30, 'Hizri Aliti', '071 821 636', 'user/December2017/xio.jpg', 1, '2017-12-09 02:31:52', '2017-12-09 02:31:52'),
(31, 'Elvis Abdurraimi', '071 841 511', 'user/December2017/18156972_10212929969428483_7592735842834140164_n.jpg', 1, '2017-12-09 03:11:00', '2017-12-09 03:11:00'),
(32, 'Arben Nuhiu', '071 500 578', 'users/default.png', 1, '2017-12-09 03:12:22', '2017-12-09 03:12:22'),
(33, 'Qemal Nuhiu', '071 672 405', 'users/default.png', 1, '2017-12-09 03:12:46', '2017-12-09 03:12:46'),
(34, 'Idriz Haliti', '078 385 711', 'user/December2017/id.jpg', 1, '2017-12-09 03:14:43', '2017-12-09 03:14:43'),
(35, 'Bardhyl Aliti', '070 714 118', 'user/December2017/bae.jpg', 1, '2017-12-09 03:16:19', '2017-12-09 03:16:19'),
(36, 'Xhelal Ismaili', '070 703 372', 'users/default.png', 1, '2017-12-09 03:16:44', '2017-12-09 03:16:44'),
(37, 'Mahir Aliti', '072 600 308', 'user/December2017/mili.jpg', 1, '2017-12-09 03:17:43', '2017-12-09 03:17:43'),
(38, 'Besim Shasivari', '078 202 219', 'user/December2017/ss.jpg', 1, '2017-12-09 03:19:12', '2017-12-09 03:19:12'),
(39, 'Lazim Pajaziti', '070 321 607', 'user/December2017/laz.jpg', 1, '2017-12-09 03:23:35', '2017-12-09 03:23:35'),
(40, 'Dashmir Jahja', '070 900 284', 'user/December2017/das.jpg', 1, '2017-12-09 03:26:15', '2017-12-09 03:26:15'),
(41, 'Ramadan Nuhiu', '070 640 853', 'user/December2017/ram.jpg', 1, '2017-12-09 03:27:39', '2017-12-09 03:27:39'),
(42, 'Labinot Shasivari', '078 209 972', 'user/December2017/llll.jpg', 1, '2017-12-09 03:29:31', '2017-12-09 03:29:31'),
(43, 'Gzim Nuhiu', '070 593 465', 'user/December2017/gag.jpg', 1, '2017-12-09 03:31:36', '2017-12-09 03:31:36'),
(44, 'Blerim Ismaili', '070 394 111', 'user/December2017/ssss.jpg', 1, '2017-12-09 03:34:28', '2017-12-09 03:34:28'),
(45, 'Përparim Delia', '075 999 995', 'users/default.png', 1, '2017-12-09 03:35:53', '2017-12-09 23:47:33'),
(46, 'Ferki Pajaziti', '0041766713907', 'users/default.png', 1, '2017-12-09 03:36:55', '2017-12-09 03:36:55'),
(47, 'Jeton Bejtullai', '070 610 781', 'users/default.png', 1, '2017-12-09 03:37:25', '2017-12-09 03:37:25'),
(48, 'Jeton Bejtullai', '070 610 781', 'users/default.png', 1, '2017-12-09 03:37:29', '2017-12-09 03:37:29'),
(49, 'Nijazim Nuhiu', '070 959 097', 'user/December2017/fgfgghjj.jpg', 1, '2017-12-09 03:39:33', '2017-12-09 03:39:33'),
(50, 'Jetmir Nuhiu', '070 703 202', 'users/default.png', 1, '2017-12-09 03:40:40', '2017-12-09 03:40:40'),
(51, 'Ilir Abdurraimi', '071 777 798', 'users/default.png', 1, '2017-12-09 03:42:00', '2017-12-09 03:42:00'),
(52, 'Bajram Ramadani', '071 725 123', 'users/default.png', 1, '2017-12-09 03:42:41', '2017-12-09 03:42:41'),
(53, 'Rrahim Dalipi', '003934632264474', 'users/default.png', 1, '2017-12-09 03:43:45', '2017-12-09 03:43:45'),
(54, 'Femi Ademin', '071 641 909', 'user/December2017/fff.jpg', 1, '2017-12-09 03:44:59', '2017-12-09 03:44:59'),
(55, 'Beni Sherifi', '070 809 199', 'user/December2017/bbb.jpg', 1, '2017-12-09 03:46:54', '2017-12-09 03:46:54'),
(56, 'Naser Murtezani', '071 644 173', 'users/default.png', 1, '2017-12-09 03:47:31', '2017-12-09 03:47:31'),
(57, 'Samet Jahja', '00491631327708', 'users/default.png', 1, '2017-12-09 03:48:59', '2017-12-09 03:48:59'),
(58, 'Xhamel Jahja', '00491636415765', 'users/default.png', 1, '2017-12-09 03:49:28', '2017-12-09 03:49:28'),
(59, 'Mefail (3 Fenera)', '070 259 778', 'users/default.png', 1, '2017-12-09 03:49:57', '2017-12-09 03:49:57'),
(60, 'Sadri (Fotokopije Univerziteti)', '0000 000', 'users/default.png', 1, '2017-12-09 03:50:45', '2017-12-09 03:50:45'),
(61, 'Endit (LUMA Grafik)', '071 630 970', 'users/default.png', 1, '2017-12-09 03:51:28', '2017-12-09 03:51:28'),
(62, 'Ferdi Murtezani', '071 563 741', 'user/December2017/ffff.jpg', 1, '2017-12-09 03:53:02', '2017-12-09 03:53:02'),
(63, 'Jetmir (Bonita Market)', '071 770 510', 'user/December2017/jjjj.jpg', 1, '2017-12-09 03:55:00', '2017-12-09 03:55:00'),
(64, 'Mojsi Mezelxhiu', '078 213 346', 'user/December2017/mmmm.jpg', 1, '2017-12-09 03:56:12', '2017-12-09 03:56:12'),
(65, 'Natmir (All print)', '072 212 560', 'users/default.png', 1, '2017-12-09 03:56:52', '2017-12-09 03:56:52'),
(66, 'Sami A. (IDEA Park)', '070 427 525', 'user/December2017/23.png', 1, '2017-12-09 04:08:57', '2017-12-09 04:08:57'),
(67, 'Mentor Sabriu', '000 000', 'users/default.png', 1, '2017-12-09 04:22:15', '2017-12-09 04:22:15'),
(68, 'APT.82', '000 000', 'users/default.png', 1, '2017-12-09 04:23:06', '2017-12-09 04:23:06'),
(69, 'Fitness Fatmir', '000 000', 'users/default.png', 1, '2017-12-09 04:24:04', '2017-12-09 04:24:04'),
(70, 'Exhevit Mushe', '000 000', 'users/default.png', 1, '2017-12-09 04:27:20', '2017-12-09 23:44:57'),
(71, 'Jetmir Sh. (BELI 2000)', '000 000', 'users/default.png', 0, '2017-12-09 04:29:20', '2017-12-09 04:29:20'),
(72, 'Bardhyl Bulica (Rakip)', '000 000', 'users/default.png', 1, '2017-12-09 04:30:53', '2017-12-09 04:30:53'),
(73, 'Atnan Islami (RE-AD)', '000 000', 'users/default.png', 0, '2017-12-09 04:33:31', '2017-12-09 04:33:31'),
(74, 'Rami Sh. (Auto Plastika)', '000 000', 'users/default.png', 0, '2017-12-09 04:35:55', '2017-12-09 04:35:55'),
(75, 'Martin S. (RIWAX)', '000 000', 'users/default.png', 0, '2017-12-09 04:37:10', '2017-12-09 04:37:10'),
(76, 'Jamin Miftari', '000 000', 'users/default.png', 0, '2017-12-09 04:45:38', '2017-12-09 04:45:38'),
(77, 'Ilievski Boban', '000 000', 'users/default.png', 0, '2017-12-09 04:48:13', '2017-12-09 04:48:13'),
(78, 'Musa (BILI auto parts)', '000 000', 'users/default.png', 0, '2017-12-09 04:54:01', '2017-12-09 04:54:01'),
(79, 'Xhevat Ziberi', '000 000', 'users/default.png', 0, '2017-12-09 05:43:37', '2017-12-09 05:43:37'),
(80, 'Mensur Fejzullahi', '000 000', 'users/default.png', 1, '2017-12-09 05:57:07', '2017-12-09 05:57:07'),
(81, 'Habil dhe Haris (Bili auto parts)', '000 000', 'users/default.png', 0, '2017-12-09 06:06:29', '2017-12-09 06:06:29');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2017-12-05 09:37:03', '2017-12-05 09:37:03');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=16 ;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2017-12-05 09:37:03', '2017-12-05 09:37:03', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2017-12-05 09:37:03', '2017-12-05 09:37:03', 'voyager.media.index', NULL),
(3, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 6, '2017-12-05 09:37:03', '2017-12-05 09:37:03', 'voyager.posts.index', NULL),
(4, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2017-12-05 09:37:03', '2017-12-05 09:37:03', 'voyager.users.index', NULL),
(5, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 8, '2017-12-05 09:37:03', '2017-12-05 09:37:03', 'voyager.categories.index', NULL),
(6, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 7, '2017-12-05 09:37:03', '2017-12-05 09:37:03', 'voyager.pages.index', NULL),
(7, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2017-12-05 09:37:03', '2017-12-05 09:37:03', 'voyager.roles.index', NULL),
(8, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2017-12-05 09:37:04', '2017-12-05 09:37:04', NULL, NULL),
(9, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 8, 10, '2017-12-05 09:37:04', '2017-12-05 09:37:04', 'voyager.menus.index', NULL),
(10, 1, 'Database', '', '_self', 'voyager-data', NULL, 8, 11, '2017-12-05 09:37:04', '2017-12-05 09:37:04', 'voyager.database.index', NULL),
(11, 1, 'Compass', '/admin/compass', '_self', 'voyager-compass', NULL, 8, 12, '2017-12-05 09:37:04', '2017-12-05 09:37:04', NULL, NULL),
(12, 1, 'Hooks', '/admin/hooks', '_self', 'voyager-hook', NULL, 8, 13, '2017-12-05 09:37:04', '2017-12-05 09:37:04', NULL, NULL),
(13, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2017-12-05 09:37:04', '2017-12-05 09:37:04', 'voyager.settings.index', NULL),
(14, 1, 'Members', '/admin/members', '_self', NULL, NULL, NULL, 15, '2017-12-06 07:55:38', '2017-12-06 07:55:38', NULL, NULL),
(15, 1, 'Inputs', '/admin/inputs', '_self', NULL, NULL, NULL, 16, '2017-12-06 11:49:14', '2017-12-06 11:49:14', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=24 ;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_01_01_000000_create_pages_table', 1),
(6, '2016_01_01_000000_create_posts_table', 1),
(7, '2016_02_15_204651_create_categories_table', 1),
(8, '2016_05_19_173453_create_menu_table', 1),
(9, '2016_10_21_190000_create_roles_table', 1),
(10, '2016_10_21_190000_create_settings_table', 1),
(11, '2016_11_30_135954_create_permission_table', 1),
(12, '2016_11_30_141208_create_permission_role_table', 1),
(13, '2016_12_26_201236_data_types__add__server_side', 1),
(14, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(15, '2017_01_14_005015_create_translations_table', 1),
(16, '2017_01_15_000000_add_permission_group_id_to_permissions_table', 1),
(17, '2017_01_15_000000_create_permission_groups_table', 1),
(18, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(19, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(20, '2017_04_11_000000_alter_post_nullable_fields_table', 1),
(21, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(22, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(23, '2017_08_05_000000_add_group_to_settings_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `outputs`
--

CREATE TABLE IF NOT EXISTS `outputs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `details` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vlera` decimal(10,0) DEFAULT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `outputs`
--

INSERT INTO `outputs` (`id`, `details`, `vlera`, `data`, `created_at`, `updated_at`) VALUES
(2, 'Cokolata per femij', '310', '2017-11-19 07:00:00', '2017-12-09 04:52:34', '2017-12-09 04:52:34'),
(3, 'Pasqyrat Ovale 2 te mdhaja 1 e vogel', '10400', '2017-11-14 07:00:00', '2017-12-09 04:56:50', '2017-12-09 04:56:50'),
(4, 'Najllona dhe Lengje per Puntoret', '1870', '2017-11-19 07:00:00', '2017-12-09 04:59:54', '2017-12-09 04:59:54'),
(5, 'Materialet e Shportave \r\nProfila+shparing+Pllakat+shtrafat', '7410', '2017-11-29 07:00:00', '2017-12-09 05:03:01', '2017-12-09 05:03:01'),
(6, 'Materialet e Shenjave\r\nprinti+foliat+alubandi', '14740', '2017-11-16 07:00:00', '2017-12-09 05:04:00', '2017-12-09 05:04:00'),
(7, 'Shportat e Mbeturinave \r\nPlastike te gjelberta', '12400', '2017-11-15 07:00:00', '2017-12-09 05:04:59', '2017-12-09 05:04:59'),
(8, 'Materialet per shportat e para\r\n3 shporta te gatshme +8 shtylla', '5400', '2017-11-10 07:00:00', '2017-12-09 05:06:16', '2017-12-09 05:06:16'),
(9, 'Ngjyrat per pengesat', '8780', '2017-11-23 07:00:00', '2017-12-09 05:09:46', '2017-12-09 05:09:46'),
(10, 'Foli florocente+shtrafa+anker+izolir+valak+takrill+motera', '4744', '2017-12-17 07:00:00', '2017-12-09 05:12:45', '2017-12-09 05:12:45'),
(11, 'sbm najllona', '618', '2017-11-17 07:00:00', '2017-12-09 05:15:19', '2017-12-09 05:15:19'),
(12, 'rera per pengesat e dyta', '1500', '2017-12-03 07:00:00', '2017-12-09 17:06:35', '2017-12-09 17:06:35');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o''nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2017-12-05 09:37:09', '2017-12-05 09:37:09');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission_group_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=50 ;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`, `permission_group_id`) VALUES
(1, 'browse_admin', NULL, '2017-12-05 09:37:04', '2017-12-05 09:37:04', NULL),
(2, 'browse_database', NULL, '2017-12-05 09:37:04', '2017-12-05 09:37:04', NULL),
(3, 'browse_media', NULL, '2017-12-05 09:37:04', '2017-12-05 09:37:04', NULL),
(4, 'browse_compass', NULL, '2017-12-05 09:37:04', '2017-12-05 09:37:04', NULL),
(5, 'browse_menus', 'menus', '2017-12-05 09:37:04', '2017-12-05 09:37:04', NULL),
(6, 'read_menus', 'menus', '2017-12-05 09:37:04', '2017-12-05 09:37:04', NULL),
(7, 'edit_menus', 'menus', '2017-12-05 09:37:04', '2017-12-05 09:37:04', NULL),
(8, 'add_menus', 'menus', '2017-12-05 09:37:05', '2017-12-05 09:37:05', NULL),
(9, 'delete_menus', 'menus', '2017-12-05 09:37:05', '2017-12-05 09:37:05', NULL),
(10, 'browse_pages', 'pages', '2017-12-05 09:37:05', '2017-12-05 09:37:05', NULL),
(11, 'read_pages', 'pages', '2017-12-05 09:37:05', '2017-12-05 09:37:05', NULL),
(12, 'edit_pages', 'pages', '2017-12-05 09:37:05', '2017-12-05 09:37:05', NULL),
(13, 'add_pages', 'pages', '2017-12-05 09:37:05', '2017-12-05 09:37:05', NULL),
(14, 'delete_pages', 'pages', '2017-12-05 09:37:05', '2017-12-05 09:37:05', NULL),
(15, 'browse_roles', 'roles', '2017-12-05 09:37:05', '2017-12-05 09:37:05', NULL),
(16, 'read_roles', 'roles', '2017-12-05 09:37:05', '2017-12-05 09:37:05', NULL),
(17, 'edit_roles', 'roles', '2017-12-05 09:37:05', '2017-12-05 09:37:05', NULL),
(18, 'add_roles', 'roles', '2017-12-05 09:37:05', '2017-12-05 09:37:05', NULL),
(19, 'delete_roles', 'roles', '2017-12-05 09:37:05', '2017-12-05 09:37:05', NULL),
(20, 'browse_users', 'users', '2017-12-05 09:37:05', '2017-12-05 09:37:05', NULL),
(21, 'read_users', 'users', '2017-12-05 09:37:05', '2017-12-05 09:37:05', NULL),
(22, 'edit_users', 'users', '2017-12-05 09:37:05', '2017-12-05 09:37:05', NULL),
(23, 'add_users', 'users', '2017-12-05 09:37:05', '2017-12-05 09:37:05', NULL),
(24, 'delete_users', 'users', '2017-12-05 09:37:05', '2017-12-05 09:37:05', NULL),
(25, 'browse_posts', 'posts', '2017-12-05 09:37:05', '2017-12-05 09:37:05', NULL),
(26, 'read_posts', 'posts', '2017-12-05 09:37:05', '2017-12-05 09:37:05', NULL),
(27, 'edit_posts', 'posts', '2017-12-05 09:37:05', '2017-12-05 09:37:05', NULL),
(28, 'add_posts', 'posts', '2017-12-05 09:37:05', '2017-12-05 09:37:05', NULL),
(29, 'delete_posts', 'posts', '2017-12-05 09:37:05', '2017-12-05 09:37:05', NULL),
(30, 'browse_categories', 'categories', '2017-12-05 09:37:05', '2017-12-05 09:37:05', NULL),
(31, 'read_categories', 'categories', '2017-12-05 09:37:05', '2017-12-05 09:37:05', NULL),
(32, 'edit_categories', 'categories', '2017-12-05 09:37:05', '2017-12-05 09:37:05', NULL),
(33, 'add_categories', 'categories', '2017-12-05 09:37:05', '2017-12-05 09:37:05', NULL),
(34, 'delete_categories', 'categories', '2017-12-05 09:37:05', '2017-12-05 09:37:05', NULL),
(35, 'browse_settings', 'settings', '2017-12-05 09:37:05', '2017-12-05 09:37:05', NULL),
(36, 'read_settings', 'settings', '2017-12-05 09:37:06', '2017-12-05 09:37:06', NULL),
(37, 'edit_settings', 'settings', '2017-12-05 09:37:06', '2017-12-05 09:37:06', NULL),
(38, 'add_settings', 'settings', '2017-12-05 09:37:06', '2017-12-05 09:37:06', NULL),
(39, 'delete_settings', 'settings', '2017-12-05 09:37:06', '2017-12-05 09:37:06', NULL),
(40, 'browse_members', 'members', '2017-12-06 07:55:38', '2017-12-06 07:55:38', NULL),
(41, 'read_members', 'members', '2017-12-06 07:55:38', '2017-12-06 07:55:38', NULL),
(42, 'edit_members', 'members', '2017-12-06 07:55:38', '2017-12-06 07:55:38', NULL),
(43, 'add_members', 'members', '2017-12-06 07:55:38', '2017-12-06 07:55:38', NULL),
(44, 'delete_members', 'members', '2017-12-06 07:55:38', '2017-12-06 07:55:38', NULL),
(45, 'browse_inputs', 'inputs', '2017-12-06 11:49:14', '2017-12-06 11:49:14', NULL),
(46, 'read_inputs', 'inputs', '2017-12-06 11:49:14', '2017-12-06 11:49:14', NULL),
(47, 'edit_inputs', 'inputs', '2017-12-06 11:49:14', '2017-12-06 11:49:14', NULL),
(48, 'add_inputs', 'inputs', '2017-12-06 11:49:14', '2017-12-06 11:49:14', NULL),
(49, 'delete_inputs', 'inputs', '2017-12-06 11:49:14', '2017-12-06 11:49:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_groups`
--

CREATE TABLE IF NOT EXISTS `permission_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permission_groups_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(3, 1),
(3, 3),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(16, 2),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(21, 2),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(25, 3),
(26, 1),
(26, 3),
(27, 1),
(27, 3),
(28, 1),
(28, 3),
(29, 1),
(29, 3),
(30, 1),
(30, 3),
(31, 1),
(31, 3),
(32, 1),
(32, 3),
(33, 1),
(33, 3),
(34, 1),
(34, 3),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(40, 3),
(41, 1),
(41, 3),
(42, 1),
(42, 3),
(43, 1),
(43, 3),
(44, 1),
(44, 3),
(45, 1),
(45, 3),
(46, 1),
(46, 3),
(47, 1),
(47, 3),
(48, 1),
(48, 3),
(49, 1),
(49, 3);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 'Mbledhja nga Rinia e Lagjes 107', NULL, 'Në mbledhjen e mbajtur nga Rinia e Lagjes 107, me datë 05.11.2017 – Tetovë,\r\nu vendos që udhëheqës të jenë: Mr. Prof. Nagip Ismaili, Prof. Sami Abduraimi dhe Prof. Emin Bejtullahu\r\ndhe çdo anëtar do të participojë në mënyrë vullnetare.\r\nMaterialet e mbledhura do të shfrytëzohen për nevojat e lagjes.', '<p class="MsoNoSpacing"><em><span lang="EN-US">N&euml; mbledhjen e mbajtur nga Rinia e Lagjes 107, me dat&euml; 05.11.2017 &ndash; Tetov&euml;,&nbsp;</span></em><em><span lang="EN-US">u vendos q&euml; udh&euml;heq&euml;s t&euml; jen&euml;: Mr. Prof. Nagip Ismaili, Prof. Sami Abduraimi dhe Prof. Emin Bejtullahu&nbsp;</span></em><em><span lang="EN-US">dhe &ccedil;do an&euml;tar do t&euml; participoj&euml; n&euml; m&euml;nyr&euml; vullnetare.</span></em></p>\r\n<p class="MsoNoSpacing"><em><span lang="EN-US">Materialet e mbledhura do t&euml; shfryt&euml;zohen p&euml;r nevojat e lagjes.</span></em></p>\r\n<p class="MsoNoSpacing"><span lang="EN-US">Rinia e Lagjes 107 &euml;sht&euml; grup i themeluar n&euml; m&euml;nyr&euml; vullnetare enkas p&euml;r p&euml;rkujdesjen e lagjes dhe nevojave t&euml; saj t&euml; p&euml;rbashk&euml;ta. Ky grup u krijua nga banuesit e lagjes si nevoj&euml; e domosdoshme p&euml;r menaxhimin e nevojave t&euml; t&euml; gjith&euml;ve. </span></p>\r\n<p class="MsoNoSpacing"><span lang="EN-US">Rinia e Lagjes do t&euml; zhvillohet dhe t&euml; p&euml;rkujdeset p&euml;r lagjen&nbsp; me an&euml; t&euml; mjeteve, t&euml; cilat do t&euml; grumbullohen nga participimi i t&euml; gjith&euml; an&euml;tar&euml;ve n&euml; m&euml;nyr&euml; vullnetare. </span></p>\r\n<p class="MsoNoSpacing"><span lang="EN-US">P&euml;rve&ccedil; participimit t&euml; an&euml;tar&euml;ve, mjete p&euml;r investim do t&euml; mundohemi t&euml; sigurojm&euml; edhe nga investues t&euml; ndrysh&euml;m t&euml; jasht&euml;m, sepse q&euml;llimi kryesor &euml;sht&euml; q&euml; t&euml; investojm&euml; maksimalisht n&euml; p&euml;rmirsimin e kushteve.</span></p>\r\n<p class="MsoNoSpacing"><span lang="EN-US">Nga propozimet e dh&euml;na p&euml;r kryetar t&euml; lagjes dhe n&euml; pajtueshm&euml;ri me t&euml; gjith&euml; an&euml;tar&euml;t e Rinis&euml; s&euml; Lagjes, u vendos q&euml; udh&euml;heq&euml;s t&euml; jen&euml;: </span></p>\r\n<p class="MsoNoSpacing" style="margin-left: 36.0pt; text-indent: -18.0pt; mso-list: l0 level1 lfo1;"><!-- [if !supportLists]--><span lang="EN-US">-<span style="font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: ''Times New Roman'';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang="EN-US">Mr. Prof. Nagip Ismaili - Studimet i mbaroi n&euml; USHT, nd&euml;rsa magjistratur&euml;n n&euml; Universitetin&nbsp; &ldquo;Kirili dhe Metodi&rdquo; - Shkup. &Euml;sht&euml; i pun&euml;suar n&euml; agjensionin p&euml;r marketing Talenta, ku ka detyr&euml;n e&nbsp; General Manager &ndash; Art Director.</span></p>\r\n<p class="MsoNoSpacing" style="margin-left: 36.0pt; text-indent: -18.0pt; mso-list: l0 level1 lfo1;"><!-- [if !supportLists]--><span lang="EN-US">-<span style="font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: ''Times New Roman'';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang="EN-US">Prof. Sami Abduraimi - Studimet i kreu n&euml; USHT n&euml; drejtimin Ndertimtaris&euml;. &Euml;sht&euml; drejtor i kompanis&euml; Idea Park. </span></p>\r\n<p class="MsoNoSpacing" style="margin-left: 36.0pt; text-indent: -18.0pt; mso-list: l0 level1 lfo1;"><!-- [if !supportLists]--><span lang="EN-US">-<span style="font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: ''Times New Roman'';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang="EN-US">Prof. Emin Bejtullahu - Studimet i kreu n&euml; USHT n&euml; Fakultetin Ekonomik. &Euml;sht&euml; i pun&euml;suar si agjent i shitjes n&euml; kompanin&euml; Alma-M, n&euml; sektorin e Wrigley&rsquo;s.</span></p>\r\n<p class="MsoNoSpacing"><span lang="EN-US">Participimi minimal p&euml;r &ccedil;do an&euml;tar &euml;sht&euml; 100 denar n&euml; muaj (20 euro ne vit).&nbsp;</span><span lang="EN-US">Materialet e mbledhura do t&euml; shfryt&euml;zohen p&euml;r nevojat e lagjes. P&euml;r &ccedil;do gj&euml; do t&euml; jen&euml; t&euml; informuar t&euml; gjith&euml; an&euml;tar&euml;t n&euml;p&euml;rmjet webfaqes ku paswordin dhe username do ta ken&euml; t&euml; gjith&euml; p&euml;r t&euml; pasur qasje direkte 24/7 me t&euml; gjitha t&euml; dh&euml;nat financiare dhe informative.</span></p>\r\n<p class="MsoNoSpacing"><span lang="EN-US"><img src="http://riniaelagjes107.com/storage/posts/November2017/Mbjedhje (2).jpg" alt="" width="459" height="258" />&nbsp; &nbsp;<img src="http://riniaelagjes107.com/storage/posts/November2017/Mbjedhje (3).jpg" alt="" width="460" height="259" /><img src="http://riniaelagjes107.com/storage/posts/December2017/ll.jpg" alt="" width="515" /></span></p>\r\n<p class="MsoNoSpacing"><span lang="EN-US"><img src="http://riniaelagjes107.com/storage/posts/November2017/Mbjedhje (4).jpg" alt="" width="461" height="259" />&nbsp;&nbsp;<img src="http://riniaelagjes107.com/storage/posts/November2017/Mbjedhje (6).jpg" alt="" width="462" height="260" /></span></p>', 'posts/December2017/NT2oSvLY6DjJ0kn6RWJt.jpg', 'mbledhja-nga-rinia-e-lagjes-107', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2017-11-05 18:00:04', '2017-12-08 23:25:10'),
(2, 3, 1, 'Lajmërim - Aksion vullnetar për pastrimin e lagjes', NULL, 'Njoftohen të gjithë banorët e lagjes se ditën e dielë, me datë 12.11.2017 në ora 13:00, do të ketë aksion vullnetar për pastrimin e lagjes.', '<p><span style="color: #000000; font-family: ''Helvetica Neue'', ''Segoe UI'', Helvetica, Arial, sans-serif;"><span style="font-size: 16px; white-space: pre-wrap;">Njoftohen t&euml; gjith&euml; banor&euml;t e lagjes se dit&euml;n e diel&euml;, me dat&euml; 12.11.2017 n&euml; ora 13:00, do t&euml; ket&euml; aksion vullnetar p&euml;r pastrimin e lagjes. N&euml; k&euml;t&euml; aksion thirren t&euml; marrin pjes&euml; t&euml; gjith&euml; banor&euml;t, p&euml;rfshir&euml; edhe f&euml;mij&euml;t. Ky aktivitet nd&euml;rmerret me arsye p&euml;r t&euml; motivuar f&euml;mij&euml;t p&euml;r mir&euml;mbajtjen e lagjes. T&euml; gjith&euml; pjesmarr&euml;sit do t&euml; pajisen me mjete e nevojshme p&euml;r pastrim, duke p&euml;rfshir&euml; doreza, najllon&euml;, etj. Materialet p&euml;r pastrim do t&euml; sigurohen nga organizator&euml;t. Per cdo paqart&euml;si apo informat&euml; na shkruani privet. Ju faliminderit</span></span></p>', 'posts/December2017/GDe8HLj3V79ZTUzaSToZ.jpg', 'lajmerim-aksion-vullnetar-per-pastrimin-e-lagjes', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 1, '2017-11-11 06:40:04', '2017-12-08 23:23:30'),
(3, 3, 3, 'Projekti 01 - Aksioni vullnetar për pastrimin e lagjes', NULL, 'Me datë 12.11.2017 u mbajt aksion vullnetar për pastrimin e lagjes. Aksioni u organizua nga Rinia e Lagjes dhe kishte për qëllim motivimin e fëmijëve për përkujdesje të përditëshme dhe vullnetare të lagjes. \r\nPrezent në aksionin vullnetar ishte edhe Prof. Ibraim Azizi.\r\nAktivitete të ngjajshme do të vazhdojnë të organizohen çdo javë nga Rinia e Lagjes.', '<p class="MsoNoSpacing" style="line-height: 150%;"><span lang="SQ" style="font-size: 12pt; line-height: 150%; font-family: Arial, sans-serif; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Me dat&euml; 12.11.2017 u mbajt aksion vullnetar p&euml;r pastrimin e lagjes. Aksioni u organizua nga Rinia e Lagjes dhe kishte p&euml;r q&euml;llim motivimin e f&euml;mij&euml;ve p&euml;r p&euml;rkujdesje t&euml; p&euml;rdit&euml;shme dhe vullnetare t&euml; lagjes.&nbsp;<br /></span><span style="font-family: Arial, sans-serif; font-size: 12pt;">Prezent n&euml; aksionin vullnetar ishte edhe Prof. Ibraim Azizi.<br /></span><span lang="SQ" style="font-size: 12.0pt; mso-bidi-font-size: 11.0pt; line-height: 150%; font-family: ''Arial'',sans-serif;"> <span style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Aktivitete t&euml; ngjajshme do t&euml; vazhdojn&euml; t&euml; organizohen &ccedil;do jav&euml; nga Rinia e Lagjes.</span></span></p>\r\n<p class="MsoNoSpacing" style="line-height: 150%;">&nbsp;</p>\r\n<p class="MsoNoSpacing" style="line-height: 150%;"><span lang="EN-US" style="font-size: 12.0pt; mso-bidi-font-size: 11.0pt; line-height: 150%; font-family: ''Arial'',sans-serif; mso-ansi-language: EN-US;">N&euml; organizim t&euml; Rinis&euml; s&euml; Lagjes, me dat&euml; 12.11.2017 u b&euml; pastrimi i lagjes nga t&euml; gjith&euml; banor&euml;t, duke p&euml;rfshir&euml; edhe f&euml;mij&euml;t.<br /></span><span style="font-family: Arial, sans-serif; font-size: 12pt;">Aktiviteti u organizua me q&euml;llim t&euml; motivimit t&euml; f&euml;mij&euml;ve p&euml;r t&euml; mir&euml;mbajtur lagjen n&euml; m&euml;nyr&euml; vullnetare.<br /></span><span lang="EN-US" style="font-size: 12.0pt; mso-bidi-font-size: 11.0pt; line-height: 150%; font-family: ''Arial'',sans-serif; mso-ansi-language: EN-US;">Ky aktivitet filloi n&euml; ora 13:00 dhe fillimisht u b&euml; furnizimi me mjete pastruese t&euml; t&euml; gjith&euml; aktivist&euml;ve vullnetar&euml; dhe n&euml; ve&ccedil;anti pajisja t&euml; gjith&euml; f&euml;mij&euml;ve me doreza.<br /></span><span style="font-family: Arial, sans-serif; font-size: 12pt;">Pas pastrimit t&euml; lagjes, f&euml;mij&euml;t u shp&euml;rblyen me materiale ushqyese, me q&euml;llim t&euml; motivimit p&euml;r pun&euml;n q&euml; e kan&euml; b&euml;r&euml; gjat&euml; dit&euml;s.<br /></span><span lang="EN-US" style="font-size: 12.0pt; mso-bidi-font-size: 11.0pt; line-height: 150%; font-family: ''Arial'',sans-serif; mso-ansi-language: EN-US;">Efekti I organizimit t&euml; k&euml;tij aktiviteti u v&euml;rejt nga momenti q&euml; &ccedil;do kalimtar na p&euml;rg&euml;zont&euml; p&euml;r iniciativ&euml;n e nd&euml;rmarr&euml; dhe sh&euml;rbyem si motiv p&euml;r lagjet tjera. </span></p>\r\n<p class="MsoNoSpacing" style="line-height: 150%;"><span lang="EN-US" style="font-size: 12.0pt; mso-bidi-font-size: 11.0pt; line-height: 150%; font-family: ''Arial'',sans-serif; mso-ansi-language: EN-US;">Gjat&euml; kryerjes se aktivitetit ishte prezent edhe Prof. Ibraim Azizi, i cili shprehu k&euml;naq&euml;sin&euml; n&euml;p&euml;rmjet fjal&euml;ve t&euml; tij, ku u shpreh se:<em> &ldquo;Ju p&euml;rg&euml;zoj per k&euml;t&euml; iniciativ&euml; q&euml; keni nd&euml;rmarr&euml;, p&euml;r nj&euml; ambijent m&euml; t&euml; past&euml;r pa mbeturina. K&euml;naq&euml;si e ve&ccedil;ant&euml; p&euml;r mua ishte kur i shihja f&euml;mij&euml;t e vegj&euml;l t&euml; angazhuar n&euml; k&euml;t&euml; aksion t&euml; organizuar. Besoni se do t&euml; jeni shembull q&euml; t&euml; njejta iniciativa t&euml; k&euml;tilla t&euml; nd&euml;rmarrin edhe lagjet e tjera n&euml; Tetov&euml;&rdquo;.</em></span></p>\r\n<p class="MsoNoSpacing" style="line-height: 150%;"><span lang="EN-US" style="font-size: 12.0pt; mso-bidi-font-size: 11.0pt; line-height: 150%; font-family: ''Arial'',sans-serif; mso-ansi-language: EN-US;">K&euml;naq&euml;sin&euml; p&euml;r aksionin vullnetar e shprehu edhe poetja Shahe Pajaziti, e cila u theksoi: &ldquo;<em>Ju lumt p&euml;r k&euml;t&euml; iniciativ q&euml; keni mar&euml;, jeni shembull p&euml;r lagjet tjera. Respekte lagja m&euml; e mir&euml; 107&rdquo;.<br /></em></span><span style="font-family: Arial, sans-serif; font-size: 12pt;">K&euml;to lloji t&euml; aktiviteteve do t&euml; p&euml;rs&euml;riten koh&euml; pas koh&euml; n&euml;</span><span style="font-family: Arial, sans-serif; font-size: 12pt;">&nbsp; </span><span style="font-family: Arial, sans-serif; font-size: 12pt;">p&euml;rkujdesjen e Rinis&euml; s&euml; Lagjes.</span></p>\r\n<p class="MsoNoSpacing" style="line-height: 150%;">&nbsp;</p>\r\n<p class="MsoNoSpacing" style="line-height: 150%;"><span lang="EN-US" style="font-size: 12.0pt; mso-bidi-font-size: 11.0pt; line-height: 150%; font-family: ''Arial'',sans-serif; mso-ansi-language: EN-US;"><img src="http://riniaelagjes107.com/storage/posts/November2017/1.jpg" alt="" width="471" height="314" />&nbsp;&nbsp;<img src="http://riniaelagjes107.com/storage/posts/November2017/2.jpg" alt="" width="472" height="314" /></span></p>\r\n<p class="MsoNoSpacing" style="line-height: 150%;"><span lang="EN-US" style="font-size: 12.0pt; mso-bidi-font-size: 11.0pt; line-height: 150%; font-family: ''Arial'',sans-serif; mso-ansi-language: EN-US;"><img src="http://riniaelagjes107.com/storage/posts/November2017/3.jpg" alt="" width="474" height="315" />&nbsp;&nbsp;<img src="http://riniaelagjes107.com/storage/posts/November2017/4.jpg" alt="" width="470" height="313" /></span></p>\r\n<p class="MsoNoSpacing" style="line-height: 150%;"><span lang="EN-US" style="font-size: 12.0pt; mso-bidi-font-size: 11.0pt; line-height: 150%; font-family: ''Arial'',sans-serif; mso-ansi-language: EN-US;"><img src="http://riniaelagjes107.com/storage/posts/November2017/23415603_559958041021785_8744786726226026332_o.jpg" alt="" width="477" height="317" />&nbsp;&nbsp;<img src="http://riniaelagjes107.com/storage/posts/November2017/23456468_559966751020914_1653031723456086251_o.jpg" alt="" width="469" height="312" /></span></p>\r\n<p class="MsoNoSpacing" style="line-height: 150%;"><span lang="EN-US" style="font-size: 12.0pt; mso-bidi-font-size: 11.0pt; line-height: 150%; font-family: ''Arial'',sans-serif; mso-ansi-language: EN-US;"><img src="http://riniaelagjes107.com/storage/posts/November2017/23467003_559963614354561_7682126857893885491_o.jpg" alt="" width="470" />&nbsp;&nbsp;<img src="http://riniaelagjes107.com/storage/posts/November2017/23509032_559958881021701_3309883281350017115_o.jpg" alt="" width="470" /></span></p>\r\n<p class="MsoNoSpacing" style="line-height: 150%;"><span lang="EN-US" style="font-size: 12.0pt; mso-bidi-font-size: 11.0pt; line-height: 150%; font-family: ''Arial'',sans-serif; mso-ansi-language: EN-US;"><img src="http://riniaelagjes107.com/storage/posts/November2017/23509445_559961611021428_885723596736669117_o.jpg" alt="" width="470" />&nbsp;&nbsp;<img src="http://riniaelagjes107.com/storage/posts/November2017/23550267_559963751021214_6371564938725233105_o.jpg" alt="" width="470" /></span></p>', 'posts/December2017/UiWPtVKe9Tdp4C4zgwCB.jpg', 'projekti-01-aksioni-vullnetar-per-pastrimin-e-lagjes', NULL, NULL, 'PUBLISHED', 0, '2017-11-12 12:57:01', '2017-12-09 03:54:53'),
(4, 3, 3, 'Projekti 02 – Pengesat rrugore', NULL, 'Ky proekt ka të bëjë me pengesat rrugore. Duke pasur parasysh fatkeqsistë të cilat kanë ndodhur në lagje nga shpejtësia e madhe e automjeteve, e pamë të arsyeshme që të merren masa konkrete, pra vëndohen pengesa për të siguruar lëvizjen e këmbësorëve.', '<p class="MsoNormal"><span lang="EN-US" style="font-size: 10.5pt; line-height: 107%; font-family: Helvetica, sans-serif; color: #1d2129; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Ky proekt ka t&euml; b&euml;j&euml; me pengesat rrugore. Duke pasur parasysh fatkeqsist&euml; t&euml; cilat kan&euml; ndodhur n&euml; lagje nga shpejt&euml;sia e madhe e automjeteve, e pam&euml; t&euml; arsyeshme q&euml; t&euml; merren masa konkrete, pra v&euml;ndohen pengesa p&euml;r t&euml; siguruar l&euml;vizjen e k&euml;mb&euml;sor&euml;ve. K&euml; t&euml; projekt e beri te mundur qe te realizohet kompania IDEA PARK. Pengesatjen&euml; me gjat&euml;si 4m, gj&euml;r&euml;si 2m dhe lart&euml;si 10cm. Gjithsej n&euml; lagjeu vendose&euml;n 4 pengesa.</span></p>\r\n<p class="MsoNormal">&nbsp;</p>\r\n<p class="MsoNormal"><span lang="EN-US" style="font-size: 10.5pt; line-height: 107%; font-family: Helvetica, sans-serif; color: #1d2129; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><img src="http://riniaelagjes107.com/storage/posts/December2017/1.jpg" alt="" width="516" height="344" />&nbsp;&nbsp;<img src="http://riniaelagjes107.com/storage/posts/December2017/23669179_563328534018069_8409044163654961102_o.jpg" alt="" width="515" height="343" /></span></p>\r\n<p class="MsoNormal"><span lang="EN-US" style="font-size: 10.5pt; line-height: 107%; font-family: Helvetica, sans-serif; color: #1d2129; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><img src="http://riniaelagjes107.com/storage/posts/December2017/23674636_563335424017380_1458438408100348607_o.jpg" alt="" width="516" height="345" />&nbsp;&nbsp;<img src="http://riniaelagjes107.com/storage/posts/December2017/23737655_563328220684767_5299755874106803352_o.jpg" alt="" width="516" /></span></p>\r\n<p class="MsoNormal"><span lang="EN-US" style="font-size: 10.5pt; line-height: 107%; font-family: Helvetica, sans-serif; color: #1d2129; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><img src="http://riniaelagjes107.com/storage/posts/December2017/24294452_594548704229385_8982057552969836772_n.jpg" alt="" width="516" />&nbsp;&nbsp;<img src="http://riniaelagjes107.com/storage/posts/December2017/24296759_594548667562722_2309188015954453982_n.jpg" alt="" width="516" /></span></p>', 'posts/December2017/CV6sj3FloVBCItE0xfd2.jpg', 'projekti-02-pengesat-rrugore', NULL, NULL, 'PUBLISHED', 0, '2017-12-08 07:21:48', '2017-12-08 07:22:20'),
(5, 3, 3, 'Projekti 03 - Shportat për mbeturina dhe cigare', NULL, 'Në këtë projekt kemi paraparë furnizimin e lagjes me shporta të përshtatshme për mbeturina të lehta dhe të pajisura me pjesë të veçantë për cigare.', '<p><span lang="EN-US" style="font-size: 10.5pt; line-height: 107%; font-family: Helvetica, sans-serif; color: #1d2129; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">N&euml; k&euml;t&euml; projekt kemi parapar&euml; furnizimin e lagjes me shporta t&euml; p&euml;rshtatshme p&euml;r mbeturina t&euml; lehta dhe t&euml; pajisura me pjes&euml; t&euml; ve&ccedil;ant&euml; p&euml;r cigare. Ky projektu realizua me q&euml;llim t&euml; krijimit t&euml; kushteve p&euml;rmbajtjen e past&euml;rtis&euml; s&euml; lagjes. &Ccedil;do shport&euml; do t&euml; pajiset me najllon dhe do t&euml; b&euml;het vazhdimisht mir&euml;mbajtja e saj.</span></p>\r\n<p><span lang="EN-US" style="font-size: 10.5pt; line-height: 107%; font-family: Helvetica, sans-serif; color: #1d2129; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">&nbsp;<img src="http://riniaelagjes107.com/storage/posts/December2017/23632728_563333470684242_5412220322502014973_o1.jpg" alt="" width="516" />&nbsp;&nbsp;<img src="http://riniaelagjes107.com/storage/posts/December2017/23674666_563333414017581_8836839006976996673_o1.jpg" alt="" width="516" /></span></p>\r\n<p><span lang="EN-US" style="font-size: 10.5pt; line-height: 107%; font-family: Helvetica, sans-serif; color: #1d2129; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><img src="http://riniaelagjes107.com/storage/posts/December2017/23736117_563333377350918_8519422551545388277_o.jpg" alt="" width="516" />&nbsp;&nbsp;<img src="http://riniaelagjes107.com/storage/posts/December2017/23736160_563333837350872_6777285083112307555_o.jpg" alt="" width="516" /></span></p>', 'posts/December2017/g9JWQd8LLZmDxISq3a5E.jpg', 'projekti-03-shportat-per-mbeturina-dhe-cigare', NULL, NULL, 'PUBLISHED', 0, '2017-12-08 07:31:42', '2017-12-08 07:31:42'),
(6, 3, 3, 'Projekti 04 - Pasqyrat ovale në rrugë', NULL, 'Projekti 04 - Pasqyrat ovale në rrugë\r\nSinjalizimi me pasqyra ovale është idomosdoshëm përshkak të kryqëzimit të rrugëve.', '<p class="MsoNormal" style="margin-bottom: 0.0001pt; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><span style="font-size: 10.5pt; font-family: ''inherit'',serif; mso-fareast-font-family: ''Times New Roman''; mso-bidi-font-family: Helvetica; color: #1d2129;">Projekti 04 - Pasqyrat ovale n&euml; rrug&euml;<br /> Sinjalizimi me pasqyra ovale &euml;sht&euml; idomosdosh&euml;m p&euml;rshkak t&euml; kryq&euml;zimit t&euml; rrug&euml;ve. K&euml;to pasqyra u vendosen n&euml; 3 pika ku e pam t&euml; arsyeshm edhe ku ishte nevoja p&euml;r shkak t&euml; prerjeve t&euml; rrug&euml;ve.</span></p>\r\n<p><img src="http://riniaelagjes107.com/storage/posts/December2017/23632429_563335327350723_4426602039458874594_o2.jpg" alt="" width="515" />&nbsp;<img src="http://riniaelagjes107.com/storage/posts/December2017/23632652_563335530684036_8313682952167172083_o1.jpg" alt="" width="515" /></p>\r\n<p><img src="http://riniaelagjes107.com/storage/posts/December2017/23674865_563335270684062_2892122273334754449_o2.jpg" alt="" width="515" />&nbsp;&nbsp;<img src="http://riniaelagjes107.com/storage/posts/December2017/23736106_563334924017430_611443116153011788_o.jpg" alt="" width="515" /></p>', 'posts/December2017/wsbXKkxSOJc5a72A8n2o.jpg', 'projekti-04-pasqyrat-ovale-ne-rruge', NULL, NULL, 'PUBLISHED', 0, '2017-12-08 22:33:05', '2017-12-08 23:06:06'),
(7, 3, 3, 'Projekti 05 - Shenjat e komunikacionit', NULL, 'Mirë se vininëLagjen 107 \r\n“Respektoni veten dhe neve duke kufizuar shpetjësinë gjatë vozitjes dhe duke u kujdesur për pastërtinë dhe mirëmbajtjen e lagjes.', '<p class="MsoNormal"><span style="font-size: 10.5pt; line-height: 107%; font-family: Helvetica, sans-serif; color: #1d2129; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Projekti 05 - Shenjat e komunikacionit</span><span style="font-size: 10.5pt; line-height: 107%; font-family: ''Helvetica'',sans-serif; color: #1d2129;"><br /> <span style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Mir&euml; se vinin&euml;Lagjen 107&nbsp;</span><br /> <span style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">&ldquo;Respektoni veten dhe neve duke kufizuar shpetj&euml;sin&euml; gjat&euml; vozitjes dhe duke u kujdesur p&euml;r past&euml;rtin&euml; dhe mir&euml;mbajtjen e lagjes. Jeta dhe sh&euml;ndeti vlejn&euml; m&euml; shum&euml; se gjith&ccedil;ka&rdquo; Ju Faleminderit &ndash;Kjo &euml;sht&euml; shenja e par&euml; t&euml; cil&euml;n do ta hasni n&euml; hyrje t&euml; lagjes.&nbsp;</span><br /> <span style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Shenjat e komunikacionit jan&euml; t&euml; nevojshme p&euml;r shkak t&euml; qarkullimit t&euml; vazhduesh&euml;m t&euml; makinave n&euml; lagje. Ne shenjat e komunikacionit jan&euml; t&euml; p&euml;rfshira shenjat e lajm&euml;rimit dhe shenjat e rrezikut aty ku ishte e nevojshme.</span></span></p>\r\n<p class="MsoNormal">&nbsp;</p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; line-height: 107%; font-family: ''Helvetica'',sans-serif; color: #1d2129;"><span style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><img src="http://riniaelagjes107.com/storage/posts/December2017/5.jpg" alt="" width="515" />&nbsp;&nbsp;<img src="http://riniaelagjes107.com/storage/posts/December2017/21.jpg" alt="" width="515" /></span></span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; line-height: 107%; font-family: ''Helvetica'',sans-serif; color: #1d2129;"><span style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><img src="http://riniaelagjes107.com/storage/posts/December2017/4.jpg" alt="" width="515" />&nbsp;&nbsp;<img src="http://riniaelagjes107.com/storage/posts/December2017/31.jpg" alt="" width="515" /></span></span></p>', 'posts/December2017/aD3HuvIfOaFc9A10utJ6.jpg', 'projekti-05-shenjat-e-komunikacionit', NULL, NULL, 'PUBLISHED', 0, '2017-12-08 23:08:16', '2017-12-08 23:10:45'),
(8, 3, 3, 'Projekti 06 - Vijat e bardha në rrugë', NULL, 'Projekti 06 - Vijat e bardha në rrugë\r\nProjekti i rradhës i cili u realizua ishte ngjyrosja e pengesave në rrugë dhe vizatimi i zebrave.', '<p class="MsoNormal"><span style="font-size: 9pt; line-height: 107%; font-family: Helvetica, sans-serif; color: #666666; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Projekti 06 - Vijat e bardha n&euml; rrug&euml;</span><span style="font-size: 9.0pt; line-height: 107%; font-family: ''Helvetica'',sans-serif; color: #666666;"><br /> <span style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Projekti i rradh&euml;s i cili u realizua ishte ngjyrosja e pengesave n&euml; rrug&euml; dhe vizatimi i zebrave. Ky projekt u realiziua me qellim q&euml; shofer&euml;t dhe kalimtar&euml;t ta ken&euml; m&euml; t&euml; leht&euml; p&euml;r sjelljen e tyre n&euml; rrug&euml; dhe sinjalizimin.</span></span></p>\r\n<p class="MsoNormal">&nbsp;</p>\r\n<p class="MsoNormal"><span style="font-size: 9.0pt; line-height: 107%; font-family: ''Helvetica'',sans-serif; color: #666666;"><span style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><img src="http://riniaelagjes107.com/storage/posts/December2017/23795698_564738250543764_122903540430366244_n1.jpg" alt="" width="515" />&nbsp;&nbsp;<img src="http://riniaelagjes107.com/storage/posts/December2017/23844866_564738057210450_621121678099553715_n.jpg" alt="" width="515" /></span></span></p>\r\n<p class="MsoNormal"><span style="font-size: 9.0pt; line-height: 107%; font-family: ''Helvetica'',sans-serif; color: #666666;"><span style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><img src="http://riniaelagjes107.com/storage/posts/December2017/24294012_594548814229374_1940095487399874088_n.jpg" alt="" width="515" />&nbsp;&nbsp;<img src="http://riniaelagjes107.com/storage/posts/December2017/24775153_594548804229375_5611093077533220543_n.jpg" alt="" width="515" /></span></span></p>', 'posts/December2017/xjZw9k8ITxyfxKIcnwOO.jpg', 'projekti-06-vijat-e-bardha-ne-rruge', NULL, NULL, 'PUBLISHED', 0, '2017-12-08 23:20:27', '2017-12-09 03:48:24'),
(9, 3, 1, 'Mbledhja e dytë nga Rinia e Lagjes 107', NULL, 'Njoftohen te gjithe banoret e Lagjes 107 se me date 10.12.2017 ne ora 20:00 nga Rinia e Lagjes do te mbahet mbledhje ne shkollen fillore “Kirili dhe Metodi”. Ne kete takim do te behet prezentimi i projekteve te cilet jane realizuar dhe atyre te cilat do te realizohen ne vazhdim.', '<p>Njoftohen te gjithe banoret e Lagjes 107 se me date 10.12.2017 ne ora 20:00 nga Rinia e Lagjes do te mbahet mbledhje ne shkollen fillore &ldquo;Kirili dhe Metodi&rdquo;. Ne kete takim do te behet prezentimi i projekteve te cilet jane realizuar dhe atyre te cilat do te realizohen ne vazhdim.</p>', 'posts/December2017/TYs1fApYQ0kGjP6PHB7f.JPG', 'mbledhja-e-dyte-nga-rinia-e-lagjes-107', NULL, NULL, 'PUBLISHED', 0, '2017-12-10 01:55:28', '2017-12-10 02:01:11'),
(10, 3, 3, 'Projekti 07 - Shtepizave për ushqim të shpendëve', NULL, 'Projekti i rradhës i cili u realizua ishte vendosja e shtepizave për ushqim të shpendëve. Këto shtëpiza u vendsosën në vende përkatëse dhe me ushqim do te furnizohen nga Rinia e Lagjes 107.', '<p class="MsoNormal"><span class="MsoSubtleEmphasis">Projekti 07 - Shtepizave p&euml;r ushqim t&euml; shpend&euml;ve</span></p>\r\n<p>&nbsp;</p>\r\n<p class="MsoNormal"><span class="MsoSubtleEmphasis">Projekti i rradh&euml;s i cili u realizua ishte vendosja e shtepizave p&euml;r ushqim t&euml; shpend&euml;ve. K&euml;to sht&euml;piza u vendsos&euml;n n&euml; vende p&euml;rkat&euml;se dhe me ushqim do te furnizohen nga Rinia e Lagjes 107.</span></p>\r\n<p class="MsoNormal">&nbsp;</p>\r\n<p class="MsoNormal"><span class="MsoSubtleEmphasis"><img src="http://riniaelagjes107.com/storage/posts/December2017/22.jpg" alt="" width="515" />&nbsp;&nbsp;<img src="http://riniaelagjes107.com/storage/posts/December2017/32.jpg" alt="" width="515" /></span></p>\r\n<p class="MsoNormal"><span class="MsoSubtleEmphasis"><img src="http://riniaelagjes107.com/storage/posts/December2017/41.jpg" alt="" width="515" />&nbsp;&nbsp;<img src="http://riniaelagjes107.com/storage/posts/December2017/51.jpg" alt="" width="515" /></span></p>', 'posts/December2017/rFf0o2VV4j7TXDDfPYRa.jpg', 'projekti-07-shtepizave-per-ushqim-te-shpendeve', NULL, NULL, 'PUBLISHED', 0, '2017-12-10 22:57:19', '2017-12-10 22:57:19');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2017-12-05 09:37:04', '2017-12-05 09:37:04'),
(2, 'user', 'Normal User', '2017-12-05 09:37:04', '2017-12-05 09:37:04'),
(3, 'subadmin', 'Menaxhues', '2017-12-05 10:00:17', '2017-12-05 10:00:17');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'RINIA E LAGJES 107', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Mirësevini në uebfaqen e "Rinia e Lagjes 107"', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', 'settings/December2017/zoua27sO9bb5RxwMU9Dr.jpg', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', 'settings/December2017/mmZ6QIXfg7ZXMJJ7v8yb.jpg', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'RINIA E LAGJES 107', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Mirësevini në uebfaqen e "Rinia e Lagjes 107"', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings/December2017/eDjWUdfgzQIaLump3xnv.jpg', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE IF NOT EXISTS `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=31 ;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 1, 'pt', 'Post', '2017-12-05 09:37:10', '2017-12-05 09:37:10'),
(2, 'data_types', 'display_name_singular', 2, 'pt', 'Página', '2017-12-05 09:37:10', '2017-12-05 09:37:10'),
(3, 'data_types', 'display_name_singular', 3, 'pt', 'Utilizador', '2017-12-05 09:37:10', '2017-12-05 09:37:10'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2017-12-05 09:37:10', '2017-12-05 09:37:10'),
(5, 'data_types', 'display_name_singular', 5, 'pt', 'Menu', '2017-12-05 09:37:10', '2017-12-05 09:37:10'),
(6, 'data_types', 'display_name_singular', 6, 'pt', 'Função', '2017-12-05 09:37:10', '2017-12-05 09:37:10'),
(7, 'data_types', 'display_name_plural', 1, 'pt', 'Posts', '2017-12-05 09:37:10', '2017-12-05 09:37:10'),
(8, 'data_types', 'display_name_plural', 2, 'pt', 'Páginas', '2017-12-05 09:37:10', '2017-12-05 09:37:10'),
(9, 'data_types', 'display_name_plural', 3, 'pt', 'Utilizadores', '2017-12-05 09:37:10', '2017-12-05 09:37:10'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2017-12-05 09:37:10', '2017-12-05 09:37:10'),
(11, 'data_types', 'display_name_plural', 5, 'pt', 'Menus', '2017-12-05 09:37:10', '2017-12-05 09:37:10'),
(12, 'data_types', 'display_name_plural', 6, 'pt', 'Funções', '2017-12-05 09:37:10', '2017-12-05 09:37:10'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2017-12-05 09:37:10', '2017-12-05 09:37:10'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2017-12-05 09:37:10', '2017-12-05 09:37:10'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2017-12-05 09:37:10', '2017-12-05 09:37:10'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2017-12-05 09:37:11', '2017-12-05 09:37:11'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2017-12-05 09:37:11', '2017-12-05 09:37:11'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2017-12-05 09:37:11', '2017-12-05 09:37:11'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o''nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2017-12-05 09:37:11', '2017-12-05 09:37:11'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2017-12-05 09:37:11', '2017-12-05 09:37:11'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2017-12-05 09:37:11', '2017-12-05 09:37:11'),
(22, 'menu_items', 'title', 3, 'pt', 'Publicações', '2017-12-05 09:37:11', '2017-12-05 09:37:11'),
(23, 'menu_items', 'title', 4, 'pt', 'Utilizadores', '2017-12-05 09:37:11', '2017-12-05 09:37:11'),
(24, 'menu_items', 'title', 5, 'pt', 'Categorias', '2017-12-05 09:37:11', '2017-12-05 09:37:11'),
(25, 'menu_items', 'title', 6, 'pt', 'Páginas', '2017-12-05 09:37:11', '2017-12-05 09:37:11'),
(26, 'menu_items', 'title', 7, 'pt', 'Funções', '2017-12-05 09:37:11', '2017-12-05 09:37:11'),
(27, 'menu_items', 'title', 8, 'pt', 'Ferramentas', '2017-12-05 09:37:11', '2017-12-05 09:37:11'),
(28, 'menu_items', 'title', 9, 'pt', 'Menus', '2017-12-05 09:37:11', '2017-12-05 09:37:11'),
(29, 'menu_items', 'title', 10, 'pt', 'Base de dados', '2017-12-05 09:37:11', '2017-12-05 09:37:11'),
(30, 'menu_items', 'title', 13, 'pt', 'Configurações', '2017-12-05 09:37:11', '2017-12-05 09:37:11');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', '$2y$10$qBWSQGLbTsL4RTdktOcpFeT204vbqSjeDOyttQKZ6likAwu5/bPIO', 'YJwXZwuyhMosq18xMl4hQmR38NTNBUF2rMwjjNgNKhNGkpS6m4XdV7M0GihJ', '2017-12-05 09:37:08', '2017-12-05 09:37:08'),
(2, 2, 'Anëtar', 'info@riniaelagjes107.com', 'users/December2017/mqx3dqk0FRNOGh46pHDa.jpg', '$2y$10$kNtNBrIer4ind94LAZA5Luv5Q9b89Q.nW2SAnUSmQU2kTMoLK67fW', 'i33Pfhp03nvhsBnoaNdZi8mzyjBNqECoEAuUo4l9RZ2MQXa5AO6u82dxOqPC', '2017-12-05 10:46:03', '2017-12-08 22:04:37'),
(3, 3, 'Nagi Ismaili', 'nagi@talenta.mk', 'users/December2017/SaaD2cJQaBUwrQoW1NGz.jpg', '$2y$10$jc2rp.xAAW7fLRCuEBWZfO0/SuZ0saIUyW6EV2oIKf2j6wr9kEJBi', '6iymz0UIiBGRJ7mbQWVFSqZQpy8txMTT2Uw3bhOm08EUAui1D4uCx0dayA4v', '2017-12-05 11:34:14', '2017-12-08 22:07:04'),
(4, 3, 'Emin', 'emin_bejtulla@hotmail.com', 'users/December2017/wzErMqSRugCGVL0LKMWb.jpg', '$2y$10$wOY0nR7lTyV1VD9XqXnX9eTMnZ.ynlrjba/BIantty.RQPKqCMncu', '8BD9LXHbcdg0tD8hrmx3YEX2tCkEnWbms6jI2b91RRvacgzCVMu6YqoUujCE', '2017-12-08 22:06:20', '2017-12-08 22:09:26');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
