-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2017 at 09:57 AM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nagi`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `btn_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
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
  `order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(7, 1, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(8, 1, 'slug', 'text', 'slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true}}', 8),
(9, 1, 'meta_description', 'text_area', 'meta_description', 0, 0, 1, 1, 1, 1, NULL, 9),
(10, 1, 'meta_keywords', 'text_area', 'meta_keywords', 0, 0, 1, 1, 1, 1, NULL, 10),
(11, 1, 'status', 'select_dropdown', 'status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(12, 1, 'created_at', 'timestamp', 'created_at', 0, 1, 1, 0, 0, 0, NULL, 12),
(13, 1, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, NULL, 13),
(14, 2, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '', 1),
(15, 2, 'author_id', 'text', 'author_id', 1, 0, 0, 0, 0, 0, '', 2),
(16, 2, 'title', 'text', 'title', 1, 1, 1, 1, 1, 1, '', 3),
(17, 2, 'excerpt', 'text_area', 'excerpt', 1, 0, 1, 1, 1, 1, '', 4),
(18, 2, 'body', 'rich_text_box', 'body', 1, 0, 1, 1, 1, 1, '', 5),
(19, 2, 'slug', 'text', 'slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"}}', 6),
(20, 2, 'meta_description', 'text', 'meta_description', 1, 0, 1, 1, 1, 1, '', 7),
(21, 2, 'meta_keywords', 'text', 'meta_keywords', 1, 0, 1, 1, 1, 1, '', 8),
(22, 2, 'status', 'select_dropdown', 'status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(23, 2, 'created_at', 'timestamp', 'created_at', 1, 1, 1, 0, 0, 0, '', 10),
(24, 2, 'updated_at', 'timestamp', 'updated_at', 1, 0, 0, 0, 0, 0, '', 11),
(25, 2, 'image', 'image', 'image', 0, 1, 1, 1, 1, 1, '', 12),
(26, 3, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '', 1),
(27, 3, 'name', 'text', 'name', 1, 1, 1, 1, 1, 1, '', 2),
(28, 3, 'email', 'text', 'email', 1, 1, 1, 1, 1, 1, '', 3),
(29, 3, 'password', 'password', 'password', 0, 0, 0, 1, 1, 0, '', 4),
(30, 3, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"roles\",\"pivot\":\"0\"}', 10),
(31, 3, 'remember_token', 'text', 'remember_token', 0, 0, 0, 0, 0, 0, '', 5),
(32, 3, 'created_at', 'timestamp', 'created_at', 0, 1, 1, 0, 0, 0, '', 6),
(33, 3, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '', 7),
(34, 3, 'avatar', 'image', 'avatar', 0, 1, 1, 1, 1, 1, '', 8),
(35, 5, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '', 1),
(36, 5, 'name', 'text', 'name', 1, 1, 1, 1, 1, 1, '', 2),
(37, 5, 'created_at', 'timestamp', 'created_at', 0, 0, 0, 0, 0, 0, '', 3),
(38, 5, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '', 4),
(39, 4, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, NULL, 1),
(40, 4, 'parent_id', 'select_dropdown', 'parent_id', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(41, 4, 'order', 'text', 'order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(42, 4, 'name', 'text', 'name', 1, 1, 1, 1, 1, 1, NULL, 4),
(43, 4, 'slug', 'text', 'slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
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
(60, 7, 'anetar', 'radio_btn', 'Anetar', 1, 1, 1, 1, 1, 1, '{\"default\":\"1\",\"options\":{\"0\":\"Jo\",\"1\":\"Po\"}}', 5),
(61, 8, 'id', 'number', 'Id', 1, 1, 0, 0, 0, 0, NULL, 1),
(62, 8, 'member_id', 'text', 'Member Id', 1, 1, 1, 1, 1, 1, NULL, 2),
(63, 8, 'kontributi', 'text', 'Kontributi', 0, 1, 1, 1, 1, 1, NULL, 3),
(64, 8, 'details', 'text', 'Detajet', 0, 1, 1, 1, 1, 1, NULL, 4),
(65, 8, 'vlera', 'number', 'Vlera', 0, 1, 1, 1, 1, 1, NULL, 5),
(66, 8, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 6),
(67, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(68, 8, 'input_belongsto_member_relationship', 'relationship', 'members', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Member\",\"table\":\"members\",\"type\":\"belongsTo\",\"column\":\"member_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\"}', 8),
(69, 8, 'data', 'timestamp', 'Data', 1, 1, 1, 1, 1, 1, NULL, 6),
(70, 4, 'btn_type', 'radio_btn', 'Btn Type', 0, 1, 1, 1, 1, 1, '{\"default\":\"success\",\"options\":{\"success\":\"Njoftim\",\"danger\":\"Lajme\",\"info\":\"Projekt\"}}', 6);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `inputs` (
  `id` int(10) UNSIGNED NOT NULL,
  `member_id` int(11) NOT NULL,
  `kontributi` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `details` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vlera` decimal(10,0) DEFAULT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8_unicode_ci DEFAULT 'users/default.png',
  `anetar` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2017-12-05 09:37:03', '2017-12-05 09:37:03');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
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
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `outputs` (
  `id` int(10) UNSIGNED NOT NULL,
  `details` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vlera` decimal(10,0) DEFAULT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2017-12-05 09:37:09', '2017-12-05 09:37:09');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission_group_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `permission_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
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

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 'Mbledhja nga Rinia e Lagjes 107', NULL, 'Në mbledhjen e mbajtur nga Rinia e Lagjes 107, me datë 05.11.2017 – Tetovë,\r\nu vendos që udhëheqës të jenë: Mr. Prof. Nagip Ismaili, Prof. Sami Abduraimi dhe Prof. Emin Bejtullahu\r\ndhe çdo anëtar do të participojë në mënyrë vullnetare.\r\nMaterialet e mbledhura do të shfrytëzohen për nevojat e lagjes.', '<p class=\"MsoNoSpacing\"><em><span lang=\"EN-US\">N&euml; mbledhjen e mbajtur nga Rinia e Lagjes 107, me dat&euml; 05.11.2017 &ndash; Tetov&euml;,&nbsp;</span></em><em><span lang=\"EN-US\">u vendos q&euml; udh&euml;heq&euml;s t&euml; jen&euml;: Mr. Prof. Nagip Ismaili, Prof. Sami Abduraimi dhe Prof. Emin Bejtullahu&nbsp;</span></em><em><span lang=\"EN-US\">dhe &ccedil;do an&euml;tar do t&euml; participoj&euml; n&euml; m&euml;nyr&euml; vullnetare.</span></em></p>\r\n<p class=\"MsoNoSpacing\"><em><span lang=\"EN-US\">Materialet e mbledhura do t&euml; shfryt&euml;zohen p&euml;r nevojat e lagjes.</span></em></p>\r\n<p class=\"MsoNoSpacing\"><span lang=\"EN-US\">Rinia e Lagjes 107 &euml;sht&euml; grup i themeluar n&euml; m&euml;nyr&euml; vullnetare enkas p&euml;r p&euml;rkujdesjen e lagjes dhe nevojave t&euml; saj t&euml; p&euml;rbashk&euml;ta. Ky grup u krijua nga banuesit e lagjes si nevoj&euml; e domosdoshme p&euml;r menaxhimin e nevojave t&euml; t&euml; gjith&euml;ve. </span></p>\r\n<p class=\"MsoNoSpacing\"><span lang=\"EN-US\">Rinia e Lagjes do t&euml; zhvillohet dhe t&euml; p&euml;rkujdeset p&euml;r lagjen&nbsp; me an&euml; t&euml; mjeteve, t&euml; cilat do t&euml; grumbullohen nga participimi i t&euml; gjith&euml; an&euml;tar&euml;ve n&euml; m&euml;nyr&euml; vullnetare. </span></p>\r\n<p class=\"MsoNoSpacing\"><span lang=\"EN-US\">P&euml;rve&ccedil; participimit t&euml; an&euml;tar&euml;ve, mjete p&euml;r investim do t&euml; mundohemi t&euml; sigurojm&euml; edhe nga investues t&euml; ndrysh&euml;m t&euml; jasht&euml;m, sepse q&euml;llimi kryesor &euml;sht&euml; q&euml; t&euml; investojm&euml; maksimalisht n&euml; p&euml;rmirsimin e kushteve.</span></p>\r\n<p class=\"MsoNoSpacing\"><span lang=\"EN-US\">Nga propozimet e dh&euml;na p&euml;r kryetar t&euml; lagjes dhe n&euml; pajtueshm&euml;ri me t&euml; gjith&euml; an&euml;tar&euml;t e Rinis&euml; s&euml; Lagjes, u vendos q&euml; udh&euml;heq&euml;s t&euml; jen&euml;: </span></p>\r\n<p class=\"MsoNoSpacing\" style=\"margin-left: 36.0pt; text-indent: -18.0pt; mso-list: l0 level1 lfo1;\"><!-- [if !supportLists]--><span lang=\"EN-US\">-<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"EN-US\">Mr. Prof. Nagip Ismaili - Studimet i mbaroi n&euml; USHT, nd&euml;rsa magjistratur&euml;n n&euml; Universitetin&nbsp; &ldquo;Kirili dhe Metodi&rdquo; - Shkup. &Euml;sht&euml; i pun&euml;suar n&euml; agjensionin p&euml;r marketing Talenta, ku ka detyr&euml;n e&nbsp; General Manager &ndash; Art Director.</span></p>\r\n<p class=\"MsoNoSpacing\" style=\"margin-left: 36.0pt; text-indent: -18.0pt; mso-list: l0 level1 lfo1;\"><!-- [if !supportLists]--><span lang=\"EN-US\">-<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"EN-US\">Prof. Sami Abduraimi - Studimet i kreu n&euml; USHT n&euml; drejtimin Ndertimtaris&euml;. &Euml;sht&euml; drejtor i kompanis&euml; Idea Park. </span></p>\r\n<p class=\"MsoNoSpacing\" style=\"margin-left: 36.0pt; text-indent: -18.0pt; mso-list: l0 level1 lfo1;\"><!-- [if !supportLists]--><span lang=\"EN-US\">-<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"EN-US\">Prof. Emin Bejtullahu - Studimet i kreu n&euml; USHT n&euml; Fakultetin Ekonomik. &Euml;sht&euml; i pun&euml;suar si agjent i shitjes n&euml; kompanin&euml; Alma-M, n&euml; sektorin e Wrigley&rsquo;s.</span></p>\r\n<p class=\"MsoNoSpacing\"><span lang=\"EN-US\">Participimi minimal p&euml;r &ccedil;do an&euml;tar &euml;sht&euml; 100 denar n&euml; muaj (20 euro ne vit).&nbsp;</span><span lang=\"EN-US\">Materialet e mbledhura do t&euml; shfryt&euml;zohen p&euml;r nevojat e lagjes. P&euml;r &ccedil;do gj&euml; do t&euml; jen&euml; t&euml; informuar t&euml; gjith&euml; an&euml;tar&euml;t n&euml;p&euml;rmjet webfaqes ku paswordin dhe username do ta ken&euml; t&euml; gjith&euml; p&euml;r t&euml; pasur qasje direkte 24/7 me t&euml; gjitha t&euml; dh&euml;nat financiare dhe informative.</span></p>\r\n<p class=\"MsoNoSpacing\"><span lang=\"EN-US\"><img src=\"http://riniaelagjes107.com/storage/posts/November2017/Mbjedhje (2).jpg\" alt=\"\" width=\"459\" height=\"258\" />&nbsp; &nbsp;<img src=\"http://riniaelagjes107.com/storage/posts/November2017/Mbjedhje (3).jpg\" alt=\"\" width=\"460\" height=\"259\" /></span></p>\r\n<p class=\"MsoNoSpacing\"><span lang=\"EN-US\"><img src=\"http://riniaelagjes107.com/storage/posts/November2017/Mbjedhje (4).jpg\" alt=\"\" width=\"461\" height=\"259\" />&nbsp;&nbsp;<img src=\"http://riniaelagjes107.com/storage/posts/November2017/Mbjedhje (6).jpg\" alt=\"\" width=\"462\" height=\"260\" /></span></p>', 'posts/November2017/PeqIFhpGmDzUJrrWOg2K.jpg', 'mbledhja-nga-rinia-e-lagjes-107', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2017-11-05 18:00:04', '2017-11-09 08:07:55'),
(2, 3, 1, 'Lajmërim - Aksion vullnetar për pastrimin e lagjes', NULL, 'Njoftohen të gjithë banorët e lagjes se ditën e dielë, me datë 12.11.2017 në ora 13:00, do të ketë aksion vullnetar për pastrimin e lagjes.', '<p><span style=\"color: #000000; font-family: \'Helvetica Neue\', \'Segoe UI\', Helvetica, Arial, sans-serif;\"><span style=\"font-size: 16px; white-space: pre-wrap;\">Njoftohen t&euml; gjith&euml; banor&euml;t e lagjes se dit&euml;n e diel&euml;, me dat&euml; 12.11.2017 n&euml; ora 13:00, do t&euml; ket&euml; aksion vullnetar p&euml;r pastrimin e lagjes. N&euml; k&euml;t&euml; aksion thirren t&euml; marrin pjes&euml; t&euml; gjith&euml; banor&euml;t, p&euml;rfshir&euml; edhe f&euml;mij&euml;t. Ky aktivitet nd&euml;rmerret me arsye p&euml;r t&euml; motivuar f&euml;mij&euml;t p&euml;r mir&euml;mbajtjen e lagjes. T&euml; gjith&euml; pjesmarr&euml;sit do t&euml; pajisen me mjete e nevojshme p&euml;r pastrim, duke p&euml;rfshir&euml; doreza, najllon&euml;, etj. Materialet p&euml;r pastrim do t&euml; sigurohen nga organizator&euml;t. Per cdo paqart&euml;si apo informat&euml; na shkruani privet. Ju faliminderit</span></span></p>', 'posts/November2017/8QsVAHFVvYqGGdtKKtA7.jpg', 'lajmerim-aksion-vullnetar-per-pastrimin-e-lagjes', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 1, '2017-11-11 06:40:04', '2017-11-13 13:22:05'),
(3, 3, 3, 'Projekti 01 - Aksioni vullnetar për pastrimin e lagjes', NULL, 'Me datë 12.11.2017 u mbajt aksion vullnetar për pastrimin e lagjes. Aksioni u organizua nga Rinia e Lagjes dhe kishte për qëllim motivimin e fëmijëve për përkujdesje të përditëshme dhe vullnetare të lagjes. \r\nPrezent në aksionin vullnetar ishte edhe Prof. Ibraim Azizi.\r\nAktivitete të ngjajshme do të vazhdojnë të organizohen çdo javë nga Rinia e Lagjes.', '<p class=\"MsoNoSpacing\" style=\"line-height: 150%;\"><span lang=\"SQ\" style=\"font-size: 12pt; line-height: 150%; font-family: Arial, sans-serif; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">Me dat&euml; 12.11.2017 u mbajt aksion vullnetar p&euml;r pastrimin e lagjes. Aksioni u organizua nga Rinia e Lagjes dhe kishte p&euml;r q&euml;llim motivimin e f&euml;mij&euml;ve p&euml;r p&euml;rkujdesje t&euml; p&euml;rdit&euml;shme dhe vullnetare t&euml; lagjes.&nbsp;<br /></span><span style=\"font-family: Arial, sans-serif; font-size: 12pt;\">Prezent n&euml; aksionin vullnetar ishte edhe Prof. Ibraim Azizi.<br /></span><span lang=\"SQ\" style=\"font-size: 12.0pt; mso-bidi-font-size: 11.0pt; line-height: 150%; font-family: \'Arial\',sans-serif;\"> <span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">Aktivitete t&euml; ngjajshme do t&euml; vazhdojn&euml; t&euml; organizohen &ccedil;do jav&euml; nga Rinia e Lagjes.</span></span></p>\r\n<p class=\"MsoNoSpacing\" style=\"line-height: 150%;\">&nbsp;</p>\r\n<p class=\"MsoNoSpacing\" style=\"line-height: 150%;\"><span lang=\"EN-US\" style=\"font-size: 12.0pt; mso-bidi-font-size: 11.0pt; line-height: 150%; font-family: \'Arial\',sans-serif; mso-ansi-language: EN-US;\">N&euml; organizim t&euml; Rinis&euml; s&euml; Lagjes, me dat&euml; 12.11.2017 u b&euml; pastrimi i lagjes nga t&euml; gjith&euml; banor&euml;t, duke p&euml;rfshir&euml; edhe f&euml;mij&euml;t.<br /></span><span style=\"font-family: Arial, sans-serif; font-size: 12pt;\">Aktiviteti u organizua me q&euml;llim t&euml; motivimit t&euml; f&euml;mij&euml;ve p&euml;r t&euml; mir&euml;mbajtur lagjen n&euml; m&euml;nyr&euml; vullnetare.<br /></span><span lang=\"EN-US\" style=\"font-size: 12.0pt; mso-bidi-font-size: 11.0pt; line-height: 150%; font-family: \'Arial\',sans-serif; mso-ansi-language: EN-US;\">Ky aktivitet filloi n&euml; ora 13:00 dhe fillimisht u b&euml; furnizimi me mjete pastruese t&euml; t&euml; gjith&euml; aktivist&euml;ve vullnetar&euml; dhe n&euml; ve&ccedil;anti pajisja t&euml; gjith&euml; f&euml;mij&euml;ve me doreza.<br /></span><span style=\"font-family: Arial, sans-serif; font-size: 12pt;\">Pas pastrimit t&euml; lagjes, f&euml;mij&euml;t u shp&euml;rblyen me materiale ushqyese, me q&euml;llim t&euml; motivimit p&euml;r pun&euml;n q&euml; e kan&euml; b&euml;r&euml; gjat&euml; dit&euml;s.<br /></span><span lang=\"EN-US\" style=\"font-size: 12.0pt; mso-bidi-font-size: 11.0pt; line-height: 150%; font-family: \'Arial\',sans-serif; mso-ansi-language: EN-US;\">Efekti I organizimit t&euml; k&euml;tij aktiviteti u v&euml;rejt nga momenti q&euml; &ccedil;do kalimtar na p&euml;rg&euml;zont&euml; p&euml;r iniciativ&euml;n e nd&euml;rmarr&euml; dhe sh&euml;rbyem si motiv p&euml;r lagjet tjera. </span></p>\r\n<p class=\"MsoNoSpacing\" style=\"line-height: 150%;\"><span lang=\"EN-US\" style=\"font-size: 12.0pt; mso-bidi-font-size: 11.0pt; line-height: 150%; font-family: \'Arial\',sans-serif; mso-ansi-language: EN-US;\">Gjat&euml; kryerjes se aktivitetit ishte prezent edhe Prof. Ibraim Azizi, i cili shprehu k&euml;naq&euml;sin&euml; n&euml;p&euml;rmjet fjal&euml;ve t&euml; tij, ku u shpreh se:<em> &ldquo;Ju p&euml;rg&euml;zoj per k&euml;t&euml; iniciativ&euml; q&euml; keni nd&euml;rmarr&euml;, p&euml;r nj&euml; ambijent m&euml; t&euml; past&euml;r pa mbeturina. K&euml;naq&euml;si e ve&ccedil;ant&euml; p&euml;r mua ishte kur i shihja f&euml;mij&euml;t e vegj&euml;l t&euml; angazhuar n&euml; k&euml;t&euml; aksion t&euml; organizuar. Besoni se do t&euml; jeni shembull q&euml; t&euml; njejta iniciativa t&euml; k&euml;tilla t&euml; nd&euml;rmarrin edhe lagjet e tjera n&euml; Tetov&euml;&rdquo;.</em></span></p>\r\n<p class=\"MsoNoSpacing\" style=\"line-height: 150%;\"><span lang=\"EN-US\" style=\"font-size: 12.0pt; mso-bidi-font-size: 11.0pt; line-height: 150%; font-family: \'Arial\',sans-serif; mso-ansi-language: EN-US;\">K&euml;naq&euml;sin&euml; p&euml;r aksionin vullnetar e shprehu edhe poetja Shahe Pajaziti, e cila u theksoi: &ldquo;<em>Ju lumt p&euml;r k&euml;t&euml; iniciativ q&euml; keni mar&euml;, jeni shembull p&euml;r lagjet tjera. Respekte lagja m&euml; e mir&euml; 107&rdquo;.<br /></em></span><span style=\"font-family: Arial, sans-serif; font-size: 12pt;\">K&euml;to lloji t&euml; aktiviteteve do t&euml; p&euml;rs&euml;riten koh&euml; pas koh&euml; n&euml;</span><span style=\"font-family: Arial, sans-serif; font-size: 12pt;\">&nbsp; </span><span style=\"font-family: Arial, sans-serif; font-size: 12pt;\">p&euml;rkujdesjen e Rinis&euml; s&euml; Lagjes.</span></p>\r\n<p class=\"MsoNoSpacing\" style=\"line-height: 150%;\">&nbsp;</p>\r\n<p class=\"MsoNoSpacing\" style=\"line-height: 150%;\"><span lang=\"EN-US\" style=\"font-size: 12.0pt; mso-bidi-font-size: 11.0pt; line-height: 150%; font-family: \'Arial\',sans-serif; mso-ansi-language: EN-US;\"><img src=\"http://riniaelagjes107.com/storage/posts/November2017/1.jpg\" alt=\"\" width=\"471\" height=\"314\" />&nbsp;&nbsp;<img src=\"http://riniaelagjes107.com/storage/posts/November2017/2.jpg\" alt=\"\" width=\"472\" height=\"314\" /></span></p>\r\n<p class=\"MsoNoSpacing\" style=\"line-height: 150%;\"><span lang=\"EN-US\" style=\"font-size: 12.0pt; mso-bidi-font-size: 11.0pt; line-height: 150%; font-family: \'Arial\',sans-serif; mso-ansi-language: EN-US;\"><img src=\"http://riniaelagjes107.com/storage/posts/November2017/3.jpg\" alt=\"\" width=\"474\" height=\"315\" />&nbsp;&nbsp;<img src=\"http://riniaelagjes107.com/storage/posts/November2017/4.jpg\" alt=\"\" width=\"470\" height=\"313\" /></span></p>\r\n<p class=\"MsoNoSpacing\" style=\"line-height: 150%;\"><span lang=\"EN-US\" style=\"font-size: 12.0pt; mso-bidi-font-size: 11.0pt; line-height: 150%; font-family: \'Arial\',sans-serif; mso-ansi-language: EN-US;\"><img src=\"http://riniaelagjes107.com/storage/posts/November2017/23415603_559958041021785_8744786726226026332_o.jpg\" alt=\"\" width=\"477\" height=\"317\" />&nbsp;&nbsp;<img src=\"http://riniaelagjes107.com/storage/posts/November2017/23456468_559966751020914_1653031723456086251_o.jpg\" alt=\"\" width=\"469\" height=\"312\" /></span></p>\r\n<p class=\"MsoNoSpacing\" style=\"line-height: 150%;\"><span lang=\"EN-US\" style=\"font-size: 12.0pt; mso-bidi-font-size: 11.0pt; line-height: 150%; font-family: \'Arial\',sans-serif; mso-ansi-language: EN-US;\"><img src=\"http://riniaelagjes107.com/storage/posts/November2017/23467003_559963614354561_7682126857893885491_o.jpg\" alt=\"\" width=\"470\" />&nbsp;&nbsp;<img src=\"http://riniaelagjes107.com/storage/posts/November2017/23509032_559958881021701_3309883281350017115_o.jpg\" alt=\"\" width=\"470\" /></span></p>\r\n<p class=\"MsoNoSpacing\" style=\"line-height: 150%;\"><span lang=\"EN-US\" style=\"font-size: 12.0pt; mso-bidi-font-size: 11.0pt; line-height: 150%; font-family: \'Arial\',sans-serif; mso-ansi-language: EN-US;\"><img src=\"http://riniaelagjes107.com/storage/posts/November2017/23509445_559961611021428_885723596736669117_o.jpg\" alt=\"\" width=\"470\" />&nbsp;&nbsp;<img src=\"http://riniaelagjes107.com/storage/posts/November2017/23550267_559963751021214_6371564938725233105_o.jpg\" alt=\"\" width=\"470\" /></span></p>', 'posts/November2017/2Di5d4NF6JxMN7aanKNr.jpg', 'projekti-01-aksioni-vullnetar-per-pastrimin-e-lagjes', NULL, NULL, 'PUBLISHED', 0, '2017-11-12 12:57:01', '2017-12-07 14:05:53'),
(4, 3, 3, 'Projekti 02 – Pengesat rrugore', NULL, 'Ky proekt ka të bëjë me pengesat rrugore. Duke pasur parasysh fatkeqsistë të cilat kanë ndodhur në lagje nga shpejtësia e madhe e automjeteve, e pamë të arsyeshme që të merren masa konkrete, pra vëndohen pengesa për të siguruar lëvizjen e këmbësorëve.', '<p class=\"MsoNormal\"><span lang=\"EN-US\" style=\"font-size: 10.5pt; line-height: 107%; font-family: Helvetica, sans-serif; color: #1d2129; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">Ky proekt ka t&euml; b&euml;j&euml; me pengesat rrugore. Duke pasur parasysh fatkeqsist&euml; t&euml; cilat kan&euml; ndodhur n&euml; lagje nga shpejt&euml;sia e madhe e automjeteve, e pam&euml; t&euml; arsyeshme q&euml; t&euml; merren masa konkrete, pra v&euml;ndohen pengesa p&euml;r t&euml; siguruar l&euml;vizjen e k&euml;mb&euml;sor&euml;ve. K&euml; t&euml; projekt e beri te mundur qe te realizohet kompania IDEA PARK. Pengesatjen&euml; me gjat&euml;si 4m, gj&euml;r&euml;si 2m dhe lart&euml;si 10cm. Gjithsej n&euml; lagjeu vendose&euml;n 4 pengesa.</span></p>\r\n<p class=\"MsoNormal\">&nbsp;</p>\r\n<p class=\"MsoNormal\"><span lang=\"EN-US\" style=\"font-size: 10.5pt; line-height: 107%; font-family: Helvetica, sans-serif; color: #1d2129; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><img src=\"http://riniaelagjes107.com/storage/posts/December2017/1.jpg\" alt=\"\" width=\"516\" height=\"344\" />&nbsp;&nbsp;<img src=\"http://riniaelagjes107.com/storage/posts/December2017/23669179_563328534018069_8409044163654961102_o.jpg\" alt=\"\" width=\"515\" height=\"343\" /></span></p>\r\n<p class=\"MsoNormal\"><span lang=\"EN-US\" style=\"font-size: 10.5pt; line-height: 107%; font-family: Helvetica, sans-serif; color: #1d2129; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><img src=\"http://riniaelagjes107.com/storage/posts/December2017/23674636_563335424017380_1458438408100348607_o.jpg\" alt=\"\" width=\"516\" height=\"345\" />&nbsp;&nbsp;<img src=\"http://riniaelagjes107.com/storage/posts/December2017/23737655_563328220684767_5299755874106803352_o.jpg\" alt=\"\" width=\"516\" /></span></p>\r\n<p class=\"MsoNormal\"><span lang=\"EN-US\" style=\"font-size: 10.5pt; line-height: 107%; font-family: Helvetica, sans-serif; color: #1d2129; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><img src=\"http://riniaelagjes107.com/storage/posts/December2017/24294452_594548704229385_8982057552969836772_n.jpg\" alt=\"\" width=\"516\" />&nbsp;&nbsp;<img src=\"http://riniaelagjes107.com/storage/posts/December2017/24296759_594548667562722_2309188015954453982_n.jpg\" alt=\"\" width=\"516\" /></span></p>', 'posts/December2017/CV6sj3FloVBCItE0xfd2.jpg', 'projekti-02-pengesat-rrugore', NULL, NULL, 'PUBLISHED', 0, '2017-12-08 07:21:48', '2017-12-08 07:22:20'),
(5, 3, 3, 'Projekti 03 - Shportat për mbeturina dhe cigare', NULL, 'Në këtë projekt kemi paraparë furnizimin e lagjes me shporta të përshtatshme për mbeturina të lehta dhe të pajisura me pjesë të veçantë për cigare.', '<p><span lang=\"EN-US\" style=\"font-size: 10.5pt; line-height: 107%; font-family: Helvetica, sans-serif; color: #1d2129; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">N&euml; k&euml;t&euml; projekt kemi parapar&euml; furnizimin e lagjes me shporta t&euml; p&euml;rshtatshme p&euml;r mbeturina t&euml; lehta dhe t&euml; pajisura me pjes&euml; t&euml; ve&ccedil;ant&euml; p&euml;r cigare. Ky projektu realizua me q&euml;llim t&euml; krijimit t&euml; kushteve p&euml;rmbajtjen e past&euml;rtis&euml; s&euml; lagjes. &Ccedil;do shport&euml; do t&euml; pajiset me najllon dhe do t&euml; b&euml;het vazhdimisht mir&euml;mbajtja e saj.</span></p>\r\n<p><span lang=\"EN-US\" style=\"font-size: 10.5pt; line-height: 107%; font-family: Helvetica, sans-serif; color: #1d2129; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">&nbsp;<img src=\"http://riniaelagjes107.com/storage/posts/December2017/23632728_563333470684242_5412220322502014973_o1.jpg\" alt=\"\" width=\"516\" />&nbsp;&nbsp;<img src=\"http://riniaelagjes107.com/storage/posts/December2017/23674666_563333414017581_8836839006976996673_o1.jpg\" alt=\"\" width=\"516\" /></span></p>\r\n<p><span lang=\"EN-US\" style=\"font-size: 10.5pt; line-height: 107%; font-family: Helvetica, sans-serif; color: #1d2129; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><img src=\"http://riniaelagjes107.com/storage/posts/December2017/23736117_563333377350918_8519422551545388277_o.jpg\" alt=\"\" width=\"516\" />&nbsp;&nbsp;<img src=\"http://riniaelagjes107.com/storage/posts/December2017/23736160_563333837350872_6777285083112307555_o.jpg\" alt=\"\" width=\"516\" /></span></p>', 'posts/December2017/g9JWQd8LLZmDxISq3a5E.jpg', 'projekti-03-shportat-per-mbeturina-dhe-cigare', NULL, NULL, 'PUBLISHED', 0, '2017-12-08 07:31:42', '2017-12-08 07:31:42');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'RINIA E LAGJES 107', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Mirësevini në uebfaqen e \"Rinia e Lagjes 107\"', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', 'settings/December2017/zoua27sO9bb5RxwMU9Dr.jpg', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', 'settings/December2017/mmZ6QIXfg7ZXMJJ7v8yb.jpg', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'RINIA E LAGJES 107', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Mirësevini në uebfaqen e \"Rinia e Lagjes 107\"', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings/December2017/eDjWUdfgzQIaLump3xnv.jpg', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2017-12-05 09:37:11', '2017-12-05 09:37:11'),
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

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', '$2y$10$qBWSQGLbTsL4RTdktOcpFeT204vbqSjeDOyttQKZ6likAwu5/bPIO', 'jeN4gFFafOov2uxkuNf1lZv0Zeim3ETIFHetk3UrNa9ZfWpCV3OlNuwCRXhD', '2017-12-05 09:37:08', '2017-12-05 09:37:08'),
(2, 2, 'Anëtar', 'user@user.com', 'users/December2017/vafZuXquHOmWoQYq2I0i.jpg', '$2y$10$7N5PFIxN7wXMHqQ81Mwm6O.C80.R.19Ecpy/w1nwEaKcKn0jdF3CG', '5gTQLJtwhuaB30MSyWnZwP4qGjuKPZVxoegEh5yzeoyTQHlTlCTnPFggr0Gw', '2017-12-05 10:46:03', '2017-12-05 10:46:03'),
(3, 3, 'Nagi Ismaili', 'nagi@talenta.mk', 'users/December2017/FbYR3B8gjiIwfZG7bjLw.jpg', '$2y$10$jc2rp.xAAW7fLRCuEBWZfO0/SuZ0saIUyW6EV2oIKf2j6wr9kEJBi', 'w5v9W06NYjBw7QOkPillKAj1iRUZ0rMy8CSjX2FxpRO42a3zRNY4pOiyARTJ', '2017-12-05 11:34:14', '2017-12-06 07:28:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `inputs`
--
ALTER TABLE `inputs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `outputs`
--
ALTER TABLE `outputs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_groups`
--
ALTER TABLE `permission_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permission_groups_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `inputs`
--
ALTER TABLE `inputs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `outputs`
--
ALTER TABLE `outputs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `permission_groups`
--
ALTER TABLE `permission_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
