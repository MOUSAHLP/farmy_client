-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 10, 2024 at 03:01 PM
-- Server version: 8.0.37
-- PHP Version: 8.1.28

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
-- Table structure for table `achievements`
--

CREATE TABLE `achievements` (
  `id` bigint UNSIGNED NOT NULL,
  `achievement` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `points` bigint NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `segments` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `achievements`
--

INSERT INTO `achievements` (`id`, `achievement`, `points`, `description`, `segments`) VALUES
(1, '{\"ar\":\"انشاء حساب\",\"en\":\"Create an account\"}', 100, '{\"ar\":\"عند انشائك لحساب ستحصل على 100 نقطة\",\"en\":\"When you create an account, you will get 100 points\"}', 1),
(2, '{\"ar\":\"مشاركة رابط تطبيق مع الأصدقاء\",\"en\":\"Share the application link with friends\"}', 50, '{\"ar\":\"عند تحقيق الشروط ستحصل على 50 نقطة\",\"en\":\"When you fulfill the conditions, you will get 50 points\"}', 1),
(3, '{\"ar\":\"تقييم عملية الشراء\",\"en\":\"Rate a purchase\"}', 5, '{\"ar\":\"عند تقييم كل طلب ستحصل على 5 نقاط\",\"en\":\"When you rate an order, you will receive 5 points\"\n}', 0),
(4, '{\"ar\":\"اضافة تاريخ ميلادك الى ملفك الشخصي\",\"en\":\"Add your date of birth to your profile\"}', 10, '{\"ar\":\"أضف تاريخ ميلادك في `حسابي` و ستحصل على 10 نقاط\",\"en\":\"Add your date of birth in \'My Account\' and you will get 10 points\"\n}', 1),
(5, '{\"ar\":\"اتمام عملية الشراء\",\"en\":\"Complete the purchase process\"}', 1, '{\"ar\":\"عند اتمام عملية الشراء ستحصل على نقطة مقابل كل 1000 ليرة\",\"en\":\"When you complete the purchase process, you will get a point for every 1000 pound\"\n}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `achievement_users`
--

CREATE TABLE `achievement_users` (
  `id` bigint UNSIGNED NOT NULL,
  `achievement_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `achievement_users`
--

INSERT INTO `achievement_users` (`id`, `achievement_id`, `user_id`) VALUES
(1, 2, 20),
(5, 1, 49),
(6, 1, 50),
(7, 4, 50),
(8, 1, 51);

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(1, '{\"ar\":\"جرمانا\"}', 1, 33.3, 33.3, '2023-12-07 16:08:10', '2023-12-18 07:49:40'),
(2, '{\"ar\":\"شسي\"}', 0, 33.53894066554306, 36.29911617071872, '2023-12-17 12:28:33', '2023-12-17 12:28:33'),
(11, '{\"ar\":\"شس\"}', 0, 33.52509070970108, 36.22134157615328, '2024-06-03 11:27:10', '2024-06-03 11:27:10'),
(12, '{\"ar\":\"انا\"}', 0, 33.52506117231969, 36.2213126844636, '2024-06-03 11:30:02', '2024-06-03 11:30:02'),
(13, '{\"ar\":\"ةعةغ\"}', 0, 33.52506862567761, 36.22129111420058, '2024-06-03 11:30:20', '2024-06-03 11:30:20');

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(7, '{\"ar\":\"عدد القطع\",\"en\":\"the number of pieces\"}', 0, '2023-12-28 08:57:56', '2023-12-28 08:57:56'),
(8, '{\"ar\":\"الوزن\",\"en\":\"the weight\"}', 0, '2023-12-28 08:59:37', '2023-12-28 08:59:37');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` bigint UNSIGNED NOT NULL,
  `attribute_id` bigint UNSIGNED NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_values`
--

INSERT INTO `attribute_values` (`id`, `attribute_id`, `value`, `created_at`, `updated_at`) VALUES
(46, 7, '1', '2024-03-14 14:35:23', '2024-03-14 14:35:23'),
(47, 7, '2', '2024-03-14 14:35:23', '2024-03-14 14:35:23'),
(48, 7, '15', '2024-03-14 14:35:23', '2024-03-14 14:35:23'),
(49, 8, '200g', '2024-03-14 14:35:39', '2024-03-14 14:35:39'),
(50, 8, '500g', '2024-03-14 14:35:39', '2024-03-14 14:35:39'),
(51, 8, '400g', '2024-03-14 14:35:39', '2024-03-14 14:35:39');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint UNSIGNED NOT NULL,
  `type` enum('section1','section2') COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_time` date NOT NULL DEFAULT '2023-12-08',
  `end_time` date NOT NULL DEFAULT '2024-12-08',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `type`, `link`, `start_time`, `end_time`, `created_at`, `updated_at`) VALUES
(11, 'section1', 'https://googel.com/', '2024-03-03', '2024-03-31', '2024-03-14 15:02:27', '2024-03-14 15:02:27'),
(12, 'section1', 'https://googel.com/', '2024-03-03', '2024-03-31', '2024-03-14 15:02:40', '2024-03-14 15:02:40'),
(13, 'section2', 'https://googel.com/', '2024-03-03', '2024-03-31', '2024-03-14 15:02:54', '2024-03-14 15:02:54');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, '{\"ar\":\"خضار و أعشاب\",\"en\":\"Veggies & herbs\"}', 1, '2023-12-07 16:22:22', '2023-12-07 16:22:22'),
(11, '{\"ar\":\"فواكه\",\"en\":\"fruits\"}', 1, '2024-03-14 14:50:58', '2024-03-14 14:50:58'),
(12, '{\"ar\":\"بذور و مكسرات\",\"en\":\"Seeds and nuts\"}', 1, '2024-03-14 14:51:20', '2024-03-14 14:51:20'),
(13, '{\"ar\":\"منتجات الألبان\",\"en\":\"Dairy products\"}', 1, '2024-03-14 14:51:52', '2024-04-30 13:39:46'),
(14, '{\"ar\":\"الحليب والبيض\",\"en\":\"Milk and egg\"}', 1, '2024-03-14 14:52:16', '2024-04-30 13:40:09'),
(15, '{\"ar\":\"المخبوزات\",\"en\":\"baked goods\"}', 1, '2024-03-14 14:52:38', '2024-04-30 13:40:30'),
(16, '{\"ar\":\"أسماك\",\"en\":\"Fish\"}', 1, '2024-03-14 14:53:22', '2024-04-30 13:40:48'),
(21, '{\"ar\":\"المياه المعدنية\",\"en\":\"mineral water\"}', 1, '2024-03-14 14:53:48', '2024-04-24 08:27:55'),
(22, '{\"ar\":\"لحوم\",\"en\":\"Meat\"}', 1, '2024-04-30 13:42:44', '2024-04-30 13:42:44');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `state_id`, `created_at`, `updated_at`) VALUES
(1, '{\"ar\":\"جرمانا\",\"en\":\"Jaramana\"}', 1, '2023-12-07 16:07:05', '2023-12-07 16:07:05'),
(2, '{\"ar\":\"مزة\",\"en\":\"mezze\"}', 1, '2023-12-18 07:50:52', '2023-12-18 07:50:52');

-- --------------------------------------------------------

--
-- Table structure for table `commissions`
--

CREATE TABLE `commissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `commissions`
--

INSERT INTO `commissions` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, '{\"ar\":\"test\"}', '2023-12-07 16:01:01', '2024-01-16 09:59:27'),
(6, '{\"ar\":\"amount\"}', '2024-01-02 16:43:46', '2024-01-02 16:43:46');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `email`, `notes`, `created_at`, `updated_at`) VALUES
(1, 'email@gmail.com', 'test', '2024-03-24 15:43:24', '2024-03-24 15:43:24'),
(2, 'email@gmail.com', 'test', '2024-03-25 09:44:54', '2024-03-25 09:44:54'),
(3, 'email@gmail.com', 'test', '2024-03-26 09:35:02', '2024-03-26 09:35:02'),
(4, 'email@gmail.com', 'test', '2024-03-26 09:42:17', '2024-03-26 09:42:17'),
(5, 'email@gmail.com', 'test', '2024-03-26 10:46:51', '2024-03-26 10:46:51'),
(6, 'email@gmail.com', 'test', '2024-03-26 10:59:29', '2024-03-26 10:59:29'),
(7, 'email@gmail.com', 'test', '2024-03-26 11:08:12', '2024-03-26 11:08:12'),
(8, 'email@gmail.com', 'notes', '2024-03-26 11:08:24', '2024-03-26 11:08:24'),
(9, 'email@gmail.com', 'rrr', '2024-03-26 11:13:28', '2024-03-26 11:13:28'),
(10, 'emeeeail@gmail.com', 'test', '2024-03-26 11:13:42', '2024-03-26 11:13:42'),
(11, 'ahamd@gmail.com', 'rrr', '2024-03-26 11:14:04', '2024-03-26 11:14:04'),
(12, 'ahamd@gmail.com', 'rrr', '2024-03-26 11:18:14', '2024-03-26 11:18:14'),
(13, 'ahamd@gwmail.com', 'rrr', '2024-03-26 11:18:18', '2024-03-26 11:18:18'),
(14, 'ahamd@gwmail.cwom', 'rrr', '2024-03-26 11:18:26', '2024-03-26 11:18:26'),
(15, 'ahamd@gmail', 'ddddddddddd', '2024-03-26 11:18:57', '2024-03-26 11:18:57'),
(16, 'email@gmail', 'test', '2024-03-26 11:19:48', '2024-03-26 11:19:48'),
(17, 'a@gmail.com', 'eeee', '2024-03-26 11:29:29', '2024-03-26 11:29:29'),
(18, 'e@gamail.com', 'fff', '2024-03-26 11:30:40', '2024-03-26 11:30:40'),
(19, 'ahamd@gmail.com', 'ddddddddddddd', '2024-04-03 09:12:16', '2024-04-03 09:12:16'),
(20, 'ahamd@gmail.com', 'ddddddddddddd', '2024-04-03 09:12:16', '2024-04-03 09:12:16'),
(21, 'ahamd@gmail.com', 'ddddddddddddd', '2024-04-03 09:12:17', '2024-04-03 09:12:17'),
(22, 'a@gamil.com', 'wwww', '2024-04-03 09:40:21', '2024-04-03 09:40:21'),
(23, 'ahad@gmail.com', '22222', '2024-04-03 09:44:04', '2024-04-03 09:44:04'),
(24, 'ahad@gmail.com', '22222', '2024-04-03 09:44:21', '2024-04-03 09:44:21'),
(25, 'ahad@gmail.com', '22222', '2024-04-03 09:44:32', '2024-04-03 09:44:32'),
(26, 'a@gamil.com3', 'eeeee', '2024-04-03 09:45:22', '2024-04-03 09:45:22'),
(27, 'ahmad@gamil.com', 'aa33', '2024-04-03 09:47:16', '2024-04-03 09:47:16'),
(28, 'a@gmail.com', 'wwwwwwwwww', '2024-04-03 09:48:44', '2024-04-03 09:48:44'),
(29, 'g@gmail.com', 'Hi Majed #_#', '2024-04-03 09:52:30', '2024-04-03 09:52:30'),
(30, 'a@gmail.com', 'wsw2', '2024-04-03 09:53:36', '2024-04-03 09:53:36'),
(31, 'r@gmail.com', '3333333333', '2024-04-03 09:54:29', '2024-04-03 09:54:29'),
(32, 'w@gamil.com', 'fffff', '2024-04-03 09:56:51', '2024-04-03 09:56:51'),
(33, 'e@gmail.com', 'gggggg', '2024-04-03 10:00:05', '2024-04-03 10:00:05'),
(34, 'ggg@gmail.com', 'g g ub', '2024-04-04 09:09:20', '2024-04-04 09:09:20'),
(35, 'ggg@gmail.cok', 'yvyvcyt', '2024-04-04 09:11:01', '2024-04-04 09:11:01'),
(36, 'ggg@gmail.cok', 'yvyvcyt', '2024-04-04 09:11:53', '2024-04-04 09:11:53'),
(37, 'tamaramari.1998@gmail.com', 'kkk', '2024-04-22 14:58:28', '2024-04-22 14:58:28'),
(38, 'a@gmail.com', 'hhhhy', '2024-04-23 09:09:35', '2024-04-23 09:09:35'),
(39, 'a@gmail.com', 'hhhhy', '2024-04-23 09:09:36', '2024-04-23 09:09:36'),
(40, 'rr@gmail.com', 'ggg', '2024-04-23 10:15:41', '2024-04-23 10:15:41'),
(41, 'fff@gmail.com', 'hhh', '2024-04-23 10:24:17', '2024-04-23 10:24:17'),
(42, 'test@gmail.fon', 'عم تستت', '2024-04-23 13:16:50', '2024-04-23 13:16:50');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `coupon_type_id` bigint UNSIGNED NOT NULL,
  `value` bigint NOT NULL,
  `price` int DEFAULT '0',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `coupon_type_id`, `value`, `price`, `description`, `created_at`) VALUES
(3, 1, 3500, 100, '{\"ar\":\"احصل على خصم بقيمة 3500 ل.س\",\"en\":\"Get a discount of 3,500 SYP\"}', '2024-02-10 16:37:11'),
(4, 1, 7000, 200, '{\"ar\":\"احصل على خصم بقيمة 7000 ل.س\",\"en\":\"Get a discount of 7000 SYP\"}', '2024-02-22 10:54:25'),
(5, 1, 10500, 300, '{\"ar\":\"احصل على خصم بقيمة 10500 ل.س\",\"en\":\"Get a discount of 10,500 SYP\"}', '2024-02-27 10:26:30'),
(6, 1, 17500, 500, '{\"ar\":\"احصل على خصم بقيمة 17500 ل.س\",\"en\":\"Get a discount of 17,500 SYP\"}', '2024-02-17 17:32:18'),
(7, 1, 35000, 1000, '{\"ar\":\"احصل على خصم بقيمة 35000 ل.س\",\"en\":\"Get a discount of 35,00 SYP\"}', '2024-02-10 18:28:39'),
(24, 2, 10, 1000, '{\"ar\":\"احصل على خصم بقيمة 10% من سعر المنتجات\",\"en\":\"Get a 10% discount on the price of the products\"}', '2024-04-02 14:05:28'),
(30, 3, 10, 1000, '{\"ar\":\"احصل على خصم بقيمة 10% من سعر التوصيل\",\"en\":\"Get a 10% discount on the delivery price\"}', '2024-04-02 14:05:28');

-- --------------------------------------------------------

--
-- Table structure for table `coupons_types`
--

CREATE TABLE `coupons_types` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons_types`
--

INSERT INTO `coupons_types` (`id`, `name`, `image`, `type`) VALUES
(1, '{\"ar\":\"كاش باك\",\"en\":\"cash\"}', 'ff1_1711023123.svg', 1),
(2, '{\"ar\":\"حسم على قيمة المشتريات\",\"en\":\"Products price discount\"}', 'Group_6_1711016608.svg', 2),
(3, '{\"ar\":\"حسم توصيل\",\"en\":\"delivery discount\"}', 'DELEVERING-01_1711023203.svg', 3);

-- --------------------------------------------------------

--
-- Table structure for table `coupons_users`
--

CREATE TABLE `coupons_users` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `coupon_id` bigint UNSIGNED NOT NULL,
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon_resource` int NOT NULL,
  `used_at` datetime DEFAULT NULL,
  `expire_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_attributes`
--

CREATE TABLE `delivery_attributes` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_attributes`
--

INSERT INTO `delivery_attributes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, '{\"ar\":\"عدم رن الجرس\",\"en\":\"Not ringing the bell\"}', '2023-12-08 11:53:27', '2024-01-01 15:26:10'),
(2, '{\"ar\":\"الاتصال بي عند الوصول\",\"en\":\"Contact me when arrival\"}', '2024-01-02 06:54:20', '2024-01-02 06:54:20'),
(3, '{\"ar\":\"التواصل عند عدم توفر منتج ما\",\"en\":\"Communicate when a product is not available\"}', '2024-01-02 08:20:20', '2024-01-02 08:20:20');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_methods`
--

CREATE TABLE `delivery_methods` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` int NOT NULL,
  `price` double NOT NULL DEFAULT '0',
  `is_schedule` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_methods`
--

INSERT INTO `delivery_methods` (`id`, `name`, `time`, `price`, `is_schedule`, `created_at`, `updated_at`) VALUES
(1, '{\"ar\":\"طلب عادي\",\"en\":\"Normal order\"}', 45, 1500, 0, NULL, NULL),
(2, '{\"ar\":\"طلب مستعجل\",\"en\":\"Urgent order\"}', 25, 3000, 0, NULL, NULL),
(3, '{\"ar\":\"طلب مجدول\",\"en\":\"Scheduled order\"}', 0, 1500, 1, '2024-01-02 08:20:07', '2024-01-02 08:20:07');

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
(1, '10:00:00', '22:00:00', 'opening in this time', 'close in this time ', NULL, '2024-03-21 09:56:11');

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `phone` bigint NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `online_status` tinyint(1) NOT NULL DEFAULT '1',
  `fcm_token` text COLLATE utf8mb4_unicode_ci,
  `city_id` bigint UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`id`, `first_name`, `last_name`, `email`, `password`, `address`, `birthday`, `phone`, `latitude`, `longitude`, `status`, `online_status`, `fcm_token`, `city_id`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'issa', 'halabi', 'issa@gmail.com', '$2y$12$Iv8OwccwQGAYQxze4E9Lh.erkVGf20eDmmH8iB6p76J7k0RxmJ/cG', NULL, '2024-01-17', 946649532, NULL, NULL, 1, 1, 'eWoQydnVRXihRlnUiEwyfR:APA91bFnSe8Qulas-eyogWC0yKR5tDWD6BMDY7m49tuk26TJFPgBpAa9uZWmE3xfgdQq48ksNQalxpxbSVChititUJuEM9N-AJGXlwTi1SkVyecPne5tEa_hnAcINtM_bw9XlPzQlvdJ', NULL, NULL, NULL, '2024-03-28 09:03:33', '2024-05-12 11:30:26'),
