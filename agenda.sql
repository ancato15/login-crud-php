-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 27-10-2024 a las 03:50:11
-- Versión del servidor: 8.0.17
-- Versión de PHP: 8.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `agenda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE `cita` (
  `idcita` int(11) NOT NULL,
  `idcontacto` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `consultorio` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `idusuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto`
--

CREATE TABLE `contacto` (
  `idcontacto` int(11) NOT NULL,
  `cedula` bigint(20) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `celular` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `contacto`
--

INSERT INTO `contacto` (`idcontacto`, `cedula`, `nombre`, `apellido`, `direccion`, `celular`) VALUES
(1, 1054782792, 'Jose Antonio', 'Galan', 'Calle 22b # 13-33', 3234532343),
(2, 10892890, 'Gustavo Andres', 'Cardenas Tobar', 'Carrera 7B # 22-55', 323423234),
(3, 32345234, 'Yulieth Cecilia', 'Jaramillo Gomez', 'Carrera 10 # 13-31', 323452343),
(4, 1234567, 'Bryant', 'Tobar', 'C.C Dorada Plaza', 3224537574),
(5, 21231123, 'Jose', 'Perez', 'Carrera 10', 21231123),
(6, 32131232, 'Josue', 'Gonzales', 'asdasd', 32131232),
(7, 21123213, 'Nestor', 'Garzón', 'Calle 47 # 2-32', 3167832123),
(8, 23112321, 'Alirio', 'Loaiza', 'Casa 45 B/ Los Andes', 23112321),
(9, 32324234, 'Johana', 'Ramirez', 'Casa 23', 32324234),
(10, 21332321, 'Carlos Arturo', 'Morales', 'Calle 49 # 7-89', 21332321),
(11, 1054678789, 'Gonzalo', 'Andrade', 'Calle 3 # 2-34', 315677828),
(12, 30929323, 'Christian', 'Ser', 'Coreducacion', 3214235754),
(13, 23432012, 'Hugo', 'Boss', 'DOE', 2345678902),
(14, 30929323, 'Hernan', 'Boss', 'Burbujas', 3247838920),
(15, 30929323, 'Gustavo', 'Cardenas', 'Coreducacion', 3214235754),
(17, 106526783, 'Andres', 'Sanchez', 'Coreducacion', 345321234);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `usuario`, `password`) VALUES
(1, 'admin', 'admin'),
(2, 'user', 'user');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`idcita`),
  ADD KEY `fk_cita_contacto_idx` (`idcontacto`),
  ADD KEY `fk_cita_usuario1_idx` (`idusuario`);

--
-- Indices de la tabla `contacto`
--
ALTER TABLE `contacto`
  ADD PRIMARY KEY (`idcontacto`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cita`
--
ALTER TABLE `cita`
  MODIFY `idcita` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `contacto`
--
ALTER TABLE `contacto`
  MODIFY `idcontacto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
