-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-06-2018 a las 22:41:12
-- Versión del servidor: 5.5.39
-- Versión de PHP: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `users`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_address`
--

CREATE TABLE IF NOT EXISTS `user_address` (
  `id_address` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `user_address`
--

INSERT INTO `user_address` (`id_address`, `id_user`) VALUES
(2, 1052),
(3, 1052),
(1, 1053),
(4, 1053),
(10, 1054);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_profile`
--

CREATE TABLE IF NOT EXISTS `user_profile` (
  `id_user` int(11) NOT NULL,
  `nm_first` varchar(30) DEFAULT NULL,
  `nm_middle` varchar(30) DEFAULT NULL,
  `nm_last` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `user_profile`
--

INSERT INTO `user_profile` (`id_user`, `nm_first`, `nm_middle`, `nm_last`) VALUES
(1051, 'Juan', 'Bernardo', 'Delgado'),
(1052, 'Eliecer', 'David', 'Vasquez'),
(1053, 'Nelson', NULL, 'Anchila'),
(1054, 'Jose', '', 'Sierra');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_role`
--

CREATE TABLE IF NOT EXISTS `user_role` (
  `cd_role_type` varchar(20) NOT NULL,
  `id_entity` int(11) NOT NULL,
  `in_status` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `user_role`
--

INSERT INTO `user_role` (`cd_role_type`, `id_entity`, `in_status`, `id_user`) VALUES
('LICENSEE', 1, 1, 1053),
('LICENSEE', 1, 1, 1054),
('LIMITED', 1, 1, 1051),
('PROVIDER', 1, 0, 1052);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `user_address`
--
ALTER TABLE `user_address`
 ADD PRIMARY KEY (`id_address`,`id_user`), ADD KEY `fk_User_address_User_Profile1_idx` (`id_user`);

--
-- Indices de la tabla `user_profile`
--
ALTER TABLE `user_profile`
 ADD PRIMARY KEY (`id_user`);

--
-- Indices de la tabla `user_role`
--
ALTER TABLE `user_role`
 ADD PRIMARY KEY (`cd_role_type`,`id_entity`,`id_user`), ADD KEY `fk_User_role_User_Profile_idx` (`id_user`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `user_address`
--
ALTER TABLE `user_address`
ADD CONSTRAINT `fk_User_address_User_Profile1` FOREIGN KEY (`id_user`) REFERENCES `user_profile` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `user_role`
--
ALTER TABLE `user_role`
ADD CONSTRAINT `fk_User_role_User_Profile` FOREIGN KEY (`id_user`) REFERENCES `user_profile` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
