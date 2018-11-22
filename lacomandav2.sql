-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-11-2018 a las 17:10:37
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `lacomandav2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id` int(11) NOT NULL,
  `usuario` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `clave` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `sector` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `estado` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `perfil` varchar(50) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id`, `usuario`, `clave`, `sector`, `estado`, `perfil`) VALUES
(1, 'amorelli@gmail.com', '1234', 'Dueño', 'Activo', 'admin'),
(9, 'elbarman1', '1234', 'barra', 'suspendido', 'empleado'),
(10, 'candyman', '1234', 'candy bar', 'Activo', 'empleado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `numero` int(8) UNSIGNED ZEROFILL NOT NULL,
  `mesa` int(5) UNSIGNED ZEROFILL NOT NULL,
  `importe` int(11) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`numero`, `mesa`, `importe`, `fecha`) VALUES
(00000001, 00001, 310, '2018-05-03'),
(00000002, 00002, 570, '2018-06-01'),
(00000003, 00002, 410, '2018-06-05'),
(00000004, 00003, 390, '2018-07-10'),
(00000005, 00001, 80, '2018-11-15'),
(00000006, 00002, 80, '2018-11-15'),
(00000007, 00004, 0, '2018-11-15'),
(00000008, 00002, 0, '2018-11-15'),
(00000009, 00001, 0, '2018-11-15'),
(00000010, 00003, 80, '2018-11-15'),
(00000011, 00004, 0, '2018-11-15'),
(00000012, 00005, 0, '2018-11-15'),
(00000013, 00006, 0, '2018-11-15'),
(00000014, 00001, 70, '2018-11-15'),
(00000015, 00002, 70, '2018-11-15'),
(00000016, 00003, 0, '2018-11-15'),
(00000017, 00003, 70, '2018-11-15'),
(00000018, 00003, 0, '2018-11-19'),
(00000019, 00002, 0, '2018-11-19'),
(00000020, 00001, 540, '2018-11-19'),
(00000021, 00002, 520, '2018-11-19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesas`
--