(2, 'qmiar yyy', 'qmar', 'qma1ra@gmail.com', '$2y$12$cPABy81x38aTpXz1F3TzluZRYIsTbtxscXk7N7dOUKsmYDW2GvK9C', NULL, '2024-01-17', 987654320, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2024-03-31 10:05:33', '2024-04-30 14:59:29'),
(3, 'qmar', 'qmar', 'qmara@gmail.com', '$2y$12$R8nsWK44LHmHhZ.Mwsv0DO32T2JkIA3oRXL3qb56YmHa5yRHtYcM.', NULL, NULL, 987654321, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2024-04-03 09:30:11', '2024-04-03 09:30:11'),
(5, 'qmiar yyy', 'qmar', 'qma@gmail.com', '$2y$12$R8nsWK44LHmHhZ.Mwsv0DO32T2JkIA3oRXL3qb56YmHa5yRHtYcM.', NULL, '2024-01-17', 987654320, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2024-03-31 10:05:33', '2024-04-17 08:18:12'),
(6, 'testasd', 'test', 'miametestd@miamed.com', '123456789', NULL, NULL, 5387582, NULL, NULL, 1, 1, NULL, 1, NULL, NULL, '2024-05-02 13:21:31', '2024-05-02 13:25:35'),
(7, 'ثبث', 'ثب', 'cdscsdc@miamed.com', '123456789', NULL, NULL, 5387582, NULL, NULL, 1, 1, NULL, 1, NULL, NULL, '2024-05-02 13:39:35', '2024-05-02 13:39:35'),
(8, 'Majd', 'Saati', 'miaedwedmed@miamed.com', '123456789', NULL, NULL, 5387582, NULL, NULL, 1, 1, NULL, 1, NULL, NULL, '2024-05-02 13:40:06', '2024-05-02 13:40:06');

-- --------------------------------------------------------

--
-- Table structure for table `driver_types`
--

CREATE TABLE `driver_types` (
  `id` bigint UNSIGNED NOT NULL,
  `driver_id` bigint UNSIGNED NOT NULL,
  `type` int NOT NULL,
  `value` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `driver_types`
--

INSERT INTO `driver_types` (`id`, `driver_id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(1, 6, 1, 120000, '2024-05-02 13:21:31', '2024-05-02 13:21:31'),
(2, 7, 2, 121, '2024-05-02 13:39:35', '2024-05-02 13:39:35'),
(3, 8, 2, 121, '2024-05-02 13:40:06', '2024-05-02 13:40:06'),
(4, 1, 1, 120000, '2024-05-02 13:21:31', '2024-05-02 13:21:31'),
(5, 2, 2, 121, '2024-05-02 13:39:35', '2024-05-02 13:39:35'),
(6, 3, 2, 121, '2024-05-02 13:40:06', '2024-05-02 13:40:06'),
(7, 5, 2, 121, '2024-05-02 13:40:06', '2024-05-02 13:40:06');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
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
(1, 1, 2, '2024-01-08 07:08:41', NULL),
(57, 30, 37, '2024-03-04 08:54:34', '2024-03-04 08:54:34'),
(59, 30, 22, '2024-03-04 12:10:37', '2024-03-04 12:10:37'),
(60, 30, 22, '2024-03-04 12:26:13', '2024-03-04 12:26:13'),
(77, 20, 43, '2024-03-14 10:36:56', '2024-03-14 10:36:56'),
(86, 30, 40, '2024-03-14 14:44:12', '2024-03-14 14:44:12'),
(95, 47, 40, '2024-04-02 16:02:47', '2024-04-02 16:02:47'),
(97, 20, 49, '2024-04-16 11:43:03', '2024-04-16 11:43:03'),
(99, 50, 46, '2024-04-23 11:01:10', '2024-04-23 11:01:10'),
(100, 50, 49, '2024-04-23 11:01:12', '2024-04-23 11:01:12'),
(102, 20, 81, '2024-04-25 16:06:03', '2024-04-25 16:06:03'),
(103, 47, 46, '2024-05-05 07:31:19', '2024-05-05 07:31:19'),
(104, 20, 40, '2024-05-06 10:49:26', '2024-05-06 10:49:26');

-- --------------------------------------------------------

--
-- Table structure for table `gifts`
--

CREATE TABLE `gifts` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` double NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gifts`
--

INSERT INTO `gifts` (`id`, `name`, `description`, `quantity`, `created_at`, `updated_at`) VALUES
(1, '{\"ar\":\"test1\"}', '{\"ar\":\"test\"}', 0, '2023-12-08 11:41:07', '2023-12-08 11:41:36'),
(3, '{\"ar\":\"Was K\"}', '{\"ar\":\"xzc\"}', 6, '2024-01-19 15:56:17', '2024-01-19 15:56:17');

-- --------------------------------------------------------

--
-- Table structure for table `home_page_dynamics`
--

CREATE TABLE `home_page_dynamics` (
  `id` bigint UNSIGNED NOT NULL,
  `type` enum('category','section','slider') COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_page_dynamics`
--

INSERT INTO `home_page_dynamics` (`id`, `type`, `order`, `title_ar`, `title_en`, `created_at`, `updated_at`) VALUES
(20, 'category', '1', 'الأقسام', 'Categories', '2024-04-30 13:45:04', '2024-04-30 13:45:04'),
(21, 'slider', '2', 'إعلانات', 'Banners', '2024-04-30 13:47:31', '2024-04-30 13:47:31'),
(22, 'section', '4', 'المنتجات المقترحة', 'Suggested Products', '2024-04-30 13:54:03', '2024-05-01 09:36:07'),
(23, 'slider', '5', 'مجد', 'Majjd', '2024-04-30 13:56:03', '2024-05-01 09:36:07'),
(24, 'section', '6', 'حسومات', 'Discounts', '2024-04-30 13:56:53', '2024-05-01 09:36:07');

-- --------------------------------------------------------

--
-- Table structure for table `home_page_dynamic_contents`
--

CREATE TABLE `home_page_dynamic_contents` (
  `id` bigint UNSIGNED NOT NULL,
  `home_page_dynamic_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `banner_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_page_dynamic_contents`
--

INSERT INTO `home_page_dynamic_contents` (`id`, `home_page_dynamic_id`, `product_id`, `category_id`, `banner_id`, `created_at`, `updated_at`) VALUES
(128, 21, NULL, NULL, 11, '2024-04-30 13:47:31', '2024-04-30 13:47:31'),
(129, 21, NULL, NULL, 12, '2024-04-30 13:47:31', '2024-04-30 13:47:31'),
(130, 21, NULL, NULL, 13, '2024-04-30 13:47:31', '2024-04-30 13:47:31'),
(131, 22, 40, NULL, NULL, '2024-04-30 13:54:03', '2024-04-30 13:54:03'),
(132, 22, 46, NULL, NULL, '2024-04-30 13:54:03', '2024-04-30 13:54:03'),
(133, 22, 47, NULL, NULL, '2024-04-30 13:54:03', '2024-04-30 13:54:03'),
(134, 22, 48, NULL, NULL, '2024-04-30 13:54:03', '2024-04-30 13:54:03'),
(135, 22, 49, NULL, NULL, '2024-04-30 13:54:03', '2024-04-30 13:54:03'),
(136, 23, NULL, NULL, 11, '2024-04-30 13:56:03', '2024-04-30 13:56:03'),
(137, 23, NULL, NULL, 12, '2024-04-30 13:56:03', '2024-04-30 13:56:03'),
(138, 23, NULL, NULL, 13, '2024-04-30 13:56:03', '2024-04-30 13:56:03'),
(139, 24, 49, NULL, NULL, '2024-04-30 13:56:53', '2024-04-30 13:56:53'),
(140, 24, 47, NULL, NULL, '2024-04-30 13:56:53', '2024-04-30 13:56:53'),
(141, 24, 40, NULL, NULL, '2024-04-30 13:56:53', '2024-04-30 13:56:53'),
(142, 24, 48, NULL, NULL, '2024-04-30 13:56:53', '2024-04-30 13:56:53'),
(143, 24, 46, NULL, NULL, '2024-04-30 13:56:53', '2024-04-30 13:56:53'),
(164, 20, NULL, 1, NULL, '2024-05-08 12:19:33', '2024-05-08 12:19:33'),
(165, 20, NULL, 11, NULL, '2024-05-08 12:19:33', '2024-05-08 12:19:33'),
(166, 20, NULL, 12, NULL, '2024-05-08 12:19:33', '2024-05-08 12:19:33'),
(167, 20, NULL, 22, NULL, '2024-05-08 12:19:33', '2024-05-08 12:19:33'),
(168, 20, NULL, 16, NULL, '2024-05-08 12:19:33', '2024-05-08 12:19:33'),
(170, 20, NULL, 13, NULL, '2024-05-08 12:19:33', '2024-05-08 12:19:33'),
(171, 20, NULL, 14, NULL, '2024-05-08 12:19:33', '2024-05-08 12:19:33'),
(172, 20, NULL, 15, NULL, '2024-05-08 12:19:33', '2024-05-08 12:19:33'),
(173, 20, NULL, 21, NULL, '2024-05-08 12:19:33', '2024-05-08 12:19:33');

-- --------------------------------------------------------

--
-- Table structure for table `join_our_teams`
--

CREATE TABLE `join_our_teams` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `join_our_teams`
--

INSERT INTO `join_our_teams` (`id`, `name`, `phone`, `job`, `created_at`, `updated_at`) VALUES
(1, 'name', '946649532', 'IT', '2024-03-26 12:47:04', '2024-03-26 12:47:04'),
(2, 'name', '946649532', 'IT', '2024-03-26 12:58:55', '2024-03-26 12:58:55'),
(3, 'name', '946649532', 'IT', '2024-03-26 12:59:33', '2024-03-26 12:59:33'),
(4, 'name', '946649532', 'IT', '2024-03-26 13:26:44', '2024-03-26 13:26:44'),
(5, 'name', '946649532', 'IT', '2024-03-26 13:27:08', '2024-03-26 13:27:08'),
(6, 'name', '946649532', 'IT', '2024-03-26 13:30:24', '2024-03-26 13:30:24'),
(7, 'rx', '946649532', 'محاسب', '2024-03-26 13:32:54', '2024-03-26 13:32:54'),
(8, 'dvg', '946644532', 'عامل توصيل', '2024-03-26 13:33:22', '2024-03-26 13:33:22'),
(9, 'rff', '962225868', 'عامل توصيل', '2024-03-26 13:35:04', '2024-03-26 13:35:04'),
(10, 'ىة', '987654321', 'محاسب', '2024-03-26 13:46:21', '2024-03-26 13:46:21'),
(11, 'yy', '987654321', 'خدمة العملاء', '2024-03-26 15:13:05', '2024-03-26 15:13:05'),
(12, 'cgct', '987654321', 'عامل توصيل', '2024-03-26 15:13:56', '2024-03-26 15:13:56'),
(13, 'ghh', '938544087', 'إداري', '2024-04-02 15:35:59', '2024-04-02 15:35:59');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `order_column` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(13, 'App\\Models\\SubCategory', 2, '0cd48206-5c61-423d-8154-f7b49a94d950', 'subcategory-images', 'flyglh', 'flyglh.jpg', 'image/jpeg', 'public', 'public', 1196549, '[]', '[]', '[]', '[]', 1, '2023-12-19 05:36:43', '2023-12-19 05:36:43'),
(27, 'App\\Models\\Product', 40, '4ca13041-64e9-4db9-858b-bc860c612825', 'product-image', 'kosa', 'kosa.jpg', 'image/jpeg', 'public', 'public', 704947, '[]', '[]', '[]', '[]', 1, '2024-01-02 16:49:16', '2024-01-02 16:49:16'),
(49, 'App\\Models\\Product', 46, '41e4aa5d-57b6-427f-a510-c131be75ac21', 'product-image', 'Rectangle 22', 'Rectangle-22.png', 'image/png', 'public', 'public', 249783, '[]', '[]', '[]', '[]', 1, '2024-03-14 14:26:40', '2024-03-14 14:26:40'),
(50, 'App\\Models\\Product', 47, '1057fcdc-8898-4e3b-a650-b848d0605581', 'product-image', 'Rectangle 16', 'Rectangle-16.png', 'image/png', 'public', 'public', 102187, '[]', '[]', '[]', '[]', 1, '2024-03-14 14:30:09', '2024-03-14 14:30:09'),
(51, 'App\\Models\\Product', 48, '7f5208de-310d-47a9-8491-932337529712', 'product-image', 'Rectangle 36', 'Rectangle-36.png', 'image/png', 'public', 'public', 125875, '[]', '[]', '[]', '[]', 1, '2024-03-14 14:33:52', '2024-03-14 14:33:52'),
(52, 'App\\Models\\Product', 49, '172661db-32cd-4bd0-bd56-2248f8d90ea2', 'product-image', 'Rectangle 1dd6', 'Rectangle-1dd6.png', 'image/png', 'public', 'public', 166699, '[]', '[]', '[]', '[]', 1, '2024-03-14 14:37:59', '2024-03-14 14:37:59'),
(53, 'App\\Models\\Category', 1, '0488fba4-2ce6-428b-b50d-831eb0cf664c', 'category-image', 'Ellipse 1', 'Ellipse-1.png', 'image/png', 'public', 'public', 218938, '[]', '[]', '[]', '[]', 1, '2024-03-14 14:50:19', '2024-03-14 14:50:19'),
(54, 'App\\Models\\Category', 11, '1076a5fe-2865-43e2-bb6f-327561ac1197', 'category-image', 'Ellispse 1', 'Ellispse-1.png', 'image/png', 'public', 'public', 203944, '[]', '[]', '[]', '[]', 1, '2024-03-14 14:50:58', '2024-03-14 14:50:58'),
(55, 'App\\Models\\Category', 12, 'd4330440-6448-4985-a571-55678178ac90', 'category-image', 'Ellipsse 1', 'Ellipsse-1.png', 'image/png', 'public', 'public', 262149, '[]', '[]', '[]', '[]', 1, '2024-03-14 14:51:20', '2024-03-14 14:51:20'),
(56, 'App\\Models\\Category', 13, '0ae5f9ea-1d45-4bc1-b208-1c2f3f3ff66f', 'category-image', 'Ellipddse 1', 'Ellipddse-1.png', 'image/png', 'public', 'public', 199267, '[]', '[]', '[]', '[]', 1, '2024-03-14 14:51:52', '2024-03-14 14:51:52'),
(57, 'App\\Models\\Category', 14, '21fd7ffb-2980-4fdf-be4b-db96623f87ea', 'category-image', 'Ellipsedd 1', 'Ellipsedd-1.png', 'image/png', 'public', 'public', 136358, '[]', '[]', '[]', '[]', 1, '2024-03-14 14:52:16', '2024-03-14 14:52:16'),
(58, 'App\\Models\\Category', 15, '03893e4c-06fa-4d48-95a9-33a5f857808f', 'category-image', 'Ellipsddde 1', 'Ellipsddde-1.png', 'image/png', 'public', 'public', 253644, '[]', '[]', '[]', '[]', 1, '2024-03-14 14:52:38', '2024-03-14 14:52:38'),
(59, 'App\\Models\\Category', 16, 'cf674548-8713-4d81-8b87-1e1bfd0cf3b6', 'category-image', 'Ellipdddse 1', 'Ellipdddse-1.png', 'image/png', 'public', 'public', 235624, '[]', '[]', '[]', '[]', 1, '2024-03-14 14:53:22', '2024-03-14 14:53:22'),
(60, 'App\\Models\\Category', 17, 'bdfc0fbf-40df-403d-8c2c-ab167f540b51', 'category-image', 'Ellipseddd 1', 'Ellipseddd-1.png', 'image/png', 'public', 'public', 197527, '[]', '[]', '[]', '[]', 1, '2024-03-14 14:53:48', '2024-03-14 14:53:48'),
(67, 'App\\Models\\Banner', 11, '268d307a-af4b-44a0-be8b-22e4d1779772', 'banner-image', 'Slider1', 'Slider1.png', 'image/png', 'public', 'public', 100014, '[]', '[]', '[]', '[]', 1, '2024-03-14 15:02:27', '2024-03-14 15:02:27'),
(68, 'App\\Models\\Banner', 12, 'd8be8d43-e09b-499d-a22c-0e58f1028d46', 'banner-image', 'Slider1', 'Slider1.png', 'image/png', 'public', 'public', 100014, '[]', '[]', '[]', '[]', 1, '2024-03-14 15:02:40', '2024-03-14 15:02:40'),
(69, 'App\\Models\\Banner', 13, '1dde4ddf-bd23-4fb3-9787-21a4c8acc9ca', 'banner-image', 'Slider1', 'Slider1.png', 'image/png', 'public', 'public', 100014, '[]', '[]', '[]', '[]', 1, '2024-03-14 15:02:54', '2024-03-14 15:02:54'),
(82, 'App\\Models\\Category', 21, '94bb30bd-0277-4c2a-8a82-68891bdbb32a', 'category-image', 'photo_٢٠٢٤-٠٤-٣٠_١٥-٣٢-٣٦ (2)', 'photo_٢٠٢٤-٠٤-٣٠_١٥-٣٢-٣٦-(2).jpg', 'image/jpeg', 'public', 'public', 28480, '[]', '[]', '[]', '[]', 1, '2024-04-30 13:35:27', '2024-04-30 13:35:27'),
(83, 'App\\Models\\Category', 22, '70126021-da38-4774-9113-c2d177056217', 'category-image', 'photo_٢٠٢٤-٠٤-٣٠_١٥-٤٠-٢٩', 'photo_٢٠٢٤-٠٤-٣٠_١٥-٤٠-٢٩.jpg', 'image/jpeg', 'public', 'public', 35710, '[]', '[]', '[]', '[]', 1, '2024-04-30 13:42:44', '2024-04-30 13:42:44'),
(84, 'App\\Models\\SubCategory', 12, 'baa986d8-3342-4386-a65b-07d978f1a76f', 'subcategory-images', 'Screenshot 2022-10-21 134031', 'Screenshot-2022-10-21-134031.jpg', 'image/jpeg', 'public', 'public', 144673, '[]', '[]', '[]', '[]', 1, '2024-06-02 11:52:18', '2024-06-02 11:52:18');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(138, '2023_12_02_122229_create_order_delivery_attributes_table', 1),
(139, '2023_12_08_125359_create_o_t_p_s_table', 2),
(140, '2023_12_08_145627_create_banners_table', 3),
(141, '2023_12_08_181117_create_product_related_product_table', 4),
(350, '2024_02_19_085629_create_point_in_syrian_pound_table', 1),
(404, '2014_10_12_000000_create_users_table', 2),
(405, '2014_10_12_100000_create_password_reset_tokens_table', 2),
(406, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(407, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(408, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(409, '2016_06_01_000004_create_oauth_clients_table', 2),
(410, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2),
(411, '2019_08_19_000000_create_failed_jobs_table', 2),
(412, '2019_12_14_000001_create_personal_access_tokens_table', 2),
(413, '2024_02_18_085625_create_achievements_table', 2),
(414, '2024_02_18_085626_create_achievement_users_table', 2),
(415, '2024_02_19_085624_create_points_table', 2),
(416, '2024_02_19_085625_create_coupons_types_table', 2),
(417, '2024_02_19_085626_create_coupons_table', 2),
(418, '2024_02_19_085626_create_coupons_users_table', 2),
(419, '2024_02_19_085627_create_user_ranks_table', 2),
(420, '2024_02_19_085628_create_coupon_prices_table', 2),
(421, '2024_02_19_085629_create_point_in_pound_table', 2),
(422, '2023_11_19_115035_create_delivery_attributes_table', 1),
(423, '2023_11_19_103038_create_attributes_table', 1),
(424, '2023_12_02_121317_create_order_details_table', 1),
(425, '2024_01_03_130633_create_favorits_table', 1),
(426, '2024_01_09_211606_create_delivery_time_infos_table', 1),
(427, '2024_01_10_004755_create_notifications_table', 1),
(428, '2024_03_10_101021_create_settings_table', 1),
(429, '2024_03_11_125647_create_home_page_dynamics_table', 5),
(430, '2024_03_11_134340_create_home_page_dynamic_contents_table', 5),
(431, '2024_03_20_115643_create_purchases_table', 6),
(432, '2024_03_24_104239_create_contact_us_table', 7),
(433, '2024_03_24_111210_create_join_our_teams_table', 7),
(434, '2024_04_04_142803_create_order_driver_acceptances_table', 8),
(435, '2023_12_02_112601_create_orders_rate_attributes_table', 9),
(436, '2024_04_04_142804_create_driver_types_table', 10);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `created_at`, `updated_at`) VALUES
(2, '3', 'App\\Models\\Driver', 3, '{\"title\":\"title\",\"body\":\"body\"}', '2024-01-09 22:44:14', '2024-01-09 22:44:14'),
(3, '3', 'App\\Models\\Driver', 2, '{\"title\":\"title\",\"body\":\"body\"}', '2024-01-09 22:46:52', '2024-01-09 22:46:52'),
(4, '3', 'App\\Models\\Driver', 2, '{\"title\":\"title\",\"body\":\"body\"}', '2024-01-09 22:47:17', '2024-01-09 22:47:17'),
(5, '3', 'App\\Models\\Driver', 3, '{\"title\":\"title\",\"body\":\"body\"}', '2024-01-09 22:47:43', '2024-01-09 22:47:43'),
(6, '3', 'App\\Models\\Driver', 1, '{\"title\":\"t\",\"body\":\"r\"}', '2024-01-09 22:52:14', '2024-01-09 22:52:14'),
(7, '3', 'App\\Models\\User', 19, '{\"title\":\"test\",\"body\":\"test\"}', '2024-01-11 13:45:49', '2024-01-11 13:45:49'),
(8, '3', 'App\\Models\\User', 19, '{\"title\":\"test\",\"body\":\"test\"}', '2024-01-11 13:50:33', '2024-01-11 13:50:33'),
(9, '3', 'App\\Models\\User', 19, '{\"title\":\"test\",\"body\":\"test\"}', '2024-01-11 13:50:45', '2024-01-11 13:50:45'),
(10, '3', 'App\\Models\\User', 19, '{\"title\":\"test\",\"body\":\"test\"}', '2024-01-11 13:51:58', '2024-01-11 13:51:58'),
(11, '3', 'App\\Models\\User', 19, '{\"title\":\"test\",\"body\":\"test\"}', '2024-01-11 13:52:44', '2024-01-11 13:52:44'),
(12, '3', 'App\\Models\\User', 19, '{\"title\":\"test\",\"body\":\"test\"}', '2024-01-11 13:57:49', '2024-01-11 13:57:49'),
(13, '3', 'App\\Models\\User', 19, '{\"title\":\"test\",\"body\":\"test\"}', '2024-01-11 14:05:33', '2024-01-11 14:05:33'),
(14, '3', 'App\\Models\\User', 1, '{\"title\":\"t\",\"body\":\"r\"}', '2024-01-21 12:55:29', '2024-01-21 12:55:29'),
(15, '3', 'App\\Models\\User', 20, '{\"title\":\"t\",\"body\":\"r\"}', '2024-01-21 12:57:00', '2024-01-21 12:57:00'),
(16, '3', 'App\\Models\\User', 1, '{\"title\":\"ss\",\"body\":\"ss\"}', '2024-03-27 10:13:34', '2024-03-27 10:13:34'),
(17, '3', 'App\\Models\\User', 2, '{\"title\":\"ss\",\"body\":\"ss\"}', '2024-03-27 10:13:34', '2024-03-27 10:13:34'),
(19, '3', 'App\\Models\\User', 30, '{\"title\":\"ss\",\"body\":\"ss\"}', '2024-03-27 10:13:34', '2024-03-27 10:13:34'),
(20, '3', 'App\\Models\\User', 1, '{\"title\":\"sdsd\",\"body\":\"sd\"}', '2024-04-04 09:21:20', '2024-04-04 09:21:20'),
(21, '3', 'App\\Models\\User', 2, '{\"title\":\"sdsd\",\"body\":\"sd\"}', '2024-04-04 09:21:39', '2024-04-04 09:21:39'),
(22, '3', 'App\\Models\\User', 5, '{\"title\":\"sdsd\",\"body\":\"sd\"}', '2024-04-04 09:21:39', '2024-04-04 09:21:39'),
(23, '3', 'App\\Models\\User', 9, '{\"title\":\"sdsd\",\"body\":\"sd\"}', '2024-04-04 09:21:39', '2024-04-04 09:21:39'),
(24, '3', 'App\\Models\\User', 19, '{\"title\":\"sdsd\",\"body\":\"sd\"}', '2024-04-04 09:21:39', '2024-04-04 09:21:39'),
(25, '3', 'App\\Models\\User', 5, '{\"title\":\"sdsd\",\"body\":\"sd\"}', '2024-04-04 09:21:54', '2024-04-04 09:21:54'),
(26, '3', 'App\\Models\\User', 9, '{\"title\":\"sdsd\",\"body\":\"sd\"}', '2024-04-04 09:21:54', '2024-04-04 09:21:54'),
(27, '3', 'App\\Models\\User', 10, '{\"title\":\"sdsd\",\"body\":\"sd\"}', '2024-04-04 09:21:54', '2024-04-04 09:21:54'),
(28, '3', 'App\\Models\\User', 2, '{\"title\":\"sd\",\"body\":\"sd\"}', '2024-04-04 09:22:21', '2024-04-04 09:22:21'),
(29, '3', 'App\\Models\\User', 5, '{\"title\":\"sd\",\"body\":\"sd\"}', '2024-04-04 09:22:21', '2024-04-04 09:22:21'),
(30, '3', 'App\\Models\\User', 9, '{\"title\":\"sd\",\"body\":\"sd\"}', '2024-04-04 09:22:21', '2024-04-04 09:22:21'),
(31, '3', 'App\\Models\\User', 10, '{\"title\":\"sd\",\"body\":\"sd\"}', '2024-04-04 09:22:21', '2024-04-04 09:22:21'),
(32, '3', 'App\\Models\\User', 5, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 09:26:12', '2024-04-04 09:26:12'),
(33, '3', 'App\\Models\\User', 2, '{\"title\":\"sd\",\"body\":\"sd\"}', '2024-04-04 09:31:01', '2024-04-04 09:31:01'),
(34, '3', 'App\\Models\\User', 20, '{\"title\":\"sd\",\"body\":\"sd\"}', '2024-04-04 09:31:01', '2024-04-04 09:31:01'),
(35, '3', 'App\\Models\\User', 2, '{\"title\":\"sd\",\"body\":\"sd\"}', '2024-04-04 09:31:43', '2024-04-04 09:31:43'),
(36, '3', 'App\\Models\\User', 20, '{\"title\":\"sd\",\"body\":\"sd\"}', '2024-04-04 09:31:43', '2024-04-04 09:31:43'),
(37, '3', 'App\\Models\\User', 2, '{\"title\":\"df\",\"body\":\"df\"}', '2024-04-04 09:32:22', '2024-04-04 09:32:22'),
(38, '3', 'App\\Models\\User', 20, '{\"title\":\"df\",\"body\":\"df\"}', '2024-04-04 09:32:22', '2024-04-04 09:32:22'),
(39, '3', 'App\\Models\\User', 46, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 09:34:18', '2024-04-04 09:34:18'),
(40, '3', 'App\\Models\\User', 5, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 09:34:47', '2024-04-04 09:34:47'),
(41, '3', 'App\\Models\\User', 46, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 09:34:47', '2024-04-04 09:34:47'),
(42, '3', 'App\\Models\\User', 5, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 09:36:33', '2024-04-04 09:36:33'),
(43, '3', 'App\\Models\\User', 46, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 09:36:33', '2024-04-04 09:36:33'),
(44, '3', 'App\\Models\\User', 9, '{\"title\":\"ads\",\"body\":\"sdsd\"}', '2024-04-04 09:46:18', '2024-04-04 09:46:18'),
(45, '3', 'App\\Models\\User', 9, '{\"title\":\"ads\",\"body\":\"sdsd\"}', '2024-04-04 09:47:27', '2024-04-04 09:47:27'),
(46, '3', 'App\\Models\\User', 9, '{\"title\":\"ads\",\"body\":\"sdsd\"}', '2024-04-04 09:47:55', '2024-04-04 09:47:55'),
(47, '3', 'App\\Models\\User', 2, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 09:48:38', '2024-04-04 09:48:38'),
(48, '3', 'App\\Models\\User', 2, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 09:49:23', '2024-04-04 09:49:23'),
(49, '3', 'App\\Models\\User', 10, '{\"title\":\"sdsdsd\",\"body\":\"dssd\"}', '2024-04-04 09:49:34', '2024-04-04 09:49:34'),
(50, '3', 'App\\Models\\User', 5, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 10:15:07', '2024-04-04 10:15:07'),
(51, '3', 'App\\Models\\User', 42, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 10:15:07', '2024-04-04 10:15:07'),
(52, '3', 'App\\Models\\User', 5, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 10:15:30', '2024-04-04 10:15:30'),
(53, '3', 'App\\Models\\User', 42, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 10:15:30', '2024-04-04 10:15:30'),
(54, '3', 'App\\Models\\User', 5, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 10:16:26', '2024-04-04 10:16:26'),
(55, '3', 'App\\Models\\User', 42, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 10:16:26', '2024-04-04 10:16:26'),
(56, '3', 'App\\Models\\User', 5, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 10:18:24', '2024-04-04 10:18:24'),
(57, '3', 'App\\Models\\User', 5, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 10:19:03', '2024-04-04 10:19:03'),
(58, '3', 'App\\Models\\User', 9, '{\"title\":\"sdsdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 10:21:02', '2024-04-04 10:21:02'),
(59, '3', 'App\\Models\\User', 2, '{\"title\":\"sdds\",\"body\":\"sdsd\"}', '2024-04-04 10:21:41', '2024-04-04 10:21:41'),
(60, '3', 'App\\Models\\User', 2, '{\"title\":\"sddssd\",\"body\":\"sdsdas\"}', '2024-04-04 10:22:25', '2024-04-04 10:22:25'),
(61, '3', 'App\\Models\\User', 5, '{\"title\":\"sddssd\",\"body\":\"sdsdas\"}', '2024-04-04 10:22:25', '2024-04-04 10:22:25'),
(62, '3', 'App\\Models\\User', 5, '{\"title\":\"test\",\"body\":\"dfdf\"}', '2024-04-04 10:23:19', '2024-04-04 10:23:19'),
(63, '3', 'App\\Models\\User', 5, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 10:24:04', '2024-04-04 10:24:04'),
(64, '3', 'App\\Models\\User', 9, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 10:26:04', '2024-04-04 10:26:04'),
(65, '3', 'App\\Models\\User', 21, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 10:26:04', '2024-04-04 10:26:04'),
(66, '3', 'App\\Models\\User', 30, '{\"title\":\"sdsad\",\"body\":\"sdad\"}', '2024-04-04 10:26:30', '2024-04-04 10:26:30'),
(67, '3', 'App\\Models\\User', 2, '{\"title\":\"sdsadasa\",\"body\":\"sdadas\"}', '2024-04-04 10:27:52', '2024-04-04 10:27:52'),
(68, '3', 'App\\Models\\User', 30, '{\"title\":\"sdsadasa\",\"body\":\"sdadas\"}', '2024-04-04 10:27:52', '2024-04-04 10:27:52'),
(69, '3', 'App\\Models\\User', 43, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 10:29:49', '2024-04-04 10:29:49'),
(70, '3', 'App\\Models\\User', 2, '{\"title\":\"asas\",\"body\":\"asasas\"}', '2024-04-04 10:33:33', '2024-04-04 10:33:33'),
(71, '3', 'App\\Models\\User', 9, '{\"title\":\"asas\",\"body\":\"asasas\"}', '2024-04-04 10:33:33', '2024-04-04 10:33:33'),
(72, '3', 'App\\Models\\User', 2, '{\"title\":\"sdsd\",\"body\":\"asasassd\"}', '2024-04-04 10:33:58', '2024-04-04 10:33:58'),
(73, '3', 'App\\Models\\User', 2, '{\"title\":\"sdsd\",\"body\":\"sdsdsd\"}', '2024-04-04 10:41:44', '2024-04-04 10:41:44'),
(74, '3', 'App\\Models\\User', 5, '{\"title\":\"sdsd\",\"body\":\"sdsdsd\"}', '2024-04-04 10:41:44', '2024-04-04 10:41:44'),
(75, '3', 'App\\Models\\User', 5, '{\"title\":\"asasasas\",\"body\":\"xaasas\"}', '2024-04-04 10:42:19', '2024-04-04 10:42:19'),
(76, '3', 'App\\Models\\User', 2, '{\"title\":\",kok\",\"body\":\"iok\"}', '2024-04-04 10:42:52', '2024-04-04 10:42:52'),
(77, '3', 'App\\Models\\User', 9, '{\"title\":\",kok\",\"body\":\"iok\"}', '2024-04-04 10:42:52', '2024-04-04 10:42:52'),
(78, '3', 'App\\Models\\User', 2, '{\"title\":\"sdsdsd\",\"body\":\"sdsdsd\"}', '2024-04-04 10:59:03', '2024-04-04 10:59:03'),
(79, '3', 'App\\Models\\User', 2, '{\"title\":\"asas\",\"body\":\"asas\"}', '2024-04-04 11:04:01', '2024-04-04 11:04:01'),
(80, '3', 'App\\Models\\User', 5, '{\"title\":\"asas\",\"body\":\"asas\"}', '2024-04-04 11:04:01', '2024-04-04 11:04:01'),
(81, '3', 'App\\Models\\User', 1, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(82, '3', 'App\\Models\\User', 2, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(83, '3', 'App\\Models\\User', 5, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(84, '3', 'App\\Models\\User', 9, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(85, '3', 'App\\Models\\User', 10, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(86, '3', 'App\\Models\\User', 19, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(88, '3', 'App\\Models\\User', 21, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(89, '3', 'App\\Models\\User', 22, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(90, '3', 'App\\Models\\User', 23, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(91, '3', 'App\\Models\\User', 24, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(92, '3', 'App\\Models\\User', 25, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(93, '3', 'App\\Models\\User', 26, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(94, '3', 'App\\Models\\User', 27, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(95, '3', 'App\\Models\\User', 28, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(96, '3', 'App\\Models\\User', 29, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(97, '3', 'App\\Models\\User', 30, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(98, '3', 'App\\Models\\User', 31, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(99, '3', 'App\\Models\\User', 32, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(100, '3', 'App\\Models\\User', 33, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(101, '3', 'App\\Models\\User', 34, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(102, '3', 'App\\Models\\User', 35, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(103, '3', 'App\\Models\\User', 36, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(104, '3', 'App\\Models\\User', 37, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(105, '3', 'App\\Models\\User', 38, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(106, '3', 'App\\Models\\User', 40, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(107, '3', 'App\\Models\\User', 41, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(108, '3', 'App\\Models\\User', 42, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(109, '3', 'App\\Models\\User', 43, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(110, '3', 'App\\Models\\User', 44, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(111, '3', 'App\\Models\\User', 45, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(112, '3', 'App\\Models\\User', 46, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(114, '3', 'App\\Models\\User', 5, '{\"title\":\"sdsdsd\",\"body\":\"sdsds\"}', '2024-04-04 11:08:00', '2024-04-04 11:08:00'),
(115, '3', 'App\\Models\\User', 9, '{\"title\":\"sdsdsd\",\"body\":\"sdsds\"}', '2024-04-04 11:08:00', '2024-04-04 11:08:00'),
(116, '3', 'App\\Models\\User', 1, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(117, '3', 'App\\Models\\User', 2, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(118, '3', 'App\\Models\\User', 5, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(119, '3', 'App\\Models\\User', 9, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(120, '3', 'App\\Models\\User', 10, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(121, '3', 'App\\Models\\User', 19, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(122, '3', 'App\\Models\\User', 20, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(123, '3', 'App\\Models\\User', 21, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(124, '3', 'App\\Models\\User', 22, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(125, '3', 'App\\Models\\User', 23, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(126, '3', 'App\\Models\\User', 24, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(127, '3', 'App\\Models\\User', 25, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(128, '3', 'App\\Models\\User', 26, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(129, '3', 'App\\Models\\User', 27, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(130, '3', 'App\\Models\\User', 28, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(131, '3', 'App\\Models\\User', 29, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(132, '3', 'App\\Models\\User', 30, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(133, '3', 'App\\Models\\User', 31, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(134, '3', 'App\\Models\\User', 32, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(135, '3', 'App\\Models\\User', 33, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(136, '3', 'App\\Models\\User', 34, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(137, '3', 'App\\Models\\User', 35, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(138, '3', 'App\\Models\\User', 36, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(139, '3', 'App\\Models\\User', 37, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(140, '3', 'App\\Models\\User', 38, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(141, '3', 'App\\Models\\User', 40, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(142, '3', 'App\\Models\\User', 41, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(143, '3', 'App\\Models\\User', 42, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(144, '3', 'App\\Models\\User', 43, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(145, '3', 'App\\Models\\User', 44, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(146, '3', 'App\\Models\\User', 45, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(147, '3', 'App\\Models\\User', 46, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(148, '3', 'App\\Models\\User', 47, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(149, '3', 'App\\Models\\User', 1, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(150, '3', 'App\\Models\\User', 2, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(151, '3', 'App\\Models\\User', 5, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(152, '3', 'App\\Models\\User', 9, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(153, '3', 'App\\Models\\User', 10, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(154, '3', 'App\\Models\\User', 19, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(155, '3', 'App\\Models\\User', 20, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(156, '3', 'App\\Models\\User', 21, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(157, '3', 'App\\Models\\User', 22, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(158, '3', 'App\\Models\\User', 23, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(159, '3', 'App\\Models\\User', 24, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(160, '3', 'App\\Models\\User', 25, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(161, '3', 'App\\Models\\User', 26, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(162, '3', 'App\\Models\\User', 27, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(163, '3', 'App\\Models\\User', 28, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(164, '3', 'App\\Models\\User', 29, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(165, '3', 'App\\Models\\User', 30, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(166, '3', 'App\\Models\\User', 31, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(167, '3', 'App\\Models\\User', 32, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(168, '3', 'App\\Models\\User', 33, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(169, '3', 'App\\Models\\User', 34, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(170, '3', 'App\\Models\\User', 35, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(171, '3', 'App\\Models\\User', 36, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(172, '3', 'App\\Models\\User', 37, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(173, '3', 'App\\Models\\User', 38, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(174, '3', 'App\\Models\\User', 40, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(175, '3', 'App\\Models\\User', 41, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(176, '3', 'App\\Models\\User', 42, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(177, '3', 'App\\Models\\User', 43, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(178, '3', 'App\\Models\\User', 44, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(179, '3', 'App\\Models\\User', 45, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(180, '3', 'App\\Models\\User', 46, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(181, '3', 'App\\Models\\User', 47, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(182, '3', 'App\\Models\\User', 5, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:18:43', '2024-04-04 11:18:43'),
(183, '3', 'App\\Models\\User', 9, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:18:43', '2024-04-04 11:18:43'),
(184, '3', 'App\\Models\\User', 1, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(185, '3', 'App\\Models\\User', 2, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(186, '3', 'App\\Models\\User', 5, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(187, '3', 'App\\Models\\User', 9, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(188, '3', 'App\\Models\\User', 10, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(189, '3', 'App\\Models\\User', 19, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(190, '3', 'App\\Models\\User', 20, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(191, '3', 'App\\Models\\User', 21, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(192, '3', 'App\\Models\\User', 22, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(193, '3', 'App\\Models\\User', 23, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(194, '3', 'App\\Models\\User', 24, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(195, '3', 'App\\Models\\User', 25, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(196, '3', 'App\\Models\\User', 26, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(197, '3', 'App\\Models\\User', 27, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(198, '3', 'App\\Models\\User', 28, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(199, '3', 'App\\Models\\User', 29, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(200, '3', 'App\\Models\\User', 30, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(201, '3', 'App\\Models\\User', 31, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(202, '3', 'App\\Models\\User', 32, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(203, '3', 'App\\Models\\User', 33, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(204, '3', 'App\\Models\\User', 34, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(205, '3', 'App\\Models\\User', 35, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(206, '3', 'App\\Models\\User', 36, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(207, '3', 'App\\Models\\User', 37, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(208, '3', 'App\\Models\\User', 38, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(209, '3', 'App\\Models\\User', 40, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(210, '3', 'App\\Models\\User', 41, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(211, '3', 'App\\Models\\User', 42, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(212, '3', 'App\\Models\\User', 43, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(213, '3', 'App\\Models\\User', 44, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(214, '3', 'App\\Models\\User', 45, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(215, '3', 'App\\Models\\User', 46, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(216, '3', 'App\\Models\\User', 47, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(217, '3', 'App\\Models\\User', 5, '{\"title\":\"rrev\",\"body\":\"csdcsdcsdc\"}', '2024-04-04 11:37:33', '2024-04-04 11:37:33'),
(218, '3', 'App\\Models\\User', 10, '{\"title\":\"rrev\",\"body\":\"csdcsdcsdc\"}', '2024-04-04 11:37:33', '2024-04-04 11:37:33'),
(219, '3', 'App\\Models\\User', 1, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(220, '3', 'App\\Models\\User', 2, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(221, '3', 'App\\Models\\User', 5, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(222, '3', 'App\\Models\\User', 9, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(223, '3', 'App\\Models\\User', 10, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(224, '3', 'App\\Models\\User', 19, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(225, '3', 'App\\Models\\User', 20, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(226, '3', 'App\\Models\\User', 21, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(227, '3', 'App\\Models\\User', 22, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(228, '3', 'App\\Models\\User', 23, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(229, '3', 'App\\Models\\User', 24, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(230, '3', 'App\\Models\\User', 25, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(231, '3', 'App\\Models\\User', 26, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(232, '3', 'App\\Models\\User', 27, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(233, '3', 'App\\Models\\User', 28, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(234, '3', 'App\\Models\\User', 29, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(235, '3', 'App\\Models\\User', 30, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(236, '3', 'App\\Models\\User', 31, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(237, '3', 'App\\Models\\User', 32, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(238, '3', 'App\\Models\\User', 33, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(239, '3', 'App\\Models\\User', 34, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(240, '3', 'App\\Models\\User', 35, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(241, '3', 'App\\Models\\User', 36, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(242, '3', 'App\\Models\\User', 37, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(243, '3', 'App\\Models\\User', 38, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(244, '3', 'App\\Models\\User', 40, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(245, '3', 'App\\Models\\User', 41, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(246, '3', 'App\\Models\\User', 42, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(247, '3', 'App\\Models\\User', 43, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(248, '3', 'App\\Models\\User', 44, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(249, '3', 'App\\Models\\User', 45, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(250, '3', 'App\\Models\\User', 46, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(251, '3', 'App\\Models\\User', 47, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(252, '3', 'App\\Models\\User', 5, '{\"title\":\"scsd\",\"body\":\"sdcsdc\"}', '2024-04-04 11:43:43', '2024-04-04 11:43:43'),
(253, '3', 'App\\Models\\User', 9, '{\"title\":\"scsd\",\"body\":\"sdcsdc\"}', '2024-04-04 11:43:43', '2024-04-04 11:43:43'),
(254, '3', 'App\\Models\\User', 10, '{\"title\":\"scsd\",\"body\":\"sdcsdc\"}', '2024-04-04 11:43:43', '2024-04-04 11:43:43'),
(255, '3', 'App\\Models\\User', 5, '{\"title\":\"csdc\",\"body\":\"sdcs\"}', '2024-04-04 12:17:42', '2024-04-04 12:17:42'),
(256, '3', 'App\\Models\\User', 1, '{\"title\":\"ffff\",\"body\":\"fffff\"}', '2024-04-15 12:46:08', '2024-04-15 12:46:08'),
(257, '3', 'App\\Models\\User', 2, '{\"title\":\"ffff\",\"body\":\"fffff\"}', '2024-04-15 12:46:08', '2024-04-15 12:46:08'),
(258, '3', 'App\\Models\\User', 5, '{\"title\":\"ffff\",\"body\":\"fffff\"}', '2024-04-15 12:46:08', '2024-04-15 12:46:08'),
(259, '3', 'App\\Models\\User', 9, '{\"title\":\"ffff\",\"body\":\"fffff\"}', '2024-04-15 12:46:08', '2024-04-15 12:46:08'),
(260, '3', 'App\\Models\\User', 10, '{\"title\":\"ffff\",\"body\":\"fffff\"}', '2024-04-15 12:46:08', '2024-04-15 12:46:08'),
(261, '3', 'App\\Models\\User', 19, '{\"title\":\"ffff\",\"body\":\"fffff\"}', '2024-04-15 12:46:08', '2024-04-15 12:46:08'),
(262, '3', 'App\\Models\\User', 20, '{\"title\":\"ffff\",\"body\":\"fffff\"}', '2024-04-15 12:46:08', '2024-04-15 12:46:08'),
(263, '3', 'App\\Models\\User', 28, '{\"title\":\"ffff\",\"body\":\"fffff\"}', '2024-04-15 12:46:08', '2024-04-15 12:46:08'),
(264, '3', 'App\\Models\\User', 38, '{\"title\":\"ffff\",\"body\":\"fffff\"}', '2024-04-15 12:46:08', '2024-04-15 12:46:08'),
(265, '3', 'App\\Models\\User', 40, '{\"title\":\"ffff\",\"body\":\"fffff\"}', '2024-04-15 12:46:08', '2024-04-15 12:46:08'),
(266, '3', 'App\\Models\\User', 41, '{\"title\":\"ffff\",\"body\":\"fffff\"}', '2024-04-15 12:46:08', '2024-04-15 12:46:08'),
(267, '3', 'App\\Models\\User', 42, '{\"title\":\"ffff\",\"body\":\"fffff\"}', '2024-04-15 12:46:08', '2024-04-15 12:46:08'),
(268, '3', 'App\\Models\\User', 43, '{\"title\":\"ffff\",\"body\":\"fffff\"}', '2024-04-15 12:46:08', '2024-04-15 12:46:08'),
(269, '3', 'App\\Models\\User', 44, '{\"title\":\"ffff\",\"body\":\"fffff\"}', '2024-04-15 12:46:08', '2024-04-15 12:46:08'),
(270, '3', 'App\\Models\\User', 45, '{\"title\":\"ffff\",\"body\":\"fffff\"}', '2024-04-15 12:46:08', '2024-04-15 12:46:08'),
(271, '3', 'App\\Models\\User', 46, '{\"title\":\"ffff\",\"body\":\"fffff\"}', '2024-04-15 12:46:08', '2024-04-15 12:46:08'),
(272, '3', 'App\\Models\\User', 47, '{\"title\":\"ffff\",\"body\":\"fffff\"}', '2024-04-15 12:46:08', '2024-04-15 12:46:08'),
(273, '3', 'App\\Models\\User', 48, '{\"title\":\"ffff\",\"body\":\"fffff\"}', '2024-04-15 12:46:08', '2024-04-15 12:46:08'),
(274, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"Your Order Now is On The Way\",\"order_id\":223,\"order_status\":3,\"driver_phone\":\"987654320\"}', '2024-04-21 09:32:52', '2024-04-21 09:32:52'),
(275, '1', 'App\\Models\\User', 47, '{\"title\":\"your order has been canceled\",\"body\":\"reason : \"}', '2024-04-21 10:27:50', '2024-04-21 10:27:50'),
(276, '1', 'App\\Models\\User', 47, '{\"title\":\"your order has been canceled\",\"body\":\"reason : \"}', '2024-04-21 10:30:26', '2024-04-21 10:30:26'),
(277, '1', 'App\\Models\\User', 20, '{\"title\":\"your order has been canceled\",\"body\":\"reason : \"}', '2024-04-21 10:40:51', '2024-04-21 10:40:51'),
(278, '1', 'App\\Models\\User', 20, '{\"title\":\"your order has been canceled\",\"body\":\"reason : \"}', '2024-04-21 10:46:38', '2024-04-21 10:46:38'),
(279, '1', 'App\\Models\\User', 20, '{\"title\":\"your order has been canceled\",\"body\":\"reason : \"}', '2024-04-21 10:58:32', '2024-04-21 10:58:32'),
(280, '1', 'App\\Models\\User', 20, '{\"title\":\"your order has been canceled\",\"body\":\"reason : \"}', '2024-04-21 11:05:42', '2024-04-21 11:05:42'),
(281, '1', 'App\\Models\\User', 47, '{\"title\":\"your order has been canceled\",\"body\":\"reason : gH\"}', '2024-04-21 11:10:54', '2024-04-21 11:10:54'),
(282, '1', 'App\\Models\\User', 47, '{\"title\":\"your order has been canceled\",\"body\":\"reason : \"}', '2024-04-21 11:55:12', '2024-04-21 11:55:12'),
(283, '1', 'App\\Models\\User', 47, '{\"title\":\"your order has been canceled\",\"body\":\"reason : \"}', '2024-04-21 11:55:59', '2024-04-21 11:55:59'),
(284, '1', 'App\\Models\\User', 47, '{\"title\":\"your order has been canceled\",\"body\":\"reason : qqqq\"}', '2024-04-21 11:58:15', '2024-04-21 11:58:15'),
(285, '1', 'App\\Models\\User', 20, '{\"title\":\"your order has been canceled\",\"body\":\"reason : vcvcvc\"}', '2024-04-21 12:06:14', '2024-04-21 12:06:14'),
(286, '1', 'App\\Models\\User', 20, '{\"title\":\"your order has been canceled\",\"body\":\"reason : vvvv\"}', '2024-04-21 12:07:31', '2024-04-21 12:07:31'),
(287, '1', 'App\\Models\\User', 20, '{\"title\":\"your order has been canceled\",\"body\":\"reason : eeee\"}', '2024-04-21 12:08:07', '2024-04-21 12:08:07'),
(288, '1', 'App\\Models\\User', 20, '{\"title\":\"your order has been canceled\",\"body\":\"reason : aaa\"}', '2024-04-21 12:11:12', '2024-04-21 12:11:12'),
(289, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"Your Order Now is On The Way\",\"order_id\":240,\"order_status\":3,\"driver_phone\":\"946649532\"}', '2024-04-21 13:19:35', '2024-04-21 13:19:35'),
(290, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":271,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-04-21 13:22:41', '2024-04-21 13:22:41'),
(291, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"Your Order Now is On The Way\",\"order_id\":240,\"order_status\":3,\"driver_phone\":\"946649532\"}', '2024-04-21 13:29:04', '2024-04-21 13:29:04'),
(292, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"Your Order Now is On The Way\",\"order_id\":271,\"order_status\":3,\"driver_phone\":\"946649532\"}', '2024-04-21 13:36:27', '2024-04-21 13:36:27'),
(293, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":271,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-04-21 14:17:25', '2024-04-21 14:17:25'),
(294, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"Your Order Now is On The Way\",\"order_id\":271,\"order_status\":3,\"driver_phone\":\"946649532\"}', '2024-04-21 14:20:54', '2024-04-21 14:20:54'),
(295, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":271,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-04-21 14:27:14', '2024-04-21 14:27:14'),
(296, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"Your Order Now is On The Way\",\"order_id\":271,\"order_status\":3,\"driver_phone\":\"946649532\"}', '2024-04-21 14:27:56', '2024-04-21 14:27:56'),
(297, '1', 'App\\Models\\User', 20, '{\"title\":\"your order has been canceled\",\"body\":\"reason : \\u0621\\u0621\\u0624\\u0621\\u0624\\u0621\\u0624\"}', '2024-04-21 14:38:34', '2024-04-21 14:38:34'),
(298, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":271,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-04-21 14:50:38', '2024-04-21 14:50:38'),
(299, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"Your Order Now is On The Way\",\"order_id\":271,\"order_status\":3,\"driver_phone\":\"946649532\"}', '2024-04-21 14:51:03', '2024-04-21 14:51:03'),
(300, '3', 'App\\Models\\User', 28, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":272,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-04-21 14:57:54', '2024-04-21 14:57:54'),
(301, '3', 'App\\Models\\User', 28, '{\"title\":\"Order On The Way\",\"body\":\"Your Order Now is On The Way\",\"order_id\":272,\"order_status\":3,\"driver_phone\":\"946649532\"}', '2024-04-21 15:00:53', '2024-04-21 15:00:53'),
(302, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":242,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-04-21 15:04:08', '2024-04-21 15:04:08'),
(303, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"Your Order Now is On The Way\",\"order_id\":242,\"order_status\":3,\"driver_phone\":\"946649532\"}', '2024-04-21 15:04:14', '2024-04-21 15:04:14'),
(304, '3', 'App\\Models\\User', 28, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":272,\"order_status\":2,\"driver_phone\":\"987654320\"}', '2024-04-22 09:31:04', '2024-04-22 09:31:04'),
(305, '3', 'App\\Models\\User', 28, '{\"title\":\"Order On The Way\",\"body\":\"Your Order Now is On The Way\",\"order_id\":272,\"order_status\":3,\"driver_phone\":\"987654320\"}', '2024-04-22 10:02:16', '2024-04-22 10:02:16'),
(306, '3', 'App\\Models\\User', 28, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":273,\"order_status\":2,\"driver_phone\":\"987654320\"}', '2024-04-22 10:39:33', '2024-04-22 10:39:33'),
(307, '3', 'App\\Models\\User', 28, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":273,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-04-22 10:49:52', '2024-04-22 10:49:52'),
(308, '3', 'App\\Models\\User', 47, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":246,\"order_status\":2,\"driver_phone\":\"987654320\"}', '2024-04-22 11:00:52', '2024-04-22 11:00:52'),
(309, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":269,\"order_status\":2,\"driver_phone\":\"987654320\"}', '2024-04-22 11:12:41', '2024-04-22 11:12:41'),
(310, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":270,\"order_status\":2,\"driver_phone\":\"987654320\"}', '2024-04-22 11:26:04', '2024-04-22 11:26:04'),
(311, '3', 'App\\Models\\User', 28, '{\"title\":\"Order On The Way\",\"body\":\"Your Order Now is On The Way\",\"order_id\":273,\"order_status\":3,\"driver_phone\":\"946649532\"}', '2024-04-22 12:38:15', '2024-04-22 12:38:15'),
(312, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":274,\"order_status\":2,\"driver_phone\":\"987654320\"}', '2024-04-22 16:34:57', '2024-04-22 16:34:57'),
(313, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"Your Order Now is On The Way\",\"order_id\":274,\"order_status\":3,\"driver_phone\":\"987654320\"}', '2024-04-22 16:35:19', '2024-04-22 16:35:19'),
(314, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"Your Order Now is On The Way\",\"order_id\":270,\"order_status\":3,\"driver_phone\":\"987654320\"}', '2024-04-23 08:49:35', '2024-04-23 08:49:35'),
(315, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":279,\"order_status\":2,\"driver_phone\":\"987654320\"}', '2024-04-23 12:23:15', '2024-04-23 12:23:15'),
(316, '3', 'App\\Models\\User', 50, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":275,\"order_status\":2,\"driver_phone\":\"987654320\"}', '2024-04-23 12:23:25', '2024-04-23 12:23:25'),
(317, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"Your Order Now is On The Way\",\"order_id\":279,\"order_status\":3,\"driver_phone\":\"987654320\"}', '2024-04-23 12:25:14', '2024-04-23 12:25:14'),
(318, '3', 'App\\Models\\User', 50, '{\"title\":\"Order On The Way\",\"body\":\"Your Order Now is On The Way\",\"order_id\":275,\"order_status\":3,\"driver_phone\":\"987654320\"}', '2024-04-23 12:43:53', '2024-04-23 12:43:53'),
(319, '3', 'App\\Models\\User', 50, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":281,\"order_status\":2,\"driver_phone\":\"987654320\"}', '2024-04-23 13:16:14', '2024-04-23 13:16:14'),
(320, '3', 'App\\Models\\User', 50, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":282,\"order_status\":2,\"driver_phone\":\"987654320\"}', '2024-04-23 13:24:44', '2024-04-23 13:24:44'),
(321, '3', 'App\\Models\\User', 50, '{\"title\":\"Order On The Way\",\"body\":\"Your Order Now is On The Way\",\"order_id\":282,\"order_status\":3,\"driver_phone\":\"987654320\"}', '2024-04-23 13:25:45', '2024-04-23 13:25:45'),
(322, '3', 'App\\Models\\User', 50, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":283,\"order_status\":2,\"driver_phone\":\"987654320\"}', '2024-04-23 13:28:56', '2024-04-23 13:28:56'),
(323, '3', 'App\\Models\\User', 50, '{\"title\":\"Order On The Way\",\"body\":\"Your Order Now is On The Way\",\"order_id\":283,\"order_status\":3,\"driver_phone\":\"987654320\"}', '2024-04-23 13:29:40', '2024-04-23 13:29:40'),
(324, '3', 'App\\Models\\User', 50, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":284,\"order_status\":2,\"driver_phone\":\"987654320\"}', '2024-04-23 13:31:29', '2024-04-23 13:31:29'),
(325, '3', 'App\\Models\\User', 50, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":285,\"order_status\":2,\"driver_phone\":\"987654320\"}', '2024-04-23 13:33:31', '2024-04-23 13:33:31'),
(326, '3', 'App\\Models\\User', 50, '{\"title\":\"Order On The Way\",\"body\":\"Your Order Now is On The Way\",\"order_id\":285,\"order_status\":3,\"driver_phone\":\"987654320\"}', '2024-04-23 13:33:58', '2024-04-23 13:33:58'),
(327, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":279,\"order_status\":4,\"driver_phone\":\"946649532\"}', '2024-04-23 13:44:58', '2024-04-23 13:44:58'),
(328, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":279,\"order_status\":4,\"driver_phone\":\"946649532\"}', '2024-04-23 13:45:44', '2024-04-23 13:45:44'),
(329, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":279,\"order_status\":4,\"driver_phone\":\"946649532\"}', '2024-04-23 13:48:44', '2024-04-23 13:48:44'),
(330, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":223,\"order_status\":4,\"driver_phone\":\"946649532\"}', '2024-04-23 13:50:13', '2024-04-23 13:50:13'),
(331, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":223,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-04-23 13:51:55', '2024-04-23 13:51:55'),
(332, '3', 'App\\Models\\User', 50, '{\"title\":\"Order On The Way\",\"body\":\"Your Order Now is On The Way\",\"order_id\":284,\"order_status\":3,\"driver_phone\":\"987654320\"}', '2024-04-23 16:11:55', '2024-04-23 16:11:55'),
(333, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":280,\"order_status\":2,\"driver_phone\":\"987654320\"}', '2024-04-23 16:14:44', '2024-04-23 16:14:44'),
(334, '3', 'App\\Models\\User', 50, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":281,\"order_status\":4,\"driver_phone\":\"987654320\"}', '2024-04-23 16:37:48', '2024-04-23 16:37:48'),
(335, '3', 'App\\Models\\User', 50, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":282,\"order_status\":4,\"driver_phone\":\"987654320\"}', '2024-04-23 16:38:25', '2024-04-23 16:38:25'),
(336, '3', 'App\\Models\\User', 50, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":285,\"order_status\":4,\"driver_phone\":\"987654320\"}', '2024-04-23 16:38:56', '2024-04-23 16:38:56'),
(337, '3', 'App\\Models\\User', 50, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":284,\"order_status\":4,\"driver_phone\":\"987654320\"}', '2024-04-23 16:53:39', '2024-04-23 16:53:39'),
(338, '3', 'App\\Models\\User', 50, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":283,\"order_status\":4,\"driver_phone\":\"987654320\"}', '2024-04-23 16:58:19', '2024-04-23 16:58:19'),
(339, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"Your Order Now is On The Way\",\"order_id\":280,\"order_status\":3,\"driver_phone\":\"987654320\"}', '2024-04-23 16:59:41', '2024-04-23 16:59:41'),
(340, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":280,\"order_status\":4,\"driver_phone\":\"987654320\"}', '2024-04-23 16:59:49', '2024-04-23 16:59:49'),
(341, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":286,\"order_status\":2,\"driver_phone\":\"987654320\"}', '2024-04-23 21:37:33', '2024-04-23 21:37:33'),
(342, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"Your Order Now is On The Way\",\"order_id\":286,\"order_status\":3,\"driver_phone\":\"987654320\"}', '2024-04-23 21:42:21', '2024-04-23 21:42:21'),
(343, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":286,\"order_status\":4,\"driver_phone\":\"987654320\"}', '2024-04-23 21:44:40', '2024-04-23 21:44:40'),
(344, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"Your Order Now is On The Way\",\"order_id\":286,\"order_status\":3,\"driver_phone\":\"987654320\"}', '2024-04-23 21:45:06', '2024-04-23 21:45:06'),
(345, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":286,\"order_status\":4,\"driver_phone\":\"987654320\"}', '2024-04-23 21:45:14', '2024-04-23 21:45:14'),
(346, '3', 'App\\Models\\User', 50, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":275,\"order_status\":4,\"driver_phone\":\"987654320\"}', '2024-04-24 08:18:15', '2024-04-24 08:18:15'),
(347, '3', 'App\\Models\\User', 28, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":272,\"order_status\":4,\"driver_phone\":\"987654320\"}', '2024-04-24 08:39:06', '2024-04-24 08:39:06');
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `created_at`, `updated_at`) VALUES
(348, '3', 'App\\Models\\User', 47, '{\"title\":\"Order On The Way\",\"body\":\"Your Order Now is On The Way\",\"order_id\":246,\"order_status\":3,\"driver_phone\":\"987654320\"}', '2024-04-24 08:40:58', '2024-04-24 08:40:58'),
(349, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":287,\"order_status\":2,\"driver_phone\":\"987654320\"}', '2024-04-24 08:49:11', '2024-04-24 08:49:11'),
(350, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"Your Order Now is On The Way\",\"order_id\":287,\"order_status\":3,\"driver_phone\":\"987654320\"}', '2024-04-24 08:49:30', '2024-04-24 08:49:30'),
(351, '3', 'App\\Models\\User', 47, '{\"title\":\"Order On The Way\",\"body\":\"Your Order Now is On The Way\",\"order_id\":237,\"order_status\":3,\"driver_phone\":\"987654320\"}', '2024-04-24 10:16:17', '2024-04-24 10:16:17'),
(352, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":292,\"order_status\":2,\"driver_phone\":\"987654320\"}', '2024-04-24 11:28:52', '2024-04-24 11:28:52'),
(353, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"Your Order Now is On The Way\",\"order_id\":292,\"order_status\":3,\"driver_phone\":\"987654320\"}', '2024-04-24 11:31:35', '2024-04-24 11:31:35'),
(354, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":292,\"order_status\":4,\"driver_phone\":\"987654320\"}', '2024-04-24 11:34:18', '2024-04-24 11:34:18'),
(355, '3', 'App\\Models\\User', 2, '{\"title\":\"test\",\"body\":\"test\"}', '2024-04-24 11:37:00', '2024-04-24 11:37:00'),
(356, '3', 'App\\Models\\User', 10, '{\"title\":\"test\",\"body\":\"test\"}', '2024-04-24 11:37:00', '2024-04-24 11:37:00'),
(369, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":297,\"order_status\":4,\"driver_phone\":\"987654320\"}', '2024-04-30 11:56:49', '2024-04-30 11:56:49'),
(370, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"Your Order Now is On The Way\",\"order_id\":296,\"order_status\":3,\"driver_phone\":\"987654320\"}', '2024-05-02 08:48:08', '2024-05-02 08:48:08'),
(371, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":296,\"order_status\":4,\"driver_phone\":\"987654320\"}', '2024-05-02 08:48:29', '2024-05-02 08:48:29'),
(372, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"Your Order Now is On The Way\",\"order_id\":223,\"order_status\":3,\"driver_phone\":\"946649532\"}', '2024-05-02 12:33:16', '2024-05-02 12:33:16'),
(373, '3', 'App\\Models\\User', 20, '{\"title\":\"messages.core.code\",\"body\":\"123487\"}', '2024-05-05 09:09:52', '2024-05-05 09:09:52'),
(374, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":223,\"order_status\":4,\"driver_phone\":\"946649532\"}', '2024-05-05 09:09:53', '2024-05-05 09:09:53'),
(375, '3', 'App\\Models\\User', 20, '{\"title\":\"messages.core.code\",\"body\":\"123487\"}', '2024-05-05 09:10:53', '2024-05-05 09:10:53'),
(376, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Delivery is on road this your Order Code\",\"body\":\"123487\"}', '2024-05-05 09:17:22', '2024-05-05 09:17:22'),
(377, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Driver is on road this your Order Code\",\"body\":\"123487\"}', '2024-05-05 09:19:09', '2024-05-05 09:19:09'),
(378, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Driver is on road this your Order Code\",\"body\":\"123487\"}', '2024-05-05 09:20:05', '2024-05-05 09:20:05'),
(379, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Driver is on road this your Order Code\",\"body\":\"123487\"}', '2024-05-05 09:20:35', '2024-05-05 09:20:35'),
(380, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Driver is on road this your Order Code\",\"body\":\"123487\"}', '2024-05-05 09:24:46', '2024-05-05 09:24:46'),
(381, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Driver is on road this your Order Code\",\"body\":\"123487\"}', '2024-05-05 09:25:47', '2024-05-05 09:25:47'),
(382, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"Your Order Now is On The Way\",\"order_id\":223,\"order_status\":3,\"driver_phone\":\"946649532\"}', '2024-05-05 09:25:47', '2024-05-05 09:25:47'),
(383, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Driver is on road this your Order Code\",\"body\":\"123487\"}', '2024-05-05 09:26:20', '2024-05-05 09:26:20'),
(384, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Driver is on road this your Order Code\",\"body\":\"123487\"}', '2024-05-05 09:34:03', '2024-05-05 09:34:03'),
(385, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":305,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-05-05 09:34:35', '2024-05-05 09:34:35'),
(386, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Driver is on road this your Order Code\",\"body\":\"18888235\"}', '2024-05-05 09:34:50', '2024-05-05 09:34:50'),
(387, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Driver is on road this your Order Code\",\"body\":\"123487\"}', '2024-05-05 09:36:00', '2024-05-05 09:36:00'),
(388, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Driver is on road this your Order Code\",\"body\":\"18888235\"}', '2024-05-05 09:38:44', '2024-05-05 09:38:44'),
(389, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Driver is on road this your Order Code\",\"body\":\"18888235\"}', '2024-05-05 09:38:51', '2024-05-05 09:38:51'),
(390, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":305,\"order_status\":4,\"driver_phone\":\"946649532\"}', '2024-05-05 09:38:53', '2024-05-05 09:38:53'),
(391, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Driver is on road this your Order Code\",\"body\":\"18888235\"}', '2024-05-05 09:39:08', '2024-05-05 09:39:08'),
(392, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Driver is on road this your Order Code\",\"body\":\"UX08UFT1\"}', '2024-05-05 09:39:18', '2024-05-05 09:39:18'),
(393, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Driver is on road this your Order Code\",\"body\":\"18888235\"}', '2024-05-05 09:41:43', '2024-05-05 09:41:43'),
(394, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Driver is on road this your Order Code\",\"body\":\"18888235\"}', '2024-05-05 09:43:07', '2024-05-05 09:43:07'),
(395, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Driver is on road this your Order Code\",\"body\":\"18888235\"}', '2024-05-05 09:51:49', '2024-05-05 09:51:49'),
(396, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Driver is on road this your Order Code\",\"body\":null}', '2024-05-05 10:03:24', '2024-05-05 10:03:24'),
(397, '3', 'App\\Models\\User', 47, '{\"title\":\"Your Driver is on road this your Order Code\",\"body\":null}', '2024-05-05 10:04:39', '2024-05-05 10:04:39'),
(398, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Driver is on road this your Order Code\",\"body\":\"18888235\"}', '2024-05-05 10:30:45', '2024-05-05 10:30:45'),
(399, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Driver is on road this your Order Code\",\"body\":\"18888235\"}', '2024-05-05 10:32:39', '2024-05-05 10:32:39'),
(400, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Driver is on road this your Order Code\",\"body\":\"123487\"}', '2024-05-05 10:35:09', '2024-05-05 10:35:09'),
(401, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Driver is on road this your Order Code\",\"body\":\"18888235\"}', '2024-05-05 10:35:22', '2024-05-05 10:35:22'),
(402, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Driver is on road this your Order Code\",\"body\":\"188882\"}', '2024-05-05 10:43:07', '2024-05-05 10:43:07'),
(403, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":306,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-05-05 10:44:59', '2024-05-05 10:44:59'),
(404, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Driver is on road this your Order Code\",\"body\":null}', '2024-05-05 10:45:04', '2024-05-05 10:45:04'),
(405, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Driver is on road this your Order Code\",\"body\":null}', '2024-05-05 10:46:08', '2024-05-05 10:46:08'),
(406, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Driver is on road this your Order Code\",\"body\":null}', '2024-05-05 10:46:24', '2024-05-05 10:46:24'),
(407, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Driver is on road this your Order Code\",\"body\":null}', '2024-05-05 10:47:06', '2024-05-05 10:47:06'),
(408, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Driver is on road this your Order Code\",\"body\":null}', '2024-05-05 10:52:42', '2024-05-05 10:52:42'),
(409, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":306,\"order_status\":4,\"driver_phone\":\"946649532\"}', '2024-05-05 10:54:20', '2024-05-05 10:54:20'),
(410, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Driver is on road this your Order Code\",\"body\":null}', '2024-05-05 10:55:17', '2024-05-05 10:55:17'),
(411, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Driver is on road this your Order Code\",\"body\":null}', '2024-05-05 10:56:18', '2024-05-05 10:56:18'),
(412, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Driver is on road this your Order Code\",\"body\":\"123487\"}', '2024-05-05 10:56:39', '2024-05-05 10:56:39'),
(413, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"Your Order Now is On The Way\",\"order_id\":221,\"order_status\":3,\"driver_phone\":\"946649532\"}', '2024-05-05 10:56:40', '2024-05-05 10:56:40'),
(414, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Driver is on road this your Order Code\",\"body\":\"430336\"}', '2024-05-05 10:56:54', '2024-05-05 10:56:54'),
(415, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"Your Order Now is On The Way\",\"order_id\":306,\"order_status\":3,\"driver_phone\":\"946649532\"}', '2024-05-05 10:56:54', '2024-05-05 10:56:54'),
(416, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":306,\"order_status\":4,\"driver_phone\":\"946649532\"}', '2024-05-05 11:45:01', '2024-05-05 11:45:01'),
(417, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"430336\"}', '2024-05-05 11:45:42', '2024-05-05 11:45:42'),
(418, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":306,\"order_status\":4,\"driver_phone\":\"946649532\"}', '2024-05-05 11:46:04', '2024-05-05 11:46:04'),
(419, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":307,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-05-05 11:49:29', '2024-05-05 11:49:29'),
(420, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"998448\"}', '2024-05-05 11:50:06', '2024-05-05 11:50:06'),
(421, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":307,\"order_status\":4,\"driver_phone\":\"946649532\"}', '2024-05-05 11:50:40', '2024-05-05 11:50:40'),
(422, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"998448\"}', '2024-05-05 11:54:03', '2024-05-05 11:54:03'),
(423, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":307,\"order_status\":4,\"driver_phone\":\"946649532\"}', '2024-05-05 11:54:19', '2024-05-05 11:54:19'),
(424, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":304,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-05-05 12:09:36', '2024-05-05 12:09:36'),
(425, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"UX08UFT1\"}', '2024-05-05 12:09:54', '2024-05-05 12:09:54'),
(426, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":308,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-05-05 12:12:27', '2024-05-05 12:12:27'),
(427, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"886248\"}', '2024-05-05 12:12:43', '2024-05-05 12:12:43'),
(428, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":308,\"order_status\":4,\"driver_phone\":\"946649532\"}', '2024-05-05 12:12:59', '2024-05-05 12:12:59'),
(429, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":309,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-05-05 13:02:20', '2024-05-05 13:02:20'),
(430, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"870803\"}', '2024-05-05 13:03:58', '2024-05-05 13:03:58'),
(431, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":309,\"order_status\":4,\"driver_phone\":\"946649532\"}', '2024-05-05 13:05:05', '2024-05-05 13:05:05'),
(432, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":310,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-05-05 13:16:11', '2024-05-05 13:16:11'),
(433, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"099600\"}', '2024-05-05 13:16:19', '2024-05-05 13:16:19'),
(434, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":310,\"order_status\":4,\"driver_phone\":\"946649532\"}', '2024-05-05 13:16:31', '2024-05-05 13:16:31'),
(435, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":311,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-05-05 13:21:43', '2024-05-05 13:21:43'),
(436, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"819696\"}', '2024-05-05 13:22:00', '2024-05-05 13:22:00'),
(437, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"819696\"}', '2024-05-05 13:26:26', '2024-05-05 13:26:26'),
(438, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":312,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-05-05 13:35:32', '2024-05-05 13:35:32'),
(439, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":312,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-05-05 13:35:32', '2024-05-05 13:35:32'),
(440, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"465093\"}', '2024-05-05 13:36:23', '2024-05-05 13:36:23'),
(441, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"465093\"}', '2024-05-05 13:38:08', '2024-05-05 13:38:08'),
(442, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"465093\"}', '2024-05-05 13:38:57', '2024-05-05 13:38:57'),
(443, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"465093\"}', '2024-05-05 13:40:37', '2024-05-05 13:40:37'),
(444, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":312,\"order_status\":4,\"driver_phone\":\"946649532\"}', '2024-05-05 13:41:00', '2024-05-05 13:41:00'),
(445, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":313,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-05-05 13:44:46', '2024-05-05 13:44:46'),
(446, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"937778\"}', '2024-05-05 13:44:54', '2024-05-05 13:44:54'),
(447, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":314,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-05-05 13:49:44', '2024-05-05 13:49:44'),
(448, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":223,\"order_status\":4,\"driver_phone\":\"946649532\"}', '2024-05-05 13:49:52', '2024-05-05 13:49:52'),
(449, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"452815\"}', '2024-05-05 13:50:05', '2024-05-05 13:50:05'),
(450, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":315,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-05-05 13:55:51', '2024-05-05 13:55:51'),
(451, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"272225\"}', '2024-05-05 13:58:36', '2024-05-05 13:58:36'),
(452, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":316,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-05-05 14:01:45', '2024-05-05 14:01:45'),
(453, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"243577\"}', '2024-05-05 14:02:30', '2024-05-05 14:02:30'),
(454, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-05 14:10:12', '2024-05-05 14:10:12'),
(455, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-05 14:10:35', '2024-05-05 14:10:35'),
(456, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":221,\"order_status\":4,\"driver_phone\":\"946649532\"}', '2024-05-05 14:10:43', '2024-05-05 14:10:43'),
(457, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-05 14:10:53', '2024-05-05 14:10:53'),
(458, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":317,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-05-05 14:12:41', '2024-05-05 14:12:41'),
(459, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"091046\"}', '2024-05-05 14:12:55', '2024-05-05 14:12:55'),
(460, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-05 14:14:49', '2024-05-05 14:14:49'),
(461, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-05 14:16:05', '2024-05-05 14:16:05'),
(462, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":221,\"order_status\":4,\"driver_phone\":\"946649532\"}', '2024-05-05 14:16:33', '2024-05-05 14:16:33'),
(463, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-05 14:16:39', '2024-05-05 14:16:39'),
(464, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-05 14:17:31', '2024-05-05 14:17:31'),
(465, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-05 14:17:34', '2024-05-05 14:17:34'),
(466, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-05 14:17:54', '2024-05-05 14:17:54'),
(467, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-05 14:17:57', '2024-05-05 14:17:57'),
(468, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-05 14:18:20', '2024-05-05 14:18:20'),
(469, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-05 14:22:15', '2024-05-05 14:22:15'),
(470, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":221,\"order_status\":4,\"driver_phone\":\"946649532\"}', '2024-05-05 14:22:26', '2024-05-05 14:22:26'),
(471, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-05 14:23:45', '2024-05-05 14:23:45'),
(472, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":221,\"order_status\":4,\"driver_phone\":\"946649532\"}', '2024-05-05 14:23:58', '2024-05-05 14:23:58'),
(473, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":318,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-05-05 14:33:49', '2024-05-05 14:33:49'),
(474, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-05 14:37:01', '2024-05-05 14:37:01'),
(475, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-05 14:39:36', '2024-05-05 14:39:36'),
(476, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-05 14:39:46', '2024-05-05 14:39:46'),
(477, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-05 14:39:51', '2024-05-05 14:39:51'),
(478, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-05 14:43:04', '2024-05-05 14:43:04'),
(479, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":221,\"order_status\":4,\"driver_phone\":\"946649532\"}', '2024-05-05 14:43:46', '2024-05-05 14:43:46'),
(480, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":319,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-05-05 14:46:40', '2024-05-05 14:46:40'),
(481, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-05 14:51:31', '2024-05-05 14:51:31'),
(482, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-05 14:51:47', '2024-05-05 14:51:47'),
(483, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-05 14:52:23', '2024-05-05 14:52:23'),
(484, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-05 14:52:27', '2024-05-05 14:52:27'),
(485, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-05 14:55:50', '2024-05-05 14:55:50'),
(486, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-05 14:56:26', '2024-05-05 14:56:26'),
(487, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"314543\"}', '2024-05-05 15:05:44', '2024-05-05 15:05:44'),
(488, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":320,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-05-05 15:11:38', '2024-05-05 15:11:38'),
(489, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"936665\"}', '2024-05-05 15:11:47', '2024-05-05 15:11:47'),
(490, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":320,\"order_status\":4,\"driver_phone\":\"946649532\"}', '2024-05-05 15:12:04', '2024-05-05 15:12:04'),
(491, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"936665\"}', '2024-05-05 15:12:04', '2024-05-05 15:12:04'),
(492, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":321,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-05-05 15:19:58', '2024-05-05 15:19:58'),
(493, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"577227\"}', '2024-05-05 15:20:12', '2024-05-05 15:20:12'),
(494, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":321,\"order_status\":4,\"driver_phone\":\"946649532\"}', '2024-05-05 15:21:12', '2024-05-05 15:21:12'),
(495, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"577227\"}', '2024-05-05 15:21:12', '2024-05-05 15:21:12'),
(496, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":322,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-05-05 15:24:09', '2024-05-05 15:24:09'),
(497, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"914938\"}', '2024-05-05 15:26:15', '2024-05-05 15:26:15'),
(498, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-06 08:07:27', '2024-05-06 08:07:27'),
(499, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-06 08:07:47', '2024-05-06 08:07:47'),
(500, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-06 08:07:51', '2024-05-06 08:07:51'),
(501, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-06 08:07:55', '2024-05-06 08:07:55'),
(502, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-06 08:08:36', '2024-05-06 08:08:36'),
(503, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-06 08:08:39', '2024-05-06 08:08:39'),
(504, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-06 08:08:47', '2024-05-06 08:08:47'),
(505, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-06 08:08:59', '2024-05-06 08:08:59'),
(506, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-06 08:09:19', '2024-05-06 08:09:19'),
(507, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-06 08:09:25', '2024-05-06 08:09:25'),
(508, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":326,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-05-06 08:13:49', '2024-05-06 08:13:49'),
(509, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-06 08:14:03', '2024-05-06 08:14:03'),
(510, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-06 08:14:29', '2024-05-06 08:14:29'),
(511, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-06 08:14:31', '2024-05-06 08:14:31'),
(512, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-06 08:17:08', '2024-05-06 08:17:08'),
(513, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-06 08:17:29', '2024-05-06 08:17:29'),
(514, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-06 08:18:10', '2024-05-06 08:18:10'),
(515, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-06 08:18:38', '2024-05-06 08:18:38'),
(516, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-06 08:18:44', '2024-05-06 08:18:44'),
(517, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-06 08:19:40', '2024-05-06 08:19:40'),
(518, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-06 08:21:00', '2024-05-06 08:21:00'),
(519, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-06 08:22:51', '2024-05-06 08:22:51'),
(520, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-06 08:23:05', '2024-05-06 08:23:05'),
(521, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-06 08:23:07', '2024-05-06 08:23:07'),
(522, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-06 08:23:35', '2024-05-06 08:23:35'),
(523, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-06 08:23:46', '2024-05-06 08:23:46'),
(524, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-06 08:24:02', '2024-05-06 08:24:02'),
(525, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":221,\"order_status\":4,\"driver_phone\":\"946649532\"}', '2024-05-06 08:24:06', '2024-05-06 08:24:06'),
(526, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-06 08:24:12', '2024-05-06 08:24:12'),
(527, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":221,\"order_status\":4,\"driver_phone\":\"946649532\"}', '2024-05-06 08:24:22', '2024-05-06 08:24:22'),
(528, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"844577\"}', '2024-05-06 08:25:27', '2024-05-06 08:25:27'),
(529, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":324,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-05-06 08:32:52', '2024-05-06 08:32:52'),
(530, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"153235\"}', '2024-05-06 08:33:22', '2024-05-06 08:33:22'),
(531, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":324,\"order_status\":4,\"driver_phone\":\"946649532\"}', '2024-05-06 08:34:14', '2024-05-06 08:34:14'),
(532, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":323,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-05-06 08:37:37', '2024-05-06 08:37:37'),
(533, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"964962\"}', '2024-05-06 08:37:55', '2024-05-06 08:37:55'),
(534, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"844577\"}', '2024-05-06 08:50:13', '2024-05-06 08:50:13'),
(535, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"844577\"}', '2024-05-06 08:58:14', '2024-05-06 08:58:14'),
(536, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"844577\"}', '2024-05-06 08:59:25', '2024-05-06 08:59:25'),
(537, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\"}', '2024-05-06 09:03:58', '2024-05-06 09:03:58'),
(538, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487 221\"}', '2024-05-06 09:08:37', '2024-05-06 09:08:37'),
(539, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"Code :  123487 221\"}', '2024-05-06 09:09:04', '2024-05-06 09:09:04'),
(540, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"Code:  123487 order_id:  221\"}', '2024-05-06 09:09:43', '2024-05-06 09:09:43'),
(541, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"Code: 123487 order_id: 221\"}', '2024-05-06 09:09:57', '2024-05-06 09:09:57'),
(542, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"Code: 123487 order_id: 221\"}', '2024-05-06 09:13:10', '2024-05-06 09:13:10'),
(543, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"Code: 844577 order_id: 326\"}', '2024-05-06 09:14:01', '2024-05-06 09:14:01'),
(544, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"{\\\"code\\\":\\\"123487\\\",\\\"order_id\\\":221}\"}', '2024-05-06 09:14:14', '2024-05-06 09:14:14'),
(545, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"{\\\"code\\\":\\\"844577\\\",\\\"order_id\\\":326}\"}', '2024-05-06 09:14:26', '2024-05-06 09:14:26'),
(546, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"Code: 123487 order_id: 221\",\"order_id\":221}', '2024-05-06 09:15:36', '2024-05-06 09:15:36'),
(547, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\",\"order_id\":221}', '2024-05-06 09:16:15', '2024-05-06 09:16:15'),
(548, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\",\"order_id\":221}', '2024-05-06 09:18:38', '2024-05-06 09:18:38'),
(549, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"844577\",\"order_id\":326}', '2024-05-06 09:18:39', '2024-05-06 09:18:39'),
(550, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\",\"order_id\":221,\"status\":\"OnDelivery\"}', '2024-05-06 09:20:13', '2024-05-06 09:20:13'),
(551, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"123487\",\"order_id\":221,\"status\":3}', '2024-05-06 09:20:52', '2024-05-06 09:20:52'),
(552, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"844577\",\"order_id\":326,\"status\":3}', '2024-05-06 09:21:27', '2024-05-06 09:21:27'),
(553, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"844577\",\"order_id\":326,\"status\":3}', '2024-05-06 09:23:23', '2024-05-06 09:23:23'),
(554, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"844577\",\"order_id\":326,\"status\":3}', '2024-05-06 09:31:17', '2024-05-06 09:31:17'),
(555, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"844577\",\"order_id\":326,\"status\":3}', '2024-05-06 09:32:32', '2024-05-06 09:32:32'),
(556, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"844577\",\"order_id\":326,\"status\":3}', '2024-05-06 09:37:30', '2024-05-06 09:37:30'),
(557, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"844577\",\"order_id\":326,\"status\":3}', '2024-05-06 09:40:47', '2024-05-06 09:40:47'),
(558, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"844577\",\"order_id\":326,\"status\":3}', '2024-05-06 09:59:48', '2024-05-06 09:59:48'),
(559, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"844577\",\"order_id\":326,\"status\":3}', '2024-05-06 10:01:53', '2024-05-06 10:01:53'),
(560, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"844577\",\"order_id\":326,\"status\":3}', '2024-05-06 10:03:06', '2024-05-06 10:03:06'),
(561, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"844577\",\"order_id\":326,\"status\":3}', '2024-05-06 10:05:50', '2024-05-06 10:05:50'),
(562, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"844577\",\"order_id\":326,\"status\":3}', '2024-05-06 10:09:42', '2024-05-06 10:09:42'),
(563, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"844577\",\"order_id\":326,\"status\":3}', '2024-05-06 10:11:45', '2024-05-06 10:11:45'),
(564, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"844577\",\"order_id\":326,\"status\":3}', '2024-05-06 10:12:54', '2024-05-06 10:12:54'),
(565, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"844577\",\"order_id\":326,\"status\":3}', '2024-05-06 10:14:33', '2024-05-06 10:14:33'),
(566, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"844577\",\"order_id\":326,\"status\":3}', '2024-05-06 10:16:24', '2024-05-06 10:16:24'),
(567, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"844577\",\"order_id\":326,\"status\":3}', '2024-05-06 10:17:11', '2024-05-06 10:17:11'),
(568, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"844577\",\"order_id\":326,\"status\":3}', '2024-05-06 10:18:17', '2024-05-06 10:18:17'),
(569, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"844577\",\"order_id\":326,\"status\":3}', '2024-05-06 10:19:03', '2024-05-06 10:19:03'),
(570, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"844577\",\"order_id\":326,\"status\":3}', '2024-05-06 10:19:33', '2024-05-06 10:19:33'),
(571, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"844577\",\"order_id\":326,\"status\":3}', '2024-05-06 10:20:52', '2024-05-06 10:20:52'),
(572, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"844577\",\"order_id\":326,\"status\":3}', '2024-05-06 10:21:46', '2024-05-06 10:21:46'),
(573, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"844577\",\"order_id\":326,\"status\":3}', '2024-05-06 10:23:07', '2024-05-06 10:23:07'),
(574, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"844577\",\"order_id\":326,\"status\":3}', '2024-05-06 10:23:43', '2024-05-06 10:23:43'),
(575, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"844577\",\"order_id\":326,\"status\":3}', '2024-05-06 10:24:38', '2024-05-06 10:24:38'),
(576, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"844577\",\"order_id\":326,\"status\":3}', '2024-05-06 10:25:50', '2024-05-06 10:25:50'),
(577, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"844577\",\"order_id\":326,\"status\":3}', '2024-05-06 10:26:27', '2024-05-06 10:26:27'),
(578, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"844577\",\"order_id\":326,\"status\":3}', '2024-05-06 10:27:26', '2024-05-06 10:27:26'),
(579, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"844577\",\"order_id\":326,\"status\":3}', '2024-05-06 10:27:36', '2024-05-06 10:27:36'),
(580, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"844577\",\"order_id\":326,\"status\":3}', '2024-05-06 10:28:13', '2024-05-06 10:28:13'),
(581, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"844577\",\"order_id\":326,\"status\":3}', '2024-05-06 10:29:50', '2024-05-06 10:29:50'),
(582, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"844577\",\"order_id\":326,\"status\":3}', '2024-05-06 10:30:08', '2024-05-06 10:30:08'),
(583, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"844577\",\"order_id\":326,\"status\":3}', '2024-05-06 10:30:40', '2024-05-06 10:30:40'),
(584, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"844577\",\"order_id\":326,\"status\":3}', '2024-05-06 10:31:45', '2024-05-06 10:31:45'),
(585, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"844577\",\"order_id\":326,\"status\":3}', '2024-05-06 10:32:41', '2024-05-06 10:32:41'),
(586, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"964962\",\"order_id\":323,\"status\":3}', '2024-05-06 10:33:14', '2024-05-06 10:33:14'),
(587, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"964962\",\"order_id\":323,\"status\":3}', '2024-05-06 10:33:55', '2024-05-06 10:33:55'),
(588, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"964962\",\"order_id\":323,\"status\":3}', '2024-05-06 10:34:17', '2024-05-06 10:34:17'),
(589, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"964962\",\"order_id\":323,\"status\":3}', '2024-05-06 10:36:33', '2024-05-06 10:36:33'),
(590, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":327,\"order_status\":2,\"driver_phone\":\"987654320\"}', '2024-05-06 10:37:06', '2024-05-06 10:37:06'),
(591, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":328,\"order_status\":2,\"driver_phone\":\"987654320\"}', '2024-05-06 10:38:56', '2024-05-06 10:38:56'),
(592, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"964962\",\"order_id\":323,\"status\":3}', '2024-05-06 10:40:06', '2024-05-06 10:40:06'),
(593, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"964962\",\"order_id\":323,\"status\":3}', '2024-05-06 11:40:14', '2024-05-06 11:40:14'),
(594, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"964962\",\"order_id\":323,\"status\":3}', '2024-05-06 11:40:32', '2024-05-06 11:40:32'),
(595, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"964962\",\"order_id\":323,\"status\":3}', '2024-05-06 11:42:18', '2024-05-06 11:42:18'),
(596, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"964962\",\"order_id\":323,\"status\":3}', '2024-05-06 11:42:43', '2024-05-06 11:42:43'),
(597, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"964962\",\"order_id\":323,\"status\":3}', '2024-05-06 11:45:48', '2024-05-06 11:45:48'),
(598, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"964962\",\"order_id\":323,\"status\":3}', '2024-05-06 11:48:57', '2024-05-06 11:48:57'),
(599, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":329,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-05-06 11:50:24', '2024-05-06 11:50:24'),
(600, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"241374\",\"order_id\":329,\"status\":2}', '2024-05-06 11:50:31', '2024-05-06 11:50:31'),
(601, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"241374\",\"order_id\":329,\"status\":3}', '2024-05-06 11:51:04', '2024-05-06 11:51:04'),
(602, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"241374\",\"order_id\":329,\"status\":3}', '2024-05-06 11:52:21', '2024-05-06 11:52:21'),
(603, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"241374\",\"order_id\":329,\"status\":3}', '2024-05-06 11:52:35', '2024-05-06 11:52:35'),
(604, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"241374\",\"order_id\":329,\"status\":3}', '2024-05-06 11:52:59', '2024-05-06 11:52:59'),
(605, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"241374\",\"order_id\":329,\"status\":3}', '2024-05-06 11:53:12', '2024-05-06 11:53:12'),
(606, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"241374\",\"order_id\":329,\"status\":3}', '2024-05-06 11:53:28', '2024-05-06 11:53:28'),
(607, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"241374\",\"order_id\":329,\"status\":3}', '2024-05-06 11:53:55', '2024-05-06 11:53:55'),
(608, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":331,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-05-06 11:58:13', '2024-05-06 11:58:13'),
(609, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":330,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-05-06 11:58:23', '2024-05-06 11:58:23'),
(610, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"242740\",\"order_id\":330,\"status\":2}', '2024-05-06 11:58:34', '2024-05-06 11:58:34'),
(611, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":332,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-05-06 12:06:35', '2024-05-06 12:06:35'),
(612, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"746801\",\"order_id\":332,\"status\":2}', '2024-05-06 12:07:00', '2024-05-06 12:07:00'),
(613, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"746801\",\"order_id\":332,\"status\":3}', '2024-05-06 12:08:33', '2024-05-06 12:08:33'),
(614, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"746801\",\"order_id\":332,\"status\":3}', '2024-05-06 12:08:55', '2024-05-06 12:08:55'),
(615, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"746801\",\"order_id\":332,\"status\":3}', '2024-05-06 12:10:03', '2024-05-06 12:10:03'),
(616, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"746801\",\"order_id\":332,\"status\":3}', '2024-05-06 12:10:18', '2024-05-06 12:10:18'),
(617, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"746801\",\"order_id\":332,\"status\":3}', '2024-05-06 12:11:58', '2024-05-06 12:11:58'),
(618, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"746801\",\"order_id\":332,\"status\":3}', '2024-05-06 12:12:14', '2024-05-06 12:12:14'),
(619, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"746801\",\"order_id\":332,\"status\":3}', '2024-05-06 12:12:30', '2024-05-06 12:12:30'),
(620, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"746801\",\"order_id\":332,\"status\":3}', '2024-05-06 12:12:55', '2024-05-06 12:12:55'),
(621, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"746801\",\"order_id\":332,\"status\":3}', '2024-05-06 12:18:20', '2024-05-06 12:18:20'),
(622, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"746801\",\"order_id\":332,\"status\":3}', '2024-05-06 12:20:51', '2024-05-06 12:20:51'),
(623, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"746801\",\"order_id\":332,\"status\":3}', '2024-05-06 12:21:13', '2024-05-06 12:21:13'),
(624, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"746801\",\"order_id\":332,\"status\":3}', '2024-05-06 12:21:38', '2024-05-06 12:21:38'),
(625, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"746801\",\"order_id\":332,\"status\":3}', '2024-05-06 12:31:32', '2024-05-06 12:31:32'),
(626, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"746801\",\"order_id\":332,\"status\":3}', '2024-05-06 12:32:01', '2024-05-06 12:32:01'),
(627, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"746801\",\"order_id\":332,\"status\":3}', '2024-05-06 12:42:25', '2024-05-06 12:42:25'),
(628, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"746801\",\"order_id\":332,\"status\":3}', '2024-05-06 12:51:59', '2024-05-06 12:51:59'),
(629, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"746801\",\"order_id\":332,\"status\":3}', '2024-05-06 13:22:54', '2024-05-06 13:22:54'),
(630, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"746801\",\"order_id\":332,\"status\":3}', '2024-05-06 13:24:01', '2024-05-06 13:24:01'),
(631, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"746801\",\"order_id\":332,\"status\":3}', '2024-05-06 13:48:39', '2024-05-06 13:48:39'),
(632, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"914938\",\"order_id\":322,\"status\":3}', '2024-05-07 13:12:56', '2024-05-07 13:12:56'),
(633, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":322,\"order_status\":4,\"driver_phone\":\"946649532\"}', '2024-05-07 13:15:17', '2024-05-07 13:15:17'),
(634, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"746801\",\"order_id\":332,\"status\":3}', '2024-05-07 13:28:31', '2024-05-07 13:28:31'),
(635, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":332,\"order_status\":4,\"driver_phone\":\"946649532\"}', '2024-05-07 13:28:41', '2024-05-07 13:28:41'),
(636, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":303,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-05-07 13:57:33', '2024-05-07 13:57:33'),
(637, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"wMSUzQgT\",\"order_id\":303,\"status\":2}', '2024-05-07 13:57:38', '2024-05-07 13:57:38'),
(638, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":302,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-05-07 14:23:07', '2024-05-07 14:23:07'),
(639, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"VQT1ZdBl\",\"order_id\":302,\"status\":2}', '2024-05-07 14:23:14', '2024-05-07 14:23:14'),
(640, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"VQT1ZdBl\",\"order_id\":302,\"status\":3}', '2024-05-07 14:58:38', '2024-05-07 14:58:38'),
(641, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":301,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-05-07 15:02:34', '2024-05-07 15:02:34'),
(642, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":null,\"order_id\":301,\"status\":2}', '2024-05-07 15:02:42', '2024-05-07 15:02:42'),
(643, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":null,\"order_id\":301,\"status\":3}', '2024-05-07 15:14:31', '2024-05-07 15:14:31'),
(644, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":null,\"order_id\":301,\"status\":3}', '2024-05-07 15:29:54', '2024-05-07 15:29:54');
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `created_at`, `updated_at`) VALUES
(645, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":null,\"order_id\":301,\"status\":3}', '2024-05-07 15:30:45', '2024-05-07 15:30:45'),
(646, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":null,\"order_id\":301,\"status\":3}', '2024-05-07 15:32:00', '2024-05-07 15:32:00'),
(647, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":null,\"order_id\":301,\"status\":3}', '2024-05-07 15:36:33', '2024-05-07 15:36:33'),
(648, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":null,\"order_id\":301,\"status\":3}', '2024-05-07 15:37:25', '2024-05-07 15:37:25'),
(649, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":null,\"order_id\":301,\"status\":3}', '2024-05-07 15:43:17', '2024-05-07 15:43:17'),
(650, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":300,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-05-07 20:22:47', '2024-05-07 20:22:47'),
(651, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":null,\"order_id\":300,\"status\":2}', '2024-05-07 20:22:55', '2024-05-07 20:22:55'),
(652, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":299,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-05-07 21:00:23', '2024-05-07 21:00:23'),
(653, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":null,\"order_id\":299,\"status\":2}', '2024-05-07 21:00:44', '2024-05-07 21:00:44'),
(654, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":298,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-05-08 08:15:15', '2024-05-08 08:15:15'),
(655, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":null,\"order_id\":298,\"status\":2}', '2024-05-08 08:15:23', '2024-05-08 08:15:23'),
(656, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":null,\"order_id\":298,\"status\":3}', '2024-05-08 08:55:03', '2024-05-08 08:55:03'),
(657, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"522301\",\"order_id\":331,\"status\":3}', '2024-05-08 08:59:42', '2024-05-08 08:59:42'),
(658, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"522301\",\"order_id\":331,\"status\":3}', '2024-05-08 09:02:38', '2024-05-08 09:02:38'),
(659, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"522301\",\"order_id\":331,\"status\":3}', '2024-05-08 09:04:30', '2024-05-08 09:04:30'),
(660, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":331,\"order_status\":4,\"driver_phone\":\"946649532\"}', '2024-05-08 09:04:42', '2024-05-08 09:04:42'),
(661, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"242740\",\"order_id\":330,\"status\":3}', '2024-05-08 09:07:03', '2024-05-08 09:07:03'),
(662, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":330,\"order_status\":4,\"driver_phone\":\"946649532\"}', '2024-05-08 09:07:18', '2024-05-08 09:07:18'),
(663, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"241374\",\"order_id\":329,\"status\":3}', '2024-05-08 09:42:11', '2024-05-08 09:42:11'),
(664, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":329,\"order_status\":4,\"driver_phone\":\"946649532\"}', '2024-05-08 09:42:27', '2024-05-08 09:42:27'),
(665, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"844577\",\"order_id\":326,\"status\":3}', '2024-05-08 10:34:18', '2024-05-08 10:34:18'),
(666, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"844577\",\"order_id\":326,\"status\":3}', '2024-05-08 10:35:06', '2024-05-08 10:35:06'),
(667, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":326,\"order_status\":4,\"driver_phone\":\"946649532\"}', '2024-05-08 10:35:23', '2024-05-08 10:35:23'),
(668, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"964962\",\"order_id\":323,\"status\":3}', '2024-05-08 10:38:02', '2024-05-08 10:38:02'),
(669, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":323,\"order_status\":4,\"driver_phone\":\"946649532\"}', '2024-05-08 10:38:17', '2024-05-08 10:38:17'),
(670, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"091046\",\"order_id\":317,\"status\":3}', '2024-05-08 10:57:00', '2024-05-08 10:57:00'),
(671, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Arrived\",\"body\":\"The Driver Has Arrived To Your Area\",\"order_id\":317,\"order_status\":4,\"driver_phone\":\"946649532\"}', '2024-05-08 10:57:13', '2024-05-08 10:57:13'),
(672, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":340,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-05-12 11:27:19', '2024-05-12 11:27:19'),
(673, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"342578\",\"order_id\":340,\"status\":2}', '2024-05-12 11:27:27', '2024-05-12 11:27:27'),
(674, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":341,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-05-15 16:28:00', '2024-05-15 16:28:00'),
(675, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"152415\",\"order_id\":341,\"status\":3}', '2024-05-15 16:28:13', '2024-05-15 16:28:13'),
(678, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":358,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-05-30 13:37:36', '2024-05-30 13:37:36'),
(679, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"Your Order Now is On The Way\",\"order_id\":358,\"order_status\":3,\"driver_phone\":\"946649532\"}', '2024-05-30 13:37:59', '2024-05-30 13:37:59'),
(680, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"GSIWz8Dr\",\"order_id\":358,\"status\":3}', '2024-06-02 13:05:30', '2024-06-02 13:05:30'),
(681, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"GSIWz8Dr\",\"order_id\":358,\"status\":3}', '2024-06-02 13:06:15', '2024-06-02 13:06:15'),
(682, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"GSIWz8Dr\",\"order_id\":358,\"status\":3}', '2024-06-02 13:09:48', '2024-06-02 13:09:48'),
(683, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"GSIWz8Dr\",\"order_id\":358,\"status\":3}', '2024-06-02 13:11:35', '2024-06-02 13:11:35'),
(684, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"GSIWz8Dr\",\"order_id\":358,\"status\":3}', '2024-06-02 13:14:01', '2024-06-02 13:14:01'),
(685, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"GSIWz8Dr\",\"order_id\":358,\"status\":3}', '2024-06-02 13:15:23', '2024-06-02 13:15:23'),
(686, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"GSIWz8Dr\",\"order_id\":358,\"status\":3}', '2024-06-02 13:16:30', '2024-06-02 13:16:30'),
(687, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":360,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-06-02 13:21:31', '2024-06-02 13:21:31'),
(688, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"Your Order Now is On The Way\",\"order_id\":360,\"order_status\":3,\"driver_phone\":\"946649532\"}', '2024-06-02 13:21:41', '2024-06-02 13:21:41'),
(689, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"q47z4hVJ\",\"order_id\":360,\"status\":3}', '2024-06-02 13:21:47', '2024-06-02 13:21:47'),
(690, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":361,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-06-02 13:46:40', '2024-06-02 13:46:40'),
(691, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"Your Order Now is On The Way\",\"order_id\":361,\"order_status\":3,\"driver_phone\":\"946649532\"}', '2024-06-02 13:46:51', '2024-06-02 13:46:51'),
(692, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"96368635\",\"order_id\":361,\"status\":3}', '2024-06-02 13:46:56', '2024-06-02 13:46:56'),
(693, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"96368635\",\"order_id\":361,\"status\":3}', '2024-06-02 15:18:44', '2024-06-02 15:18:44'),
(694, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"96368635\",\"order_id\":361,\"status\":3}', '2024-06-02 15:24:33', '2024-06-02 15:24:33'),
(695, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"96368635\",\"order_id\":361,\"status\":3}', '2024-06-02 15:25:01', '2024-06-02 15:25:01'),
(696, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":357,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-06-02 15:27:12', '2024-06-02 15:27:12'),
(697, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"Your Order Now is On The Way\",\"order_id\":357,\"order_status\":3,\"driver_phone\":\"946649532\"}', '2024-06-02 15:29:21', '2024-06-02 15:29:21'),
(698, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"NfD7NvR7\",\"order_id\":357,\"status\":3}', '2024-06-02 15:29:33', '2024-06-02 15:29:33'),
(699, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":362,\"order_status\":2,\"driver_phone\":\"946649532\"}', '2024-06-02 15:31:39', '2024-06-02 15:31:39'),
(700, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"Your Order Now is On The Way\",\"order_id\":362,\"order_status\":3,\"driver_phone\":\"946649532\"}', '2024-06-02 15:31:50', '2024-06-02 15:31:50'),
(701, '3', 'App\\Models\\User', 20, '{\"title\":\"Order On The Way\",\"body\":\"89237661\",\"order_id\":362,\"status\":3}', '2024-06-02 15:32:00', '2024-06-02 15:32:00');

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
  `coupon_discount` double NOT NULL DEFAULT '0',
  `tax` double NOT NULL DEFAULT '0',
  `delivery_fee` double DEFAULT '0',
  `extra_discount` double NOT NULL DEFAULT '0',
  `sub_total` double NOT NULL DEFAULT '0',
  `total` double NOT NULL DEFAULT '0',
  `date` date NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `rate` int DEFAULT NULL,
  `changes` text COLLATE utf8mb4_unicode_ci,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason_for_cancel` text COLLATE utf8mb4_unicode_ci,
  `confirmed_at` datetime DEFAULT NULL,
  `delivered_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `driver_id`, `status`, `delivery_method_id`, `payment_method_id`, `user_address_id`, `city_id`, `start_time`, `end_time`, `latitude`, `longitude`, `payment_status`, `coupon_discount`, `tax`, `delivery_fee`, `extra_discount`, `sub_total`, `total`, `date`, `notes`, `rate`, `changes`, `code`, `reason_for_cancel`, `confirmed_at`, `delivered_at`, `deleted_at`, `created_at`, `updated_at`) VALUES
(221, 1008, 20, 1, 3, 1, 1, 26, NULL, NULL, NULL, NULL, NULL, 1, 2249, 0, 4498, 0, 2722, 4971, '2024-04-01', 'test', 2, '[1,2]', '123487', NULL, NULL, '2024-05-06 10:24:21', NULL, '2024-04-01 10:02:23', '2024-05-06 09:03:58'),
(223, 1010, 20, 1, 4, 1, 1, 26, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 4498, 0, 2500, 6998, '2024-04-01', 'test', 0, '[1,2]', NULL, NULL, '2024-04-23 15:51:55', '2024-05-05 15:49:51', NULL, '2024-04-01 10:12:23', '2024-05-05 13:49:52'),
(234, 1019, 47, NULL, 5, 1, 1, 76, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1606, 0, 28500, 549866, '2024-04-07', NULL, NULL, '[1]', NULL, NULL, NULL, NULL, NULL, '2024-04-07 10:12:41', '2024-04-15 12:19:56'),
(235, 1020, 47, 2, 2, 1, 1, 76, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1606, 0, 28500, 549866, '2024-04-07', NULL, NULL, '[1,4]', NULL, NULL, NULL, NULL, NULL, '2024-04-07 10:14:53', '2024-04-08 13:33:27'),
(237, 1022, 47, 2, 3, 1, 1, 76, NULL, NULL, NULL, NULL, NULL, 0, 0, 546, 1606, 0, 10920, 13072, '2024-04-07', NULL, NULL, '[]', NULL, NULL, NULL, NULL, NULL, '2024-04-07 10:56:34', '2024-04-24 10:16:17'),
(241, 1025, 47, 3, 1, 2, 1, 76, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 3212, 0, 5000, 8212, '2024-04-14', NULL, NULL, '[2]', NULL, NULL, NULL, NULL, NULL, '2024-04-14 08:09:19', '2024-04-14 08:09:19'),
(246, 1030, 47, 2, 3, 1, 1, 76, NULL, NULL, NULL, NULL, NULL, 0, 0, 16, 1606, 0, 3300, 4922, '2024-04-15', NULL, NULL, '[]', NULL, 'qqqq', '2024-04-22 13:00:52', NULL, NULL, '2024-04-15 08:31:27', '2024-04-24 08:40:58'),
(248, 1032, 47, 3, 1, 1, 1, 76, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1606, 0, 2500, 4106, '2024-04-15', NULL, NULL, '[4]', NULL, NULL, NULL, NULL, NULL, '2024-04-15 14:22:23', '2024-04-21 11:58:27'),
(249, 1033, 47, 3, 1, 1, 1, 76, NULL, NULL, NULL, NULL, NULL, 0, 0, 562, 1606, 0, 19220, 21388, '2024-04-15', NULL, NULL, '[]', NULL, NULL, NULL, NULL, NULL, '2024-04-15 14:24:42', '2024-04-21 12:14:09'),
(250, 1034, 47, 3, 1, 1, 1, 76, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1606, 0, 5000, 6606, '2024-04-15', NULL, 1, '[]', NULL, 'gH', NULL, NULL, NULL, '2024-04-15 14:25:43', '2024-04-21 11:10:54'),
(272, 1038, 28, 2, 4, 1, 1, 42, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 17724213, 0, 2500, 17726713, '2024-04-21', NULL, NULL, '[1]', NULL, NULL, '2024-04-22 11:31:04', '2024-04-24 10:39:06', NULL, '2024-04-21 14:51:58', '2024-04-24 08:39:06'),
(273, 1038, 28, 3, 3, 1, 1, 42, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 17724213, 0, 2500, 17726713, '2024-04-21', NULL, NULL, '[1]', NULL, NULL, '2024-04-22 12:49:52', NULL, NULL, '2024-04-21 14:51:58', '2024-04-22 12:38:15'),
(275, 1040, 50, 2, 4, 1, 1, 85, NULL, NULL, NULL, NULL, NULL, 1, 0, 16, 1632, 0, 800, 2448, '2024-04-23', NULL, NULL, '[5]', NULL, NULL, '2024-04-23 14:23:25', '2024-04-24 10:18:15', NULL, '2024-04-23 11:37:19', '2024-04-24 08:18:15'),
(281, 1043, 50, 2, 4, 2, 1, 85, NULL, NULL, NULL, NULL, NULL, 1, 0, 510, 3265, 0, 10200, 13975, '2024-04-23', NULL, NULL, '[5]', NULL, NULL, '2024-04-23 15:16:14', '2024-04-23 18:37:48', NULL, '2024-04-23 13:15:42', '2024-04-23 16:37:49'),
(282, 1044, 50, 2, 4, 2, 1, 85, NULL, NULL, NULL, NULL, NULL, 1, 0, 96, 3265, 0, 9800, 13161, '2024-04-23', NULL, NULL, '[]', NULL, NULL, '2024-04-23 15:24:43', '2024-04-23 18:38:24', NULL, '2024-04-23 13:23:17', '2024-04-23 16:38:25'),
(283, 1045, 50, 2, 4, 2, 1, 85, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 3265, 0, 2500, 5765, '2024-04-23', NULL, NULL, '[]', NULL, NULL, '2024-04-23 15:28:55', '2024-04-23 18:58:19', NULL, '2024-04-23 13:27:58', '2024-04-23 16:58:19'),
(284, 1046, 50, 2, 4, 1, 1, 85, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 1632, 0, 2500, 4132, '2024-04-23', NULL, NULL, '[]', NULL, NULL, '2024-04-23 15:31:29', '2024-04-23 18:53:39', NULL, '2024-04-23 13:30:46', '2024-04-23 16:53:39'),
(285, 1047, 50, 2, 4, 1, 1, 85, NULL, NULL, NULL, NULL, NULL, 1, 0, 16, 1632, 0, 800, 2448, '2024-04-23', NULL, NULL, '[]', NULL, NULL, '2024-04-23 15:33:31', '2024-04-23 18:38:56', NULL, '2024-04-23 13:33:18', '2024-04-23 16:38:56'),
(289, 1051, 20, 2, 2, 1, 1, 81, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1123, 0, 10000, 11123, '2024-04-24', NULL, NULL, '[4]', NULL, NULL, '2024-04-28 12:50:59', NULL, NULL, '2024-04-24 08:59:30', '2024-04-28 10:51:00'),
(290, 1052, 20, NULL, 2, 1, 1, 87, NULL, NULL, NULL, NULL, NULL, 0, 0, 2730, 1120, 0, 54600, 58450, '2024-04-24', NULL, NULL, '[]', NULL, NULL, NULL, NULL, NULL, '2024-04-24 09:13:50', '2024-04-24 10:25:18'),
(291, 1053, 20, 2, 2, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 9906235, 0, 2500, 9908735, '2024-04-24', NULL, NULL, '[]', NULL, NULL, '2024-04-28 12:50:49', NULL, NULL, '2024-04-24 10:37:13', '2024-04-28 10:50:49'),
(292, 1054, 20, 2, 4, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 1, 3500, 0, 9906235, 0, 0, 9902735, '2024-04-24', NULL, NULL, '[1]', NULL, NULL, '2024-04-24 13:28:52', '2024-04-24 13:34:18', NULL, '2024-04-24 11:23:40', '2024-04-24 11:34:18'),
(293, 1055, 20, 2, 2, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 0, 3500, 526, 9906235, 0, 11000, 9914261, '2024-04-24', NULL, NULL, '[]', NULL, NULL, '2024-04-28 12:50:46', NULL, NULL, '2024-04-24 12:10:21', '2024-04-28 10:50:47'),
(294, 1056, 20, 2, 4, 1, 1, 26, NULL, NULL, NULL, NULL, NULL, 1, 0, 32, 3149, 81, 6600, 9781, '2024-04-25', 'test', NULL, '[1,2]', NULL, NULL, '2024-04-25 14:31:51', '2024-04-25 14:38:23', NULL, '2024-04-25 12:14:04', '2024-04-25 12:38:23'),
(295, 1057, 20, 2, 2, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 9906235, 35, 2500, 9908700, '2024-04-25', NULL, NULL, '[]', NULL, NULL, '2024-04-28 12:50:54', NULL, NULL, '2024-04-25 12:59:49', '2024-04-28 10:50:54'),
(296, 1058, 20, 2, 4, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 1, 7000, 0, 9906235, 35, 2500, 9901735, '2024-04-26', NULL, NULL, '[]', NULL, NULL, '2024-04-28 12:50:52', '2024-05-02 10:48:29', NULL, '2024-04-26 16:44:47', '2024-05-02 08:48:29'),
(297, 1059, 20, 2, 4, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 9906235, 35, 2500, 9908735, '2024-04-28', NULL, NULL, '[]', NULL, NULL, '2024-04-28 12:50:43', '2024-04-30 13:56:48', NULL, '2024-04-28 10:50:13', '2024-04-30 11:56:49'),
(298, 1060, 20, 1, 3, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 14151763, 63, 2500, 14154200, '2024-04-28', 'jj', NULL, '[2]', NULL, NULL, '2024-05-08 10:15:15', NULL, NULL, '2024-04-28 13:50:29', '2024-05-08 08:15:23'),
(299, 1061, 20, 1, 3, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 14151763, 63, 12500, 14164200, '2024-04-29', NULL, NULL, '[]', NULL, NULL, '2024-05-07 23:00:23', NULL, NULL, '2024-04-29 11:27:50', '2024-05-07 21:00:44'),
(300, 1062, 20, 1, 3, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 0, 0, 675, 9906235, 10, 22500, 9929400, '2024-04-30', NULL, NULL, '[]', NULL, NULL, '2024-05-07 22:22:47', NULL, NULL, '2024-04-30 13:59:12', '2024-05-07 20:22:55'),
(301, 1063, 20, 1, 3, 2, 1, 80, NULL, NULL, NULL, NULL, NULL, 0, 0, 16, 19812469, 85, 800, 19813200, '2024-05-02', NULL, NULL, '[]', NULL, NULL, '2024-05-07 17:02:34', NULL, NULL, '2024-05-02 09:31:15', '2024-05-07 15:02:42'),
(302, 1064, 20, 1, 3, 2, 1, 80, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 19812469, 69, 2500, 19814900, '2024-05-02', NULL, NULL, '[]', 'VQT1ZdBl', NULL, '2024-05-07 16:23:07', NULL, NULL, '2024-05-02 10:38:27', '2024-05-07 14:23:14'),
(303, 1065, 20, 1, 3, 2, 1, 80, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 19812469, 69, 2500, 19814900, '2024-05-02', NULL, NULL, '[]', 'wMSUzQgT', NULL, '2024-05-07 15:57:32', NULL, NULL, '2024-05-02 12:16:01', '2024-05-07 13:57:38'),
(304, 1066, 20, 1, 3, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 9906235, 35, 2500, 9908700, '2024-05-02', NULL, NULL, '[]', 'UX08UFT1', NULL, '2024-05-05 14:09:36', NULL, NULL, '2024-05-02 13:43:32', '2024-05-05 12:09:54'),
(305, 1067, 20, 1, 4, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 1, 0, 16, 9906235, 51, 800, 9907000, '2024-05-05', NULL, NULL, '[1]', '188882', NULL, '2024-05-05 11:34:35', '2024-05-05 11:38:53', NULL, '2024-05-05 09:14:29', '2024-05-05 09:38:53'),
(306, 1068, 20, 1, 4, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 1, 0, 16, 9906235, 51, 800, 9907000, '2024-05-05', NULL, NULL, '[]', '430336', NULL, '2024-05-05 12:44:58', '2024-05-05 13:46:04', NULL, '2024-05-05 10:44:10', '2024-05-05 11:46:04'),
(307, 1069, 20, 1, 4, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 9906235, 35, 2500, 9908735, '2024-05-05', NULL, NULL, '[]', '998448', NULL, '2024-05-05 13:49:29', '2024-05-05 13:54:18', NULL, '2024-05-05 11:47:51', '2024-05-05 11:54:19'),
(308, 1070, 20, 1, 4, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 9906235, 35, 2500, 9908700, '2024-05-05', NULL, NULL, '[]', '886248', NULL, '2024-05-05 14:12:26', '2024-05-05 14:12:58', NULL, '2024-05-05 12:11:47', '2024-05-05 12:12:59'),
(309, 1071, 20, 1, 4, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 9906235, 35, 2500, 9908700, '2024-05-05', NULL, NULL, '[]', '870803', NULL, '2024-05-05 15:02:19', '2024-05-05 15:05:04', NULL, '2024-05-05 13:01:40', '2024-05-05 13:05:05'),
(310, 1072, 20, 1, 4, 2, 1, 80, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 19812469, 69, 2500, 19814900, '2024-05-05', NULL, NULL, '[]', '099600', NULL, '2024-05-05 15:16:11', '2024-05-05 15:16:30', NULL, '2024-05-05 13:15:01', '2024-05-05 13:16:31'),
(311, 1073, 20, 1, 3, 2, 1, 80, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 19812469, 69, 2500, 19814900, '2024-05-05', NULL, NULL, '[]', '819696', NULL, '2024-05-05 15:21:43', NULL, NULL, '2024-05-05 13:21:09', '2024-05-05 13:22:00'),
(312, 1074, 20, 1, 4, 2, 1, 80, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 19812469, 69, 2500, 19814969, '2024-05-05', NULL, NULL, '[]', '465093', NULL, '2024-05-05 15:35:32', '2024-05-05 15:40:59', NULL, '2024-05-05 13:29:46', '2024-05-05 13:41:00'),
(313, 1075, 20, 1, 3, 2, 1, 80, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 19812469, 69, 2500, 19814900, '2024-05-05', NULL, NULL, '[]', '937778', NULL, '2024-05-05 15:44:45', NULL, NULL, '2024-05-05 13:41:55', '2024-05-05 13:44:54'),
(314, 1076, 20, 1, 3, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 9906235, 35, 2500, 9908700, '2024-05-05', NULL, NULL, '[]', '452815', NULL, '2024-05-05 15:49:44', NULL, NULL, '2024-05-05 13:48:33', '2024-05-05 13:50:05'),
(315, 1077, 20, 1, 3, 2, 1, 80, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 19812469, 69, 2500, 19814900, '2024-05-05', NULL, NULL, '[]', '272225', NULL, '2024-05-05 15:55:51', NULL, NULL, '2024-05-05 13:52:26', '2024-05-05 13:58:36'),
(316, 1078, 20, 1, 3, 2, 1, 80, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 19812469, 69, 2500, 19814900, '2024-05-05', NULL, NULL, '[]', '243577', NULL, '2024-05-05 16:01:45', NULL, NULL, '2024-05-05 14:00:42', '2024-05-05 14:02:30'),
(317, 1079, 20, 1, 4, 2, 1, 80, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 19812469, 69, 2500, 19814969, '2024-05-05', NULL, NULL, '[]', '091046', NULL, '2024-05-05 16:12:40', '2024-05-08 12:57:13', NULL, '2024-05-05 14:11:58', '2024-05-08 10:57:13'),
(318, 1080, 20, 1, 2, 2, 1, 80, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 19812469, 69, 2500, 19814900, '2024-05-05', NULL, NULL, '[]', '768146', NULL, '2024-05-05 16:33:49', NULL, NULL, '2024-05-05 14:22:25', '2024-05-05 14:33:49'),
(319, 1081, 20, 1, 2, 2, 1, 80, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 19812469, 69, 2500, 19814900, '2024-05-05', NULL, NULL, '[]', '314543', NULL, '2024-05-05 16:46:40', NULL, NULL, '2024-05-05 14:45:29', '2024-05-05 14:46:40'),
(320, 1082, 20, 1, 4, 2, 1, 80, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 19812469, 69, 2500, 19814900, '2024-05-05', NULL, NULL, '[]', '936665', NULL, '2024-05-05 17:11:38', '2024-05-05 17:12:03', NULL, '2024-05-05 15:11:03', '2024-05-05 15:12:04'),
(321, 1083, 20, 1, 4, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 9906235, 35, 2500, 9908700, '2024-05-05', NULL, NULL, '[]', '577227', NULL, '2024-05-05 17:19:58', '2024-05-05 17:21:12', NULL, '2024-05-05 15:19:41', '2024-05-05 15:21:12'),
(322, 1084, 20, 1, 4, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 9906235, 35, 2500, 9908735, '2024-05-05', NULL, NULL, '[]', '914938', NULL, '2024-05-05 17:24:09', '2024-05-07 15:15:17', NULL, '2024-05-05 15:23:28', '2024-05-07 13:15:17'),
(323, 1085, 20, 1, 4, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 9906235, 35, 2500, 9908735, '2024-05-06', NULL, NULL, '[]', '964962', NULL, '2024-05-06 10:37:37', '2024-05-08 12:38:17', NULL, '2024-05-06 08:11:46', '2024-05-08 10:38:17'),
(324, 1086, 20, 1, 4, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 9906235, 35, 2500, 9908700, '2024-05-06', NULL, NULL, '[]', '153235', NULL, '2024-05-06 10:32:52', '2024-05-06 10:34:13', NULL, '2024-05-06 08:12:13', '2024-05-06 08:34:14'),
(326, 1087, 20, 1, 4, 2, 1, 80, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 19812469, 69, 2500, 19814969, '2024-05-06', NULL, NULL, '[]', '844577', NULL, '2024-05-06 10:13:49', '2024-05-08 12:35:23', NULL, '2024-05-06 08:12:49', '2024-05-08 10:35:23'),
(327, 1088, 20, 2, 3, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 9906235, 35, 2500, 9908735, '2024-05-06', NULL, 2, '[]', '946006', NULL, '2024-05-06 12:37:05', NULL, NULL, '2024-05-06 10:36:42', '2024-05-06 15:28:53'),
(328, 1089, 20, 2, 3, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 0, 0, 16, 9906235, 51, 800, 9907051, '2024-05-06', NULL, 3, '[]', '466732', NULL, '2024-05-06 12:38:55', NULL, NULL, '2024-05-06 10:38:42', '2024-05-06 15:27:40'),
(329, 1090, 20, 1, 4, 2, 1, 80, NULL, NULL, NULL, NULL, NULL, 1, 0, 16, 19812469, 85, 800, 19813285, '2024-05-06', NULL, 5, '[]', '241374', NULL, '2024-05-06 13:50:24', '2024-05-08 11:42:27', NULL, '2024-05-06 11:49:59', '2024-05-08 09:42:27'),
(330, 1091, 20, 1, 4, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 1, 0, 16, 9906235, 51, 800, 9907051, '2024-05-06', NULL, 5, '[]', '242740', NULL, '2024-05-06 13:58:22', '2024-05-08 11:07:18', NULL, '2024-05-06 11:54:40', '2024-05-08 09:07:18'),
(331, 1092, 20, 1, 4, 2, 1, 80, NULL, NULL, NULL, NULL, NULL, 1, 0, 16, 19812469, 85, 800, 19813285, '2024-05-06', NULL, 3, '[]', '522301', NULL, '2024-05-06 13:58:13', '2024-05-08 11:04:41', NULL, '2024-05-06 11:57:57', '2024-05-08 09:04:42'),
(332, 1093, 20, 1, 4, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 1, 0, 16, 9906235, 51, 800, 9907051, '2024-05-06', NULL, 2, '[]', '746801', NULL, '2024-05-06 14:06:34', '2024-05-07 15:28:41', NULL, '2024-05-06 12:06:06', '2024-05-07 13:28:41'),
(333, 1094, 47, NULL, 1, 1, 1, 76, NULL, NULL, NULL, NULL, NULL, 0, 0, 16, 1606, 22, 5800, 7400, '2024-05-09', NULL, NULL, '[1]', '123186', NULL, NULL, NULL, NULL, '2024-05-09 20:42:13', '2024-05-09 20:42:13'),
(337, 1097, 20, NULL, 1, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 0, 0, 578, 9906235, 33, 12520, 9919300, '2024-05-12', NULL, NULL, '[1]', '338103', NULL, NULL, NULL, NULL, '2024-05-12 10:51:26', '2024-05-12 10:51:26'),
(338, 1098, 20, NULL, 1, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 0, 0, 16, 9906235, 51, 800, 9907000, '2024-05-12', NULL, NULL, '[]', '333736', NULL, NULL, NULL, NULL, '2024-05-12 10:52:25', '2024-05-12 10:52:25'),
(339, 1099, 20, NULL, 1, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 0, 0, 16, 9906235, 51, 5800, 9912000, '2024-05-12', NULL, NULL, '[2]', '461114', NULL, NULL, NULL, NULL, '2024-05-12 10:55:28', '2024-05-12 10:55:28'),
(340, 1100, 20, 1, 3, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 9906235, 35, 2500, 9908700, '2024-05-12', NULL, NULL, '[1]', '342578', NULL, '2024-05-12 13:27:19', NULL, NULL, '2024-05-12 11:00:12', '2024-05-12 11:27:27'),
(341, 1101, 20, 1, 4, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 9906235, 35, 25000, 9931235, '2024-05-15', NULL, NULL, '[1]', '152415', NULL, '2024-05-15 18:28:00', '2024-05-15 18:28:44', NULL, '2024-05-15 16:27:34', '2024-05-15 16:28:45'),
(342, 1102, 20, NULL, 1, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 14151763, 63, 2500, 14154200, '2024-05-26', NULL, NULL, '[]', '793657', NULL, NULL, NULL, NULL, '2024-05-26 14:21:52', '2024-05-26 14:21:52'),
(343, 1103, 20, 1, 2, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 14151763, 63, 2500, 14154200, '2024-05-26', NULL, NULL, '[]', '633809', NULL, '2024-05-26 17:48:41', NULL, NULL, '2024-05-26 14:22:53', '2024-05-26 15:48:41'),
(344, 1104, 20, NULL, 1, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11321411, 11, 2500, 11323900, '2024-05-29', NULL, NULL, '[1]', '3ioVfUtu', NULL, NULL, NULL, NULL, '2024-05-29 11:00:57', '2024-05-29 11:00:57'),
(345, 1105, 20, NULL, 1, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11321411, 11, 2500, 11323900, '2024-05-29', NULL, NULL, '[1]', '4PaDMTzY', NULL, NULL, NULL, NULL, '2024-05-29 11:19:41', '2024-05-29 11:19:41'),
(346, 1106, 20, NULL, 1, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11321411, 11, 2500, 11323900, '2024-05-29', NULL, NULL, '[]', 'oA3Bw5Bn', NULL, NULL, NULL, NULL, '2024-05-29 11:22:28', '2024-05-29 11:22:28'),
(347, 1107, 20, NULL, 1, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11321411, 11, 2500, 11323900, '2024-05-29', NULL, NULL, '[]', 'EYXzzyIc', NULL, NULL, NULL, NULL, '2024-05-29 11:22:58', '2024-05-29 11:22:58'),
(348, 1108, 20, NULL, 1, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11321411, 11, 2500, 11323900, '2024-05-29', NULL, NULL, '[]', 'CZIltfgg', NULL, NULL, NULL, NULL, '2024-05-29 11:25:25', '2024-05-29 11:25:25'),
(349, 1109, 20, NULL, 1, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 0, 0, 32, 11321411, 43, 6600, 11328000, '2024-05-29', NULL, NULL, '[1]', 'H8kQLULJ', NULL, NULL, NULL, NULL, '2024-05-29 11:32:47', '2024-05-29 11:32:47'),
(350, 1110, 20, NULL, 1, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11321411, 11, 2500, 11323900, '2024-05-29', NULL, NULL, '[]', 't179YxvY', NULL, NULL, NULL, NULL, '2024-05-29 11:43:29', '2024-05-29 11:43:29'),
(351, 1111, 20, NULL, 1, 3, 1, 80, NULL, '16:05:00', NULL, NULL, NULL, 0, 0, 0, 11321411, 11, 2500, 11323900, '2024-05-29', NULL, NULL, '[]', 'ZuPfon0v', NULL, NULL, NULL, NULL, '2024-05-29 13:53:24', '2024-05-29 13:53:24'),
(352, 1112, 20, NULL, 1, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 0, 0, 80, 0, 80, 4000, 4000, '2024-05-30', NULL, NULL, '[1]', 'dcVWhnTl', NULL, NULL, NULL, NULL, '2024-05-29 14:59:21', '2024-05-30 13:41:00'),
(353, 1113, 20, NULL, 1, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 0, 0, 25, 0, 25, 2500, 2500, '2024-05-30', NULL, NULL, '[1]', 'K4wClXkw', NULL, NULL, NULL, NULL, '2024-05-30 08:15:56', '2024-05-30 08:15:56'),
(354, 1114, 20, NULL, 1, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 0, 0, 25, 0, 25, 2500, 2500, '2024-05-30', NULL, NULL, '[]', 'H7BhywSL', NULL, NULL, NULL, NULL, '2024-05-30 09:33:54', '2024-05-30 09:33:54'),
(355, 1115, 20, NULL, 1, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 0, 0, 100, 0, 0, 10000, 10100, '2024-05-30', NULL, NULL, '[]', 'Bk9F0LsE', NULL, NULL, NULL, NULL, '2024-05-30 09:36:15', '2024-05-30 09:36:15'),
(356, 1116, 20, NULL, 1, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 0, 0, 80, 0, 80, 4000, 4000, '2024-05-30', NULL, NULL, '[]', 'uclEhR6z', NULL, NULL, NULL, NULL, '2024-05-30 09:37:24', '2024-05-30 09:37:24'),
(357, 1117, 20, 1, 3, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 0, 0, 48, 0, 48, 2400, 2448, '2024-05-30', NULL, NULL, '[]', 'NfD7NvR7', NULL, '2024-06-02 17:27:12', NULL, NULL, '2024-05-30 09:38:34', '2024-06-02 15:29:21'),
(358, 1118, 20, 1, 3, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 0, 0, 57, 0, 57, 4100, 4157, '2024-05-30', NULL, NULL, '[]', 'GSIWz8Dr', NULL, '2024-05-30 15:37:35', NULL, NULL, '2024-05-30 09:48:18', '2024-05-30 13:37:59'),
(359, 1119, 47, NULL, 1, 1, 1, 76, NULL, NULL, NULL, NULL, NULL, 0, 0, 500, 1606, 6, 50000, 52100, '2024-06-02', NULL, NULL, '[]', 'aMJrvBjz', NULL, NULL, NULL, NULL, '2024-06-02 10:31:23', '2024-06-02 10:31:23'),
(360, 1120, 20, 1, 3, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 0, 0, 25, 0, 25, 2500, 2525, '2024-06-02', NULL, NULL, '[]', 'q47z4hVJ', NULL, '2024-06-02 15:21:31', NULL, NULL, '2024-06-02 13:21:11', '2024-06-02 13:21:41'),
(361, 1121, 20, 1, 3, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 0, 0, 25, 0, 25, 2500, 2525, '2024-06-02', NULL, NULL, '[]', '96368635', NULL, '2024-06-02 15:46:40', NULL, NULL, '2024-06-02 13:46:22', '2024-06-02 13:46:51'),
(362, 1122, 20, 1, 3, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 0, 0, 100, 0, 0, 10000, 10100, '2024-06-02', NULL, NULL, '[]', '89237661', NULL, '2024-06-02 17:31:38', NULL, NULL, '2024-06-02 15:31:27', '2024-06-02 15:31:50'),
(363, 1123, 20, NULL, 1, 1, 1, 80, NULL, NULL, NULL, NULL, NULL, 0, 0, 25, 0, 25, 2500, 2500, '2024-06-03', NULL, NULL, '[]', '342128', NULL, NULL, NULL, NULL, '2024-06-03 09:35:02', '2024-06-03 09:35:02');

-- --------------------------------------------------------

--
-- Table structure for table `orders_rate_attributes`
--

CREATE TABLE `orders_rate_attributes` (
  `id` bigint UNSIGNED NOT NULL,
  `rate_attribute_id` int NOT NULL DEFAULT '0',
  `input` text COLLATE utf8mb4_unicode_ci,
  `order_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders_rate_attributes`
--

INSERT INTO `orders_rate_attributes` (`id`, `rate_attribute_id`, `input`, `order_id`, `created_at`, `updated_at`) VALUES
(12, 2, NULL, 331, '2024-05-06 14:57:17', '2024-05-06 14:57:17');

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
(262, 221, 1, NULL, NULL),
(264, 223, 1, NULL, NULL),
(276, 234, 1, NULL, NULL),
(277, 235, 3, NULL, NULL),
(279, 237, 3, NULL, NULL),
(283, 241, 3, NULL, NULL),
(297, 275, 1, NULL, NULL),
(298, 281, 3, NULL, NULL),
(302, 289, 1, NULL, NULL),
(303, 292, 1, NULL, NULL),
(304, 293, 2, NULL, NULL),
(305, 294, 1, NULL, NULL),
(306, 298, 1, NULL, NULL),
(307, 333, 1, NULL, NULL),
(308, 337, 1, NULL, NULL),
(309, 340, 1, NULL, NULL),
(310, 344, 2, NULL, NULL),
(311, 345, 2, NULL, NULL),
(312, 349, 2, NULL, NULL),
(313, 351, 2, NULL, NULL),
(314, 352, 2, NULL, NULL),
(315, 353, 2, NULL, NULL);

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
(388, 221, 40, 1, 2500.00, 1, NULL, '2024-04-01 10:02:23', '2024-04-01 10:02:23'),
(391, 223, 40, 1, 2500.00, 1, NULL, '2024-04-01 10:12:23', '2024-04-01 10:12:23'),
(405, 234, 46, 1, 12000.00, 1, NULL, '2024-04-07 10:12:41', '2024-04-07 10:12:41'),
(406, 234, 47, 1, 14000.00, 1, NULL, '2024-04-07 10:12:41', '2024-04-07 10:12:41'),
(407, 234, 40, 1, 2500.00, 1, NULL, '2024-04-07 10:12:41', '2024-04-07 10:12:41'),
(408, 235, 47, 1, 14000.00, 1, NULL, '2024-04-07 10:14:53', '2024-04-07 10:14:53'),
(409, 235, 46, 1, 12000.00, 1, NULL, '2024-04-07 10:14:53', '2024-04-07 10:14:53'),
(410, 235, 40, 1, 2500.00, 1, NULL, '2024-04-07 10:14:53', '2024-04-07 10:14:53'),
(414, 237, 40, 1, 2500.00, 0, NULL, '2024-04-07 10:56:34', '2024-04-24 10:16:17'),
(415, 237, 46, 1, 12000.00, 0, NULL, '2024-04-07 10:56:34', '2024-04-24 10:16:17'),
(416, 237, 47, 1, 14000.00, 1, NULL, '2024-04-07 10:56:34', '2024-04-07 11:16:18'),
(424, 241, 40, 2, 2500.00, 1, NULL, '2024-04-14 08:09:19', '2024-04-14 08:09:19'),
(429, 246, 40, 1, 2500.00, 1, NULL, '2024-04-15 08:31:28', '2024-04-15 08:31:28'),
(430, 246, 46, 1, 1000.00, 1, NULL, '2024-04-15 08:31:28', '2024-04-15 08:31:28'),
(432, 248, 40, 1, 2500.00, 1, NULL, '2024-04-15 14:22:24', '2024-04-15 14:22:24'),
(433, 249, 47, 1, 14000.00, 1, NULL, '2024-04-15 14:24:43', '2024-04-15 14:24:43'),
(434, 249, 46, 1, 1000.00, 1, NULL, '2024-04-15 14:24:43', '2024-04-15 14:24:43'),
(435, 249, 40, 3, 2500.00, 1, NULL, '2024-04-15 14:24:43', '2024-04-15 14:24:43'),
(436, 250, 40, 2, 2500.00, 1, NULL, '2024-04-15 14:25:43', '2024-04-15 14:25:43'),
(468, 272, 40, 1, 2500.00, 1, NULL, '2024-04-21 14:51:59', '2024-04-21 14:51:59'),
(470, 275, 46, 1, 1000.00, 1, NULL, '2024-04-23 11:37:19', '2024-04-23 11:37:19'),
(476, 281, 48, 1, 17000.00, 1, NULL, '2024-04-23 13:15:42', '2024-04-23 13:15:42'),
(477, 282, 46, 6, 1000.00, 1, NULL, '2024-04-23 13:23:17', '2024-04-23 13:25:45'),
(478, 282, 40, 2, 2500.00, 1, NULL, '2024-04-23 13:23:17', '2024-04-23 13:25:45'),
(479, 283, 40, 1, 2500.00, 1, NULL, '2024-04-23 13:27:58', '2024-04-23 13:27:58'),
(480, 284, 40, 1, 2500.00, 1, NULL, '2024-04-23 13:30:46', '2024-04-23 13:30:46'),
(481, 285, 46, 1, 1000.00, 1, NULL, '2024-04-23 13:33:18', '2024-04-23 13:33:18'),
(485, 289, 40, 4, 2500.00, 1, NULL, '2024-04-24 08:59:30', '2024-04-24 08:59:30'),
(488, 290, 47, 1, 14000.00, 1, NULL, '2024-04-24 10:05:35', '2024-04-24 10:05:35'),
(489, 290, 47, 4, 14000.00, 0, NULL, '2024-04-24 10:05:35', '2024-04-24 10:05:35'),
(490, 291, 40, 1, 2500.00, 0, NULL, '2024-04-24 10:37:13', '2024-04-24 11:36:13'),
(491, 292, 47, 1, 14000.00, 0, NULL, '2024-04-24 11:23:40', '2024-04-24 11:31:34'),
(492, 293, 46, 1, 1000.00, 1, NULL, '2024-04-24 12:10:21', '2024-04-24 12:10:21'),
(493, 293, 48, 1, 17000.00, 1, NULL, '2024-04-24 12:10:21', '2024-04-24 12:10:21'),
(494, 294, 46, 2, 1000.00, 1, NULL, '2024-04-25 12:14:04', '2024-04-25 12:14:04'),
(495, 294, 40, 2, 2500.00, 1, NULL, '2024-04-25 12:14:04', '2024-04-25 12:14:04'),
(496, 295, 40, 1, 2500.00, 1, NULL, '2024-04-25 12:59:49', '2024-04-25 12:59:49'),
(497, 296, 40, 1, 2500.00, 1, NULL, '2024-04-26 16:44:47', '2024-04-26 16:44:47'),
(498, 297, 40, 1, 2500.00, 1, NULL, '2024-04-28 10:50:13', '2024-04-30 11:56:31'),
(499, 298, 40, 1, 2500.00, 1, NULL, '2024-04-28 13:50:29', '2024-04-28 13:50:29'),
(500, 299, 40, 5, 2500.00, 1, NULL, '2024-04-29 11:27:50', '2024-04-29 11:27:50'),
(501, 300, 49, 1, 25000.00, 1, NULL, '2024-04-30 13:59:12', '2024-04-30 13:59:12'),
(502, 301, 46, 1, 1000.00, 1, NULL, '2024-05-02 09:31:15', '2024-05-02 09:31:15'),
(503, 302, 40, 1, 2500.00, 1, NULL, '2024-05-02 10:38:27', '2024-05-02 10:38:27'),
(504, 303, 40, 1, 2500.00, 1, NULL, '2024-05-02 12:16:01', '2024-05-02 12:16:01'),
(505, 304, 40, 1, 2500.00, 1, NULL, '2024-05-02 13:43:32', '2024-05-02 13:43:32'),
(506, 305, 46, 1, 1000.00, 1, NULL, '2024-05-05 09:14:29', '2024-05-05 09:14:29'),
(507, 306, 46, 1, 1000.00, 1, NULL, '2024-05-05 10:44:10', '2024-05-05 10:44:10'),
(508, 307, 40, 1, 2500.00, 1, NULL, '2024-05-05 11:47:51', '2024-05-05 11:47:51'),
(509, 308, 40, 1, 2500.00, 1, NULL, '2024-05-05 12:11:47', '2024-05-05 12:11:47'),
(510, 309, 40, 1, 2500.00, 1, NULL, '2024-05-05 13:01:40', '2024-05-05 13:01:40'),
(511, 310, 40, 1, 2500.00, 1, NULL, '2024-05-05 13:15:01', '2024-05-05 13:15:01'),
(512, 311, 40, 1, 2500.00, 1, NULL, '2024-05-05 13:21:09', '2024-05-05 13:21:09'),
(513, 312, 40, 1, 2500.00, 1, NULL, '2024-05-05 13:29:46', '2024-05-05 13:29:46'),
(514, 313, 40, 1, 2500.00, 1, NULL, '2024-05-05 13:41:55', '2024-05-05 13:41:55'),
(515, 314, 40, 1, 2500.00, 1, NULL, '2024-05-05 13:48:33', '2024-05-05 13:48:33'),
(516, 315, 40, 1, 2500.00, 1, NULL, '2024-05-05 13:52:26', '2024-05-05 13:52:26'),
(517, 316, 40, 1, 2500.00, 1, NULL, '2024-05-05 14:00:42', '2024-05-05 14:00:42'),
(518, 317, 40, 1, 2500.00, 1, NULL, '2024-05-05 14:11:58', '2024-05-05 14:11:58'),
(519, 318, 40, 1, 2500.00, 1, NULL, '2024-05-05 14:22:25', '2024-05-05 14:22:25'),
(520, 319, 40, 1, 2500.00, 1, NULL, '2024-05-05 14:45:29', '2024-05-05 14:45:29'),
(521, 320, 40, 1, 2500.00, 1, NULL, '2024-05-05 15:11:03', '2024-05-05 15:11:03'),
(522, 321, 40, 1, 2500.00, 1, NULL, '2024-05-05 15:19:41', '2024-05-05 15:19:41'),
(523, 322, 40, 1, 2500.00, 1, NULL, '2024-05-05 15:23:28', '2024-05-05 15:23:28'),
(524, 323, 40, 1, 2500.00, 1, NULL, '2024-05-06 08:11:46', '2024-05-06 08:11:46'),
(525, 324, 40, 1, 2500.00, 1, NULL, '2024-05-06 08:12:13', '2024-05-06 08:12:13'),
(526, 326, 40, 1, 2500.00, 1, NULL, '2024-05-06 08:12:49', '2024-05-06 08:12:49'),
(527, 327, 40, 1, 2500.00, 1, NULL, '2024-05-06 10:36:42', '2024-05-06 10:36:42'),
(528, 328, 46, 1, 1000.00, 1, NULL, '2024-05-06 10:38:42', '2024-05-06 10:38:42'),
(529, 329, 46, 1, 1000.00, 1, NULL, '2024-05-06 11:49:59', '2024-05-06 11:49:59'),
(530, 330, 46, 1, 1000.00, 1, NULL, '2024-05-06 11:54:40', '2024-05-06 11:54:40'),
(531, 331, 46, 1, 1000.00, 1, NULL, '2024-05-06 11:57:57', '2024-05-06 11:57:57'),
(532, 332, 46, 1, 1000.00, 1, NULL, '2024-05-06 12:06:06', '2024-05-06 12:06:06'),
(533, 333, 46, 1, 1000.00, 1, NULL, '2024-05-09 20:42:13', '2024-05-09 20:42:13'),
(534, 333, 40, 2, 2500.00, 1, NULL, '2024-05-09 20:42:13', '2024-05-09 20:42:13'),
(538, 337, 46, 2, 1000.00, 1, NULL, '2024-05-12 10:51:26', '2024-05-12 10:51:26'),
(539, 337, 47, 1, 14000.00, 1, NULL, '2024-05-12 10:51:26', '2024-05-12 10:51:26'),
(540, 338, 46, 1, 1000.00, 1, NULL, '2024-05-12 10:52:25', '2024-05-12 10:52:25'),
(541, 339, 46, 1, 1000.00, 1, NULL, '2024-05-12 10:55:28', '2024-05-12 10:55:28'),
(542, 339, 40, 2, 2500.00, 1, NULL, '2024-05-12 10:55:28', '2024-05-12 10:55:28'),
(543, 340, 40, 1, 2500.00, 1, NULL, '2024-05-12 11:00:12', '2024-05-12 11:00:12'),
(544, 341, 40, 10, 2500.00, 1, NULL, '2024-05-15 16:27:34', '2024-05-15 16:27:34'),
(545, 342, 40, 1, 2500.00, 1, NULL, '2024-05-26 14:21:52', '2024-05-26 14:21:52'),
(546, 343, 40, 1, 2500.00, 1, NULL, '2024-05-26 14:22:53', '2024-05-26 14:22:53'),
(547, 344, 40, 1, 2500.00, 1, NULL, '2024-05-29 11:00:57', '2024-05-29 11:00:57'),
(548, 345, 40, 1, 2500.00, 1, NULL, '2024-05-29 11:19:41', '2024-05-29 11:19:41'),
(549, 346, 40, 1, 2500.00, 1, NULL, '2024-05-29 11:22:28', '2024-05-29 11:22:28'),
(550, 347, 40, 1, 2500.00, 1, NULL, '2024-05-29 11:22:58', '2024-05-29 11:22:58'),
(551, 348, 40, 1, 2500.00, 1, NULL, '2024-05-29 11:25:25', '2024-05-29 11:25:25'),
(552, 349, 46, 2, 1000.00, 1, NULL, '2024-05-29 11:32:47', '2024-05-29 11:32:47'),
(553, 349, 40, 2, 2500.00, 1, NULL, '2024-05-29 11:32:47', '2024-05-29 11:32:47'),
(554, 350, 40, 1, 2500.00, 1, NULL, '2024-05-29 11:43:29', '2024-05-29 11:43:29'),
(555, 351, 40, 1, 2500.00, 1, NULL, '2024-05-29 13:53:24', '2024-05-29 13:53:24'),
(557, 353, 40, 1, 2500.00, 1, NULL, '2024-05-30 08:15:56', '2024-05-30 08:15:56'),
(558, 354, 40, 1, 2500.00, 1, NULL, '2024-05-30 09:33:54', '2024-05-30 09:33:54'),
(559, 355, 40, 4, 2500.00, 1, NULL, '2024-05-30 09:36:15', '2024-05-30 09:36:15'),
(560, 356, 46, 5, 1000.00, 1, NULL, '2024-05-30 09:37:24', '2024-05-30 09:37:24'),
(561, 357, 46, 3, 1000.00, 1, NULL, '2024-05-30 09:38:34', '2024-06-02 15:29:21'),
(562, 358, 40, 1, 2500.00, 1, NULL, '2024-05-30 09:48:18', '2024-06-02 13:18:32'),
(563, 358, 46, 2, 1000.00, 1, NULL, '2024-05-30 09:48:18', '2024-06-02 13:18:32'),
(564, 352, 46, 5, 1000.00, 1, NULL, '2024-05-30 13:41:00', '2024-05-30 13:41:00'),
(565, 359, 40, 20, 2500.00, 1, NULL, '2024-06-02 10:31:23', '2024-06-02 10:31:23'),
(566, 360, 40, 1, 2500.00, 1, NULL, '2024-06-02 13:21:11', '2024-06-02 13:21:41'),
(567, 361, 40, 1, 2500.00, 1, NULL, '2024-06-02 13:46:22', '2024-06-02 15:24:56'),
(568, 362, 40, 4, 2500.00, 1, NULL, '2024-06-02 15:31:27', '2024-06-02 15:31:50'),
(569, 363, 40, 1, 2500.00, 1, NULL, '2024-06-03 09:35:02', '2024-06-03 09:35:02');

-- --------------------------------------------------------

--
-- Table structure for table `order_driver_acceptances`
--

CREATE TABLE `order_driver_acceptances` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `driver_id` bigint UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_driver_acceptances`
--

INSERT INTO `order_driver_acceptances` (`id`, `order_id`, `driver_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 237, 2, 1, '2024-04-07 11:12:45', '2024-04-07 11:12:45'),
(2, 235, 2, 1, '2024-04-08 13:33:27', '2024-04-08 13:33:27'),
(8, 272, 1, 1, '2024-04-21 14:57:54', '2024-04-21 14:57:54'),
(10, 272, 2, 1, '2024-04-22 09:31:04', '2024-04-22 09:31:04'),
(11, 273, 2, 1, '2024-04-22 10:39:33', '2024-04-22 10:39:33'),
(12, 273, 1, 1, '2024-04-22 10:49:52', '2024-04-22 10:49:52'),
(13, 246, 2, 1, '2024-04-22 11:00:53', '2024-04-22 11:00:53'),
(18, 275, 2, 1, '2024-04-23 12:23:25', '2024-04-23 12:23:25'),
(19, 281, 2, 1, '2024-04-23 13:16:14', '2024-04-23 13:16:14'),
(20, 282, 2, 1, '2024-04-23 13:24:44', '2024-04-23 13:24:44'),
(21, 283, 2, 1, '2024-04-23 13:28:56', '2024-04-23 13:28:56'),
(22, 284, 2, 1, '2024-04-23 13:31:29', '2024-04-23 13:31:29'),
(23, 285, 2, 1, '2024-04-23 13:33:31', '2024-04-23 13:33:31'),
(24, 223, 1, 1, '2024-04-23 13:51:55', '2024-04-23 13:51:55'),
(28, 292, 2, 1, '2024-04-24 11:28:52', '2024-04-24 11:28:52'),
(29, 294, 2, 1, '2024-04-25 12:31:51', '2024-04-25 12:31:51'),
(30, 297, 2, 1, '2024-04-28 10:50:43', '2024-04-28 10:50:43'),
(31, 293, 2, 1, '2024-04-28 10:50:47', '2024-04-28 10:50:47'),
(32, 291, 2, 1, '2024-04-28 10:50:49', '2024-04-28 10:50:49'),
(33, 296, 2, 1, '2024-04-28 10:50:52', '2024-04-28 10:50:52'),
(34, 295, 2, 1, '2024-04-28 10:50:54', '2024-04-28 10:50:54'),
(35, 289, 2, 1, '2024-04-28 10:51:00', '2024-04-28 10:51:00'),
(36, 305, 1, 1, '2024-05-05 09:34:35', '2024-05-05 09:34:35'),
(37, 306, 1, 1, '2024-05-05 10:44:59', '2024-05-05 10:44:59'),
(38, 307, 1, 1, '2024-05-05 11:49:29', '2024-05-05 11:49:29'),
(39, 304, 1, 1, '2024-05-05 12:09:36', '2024-05-05 12:09:36'),
(40, 308, 1, 1, '2024-05-05 12:12:27', '2024-05-05 12:12:27'),
(41, 309, 1, 1, '2024-05-05 13:02:20', '2024-05-05 13:02:20'),
(42, 310, 1, 1, '2024-05-05 13:16:11', '2024-05-05 13:16:11'),
(43, 311, 1, 1, '2024-05-05 13:21:43', '2024-05-05 13:21:43'),
(44, 312, 1, 1, '2024-05-05 13:35:32', '2024-05-05 13:35:32'),
(45, 312, 1, 1, '2024-05-05 13:35:32', '2024-05-05 13:35:32'),
(46, 313, 1, 1, '2024-05-05 13:44:46', '2024-05-05 13:44:46'),
(47, 314, 1, 1, '2024-05-05 13:49:44', '2024-05-05 13:49:44'),
(48, 315, 1, 1, '2024-05-05 13:55:51', '2024-05-05 13:55:51'),
(49, 316, 1, 1, '2024-05-05 14:01:45', '2024-05-05 14:01:45'),
(50, 317, 1, 1, '2024-05-05 14:12:41', '2024-05-05 14:12:41'),
(51, 318, 1, 1, '2024-05-05 14:33:49', '2024-05-05 14:33:49'),
(52, 319, 1, 1, '2024-05-05 14:46:40', '2024-05-05 14:46:40'),
(53, 320, 1, 1, '2024-05-05 15:11:38', '2024-05-05 15:11:38'),
(54, 321, 1, 1, '2024-05-05 15:19:58', '2024-05-05 15:19:58'),
(55, 322, 1, 1, '2024-05-05 15:24:09', '2024-05-05 15:24:09'),
(56, 326, 1, 1, '2024-05-06 08:13:49', '2024-05-06 08:13:49'),
(57, 324, 1, 1, '2024-05-06 08:32:52', '2024-05-06 08:32:52'),
(58, 323, 1, 1, '2024-05-06 08:37:37', '2024-05-06 08:37:37'),
(59, 327, 2, 1, '2024-05-06 10:37:06', '2024-05-06 10:37:06'),
(60, 328, 2, 1, '2024-05-06 10:38:56', '2024-05-06 10:38:56'),
(61, 329, 1, 1, '2024-05-06 11:50:24', '2024-05-06 11:50:24'),
(62, 331, 1, 1, '2024-05-06 11:58:13', '2024-05-06 11:58:13'),
(63, 330, 1, 1, '2024-05-06 11:58:23', '2024-05-06 11:58:23'),
(64, 332, 1, 1, '2024-05-06 12:06:35', '2024-05-06 12:06:35'),
(65, 303, 1, 1, '2024-05-07 13:57:33', '2024-05-07 13:57:33'),
(66, 302, 1, 1, '2024-05-07 14:23:07', '2024-05-07 14:23:07'),
(67, 301, 1, 1, '2024-05-07 15:02:34', '2024-05-07 15:02:34'),
(68, 300, 1, 1, '2024-05-07 20:22:47', '2024-05-07 20:22:47'),
(69, 299, 1, 1, '2024-05-07 21:00:23', '2024-05-07 21:00:23'),
(70, 298, 1, 1, '2024-05-08 08:15:15', '2024-05-08 08:15:15'),
(71, 340, 1, 1, '2024-05-12 11:27:19', '2024-05-12 11:27:19'),
(72, 341, 1, 1, '2024-05-15 16:28:00', '2024-05-15 16:28:00'),
(73, 343, 1, 1, '2024-05-26 15:48:41', '2024-05-26 15:48:41'),
(74, 358, 1, 1, '2024-05-30 13:37:36', '2024-05-30 13:37:36'),
(75, 360, 1, 1, '2024-06-02 13:21:31', '2024-06-02 13:21:31'),
(76, 361, 1, 1, '2024-06-02 13:46:40', '2024-06-02 13:46:40'),
(77, 357, 1, 1, '2024-06-02 15:27:12', '2024-06-02 15:27:12'),
(78, 362, 1, 1, '2024-06-02 15:31:39', '2024-06-02 15:31:39');

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
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, '{\"ar\":\"كاش\",\"en\":\"cash\"}', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `points`
--

CREATE TABLE `points` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `points` bigint NOT NULL,
  `used_points` bigint NOT NULL DEFAULT '0',
  `achievement_id` bigint UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `used_at` datetime DEFAULT NULL,
  `expire_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `points`
--

INSERT INTO `points` (`id`, `user_id`, `points`, `used_points`, `achievement_id`, `created_at`, `used_at`, `expire_at`) VALUES
(20, 20, 50, 0, 1, '2024-02-10 11:38:17', '2024-02-15 08:06:45', '2024-03-29 12:46:27');

-- --------------------------------------------------------

--
-- Table structure for table `point_in_pound`
--

CREATE TABLE `point_in_pound` (
  `id` bigint UNSIGNED NOT NULL,
  `value` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `point_in_pound`
--

INSERT INTO `point_in_pound` (`id`, `value`) VALUES
(1, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `real_price` double NOT NULL DEFAULT '0',
  `price` double NOT NULL DEFAULT '0',
  `tax` int DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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

INSERT INTO `products` (`id`, `name`, `description`, `real_price`, `price`, `tax`, `unit`, `slug`, `quantity`, `status`, `suggested`, `availability`, `product_source`, `seller_id`, `subcategory_id`, `commission_id`, `commission_value`, `discount`, `discount_status`, `created_at`, `updated_at`) VALUES
(40, '{\"ar\":\"كوسا بلدية\",\"en\":\"zucchini\"}', '{\"ar\":\"<ol>\n<li style=\"text-align: right;\">كوسا بلدية من جبل الشيخ&nbsp;<br>مسقية بمية فيجة</li>\n</ol>\"}', 0, 2500, 1, NULL, NULL, 20, 1, NULL, 1, 0, 1, 2, 1, 20, 10, 0, '2024-01-02 16:49:16', '2024-05-29 13:59:33'),
(46, '{\"ar\":\"فليفلة حمراء\",\"en\":\"Red pepper\"}', '{\"ar\":\"<p>فليفلة بلدية رقيقة</p>\"}', 0, 1000, 2, NULL, NULL, 15, 1, NULL, 1, 0, 1, 2, 6, 4000, 20, 1, '2024-03-14 14:26:40', '2024-03-14 15:30:04'),
(47, '{\"ar\":\"فليفلة خضراء\",\"en\":\"Green pepper\"}', '{\"ar\":\"<p>فليفلة بلدية رقيقة</p>\"}', 0, 14000, 5, NULL, NULL, 16, 1, NULL, 1, 0, 1, 2, 6, 4000, 22, 1, '2024-03-14 14:30:09', '2024-03-14 14:30:09'),
(48, '{\"ar\":\"فليفلة حمراء حارة\",\"en\":\"Hot red pepper\"}', '{\"ar\":\"<p>&nbsp;فليفلة حمراء حارة بلدية رقيقة</p>\"}', 0, 17000, 5, NULL, NULL, 11, 1, NULL, 1, 0, 1, 2, 6, 1700, 40, 1, '2024-03-14 14:33:52', '2024-03-14 14:33:52'),
(49, '{\"ar\":\"فليفلة مفرومة\",\"en\":\"Chopped pepper\"}', '{\"ar\":\"<p>&nbsp;فليفلة بلدية رقيقة مفرومة</p>\"}', 0, 25000, 3, NULL, NULL, 15, 1, NULL, 1, 0, 1, 2, 6, 1999, 10, 1, '2024-03-14 14:37:59', '2024-03-14 14:37:59');

-- --------------------------------------------------------

--
-- Table structure for table `product_attribute_values`
--

CREATE TABLE `product_attribute_values` (
  `id` bigint UNSIGNED NOT NULL,
  `attribute_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(44, 7, 37, '1', NULL, NULL),
(45, 8, 37, '500g', NULL, NULL),
(48, 7, 41, '1', NULL, NULL),
(49, 8, 41, '500g', NULL, NULL),
(50, 7, 42, '1', NULL, NULL),
(51, 7, 43, '1', NULL, NULL),
(53, 7, 44, '1', NULL, NULL),
(54, 8, 44, '200g', NULL, NULL),
(55, 8, 45, '200g', NULL, NULL),
(56, 7, 45, '2', NULL, NULL),
(59, 8, 47, '200g', NULL, NULL),
(60, 7, 47, '2', NULL, NULL),
(61, 8, 48, '200g', NULL, NULL),
(62, 7, 48, '1', NULL, NULL),
(63, 7, 49, '15', NULL, NULL),
(64, 8, 49, '500g', NULL, NULL),
(65, 8, 46, '200g', NULL, NULL),
(67, 7, 51, '1', NULL, NULL),
(68, 7, 52, '1', NULL, NULL),
(69, 7, 53, '1', NULL, NULL),
(70, 7, 54, '1', NULL, NULL),
(71, 7, 55, '2', NULL, NULL),
(72, 7, 50, '1', NULL, NULL),
(75, 8, 56, '200g', NULL, NULL),
(76, 7, 80, '1', NULL, NULL),
(79, 7, 81, '1', NULL, NULL),
(80, 7, 82, '1', NULL, NULL),
(81, 7, 83, '1', NULL, NULL),
(82, 7, 40, '1', NULL, NULL),
(83, 8, 40, '500g', NULL, NULL);

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

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `coupon_id` bigint UNSIGNED NOT NULL,
  `points` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `user_id`, `coupon_id`, `points`, `created_at`, `updated_at`) VALUES
(8, 20, 3, 894, '2024-04-01 10:33:47', '2024-04-01 10:33:47'),
(9, 20, 5, 300, '2024-04-15 08:41:32', '2024-04-15 08:41:32'),
(10, 20, 3, 100, '2024-04-22 16:27:18', '2024-04-22 16:27:18'),
(11, 20, 3, 100, '2024-04-22 16:53:45', '2024-04-22 16:53:45'),
(12, 20, 3, 100, '2024-04-22 16:59:23', '2024-04-22 16:59:23'),
(13, 20, 3, 100, '2024-04-22 17:00:16', '2024-04-22 17:00:16'),
(14, 20, 5, 300, '2024-04-22 17:00:42', '2024-04-22 17:00:42'),
(15, 20, 3, 100, '2024-04-22 17:12:14', '2024-04-22 17:12:14'),
(16, 20, 3, 100, '2024-04-22 17:12:21', '2024-04-22 17:12:21'),
(17, 20, 3, 100, '2024-04-22 17:12:39', '2024-04-22 17:12:39'),
(18, 20, 3, 100, '2024-04-22 17:15:28', '2024-04-22 17:15:28'),
(19, 20, 3, 100, '2024-04-22 17:17:49', '2024-04-22 17:17:49'),
(20, 20, 3, 100, '2024-04-22 17:20:32', '2024-04-22 17:20:32'),
(21, 20, 3, 100, '2024-04-23 11:01:53', '2024-04-23 11:01:53'),
(22, 20, 3, 100, '2024-04-24 08:23:39', '2024-04-24 08:23:39'),
(23, 20, 3, 100, '2024-04-24 09:10:20', '2024-04-24 09:10:20'),
(24, 20, 4, 200, '2024-04-26 13:44:46', '2024-04-26 13:44:46'),
(25, 20, 3, 100, '2024-05-27 10:50:37', '2024-05-27 10:50:37'),
(26, 20, 4, 200, '2024-05-27 10:50:52', '2024-05-27 10:50:52'),
(27, 20, 4, 200, '2024-05-27 10:51:32', '2024-05-27 10:51:32'),
(28, 20, 3, 100, '2024-05-27 10:58:29', '2024-05-27 10:58:29'),
(29, 20, 3, 100, '2024-05-27 11:01:44', '2024-05-27 11:01:44'),
(30, 20, 3, 100, '2024-05-27 11:04:30', '2024-05-27 11:04:30'),
(31, 20, 4, 200, '2024-05-27 11:04:40', '2024-05-27 11:04:40'),
(32, 20, 3, 100, '2024-05-27 11:10:03', '2024-05-27 11:10:03'),
(33, 20, 3, 100, '2024-05-29 05:57:41', '2024-05-29 05:57:41'),
(34, 20, 3, 100, '2024-05-29 05:59:44', '2024-05-29 05:59:44'),
(35, 20, 3, 100, '2024-05-29 06:00:03', '2024-05-29 06:00:03'),
(36, 20, 3, 100, '2024-05-29 06:00:39', '2024-05-29 06:00:39'),
(37, 20, 3, 100, '2024-05-29 07:16:17', '2024-05-29 07:16:17');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(10, 'gu', 'user', '2024-02-04 23:40:46', '2024-02-04 23:40:46'),
(12, 'zzz', 'user', '2024-03-20 10:21:03', '2024-03-20 10:21:03'),
(13, 'www', 'user', '2024-03-20 10:22:26', '2024-03-20 10:22:26'),
(14, 'asd', 'user', '2024-03-20 10:23:50', '2024-03-20 10:23:50'),
(15, 'qwe', 'user', '2024-03-20 10:24:28', '2024-03-20 10:24:28'),
(16, 'rrrrrdc', 'user', '2024-03-20 11:41:16', '2024-03-20 12:17:03'),
(17, 'etst', 'user', '2024-03-20 12:09:25', '2024-03-20 12:09:25'),
(18, 'qwwq', 'user', '2024-03-20 12:13:20', '2024-03-20 12:13:20'),
(19, 'sdc', 'user', '2024-03-20 12:14:48', '2024-03-20 12:14:48'),
(20, 'sdcsd', 'user', '2024-03-20 12:15:28', '2024-03-20 12:15:28');

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
(10, 10),
(1, 12),
(2, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(2, 16),
(3, 16),
(5, 16),
(1, 17),
(2, 18),
(5, 19),
(4, 20),
(5, 20);

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `area_id` bigint UNSIGNED NOT NULL,
  `type` enum('internal','external') COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` double NOT NULL DEFAULT '0',
  `discount_status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`id`, `name`, `latitude`, `longitude`, `status`, `area_id`, `type`, `discount`, `discount_status`, `created_at`, `updated_at`) VALUES
(1, '{\"ar\":\"بائع1\",\"en\":\"Seller1\"}', 33.49960754456129, 36.282430958591384, 1, 1, 'internal', 35, 0, '2023-12-07 16:08:28', '2024-04-02 12:19:26'),
(9, '{\"ar\":\"بائع2\",\"en\":\"Seller2\"}', NULL, NULL, 1, 1, 'external', 0, 0, '2024-04-02 12:37:36', '2024-04-02 12:37:36'),
(10, '{\"ar\":\"بائع3\",\"en\":\"Seller3\"}', NULL, NULL, 1, 1, 'internal', 2, 0, '2024-04-02 20:57:54', '2024-04-02 20:57:54');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `baseUrl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `show_reward_system` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `baseUrl`, `version`, `phone`, `show_reward_system`) VALUES
(1, 'https://control.farmy.peaklink.site/public', '1', '987654321', 1);

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, '{\"ar\":\"دمشق\",\"en\":\"Damascus\"}', '2023-12-07 16:06:40', '2023-12-07 16:06:40');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `category_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `name`, `status`, `category_id`, `created_at`, `updated_at`) VALUES
(2, '{\"ar\":\"فليفلة اصفر\",\"en\":\"Yellow pepper\"}', 1, 1, '2023-12-18 05:53:58', '2023-12-19 05:36:43'),
(12, '{\"ar\":\"موز\",\"en\":\"banana\"}', 1, 11, '2024-06-02 11:52:17', '2024-06-02 11:52:17');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` bigint NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL DEFAULT '2',
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `fcm_token` text COLLATE utf8mb4_unicode_ci,
  `city_id` bigint UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delete_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `birthday`, `email`, `password`, `address`, `phone`, `role_id`, `latitude`, `longitude`, `status`, `fcm_token`, `city_id`, `remember_token`, `delete_reason`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Admin', '2024-01-16', 'admin@admin.com', '$2y$10$g8g9v11V1pil1ewyc88WM.p25/ggQ4.gTWZfqqCN3Wd.Sekz8KC4S', 'address', 938385476, 3, NULL, NULL, 1, NULL, 2, NULL, NULL, NULL, '2023-12-17 07:19:53', '2024-01-21 13:12:09'),
(2, 'wassim', 'karam', '2024-01-16', 'wassim1@gmail.com', '$2y$10$G5s.LY9QsxeOBaHe0QP1mexOvNZfBM3C0x8jhCr/D.5BSerw/bXLW', 'address', 938385454, 2, 33.50063069623525, 36.29376238948721, 1, NULL, 1, NULL, NULL, NULL, '2023-12-17 07:19:53', '2024-01-19 15:36:19'),
(5, 'قمر', 'الباكير', '2024-01-16', NULL, '$2y$10$NSHeZMpm9e6Ptb9GcCSvQuPgtrqLZiMRZdZUHq8KIWvRiEtePEXH6', NULL, 987654321, 2, NULL, NULL, 1, 'eyVzdz93RQSSrPt1Y8wZVu:APA91bF8rkoxpi_S6Cws8JSPgJV8nzuUJb9FwfcfEzFEUZ8731ZC3Z5__Qy9zj_YmsEH7b7D-gJTZBNzIvCrjFhtzZz8BM6QbcimP3l2iNek4dFJTNyslqv-v3yvvIHaNEQw4BZuv9YX', NULL, NULL, NULL, NULL, '2023-12-17 12:30:22', '2024-04-16 14:46:17'),
(9, 'qmar', 'albakeer', '2024-01-16', NULL, '$2y$10$gsqGmOKWKu4ihCB.UfcaPO8vAWkSx4F/Rx8EKbJ96rgTxYQex5xyC', NULL, 987654322, 2, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2023-12-18 06:17:50', '2023-12-18 06:31:59'),
(10, 'shawki', 'shawki', '2024-01-16', NULL, '$2y$10$ShLt9Octu5uiXq32hOTz.ugRLjXBIiqUFvR.XdtiEzPmyZ/HGHIOO', NULL, 994297125, 2, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2023-12-19 06:18:34', '2023-12-19 06:18:34'),
(19, 'anwar', 'sh', NULL, 'anwar@anwar.com', '$2y$10$t3LVPKhCJQ6oHMQYDcSl0e/rMQVftDvGUzhswk36Cm39gHeieY6NK', NULL, 936252114, 2, NULL, NULL, 1, 'edYfPsmRSLa9DxpNrfmzhk:APA91bHeRdVpWbhdWIQxVAU-9AK3n6exv6rtHg-T7vRoyOc7jlzOaFDgKZGqxi8AWIXoNt9BQPWDyM-BwFDunedfaB769LGLZsUCLfjfXx-Ppwq_f7N_LM0Ub7w8WNHOn73R9LDb9qJc', NULL, NULL, NULL, NULL, '2024-01-03 07:25:23', '2024-03-06 11:24:34'),
(20, 'Mouhanad', 'Haroun', '2024-02-02', 'tt@gmail.com', '$2y$10$XHCroDrGqfERyxQ8Ih0BYOLmsBxd3mLPwvtY6C84pXXVIQ61Ctax6', NULL, 987654111, 2, NULL, NULL, 1, 'fmc6uXjqTnGY0-ZToD-YIh:APA91bG8Mj5WECbe4BM6k7D-9PzFALJ58YOurAVXSMtXUFQ11S0_w14v1yoHTZQswLpP4ahFBU6EGbpkeoOKJDUNrCiZrDiSahNxXNIsLZlIluDERLlB5fiP8fnSQXtZzp8TP_4LrdMf', NULL, NULL, NULL, NULL, '2024-01-06 10:56:48', '2024-06-02 12:27:04'),
(28, 'ghina123', 'sharaf', '2024-01-16', 'ghina@gmail.com', '$2y$10$OYm6GDdh6VUlU7HgMRgtluhOJczom3CHxTmVp/O/l63zn8yec/OyW', NULL, 946156989, 2, NULL, NULL, 1, 'fPcp5Qy0Q-C-Yf5It8Ou6r:APA91bEx5KBWbFWKuMbTJaqKSfYdppi2QNK7hG3FxP9c7kK8dD4sBHoWzlk2sTWOiCzKGhmDef5IY49kJH7psPV7Uwnh09D0EtFj4vF40i-5WY1c7u5tFK-DXxmISYyJkEMKyhh-c5ng', NULL, NULL, NULL, NULL, '2024-02-07 10:35:14', '2024-04-21 14:49:53'),
(38, 'mousa', 'halabi', NULL, 'mousa@m.com', '$2y$10$/LSFNQhnkqQK8JisKNG3vuIX/FZ5O6OxCSp6oljHq6XGWwRgmmT7O', NULL, 984350792, 2, 2, 2, 1, NULL, NULL, NULL, NULL, NULL, '2024-03-04 11:01:36', '2024-03-04 11:01:36'),
(39, 'new user2', 'Saati', NULL, 'peaklink@gmail.com', '$2y$10$KZW1NLQ27RKVFPYzFF67V.0tG8iroIwEBa3JlrXirzbEPKwLTGag6', NULL, 935387582, 3, NULL, NULL, 1, NULL, 1, NULL, NULL, '2024-03-04 15:20:12', '2024-03-04 15:16:11', '2024-03-04 15:20:12'),
(40, 'majd', 'saati', NULL, 'peaklink1@gmail.com', '$2y$10$ZVxJjkrDvo8OiIXsSQwrleQJoJkwFxyIddYhr6aL5PgfYBg3Kx2aS', NULL, 936321565, 2, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, '2024-03-04 15:33:21', '2024-03-04 15:33:21'),
(41, 'reem', 'alzoubi', NULL, NULL, '$2y$10$m3dBXStsx9dwBbfiONiM1OG/zSmxYh8GPYEanmD9pm1Hf4ibpoGmG', NULL, 936348613, 2, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2024-03-13 13:06:03', '2024-03-13 13:06:03'),
(42, 'sdcsd', 'tete', NULL, 'peaklinek@gmail.com', '$2y$10$RB8xvyGZcIZRyuGr40yEZu4QoyHHydQK73vSEoLEuDAXBBOiAxSSG', NULL, 225265225, 2, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, '2024-03-14 13:08:49', '2024-03-14 13:08:49'),
(43, 'te', 'sdv', NULL, 'Hadia.Azzoz@gmail.com', '$2y$10$eIOudNqKUjYYuAj2FGgVSOJC8UHZXMIItzRAjzCbbi4/xAmjv5akW', NULL, 512561561, 2, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, '2024-03-19 12:23:02', '2024-03-19 12:23:02'),
(44, 'Majd', 'Saati', NULL, 'Hdadia.Azzoz@gmail.com', '$2y$10$2P8hJWM.KgF6s7OT90B2oOWGjzpcqKf/M8smrWqecopQAGHr2h3lm', NULL, 5387582, 2, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, '2024-03-19 13:07:32', '2024-03-19 13:07:32'),
(45, 'سير', 'Saati', NULL, 'Hadadia.Azzoz@gmail.com', '$2y$10$r/CDV4T22jigDOANcPP1hOEw6JBQPj0wJrWBLZqQV/SIereSFOuUW', NULL, 53875832, 3, NULL, NULL, 1, NULL, 2, NULL, NULL, NULL, '2024-03-19 13:13:50', '2024-03-19 13:13:50'),
(46, 'sdc', 'Saati', NULL, 'Hdadcsdia.Azzoz@gmail.com', '$2y$10$/UVVw8Ywhhf2HwPaxtTgWexE7Kb2DWN8f6u/6IPulzO3JCWXz96oW', NULL, 538732582, 3, NULL, NULL, 1, NULL, 2, NULL, NULL, NULL, '2024-03-19 13:31:51', '2024-03-19 13:31:51'),
(47, 'issa', 'halabi', '2024-01-02', NULL, '$2y$12$Iv8OwccwQGAYQxze4E9Lh.erkVGf20eDmmH8iB6p76J7k0RxmJ/cG', NULL, 946649532, 2, NULL, NULL, 1, 'cDq8xZKoS9eYf3-xsuwG0s:APA91bFqXqAIZxpSFuSy7t2_n6sxk2OzamQgFxtIKpAauiLoI_gkT6SyU6n-a2tCW68eKpAa1CAMfgde8gBgk5Gx4QMUEwdy-bU6j03ApUDCViYHWD2jj6UUxSDI3OKYd6ds3Pb2rF-J', NULL, NULL, NULL, NULL, '2024-04-02 16:00:40', '2024-05-27 09:55:57'),
(48, 'issa 2', 'halabi', '2024-01-02', 'issatest@gmail.com', '$2y$10$fbJP6JoT09FxMoDA0hnM5eddAvkvD66VlQU7zL1.1OYv6DBHnKjAi', NULL, 984350791, 2, NULL, NULL, 1, 'eWoQydnVRXihRlnUiEwyfR:APA91bFnSe8Qulas-eyogWC0yKR5tDWD6BMDY7m49tuk26TJFPgBpAa9uZWmE3xfgdQq48ksNQalxpxbSVChititUJuEM9N-AJGXlwTi1SkVyecPne5tEa_hnAcINtM_bw9XlPzQlvdJ', 2, NULL, NULL, NULL, '2024-04-02 16:00:40', '2024-04-23 13:21:39'),
(49, 'ds', 'ds', NULL, NULL, '$2y$10$G1SCeQ1WJNHbctRWts4XLOWhcEo1nxxyrT1fWAPGTP31ji3R5kSbm', NULL, 123456789, 2, NULL, NULL, 1, 'sdfgndfsfs', NULL, NULL, NULL, NULL, '2024-04-17 14:53:17', '2024-04-17 14:53:17'),
(50, 'تمارا', 'مرعي', '2024-01-01', NULL, '$2y$10$IYeyJzNePkFcsTNRVWfNoet9c/Bj0lpXVqFqAJmu3yZg/9BDD6Noe', NULL, 934105423, 2, NULL, NULL, 1, 'ejl8X6qBSGmy6w3zu9eu4-:APA91bFMI44kApWLVT8A8j_TlW8esBtWUCeikFD95QUQjgVt842ckpg7N_y_CdGg3lzH-9bSLgb00a6i-INqHFWBR2TwVqxz_wnckh9GpplJ279-E7Z7R3Xp9ghR-cDQKgHHavMbq5Ut', NULL, NULL, NULL, NULL, '2024-04-23 09:14:36', '2024-04-23 09:36:49'),
(51, 'و', 'ع', NULL, NULL, '$2y$10$RYXjvnRo4cNXckLpkD10rO1IhLamctS7XzdrQTvBNIuyqQWw4tUsm', NULL, 993293402, 2, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2024-05-12 11:22:36', '2024-05-12 11:22:36');

-- --------------------------------------------------------

--
-- Table structure for table `user_addresses`
--

CREATE TABLE `user_addresses` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `area` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `building` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `building_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `floor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
(11, 'tsgd', 'dydyd', 31.1, 31.2, 38, 'المزة', 'dhd', 'hxh', 'hxh', 'xhxhx', 0, '2024-01-06 11:25:59', '2024-01-06 11:25:59'),
(26, 'ururr', 'fjt', 33.518142769667094, 36.258938088294535, 19, 'المزة', 'rut', 'eye', 'dhd', 'dhddhdh', 1, '2024-01-14 09:15:30', '2024-01-28 13:34:01'),
(29, 'gfd', 'zdsfc', 111, 111, 19, 'المزة', 'sfsdv', 'fs', 'sfd', 'sfd', 0, '2024-01-15 14:15:42', '2024-01-15 14:15:42'),
(30, 'x\\z', '\\xz', 111, 111, 19, 'المزة', '\\xz', '\\zx', '\\xz', '\\x', 1, '2024-01-15 14:16:54', '2024-01-18 09:27:53'),
(35, 'انور شيخ الارض', 'مزة', 33.49994256119203, 36.270956620574, 19, 'شام', 'شارع العابد', 'بناء الادخار', '٤', '٥', 1, '2024-01-16 15:28:34', '2024-01-16 15:28:34'),
(41, 'رترط', 'زتيتي', 33.48389305581207, 36.337066031992435, 1, 'ااستس', 'طتنس', 'رريري', 'سرريس', 'ررظس', 1, '2024-01-19 20:53:49', '2024-01-19 20:54:43'),
(42, 'jkjk', 'kkkk', 37.430722817906194, -122.08597797900438, 28, 'kkk', 'jkj', 'kj', 'jkjkl', 'jkjk', 1, '2024-02-07 10:40:00', '2024-02-07 10:44:33'),
(75, 'jbuh7', 'hfuh', 33.51593262631768, 36.27721857279539, 28, 'gf CJ oh h', 'vyv', 'bchf', 'uhi', 'hcu', 1, '2024-04-02 12:56:11', '2024-04-02 12:56:19'),
(76, 'hcgy', 'hvh', 33.507866676170416, 36.27649202942848, 47, 'khj', 'gch', 'bvh', 'bvh', '2', 1, '2024-04-02 16:04:27', '2024-04-02 16:04:32'),
(80, 'morw', 'def', 33.49960754456142, 36.28243095859133, 20, 'yyy', 'ssd', 'vvv', 'v', 'vv', 0, '2024-04-18 08:58:33', '2024-04-18 08:58:33'),
(81, 'mnbv', 'tt', 33.50788317000816, 36.27656947821379, 20, 'oo', 'uu', 'kk', '5', '5', 1, '2024-04-18 09:06:23', '2024-04-18 10:32:49'),
(85, 'ss', 'البرامكة', 33.508088923380896, 36.27656947821379, 50, 'damas', 'المنطقة الحرة', 'peaklink', '1', 'الاول', 1, '2024-04-23 09:47:38', '2024-04-23 09:48:32'),
(86, 'mmmm', 'gggg', 33.500173495776366, 36.332594119012356, 20, 'aaaaa', 'sss', 'bbb', 'eee', 'fff', 0, '2024-04-23 14:03:17', '2024-04-23 14:03:17'),
(87, 'ff', 'tt', 33.50023136911683, 36.33271884173155, 20, 'zz', 'tt', 'fg', 'ff', 'dd', 1, '2024-04-24 09:12:55', '2024-04-24 09:13:23'),
(88, 'hchchv', 'ydy', 33.508021829943544, 36.27651013433933, 20, 'hfhd', 'uru', 'jf6', '667', '66', 0, '2024-04-24 09:41:09', '2024-04-24 09:41:09'),
(89, 'yyyyyyyy', 'aa', 33.51015313938358, 36.27903610467911, 20, 'Damace', 'sss', 'ooo', '22', '4', 0, '2024-04-24 11:12:30', '2024-04-24 11:12:30'),
(90, 'tttttttttt', '333', 33.52897118416435, 36.317192539572716, 20, 'bɓ', 'yy', '11', '5', '11', 0, '2024-05-12 10:45:32', '2024-05-12 10:45:32'),
(91, 'نن', 'مزة', 33.50959264139797, 36.27153296023607, 47, 'مزة', 'كوى', 'وو', '1', '1', 0, '2024-05-23 14:04:33', '2024-05-23 14:04:33');

-- --------------------------------------------------------

--
-- Table structure for table `user_ranks`
--

CREATE TABLE `user_ranks` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `limit` bigint NOT NULL,
  `features` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_ranks`
--

INSERT INTO `user_ranks` (`id`, `name`, `limit`, `features`, `description`, `color`) VALUES
(1, '{\"ar\":\"Bronze\",\"en\":\"Bronze\"}', 0, '{\"coupon_per_month\":0,\"discount_on_deliver\":0,\"priority\":4}', '{\"ar\":تحصل على هذه الرتبة عند تسجيلك بالتطبيق ,\"en\":\"You get this rank when you register with the application\"}', '#915B40'),
(2, '{\"ar\":\"Silver\",\"en\":\"Silver\"}', 150, '{\"coupon_per_month\":1,\"discount_on_deliver\":0,\"priority\":3}', '{\"ar\":تحصل على هذه الرتبة عند وصولك ل 150 نقطة,\"en\":\"You get this rank when you reach 150 points\"}', '#646464'),
(3, '{\"ar\":\"Gold\",\"en\":\"Gold\"}', 300, '{\"coupon_per_month\":1,\"discount_on_deliver\":5,\"priority\":3}', '{\"ar\":تحصل على هذه الرتبة عند وصولك ل 300 نقطة,\"en\":\"You get this rank when you reach 300 points\"}', '#EAA441'),
(4, '{\"ar\":\"Platinium\",\"en\":\"Platinium\"}', 500, '{\"coupon_per_month\":2,\"discount_on_deliver\":10,\"priority\":3}', '{\"ar\":تحصل على هذه الرتبة عند وصولك ل 500 نقطة}', '#A2D5F6'),
(5, '{\"ar\":\"Vip\",\"en\":\"Vip\"}', 800, '{\"coupon_per_month\":3,\"discount_on_deliver\":20,\"priority\":2}', '{\"ar\":تحصل على هذه الرتبة عند وصولك ل 800 نقطة,\"en\":\"You get this rank when you reach 800 points\"}', '#A2D5F6'),
(6, '{\"ar\":\"Vip plus\",\"en\":\"Vip plus\"}', 1500, '{\"coupon_per_month\":4,\"discount_on_deliver\":30,\"priority\":1}', '{\"ar\":تحصل على هذه الرتبة عند وصولك ل 1500 نقطة,,\"en\":\"You get this rank when you reach 1500 points\"}', '#0A62C2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `achievements`
--
ALTER TABLE `achievements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `achievement_users`
--
ALTER TABLE `achievement_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `achievement_users_achievement_id_foreign` (`achievement_id`),
  ADD KEY `achievement_users_user_id_foreign` (`user_id`);

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
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupons_coupon_type_id_foreign` (`coupon_type_id`);

--
-- Indexes for table `coupons_types`
--
ALTER TABLE `coupons_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons_users`
--
ALTER TABLE `coupons_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupons_users_user_id_foreign` (`user_id`),
  ADD KEY `coupons_users_coupon_id_foreign` (`coupon_id`);

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
-- Indexes for table `driver_types`
--
ALTER TABLE `driver_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_types_driver_id_foreign` (`driver_id`);

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
-- Indexes for table `home_page_dynamics`
--
ALTER TABLE `home_page_dynamics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_page_dynamic_contents`
--
ALTER TABLE `home_page_dynamic_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `home_page_dynamic_contents_home_page_dynamic_id_foreign` (`home_page_dynamic_id`),
  ADD KEY `home_page_dynamic_contents_product_id_foreign` (`product_id`),
  ADD KEY `home_page_dynamic_contents_category_id_foreign` (`category_id`),
  ADD KEY `home_page_dynamic_contents_banner_id_foreign` (`banner_id`);

--
-- Indexes for table `join_our_teams`
--
ALTER TABLE `join_our_teams`
  ADD PRIMARY KEY (`id`);

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
  ADD UNIQUE KEY `orders_code` (`id`),
  ADD KEY `orders_delivery_method_id_foreign` (`delivery_method_id`),
  ADD KEY `orders_payment_method_id_foreign` (`payment_method_id`),
  ADD KEY `orders_user_address_id_foreign` (`user_address_id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_driver_id_foreign` (`driver_id`);

--
-- Indexes for table `orders_rate_attributes`
--
ALTER TABLE `orders_rate_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_rate_attributes_order_id_foreign` (`order_id`);

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
-- Indexes for table `order_driver_acceptances`
--
ALTER TABLE `order_driver_acceptances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_driver_acceptances_order_id_foreign` (`order_id`),
  ADD KEY `order_driver_acceptances_driver_id_foreign` (`driver_id`);

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
-- Indexes for table `points`
--
ALTER TABLE `points`
  ADD PRIMARY KEY (`id`),
  ADD KEY `points_achievement_id_foreign` (`achievement_id`),
  ADD KEY `points_user_id_foreign` (`user_id`);

--
-- Indexes for table `point_in_pound`
--
ALTER TABLE `point_in_pound`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchases_user_id_foreign` (`user_id`),
  ADD KEY `purchases_coupon_id_foreign` (`coupon_id`);

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
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `user_ranks`
--
ALTER TABLE `user_ranks`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `achievements`
--
ALTER TABLE `achievements`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `achievement_users`
--
ALTER TABLE `achievement_users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `attribute_values`
--
ALTER TABLE `attribute_values`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `commissions`
--
ALTER TABLE `commissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `coupons_types`
--
ALTER TABLE `coupons_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `coupons_users`
--
ALTER TABLE `coupons_users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `delivery_attributes`
--
ALTER TABLE `delivery_attributes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `delivery_methods`
--
ALTER TABLE `delivery_methods`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `delivery_time_infos`
--
ALTER TABLE `delivery_time_infos`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `driver_types`
--
ALTER TABLE `driver_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorits`
--
ALTER TABLE `favorits`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `gifts`
--
ALTER TABLE `gifts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `home_page_dynamics`
--
ALTER TABLE `home_page_dynamics`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `home_page_dynamic_contents`
--
ALTER TABLE `home_page_dynamic_contents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

--
-- AUTO_INCREMENT for table `join_our_teams`
--
ALTER TABLE `join_our_teams`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=437;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=702;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=364;

--
-- AUTO_INCREMENT for table `orders_rate_attributes`
--
ALTER TABLE `orders_rate_attributes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `order_delivery_attributes`
--
ALTER TABLE `order_delivery_attributes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=316;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=570;

--
-- AUTO_INCREMENT for table `order_driver_acceptances`
--
ALTER TABLE `order_driver_acceptances`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `o_t_p_s`
--
ALTER TABLE `o_t_p_s`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

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
-- AUTO_INCREMENT for table `points`
--
ALTER TABLE `points`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `point_in_pound`
--
ALTER TABLE `point_in_pound`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `product_attribute_values`
--
ALTER TABLE `product_attribute_values`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `product_related_product`
--
ALTER TABLE `product_related_product`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `user_addresses`
--
ALTER TABLE `user_addresses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `user_ranks`
--
ALTER TABLE `user_ranks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `achievement_users`
--
ALTER TABLE `achievement_users`
  ADD CONSTRAINT `achievement_users_achievement_id_foreign` FOREIGN KEY (`achievement_id`) REFERENCES `achievements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `achievement_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

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
-- Constraints for table `coupons`
--
ALTER TABLE `coupons`
  ADD CONSTRAINT `coupons_coupon_type_id_foreign` FOREIGN KEY (`coupon_type_id`) REFERENCES `coupons_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `coupons_users`
--
ALTER TABLE `coupons_users`
  ADD CONSTRAINT `coupons_users_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `coupons_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `drivers`
--
ALTER TABLE `drivers`
  ADD CONSTRAINT `drivers_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `driver_types`
--
ALTER TABLE `driver_types`
  ADD CONSTRAINT `driver_types_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `home_page_dynamic_contents`
--
ALTER TABLE `home_page_dynamic_contents`
  ADD CONSTRAINT `home_page_dynamic_contents_banner_id_foreign` FOREIGN KEY (`banner_id`) REFERENCES `banners` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `home_page_dynamic_contents_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `home_page_dynamic_contents_home_page_dynamic_id_foreign` FOREIGN KEY (`home_page_dynamic_id`) REFERENCES `home_page_dynamics` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `home_page_dynamic_contents_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

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
-- Constraints for table `orders_rate_attributes`
--
ALTER TABLE `orders_rate_attributes`
  ADD CONSTRAINT `orders_rate_attributes_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

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
-- Constraints for table `order_driver_acceptances`
--
ALTER TABLE `order_driver_acceptances`
  ADD CONSTRAINT `order_driver_acceptances_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_driver_acceptances_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `points`
--
ALTER TABLE `points`
  ADD CONSTRAINT `points_achievement_id_foreign` FOREIGN KEY (`achievement_id`) REFERENCES `achievements` (`id`),
  ADD CONSTRAINT `points_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `product_related_product`
--
ALTER TABLE `product_related_product`
  ADD CONSTRAINT `product_related_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_related_product_related_product_id_foreign` FOREIGN KEY (`related_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchases_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

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
