-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 14, 2021 at 11:46 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restaurantdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `name`, `email`, `password`) VALUES
(1, 'admin', 'admin@gmail.com', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `item_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(300) NOT NULL,
  `category` int(11) NOT NULL,
  `price` float NOT NULL,
  `img` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`item_id`, `title`, `description`, `category`, `price`, `img`) VALUES
(1, 'Hunan Style Mushroom', 'Buttons mushrooms with green capsicum & spring onions tossed in soy, chili & garlic', 1, 325, 'https://b.zmtcdn.com/data/dish_photos/4c6/d1845136e6194c1607238b1616fac4c6.jpg'),
(2, 'Peshawari Paneer Tikka', 'Cottage cheese marinated with mustard oil, yoghurt.', 1, 345, 'https://b.zmtcdn.com/data/dish_photos/887/0ef6a27af9d7697bbf4a8701ee6ef887.jpg'),
(3, 'Kadai Murgh', 'Chicken cooked with onion, green capsicum, Indian spices & fresh coriander', 1, 395, 'https://b.zmtcdn.com/data/dish_photos/e81/edd92511ff1b976d1ee3166d7264ae81.jpg'),
(4, 'Sun-Dried Tomato Pizza', 'An Spinasse Signature pizza Spinach, Arugula, Sun Dried Tomato, Pesto, Shredded Mozzarella Cheese, Feta cheese', 1, 265, 'https://b.zmtcdn.com/data/dish_photos/1f3/d3a72c0e0bdffc3fa92a210fb5f0e1f3.jpg'),
(5, 'Extravaganza Pizza', 'An Spinasse Signature pizza Mixed olives, Bell Pepper, Artichoke, Zucchini, Caper, Cherry Tomato, Mozzarella Cheese, Feta cheese', 1, 295, 'https://b.zmtcdn.com/data/dish_photos/ca2/70637de1022617e7ee999e6cf6975ca2.jpg'),
(6, 'Cake Fudge', 'Chocolate cake, two scoops of vanilla ice cream topped with chocolate sauce & nuts', 1, 245, 'https://b.zmtcdn.com/data/dish_photos/836/22f83750af02b10472a797cbc6e30836.jpg'),
(7, 'Herb Crusted Potato Wedges', 'Herb crusted potato wedges served with dipping sauce', 2, 215, 'https://b.zmtcdn.com/data/dish_photos/053/0470850546e6897dd33e329d28212053.jpg'),
(8, 'Beer Battered Onion Rings', 'Herb marinated onions battered with in house beer & deep fried. Served with Chili Mayonnaise', 2, 275, 'https://b.zmtcdn.com/data/dish_photos/cb4/464aab0ddd602cd8df45f6abc9311cb4.jpg'),
(9, 'Jalapeno Poppers', 'Chef’s Special Stuffed breaded Jalapeno with cheese, mixed vegetables, peanuts & deep fried', 2, 245, 'https://b.zmtcdn.com/data/dish_photos/51c/1ba3b40c8755bac8fc589403c1f2e51c.jpg'),
(10, 'Palak Paneer', 'Indian cottage cheese cooked with cumin & chili in a creamy spinach gravy', 3, 345, 'https://b.zmtcdn.com/data/dish_photos/34f/7515722dfe211266a19cf412d069134f.jpg'),
(11, 'Paneer Khurchan', 'Slow-cooked shredded chicken in a tomato, ginger coriander gravy & tempered with mustard seeds', 3, 395, 'https://b.zmtcdn.com/data/dish_photos/8c9/e1869c7ef31eb39602bcc91ea777e8c9.jpg'),
(12, 'Murgh Makhani', 'Chicken tikka cooked in a creamy tomato & cashew gravy', 3, 395, 'https://b.zmtcdn.com/data/dish_photos/ed1/cf3792852b6e73d245181f1938485ed1.jpg'),
(13, 'Ghee Rice', 'Dry nuts and ghee tossed with aromatic basmati rice.', 4, 195, 'https://b.zmtcdn.com/data/dish_photos/44a/63c4b8a426dcd1c5484f2165df59444a.jpg'),
(14, 'Peas Pulao', 'Green peas and ghee tossed with basmati rice.', 4, 225, 'https://b.zmtcdn.com/data/dish_photos/baa/e452e0b1aa2d87af2d43e334a83adbaa.jpg'),
(15, 'Dum Biryani', 'Vegetables, whole spices, coriander, mint & yogurt cooked together with basmati rice', 4, 245, 'https://b.zmtcdn.com/data/dish_photos/328/2798a54748531cda3071f017dc14f328.jpg'),
(16, 'Fried Rice', 'Stir-fried rice tossed with aromatic vegetables.', 5, 245, 'https://b.zmtcdn.com/data/dish_photos/8f3/1db12f0f5d28144c1e74c9c20a59d8f3.jpg'),
(17, 'Schezwan Fried Rice', 'Stir-fried rice & assorted vegetables tossed with Schezwan chili paste', 5, 245, 'https://b.zmtcdn.com/data/dish_photos/fe7/5cf78ffb7006ff573e6ed01087b4afe7.jpg'),
(18, 'Schezwan Noodles', 'Stir-fried noodles tossed with Schezwan chili paste & vegetables', 5, 245, 'https://b.zmtcdn.com/data/dish_photos/5eb/4e85ed7d8a0ea3bdb6967176e16d85eb.jpg'),
(19, 'Extravaganza Pizza', 'Signature pizza Mixed olives, Bell Pepper, Artichoke, Zucchini, Caper, Cherry Tomato, Mozzarella Cheese, Feta cheese', 6, 295, 'https://b.zmtcdn.com/data/dish_photos/ca2/70637de1022617e7ee999e6cf6975ca2.jpg'),
(20, 'Mediterranean Pizza', 'A classic Italian pizza Baby Spinach, Baby Rocket Lettuce, Wine Poached Onion', 6, 255, 'https://b.zmtcdn.com/data/dish_photos/895/042cbced882cd769082983a15909e895.jpg'),
(21, 'Tex Mex Pizza', 'Mexican style fusion pizza Black Beans, Corn, Bell Pepper, Jalapeno, Chipotle Chili.', 6, 295, 'https://b.zmtcdn.com/data/dish_photos/e4a/800acfa077339f497d9d2ec1bdbc9e4a.jpg'),
(22, 'Fruit Salad with Ice Cream', 'Mixed fruits topped with jelly, apricot, cream & two scoops of vanilla ice cream', 7, 255, 'https://b.zmtcdn.com/data/dish_photos/19b/3819bba7ac3d22fc30c8cb31025d319b.jpg'),
(23, 'Death By Chocolate', 'Chef’s Special Rich chocolate cake topped with three scoops of vanilla ice cream, chocolate sauce', 7, 295, 'https://b.zmtcdn.com/data/dish_photos/2ec/2d59fccb8d9a6f386f7931cadc69c2ec.jpg'),
(24, 'Supreme Oreo', 'Rich chocolate cake, two scoops of vanilla ice cream, Oreo Crumble, pineapple compote', 7, 245, 'https://b.zmtcdn.com/data/dish_photos/a3f/4c76bf349a304dee875c8e8b248eba3f.jpg'),
(25, 'Tofu Hot Pot', 'Tofu, Shitake mushroom, simmered in an exotic blend of Chef’s special sauce', 1, 295, 'https://b.zmtcdn.com/data/dish_photos/799/4d097fbe0980eac2e76804ef805a5799.jpg'),
(26, 'Schezwan Chili Prawn', 'Prawns, onion, bell pepper, scallion tossed with a spicy hot chili garlic sauce', 1, 425, 'https://b.zmtcdn.com/data/dish_photos/167/165364bdd54a943881cc7650c1919167.jpg'),
(27, 'Chicken Wings', 'Chef’s Special Crumb fried chili lemongrass marinated chicken wings.', 2, 345, 'https://b.zmtcdn.com/data/dish_photos/134/1e5ae98486a45d737d5204091ef83134.jpg'),
(28, 'Mushroom Hara Pyaza', 'Button mushroom & spring onion in an aromatic tomato gravy', 3, 345, 'https://b.zmtcdn.com/data/dish_photos/8f5/ca0d4c984485e26a770b63554a4268f5.jpg'),
(29, 'Dal Khichadi', 'Rice and lentil slow cooked together with Indian spices.', 4, 175, 'https://b.zmtcdn.com/data/dish_photos/8ea/c45755d41791543914e2bff165df28ea.jpg'),
(30, 'Steamed Rice', 'Freshly steamed Basmati rice', 5, 125, 'https://b.zmtcdn.com/data/dish_photos/225/b50993b12a6db94226a7ba705f353225.jpg'),
(31, 'Tandoori Delight', 'A Fusion pizza Tandoori Paneer, Mushroom, Onion, Corn, Shredded Mozzarella Cheese', 6, 295, 'https://b.zmtcdn.com/data/dish_photos/292/4de8ac857373faf857313ed38082e292.jpg'),
(32, 'Sacher Torte', 'Light chocolate cake layered with apricot jam & coated with chocolate icing', 7, 195, 'https://b.zmtcdn.com/data/dish_photos/6df/7981caf934b74f1a0f06eb44f09a96df.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` varchar(300) NOT NULL,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `item_id`, `price`, `time`) VALUES
('89db4f94-2fa4-4528-a25e-7158beb666b0', 1, 23, 295, '2021-09-14 15:01:43'),
('a18441e4-ec2a-42c2-a377-92f2534db287', 1, 18, 245, '2021-09-14 15:01:43'),
('d33df2c7-6b71-4c39-a127-483269dff605', 1, 9, 245, '2021-09-14 15:01:43'),
('fe2b05a9-329e-43c8-9846-52913f6dd7fe', 1, 19, 295, '2021-09-14 15:01:43');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `name`, `email`, `password`) VALUES
(1, 'Aakash', 'aakash@gmail.com', '1234'),
(2, 'Ganesh', 'ganesh@gmail.com', '1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
