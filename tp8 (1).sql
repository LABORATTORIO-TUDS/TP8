-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-10-2025 a las 00:21:14
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tp8`
--
CREATE DATABASE IF NOT EXISTS `tp8` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tp8`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `dni` int(11) NOT NULL,
  `nombre` varchar(70) NOT NULL,
  `apellido` varchar(70) NOT NULL,
  `telefono` bigint(20) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `contactoAlternativo` bigint(20) NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `dni`, `nombre`, `apellido`, `telefono`, `direccion`, `contactoAlternativo`, `activo`) VALUES
(1, 30111222, 'Juan', 'Martínez', 2664000001, 'San Martín 123', 2664000002, 1),
(2, 30222333, 'Ana', 'Gómez', 2664000003, 'Belgrano 456', 2664000004, 1),
(3, 30333444, 'Mariana', 'Méndez', 2664000005, 'Italia 789', 2664000006, 1),
(4, 30444555, 'Pedro', 'López', 2664000007, 'Junín 321', 2664000008, 1),
(5, 30555666, 'Lucía', 'Morales', 2664000009, 'Rivadavia 654', 2664000010, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascota`
--

CREATE TABLE `mascota` (
  `idMascota` int(11) NOT NULL,
  `alias` varchar(25) NOT NULL,
  `sexo` varchar(25) NOT NULL,
  `especie` varchar(25) NOT NULL,
  `raza` varchar(25) NOT NULL,
  `colorPelo` varchar(25) NOT NULL,
  `fechaNac` date NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `idCliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mascota`
--

INSERT INTO `mascota` (`idMascota`, `alias`, `sexo`, `especie`, `raza`, `colorPelo`, `fechaNac`, `activo`, `idCliente`) VALUES
(1, 'Firulais', 'Macho', 'canino', 'Labrador', 'Negro', '2020-05-10', 1, 1),
(2, 'Bigotes', 'Macho', 'felino', 'Siames', 'Blanco', '2021-07-20', 1, 2),
(3, 'Luna', 'Hembra', 'canino', 'Caniche', 'Marrón', '2019-03-15', 1, 3),
(4, 'Rocky', 'Macho', 'ave', 'Canario', 'Amarillo', '2022-01-12', 1, 4),
(5, 'Nina', 'Hembra', 'canino', 'Bulldog', 'Blanco', '2018-11-03', 1, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tratamiento`
--

CREATE TABLE `tratamiento` (
  `idTratamiento` int(11) NOT NULL,
  `descripcion` varchar(70) NOT NULL,
  `medicamento` varchar(50) NOT NULL,
  `importe` double NOT NULL,
  `tipoTratamiento` varchar(30) NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tratamiento`
--

INSERT INTO `tratamiento` (`idTratamiento`, `descripcion`, `medicamento`, `importe`, `tipoTratamiento`, `activo`) VALUES
(1, 'Vacunación antirrábica', 'Vacuna Rabia', 5000, 'Preventivo', 1),
(2, 'Desparasitación', 'Ivermectina', 3000, 'Preventivo', 1),
(3, 'Cirugía menor', 'Anestesia', 15000, 'Quirúrgico', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visita`
--

CREATE TABLE `visita` (
  `idVisita` int(11) NOT NULL,
  `idMascota` int(11) NOT NULL,
  `fechaVisita` date NOT NULL,
  `detalle` varchar(50) NOT NULL,
  `peso` double NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `idTratamiento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `visita`
--

INSERT INTO `visita` (`idVisita`, `idMascota`, `fechaVisita`, `detalle`, `peso`, `activo`, `idTratamiento`) VALUES
(1, 1, '2024-09-25', 'Vacunación anual', 25.5, 1, 1),
(2, 3, '2024-09-25', 'Chequeo general', 10.2, 1, 2),
(3, 2, '2024-08-15', 'Control', 5.1, 1, 2),
(4, 4, '2024-09-10', 'Chequeo aves', 0.3, 1, 1),
(5, 5, '2024-09-25', 'Consulta Bulldog', 18, 1, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`,`dni`);

--
-- Indices de la tabla `mascota`
--
ALTER TABLE `mascota`
  ADD PRIMARY KEY (`idMascota`),
  ADD KEY `fk_mascota_cliente` (`idCliente`);

--
-- Indices de la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  ADD PRIMARY KEY (`idTratamiento`);

--
-- Indices de la tabla `visita`
--
ALTER TABLE `visita`
  ADD KEY `idTratamiento` (`idTratamiento`),
  ADD KEY `idMascota` (`idMascota`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `mascota`
--
ALTER TABLE `mascota`
  ADD CONSTRAINT `fk_mascota_cliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`);

--
-- Filtros para la tabla `visita`
--
ALTER TABLE `visita`
  ADD CONSTRAINT `visita_ibfk_1` FOREIGN KEY (`idTratamiento`) REFERENCES `tratamiento` (`idTratamiento`),
  ADD CONSTRAINT `visita_ibfk_2` FOREIGN KEY (`idMascota`) REFERENCES `mascota` (`idMascota`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