CREATE TABLE `mesas` (
  `idMesa` int(5) UNSIGNED ZEROFILL NOT NULL,
  `estado` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `canUsos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `mesas`
--

INSERT INTO `mesas` (`idMesa`, `estado`, `canUsos`) VALUES
(00001, 'Cerrada', 20),
(00002, 'con cliente esperando pedido', 85),
(00003, 'Cerrada', 16),
(00004, 'con cliente esperando pedido', 5),
(00005, 'con cliente esperando pedido', 7),
(00006, 'con cliente esperando pedido', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidodetalle`
--

CREATE TABLE `pedidodetalle` (
  `idDetalle` int(11) NOT NULL,
  `idPedido` int(5) UNSIGNED ZEROFILL NOT NULL,
  `producto` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `estado` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `tiempoPreparacion` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `tiempoServido` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `sector` varchar(50) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `pedidodetalle`
--

INSERT INTO `pedidodetalle` (`idDetalle`, `idPedido`, `producto`, `idEmpleado`, `estado`, `tiempoPreparacion`, `tiempoServido`, `sector`) VALUES
(1, 00001, 'Coca-cola', 0, 'facturado', '2018/11/19 16:27', '2018/11/19 16:17', 'barra'),
(2, 00001, 'Cerveza', 0, 'facturado', '2018/11/14 1:35', '2018/11/19 16:16', 'chopera'),
(3, 00002, 'Coca-cola', 0, 'facturado', '2018/11/14 2:02', '2018/11/15 2:41', 'barra'),
(4, 00003, 'Coca-cola', 0, 'facturado', '2018/11/14 2:41', '2018/11/15 2:41', 'barra'),
(5, 00004, 'Cerveza', 0, 'listo para servir', '1970/01/01 1:00', '2018/11/19 16:16', 'chopera'),
(6, 00005, 'Cerveza', 0, 'listo para servir', '2018/11/19 16:26', '2018/11/19 16:16', 'chopera'),
(7, 00006, 'Cerveza', 0, 'en preparacion', '2018/11/15 5:19', '2018/11/19 16:16', 'chopera'),
(8, 00007, 'Cerveza', 0, 'en preparacion', '2018/11/15 5:22', '2018/11/22 2:37', 'chopera'),
(9, 00008, 'Cerveza', 0, 'facturado', '2018/11/15 5:26', '2018/11/15 5:21', 'chopera'),
(10, 00009, 'Frutillas con crema', 0, 'facturado', '2018/11/19 16:27', '2018/11/19 16:17', 'candy'),
(11, 00009, 'Torta de chocolate', 0, 'facturado', '2018/11/19 16:27', '2018/11/19 16:17', 'candy'),
(12, 00010, 'Trago', 0, 'facturado', '', '', 'barra'),
(13, 00010, 'Cerveza', 0, 'facturado', '', '', 'chopera'),
(14, 00010, 'Cerveza', 0, 'facturado', '', '', 'chopera'),
(15, 00010, 'Cerveza', 0, 'facturado', '', '', 'chopera'),
(16, 00010, 'Fanta', 0, 'facturado', '', '', 'barra'),
(17, 00010, 'Pizza', 0, 'facturado', '', '', 'cocina'),
(18, 00010, 'Milanesa con papas', 0, 'facturado', '', '', 'cocina'),
(19, 00010, 'Torta de chocolate', 0, 'facturado', '', '', 'candy'),
(20, 00010, 'Empanadas', 0, 'facturado', '', '', 'cocina'),
(21, 00010, 'Flan', 0, 'facturado', '', '', 'candy'),
(22, 00010, 'Helado', 0, 'facturado', '', '', 'candy'),
(23, 00010, 'Torta de chocolate', 0, 'facturado', '', '', 'candy'),
(24, 00011, 'Coca-cola', 0, 'facturado', '2018/11/19 16:27', '2018/11/19 16:17', 'barra'),
(25, 00011, 'Cerveza', 0, 'facturado', '2018/11/19 16:36', '2018/11/19 16:16', 'chopera'),
(26, 00011, 'Pizza', 0, 'facturado', '2018/11/19 16:27', '2018/11/19 16:17', 'cocina'),
(27, 00011, 'Flan', 0, 'facturado', '2018/11/19 16:28', '2018/11/19 16:18', 'candy'),
(28, 00012, 'Coca-cola', 0, 'facturado', '2018/11/19 16:27', '2018/11/19 16:17', 'barra'),
(29, 00012, 'Cerveza', 0, 'facturado', '2018/11/19 16:26', '2018/11/19 16:16', 'chopera'),
(30, 00012, 'Pizza', 0, 'facturado', '2018/11/19 16:47', '2018/11/19 16:17', 'cocina'),
(31, 00012, 'Helado', 0, 'facturado', '2018/11/19 16:28', '2018/11/19 16:18', 'candy'),
(32, 00012, 'Torta de chocolate', 0, 'facturado', '2018/11/19 16:28', '2018/11/19 16:18', 'candy'),
(33, 00013, 'Coca-cola', 0, 'en preparacion', '2018/11/22 4:35', '', 'barra'),
(34, 00013, 'Cerveza', 0, 'en preparacion', '2018/11/22 4:49', '', 'chopera'),
(35, 00013, 'Pizza', 0, 'en preparacion', '2018/11/22 4:59', '', 'cocina'),
(36, 00013, 'Fanta', 0, 'listo para servir', '1970/01/01 1:00', '2018/11/22 4:30', 'barra'),
(37, 00014, 'Pizza', 0, 'en preparacion', '2018/11/22 4:58', '', 'cocina'),
(38, 00014, 'Fanta', 0, 'pendiente', '', '', 'barra'),
(39, 00014, 'Sprite', 0, 'pendiente', '', '', 'barra'),
(40, 00014, 'Trago', 0, 'pendiente', '', '', 'barra'),
(41, 00015, 'Trago', 0, 'pendiente', '', '', 'barra'),
(42, 00015, 'Milanesa con papas', 0, 'pendiente', '', '', 'cocina'),
(43, 00015, 'Empanadas', 0, 'pendiente', '', '', 'cocina'),
(44, 00015, 'Flan', 0, 'pendiente', '', '', 'candy'),
(45, 00015, 'Frutillas con crema', 0, 'pendiente', '', '', 'candy'),
(46, 00016, 'Coca-cola', 0, 'pendiente', '', '', 'barra'),
(47, 00016, 'Cerveza', 0, 'pendiente', '', '', 'chopera'),
(48, 00016, 'Pizza', 0, 'pendiente', '', '', 'cocina'),
(49, 00017, 'Trago', 0, 'pendiente', '', '', 'barra'),
(50, 00017, 'Pizza', 0, 'pendiente', '', '', 'cocina'),
(51, 00017, 'Empanadas', 0, 'pendiente', '', '', 'cocina'),
(52, 00017, 'Milanesa con papas', 0, 'pendiente', '', '', 'cocina'),
(53, 00017, 'Cerveza', 0, 'pendiente', '', '', 'chopera'),
(54, 00017, 'Coca-cola', 0, 'pendiente', '', '', 'barra'),
(55, 00018, 'Coca-cola', 0, 'pendiente', '', '', 'barra'),
(56, 00018, 'Cerveza', 0, 'pendiente', '', '', 'chopera'),
(57, 00018, 'Pizza', 0, 'pendiente', '', '', 'cocina'),
(58, 00018, 'Milanesa con papas', 0, 'pendiente', '', '', 'cocina'),
(59, 00018, 'Empanadas', 0, 'pendiente', '', '', 'cocina'),
(60, 00018, 'Torta de chocolate', 0, 'pendiente', '', '', 'candy'),
(61, 00019, 'Sprite', 0, 'pendiente', '', '', 'barra'),
(62, 00019, 'Pizza', 0, 'pendiente', '', '', 'cocina'),
(63, 00019, 'Milanesa con papas', 0, 'pendiente', '', '', 'cocina'),
(64, 00019, 'Empanadas', 0, 'pendiente', '', '', 'cocina'),
(65, 00019, 'Flan', 0, 'pendiente', '', '', 'candy'),
(66, 00019, 'Frutillas con crema', 0, 'pendiente', '', '', 'candy'),
(67, 00019, 'Torta de chocolate', 0, 'pendiente', '', '', 'candy'),
(68, 00019, 'Helado', 0, 'pendiente', '', '', 'candy');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(5) UNSIGNED ZEROFILL NOT NULL,
  `idMesa` int(5) UNSIGNED ZEROFILL NOT NULL,
  `tiempoInicio` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `fotoMesa` varchar(50) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `idMesa`, `tiempoInicio`, `fotoMesa`) VALUES
(00001, 00001, '2018/11/14 1:30,09', './fotos/0001.jpg'),
(00002, 00002, '2018/11/14 1:42,41', './fotos/2.jpg'),
(00003, 00003, '2018/11/14 2:11,35', './fotos/3.jpg'),
(00004, 00004, '2018/11/14 2:42,23', './fotos/4.jpg'),
(00005, 00005, '2018/11/14 3:17,38', './fotos/5.jpg'),
(00006, 00001, '2018/11/15 5:14,21', './fotos/1.jpg'),
(00007, 00002, '2018/11/15 5:17,44', './fotos/2.jpg'),
(00008, 00003, '2018/11/15 5:20,57', './fotos/3.jpg'),
(00009, 00001, '2018/11/18 23:27,31', './fotos/1.jpg'),
(00010, 00003, '2018/11/19 0:04,31', './fotos/3.jpg'),
(00011, 00001, '2018/11/19 16:12,49', './fotos/1.jpg'),
(00012, 00002, '2018/11/19 16:13,36', './fotos/2.jpg'),
(00013, 00002, '2018/11/19 16:30,29', './fotos/2.jpg'),
(00014, 00002, '2018/11/20 17:52,56', './fotos/2.jpg'),
(00015, 00005, '2018/11/20 17:59,30', './fotos/5.jpg'),
(00016, 00004, '2018/11/20 18:02,00', './fotos/4.jpg'),
(00017, 00005, '2018/11/20 18:40,54', './fotos/5.jpg'),
(00018, 00005, '2018/11/22 16:59,36', './fotos/5.jpg'),
(00019, 00006, '2018/11/22 17:01,08', './fotos/6.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `precio` float NOT NULL,
  `responsable` varchar(50) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `precio`, `responsable`) VALUES
(1, 'Coca-cola', 80, 'barra'),
(2, 'Cerveza', 70, 'chopera'),
(3, 'Trago', 90, 'barra'),
(4, 'Sprite', 80, 'barra'),
(5, 'Fanta', 80, 'barra'),
(6, 'Pizza', 170, 'cocina'),
(7, 'Milanesa con papas', 260, 'cocina'),
(8, 'Empanadas', 33, 'cocina'),
(9, 'Flan', 50, 'candy'),
(10, 'Helado', 80, 'candy'),
(11, 'Torta de chocolate', 120, 'candy'),
(12, 'Frutillas con crema', 50, 'candy');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesiones`
--

CREATE TABLE `sesiones` (
  `id` int(11) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `horaInicio` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `horaFinal` varchar(20) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `sesiones`
--

INSERT INTO `sesiones` (`id`, `idEmpleado`, `horaInicio`, `horaFinal`) VALUES
(1, 1, '2018/11/04 4:12,08', ''),
(2, 1, '2018/11/04 4:12,43', ''),
(3, 1, '2018/11/04 4:13,00', ''),
(4, 1, '2018/11/04 18:52,51', ''),
(5, 1, '2018/11/04 19:17,02', ''),
(6, 1, '2018/11/04 19:40,39', ''),
(7, 2, '2018/11/04 21:21,34', ''),
(8, 2, '2018/11/04 21:22,50', '2018/11/04 21:22,53'),
(9, 2, '2018/11/04 21:30,12', '2018/11/04 21:30,41'),
(10, 1, '2018/11/04 21:30,46', '2018/11/04 21:31,40'),
(11, 2, '2018/11/04 21:32,02', '2018/11/04 21:33,26'),
(12, 1, '2018/11/04 21:33,33', ''),
(13, 1, '2018/11/04 22:21,24', '2018/11/04 22:23,36'),
(14, 2, '2018/11/04 22:24,55', '2018/11/04 22:25,38'),
(15, 2, '2018/11/05 3:43,58', '2018/11/05 3:45,11'),
(16, 2, '2018/11/05 3:45,17', ''),
(17, 2, '2018/11/07 1:02,39', '2018/11/07 2:36,31'),
(18, 2, '2018/11/07 2:37,03', '2018/11/07 3:08,00'),
(19, 1, '2018/11/07 3:08,07', '2018/11/07 3:13,50'),
(20, 2, '2018/11/07 3:14,17', ''),
(21, 2, '2018/11/08 23:11,08', '2018/11/08 23:18,17'),
(22, 2, '2018/11/09 1:26,01', '2018/11/09 1:26,45'),
(23, 1, '2018/11/09 1:26,51', '2018/11/09 1:38,06'),
(24, 1, '2018/11/09 1:38,12', '2018/11/09 1:38,16'),
(25, 2, '2018/11/09 1:38,21', '2018/11/09 1:47,03'),
(26, 1, '2018/11/09 1:48,26', '2018/11/09 1:49,33'),
(27, 2, '2018/11/09 1:50,20', '2018/11/09 1:54,13'),
(28, 2, '2018/11/10 13:01,20', ''),
(29, 2, '2018/11/10 16:12,34', ''),
(30, 2, '2018/11/10 20:52,07', '2018/11/10 21:23,55'),
(31, 2, '2018/11/10 21:56,37', '2018/11/10 21:56,41'),
(32, 1, '2018/11/10 21:56,44', '2018/11/10 21:57,26'),
(33, 3, '2018/11/10 21:57,28', '2018/11/10 21:57,32'),
(34, 4, '2018/11/10 21:57,33', '2018/11/10 21:57,36'),
(35, 5, '2018/11/10 21:57,38', '2018/11/10 21:57,41'),
(36, 8, '2018/11/10 21:57,42', '2018/11/10 21:57,44'),
(37, 2, '2018/11/10 21:58,33', '2018/11/10 23:42,51'),
(38, 1, '2018/11/10 23:42,59', '2018/11/10 23:43,03'),
(39, 3, '2018/11/10 23:43,04', '2018/11/10 23:43,08'),
(40, 4, '2018/11/10 23:43,10', '2018/11/10 23:43,12'),
(41, 5, '2018/11/10 23:43,14', '2018/11/10 23:43,16'),
(42, 8, '2018/11/10 23:43,17', '2018/11/10 23:43,19'),
(43, 8, '2018/11/10 23:54,46', '2018/11/10 23:54,52'),
(44, 8, '2018/11/11 0:03,02', '2018/11/11 0:03,07'),
(45, 5, '2018/11/11 0:03,10', '2018/11/11 0:04,11'),
(46, 13, '2018/11/11 0:04,38', '2018/11/11 0:27,57'),
(47, 3, '2018/11/11 0:28,01', '2018/11/11 0:28,25'),
(48, 4, '2018/11/11 0:28,31', '2018/11/11 0:28,38'),
(49, 4, '2018/11/11 0:28,44', '2018/11/11 1:19,47'),
(50, 3, '2018/11/11 1:19,49', '2018/11/11 1:41,39'),
(51, 3, '2018/11/11 1:41,43', '2018/11/11 1:53,30'),
(52, 8, '2018/11/11 2:15,14', '2018/11/11 2:17,29'),
(53, 2, '2018/11/11 2:17,33', '2018/11/11 2:17,45'),
(54, 4, '2018/11/11 2:17,49', '2018/11/11 2:17,57'),
(55, 2, '2018/11/11 2:21,21', '2018/11/11 2:21,26'),
(56, 4, '2018/11/11 2:21,27', '2018/11/11 2:21,41'),
(57, 5, '2018/11/11 2:21,44', '2018/11/11 2:21,52'),
(58, 8, '2018/11/11 2:21,54', '2018/11/11 2:22,02'),
(59, 3, '2018/11/11 2:22,06', ''),
(60, 4, '2018/11/11 2:22,19', '2018/11/11 2:22,21'),
(61, 4, '2018/11/11 2:22,27', '2018/11/11 2:48,12'),
(62, 3, '2018/11/11 2:48,16', '2018/11/11 2:49,26'),
(63, 8, '2018/11/11 2:49,29', '2018/11/11 2:49,35'),
(64, 4, '2018/11/11 2:49,36', '2018/11/11 2:49,39'),
(65, 3, '2018/11/11 2:49,40', '2018/11/11 2:51,39'),
(66, 3, '2018/11/11 2:51,42', '2018/11/11 2:51,47'),
(67, 4, '2018/11/11 15:00,35', '2018/11/11 15:02,41'),
(68, 4, '2018/11/11 15:02,43', '2018/11/11 15:02,45'),
(69, 3, '2018/11/11 15:02,48', '2018/11/11 15:04,10'),
(70, 4, '2018/11/11 15:04,15', '2018/11/11 15:04,42'),
(71, 4, '2018/11/11 15:09,27', '2018/11/11 15:09,30'),
(72, 8, '2018/11/11 15:09,32', '2018/11/11 15:09,35'),
(73, 5, '2018/11/11 15:09,54', '2018/11/11 15:10,03'),
(74, 8, '2018/11/11 15:10,05', '2018/11/11 15:10,11'),
(75, 3, '2018/11/11 15:10,12', '2018/11/11 15:10,19'),
(76, 5, '2018/11/11 15:11,50', '2018/11/11 15:11,53'),
(77, 3, '2018/11/11 15:11,54', '2018/11/11 15:11,57'),
(78, 3, '2018/11/11 15:11,59', '2018/11/11 15:12,03'),
(79, 3, '2018/11/11 15:12,05', '2018/11/11 15:12,09'),
(80, 2, '2018/11/11 15:12,14', '2018/11/11 15:12,21'),
(81, 3, '2018/11/11 15:14,15', '2018/11/11 15:14,23'),
(82, 5, '2018/11/11 15:14,35', '2018/11/11 15:14,59'),
(83, 5, '2018/11/11 15:25,23', '2018/11/11 15:25,26'),
(84, 5, '2018/11/11 15:25,28', '2018/11/11 15:25,32'),
(85, 3, '2018/11/11 15:25,35', '2018/11/11 15:25,39'),
(86, 4, '2018/11/11 15:25,40', '2018/11/11 15:25,42'),
(87, 5, '2018/11/11 15:25,44', '2018/11/11 15:25,46'),
(88, 13, '2018/11/11 15:25,47', '2018/11/11 15:25,50'),
(89, 8, '2018/11/11 15:25,51', '2018/11/11 15:25,54'),
(90, 5, '2018/11/11 15:26,53', '2018/11/11 15:26,55'),
(91, 5, '2018/11/11 15:27,32', '2018/11/11 15:29,30'),
(92, 5, '2018/11/11 15:29,31', ''),
(93, 5, '2018/11/11 15:29,31', '2018/11/11 15:29,39'),
(94, 4, '2018/11/11 15:29,41', '2018/11/11 15:29,47'),
(95, 4, '2018/11/11 15:29,49', '2018/11/11 15:31,52'),
(96, 4, '2018/11/11 15:31,54', '2018/11/11 15:32,05'),
(97, 4, '2018/11/11 15:32,07', '2018/11/11 15:32,08'),
(98, 5, '2018/11/11 15:32,10', '2018/11/11 15:32,27'),
(99, 3, '2018/11/11 15:32,36', '2018/11/11 15:32,40'),
(100, 4, '2018/11/11 15:36,48', '2018/11/11 15:36,55'),
(101, 3, '2018/11/11 15:36,57', '2018/11/11 15:37,40'),
(102, 4, '2018/11/11 15:37,43', '2018/11/11 15:37,47'),
(103, 4, '2018/11/11 15:37,49', '2018/11/11 15:37,51'),
(104, 5, '2018/11/11 15:37,52', '2018/11/11 15:38,04'),
(105, 5, '2018/11/11 15:38,05', '2018/11/11 15:38,07'),
(106, 4, '2018/11/11 15:48,58', ''),
(107, 4, '2018/11/11 15:48,58', '2018/11/11 15:49,04'),
(108, 3, '2018/11/11 15:49,06', '2018/11/11 15:49,22'),
(109, 2, '2018/11/11 15:49,24', '2018/11/11 15:49,29'),
(110, 4, '2018/11/11 15:49,31', '2018/11/11 15:49,44'),
(111, 3, '2018/11/11 15:49,47', '2018/11/11 15:50,45'),
(112, 2, '2018/11/11 15:50,48', '2018/11/11 15:50,51'),
(113, 3, '2018/11/11 15:51,01', '2018/11/11 15:51,09'),
(114, 5, '2018/11/11 15:51,11', '2018/11/11 15:51,13'),
(115, 3, '2018/11/11 15:51,14', '2018/11/11 15:53,22'),
(116, 3, '2018/11/11 15:53,23', '2018/11/11 15:54,46'),
(117, 3, '2018/11/11 15:54,50', '2018/11/11 15:54,56'),
(118, 4, '2018/11/11 15:54,58', '2018/11/11 15:55,01'),
(119, 5, '2018/11/11 15:55,02', '2018/11/11 15:55,07'),
(120, 4, '2018/11/11 15:57,00', '2018/11/11 15:57,10'),
(121, 3, '2018/11/11 15:57,13', '2018/11/11 15:57,49'),
(122, 3, '2018/11/11 15:57,54', '2018/11/11 15:57,57'),
(123, 4, '2018/11/11 15:58,02', '2018/11/11 15:58,09'),
(124, 3, '2018/11/11 15:58,10', '2018/11/11 15:58,17'),
(125, 5, '2018/11/11 15:58,19', '2018/11/11 15:58,22'),
(126, 5, '2018/11/11 15:58,27', '2018/11/11 15:58,34'),
(127, 3, '2018/11/11 15:59,50', '2018/11/11 16:00,05'),
(128, 4, '2018/11/11 16:05,36', '2018/11/11 16:05,46'),
(129, 4, '2018/11/11 16:05,48', '2018/11/11 16:05,49'),
(130, 8, '2018/11/11 16:05,50', '2018/11/11 16:05,53'),
(131, 2, '2018/11/11 16:05,57', '2018/11/11 16:08,02'),
(132, 3, '2018/11/11 16:08,04', '2018/11/11 16:08,40'),
(133, 4, '2018/11/11 16:08,42', '2018/11/11 16:08,45'),
(134, 5, '2018/11/11 16:08,46', '2018/11/11 16:09,11'),
(135, 8, '2018/11/11 16:09,19', '2018/11/11 16:09,21'),
(136, 8, '2018/11/11 16:09,26', '2018/11/11 16:09,29'),
(137, 3, '2018/11/11 16:09,32', '2018/11/11 16:09,34'),
(138, 2, '2018/11/11 16:10,42', '2018/11/11 16:12,02'),
(139, 5, '2018/11/11 16:12,22', '2018/11/11 16:12,24'),
(140, 3, '2018/11/11 16:12,25', '2018/11/11 16:12,26'),
(141, 3, '2018/11/11 16:12,32', '2018/11/11 16:12,50'),
(142, 5, '2018/11/11 16:16,47', '2018/11/11 16:17,46'),
(143, 4, '2018/11/11 16:17,49', '2018/11/11 16:18,24'),
(144, 3, '2018/11/11 16:48,42', '2018/11/11 17:46,11'),
(145, 13, '2018/11/11 17:46,16', '2018/11/11 17:46,25'),
(146, 13, '2018/11/11 17:46,54', '2018/11/11 17:46,57'),
(147, 1, '2018/11/11 18:40,36', ''),
(148, 1, '2018/11/12 0:15,50', '2018/11/12 0:23,03'),
(149, 1, '2018/11/12 0:41,51', '2018/11/12 0:49,52'),
(150, 1, '2018/11/12 0:51,23', ''),
(151, 2, '2018/11/13 0:56,45', '2018/11/13 1:39,28'),
(152, 13, '2018/11/13 1:39,32', '2018/11/13 2:38,55'),
(153, 2, '2018/11/13 2:38,59', '2018/11/13 2:40,28'),
(154, 3, '2018/11/13 2:40,31', '2018/11/13 2:40,59'),
(155, 4, '2018/11/13 2:41,05', '2018/11/13 2:41,11'),
(156, 5, '2018/11/13 2:41,13', '2018/11/13 2:41,33'),
(157, 8, '2018/11/13 2:41,36', '2018/11/13 2:41,50'),
(158, 13, '2018/11/13 2:41,53', '2018/11/13 3:20,15'),
(159, 3, '2018/11/13 3:20,20', '2018/11/13 3:21,47'),
(160, 3, '2018/11/13 3:21,58', '2018/11/13 3:24,34'),
(161, 4, '2018/11/13 3:24,36', '2018/11/13 3:24,39'),
(162, 5, '2018/11/13 3:24,41', '2018/11/13 3:24,43'),
(163, 3, '2018/11/13 3:27,06', '2018/11/13 3:27,09'),
(164, 4, '2018/11/13 3:27,10', '2018/11/13 3:27,13'),
(165, 5, '2018/11/13 3:27,15', '2018/11/13 3:27,58'),
(166, 5, '2018/11/13 3:28,01', '2018/11/13 3:56,36'),
(167, 4, '2018/11/13 3:56,38', '2018/11/13 4:19,06'),
(168, 5, '2018/11/13 4:19,09', ''),
(169, 3, '2018/11/14 0:52,10', '2018/11/14 1:27,53'),
(170, 13, '2018/11/14 1:27,55', '2018/11/14 1:29,22'),
(171, 2, '2018/11/14 1:29,25', '2018/11/14 1:30,28'),
(172, 4, '2018/11/14 1:30,32', '2018/11/14 1:30,39'),
(173, 8, '2018/11/14 1:30,43', '2018/11/14 1:30,52'),
(174, 13, '2018/11/14 1:30,55', '2018/11/14 1:42,28'),
(175, 2, '2018/11/14 1:42,30', '2018/11/14 1:42,45'),
(176, 4, '2018/11/14 1:42,48', '2018/11/14 1:42,56'),
(177, 13, '2018/11/14 1:43,00', '2018/11/14 2:11,19'),
(178, 2, '2018/11/14 2:11,22', '2018/11/14 2:11,38'),
(179, 4, '2018/11/14 2:11,40', '2018/11/14 2:11,49'),
(180, 13, '2018/11/14 2:11,51', '2018/11/14 2:42,11'),
(181, 2, '2018/11/14 2:42,14', '2018/11/14 2:42,29'),
(182, 8, '2018/11/14 2:42,32', '2018/11/14 2:42,44'),
(183, 13, '2018/11/14 2:42,49', '2018/11/14 3:17,26'),
(184, 2, '2018/11/14 3:17,29', '2018/11/14 3:17,40'),
(185, 8, '2018/11/14 3:17,45', '2018/11/14 3:17,53'),
(186, 13, '2018/11/14 3:17,57', '2018/11/14 3:39,17'),
(187, 3, '2018/11/14 3:39,19', '2018/11/14 3:39,23'),
(188, 4, '2018/11/14 3:39,25', '2018/11/14 3:42,35'),
(189, 13, '2018/11/14 3:42,36', ''),
(190, 1, '2018/11/15 0:42,19', ''),
(191, 4, '2018/11/15 2:41,48', '2018/11/15 2:46,18'),
(192, 1, '2018/11/15 2:46,21', '2018/11/15 3:19,42'),
(193, 2, '2018/11/15 3:19,44', '2018/11/15 4:17,14'),
(194, 3, '2018/11/15 4:17,16', '2018/11/15 4:17,25'),
(195, 4, '2018/11/15 4:17,28', '2018/11/15 4:17,30'),
(196, 8, '2018/11/15 4:17,32', '2018/11/15 4:17,37'),
(197, 1, '2018/11/15 4:17,48', '2018/11/15 4:24,48'),
(198, 2, '2018/11/15 4:26,05', '2018/11/15 4:30,09'),
(199, 2, '2018/11/15 4:30,11', '2018/11/15 4:31,36'),
(200, 1, '2018/11/15 4:31,39', ''),
(201, 2, '2018/11/15 4:37,04', '2018/11/15 5:14,33'),
(202, 8, '2018/11/15 5:14,35', '2018/11/15 5:14,47'),
(203, 2, '2018/11/15 5:14,51', '2018/11/15 5:17,47'),
(204, 8, '2018/11/15 5:17,50', '2018/11/15 5:17,58'),
(205, 1, '2018/11/15 5:18,00', '2018/11/15 5:18,13'),
(206, 2, '2018/11/15 5:18,15', '2018/11/15 5:21,02'),
(207, 4, '2018/11/15 5:21,05', '2018/11/15 5:21,06'),
(208, 8, '2018/11/15 5:21,08', '2018/11/15 5:21,16'),
(209, 2, '2018/11/15 5:21,20', '2018/11/15 5:23,37'),
(210, 1, '2018/11/15 5:23,42', '2018/11/15 5:26,38'),
(211, 2, '2018/11/15 5:26,43', '2018/11/15 5:26,47'),
(212, 2, '2018/11/15 5:28,32', '2018/11/15 5:33,43'),
(213, 1, '2018/11/15 5:33,45', '2018/11/15 5:33,56'),
(214, 3, '2018/11/15 5:33,59', '2018/11/15 5:34,05'),
(215, 3, '2018/11/15 5:35,09', '2018/11/15 5:36,13'),
(216, 2, '2018/11/15 5:36,18', '2018/11/15 5:45,33'),
(217, 13, '2018/11/15 5:45,35', '2018/11/15 6:20,19'),
(218, 1, '2018/11/15 6:20,25', ''),
(219, 2, '2018/11/15 6:24,59', '2018/11/15 6:25,09'),
(220, 1, '2018/11/15 6:31,37', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `usuario` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `clave` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `perfil` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `sexo` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `estado` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `clave`, `perfil`, `sexo`, `estado`) VALUES
(1, 'admin@gmail.com', 'admin', 'admin', 'Hombre', 'activo'),
(2, 'mozo1@gmail.com', '1234', 'mozo', 'Hombre', 'activo'),
(3, 'cocina1@gmail.com', '1234', 'cocina', 'Mujer', 'activo'),
(4, 'barra1@gmail.com', '1234', 'barra', 'Hombre', 'activo'),
(5, 'candy1@gmail.com', '1234', 'candy', 'Mujer', 'activo'),
(6, 'cocina2@gmail.com', '1324', 'cocina', 'Hombre', 'activo'),
(8, 'chopera1@gmail.com', '1234', 'chopera', 'Hombre', 'activo'),
(9, 'mozo2@gmail.com', '1234', 'mozo', 'Mujer', 'activo'),
(11, 'chopera2@gmail.com', '1234', 'chopera', 'Hombre', 'activo'),
(13, 'cliente1@gmail.com', '1234', 'cliente', 'Hombre', 'activo'),
(15, 'otroMozo@gmail.com', '1234', 'mozo', 'Hombre', 'activo'),
(17, 'mozo3@gmail.com', '1234', 'mozo', 'Mujer', 'activo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`numero`);

--
-- Indices de la tabla `mesas`
--
ALTER TABLE `mesas`
  ADD PRIMARY KEY (`idMesa`);

--
-- Indices de la tabla `pedidodetalle`
--
ALTER TABLE `pedidodetalle`
  ADD PRIMARY KEY (`idDetalle`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sesiones`
--
ALTER TABLE `sesiones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `numero` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `mesas`
--
ALTER TABLE `mesas`
  MODIFY `idMesa` int(5) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `pedidodetalle`
--
ALTER TABLE `pedidodetalle`
  MODIFY `idDetalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(5) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `sesiones`
--
ALTER TABLE `sesiones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
