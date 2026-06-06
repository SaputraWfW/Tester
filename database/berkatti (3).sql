-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 06, 2026 at 11:26 AM
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
-- Database: `berkatti`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `kd_kat` varchar(6) NOT NULL,
  `category_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `kd_kat`, `category_name`) VALUES
(1, 'K001', 'Sport Car'),
(2, 'K002', 'SuperCar'),
(3, 'K003', 'HyperCar'),
(4, 'K004', 'MegaCar');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(150) DEFAULT NULL,
  `stock` int(11) DEFAULT 0,
  `min_stock` int(11) DEFAULT 5,
  `price` bigint(11) DEFAULT NULL,
  `gambar` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `product_code`, `product_name`, `stock`, `min_stock`, `price`, `gambar`, `created_at`, `updated_at`) VALUES
(1, 1, 'P001', 'Toyota GR Supra', 15, 5, 2850000000, 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/2020_Toyota_GR_Supra_3.0L.jpg/800px-2020_Toyota_GR_Supra_3.0L.jpg', '2026-06-05 07:49:27', NULL),
(2, 1, 'P002', 'Nissan Z', 12, 5, 2600000000, 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/2023_Nissan_Z_Performance.jpg/800px-2023_Nissan_Z_Performance.jpg', '2026-06-05 07:49:27', NULL),
(3, 1, 'P003', 'Ford Mustang GT', 20, 5, 2950000000, 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/2024_Ford_Mustang_GT.jpg/800px-2024_Ford_Mustang_GT.jpg', '2026-06-05 07:49:27', NULL),
(4, 1, 'P004', 'Chevrolet Camaro SS', 10, 5, 2800000000, 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/2024_Chevrolet_Camaro_SS.jpg/800px-2024_Chevrolet_Camaro_SS.jpg', '2026-06-05 07:49:27', NULL),
(5, 1, 'P005', 'Porsche 718 Cayman', 8, 3, 4200000000, 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Porsche_718_Cayman_GT4.jpg/800px-Porsche_718_Cayman_GT4.jpg', '2026-06-05 07:49:27', NULL),
(6, 2, 'P006', 'Porsche 911 Turbo S', 5, 2, 7500000000, 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Porsche_911_Turbo_S_%28992%29.jpg/800px-Porsche_911_Turbo_S_%28992%29.jpg', '2026-06-05 07:49:27', NULL),
(7, 2, 'P007', 'Audi R8 V10 Performance', 4, 2, 7200000000, 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/Audi_R8_V10_performance_Quattro.jpg/800px-Audi_R8_V10_performance_Quattro.jpg', '2026-06-05 07:49:27', NULL),
(8, 2, 'P008', 'McLaren Artura', 3, 2, 7800000000, 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/McLaren_Artura.jpg/800px-McLaren_Artura.jpg', '2026-06-05 07:49:27', NULL),
(9, 2, 'P009', 'Ferrari F8 Tributo', 2, 1, 9200000000, 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/86/Ferrari_F8_Tributo.jpg/800px-Ferrari_F8_Tributo.jpg', '2026-06-05 07:49:27', NULL),
(10, 2, 'P010', 'Lamborghini Huracán Tecnica', 3, 1, 8800000000, 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f0/Lamborghini_Huracan_Tecnica.jpg/800px-Lamborghini_Huracan_Tecnica.jpg', '2026-06-05 07:49:27', NULL),
(11, 3, 'P011', 'Ferrari SF90 Stradale', 2, 1, 15000000000, '8be39fc43a93c21ab6583e70b23d28c7.jpg', '2026-06-05 07:49:27', NULL),
(12, 3, 'P012', 'Lamborghini Revuelto', 2, 1, 16500000000, 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Lamborghini_Revuelto.jpg/800px-Lamborghini_Revuelto.jpg', '2026-06-05 07:49:27', NULL),
(13, 3, 'P013', 'McLaren 765LT', 3, 1, 13000000000, 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/McLaren_765LT.jpg/800px-McLaren_765LT.jpg', '2026-06-05 07:49:27', NULL),
(14, 3, 'P014', 'Porsche 918 Spyder', 1, 0, 20000000000, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/Porsche_918_Spyder.jpg/800px-Porsche_918_Spyder.jpg', '2026-06-05 07:49:27', NULL),
(15, 3, 'P015', 'Aston Martin Valhalla', 1, 0, 18500000000, 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Aston_Martin_Valhalla.jpg/800px-Aston_Martin_Valhalla.jpg', '2026-06-05 07:49:27', NULL),
(16, 4, 'P016', 'Bugatti Chiron Super Sport', 1, 0, 85000000000, 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Bugatti_Chiron_Super_Sport_300%2B.jpg/800px-Bugatti_Chiron_Super_Sport_300%2B.jpg', '2026-06-05 07:49:27', NULL),
(17, 4, 'P017', 'Hennessey Venom F5', 1, 0, 55000000000, 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/Hennessey_Venom_F5.jpg/800px-Hennessey_Venom_F5.jpg', '2026-06-05 07:49:27', NULL),
(18, 4, 'P018', 'Koenigsegg Jesko', 1, 0, 70000000000, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Koenigsegg_Jesko.jpg/800px-Koenigsegg_Jesko.jpg', '2026-06-05 07:49:27', NULL),
(19, 4, 'P019', 'Bugatti Bolide', 0, 0, 95000000000, 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Bugatti_Bolide.jpg/800px-Bugatti_Bolide.jpg', '2026-06-05 07:49:27', NULL),
(20, 4, 'P020', 'Rimac Nevera', 1, 0, 60000000000, 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/Rimac_Nevera.jpg/800px-Rimac_Nevera.jpg', '2026-06-05 07:49:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stock_logs`
--

CREATE TABLE `stock_logs` (
  `id` int(11) NOT NULL,
  `product_Id` int(11) DEFAULT NULL,
  `change_type` enum('ADD','EDIT','REDUCE') DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `stock_before` int(11) DEFAULT NULL,
  `stock_after` int(11) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('admin','staff') DEFAULT 'staff',
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `is_active`, `created_at`) VALUES
(2, 'Kylian Mbappe', 'mbappe@gmail.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'staff', 1, '2026-06-05 07:28:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kd_cat` (`kd_kat`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_logs`
--
ALTER TABLE `stock_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `stock_logs`
--
ALTER TABLE `stock_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
