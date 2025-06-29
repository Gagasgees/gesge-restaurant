-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 23, 2025 at 08:14 AM
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
-- Database: `restaurant_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name_product` varchar(100) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `name_product`, `price`, `qty`) VALUES
(28, 2, 11, 'Chili Garlic Chicken Platter', 65, 1),
(30, 2, 39, 'Cinnamon Walnut Cookie ', 12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Food'),
(2, 'Drink'),
(3, 'Dessert'),
(4, 'Grocery');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `number` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `address_type` enum('home','office','','') NOT NULL,
  `method` varchar(50) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name_product` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('pending','paid','shipped','canceled') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `number`, `email`, `address`, `address_type`, `method`, `product_id`, `name_product`, `price`, `qty`, `date`, `status`) VALUES
(5, 2, 'Gagas gas', '085891009390', 'akugagass@gmail.com', 'leuwidamar, lebak, jl lebar alun panjang, , Indonesia, 42362', 'home', 'gopay', 71, 'Healthy Gift Hamper', 11, 1, '2025-06-13 18:36:29', 'pending'),
(13, 2, 'Gagas gas', '085891009390', 'akugagass@gmail.com', 'leuwidamar, lebak, jl lebar alun panjang, , Indonesia, 42362', 'home', 'gopay', 19, 'Green Garden Salad', 17, 1, '2025-06-13 18:36:28', 'pending'),
(14, 2, 'Gagas gas', '085891009390', 'akugagass@gmail.com', 'leuwidamar, lebak, jl lebar alun panjang, , Indonesia, 42362', 'home', 'gopay', 36, 'Berry Choco Waffle Cookie', 13, 3, '2025-06-13 18:36:28', 'pending'),
(15, 2, 'Gagas gas', '085891009390', 'akugagass@gmail.com', 'leuwidamar, lebak, jl lebar alun panjang, , Indonesia, 42362', 'home', 'gopay', 38, 'Red Velvet Crinkle Cookie', 14, 1, '2025-06-13 18:36:28', 'canceled'),
(16, 2, 'Gagas gas', '085891009390', 'akugagass@gmail.com', 'leuwidamar, lebak, jl lebar alun panjang, , Indonesia, 42362', 'home', 'gopay', 42, 'Strawberry Sundae Delight', 8, 2, '2025-06-13 18:36:28', 'pending'),
(17, 2, 'Gagas gas', '085891009390', 'akugagass@gmail.com', 'leuwidamar, lebak, jl lebar alun panjang, , Indonesia, 42362', 'home', 'gopay', 63, 'Vanilla Milkshake Trio', 12, 2, '2025-06-13 18:36:29', 'pending'),
(18, 2, 'Gagas gas', '085891009390', 'akugagass@gmail.com', 'leuwidamar, lebak, jl lebar alun panjang, , Indonesia, 42362', 'home', 'gopay', 29, 'Smoked Beef Burger', 23, 1, '2025-06-13 18:36:29', 'pending'),
(19, 2, 'Gagas gas', '085891009390', 'akugagass@gmail.com', 'leuwidamar, lebak, jl lebar alun panjang, , Indonesia, 42362', 'home', 'gopay', 3, 'Chicken Meatballs With Cheese Dip', 40, 3, '2025-06-13 18:36:29', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name_product` varchar(100) NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `sub_category_id` int(11) UNSIGNED DEFAULT NULL,
  `product_detail` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name_product`, `category_id`, `sub_category_id`, `product_detail`) VALUES
(1, 'Crispy Fried Chicken', 1, 2, NULL),
(2, 'Grilled Chicken Skewers', 1, 2, NULL),
(3, 'Chicken Meatballs With Cheese Dip', 1, 2, NULL),
(4, 'Buffalo Chicken Wings with Fries', 1, 2, NULL),
(5, 'Chicken Nachos with Salsa', 1, 2, NULL),
(6, 'Crispy Chicken Rings', 1, 2, NULL),
(7, 'Spicy Chicken Platter', 1, 2, NULL),
(8, 'Sweet and Spicy Chicken Bites', 1, 2, NULL),
(9, 'Grilled Chicken with Chili Sauce', 1, 2, NULL),
(10, 'Golden Fried Chicken with Herbs', 1, 2, NULL),
(11, 'Chili Garlic Chicken Platter', 1, 2, NULL),
(12, 'Beef Wrap Kebab', 1, 3, 'Kebab gulung berisi daging sapi dan sayuran'),
(13, 'Double Chicken Kebab Wrap', 1, 3, NULL),
(14, 'Grilled Kebab Tacos', 1, 3, 'Kebab panjang disajikan dalam roti taco, lengkap dengan garnish'),
(15, 'Chessy Kebab Rolls with Fries', 1, 3, 'Kebab isi keju digulung, disajikan dengan kentang goreng'),
(16, 'Beef Pepper Pizza', 1, 4, 'Pizza dengan topping daging cincang dan lada hitam'),
(17, 'Caesar Salad', 1, 5, 'Salad dengan potongan ayam panggang, croutons, dengan keju parmesan'),
(18, 'Grilled Veggie Salad', 1, 5, 'Salad sayur panggang dengan tomat, paprika, dan herbs'),
(19, 'Green Garden Salad', 1, 5, 'Salad hijau segar dengan tomat cherry dan dressing ringan'),
(20, 'Beef tender Salad', 1, 5, 'Salad dengan potongan daging sapi panggang dan sayuran hijau'),
(21, 'Crunchy Chicken Salad', 1, 5, 'Salad dengan ayam chrispy dan dressing creamy'),
(22, 'Citrus Shrimp Salad', 1, 5, 'Salad udang dengan irisan jeruk dan lime, cocok untuk cita rasa segar'),
(23, 'Tabbouleh Salad', 1, 5, 'Salad ayam dengan jagung, kacang merah, dan dressing ala meksiko'),
(24, 'Beef Bulgogi', 1, 1, NULL),
(25, 'Beef Burger', 1, 1, NULL),
(26, 'Beef Cheese Burger', 1, 1, NULL),
(27, 'Beef Cheese Egg Burger', 1, 1, NULL),
(28, 'Fish Burger', 1, 1, NULL),
(29, 'Smoked Beef Burger', 1, 1, NULL),
(30, 'Chicken Burger', 1, 1, NULL),
(31, 'Caramel Bliss Box', 3, 8, 'Smooth caramel ice cream in a creamy blend'),
(32, 'Double Choco Crunch', 3, 8, 'Rich chocolate with crispy swirls inside'),
(33, 'Blackberry Choco swirls', 3, 8, 'Berry and chocolate fusion in every scoop'),
(34, 'Blueberry Ice Cheesecake Dream', 3, 8, 'Creamy cheesecake with a hint of blueberry'),
(35, 'Strawberry Cream Delight', 3, 8, 'Classic strawberry ice cream with salky texture'),
(36, 'Berry Choco Waffle Cookie', 3, 9, 'Cookie with waffle texture and berry topping'),
(37, 'Strawberry Stuffed Cookie', 3, 9, 'Thick cookie with strawberry chunks inside'),
(38, 'Red Velvet Crinkle Cookie', 3, 9, 'Soft red cookies dusted with powdered sugar'),
(39, 'Cinnamon Walnut Cookie ', 3, 9, 'Golden-brown cookie with visible nuts and spice tones'),
(40, 'Choco Chunk Marshmallow Cookie', 3, 9, 'Loaded with chocolate chunks and marshmallow bits'),
(41, 'Classic Chocolate Chip Cookies', 3, 9, 'Timeless chocolate chip cookies, slightly crunchy'),
(42, 'Strawberry Sundae Delight', 3, 10, 'Soft serve ice cream with fresh strawberries'),
(43, 'Chocolate Lava Swirl', 3, 10, 'Vanilla soft serve with rich chocolate syrup'),
(44, 'Caramel Nut Crunch', 3, 10, 'Ice Cream with caramel drizzle and nut topping'),
(45, 'Rainbow Triple Scoop', 3, 10, 'Three flavors: strawberry, vanilla, chocolate - with choco sauce & cherry'),
(46, 'Classic Gelato Mix', 3, 10, 'Colorful gelato scoops with wafer sticks and fruit'),
(47, 'Chocolate Berry Bliss', 3, 10, 'Choco scoops with berries and creamy drizzle'),
(48, 'Rocky Road Bowl', 3, 10, 'Chocolate ice cream with marshmellow & nuts in a waffle bowl'),
(49, 'Cookie Dough Delight', 3, 10, 'Ice cream with cookie dough chunks in a chocolate waffle bowl'),
(50, 'Neapolitan Boat ', 3, 10, 'Banana split style with 3-color scoops and biscuit stick'),
(51, 'Tropical Sunset Ice Cream', 3, 10, 'Yellow & Purple scoops with fruit toppings'),
(52, 'Double Choco Cookie Cup', 3, 10, 'Two choco scoops with chocolate chip cookie'),
(53, 'Nutty Brownie Ice Cream', 3, 10, 'Chocolate scoops with brownie chunks and nuts'),
(54, 'Classic Americano', 2, 6, 'Espresso + hot water, disajikan hitam tanpa susu'),
(55, 'Cafe Mocha Love', 2, 6, 'Espresso dengan susu dan coklat, dihiasi latte art berbentuk hati'),
(56, 'Caramel Latte Heart', 2, 6, 'Latte dengan sentuhan caramel dan foam art elegan'),
(57, 'Bold Black Brew', 2, 6, 'Kopi hitam kuat untuk pencinta rasa otentik, tanpa tambahan susu'),
(58, 'Vanilla Latte Bliss', 2, 6, 'Latte creamy dengan hint vanilla dan latte art cantik'),
(59, 'Strawberry Splash', 2, 7, 'Minuman segar dari stoberi merah dengan es batu, cocok untuk musim panas'),
(60, 'Tropical Pineapple Juice', 2, 7, 'Jus nanas tropis murni dengan sentuhan mint'),
(61, 'Orange Paradise', 2, 7, 'Jus jeruk segar, manis dan menyegarkan'),
(62, 'Iced Choco Espresso', 2, 7, 'Perpaduan es kopi dan coklat yang creamy dan strong'),
(63, 'Vanilla Milkshake Trio', 2, 7, 'Milkshake coklat pekat dengan sentuhan ceri di atasnya'),
(64, 'Classic Vanilla Shake', 2, 7, 'Milkshake vanilla lembut dan creamy, disajikan dingin'),
(65, 'Berry Mint Refresher', 2, 7, 'Infused water dengan stroberi, daun mint, dan es batu dangat menyegarkan'),
(66, 'Choco Cherry Shake', 2, 7, 'Milkshake cokelat pekat dengan sentuhan ceri di atasnya'),
(67, 'Premium Fruit Basket ', 4, 11, 'Keranjang buah pilihan: anggur, apel, pir dan buah eksotis lainnya'),
(68, 'Citrus Delight Basket', 4, 11, 'Dominan jeruk, lemon, grapefruit - cocok untuk gaya hidup santai'),
(69, 'Tropical Mix Basket', 4, 11, 'Mangga, nanas, dan buah tropis lain dalam satu keranjang'),
(70, 'Vibrant Harvest Basket', 4, 11, 'Campuran buah berwarna cerah, cocok untuk hadiah atau hampers'),
(71, 'Healthy Gift Hamper', 4, 11, 'Buah & sayuran dalam keranjang rotan cantik cocok untuk bingkisan'),
(72, 'Organic Veggie Basket', 4, 11, 'Sayuran segar: timun, cabai, terong, paprika langsung dari petani lokal'),
(73, 'Farmer\'s Fresh Basket', 4, 11, 'Campuran buah dan sayur segar, idial untuk kebutuhan sehari hari');

-- --------------------------------------------------------

--
-- Table structure for table `product_image`
--

CREATE TABLE `product_image` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `price` decimal(11,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_image`
--

INSERT INTO `product_image` (`id`, `product_id`, `image`, `price`) VALUES
(1, 1, 'crispyfriedchicken.png', 25),
(2, 2, 'grilledchickenskewers.png', 30),
(3, 3, 'chickenmeatballswithcheese.png', 40),
(4, 4, 'buffalochickenwingswithfries.png', 60),
(5, 5, 'chickennachoswithsalsa.png', 45),
(6, 6, 'crispychickenrings.png', 45),
(7, 7, 'spicychickenplatter.png', 60),
(8, 8, 'sweetandspicychickenbites.png', 70),
(9, 9, 'grilledchickenwithchilisauce.png', 70),
(10, 10, 'goldenfriedchickenwithherbs.png', 60),
(11, 11, 'chiligarlicchickenplatter.png', 65),
(12, 12, 'beefwrapkebab.png', 20),
(13, 13, 'doublechickenkebabwrap.png', 28),
(14, 14, 'grilledkebabtacos.png', 30),
(15, 15, 'cheesykebabrollswithfries.png', 24),
(16, 16, 'beefpepperpizza.png', 35),
(17, 17, 'chickencaesarsalad.png', 22),
(18, 18, 'grilledveggiesalad.png', 16),
(19, 19, 'greengardensalad.png', 17),
(20, 20, 'beeftendersalad.png', 20),
(21, 21, 'crunchychickensalad.png', 20),
(22, 22, 'citrusshrimpsalad.png', 19),
(23, 23, 'tabboulehsalad.png', 23),
(24, 24, 'beefbulgogi.png', 27),
(25, 25, 'beefburger.png', 22),
(26, 26, 'beefcheeseburger.png', 21),
(27, 27, 'beefcheeseeggburger.png', 25),
(28, 28, 'fishburger.png', 19),
(29, 29, 'smokedbeefburger.png', 23),
(30, 30, 'chickenburger.png', 20),
(31, 31, 'caramelblissbox.jpg', 15),
(32, 32, 'doublechococrunch.jpg', 15),
(33, 33, 'blackberrychocoswirl.jpg', 16),
(34, 34, 'blueberrycupcheesecakedream.jpg', 16),
(35, 35, 'strawberrycreamdelight.jpg', 16),
(36, 36, 'berrychocowafflecookie.png', 13),
(37, 37, 'strawberrystuffedcookie.png', 14),
(38, 38, 'redvelvetcrinklecookie.png', 14),
(39, 39, 'cinamonwalnutcookie.png', 12),
(40, 40, 'chocochunkmarshmallowcookie.png', 14),
(41, 41, 'classicchocolatechipcookies.png', 11),
(42, 42, 'strawberrysundaedelight.png', 8),
(43, 43, 'chocolatelavaswirl.png', 7),
(44, 44, 'caramelnutcrunch.webp', 8),
(45, 45, 'rainbowtriplescoop.jpg', 10),
(46, 46, 'classicgelatomix.jpg', 12),
(47, 47, 'chocolateberrybliss.png', 9),
(48, 48, 'rockyroadbowl.png', 8),
(49, 49, 'cookiedoughbowl.png', 8),
(50, 50, 'neapolitanboat.png', 9),
(51, 51, 'tropicalsunseticecream.png', 11),
(52, 52, 'doublechococookiecup.png', 10),
(53, 53, 'nuttybrownieicecream.png', 8),
(54, 54, 'classicamericano.png', 4),
(55, 55, 'cafemochalove.png', 5),
(56, 56, 'caramellatteheart.png', 5),
(57, 57, 'boldblackbrew.png', 4),
(58, 58, 'vvanillalattebliss.png', 5),
(59, 59, 'strawberrysplash.png', 7),
(60, 60, 'tropicalpineapplejuice.png', 8),
(61, 61, 'orangeparadise.png', 8),
(62, 62, 'icechocoespresso.png', 7),
(63, 63, 'milkshaketrio.png', 12),
(64, 64, 'classicvanilashake.png', 7),
(65, 65, 'berrymintrefresher.png', 7),
(66, 66, 'chococherryshake.png', 7),
(67, 67, 'premiumfruitbasket.jpg', 11),
(68, 68, 'citrusdelightbasket.jpg', 13),
(69, 69, 'tropicalmixbasket.jpg', 11),
(70, 70, 'vibrantharvestbasket.jpg', 13),
(71, 71, 'healthygifthamper.jpg', 11),
(72, 72, 'organicveggiebasket.jpg', 13),
(73, 73, 'farmer\'sfreshbasket.jpg', 11);

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `name`, `category_id`) VALUES
(1, 'burger', 1),
(2, 'chicken', 1),
(3, 'kebab', 1),
(4, 'pizza', 1),
(5, 'salad', 1),
(6, 'coffee', 2),
(7, 'water', 2),
(8, 'boxice', 3),
(9, 'cookies', 3),
(10, 'icecream', 3),
(11, 'grocery', 4);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `user_type`) VALUES
(1, 'Winter', 'winterspa@gmail.com', '$2y$10$l0XDuzt/nlgGD4Da/EBSYuDbR6p9PMsfyhSlkOWEEIcZGnPNSz4HW', ''),
(2, 'Gagas', 'yasbeta@gg.com', '$2y$10$LZnmRG1qCzIs9w6TJ1wLBuogxDKyyY8L/489X8oBjpcK7vjVKjto.', '');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name_product` varchar(100) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `user_id`, `product_id`, `name_product`, `price`, `qty`) VALUES
(1, 0, 24, 'Beef Bulgogi', 27, 1),
(2, 0, 25, 'Beef Burger', 22, 1),
(3, 0, 3, 'Chicken Meatballs With Cheese Dip', 40, 2),
(5, 0, 15, 'Chessy Kebab Rolls with Fries', 24, 2),
(7, 2, 27, 'Beef Cheese Egg Burger', 25, 2),
(9, 2, 6, 'Crispy Chicken Rings', 45, 1),
(12, 2, 40, 'Choco Chunk Marshmallow Cookie', 14, 1),
(16, 2, 43, 'Chocolate Lava Swirl', 7, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_category_id` (`sub_category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_image`
--
ALTER TABLE `product_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `product_image`
--
ALTER TABLE `product_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `product_image`
--
ALTER TABLE `product_image`
  ADD CONSTRAINT `product_image_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD CONSTRAINT `sub_categories_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
