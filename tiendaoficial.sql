-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-11-2017 a las 14:52:04
-- Versión del servidor: 10.1.25-MariaDB
-- Versión de PHP: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda_master`
--
CREATE DATABASE IF NOT EXISTS `tienda_master` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `tienda_master`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELACIONES PARA LA TABLA `categories`:
--

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `color`) VALUES
(1, 'Ropa Deportiva', 'ropa deportiva', 'ropa de deportiva segun los ejercicios que desea realizar', '#8000ff'),
(2, 'Ropa de Gala', 'ropa de gala', 'ropa para ocaciones especiales, y de forma muy elegante', '#0B2F3A'),
(3, 'Ropa Casual', 'ropa-casual', 'ropa para cualquier ocasión y en todo momento', '#73d5d2'),
(4, 'Ropa de Playa', 'ropa-de-playa', 'ropa de baño para hombre y mujer', '#80ff80'),
(5, 'Ropa De Invierno', 'ropa-de-invierno', 'para esa temporada fría, siempre es necesario ropa que nos proteja del frió.', '#2d46aa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELACIONES PARA LA TABLA `migrations`:
--

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

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `shipping` decimal(10,2) NOT NULL,
  `estado` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELACIONES PARA LA TABLA `orders`:
--   `user_id`
--       `users` -> `id`
--

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`id`, `subtotal`, `shipping`, `estado`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '275.00', '100.00', 'no cancelado', 3, '2017-04-26 18:37:49', '2017-04-26 18:37:49'),
(2, '138.00', '100.00', 'no cancelado', 4, '2017-04-27 10:03:15', '2017-04-27 10:03:15'),
(3, '100.00', '100.00', 'no cancelado', 4, '2017-05-14 03:14:59', '2017-05-14 03:14:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order_items`
--

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELACIONES PARA LA TABLA `order_items`:
--   `order_id`
--       `orders` -> `id`
--   `product_id`
--       `products` -> `id`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELACIONES PARA LA TABLA `password_resets`:
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

