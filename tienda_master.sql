-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-10-2017 a las 14:39:29
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda_master`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `color`) VALUES
(7, 'Ropa deportiva', 'ropa-deportiva', 'Toda clase de ropa deportiva para varones y mujeres.', '#df7d11'),
(8, 'Accesorios para vehiculos', 'accesorios-para-vehiculos', 'Todo tipo de accesorios para vehículos.', '#000000'),
(9, 'Camara y accesorios', 'camara-y-accesorios', 'Camaras de todo tipo y sus respectivos accesorios.', '#000000'),
(10, 'Celulares y telefonos', 'celulares-y-telefonos', 'Encuentra todos los modelos de celulares.', '#000000'),
(11, 'Electrodomesticos', 'electrodomesticos', 'Encuentra todo tipo de electrodomésticos para el hogar', '#000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2015_07_01_095505_create_categories_table', 1),
('2015_07_01_095519_create_products_table', 1),
('2015_08_23_202538_create_orders_table', 1),
('2015_08_23_202546_create_order_items_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `shipping` decimal(10,2) NOT NULL,
  `estado` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order_items`
--

CREATE TABLE `order_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `extract` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `image` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `description`, `extract`, `price`, `image`, `visible`, `category_id`, `created_at`, `updated_at`) VALUES
(29, 'Polera de Mkhitaryan', 'polera-de-mkhitaryan', 'Polera deportiva del equipo Borussia Dortmund, del jugador Mkhitaryan', 'Polera de Mkhitaryan', '210.00', 'http://www.worldsoccershop.us.com/images/products/soccer_jerseys/club/Borussia-Dortmund/fc-Borussia-Dortmund2015_036.jpg', 1, 7, '2017-10-10 04:37:53', '2017-10-10 05:09:51'),
(30, 'Polera de Ibrahimovic', 'polera-de-ibrahimovic', 'Polera de Ibrahimovic del equipo Paris Saint Germain', 'Polera de Ibrahimovic', '210.00', 'http://www.jerseystore.football/images/paris-saint-germain/paris-saint-germain-zlatan-ibrahimovic-2015-16-navy-youth-jersey.jpg', 1, 7, '2017-10-10 05:05:25', '2017-10-10 05:07:25'),
(31, 'polera de mandzukic', 'polera-de-mandzukic', 'polera de mandzukic del equipo Juventus', 'polera de mandzukic', '200.00', 'http://www.wheatley.es/images/pic/Emq6hJKc-777.jpg', 1, 7, '2017-10-10 05:09:16', '2017-10-10 05:09:16'),
(32, 'Pyle Estereos Plmr22bt Bluetooth Usb Sd Mp3 Aux', 'pyle-estereos-plmr22bt-bluetooth-usb-sd-mp3-aux', 'Pyle Estereos Plmr22bt Bluetooth Usb Sd Mp3 Aux', 'Pyle Estereos Plmr22bt Bluetooth Usb Sd Mp3 Aux', '999.99', 'https://http2.mlstatic.com/pyle-estereos-plmr22bt-bluetooth-usb-sd-mp3-aux-D_NQ_NP_648328-MLA25873379303_082017-F.webp', 1, 8, '2017-10-10 05:14:25', '2017-10-10 05:14:25'),
(33, 'Bateria Para Autos Willard 12x65', 'bateria-para-autos-willard-12x65', 'Bateria Para Autos Willard 12x65', 'Bateria Para Autos Willard 12x65', '999.99', 'https://http2.mlstatic.com/bateria-para-autos-willard-12x65-cambio-bateria-a-domicilio-D_NQ_NP_247405-MLA25017650620_082016-F.webp', 1, 8, '2017-10-10 05:16:29', '2017-10-10 05:16:29'),
(34, 'Aspiradora Auto 12v Av1500 Black Decker ', 'aspiradora-auto-12v-av1500-black-decker', 'Aspiradora Auto 12v Av1500 Black Decker ', 'Aspiradora Auto 12v Av1500 Black Decker ', '950.00', 'https://http2.mlstatic.com/aspiradora-auto-12v-av1500-black-decker-portatil-5accesorios-D_NQ_NP_953883-MLA26018329918_092017-F.webp', 1, 8, '2017-10-10 05:19:53', '2017-10-10 05:19:53'),
(35, 'Celular Samsung Galaxy J7', 'celular-samsung-galaxy-j7', 'Celular Samsung Galaxy J7 2016 Libre 4g 16gb Original J710m', 'Celular Samsung Galaxy J7', '999.99', 'https://http2.mlstatic.com/celular-samsung-galaxy-j7-2016-libre-4g-16gb-original-j710m-D_NQ_NP_957451-MLA26012770606_092017-F.webp', 1, 10, '2017-10-10 05:23:10', '2017-10-10 05:23:10'),
(36, 'Motorola Moto G4 4ta Gen ', 'motorola-moto-g4-4ta-gen', 'Motorola Moto G4 4ta Gen 4g Lte 16gb Ram 2gb Libre Gtia', 'Motorola Moto G4 4ta Gen ', '999.99', 'https://http2.mlstatic.com/motorola-moto-g4-4ta-gen-4g-lte-16gb-ram-2gb-libre-gtia-D_NQ_NP_911051-MLA26124156918_102017-F.webp', 1, 10, '2017-10-10 05:24:12', '2017-10-10 05:24:12'),
(37, 'Samsung A5 2017 32gb', 'samsung-a5-2017-32gb', 'Samsung A5 2017 32gb 16/16mpx Local A La Calle Fact A O B', 'Samsung A5 2017 32gb', '999.99', 'https://http2.mlstatic.com/samsung-a5-2017-32gb-1616mpx-local-a-la-calle-fact-a-o-b-D_NQ_NP_801315-MLA25546620044_042017-F.webp', 1, 10, '2017-10-10 05:26:34', '2017-10-10 05:26:34'),
(38, 'Heladera Mabe No Frost 295 Ltrs.', 'heladera-mabe-no-frost-295-ltrs', 'Heladera Mabe No Frost 295 Ltrs.', 'Heladera Mabe No Frost 295 Ltrs.', '999.99', 'https://http2.mlstatic.com/heladera-mabe-no-frost-295-ltrs-hma335nfmd-D_NQ_NP_684413-MLA25857364761_082017-F.webp', 1, 11, '2017-10-10 05:28:19', '2017-10-10 05:28:19'),
(39, 'Lavarropas Lg F1389pd 8.5kg', 'lavarropas-lg-f1389pd-85kg', 'Lavarropas Lg F1389pd 8.5kg', 'Lavarropas Lg F1389pd 8.5kg', '999.99', 'https://http2.mlstatic.com/lavarropas-lg-f1389pd-85kg-1200rpm-carga-frontal-D_NQ_NP_976637-MLA25618275050_052017-F.webp', 1, 11, '2017-10-10 05:29:33', '2017-10-10 05:29:33'),
(40, 'Smart Tv Philco Pld3216 32', 'smart-tv-philco-pld3216-32', 'Smart Tv Philco Pld3216 32', 'Smart Tv Philco Pld3216 32', '999.99', 'https://http2.mlstatic.com/smart-tv-philco-pld3216-32-netflix-D_NQ_NP_825669-MLA25801565597_072017-F.webp', 1, 11, '2017-10-10 05:30:16', '2017-10-10 05:30:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('user','admin','repartidor') COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `last_name`, `email`, `user`, `password`, `type`, `active`, `address`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Oved', 'FiSo', 'ovedfs@gmail.com', 'ovedfs', '$2y$10$7KqspYf1rqLf2ri/cHhTkeVzYebWjDkcBhNdh22flXxrZUTlEBTnq', 'admin', 1, 'San Cosme 290, Cuauhtemoc, D.F.', NULL, '2017-04-26 18:32:51', '2017-04-26 18:32:51'),
(2, 'Adela', 'Torres', 'adela@correo.com', 'adela', '$2y$10$Wf.SLonkZiHueSwiHnpy.umu0vTSVjN5ihbHVOP8.bRxpjcTNjs72', 'user', 1, 'Tonala 321, Jalisco', NULL, '2017-04-26 18:32:51', '2017-04-26 18:32:51'),
(3, 'bismarck', 'arredondo', 'bismarckarojas@gmail.com', 'bismarck', '$2y$10$8QkiaBTcfprTRdZe0Jdpe.UOtruLujIpa/jOImekB1PsZK20Y6jGi', 'admin', 1, 'sdhcfsddfhgsdf', NULL, '2017-04-26 18:34:24', '2017-04-26 18:34:24'),
(4, 'Carlos', 'Villegas', 'carlosedu.villegas@gmail.com', 'ceva', '$2y$10$YvfqmeRYhoPUuDV/7KOu4.QdAC5cyEbCS/o4.azcQJZ.8YXSd02JO', 'admin', 1, 'k6 doble via La gyardia B/Santa cruz 2000', 'Jzi6i4MCMCiaISitg3vr5SUvrsycWf3yXSkkZXvqApM5sZVTuPh2kt4nEgo2', '2017-04-27 06:18:09', '2017-09-26 17:34:04');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_user_unique` (`user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
