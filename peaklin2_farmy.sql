-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 25, 2024 at 06:17 PM
-- Server version: 8.0.36
-- PHP Version: 8.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `peaklin2_farmy`
--

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`id`, `name`, `is_default`, `latitude`, `longitude`, `created_at`, `updated_at`) VALUES
(1, 'Jaramana', 1, 33.3, 33.3, '2023-12-07 16:08:10', '2023-12-18 07:49:40'),
(2, 'Rukn Al Den', 0, 33.53894066554306, 36.29911617071872, '2023-12-17 12:28:33', '2023-12-17 12:28:33'),
(3, 'نننن', 0, 33.52512897510181, 36.22159990475147, '2023-12-18 07:49:21', '2023-12-18 07:49:40'),
(4, 'Was K', 0, 33.52508506046889, 36.22133977165645, '2024-01-19 15:37:25', '2024-01-19 15:37:25');

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(7, 'عدد القطع', 0, '2023-12-28 08:57:56', '2023-12-28 08:57:56'),
(8, 'الوزن', 0, '2023-12-28 08:59:37', '2023-12-28 08:59:37');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` bigint UNSIGNED NOT NULL,
  `attribute_id` bigint UNSIGNED NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_values`
--

INSERT INTO `attribute_values` (`id`, `attribute_id`, `value`, `created_at`, `updated_at`) VALUES
(39, 7, '1', '2023-12-28 08:57:56', '2023-12-28 08:57:56'),
(40, 7, '2', '2023-12-28 08:57:56', '2023-12-28 08:57:56'),
(41, 8, '200g', '2023-12-28 08:59:37', '2023-12-28 08:59:37'),
(42, 8, '500g', '2023-12-28 08:59:37', '2023-12-28 08:59:37');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint UNSIGNED NOT NULL,
  `type` enum('section1','section2') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_time` date NOT NULL DEFAULT '2023-12-08',
  `end_time` date NOT NULL DEFAULT '2024-12-08',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `type`, `link`, `start_time`, `end_time`, `created_at`, `updated_at`) VALUES
(2, 'section1', 'wwwq2@qe', '2023-12-04', '2023-12-11', '2023-12-08 12:16:36', '2024-01-02 08:13:35'),
(3, 'section2', 'ch!@ch!.com', '2024-01-17', '2024-01-29', '2024-01-02 08:21:04', '2024-01-02 16:07:19'),
(4, 'section2', 'www', '2024-01-24', '2024-01-31', '2024-01-19 15:55:32', '2024-01-19 15:55:32');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'خضار', 1, '2023-12-07 16:22:22', '2023-12-07 16:22:22'),
(4, 'أعشاب', 1, '2023-12-18 07:45:10', '2023-12-18 07:45:10'),
(5, 'اندومي', 1, '2024-01-07 09:59:34', '2024-01-07 09:59:34'),
(6, 'معكرونة', 1, '2024-01-07 09:59:58', '2024-01-07 09:59:58'),
(7, 'زبدة', 1, '2024-01-07 10:00:16', '2024-01-07 10:00:16'),
(8, 'سمنة', 1, '2024-01-07 10:00:19', '2024-01-07 10:00:19'),
(9, 'محمرة بقشقوان', 1, '2024-01-07 10:00:34', '2024-01-07 10:00:34');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `state_id`, `created_at`, `updated_at`) VALUES
(1, 'Jaramana', 1, '2023-12-07 16:07:05', '2023-12-07 16:07:05'),
(2, 'مزة', 1, '2023-12-18 07:50:52', '2023-12-18 07:50:52');

-- --------------------------------------------------------

--
-- Table structure for table `commissions`
--

CREATE TABLE `commissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `commissions`
--

INSERT INTO `commissions` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'test', '2023-12-07 16:01:01', '2024-01-16 09:59:27'),
(6, 'amount', '2024-01-02 16:43:46', '2024-01-02 16:43:46');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_attributes`
--

CREATE TABLE `delivery_attributes` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_attributes`
--

INSERT INTO `delivery_attributes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'test12', '2023-12-08 11:53:27', '2024-01-01 15:26:10'),
(2, 'test', '2024-01-02 06:54:20', '2024-01-02 06:54:20'),
(3, 'ch!', '2024-01-02 08:20:20', '2024-01-02 08:20:20'),
(4, 'gjh', '2024-01-16 09:36:43', '2024-01-16 09:36:43');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_methods`
--

CREATE TABLE `delivery_methods` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` int NOT NULL,
  `price` double NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_methods`
--

INSERT INTO `delivery_methods` (`id`, `name`, `time`, `price`, `created_at`, `updated_at`) VALUES
(1, 'طلب عادي', 30, 1500, '2023-12-08 11:45:24', '2023-12-08 11:45:24'),
(2, 'طلب مستعجل', 15, 2000, '2024-01-02 06:53:57', '2024-01-02 06:53:57'),
(3, 'طلب مجدول', 0, 1500, '2024-01-02 08:20:07', '2024-01-02 08:20:07');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_time_infos`
--

CREATE TABLE `delivery_time_infos` (
  `id` int UNSIGNED NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `before_message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `after_message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_time_infos`
--

INSERT INTO `delivery_time_infos` (`id`, `start_time`, `end_time`, `before_message`, `after_message`, `created_at`, `updated_at`) VALUES
(1, '03:35:30', '16:57:31', 'opening in this time', 'close in this time ', NULL, '2024-01-17 15:04:36');

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` bigint NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `fcm_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `city_id` bigint UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`id`, `first_name`, `last_name`, `email`, `password`, `address`, `phone`, `latitude`, `longitude`, `status`, `fcm_token`, `city_id`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'wassim', 'karam', 'wassim1@gmail.com', '123456789', 'address', 938385459, NULL, NULL, 1, NULL, 1, NULL, NULL, '2023-12-08 08:19:32', '2024-01-19 15:35:19');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorits`
--

CREATE TABLE `favorits` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `favorits`
--

INSERT INTO `favorits` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2024-01-08 07:08:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gifts`
--

CREATE TABLE `gifts` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` double NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gifts`
--

INSERT INTO `gifts` (`id`, `name`, `description`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 'test1', 'test', 0, '2023-12-08 11:41:07', '2023-12-08 11:41:36'),
(3, 'Was K', 'xzc', 6, '2024-01-19 15:56:17', '2024-01-19 15:56:17');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint UNSIGNED NOT NULL,
  `manipulations` json NOT NULL,
  `custom_properties` json NOT NULL,
  `generated_conversions` json NOT NULL,
  `responsive_images` json NOT NULL,
  `order_column` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(13, 'App\\Models\\SubCategory', 2, '0cd48206-5c61-423d-8154-f7b49a94d950', 'subcategory-images', 'flyglh', 'flyglh.jpg', 'image/jpeg', 'public', 'public', 1196549, '[]', '[]', '[]', '[]', 1, '2023-12-19 05:36:43', '2023-12-19 05:36:43'),
