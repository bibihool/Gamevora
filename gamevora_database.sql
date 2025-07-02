-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql102.infinityfree.com
-- Generation Time: Jul 02, 2025 at 06:21 AM
-- Server version: 11.4.7-MariaDB
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `if0_39310794_gamevora`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `excerpt` text DEFAULT NULL,
  `featured_image` varchar(255) DEFAULT NULL,
  `author` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `status` enum('draft','published') DEFAULT 'published',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog_posts`
--

INSERT INTO `blog_posts` (`id`, `title`, `slug`, `content`, `excerpt`, `featured_image`, `author`, `category`, `tags`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Top 5 Gaming Mice in 2024: Ultimate Guide', 'top-5-gaming-mice-2024', 'Discover the best gaming mice of 2024, featuring cutting-edge technology, precision tracking, and ergonomic designs for competitive gaming.', 'A comprehensive guide to the top 5 gaming mice of 2024, perfect for competitive gamers and enthusiasts.', 'images/blog/gaming-mice.jpg', 'Gamevora Team', 'Gaming Gear', 'gaming mice, gaming gear, mouse reviews', 'published', '2025-06-17 09:12:25', '2025-07-02 04:40:59'),
(2, 'Top 5 Mechanical Keyboards in 2024', 'ultimate-mechanical-keyboard-guide', 'Comprehensive guide to mechanical keyboards, switches, and features for gamers and typists.', 'Everything you need to know about mechanical keyboards for gaming.', 'images/blog/mechanical-keyboard-guide.jpg', 'Jane Smith', 'Gaming Gear', 'mechanical-keyboards, gaming, guides', 'published', '2025-06-17 09:12:25', '2025-07-02 04:40:59'),
(3, 'The Ultimate Guide to Gaming Headsets', 'ultimate-gaming-headset-guide', 'The ultimate guide to choosing the best gaming headset. Learn about sound quality, comfort, microphones, durability, and connectivity for gamers.', 'The ultimate guide to choosing the best gaming headset. Learn about sound quality, comfort, microphones, durability, and connectivity for gamers.', 'images/headsets.jpg', 'Gamevora Team', 'Gaming Gear', 'gaming headsets, headset guide, audio, comfort, microphone', 'published', '2025-07-01 11:11:12', '2025-07-02 04:40:59'),
(19, 'The Ultimate Guide to Monitors', 'ultimate-monitor-guide', 'The ultimate guide to choosing the best monitor. Learn about resolution, refresh rate, response time, panel types, and connectivity options.', 'The ultimate guide to choosing the best monitor. Learn about resolution, refresh rate, response time, panel types, and connectivity options.', 'images/monitors.jpg', 'Gamevora Team', 'Gaming Gear', 'gaming monitors, monitor guide, resolution, refresh rate, panel type', 'published', '2025-07-02 07:22:42', '2025-07-02 04:40:59');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(50) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `rating` decimal(2,1) DEFAULT 0.0,
  `rating_count` int(11) DEFAULT 0,
  `stock` int(11) DEFAULT 0,
  `specs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category`, `brand`, `price`, `description`, `image`, `rating`, `rating_count`, `stock`, `specs`, `features`, `status`, `created_at`, `updated_at`, `affiliate_link`) VALUES
(1, 'Logitech G PRO X Wireless Lightspeed Gaming Headset', 'Headsets', 'Logitech', '799.00', 'The Logitech G PRO X Wireless is a professional-grade gaming headset featuring LIGHTSPEED wireless technology, Blue VO!CE microphone technology, and PRO-G 50mm drivers. Designed for esports professionals and serious gamers, it offers exceptional sound quality, comfort, and wireless freedom.', 'images/headsets/logitech-g-pro-x-wireless.jpg', '4.8', 156, 25, '{\"driver\":\"PRO-G 50mm\",\"frequency_response\":\"20Hz-20kHz\",\"microphone\":\"Blue VO!CE\",\"connectivity\":\"LIGHTSPEED Wireless\",\"battery_life\":\"Up to 20 hours\",\"weight\":\"350g\",\"compatibility\":\"PC, PS4, PS5, Nintendo Switch\",\"features\":[\"LIGHTSPEED Wireless Technology\",\"Blue VO!CE Microphone Technology\",\"PRO-G 50mm Drivers\",\"DTS Headphone:X 2.0 Surround Sound\",\"Memory Foam Ear Pads\",\"Aluminum and Steel Construction\",\"On-board Controls\",\"Detachable Microphone\"]}', '[\"LIGHTSPEED Wireless Technology\",\"Blue VO!CE Microphone Technology\",\"PRO-G 50mm Drivers\",\"DTS Headphone:X 2.0 Surround Sound\",\"Memory Foam Ear Pads\",\"Aluminum and Steel Construction\",\"On-board Controls\",\"Detachable Microphone\"]', 'active', '2025-06-17 10:45:44', '2025-07-02 09:07:07', 'https://amzn.to/4kgqrgT'),
(2, 'SteelSeries Apex Pro Gen 3 Gaming Keyboard - Black', 'Gaming Keyboards', 'SteelSeries', '1549.00', 'The SteelSeries Apex Pro Gen 3 is a full-size, premium gaming keyboard featuring OmniPoint 3.0 Adjustable HyperMagnetic switches, per-key RGB, and a programmable OLED Smart Display. Designed for esports and enthusiast gamers, it offers ultra-fast actuation, customizable key response, and a robust aluminum top plate for durability.', 'images/keyboards/steelseries-apex-pro-gen3-black.jpg', '4.8', 87, 10, '{\"switch_type\":\"OmniPoint 3.0 Adjustable HyperMagnetic (Hall Effect)\",\"form_factor\":\"Full-size (100%)\",\"keycap_material\":\"Double Shot PBT\",\"backlight\":\"Per-key RGB\",\"connection\":\"Wired USB-C (detachable braided cable)\",\"polling_rate\":\"1000Hz\",\"n_key_rollover\":\"Yes\",\"media_controls\":\"OLED Smart Display, Scroll Wheel\",\"wrist_rest\":\"Magnetic, included\",\"dimensions\":\"43.7 x 13.9 x 4.0 cm\",\"weight\":\"1.098 kg\",\"features\":[\"OmniPoint 3.0 Adjustable HyperMagnetic switches\",\"Rapid Trigger, Rapid Tap, Protection Mode\",\"OLED Smart Display\",\"Dynamic per-key RGB illumination\",\"Detachable USB-C braided cable\",\"Magnetic wrist rest\",\"SteelSeries GG software support\",\"Programmable macros\"],\"compatibility\":\"Windows, macOS, Linux\"}', NULL, 'active', '2025-06-17 12:22:50', '2025-07-02 09:06:13', 'https://amzn.to/44pfSCj'),
(6, 'SteelSeries Arctis Nova 7 Wireless Gaming Headset', 'Headsets', 'SteelSeries', '969.00', 'The SteelSeries Arctis Nova 7 Wireless delivers premium audio performance with 2.4GHz wireless connectivity and Bluetooth 5.0. Featuring the new Nova Acoustic System with 40mm drivers, AI-powered noise-canceling microphone, and up to 38 hours of battery life. Perfect for gaming, streaming, and everyday use.', 'images/headsets/steelseries-arctis-nova-7.jpg', '4.7', 89, 18, '{\"driver\":\"Nova Acoustic System 40mm\",\"frequency_response\":\"20Hz-22kHz\",\"microphone\":\"AI-powered noise-canceling\",\"connectivity\":\"2.4GHz Wireless + Bluetooth 5.0\",\"battery_life\":\"Up to 38 hours\",\"weight\":\"337g\",\"compatibility\":\"PC, PS4, PS5, Xbox One, Xbox Series X|S, Nintendo Switch, Mobile\",\"features\":[\"Nova Acoustic System\",\"AI-powered Noise-canceling Microphone\",\"2.4GHz Wireless + Bluetooth 5.0\",\"Up to 38 Hours Battery Life\",\"Premium Steel-reinforced Headband\",\"AirWeave Ear Cushions\",\"On-ear Controls\",\"ChatMix Dial\",\"DTS Headphone:X v2.0 Surround Sound\",\"Multi-platform Compatibility\"]}', '[\"Nova Acoustic System\",\"AI-powered Noise-canceling Microphone\",\"2.4GHz Wireless + Bluetooth 5.0\",\"Up to 38 Hours Battery Life\",\"Premium Steel-reinforced Headband\",\"AirWeave Ear Cushions\",\"On-ear Controls\",\"ChatMix Dial\",\"DTS Headphone:X v2.0 Surround Sound\",\"Multi-platform Compatibility\"]', 'active', '2025-06-29 17:20:59', '2025-07-02 09:06:36', 'https://amzn.to/3TS84Ek'),
(7, 'Logitech G PRO X SUPERLIGHT 2 Wireless Gaming Mouse', 'Gaming Mice', 'Logitech', '537.00', 'The Logitech G PRO X SUPERLIGHT 2 is the ultimate wireless gaming mouse, featuring the new HERO 2 sensor with 32,000 DPI, LIGHTSPEED wireless technology, and a lightweight design at just 60g. Perfect for competitive gaming with exceptional precision and speed.', 'images/gpro-x-superlight-2.jpg', '4.9', 234, 32, '{\"sensor\":\"HERO 2 32K\",\"dpi\":\"100-32,000 DPI\",\"ips\":\"500+ IPS\",\"acceleration\":\"40G\",\"connectivity\":\"LIGHTSPEED Wireless\",\"battery_life\":\"Up to 95 hours\",\"weight\":\"60g\",\"buttons\":\"5 programmable\",\"compatibility\":\"PC, Windows 10\\/11\",\"features\":[\"HERO 2 32K Optical Sensor\",\"LIGHTSPEED Wireless Technology\",\"Ultra-lightweight 60g Design\",\"Up to 95 Hours Battery Life\",\"5 Programmable Buttons\",\"Onboard Memory\",\"POWERPLAY Compatible\",\"PTFE Feet\",\"Ambidextrous Design\",\"G HUB Software Support\"]}', '[\"HERO 2 32K Optical Sensor\",\"LIGHTSPEED Wireless Technology\",\"Ultra-lightweight 60g Design\",\"Up to 95 Hours Battery Life\",\"5 Programmable Buttons\",\"Onboard Memory\",\"POWERPLAY Compatible\",\"PTFE Feet\",\"Ambidextrous Design\",\"G HUB Software Support\"]', 'active', '2025-06-29 17:29:40', '2025-07-02 09:07:09', 'https://amzn.to/3GkxSGc'),
(8, 'Samsung 27-Inch Odyssey OLED G6 G60SD QHD 360Hz Gaming Monitor', 'Gaming Monitors', 'Samsung', '2499.00', 'The Samsung Odyssey OLED G6 is the world\'s first 360Hz OLED gaming monitor, featuring a 27-inch QHD display with perfect blacks, infinite contrast, and ultra-fast response times. Experience gaming like never before with OLED technology and 360Hz refresh rate for competitive advantage.', 'images/monitors/samsung-odyssey-oled-g6.jpg', '4.8', 67, 12, '{\"screen_size\":\"27 inches\",\"resolution\":\"2560 x 1440 (QHD)\",\"panel_type\":\"OLED\",\"refresh_rate\":\"360Hz\",\"response_time\":\"0.03ms (GTG)\",\"aspect_ratio\":\"16:9\",\"viewing_angle\":\"178\\u00b0 (H\\/V)\",\"brightness\":\"250 cd\\/m\\u00b2\",\"contrast_ratio\":\"Infinite\",\"color_gamut\":\"99.3% DCI-P3\",\"connectivity\":\"DisplayPort 1.4, HDMI 2.1 x2\",\"features\":[\"360Hz OLED Display\",\"0.03ms Response Time\",\"QHD 2560x1440 Resolution\",\"Infinite Contrast Ratio\",\"99.3% DCI-P3 Color Gamut\",\"AMD FreeSync Premium Pro\",\"NVIDIA G-SYNC Compatible\",\"HDR10+ Support\",\"Eye Saver Mode\",\"Flicker Free Technology\",\"Game Mode\",\"Black Equalizer\",\"Low Input Lag\",\"VESA Mount Compatible\"]}', '[\"360Hz OLED Display\",\"0.03ms Response Time\",\"QHD 2560x1440 Resolution\",\"Infinite Contrast Ratio\",\"99.3% DCI-P3 Color Gamut\",\"AMD FreeSync Premium Pro\",\"NVIDIA G-SYNC Compatible\",\"HDR10+ Support\",\"Eye Saver Mode\",\"Flicker Free Technology\",\"Game Mode\",\"Black Equalizer\",\"Low Input Lag\",\"VESA Mount Compatible\"]', 'active', '2025-06-29 17:36:47', '2025-07-02 09:07:38', 'https://amzn.to/4kpJYvz'),
(9, 'Razer Viper V3 Pro Wireless Gaming Mouse', 'Gaming Mice', 'Razer', '599.00', 'The Razer Viper V3 Pro is the latest evolution of the legendary Viper series, featuring the new Focus Pro 35K optical sensor, HyperSpeed Wireless technology, and an ultra-lightweight design at just 54g. Built for esports with exceptional precision and speed.', 'images/razer-viper-v3-pro.jpg', '4.8', 187, 28, '{\"sensor\":\"Focus Pro 35K Optical\",\"dpi\":\"100-35,000 DPI\",\"ips\":\"750+ IPS\",\"acceleration\":\"70G\",\"connectivity\":\"HyperSpeed Wireless\",\"battery_life\":\"Up to 95 hours\",\"weight\":\"54g\",\"buttons\":\"5 programmable\",\"compatibility\":\"PC, Windows 10\\/11\",\"features\":[\"Focus Pro 35K Optical Sensor\",\"HyperSpeed Wireless Technology\",\"Ultra-lightweight 54g Design\",\"Up to 95 Hours Battery Life\",\"5 Programmable Buttons\",\"Onboard Memory\",\"Optical Mouse Switches Gen-3\",\"PTFE Feet\",\"Ambidextrous Design\",\"Razer Synapse 3 Support\",\"Chroma RGB Lighting\",\"Quick DPI Switching\"]}', '[\"Focus Pro 35K Optical Sensor\",\"HyperSpeed Wireless Technology\",\"Ultra-lightweight 54g Design\",\"Up to 95 Hours Battery Life\",\"5 Programmable Buttons\",\"Onboard Memory\",\"Optical Mouse Switches Gen-3\",\"PTFE Feet\",\"Ambidextrous Design\",\"Razer Synapse 3 Support\",\"Chroma RGB Lighting\",\"Quick DPI Switching\"]', 'active', '2025-06-29 17:43:50', '2025-07-02 09:08:00', 'https://amzn.to/4kp81Ld'),
(12, 'Razer Huntsman V2 Analog Optical Gaming Keyboard', 'Gaming Keyboards', 'Razer', '719.00', 'The Razer Huntsman V2 Analog is a revolutionary gaming keyboard featuring analog optical switches that provide precise control and faster response times. With per-key RGB lighting, premium aluminum construction, and advanced customization options, it\'s designed for competitive gamers who demand the ultimate in performance and precision.', 'images/keyboards/razer-huntsman-v2.jpg', '4.7', 156, 22, '{\"switch_type\":\"Razer Analog Optical Switches\",\"form_factor\":\"Full-size (100%)\",\"keycap_material\":\"Double Shot PBT\",\"backlight\":\"Per-key RGB\",\"connection\":\"Wired USB-C (detachable cable)\",\"polling_rate\":\"8000Hz\",\"n_key_rollover\":\"Yes\",\"media_controls\":\"Dedicated media keys\",\"wrist_rest\":\"Magnetic, included\",\"dimensions\":\"44.5 x 14.4 x 3.5 cm\",\"weight\":\"1.1 kg\",\"compatibility\":\"Windows 10\\/11\",\"features\":[\"Razer Analog Optical Switches\",\"8000Hz Polling Rate\",\"Per-key RGB with Razer Chroma\",\"Aluminum Top Plate\",\"Detachable USB-C Cable\",\"Magnetic Wrist Rest\",\"Razer Synapse 3 Support\",\"Analog Input Support\",\"Onboard Memory\",\"N-Key Rollover\"]}', '[\"Razer Analog Optical Switches\",\"8000Hz Polling Rate\",\"Per-key RGB with Razer Chroma\",\"Aluminum Top Plate\",\"Detachable USB-C Cable\",\"Magnetic Wrist Rest\",\"Razer Synapse 3 Support\",\"Analog Input Support\",\"Onboard Memory\",\"N-Key Rollover\"]', 'active', '2025-06-29 17:55:17', '2025-07-02 09:05:02', 'https://amzn.to/4euxrpf');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_slug` (`slug`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
