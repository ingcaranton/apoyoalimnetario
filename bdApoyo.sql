-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 15-06-2014 a las 15:40:58
-- Versión del servidor: 5.6.16
-- Versión de PHP: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `bdApoyo`
--
CREATE DATABASE IF NOT EXISTS `bdApoyo` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `bdApoyo`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apoyo`
--

DROP TABLE IF EXISTS `apoyo`;
CREATE TABLE IF NOT EXISTS `apoyo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(300) COLLATE utf8_spanish_ci NOT NULL,
  `tipo` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tipo_3` (`tipo`),
  KEY `tipo` (`tipo`),
  KEY `tipo_2` (`tipo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `apoyo`
--

INSERT INTO `apoyo` (`id`, `descripcion`, `tipo`) VALUES
(1, 'El estudiante cancela $ 700 pesos por almuerzo,', 'A'),
(2, 'El estudiante cancela $ 1.300 pesos por almuerzo.', 'B'),
(3, 'El estudiante no cancela nada', 'Total');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apoyo_estudiante`
--

DROP TABLE IF EXISTS `apoyo_estudiante`;
CREATE TABLE IF NOT EXISTS `apoyo_estudiante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `apoyo` int(11) NOT NULL,
  `estudiante` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `estudiante` (`estudiante`),
  KEY `apoyo` (`apoyo`,`estudiante`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `apoyo_estudiante`
--

INSERT INTO `apoyo_estudiante` (`id`, `apoyo`, `estudiante`) VALUES
(3, 1, 10),
(2, 3, 5),
(1, 3, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento`
--

DROP TABLE IF EXISTS `documento`;
CREATE TABLE IF NOT EXISTS `documento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estudiante` bigint(20) NOT NULL,
  `uno` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `dos` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `tres` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `cuatro` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `cinco` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `seis` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `siete` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `sede` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `estudiante_2` (`estudiante`),
  KEY `estudiante` (`estudiante`),
  KEY `sede` (`sede`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `documento`
--

INSERT INTO `documento` (`id`, `estudiante`, `uno`, `dos`, `tres`, `cuatro`, `cinco`, `seis`, `siete`, `estado`, `sede`) VALUES
(7, 20101020039, 'archivos/estudiantes/20101020039/1_Carta.jpg', 'archivos/estudiantes/20101020039/2_Formulario.jpg', 'archivos/estudiantes/20101020039/3_Certificado_Estratificacion.jpg', 'archivos/estudiantes/20101020039/4_Fotocopia_factura.jpg', 'archivos/estudiantes/20101020039/5_Fotocopia_recibo.gz', 'archivos/estudiantes/20101020039/6_Certificado_de_ingresos.pdf', 'archivos/estudiantes/20101020039/7_Examen_medico.pdf', 'Pendiente', 'Central'),
(8, 20101020016, 'archivos/estudiantes/20101020016/1_Carta.jpg', 'archivos/estudiantes/20101020016/2_Formulario.', 'archivos/estudiantes/20101020016/3_Certificado_Estratificacion.jpg', 'archivos/estudiantes/20101020016/4_Fotocopia_factura.jpg', 'archivos/estudiantes/20101020016/5_Fotocopia_recibo.jpg', 'archivos/estudiantes/20101020016/6_Certificado_de_ingresos.gz', 'archivos/estudiantes/20101020016/7_Examen_medico.so', 'Pendiente', 'Central');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
CREATE TABLE IF NOT EXISTS `estudiante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `codigo` bigint(20) NOT NULL,
  `proyecto` varchar(120) COLLATE utf8_spanish_ci NOT NULL,
  `estado` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `sede` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(120) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estrato` tinyint(10) DEFAULT NULL,
  `telefono1` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono2` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `documento` int(30) NOT NULL,
  `apoyo` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `solicitud` int(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `sede` (`sede`),
  KEY `apoyo` (`apoyo`),
  KEY `codigo_2` (`codigo`),
  KEY `apoyo_2` (`apoyo`),
  KEY `apoyo_3` (`apoyo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`id`, `nombres`, `apellidos`, `codigo`, `proyecto`, `estado`, `sede`, `correo`, `password`, `direccion`, `estrato`, `telefono1`, `telefono2`, `documento`, `apoyo`, `solicitud`) VALUES
(5, 'Sergio Alexander', 'Gutiérrez Bustos', 20101020039, 'Ingeniería de Sistemas', 'Activo', 'Central', 'sergut18@gmail.com', '123456', 'Cra. 7G # 151A - 77 - Cedritos', 4, '4649190', '3138315841', 1016012390, 'Subsidio Total', 1),
(9, 'Laura Daniela', 'Acosta Contreras', 20101020002, 'Ingeniería de Sistemas', 'Activo', 'Central', 'lauradaniela92@gmail.com', '123456', 'Bosa Centro', 2, NULL, NULL, 1234345675, '0', 0),
(10, 'Xenia Viviana', 'Cadena Díaz', 20101020016, 'Ingeniería de Sistemas', 'Activo', 'Central', 'vivicadi07@gmail.com', 'viana', 'Perdomo', 2, '456789', '2677207', 1923456748, 'Tipo B', 1),
(11, 'Nelson Arley', 'Caranton Galeano', 20101020017, 'Ingenieria de Sistemas', 'Aprobado', 'Central', 'nacarantong@correo.udiatrital.edu.co', '4480', 'Cll 49 sur 89a - 92 casa 28', 2, '7843233', '3214021220', 1022376341, '0', 1),
(12, 'Andres', 'Santana', 20101020089, 'Ingenieria de Sistemas', 'Activo', 'Macarena B', 'acsantanab@correo.udistrital.edu.co', '1234', 'Calle 158 # 80 -27', 5, '7654980', NULL, 1012393657, '0', 1),
(13, 'Diego ', 'Cruz', 20101020104, 'Ingenieria de Sistemas', 'Activo', 'Facultad De Artes ASAB', 'dacruzt@correo.udistrital.edu.co', '1234', 'cll 56 # 9-73', 4, '12345678', NULL, 1019071316, '0', 1),
(14, 'null', 'Quintero', 20101020070, 'Ing.Sistemas', 'Activo', 'Central', 'andresquintero@gmail.com', '123456', 'Suba', 2, '3457856', '2348965', 1023592310, 'Ninguno', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sede`
--

DROP TABLE IF EXISTS `sede`;
CREATE TABLE IF NOT EXISTS `sede` (
  `nombre` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(120) COLLATE utf8_spanish_ci DEFAULT NULL,
  `representante` int(11) NOT NULL,
  PRIMARY KEY (`nombre`),
  KEY `representante` (`representante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `sede`
--

INSERT INTO `sede` (`nombre`, `direccion`, `representante`) VALUES
('Central', ' Carrera 7 No. 40B - 53', 1),
('Facultad De Artes ASAB', 'Carrera 13 No. 14 - 6', 1),
('IDEXUD', 'Avenida Carrera 19 # 33-39', 8),
('Macarena A', ' Carrera 3 No. 26 A - 4', 3),
('Macarena B', 'Carrera 3 No. 26 A - 4', 3),
('Posgrados de Ciencias y Educación', 'Calle 64 A No 30-05', 7),
('Tecnológica', 'Calle 68D Bis A Sur No. 49F-70', 4),
('Vivero', 'Carrera 5 Este No 15-82', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajador`
--

DROP TABLE IF EXISTS `trabajador`;
CREATE TABLE IF NOT EXISTS `trabajador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `cedula` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `correo` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `password` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula` (`cedula`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `trabajador`
--

INSERT INTO `trabajador` (`id`, `nombres`, `apellidos`, `cedula`, `telefono`, `correo`, `password`) VALUES
(1, 'Selmira ', 'Florez Rodriguez', '3016024', '4875672', '', 0),
(3, 'Antonio Guillermo', 'Machuca Florez', '2015043', '3456578', '', 0),
(4, 'Gloria', 'Neryra Bastos', '8345763', '4563412', '', 0),
(7, 'Margarita', 'Rosa Jimenez', '12345673', '3578698', '', 0),
(8, 'Pedro Antonio', 'Salazar Gomez', '3456234', '8973465', '', 0);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `apoyo_estudiante`
--
ALTER TABLE `apoyo_estudiante`
  ADD CONSTRAINT `ae_apoyo` FOREIGN KEY (`apoyo`) REFERENCES `apoyo` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ae_ESTUDIANTE` FOREIGN KEY (`estudiante`) REFERENCES `estudiante` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `documento`
--
ALTER TABLE `documento`
  ADD CONSTRAINT `documento_estudiante` FOREIGN KEY (`estudiante`) REFERENCES `estudiante` (`codigo`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `estudiante_sede` FOREIGN KEY (`sede`) REFERENCES `sede` (`nombre`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `sede`
--
ALTER TABLE `sede`
  ADD CONSTRAINT `sede_trabajador` FOREIGN KEY (`representante`) REFERENCES `trabajador` (`id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