(14, 'App\\Models\\Category', 4, 'ca08ec84-505d-438f-b544-5ee110737af4', 'category-image', 'backg-1', 'backg-1.jpg', 'image/jpeg', 'public', 'public', 1437110, '[]', '[]', '[]', '[]', 1, '2023-12-19 06:08:40', '2023-12-19 06:08:40'),
(20, 'App\\Models\\Product', 36, '19b67808-c598-4016-89c4-4f1bd0e6f615', 'product-image', 'لحمة', 'لحمة.jpg', 'image/jpeg', 'public', 'public', 34476, '[]', '[]', '[]', '[]', 1, '2023-12-26 06:37:52', '2023-12-26 06:37:52'),
(23, 'App\\Models\\Product', 37, 'a45ee5ff-4ab8-477c-bde6-735577c5ea36', 'product-image', 'flyglh', 'flyglh.jpg', 'image/jpeg', 'public', 'public', 1196549, '[]', '[]', '[]', '[]', 1, '2024-01-01 13:37:43', '2024-01-01 13:37:43'),
(25, 'App\\Models\\Banner', 3, 'd4bf487b-6c1f-4160-822d-159a2c34d7d8', 'banner-image', 'backg-1', 'backg-1.jpg', 'image/jpeg', 'public', 'public', 1437110, '[]', '[]', '[]', '[]', 1, '2024-01-02 08:21:04', '2024-01-02 08:21:04'),
(26, 'App\\Models\\Banner', 2, '266ab3bb-eb14-4a5c-b97e-f235129b080e', 'banner-image', 'p8dons', 'p8dons.jpg', 'image/jpeg', 'public', 'public', 1043337, '[]', '[]', '[]', '[]', 1, '2024-01-02 08:22:33', '2024-01-02 08:22:33'),
(27, 'App\\Models\\Product', 40, '4ca13041-64e9-4db9-858b-bc860c612825', 'product-image', 'kosa', 'kosa.jpg', 'image/jpeg', 'public', 'public', 704947, '[]', '[]', '[]', '[]', 1, '2024-01-02 16:49:16', '2024-01-02 16:49:16'),
(29, 'App\\Models\\Category', 1, '7b129065-aa99-4abc-acef-60e71d1e946b', 'category-image', 'b6a6a', 'b6a6a.jpg', 'image/jpeg', 'public', 'public', 1255718, '[]', '[]', '[]', '[]', 1, '2024-01-16 10:57:56', '2024-01-16 10:57:56'),
(31, 'App\\Models\\Category', 6, '8de7f8b3-3ebc-4396-a676-7097bbe22de7', 'category-image', 'pasta', 'pasta.jpg', 'image/jpeg', 'public', 'public', 1962583, '[]', '[]', '[]', '[]', 1, '2024-01-16 11:05:08', '2024-01-16 11:05:08'),
(32, 'App\\Models\\Category', 7, 'fb5d52b7-64a2-4781-b56e-d3411921d6a6', 'category-image', 'butter', 'butter.jpg', 'image/jpeg', 'public', 'public', 1814642, '[]', '[]', '[]', '[]', 1, '2024-01-16 11:05:26', '2024-01-16 11:05:26'),
(33, 'App\\Models\\Category', 8, '869a3d6f-dc6e-4432-adb4-107514ba6181', 'category-image', 'smna', 'smna.jpg', 'image/jpeg', 'public', 'public', 758986, '[]', '[]', '[]', '[]', 1, '2024-01-16 11:05:45', '2024-01-16 11:05:45'),
(34, 'App\\Models\\Category', 9, '957fadda-4164-43d1-a505-d8d0bcb221f8', 'category-image', 'biza', 'biza.jpg', 'image/jpeg', 'public', 'public', 1886527, '[]', '[]', '[]', '[]', 1, '2024-01-16 11:06:02', '2024-01-16 11:06:02'),
(35, 'App\\Models\\Category', 5, '833fa07a-88a9-4435-a978-a2bbc63b4cfc', 'category-image', 'nudels', 'nudels.jpg', 'image/jpeg', 'public', 'public', 2187836, '[]', '[]', '[]', '[]', 1, '2024-01-16 11:08:26', '2024-01-16 11:08:26'),
(38, 'App\\Models\\Banner', 4, '36841104-0b5e-44ca-b616-b70f7f9e9584', 'banner-image', 'RAUCH - Halal Awareness & Assurance Training 23.10.2023', 'RAUCH---Halal-Awareness-&-Assurance-Training-23.10.2023.png', 'image/png', 'public', 'public', 11828, '[]', '[]', '[]', '[]', 1, '2024-01-21 09:29:00', '2024-01-21 09:29:00');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(113, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(114, '2019_08_19_000000_create_failed_jobs_table', 1),
(115, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(116, '2023_08_02_202739_create_permission_tables', 1),
(117, '2023_11_18_182439_create_commissions_table', 1),
(118, '2023_11_19_083711_create_states_table', 1),
(119, '2023_11_19_083844_create_cities_table', 1),
(120, '2023_11_19_090004_create_users_table', 1),
(121, '2023_11_19_090005_create_areas_table', 1),
(122, '2023_11_19_092639_create_sellers_table', 1),
(123, '2023_11_19_094555_create_categories_table', 1),
(124, '2023_11_19_094728_create_sub_categories_table', 1),
(125, '2023_11_19_100242_create_products_table', 1),
(126, '2023_11_19_103038_create_product_attributes_table', 1),
(127, '2023_11_19_110914_create_product_attribute_values_table', 1),
(128, '2023_11_19_112613_create_user_addresses_table', 1),
(129, '2023_11_19_113246_create_gifts_table', 1),
(130, '2023_11_19_114817_create_delivery_methods_table', 1),
(131, '2023_11_19_114958_create_payment_methods_table', 1),
(132, '2023_11_19_115035_create_delivery_attributes_table', 1),
(133, '2023_11_27_090628_create_media_table', 1),
(134, '2023_11_27_131454_create_attribute_values_table', 1),
(135, '2023_12_01_183211_create_drivers_table', 1),
(136, '2023_12_02_112600_create_orders_table', 1),
(137, '2023_12_02_121317_create_order_details_table', 1),
(138, '2023_12_02_122229_create_order_delivery_attributes_table', 1),
(139, '2023_12_08_125359_create_o_t_p_s_table', 2),
(140, '2023_12_08_145627_create_banners_table', 3),
(141, '2023_12_08_181117_create_product_related_product_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `created_at`, `updated_at`) VALUES
(1, '3', 'App\\Models\\User', 1, '{\"title\":\"t\",\"body\":\"r\"}', '2024-01-09 22:42:56', '2024-01-09 22:42:56'),
(2, '3', 'App\\Models\\User', 1, '{\"title\":\"t\",\"body\":\"r\"}', '2024-01-09 22:44:14', '2024-01-09 22:44:14'),
(3, '3', 'App\\Models\\User', 1, '{\"title\":\"t\",\"body\":\"r\"}', '2024-01-09 22:46:52', '2024-01-09 22:46:52'),
(4, '3', 'App\\Models\\User', 1, '{\"title\":\"t\",\"body\":\"r\"}', '2024-01-09 22:47:17', '2024-01-09 22:47:17'),
(5, '3', 'App\\Models\\User', 1, '{\"title\":\"t\",\"body\":\"r\"}', '2024-01-09 22:47:43', '2024-01-09 22:47:43'),
(6, '3', 'App\\Models\\User', 1, '{\"title\":\"t\",\"body\":\"r\"}', '2024-01-09 22:52:14', '2024-01-09 22:52:14'),
(7, '3', 'App\\Models\\User', 19, '{\"title\":\"test\",\"body\":\"test\"}', '2024-01-11 13:45:49', '2024-01-11 13:45:49'),
(8, '3', 'App\\Models\\User', 19, '{\"title\":\"test\",\"body\":\"test\"}', '2024-01-11 13:50:33', '2024-01-11 13:50:33'),
(9, '3', 'App\\Models\\User', 19, '{\"title\":\"test\",\"body\":\"test\"}', '2024-01-11 13:50:45', '2024-01-11 13:50:45'),
(10, '3', 'App\\Models\\User', 19, '{\"title\":\"test\",\"body\":\"test\"}', '2024-01-11 13:51:58', '2024-01-11 13:51:58'),
(11, '3', 'App\\Models\\User', 19, '{\"title\":\"test\",\"body\":\"test\"}', '2024-01-11 13:52:44', '2024-01-11 13:52:44'),
(12, '3', 'App\\Models\\User', 19, '{\"title\":\"test\",\"body\":\"test\"}', '2024-01-11 13:57:49', '2024-01-11 13:57:49'),
(13, '3', 'App\\Models\\User', 19, '{\"title\":\"test\",\"body\":\"test\"}', '2024-01-11 14:05:33', '2024-01-11 14:05:33'),
(14, '3', 'App\\Models\\User', 1, '{\"title\":\"t\",\"body\":\"r\"}', '2024-01-21 12:55:29', '2024-01-21 12:55:29'),
(15, '3', 'App\\Models\\User', 20, '{\"title\":\"t\",\"body\":\"r\"}', '2024-01-21 12:57:00', '2024-01-21 12:57:00');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `order_number` int NOT NULL DEFAULT '1000',
  `user_id` bigint UNSIGNED NOT NULL,
  `driver_id` bigint UNSIGNED DEFAULT NULL,
  `status` tinyint NOT NULL,
  `delivery_method_id` bigint UNSIGNED NOT NULL,
  `payment_method_id` bigint UNSIGNED NOT NULL,
  `user_address_id` bigint UNSIGNED NOT NULL,
  `city_id` bigint UNSIGNED DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `payment_status` tinyint(1) NOT NULL DEFAULT '0',
  `total` double NOT NULL DEFAULT '0',
  `date` date NOT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `driver_id`, `status`, `delivery_method_id`, `payment_method_id`, `user_address_id`, `city_id`, `start_time`, `end_time`, `latitude`, `longitude`, `payment_status`, `total`, `date`, `notes`, `deleted_at`, `created_at`, `updated_at`) VALUES
(40, 1039, 1, NULL, 4, 1, 1, 21, NULL, NULL, NULL, NULL, NULL, 0, 0, '2024-01-16', NULL, NULL, '2024-01-16 14:44:27', '2024-01-19 15:51:05'),
(41, 1040, 1, NULL, 1, 1, 1, 21, NULL, NULL, NULL, NULL, NULL, 0, 0, '2024-01-16', NULL, NULL, '2024-01-16 14:48:19', '2024-01-16 14:48:19'),
(42, 1041, 1, NULL, 1, 1, 1, 21, NULL, NULL, NULL, NULL, NULL, 0, 0, '2024-01-16', NULL, NULL, '2024-01-16 15:16:03', '2024-01-16 15:16:03'),
(46, 1045, 1, NULL, 1, 1, 1, 36, NULL, NULL, NULL, NULL, NULL, 0, 0, '2024-01-16', NULL, NULL, '2024-01-16 15:46:38', '2024-01-16 15:46:38'),
(47, 1046, 1, NULL, 1, 1, 1, 30, NULL, NULL, NULL, NULL, NULL, 0, 0, '2024-01-17', NULL, NULL, '2024-01-17 11:49:30', '2024-01-17 11:49:30'),
(48, 1047, 1, NULL, 1, 1, 1, 37, NULL, NULL, NULL, NULL, NULL, 0, 0, '2024-01-18', NULL, NULL, '2024-01-18 10:57:51', '2024-01-18 10:57:51'),
(49, 1048, 1, NULL, 1, 2, 1, 39, NULL, NULL, NULL, NULL, NULL, 0, 0, '2024-01-18', NULL, NULL, '2024-01-18 15:49:27', '2024-01-18 15:49:27'),
(50, 1049, 1, NULL, 1, 3, 1, 41, NULL, NULL, NULL, NULL, NULL, 0, 0, '2024-01-19', NULL, NULL, '2024-01-19 20:57:22', '2024-01-19 20:57:22'),
(51, 1050, 1, NULL, 1, 1, 1, 27, NULL, NULL, NULL, NULL, NULL, 0, 0, '2024-01-21', NULL, NULL, '2024-01-21 08:49:28', '2024-01-21 08:49:28'),
(52, 1051, 1, NULL, 1, 3, 1, 27, NULL, NULL, NULL, NULL, NULL, 0, 0, '2024-01-21', NULL, NULL, '2024-01-21 08:50:23', '2024-01-21 08:50:23'),
(53, 1052, 1, NULL, 1, 2, 1, 36, NULL, NULL, NULL, NULL, NULL, 0, 0, '2024-01-27', NULL, NULL, '2024-01-27 11:54:13', '2024-01-27 11:54:13'),
(54, 1053, 1, NULL, 1, 3, 1, 26, NULL, NULL, NULL, NULL, NULL, 0, 0, '2024-01-28', NULL, NULL, '2024-01-28 13:34:18', '2024-01-28 13:34:18'),
(55, 1054, 1, NULL, 1, 2, 1, 42, NULL, NULL, NULL, NULL, NULL, 0, 0, '2024-02-07', NULL, NULL, '2024-02-07 10:40:58', '2024-02-07 10:40:58'),
(56, 1055, 1, NULL, 1, 1, 1, 42, NULL, NULL, NULL, NULL, NULL, 0, 0, '2024-02-08', NULL, NULL, '2024-02-08 11:34:45', '2024-02-08 11:34:45'),
(57, 1056, 1, NULL, 1, 1, 1, 27, NULL, NULL, NULL, NULL, NULL, 0, 0, '2024-02-20', NULL, NULL, '2024-02-20 14:15:01', '2024-02-20 14:15:01'),
(58, 1057, 20, NULL, 1, 3, 1, 12, NULL, NULL, NULL, NULL, NULL, 0, 0, '2024-02-21', NULL, NULL, '2024-02-21 10:28:33', '2024-02-21 10:28:33'),
(59, 1058, 20, NULL, 1, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, 0, 0, '2024-02-21', NULL, NULL, '2024-02-21 12:00:08', '2024-02-21 12:00:08'),
(60, 1059, 20, NULL, 1, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, 0, 0, '2024-02-21', NULL, NULL, '2024-02-21 12:40:56', '2024-02-21 12:40:56'),
(61, 1060, 20, NULL, 1, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, 0, 0, '2024-02-21', NULL, NULL, '2024-02-21 12:56:58', '2024-02-21 12:56:58'),
(62, 1061, 20, NULL, 1, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, 0, 0, '2024-02-21', NULL, NULL, '2024-02-21 13:01:05', '2024-02-21 13:01:05'),
(63, 1062, 20, NULL, 1, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, 0, 2, '2024-02-21', NULL, NULL, '2024-02-21 13:02:21', '2024-02-21 13:02:21'),
(64, 1063, 20, NULL, 1, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, 0, 0, '2024-02-21', NULL, NULL, '2024-02-21 13:19:55', '2024-02-21 13:19:55'),
(65, 1064, 20, NULL, 4, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, 0, 0, '2024-02-21', NULL, NULL, '2024-02-21 14:18:37', '2024-02-21 14:18:37'),
(66, 1065, 20, NULL, 5, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, 0, 0, '2024-02-21', NULL, NULL, '2024-02-21 14:26:39', '2024-02-21 14:26:39'),
(67, 1066, 20, NULL, 6, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, 0, 0, '2024-02-21', NULL, NULL, '2024-02-21 19:52:54', '2024-02-21 19:52:54'),
(68, 1067, 20, NULL, 5, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, 0, 0, '2024-02-21', NULL, NULL, '2024-02-21 19:55:22', '2024-02-21 19:55:22'),
(69, 1068, 20, NULL, 2, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, 0, 0, '2024-02-21', NULL, NULL, '2024-02-21 19:58:29', '2024-02-21 19:58:29'),
(70, 1069, 20, NULL, 1, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, 0, 0, '2024-02-21', NULL, NULL, '2024-02-21 20:12:47', '2024-02-21 20:12:47'),
(71, 1070, 20, NULL, 4, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, 0, 0, '2024-02-21', NULL, NULL, '2024-02-21 20:28:19', '2024-02-21 20:28:19'),
(72, 1071, 20, NULL, 3, 1, 1, 45, NULL, NULL, NULL, NULL, NULL, 0, 0, '2024-02-22', NULL, NULL, '2024-02-22 09:29:12', '2024-02-22 09:29:12'),
(73, 1072, 20, NULL, 2, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, 0, 0, '2024-02-22', NULL, NULL, '2024-02-22 10:02:46', '2024-02-22 10:02:46'),
(74, 1073, 20, NULL, 1, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, 0, 0, '2024-02-22', NULL, NULL, '2024-02-22 10:15:01', '2024-02-22 10:15:01'),
(75, 1074, 20, NULL, 1, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, 0, 0, '2024-02-22', NULL, NULL, '2024-02-22 10:39:34', '2024-02-22 10:39:34'),
(76, 1075, 20, NULL, 1, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, 0, 0, '2024-02-22', NULL, NULL, '2024-02-22 10:41:17', '2024-02-22 10:41:17'),
(77, 1076, 20, NULL, 1, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, 0, 0, '2024-02-22', NULL, NULL, '2024-02-22 10:43:03', '2024-02-22 10:43:03'),
(78, 1077, 20, NULL, 1, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, 0, 0, '2024-02-22', NULL, NULL, '2024-02-22 10:46:11', '2024-02-22 10:46:11'),
(79, 1078, 20, NULL, 1, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, 0, 0, '2024-02-22', NULL, NULL, '2024-02-22 10:50:02', '2024-02-22 10:50:02'),
(80, 1079, 20, NULL, 1, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, 0, 0, '2024-02-22', NULL, NULL, '2024-02-22 10:54:07', '2024-02-22 10:54:07'),
(81, 1080, 20, NULL, 1, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, 0, 0, '2024-02-22', NULL, NULL, '2024-02-22 11:50:34', '2024-02-22 11:50:34'),
(82, 1081, 20, NULL, 1, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, 0, 0, '2024-02-22', NULL, NULL, '2024-02-22 12:39:16', '2024-02-22 12:39:16');

-- --------------------------------------------------------

--
-- Table structure for table `order_delivery_attributes`
--

CREATE TABLE `order_delivery_attributes` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `delivery_attribute_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_delivery_attributes`
--

INSERT INTO `order_delivery_attributes` (`id`, `order_id`, `delivery_attribute_id`, `created_at`, `updated_at`) VALUES
(63, 40, 1, NULL, NULL),
(64, 41, 1, NULL, NULL),
(65, 42, 1, NULL, NULL),
(72, 46, 3, NULL, NULL),
(73, 47, 4, NULL, NULL),
(74, 48, 1, NULL, NULL),
(75, 49, 1, NULL, NULL),
(76, 50, 3, NULL, NULL),
(77, 51, 2, NULL, NULL),
(78, 52, 2, NULL, NULL),
(79, 53, 3, NULL, NULL),
(80, 54, 2, NULL, NULL),
(81, 55, 1, NULL, NULL),
(82, 56, 2, NULL, NULL),
(83, 57, 1, NULL, NULL),
(84, 57, 3, NULL, NULL),
(85, 58, 2, NULL, NULL),
(86, 58, 3, NULL, NULL),
(87, 59, 1, NULL, NULL),
(88, 60, 1, NULL, NULL),
(89, 61, 1, NULL, NULL),
(90, 62, 1, NULL, NULL),
(91, 63, 1, NULL, NULL),
(92, 64, 1, NULL, NULL),
(93, 65, 1, NULL, NULL),
(94, 66, 1, NULL, NULL),
(95, 67, 1, NULL, NULL),
(96, 68, 1, NULL, NULL),
(97, 69, 1, NULL, NULL),
(98, 70, 1, NULL, NULL),
(99, 71, 1, NULL, NULL),
(100, 72, 1, NULL, NULL),
(101, 73, 1, NULL, NULL),
(102, 74, 1, NULL, NULL),
(103, 75, 1, NULL, NULL),
(104, 76, 1, NULL, NULL),
(105, 77, 1, NULL, NULL),
(106, 78, 1, NULL, NULL),
(107, 79, 1, NULL, NULL),
(108, 80, 1, NULL, NULL),
(109, 81, 1, NULL, NULL),
(110, 82, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `status` tinyint NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `price`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(43, 40, 37, 2, 2500.00, 1, NULL, '2024-01-16 14:44:27', '2024-01-16 14:44:27'),
(44, 41, 40, 3, 2500.00, 1, NULL, '2024-01-16 14:48:19', '2024-01-16 14:48:19'),
(45, 42, 40, 3, 2500.00, 1, NULL, '2024-01-16 15:16:03', '2024-01-16 15:16:03'),
(51, 46, 40, 1, 2500.00, 1, NULL, '2024-01-16 15:46:38', '2024-01-16 15:46:38'),
(52, 47, 37, 1, 2500.00, 1, NULL, '2024-01-17 11:49:30', '2024-01-17 11:49:30'),
(53, 48, 37, 3, 2500.00, 1, NULL, '2024-01-18 10:57:51', '2024-01-18 10:57:51'),
(54, 49, 40, 1, 2500.00, 1, NULL, '2024-01-18 15:49:27', '2024-01-18 15:49:27'),
(55, 50, 37, 1, 2500.00, 1, NULL, '2024-01-19 20:57:22', '2024-01-19 20:57:22'),
(56, 51, 36, 2, 111.00, 1, NULL, '2024-01-21 08:49:28', '2024-01-21 08:49:28'),
(57, 51, 22, 1, 111.00, 1, NULL, '2024-01-21 08:49:28', '2024-01-21 08:49:28'),
(58, 52, 36, 2, 111.00, 1, NULL, '2024-01-21 08:50:23', '2024-01-21 08:50:23'),
(59, 52, 22, 1, 111.00, 1, NULL, '2024-01-21 08:50:23', '2024-01-21 08:50:23'),
(60, 53, 36, 1, 111.00, 1, NULL, '2024-01-27 11:54:13', '2024-01-27 11:54:13'),
(61, 54, 40, 8, 2500.00, 1, NULL, '2024-01-28 13:34:18', '2024-01-28 13:34:18'),
(62, 54, 40, 4, 2500.00, 1, NULL, '2024-01-28 13:34:18', '2024-01-28 13:34:18'),
(63, 54, 40, 4, 2500.00, 1, NULL, '2024-01-28 13:34:18', '2024-01-28 13:34:18'),
(64, 55, 36, 5, 111.00, 1, NULL, '2024-02-07 10:40:58', '2024-02-07 10:40:58'),
(65, 56, 40, 1, 2500.00, 1, NULL, '2024-02-08 11:34:45', '2024-02-08 11:34:45'),
(66, 57, 36, 2, 111.00, 1, NULL, '2024-02-20 14:15:01', '2024-02-20 14:15:01'),
(67, 58, 37, 1, 2500.00, 1, NULL, '2024-02-21 10:28:33', '2024-02-21 10:28:33'),
(68, 59, 22, 1, 111.00, 1, NULL, '2024-02-21 12:00:08', '2024-02-21 12:00:08'),
(69, 59, 36, 2, 111.00, 1, NULL, '2024-02-21 12:00:08', '2024-02-21 12:00:08'),
(70, 60, 22, 1, 111.00, 1, NULL, '2024-02-21 12:40:56', '2024-02-21 12:40:56'),
(71, 60, 36, 2, 111.00, 1, NULL, '2024-02-21 12:40:56', '2024-02-21 12:40:56'),
(72, 61, 22, 1, 111.00, 1, NULL, '2024-02-21 12:56:58', '2024-02-21 12:56:58'),
(73, 61, 36, 2, 111.00, 1, NULL, '2024-02-21 12:56:58', '2024-02-21 12:56:58'),
(74, 62, 22, 1, 111.00, 1, NULL, '2024-02-21 13:01:05', '2024-02-21 13:01:05'),
(75, 62, 36, 2, 111.00, 1, NULL, '2024-02-21 13:01:05', '2024-02-21 13:01:05'),
(76, 63, 22, 1, 111.00, 1, NULL, '2024-02-21 13:02:21', '2024-02-21 13:02:21'),
(77, 63, 36, 2, 111.00, 1, NULL, '2024-02-21 13:02:21', '2024-02-21 13:02:21'),
(78, 64, 22, 1, 111.00, 1, NULL, '2024-02-21 13:19:55', '2024-02-21 13:19:55'),
(79, 64, 36, 2, 111.00, 1, NULL, '2024-02-21 13:19:55', '2024-02-21 13:19:55'),
(80, 65, 22, 1, 111.00, 1, NULL, '2024-02-21 14:18:37', '2024-02-21 14:18:37'),
(81, 65, 36, 2, 111.00, 1, NULL, '2024-02-21 14:18:37', '2024-02-21 14:18:37'),
(82, 66, 22, 1, 111.00, 1, NULL, '2024-02-21 14:26:39', '2024-02-21 14:26:39'),
(83, 66, 36, 2, 111.00, 1, NULL, '2024-02-21 14:26:39', '2024-02-21 14:26:39'),
(84, 67, 22, 1, 111.00, 1, NULL, '2024-02-21 19:52:54', '2024-02-21 19:52:54'),
(85, 67, 36, 2, 111.00, 1, NULL, '2024-02-21 19:52:54', '2024-02-21 19:52:54'),
(86, 68, 22, 1, 111.00, 1, NULL, '2024-02-21 19:55:22', '2024-02-21 19:55:22'),
(87, 68, 36, 2, 111.00, 1, NULL, '2024-02-21 19:55:22', '2024-02-21 19:55:22'),
(88, 69, 22, 1, 111.00, 1, NULL, '2024-02-21 19:58:29', '2024-02-21 19:58:29'),
(89, 69, 36, 2, 111.00, 1, NULL, '2024-02-21 19:58:29', '2024-02-21 19:58:29'),
(90, 70, 22, 1, 111.00, 1, NULL, '2024-02-21 20:12:47', '2024-02-21 20:12:47'),
(91, 70, 36, 2, 111.00, 1, NULL, '2024-02-21 20:12:47', '2024-02-21 20:12:47'),
(92, 71, 22, 1, 111.00, 1, NULL, '2024-02-21 20:28:19', '2024-02-21 20:28:19'),
(93, 71, 36, 2, 111.00, 1, NULL, '2024-02-21 20:28:19', '2024-02-21 20:28:19'),
(94, 72, 37, 1, 2500.00, 1, NULL, '2024-02-22 09:29:12', '2024-02-22 09:29:12'),
(95, 73, 22, 1, 111.00, 1, NULL, '2024-02-22 10:02:46', '2024-02-22 10:02:46'),
(96, 73, 36, 2, 111.00, 1, NULL, '2024-02-22 10:02:46', '2024-02-22 10:02:46'),
(97, 74, 22, 1, 111.00, 1, NULL, '2024-02-22 10:15:01', '2024-02-22 10:15:01'),
(98, 74, 36, 2, 111.00, 1, NULL, '2024-02-22 10:15:01', '2024-02-22 10:15:01'),
(99, 75, 22, 1, 111.00, 1, NULL, '2024-02-22 10:39:34', '2024-02-22 10:39:34'),
(100, 75, 36, 2, 111.00, 1, NULL, '2024-02-22 10:39:34', '2024-02-22 10:39:34'),
(101, 76, 22, 1, 111.00, 1, NULL, '2024-02-22 10:41:17', '2024-02-22 10:41:17'),
(102, 76, 36, 2, 111.00, 1, NULL, '2024-02-22 10:41:17', '2024-02-22 10:41:17'),
(103, 77, 22, 1, 111.00, 1, NULL, '2024-02-22 10:43:03', '2024-02-22 10:43:03'),
(104, 77, 36, 2, 111.00, 1, NULL, '2024-02-22 10:43:03', '2024-02-22 10:43:03'),
(105, 78, 22, 1, 111.00, 1, NULL, '2024-02-22 10:46:11', '2024-02-22 10:46:11'),
(106, 78, 36, 2, 111.00, 1, NULL, '2024-02-22 10:46:11', '2024-02-22 10:46:11'),
(107, 79, 22, 1, 111.00, 1, NULL, '2024-02-22 10:50:02', '2024-02-22 10:50:02'),
(108, 79, 36, 2, 111.00, 1, NULL, '2024-02-22 10:50:02', '2024-02-22 10:50:02'),
(109, 80, 22, 1, 111.00, 1, NULL, '2024-02-22 10:54:07', '2024-02-22 10:54:07'),
(110, 80, 36, 2, 111.00, 1, NULL, '2024-02-22 10:54:07', '2024-02-22 10:54:07'),
(111, 81, 22, 1, 111.00, 1, NULL, '2024-02-22 11:50:34', '2024-02-22 11:50:34'),
(112, 81, 36, 2, 111.00, 1, NULL, '2024-02-22 11:50:34', '2024-02-22 11:50:34'),
(113, 82, 22, 1, 111.00, 1, NULL, '2024-02-22 12:39:16', '2024-02-22 12:39:16'),
(114, 82, 36, 2, 111.00, 1, NULL, '2024-02-22 12:39:16', '2024-02-22 12:39:16');

-- --------------------------------------------------------

--
-- Table structure for table `o_t_p_s`
--

CREATE TABLE `o_t_p_s` (
  `id` bigint UNSIGNED NOT NULL,
  `code` int NOT NULL,
  `phone` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `o_t_p_s`
--

INSERT INTO `o_t_p_s` (`id`, `code`, `phone`, `created_at`, `updated_at`) VALUES
(1, 673218, 938385477, '2023-12-08 11:12:04', '2023-12-08 11:12:04'),
(3, 270446, 987654321, '2023-12-18 06:14:03', '2023-12-18 06:14:03'),
(4, 158488, 9683824, '2023-12-18 06:15:59', '2023-12-18 06:15:59'),
(6, 841717, 98652471, '2023-12-18 06:32:51', '2023-12-18 06:32:51'),
(7, 525452, 5252, '2023-12-19 07:06:10', '2023-12-19 07:06:10'),
(9, 349692, 123456789, '2024-01-07 10:05:13', '2024-01-07 10:05:13'),
(10, 118590, 84545458, '2024-01-07 10:07:35', '2024-01-07 10:07:35'),
(11, 795059, 5656565, '2024-01-07 10:12:37', '2024-01-07 10:12:41'),
(12, 573048, 858282829, '2024-01-07 10:21:15', '2024-01-07 10:21:15'),
(13, 793766, 29399696, '2024-01-07 10:25:33', '2024-01-07 10:25:45'),
(14, 760816, 285888392, '2024-01-07 10:26:11', '2024-01-07 10:26:16'),
(15, 802247, 39393938, '2024-01-07 10:32:32', '2024-01-07 10:32:32'),
(16, 794517, 929288292, '2024-01-07 10:33:04', '2024-01-07 10:33:10'),
(17, 298345, 29399392, '2024-01-07 10:33:59', '2024-01-07 10:35:02'),
(18, 659939, 283828, '2024-01-07 10:40:26', '2024-01-07 10:40:30'),
(19, 387276, 585858, '2024-01-07 10:41:30', '2024-01-07 11:32:07'),
(20, 876158, 28282, '2024-01-07 10:42:25', '2024-01-07 10:42:29'),
(21, 212965, 2828285, '2024-01-07 10:48:34', '2024-01-07 10:48:37'),
(22, 482793, 595955, '2024-01-07 10:48:52', '2024-01-07 10:48:55'),
(23, 762453, 285958, '2024-01-07 10:49:36', '2024-01-07 10:49:38'),
(24, 378865, 2828258, '2024-01-07 10:50:13', '2024-01-07 10:51:15'),
(25, 972238, 8582882, '2024-01-07 10:56:08', '2024-01-07 10:57:10'),
(26, 958829, 5855885, '2024-01-07 10:59:52', '2024-01-07 11:00:53'),
(27, 354151, 686868, '2024-01-07 11:03:16', '2024-01-07 11:05:24'),
(28, 726000, 28282828, '2024-01-07 11:07:59', '2024-01-07 11:07:59'),
(29, 843375, 5885595, '2024-01-07 11:09:24', '2024-01-07 11:09:28'),
(30, 880167, 8285858, '2024-01-07 11:12:08', '2024-01-07 11:13:16'),
(31, 558829, 8282828, '2024-01-07 11:14:58', '2024-01-07 11:15:02'),
(33, 488846, 8282885, '2024-01-07 11:18:20', '2024-01-07 11:18:20'),
(35, 616856, 8285825, '2024-01-07 11:20:36', '2024-01-07 11:20:36'),
(36, 370407, 5858588, '2024-01-07 11:21:56', '2024-01-07 11:22:00');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'cash', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'dashboard.manage', 'user', '2023-12-18 13:08:44', '2023-12-18 13:08:48'),
(2, 'users.view', 'user', '2022-03-08 08:39:12', '2022-03-08 08:39:12'),
(3, 'users.create', 'user', '2022-03-08 08:39:12', '2022-03-08 08:39:12'),
(4, 'users.edit', 'user', '2022-03-08 08:39:12', '2022-03-08 08:39:12'),
(5, 'users.delete', 'user', '2022-03-08 08:39:12', '2022-03-08 08:39:12'),
(7, 'categories.view', 'user', '2022-03-08 08:42:23', '2022-03-08 08:42:23'),
(8, 'categories.create', 'user', '2022-03-08 08:42:23', '2022-03-08 08:42:23'),
(9, 'categories.edit', 'user', '2022-03-08 08:42:23', '2022-03-08 08:42:23'),
(10, 'categories.delete', 'user', '2022-03-08 08:42:23', '2022-03-08 08:42:23');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `price` double NOT NULL DEFAULT '0',
  `tax` int DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `suggested` int DEFAULT NULL,
  `availability` tinyint(1) NOT NULL DEFAULT '1',
  `product_source` tinyint(1) NOT NULL DEFAULT '0',
  `seller_id` bigint UNSIGNED DEFAULT NULL,
  `subcategory_id` bigint UNSIGNED NOT NULL,
  `commission_id` bigint UNSIGNED NOT NULL,
  `commission_value` double NOT NULL,
  `discount` double NOT NULL DEFAULT '0',
  `discount_status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `tax`, `slug`, `quantity`, `status`, `suggested`, `availability`, `product_source`, `seller_id`, `subcategory_id`, `commission_id`, `commission_value`, `discount`, `discount_status`, `created_at`, `updated_at`) VALUES
(22, 'لحمة طازجة', 'product', 111, NULL, NULL, 1, 1, 1, 1, 0, 1, 1, 1, 10, 0, 0, '2023-12-25 06:02:35', '2023-12-25 06:02:35'),
(36, 'لحمة طازجة اصلية', 'product', 111, NULL, NULL, 1, 1, 1, 1, 0, NULL, 1, 1, 10, 0, 0, '2023-12-26 06:37:52', '2023-12-26 06:37:52'),
(37, 'فليفلة مشكلة', '<p>-Doctorate in Islamic Law</p>\r\n<p>-Academic director and lecturer at various universities and institutions</p>\r\n<p>-More than 12 years of professional experience in the Halal sector</p>', 2500, 21, NULL, 2, 1, 1, 1, 0, 2, 1, 1, 10, 20, 1, '2024-01-01 11:43:25', '2024-01-11 11:27:42'),
(40, 'كوسا بلدية', '<ol>\r\n<li style=\"text-align: right;\">كوسا بلدية من جبل الشيخ&nbsp;<br>مسقية بمية فيجة</li>\r\n</ol>', 2500, NULL, NULL, 20, 1, NULL, 1, 0, 1, 2, 1, 20, 30, 1, '2024-01-02 16:49:16', '2024-01-02 16:56:54');

-- --------------------------------------------------------

--
-- Table structure for table `product_attribute_values`
--

CREATE TABLE `product_attribute_values` (
  `id` bigint UNSIGNED NOT NULL,
  `attribute_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_attribute_values`
--

INSERT INTO `product_attribute_values` (`id`, `attribute_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES
(4, 2, 17, '250', NULL, NULL),
(5, 1, 18, '1', NULL, NULL),
(6, 1, 19, '1', NULL, NULL),
(7, 1, 20, '1', NULL, NULL),
(8, 1, 21, '1', NULL, NULL),
(9, 1, 22, '1', NULL, NULL),
(10, 1, 23, '1', NULL, NULL),
(11, 1, 24, '1', NULL, NULL),
(12, 1, 25, '1', NULL, NULL),
(13, 1, 27, '1', NULL, NULL),
(14, 1, 30, '1', NULL, NULL),
(15, 1, 31, '1', NULL, NULL),
(16, 1, 32, '1', NULL, NULL),
(17, 1, 33, '1', NULL, NULL),
(18, 1, 34, '1', NULL, NULL),
(19, 1, 35, '1', NULL, NULL),
(20, 1, 36, '1', NULL, NULL),
(22, 7, 16, '2', NULL, NULL),
(23, 8, 16, '200g', NULL, NULL),
(25, 7, 38, '2', NULL, NULL),
(26, 8, 38, '500g', NULL, NULL),
(28, 7, 39, '2', NULL, NULL),
(29, 8, 39, '500g', NULL, NULL),
(40, 7, 40, '1', NULL, NULL),
(41, 8, 40, '500g', NULL, NULL),
(44, 7, 37, '1', NULL, NULL),
(45, 8, 37, '500g', NULL, NULL),
(48, 7, 41, '1', NULL, NULL),
(49, 8, 41, '500g', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_related_product`
--

CREATE TABLE `product_related_product` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `related_product_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_related_product`
--

INSERT INTO `product_related_product` (`id`, `product_id`, `related_product_id`, `created_at`, `updated_at`) VALUES
(10, 22, 36, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(2, 'User', 'user', '2023-12-07 16:01:01', '2023-12-07 16:01:01'),
(3, 'MeroRole', 'user', '2023-12-24 06:48:33', '2023-12-24 06:48:33'),
(8, 'ne', 'user', '2023-12-24 08:08:47', '2023-12-24 08:08:47'),
(9, 'test', 'user', '2024-02-04 21:58:20', '2024-02-04 21:58:20'),
(10, 'gu', 'user', '2024-02-04 23:40:46', '2024-02-04 23:40:46');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(2, 3),
(3, 3),
(4, 3),
(5, 3),
(7, 3),
(8, 3),
(9, 3),
(10, 3),
(1, 8),
(1, 9),
(2, 9),
(3, 9),
(4, 9),
(5, 9),
(7, 9),
(8, 9),
(9, 9),
(10, 9),
(1, 10),
(2, 10),
(3, 10),
(4, 10),
(5, 10),
(7, 10),
(8, 10),
(9, 10),
(10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `area_id` bigint UNSIGNED NOT NULL,
  `type` enum('internal','external') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` double NOT NULL DEFAULT '0',
  `discount_status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`id`, `name`, `latitude`, `longitude`, `status`, `area_id`, `type`, `discount`, `discount_status`, `created_at`, `updated_at`) VALUES
(1, 'Seller 2', NULL, NULL, 1, 1, 'internal', 21, 0, '2023-12-07 16:08:28', '2023-12-17 12:51:13'),
(2, 'test', 33.49960754456129, 36.282430958591384, 1, 2, 'external', 0, 0, '2023-12-17 12:35:41', '2023-12-17 12:35:41'),
(7, 'test11', NULL, NULL, 1, 2, 'external', 2, 0, '2023-12-17 12:51:27', '2023-12-18 06:20:37');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Damascus', '2023-12-07 16:06:40', '2023-12-07 16:06:40');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `category_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `name`, `status`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'بقدونس', 1, 1, '2023-12-07 16:22:37', '2023-12-07 16:22:37'),
(2, 'فليفلة اصفر', 1, 1, '2023-12-18 05:53:58', '2023-12-19 05:36:43');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` bigint NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL DEFAULT '2',
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `fcm_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `city_id` bigint UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `birthday`, `email`, `password`, `address`, `phone`, `role_id`, `latitude`, `longitude`, `status`, `fcm_token`, `city_id`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Admin', '2024-01-16', 'admin@admin.com', '$2y$10$g8g9v11V1pil1ewyc88WM.p25/ggQ4.gTWZfqqCN3Wd.Sekz8KC4S', 'address', 938385476, 3, NULL, NULL, 1, NULL, 2, NULL, NULL, '2023-12-17 07:19:53', '2024-01-21 13:12:09'),
(2, 'wassim', 'karam', '2024-01-16', 'wassim1@gmail.com', '$2y$10$G5s.LY9QsxeOBaHe0QP1mexOvNZfBM3C0x8jhCr/D.5BSerw/bXLW', 'address', 938385454, 2, 33.50063069623525, 36.29376238948721, 1, NULL, 1, NULL, NULL, '2023-12-17 07:19:53', '2024-01-19 15:36:19'),
(5, 'قمر', 'الباكير', '2024-01-16', NULL, '$2y$10$NSHeZMpm9e6Ptb9GcCSvQuPgtrqLZiMRZdZUHq8KIWvRiEtePEXH6', NULL, 987654321, 2, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2023-12-17 12:30:22', '2023-12-17 12:46:04'),
(8, 'fff', 'fff', '2024-01-16', NULL, '$2y$10$dF6NInkGF0IyUamh6CYjTuTCO/qHjzqRdnfCzuGkfI8uhdNv0csz2', NULL, 987654333, 2, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2023-12-18 06:04:40', '2023-12-18 06:04:40'),
(9, 'qmar', 'albakeer', '2024-01-16', NULL, '$2y$10$ShLt9Octu5uiXq32hOTz.ugRLjXBIiqUFvR.XdtiEzPmyZ/HGHIOO', NULL, 987654322, 2, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2023-12-18 06:17:50', '2023-12-18 06:31:59'),
(10, 'shawki', 'shawki', '2024-01-16', NULL, '$2y$10$ShLt9Octu5uiXq32hOTz.ugRLjXBIiqUFvR.XdtiEzPmyZ/HGHIOO', NULL, 994297125, 2, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2023-12-19 06:18:34', '2023-12-19 06:18:34'),
(19, 'anwar', 'sh', NULL, 'anwar@anwar.com', '$2y$10$t3LVPKhCJQ6oHMQYDcSl0e/rMQVftDvGUzhswk36Cm39gHeieY6NK', NULL, 936252114, 2, NULL, NULL, 1, 'edYfPsmRSLa9DxpNrfmzhk:APA91bHeRdVpWbhdWIQxVAU-9AK3n6exv6rtHg-T7vRoyOc7jlzOaFDgKZGqxi8AWIXoNt9BQPWDyM-BwFDunedfaB769LGLZsUCLfjfXx-Ppwq_f7N_LM0Ub7w8WNHOn73R9LDb9qJc', NULL, NULL, NULL, '2024-01-03 07:25:23', '2024-01-16 12:00:49'),
(20, 'qhxdhmarrr', 'albakeerceg', '2024-01-06', 'tt@gmail.com', '$2y$10$HE9MHIXTLw8FKpnzygpRL.N.j3R8XZU2bu96iU2HAsAwL5hTg4N1m', NULL, 987654111, 2, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-01-06 10:56:48', '2024-02-22 14:54:56'),
(21, 'mohanad', 'khairallah', NULL, NULL, '$2y$10$Lm616mQ2Q2JaDKLft8qOQ.kqabgkP52Di1xp1jSNo8VnWCueseGd6', NULL, 988447802, 2, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-01-11 11:11:47', '2024-01-11 11:11:47'),
(22, 'gg', 'gh', NULL, NULL, '$2y$10$M.FrFroL5tVYQYdQT9M/9u1zXQe.0w3TYSKJdsXKaia5o7X8u6.ju', NULL, 936258147, 2, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-01-16 15:43:30', '2024-01-16 15:43:30'),
(23, 'hamza', 'zen', NULL, NULL, '$2y$10$.ObcZfdEle0.Wn2WyzDmYuGvjt9dsytj9.9hxvg6TA/VYnLkgubm2', NULL, 936252115, 2, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-01-16 15:45:10', '2024-01-16 15:45:10'),
(24, 'ayham', 'oso', NULL, NULL, '$2y$10$YHOP.pqEDsbqvaCAa88HC.N5PKM4TW2UjNJhM87rfV2nVy1mO0AFa', NULL, 936252112, 2, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-01-18 09:36:50', '2024-01-18 09:36:50'),
(25, 'hesar', 'ibrahim', NULL, NULL, '$2y$10$x.b7IAFiazBu5HbTzOILH.VK5FdhrXeQQMxxxOwxupi85VNmInap6', NULL, 936252118, 2, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-01-18 11:59:19', '2024-01-18 11:59:19'),
(26, 'test', 'test', NULL, NULL, '$2y$10$r4KHKCnzo4k3F/AOUfPUc.DchKB7ld2jmzP/5eN8c.y8g6Zr3KYx2', NULL, 987651111, 2, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-01-18 12:23:26', '2024-01-18 12:23:26'),
(27, 'Gt', 'Gt', NULL, NULL, '$2y$10$OEcilx7MZtl7//dDl561pOQFSWaS0FCfy7Uv1vv2nXyboNkgInqz6', NULL, 958208226, 2, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-01-19 21:02:24', '2024-01-19 21:02:24'),
(28, 'ghina123', 'sharaf', '2024-01-16', 'ghina@gmail.com', '$2y$10$OYm6GDdh6VUlU7HgMRgtluhOJczom3CHxTmVp/O/l63zn8yec/OyW', NULL, 946156989, 2, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-02-07 10:35:14', '2024-02-21 11:17:52'),
(29, 'fgg', 'ffff', NULL, NULL, '$2y$10$QMvEhqDefxUBuYJUEBG2BOzTD/gcR8UjaxXWHzL4Zfr1eT1EBPZ5m', NULL, 986574123, 2, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-02-07 13:21:12', '2024-02-07 13:21:12'),
(30, 'issa', 'halabi', NULL, NULL, '$2y$10$zLr7MPcxX5MYbUWnj2AxFePHR9hZWvw9D16iFohifryK2FqBv7omi', NULL, 946649532, 2, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-02-13 10:31:30', '2024-02-13 10:31:30'),
(31, 'ريم', 'الزعبي', NULL, NULL, '$2y$10$UB6hx7vW6xg59CM0synMmOwXcEJs7/1Cq6at8FY8gIrGmljzU7UGq', NULL, 936213129, 2, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-02-19 12:15:12', '2024-02-19 12:15:12'),
(32, 'ahmad', 'mm', NULL, NULL, '$2y$10$1/Z2NZAy9AFPJtr4rFk64.qVabbLmJCXH/gTQNLyGUYGW/A3jE3x2', NULL, 938544087, 2, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-02-25 12:14:14', '2024-02-25 12:14:14');

-- --------------------------------------------------------

--
-- Table structure for table `user_addresses`
--

CREATE TABLE `user_addresses` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `building` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `building_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `floor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_favourite` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_addresses`
--

INSERT INTO `user_addresses` (`id`, `name`, `address`, `latitude`, `longitude`, `user_id`, `area`, `street`, `building`, `building_number`, `floor`, `is_favourite`, `created_at`, `updated_at`) VALUES
(6, 'سوق', 'سوق', 111, 111, 5, 'المزة', 'شارع', 'بناء', '٥٥', 'عاشر', 0, '2023-12-19 10:04:11', '2023-12-19 10:04:11'),
(7, 'حمص', 'عبع', 111, 111, 5, 'المزة', 'اؤ', 'اؤغب', 'اب', 'تر', 0, '2023-12-19 10:10:25', '2023-12-19 10:10:25'),
(8, 'تتتت', 'تتت', 111, 111, 5, 'المزة', 'للل', 'غب', 'بب', 'للل', 0, '2023-12-19 10:11:55', '2023-12-19 10:11:55'),
(11, 'tsgd', 'dydyd', 111, 111, 20, 'المزة', 'dhd', 'hxh', 'hxh', 'xhxhx', 0, '2024-01-06 11:25:59', '2024-01-06 11:25:59'),
(12, 'rh', 'feg', 111, 111, 20, 'المزة', 'gsge', 'feg', 'csg', 'vdv', 1, '2024-01-10 08:21:09', '2024-02-21 10:07:15'),
(13, 'z4g4g', 'grgr', 111, 111, 20, 'المزة', 'vrgr', 'vdv', 'cevr', 'geg', 0, '2024-01-10 08:23:27', '2024-01-10 08:23:27'),
(14, 'rg4g', 'rc', 111, 111, 20, 'المزة', 'vzb', 'vtvt', 'crcr', 'rcf', 0, '2024-01-10 08:25:05', '2024-01-10 08:25:05'),
(15, 'fcr', 'dex', 111, 111, 20, 'المزة', 'dwx', 'ywx3', 'cex', 'crc', 0, '2024-01-10 08:37:21', '2024-01-10 08:37:21'),
(16, '4gr', 'f4t', 111, 111, 20, 'المزة', 'فةفا', 'ةفىق', 'ىير', 'ب ث', 0, '2024-01-10 08:42:44', '2024-01-10 08:42:44'),
(17, 'ttt', 'dfg', 111, 111, 20, 'المزة', 'rtt', 'dfg', 'dgg', 'xb', 0, '2024-01-10 08:47:26', '2024-01-10 08:47:26'),
(18, 'tctv', 'tct', 111, 111, 20, 'المزة', 'g g', 'xv', 'cb', 'vb', 0, '2024-01-10 08:49:28', '2024-01-10 08:49:28'),
(19, 'fvr', 'feg', 111, 111, 20, 'المزة', 'rbr', 'cec', 'fbr', 'tf', 0, '2024-01-10 08:51:03', '2024-01-10 08:51:03'),
(20, 'juj', 'nzn', 111, 111, 20, 'المزة', 'nzn', 'bzn', 'bzn', 'hzj', 0, '2024-01-10 09:01:17', '2024-01-10 09:01:17'),
(21, 'uku', '7m7', 111, 111, 20, 'المزة', 'k7', 'um', 'gsg', 'gdh', 0, '2024-01-10 09:05:11', '2024-01-10 09:05:11'),
(22, 'hrj', 'hhh rz', 111, 111, 20, 'المزة', 'hez', 'ff', 'drr', 'df', 0, '2024-01-10 09:06:21', '2024-01-10 09:06:21'),
(23, 'dhr', 'tw', 111, 111, 20, 'المزة', 'tw', 'bdh', 'gdg', 'rur', 0, '2024-01-10 09:08:54', '2024-01-10 09:08:54'),
(24, 'unu', 'unu', 111, 111, 20, 'المزة', 'nun8', 'munm', 'zbz', 'uj', 0, '2024-01-10 09:10:09', '2024-01-10 09:10:09'),
(25, 'tjt', 'znt', 111, 111, 20, 'المزة', 'zn', 'zmz', 'um', 'mum', 0, '2024-01-10 09:11:24', '2024-01-10 09:11:24'),
(26, 'ururr', 'fjt', 33.518142769667094, 36.258938088294535, 19, 'المزة', 'rut', 'eye', 'dhd', 'dhddhdh', 1, '2024-01-14 09:15:30', '2024-01-28 13:34:01'),
(27, 'dgfh', 'f fc', 111, 111, 20, 'المزة', 'gtvtv', 'tvtv', 'rcf', 'vtv', 1, '2024-01-14 11:55:12', '2024-01-18 09:10:56'),
(28, 'حمص', 'حلب', 111, 111, 20, 'المزة', 'فىفةف', 'ل لة', 'بىلة', 'واة', 1, '2024-01-14 12:03:22', '2024-01-18 09:37:12'),
(29, 'gfd', 'zdsfc', 111, 111, 19, 'المزة', 'sfsdv', 'fs', 'sfd', 'sfd', 0, '2024-01-15 14:15:42', '2024-01-15 14:15:42'),
(30, 'x\\z', '\\xz', 111, 111, 19, 'المزة', '\\xz', '\\zx', '\\xz', '\\x', 1, '2024-01-15 14:16:54', '2024-01-18 09:27:53'),
(31, 'حمص', 'تيست', 111, 111, 20, 'المزة', 'اوزز', 'لاوو', 'ىةوو', 'لىاة', 1, '2024-01-16 09:09:20', '2024-01-18 09:08:31'),
(32, 'وب', 'نغ', 111, 111, 20, 'المزة', 'مع', 'ظع', 'غزغ', 'معظ', 0, '2024-01-16 10:03:41', '2024-01-16 10:03:41'),
(33, 'قة', 'قة', 33.510475738573014, 36.28506872802973, 20, 'غز', 'ىقى', 'ب ب', 'قة', 'ىقى', 1, '2024-01-16 10:06:04', '2024-01-21 11:42:04'),
(34, 'اا', 'تيتست', 33.501941271223146, 36.28847111016512, 20, 'تستست', 'تيتيت', 'تؤتيت', 'وتو', 'غغع', 0, '2024-01-16 14:41:22', '2024-01-16 14:41:22'),
(35, 'انور شيخ الارض', 'مزة', 33.49994256119203, 36.270956620574, 19, 'شام', 'شارع العابد', 'بناء الادخار', '٤', '٥', 1, '2024-01-16 15:28:34', '2024-01-16 15:28:34'),
(36, 'gg', 'hehe', 33.49437757833744, 36.272387243807316, 23, 'usu', 'ee', 'ee', 'hh', 'vv', 1, '2024-01-16 15:46:25', '2024-01-17 15:43:38'),
(37, 'asdaث', 'asd', 37.417025164559256, -122.06982538104056, 24, 'asda', 'asd', 'asd', 'asd', 'asd', 1, '2024-01-18 09:58:16', '2024-01-18 10:54:52'),
(38, 'zozo almaestro', 'abo alnour', 37.41944008909307, -122.09274619817734, 25, 'rakn aldeen', 'shar3 30', '5', '2', '3', 0, '2024-01-18 12:16:39', '2024-01-18 12:16:39'),
(39, 'تثتس', 'جباصيني', 33.53817005557754, 36.29884924739599, 25, 'بيت ميار', '٣٠', '٢', '٢', '٢', 1, '2024-01-18 12:24:10', '2024-01-18 15:49:12'),
(40, 'المنزل', 'كشكول', 33.554960536751445, 36.36367488652468, 26, 'دمشق', 'شارع كباس', 'بناء اول', 'رقم اول', 'طابق تاني', 0, '2024-01-18 12:25:06', '2024-01-18 12:25:06'),
(41, 'رترط', 'زتيتي', 33.48389305581207, 36.337066031992435, 1, 'ااستس', 'طتنس', 'رريري', 'سرريس', 'ررظس', 1, '2024-01-19 20:53:49', '2024-01-19 20:54:43'),
(42, 'jkjk', 'kkkk', 37.430722817906194, -122.08597797900438, 28, 'kkk', 'jkj', 'kj', 'jkjkl', 'jkjk', 1, '2024-02-07 10:40:00', '2024-02-07 10:44:33'),
(43, 'bbbb', 'yyy', 37.956513640470135, -121.69837698340416, 30, 'uuu', 'uu', 'hhh', 'ggg', 'ddd', 1, '2024-02-19 15:37:03', '2024-02-19 15:37:17'),
(44, 'gc GC', 'hvhv', 33.516979461853985, 36.280118711292744, 20, 'دمشق', 'gcg', 'ycgc', 'tgc', 'uvyv', 0, '2024-02-21 10:06:49', '2024-02-21 10:06:49'),
(45, 'مهاجرين', 'مهاجرين', 33.521715360830484, 36.27756055444479, 20, 'مهاجرين', 'مهاجرسن', 'غىغةع', 'dvf', 'tff', 1, '2024-02-21 10:09:24', '2024-02-21 10:09:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `areas_name_index` (`name`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_values_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_name_index` (`name`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_state_id_foreign` (`state_id`);

--
-- Indexes for table `commissions`
--
ALTER TABLE `commissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_attributes`
--
ALTER TABLE `delivery_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_methods`
--
ALTER TABLE `delivery_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_time_infos`
--
ALTER TABLE `delivery_time_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `drivers_email_unique` (`email`),
  ADD KEY `drivers_city_id_foreign` (`city_id`),
  ADD KEY `drivers_email_index` (`email`),
  ADD KEY `drivers_phone_index` (`phone`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `favorits`
--
ALTER TABLE `favorits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gifts`
--
ALTER TABLE `gifts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gifts_name_index` (`name`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_order_column_index` (`order_column`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_delivery_method_id_foreign` (`delivery_method_id`),
  ADD KEY `orders_payment_method_id_foreign` (`payment_method_id`),
  ADD KEY `orders_user_address_id_foreign` (`user_address_id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_driver_id_foreign` (`driver_id`);

--
-- Indexes for table `order_delivery_attributes`
--
ALTER TABLE `order_delivery_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_delivery_attributes_order_id_foreign` (`order_id`),
  ADD KEY `order_delivery_attributes_delivery_attribute_id_foreign` (`delivery_attribute_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_order_id_foreign` (`order_id`),
  ADD KEY `order_details_product_id_foreign` (`product_id`);

--
-- Indexes for table `o_t_p_s`
--
ALTER TABLE `o_t_p_s`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_name_index` (`name`),
  ADD KEY `products_slug_index` (`slug`);

--
-- Indexes for table `product_attribute_values`
--
ALTER TABLE `product_attribute_values`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_related_product`
--
ALTER TABLE `product_related_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_related_product_product_id_foreign` (`product_id`),
  ADD KEY `product_related_product_related_product_id_foreign` (`related_product_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sellers_area_id_foreign` (`area_id`),
  ADD KEY `sellers_name_index` (`name`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_categories_category_id_foreign` (`category_id`),
  ADD KEY `sub_categories_name_index` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_city_id_foreign` (`city_id`),
  ADD KEY `users_email_index` (`email`),
  ADD KEY `users_phone_index` (`phone`);

--
-- Indexes for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_addresses_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `attribute_values`
--
ALTER TABLE `attribute_values`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `commissions`
--
ALTER TABLE `commissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `delivery_attributes`
--
ALTER TABLE `delivery_attributes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `delivery_methods`
--
ALTER TABLE `delivery_methods`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `delivery_time_infos`
--
ALTER TABLE `delivery_time_infos`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorits`
--
ALTER TABLE `favorits`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gifts`
--
ALTER TABLE `gifts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `order_delivery_attributes`
--
ALTER TABLE `order_delivery_attributes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `o_t_p_s`
--
ALTER TABLE `o_t_p_s`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `product_attribute_values`
--
ALTER TABLE `product_attribute_values`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `product_related_product`
--
ALTER TABLE `product_related_product`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `user_addresses`
--
ALTER TABLE `user_addresses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD CONSTRAINT `attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `drivers`
--
ALTER TABLE `drivers`
  ADD CONSTRAINT `drivers_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_delivery_method_id_foreign` FOREIGN KEY (`delivery_method_id`) REFERENCES `delivery_methods` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_user_address_id_foreign` FOREIGN KEY (`user_address_id`) REFERENCES `user_addresses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_delivery_attributes`
--
ALTER TABLE `order_delivery_attributes`
  ADD CONSTRAINT `order_delivery_attributes_delivery_attribute_id_foreign` FOREIGN KEY (`delivery_attribute_id`) REFERENCES `delivery_attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_delivery_attributes_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_related_product`
--
ALTER TABLE `product_related_product`
  ADD CONSTRAINT `product_related_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `product_related_product_related_product_id_foreign` FOREIGN KEY (`related_product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sellers`
--
ALTER TABLE `sellers`
  ADD CONSTRAINT `sellers_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD CONSTRAINT `sub_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD CONSTRAINT `user_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