DROP TABLE IF EXISTS `products`;
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
-- RELACIONES PARA LA TABLA `products`:
--   `category_id`
--       `categories` -> `id`
--

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `description`, `extract`, `price`, `image`, `visible`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'vestido corto', 'vestido-corto', 'un vestido que permite sentirse cómoda y elegante a la vez, muestra un grado de juventud y belleza para cualquiera.', 'tela de seda', '240.00', 'http://www.vestidosde.info/wp-content/uploads/2010/09/vestidos-fiesta-cortos-3.jpg', 1, 2, '2017-10-31 10:32:46', '2017-10-31 10:40:42'),
(2, 'conjunto de futbol', 'conjunto-de-futbol', 'para poder jugar mejor al futbol con ropa duradera ante cualquier deporte de contacto', 'tela poliestireno', '150.00', 'http://ropademodaparamujer.com/wp-content/uploads/2015/10/ropa-deportiva-de-futbol-dise%C3%B1o.jpg?w=240', 1, 1, '2017-10-31 09:23:09', '2017-10-31 09:23:09'),
(3, 'chaqueta deportiva', 'chaqueta-deportiva', 'para hacer ejercicio en tiempos fríos.', 'tela sintetica impermeable', '80.00', 'http://lp2.hm.com/hmprod?set=source[/model/2017/F00%200562615%20001%2066%202077.jpg],type[STILLLIFE_FRONT]&hmver=1&call=url[file:/product/style]', 1, 1, '2017-10-31 09:46:59', '2017-10-31 09:46:59'),
(4, 'traje varonil juvenil', 'traje-varonil-juvenil', 'para ocaciones especiales un traje que llamara la atención, con encajes bien sólidos y acabado clasico.', 'tela spack', '500.00', 'https://www.dhresource.com/0x0s/f2-albu-g2-M00-5A-A5-rBVaG1U9ncKAEq-IAABdObCbK2w018.jpg/high-quality-light-grey-peak-lapel-one-button.jpg', 1, 2, '2017-10-31 10:40:08', '2017-10-31 10:40:31'),
(5, 'soleras femeninas', 'soleras-femeninas', 'se acomodan al cuerpo, dando mayor flexibilidad para realizar deportes', 'telas elasticas', '40.00', 'https://http2.mlstatic.com/D_Q_NP_160011-MLA20456340970_102015-Q.jpg', 1, 1, '2017-10-31 09:55:03', '2017-10-31 09:56:28'),
(6, 'smoking clasico para niños', 'smoking-clasico-para-ninos', 'tendencia para niños que tienen presentaciones en sociedad, y una muestra de clase invaluable, se tuvo en cuenta la movilidad del niño y acabados muy fuertes en los laterales', 'tela de seda brian', '500.00', 'https://www.elrastrillodemama.com/images/puericultura/mihijoesunregalodenavidad/mihijoesunregalodenavidad026.jpg', 1, 2, '2017-10-31 10:45:43', '2017-10-31 10:46:03'),
(7, 'polera de beisbol', 'polera-de-beisbol', 'para ir a ver los partidos o jugar entre amigos un deporte que apasiona a muchos', 'algodon', '100.00', 'https://sc01.alicdn.com/kf/HTB1Ze3hXhDBK1JjSZFxq6xHlFXay/229783874/HTB1Ze3hXhDBK1JjSZFxq6xHlFXay.jpg', 1, 1, '2017-10-31 09:49:38', '2017-10-31 09:49:38'),
(31, 'conjunto para niños', 'conjunto-para-ninos', 'para que los niños puedan jugar sintiéndose libres, de la forma mas cómoda y ejercitándose para cualquier disciplina', 'tela sintetica', '120.00', 'https://ae01.alicdn.com/kf/HTB19LpZJXXXXXacapXXq6xXFXXXK/Oto-o-ni-os-de-la-ropa-moda-ropa-deportiva-de-alta-calidad-Unisex-ni-os.jpg', 1, 1, '2017-10-31 09:33:34', '2017-10-31 09:33:34'),
(34, 'medias deportivas', 'medias-deportivas', 'medias para cualquier deporte', 'algondon', '20.00', 'http://www.coverture.es/images/image/Barato%20Calcetines%20X-Bionic%20Run%20Speed%20Two%20rojo%20negro%20Ropa%20Compresi%20n%20Running%20de%20Hombre%20IX403.jpg', 1, 1, '2017-10-31 09:52:45', '2017-10-31 09:56:37'),
(36, 'pantalon deportivo', 'pantalon-deportivo', 'para realizar deportes con una gran comodidad', 'tela sintetica impermeable', '35.00', 'http://i.ebayimg.com/00/s/MTAwMFgxMDAw/z/nZQAAOSwpDdVHXAT/$_35.jpg', 1, 1, '2017-10-31 10:08:01', '2017-10-31 10:08:01'),
(37, 'chaqueta de motociclista', 'chaqueta-de-motociclista', 'para evitar raspones y ser visto por los automóviles, un adecuado atuendo siempre es necesario', 'impermeable resistente a fuerte fricción.', '220.00', 'https://i2.wp.com/www.sierrabmwonline.com/images/BMW_GS_DRY_JACKET_GREY.JPG?resize=462%2C382', 1, 1, '2017-10-31 10:22:24', '2017-10-31 10:22:24'),
(38, 'short', 'short', 'para tener flexibilidad, rapidez y buen ritmo en cualquier deporte, es necesario tener un short que le permita moverse adecuadamente.', 'tela elastica', '0.01', 'http://www.joma-sport.com/files/0001/jomabeta987543098359809538245098/web.system/assets/products/20170221100637.100590.700.jpg', 1, 1, '2017-10-31 10:26:25', '2017-11-01 16:57:46'),
(39, 'vestido largo', 'vestido-largo', 'para lucir radiante en ocaciones especiales, este vestido largo le permite encajar bien con múltiples accesorios\r\n', 'tela poliestireno', '300.00', 'http://www.edressit.com/ProductImages/s174x262/201703/bbad76ad-2298-4359-99b6-4939bd5a0908.jpg', 1, 2, '2017-10-31 10:29:30', '2017-10-31 10:29:30'),
(42, 'traje de niño clasico', 'traje-de-nino-clasico', 'con colores llamativos y bien sólidos, se mostrara una elegancia desde su temprana edad y con un muy tierno desglose social', 'tela chenil', '410.00', 'https://vestidosdenina.com/wp-content/uploads/2015/11/2015-oto%C3%B1o-vestidos-fiesta-para-los-ni%C3%B1os-ni%C3%B1o-esmoquin-muchachos-calientes-de-la-venta-traje-del.jpg', 1, 2, '2017-10-31 10:43:37', '2017-10-31 10:43:37'),
(44, 'vestido de primera comunion', 'vestido-de-primera-comunion', 'aunque el color sea el mismo para todas, el estilo, clase y forma, se ven muy bien reflejados en quien tome este vestido.', 'tela mellis', '470.00', 'https://ropadenina.com/wp-content/uploads/2016/03/vestido-infantil-de-moda.jpg', 1, 2, '2017-10-31 10:48:56', '2017-10-31 10:48:56'),
(45, 'chamarra de invierno cafe', 'chamarra-de-invierno-cafe', 'hermoso y perfecto para mantenerse refugiado de los climas bajos, esta chamarra tiene bastante prioridad cuando de vestir bien y utilidad se hablan.', 'algodon', '310.00', 'http://www.1001consejos.com/wp-content/uploads/2012/05/chamarra-de-invierno-cafe.jpg', 1, 5, '2017-10-31 10:58:09', '2017-10-31 10:58:09'),
(46, 'blusa azul', 'blusa-azul', 'blusa para toda ocasión, muy ligera y cómoda', 'tela chame', '85.00', 'http://www.confepar.es/images/confepar/Promociones%20Tienda%20Ropa%20Online%20Barata%20-%20Elegante%20Cuello%20Hundiendo%20Anudado%20Color%20S%C3%B3lido%20A%20Largo%20Alarma%20Azul%20Blusa%20De%20La%20Manga%20Madrid%205079.jpg', 1, 3, '2017-10-31 14:51:32', '2017-10-31 14:51:32'),
(47, 'blusa floreada', 'blusa-floreada', 'una blusa muy cómoda ideal para un día normal y casual, ademas de brindar un aire de serenidad en su entorno.', 'tela simple', '45.00', 'https://image.jimcdn.com/app/cms/image/transf/dimension=1920x400:format=png/path/sd3459319d209cc45/image/icd5d47fd236678ea/version/1488924464/image.png', 1, 3, '2017-10-31 14:54:02', '2017-10-31 14:54:02'),
(48, 'chamarra de hormbre', 'chamarra-de-hormbre', 'contra una mala temperatura y necesario para lucir un buen gusto esta chamarra viene de un lote con mucha dedicación y garantías de ser una buena inversión,', 'tela gruesa e impermeable', '340.00', 'http://cdn.snowboarding.transworld.net/blogs.dir/442/files/2016/09/oakley-razorbackbzijacket-sr-2017.jpg', 1, 5, '2017-10-31 14:56:38', '2017-10-31 14:56:38'),
(49, 'conjunto blanco y negro', 'conjunto-blanco-y-negro', 'un conjunto casual para tener momentos cómodos y libres de poder hacer cualquier actividad en grupo.', 'algodon', '110.00', 'https://sc01.alicdn.com/kf/HTB1LrOTQVXXXXaYXVXXq6xXFXXX9/SN3138-2017-women-s-striped-new-two.jpg', 1, 3, '2017-10-31 16:19:10', '2017-10-31 16:19:10'),
(50, 'pantalon de tela juvenil', 'pantalon-de-tela-juvenil', 'pantalon para la mejor presentacion juvenil y con un estilo elegante que marca perfectamente la estetica', 'tela pers', '70.00', 'https://ae01.alicdn.com/kf/HTB17Xe5LXXXXXb7XVXXq6xXFXXX2/Estilo-de-La-Moda-de-los-hombres-Pantalones-Largos-de-Cuerpo-Entero-Ropa-Casual-Masculina-Pantalones.jpg_640x640.jpg', 1, 3, '2017-10-31 16:23:22', '2017-10-31 16:23:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
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
-- RELACIONES PARA LA TABLA `users`:
--

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `last_name`, `email`, `user`, `password`, `type`, `active`, `address`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Oved', 'FiSo', 'ovedfs@gmail.com', 'ovedfs', '$2y$10$7KqspYf1rqLf2ri/cHhTkeVzYebWjDkcBhNdh22flXxrZUTlEBTnq', 'admin', 1, 'San Cosme 290, Cuauhtemoc, D.F.', NULL, '2017-04-26 18:32:51', '2017-04-26 18:32:51'),
(2, 'Adela', 'Torres', 'adela@correo.com', 'adela', '$2y$10$Wf.SLonkZiHueSwiHnpy.umu0vTSVjN5ihbHVOP8.bRxpjcTNjs72', 'user', 1, 'Tonala 321, Jalisco', NULL, '2017-04-26 18:32:51', '2017-04-26 18:32:51'),
(3, 'bismarck', 'arredondo', 'bismarckarojas@gmail.com', 'bismarck', '$2y$10$8QkiaBTcfprTRdZe0Jdpe.UOtruLujIpa/jOImekB1PsZK20Y6jGi', 'admin', 1, 'sdhcfsddfhgsdf', NULL, '2017-04-26 18:34:24', '2017-04-26 18:34:24'),
(4, 'Carlos', 'Villegas', 'carlosedu.villegas@gmail.com', 'ceva', '$2y$10$YvfqmeRYhoPUuDV/7KOu4.QdAC5cyEbCS/o4.azcQJZ.8YXSd02JO', 'admin', 1, 'k6 doble via La gyardia B/Santa cruz 2000', 'fGQYPjs4WXe7XBK1Y13UClpZWOFuoomPzXu41rfrwtYZ8NMZJxgCtaMcaWaI', '2017-04-27 06:18:09', '2017-04-27 08:58:04'),
(5, 'jossep', 'pinto', 'admin@h.com', 'jossep', '$2y$10$abFlTtixXxZuhJxw2hbHduQVd1JxfOinLHz1U/Jvq1lRpfOOuQZgW', 'admin', 1, 'cualquiera', 'nrlwbQ73ytesCVTa2tJJFepihvF0oTjSpCqDufJsIVywOfb3OiV4iCWaJn2a', '2017-10-19 01:47:20', '2017-10-31 16:36:04');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
