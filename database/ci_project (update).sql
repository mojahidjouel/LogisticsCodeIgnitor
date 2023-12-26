-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 26, 2023 at 07:53 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ci_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `name`) VALUES
(1, 'Gucci'),
(2, 'Louis Vuitton'),
(3, 'Versace'),
(4, 'Prada'),
(5, 'Valentino');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Women\'s Clothing'),
(2, 'Men\'s Clothing'),
(3, 'Accessories'),
(4, 'Footwear');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'Chattogram', '1001', '2023-10-18 06:47:29', '2023-10-18 06:50:51'),
(2, 'Dhaka', '1002', '2023-10-18 06:58:18', NULL),
(3, 'Sylhet', '3100', '2023-10-18 08:12:57', NULL),
(4, 'Rajshai', '6000', '2023-10-18 08:13:49', NULL),
(5, 'Comilla', '3500', '2023-10-18 08:14:59', NULL),
(6, 'Rangpur', '5440', '2023-10-18 08:15:43', NULL),
(7, 'Barishal', '8200', '2023-10-18 08:16:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

CREATE TABLE `coupon` (
  `id` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `expert`
--

CREATE TABLE `expert` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `expert`
--

INSERT INTO `expert` (`id`, `name`, `image`, `description`) VALUES
(1, 'mojahid', 'team-1.jpg', 'kkkk'),
(4, 'dell', '65262c48da0f5144.jpeg', 'aaaabbb');

-- --------------------------------------------------------

--
-- Table structure for table `features`
--

CREATE TABLE `features` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `features`
--

INSERT INTO `features` (`id`, `name`, `image`, `description`) VALUES
(1, 'Worldwide Service', 'fa fa-globe text-primary fa-3x flex-shrink-0', 'Diam dolor ipsum sit amet eos erat ipsum lorem sed stet lorem sit clita duo justo magna erat amet'),
(2, 'On Time Delivery', 'fa fa-shipping-fast text-primary fa-3x flex-shrink-0', 'Diam dolor ipsum sit amet eos erat ipsum lorem sed stet lorem sit clita duo justo magna erat amet'),
(4, '24/7 Telephone Support', 'fa fa-headphones text-primary fa-3x flex-shrink-0', 'Diam dolor ipsum sit amet eos erat ipsum lorem sed stet lorem sit clita duo justo magna erat amet.');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `product_id`, `image`) VALUES
(1, 1, 'img/product/product1.jpg'),
(2, 2, 'img/product/product2.jpg'),
(3, 3, 'img/product/product3.jpg'),
(4, 4, 'img/product/product4.jpg'),
(5, 5, 'img/product/product-5.jpg'),
(6, 6, 'img\\product\\product-6.jpg'),
(7, 7, 'img\\product\\product-7.jpg'),
(8, 8, 'img\\product\\product-8.jpg'),
(9, 1, 'img\\product\\product01.jpg'),
(10, 1, 'img\\product\\product001.jpg'),
(11, 1, 'img\\product\\product0001.jpg'),
(12, 3, 'img\\product\\product03.jpg'),
(13, 3, 'img\\product\\product003.jpg'),
(14, 3, 'img\\product\\product0003.jpg'),
(15, 2, 'img\\product\\product02.jpg'),
(16, 2, 'img\\product\\product002.jpg'),
(17, 2, 'img\\product\\product0002.jpg'),
(18, 4, 'img\\product\\product04.jpg'),
(19, 4, 'img\\product\\product004.jpg'),
(20, 4, 'img\\product\\product0004.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `price`
--

CREATE TABLE `price` (
  `id` int(11) NOT NULL,
  `to_city` int(11) NOT NULL,
  `from_city` int(11) NOT NULL,
  `base_price` decimal(11,2) NOT NULL,
  `unit_size` varchar(255) DEFAULT NULL,
  `unit_price` decimal(11,2) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `price`
--

INSERT INTO `price` (`id`, `to_city`, `from_city`, `base_price`, `unit_size`, `unit_price`, `created_at`, `updated_at`) VALUES
(1, 2, 1, '50.00', '0-5', '5.00', '2023-10-18 08:07:49', NULL),
(2, 2, 1, '50.00', '6-20', '3.00', '2023-10-18 08:08:14', NULL),
(3, 2, 1, '50.00', '21-500', '2.00', '2023-10-18 08:08:43', NULL),
(4, 3, 1, '50.00', '0-5', '5.00', '2023-10-18 08:22:25', NULL),
(5, 2, 1, '50.00', '6-22', '3.00', '2023-10-18 08:22:50', '2023-10-19 10:32:01'),
(6, 3, 1, '50.00', '21-500', '2.00', '2023-10-18 08:23:06', NULL),
(7, 4, 1, '50.00', '0-5', '5.00', '2023-10-18 08:23:40', NULL),
(8, 4, 1, '50.00', '11-25', '2.00', '2023-10-18 08:24:01', NULL),
(9, 4, 1, '50.00', '21-500', '2.00', '2023-10-18 08:24:16', NULL),
(10, 5, 1, '50.00', '0-5', '5.00', '2023-10-18 08:24:39', NULL),
(11, 5, 1, '50.00', '11-25', '3.00', '2023-10-18 08:24:58', NULL),
(12, 5, 1, '50.00', '21-500', '2.00', '2023-10-18 08:25:15', NULL),
(13, 3, 2, '50.00', '0-5', '5.00', '2023-10-18 08:27:18', NULL),
(14, 3, 2, '50.00', '11-25', '3.00', '2023-10-18 08:27:33', NULL),
(15, 3, 2, '50.00', '21-500', '2.00', '2023-10-18 08:27:45', NULL),
(16, 1, 1, '25.00', '0-5', '1.00', '2023-10-19 05:54:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `quantity`, `brand`) VALUES
(1, 'HP', '4500', '12', 'Samsung');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `short_description` text,
  `long_description` text,
  `price` decimal(10,2) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `specification` text,
  `category_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `short_description`, `long_description`, `price`, `discount`, `specification`, `category_id`, `brand_id`, `image`) VALUES
(1, 'Long Sleeve T-Shirt', 'A T-shirt with long sleeves, suitable for cooler weather or as a layering piece.', 'Phasellus posuere ac justo id suscipit. Vestibulum venenatis ipsum sed nulla bibendum vestibulum. Etiam pellentesque quis sapien eget semper. Aliquam nisl felis, feugiat vel velit sollicitudin, dictum euismod erat. Vestibulum quis eros nunc. Phasellus faucibus arcu sit amet velit vehicula, non tempor mauris faucibus. Fusce metus nisl, interdum ornare est eget, volutpat luctus metus. Praesent egestas blandit bibendum. Phasellus efficitur ipsum nec tristique iaculis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '100.00', '20.00', 'Available', 1, 1, 'img/product/product1.jpg'),
(2, 'Urban Chic Shirt', 'City-inspired fashion for the modern man and woman.', 'Phasellus posuere ac justo id suscipit. Vestibulum venenatis ipsum sed nulla bibendum vestibulum. Etiam pellentesque quis sapien eget semper. Aliquam nisl felis, feugiat vel velit sollicitudin, dictum euismod erat. Vestibulum quis eros nunc. Phasellus faucibus arcu sit amet velit vehicula, non tempor mauris faucibus. Fusce metus nisl, interdum ornare est eget, volutpat luctus metus. Praesent egestas blandit bibendum. Phasellus efficitur ipsum nec tristique iaculis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '100.00', '20.00', 'Available', 2, 2, 'img/product/product2.jpg'),
(3, 'Short Sleeved Midi Dress', 'A dress with the essence of a power blazer for confident women.\r\n', 'Phasellus posuere ac justo id suscipit. Vestibulum venenatis ipsum sed nulla bibendum vestibulum. Etiam pellentesque quis sapien eget semper. Aliquam nisl felis, feugiat vel velit sollicitudin, dictum euismod erat. Vestibulum quis eros nunc. Phasellus faucibus arcu sit amet velit vehicula, non tempor mauris faucibus. Fusce metus nisl, interdum ornare est eget, volutpat luctus metus. Praesent egestas blandit bibendum. Phasellus efficitur ipsum nec tristique iaculis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '100.00', '20.00', 'Available', 1, 3, 'img/product/product3.jpg'),
(4, 'Luxe Linen Shirt', 'Light and breathable linen shirts for any occasion.\r\n', 'Phasellus posuere ac justo id suscipit. Vestibulum venenatis ipsum sed nulla bibendum vestibulum. Etiam pellentesque quis sapien eget semper. Aliquam nisl felis, feugiat vel velit sollicitudin, dictum euismod erat. Vestibulum quis eros nunc. Phasellus faucibus arcu sit amet velit vehicula, non tempor mauris faucibus. Fusce metus nisl, interdum ornare est eget, volutpat luctus metus. Praesent egestas blandit bibendum. Phasellus efficitur ipsum nec tristique iaculis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '100.00', '20.00', 'Available', 2, 4, 'img/product/product4.jpg'),
(5, 'Vintage Vibes T-Shirt', 'Nostalgic tees that evoke the spirit of bygone eras.\r\n', 'Phasellus posuere ac justo id suscipit. Vestibulum venenatis ipsum sed nulla bibendum vestibulum. Etiam pellentesque quis sapien eget semper. Aliquam nisl felis, feugiat vel velit sollicitudin, dictum euismod erat. Vestibulum quis eros nunc. Phasellus faucibus arcu sit amet velit vehicula, non tempor mauris faucibus. Fusce metus nisl, interdum ornare est eget, volutpat luctus metus. Praesent egestas blandit bibendum. Phasellus efficitur ipsum nec tristique iaculis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '100.00', '20.00', 'Available', 2, 5, 'img/product/product-5.jpg'),
(6, 'Tegan Printed Dress', 'Phasellus faucibus arcu sit amet velit vehicula', 'Phasellus posuere ac justo id suscipit. Vestibulum venenatis ipsum sed nulla bibendum vestibulum. Etiam pellentesque quis sapien eget semper. Aliquam nisl felis, feugiat vel velit sollicitudin, dictum euismod erat. Vestibulum quis eros nunc. Phasellus faucibus arcu sit amet velit vehicula, non tempor mauris faucibus. Fusce metus nisl, interdum ornare est eget, volutpat luctus metus. Praesent egestas blandit bibendum. Phasellus efficitur ipsum nec tristique iaculis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '100.00', '20.00', 'Available', 1, 1, 'img/product/product-6.jpg'),
(7, 'Silk Satin Tank Top', 'Praesent egestas blandit bibendum non tempor mauris faucibus', 'Phasellus posuere ac justo id suscipit. Vestibulum venenatis ipsum sed nulla bibendum vestibulum. Etiam pellentesque quis sapien eget semper. Aliquam nisl felis, feugiat vel velit sollicitudin, dictum euismod erat. Vestibulum quis eros nunc. Phasellus faucibus arcu sit amet velit vehicula, non tempor mauris faucibus. Fusce metus nisl, interdum ornare est eget, volutpat luctus metus. Praesent egestas blandit bibendum. Phasellus efficitur ipsum nec tristique iaculis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '100.00', '20.00', 'Available', 1, 2, 'img/product/product-7.jpg'),
(8, 'Dapper Denim Shirt', 'Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus', 'Phasellus posuere ac justo id suscipit. Vestibulum venenatis ipsum sed nulla bibendum vestibulum. Etiam pellentesque quis sapien eget semper. Aliquam nisl felis, feugiat vel velit sollicitudin, dictum euismod erat. Vestibulum quis eros nunc. Phasellus faucibus arcu sit amet velit vehicula, non tempor mauris faucibus. Fusce metus nisl, interdum ornare est eget, volutpat luctus metus. Praesent egestas blandit bibendum. Phasellus efficitur ipsum nec tristique iaculis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '100.00', '20.00', 'Available', 2, 3, 'img/product/product-8.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`id`, `name`, `email`, `password`, `token`, `image`) VALUES
(1, 'Mojahid', 'mojahidjouel@yahoo.com', '123', '169794857311664b0803d8f6b8c4241979629cd8a4665', 'upload/img/user/6534a39d2a3d1487.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `image`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Air Freight', 'upload/service/653388f573e6e975.jpeg', 'Stet stet justo dolor sed duo. Ut clita sea sit ipsum diam lorem diam.', '2023-10-21 04:16:53', NULL),
(2, 'Ocean Freight', 'upload/service/65338ac4340ed560.jpeg', 'Stet stet justo dolor sed duo. Ut clita sea sit ipsum diam lorem diam.', '2023-10-21 04:24:36', NULL),
(3, 'Road Freight', 'upload/service/65338bb76820d949.jpeg', 'Stet stet justo dolor sed duo. Ut clita sea sit ipsum diam lorem diam.', '2023-10-21 04:28:39', NULL),
(4, 'Train Freight', 'upload/service/65338bc927e04676.jpeg', 'Stet stet justo dolor sed duo. Ut clita sea sit ipsum diam lorem diam.', '2023-10-21 04:28:57', NULL),
(5, 'Customs Clearance', 'upload/service/65338be00e60a375.jpeg', 'Stet stet justo dolor sed duo. Ut clita sea sit ipsum diam lorem diam.', '2023-10-21 04:29:20', NULL),
(6, 'Warehouse Solutions', 'upload/service/65338bf6798ff561.jpeg', 'Stet stet justo dolor sed duo. Ut clita sea sit ipsum diam lorem diam.', '2023-10-21 04:29:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service_apply`
--

CREATE TABLE `service_apply` (
  `id` int(11) NOT NULL,
  `from_city` varchar(255) DEFAULT NULL,
  `to_city` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_description` text,
  `product_weight` decimal(8,2) DEFAULT NULL,
  `receiver_address` varchar(255) DEFAULT NULL,
  `sender_address` varchar(255) DEFAULT NULL,
  `contact_name` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `base_price` decimal(11,2) DEFAULT NULL,
  `unit_price` decimal(11,2) DEFAULT NULL,
  `shipping_cost` decimal(11,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_apply`
--

INSERT INTO `service_apply` (`id`, `from_city`, `to_city`, `product_name`, `product_description`, `product_weight`, `receiver_address`, `sender_address`, `contact_name`, `contact_number`, `base_price`, `unit_price`, `shipping_cost`, `created_at`, `updated_at`) VALUES
(1, '1', '2', 'Cloths', 'Some of Cloths', '5.00', 'Oshkain, Village+Post- Oshkain', 'Joshim', 'Karim', '+8801814415108', '50.00', '25.00', '75.00', '2023-10-22 06:30:07', '2023-10-22 06:32:35'),
(2, '1', '4', 'Matarials', 'Various Matarials', '40.00', 'Rajshai', 'Safayat', 'Kaiser', '018115555444', '50.00', '80.00', '130.00', '2023-10-22 06:31:59', NULL),
(3, '1', '2', 'Row Matarial', 'Some of Matarials', '60.00', 'Noman', '2 no Gate, Chattogram', 'Ibrahim', '01814236444', '50.00', '120.00', '170.00', '2023-10-22 07:40:01', NULL),
(4, '1', '1', NULL, NULL, '5.00', 'Oshkain, Village+Post- Oshkain', NULL, 'MUHAMMAD MOJAHEDUL ISLAM', '+8801814415108', '25.00', '5.00', '30.00', '2023-10-22 08:39:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `testimonial`
--

CREATE TABLE `testimonial` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `subj` varchar(255) DEFAULT NULL,
  `mes` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `subj`, `mes`, `created_at`, `updated_at`) VALUES
(1, 'kaiser', 'kaiser@gmail.com', 'Bangla', 'Love You', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expert`
--
ALTER TABLE `expert`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `price`
--
ALTER TABLE `price`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_apply`
--
ALTER TABLE `service_apply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonial`
--
ALTER TABLE `testimonial`
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
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `expert`
--
ALTER TABLE `expert`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `features`
--
ALTER TABLE `features`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `price`
--
ALTER TABLE `price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `registration`
--
ALTER TABLE `registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `service_apply`
--
ALTER TABLE `service_apply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `testimonial`
--
ALTER TABLE `testimonial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
