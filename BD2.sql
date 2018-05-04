-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-05-2018 a las 14:54:29
-- Versión del servidor: 5.7.9
-- Versión de PHP: 5.6.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mydb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fotocomentario`
--

DROP TABLE IF EXISTS `fotocomentario`;
CREATE TABLE IF NOT EXISTS `fotocomentario` (
  `IdFotoComentario` int(11) NOT NULL AUTO_INCREMENT,
  `IdValoracion` int(11) NOT NULL,
  `Foto` varchar(100) DEFAULT NULL,
  `Comentario` varchar(500) DEFAULT NULL,
  `Valoracion_IdValoracion` int(11) NOT NULL,
  PRIMARY KEY (`IdFotoComentario`),
  KEY `fk_FotoComentario_Valoracion1_idx` (`Valoracion_IdValoracion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `fotocomentario`
--

INSERT INTO `fotocomentario` (`IdFotoComentario`, `IdValoracion`, `Foto`, `Comentario`, `Valoracion_IdValoracion`) VALUES
(1, 1, 'FOTO', 'FOTO COMENTARIO', 1),
(2, 2, 'foto2', 'fotosss', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `local`
--

DROP TABLE IF EXISTS `local`;
CREATE TABLE IF NOT EXISTS `local` (
  `idLocal` int(11) NOT NULL AUTO_INCREMENT,
  `TipoC` varchar(45) NOT NULL,
  `NombreLocal` varchar(45) NOT NULL,
  `Telefono` int(11) DEFAULT NULL,
  `Lat` double DEFAULT NULL,
  `Lng` double DEFAULT NULL,
  PRIMARY KEY (`idLocal`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `local`
--

INSERT INTO `local` (`idLocal`, `TipoC`, `NombreLocal`, `Telefono`, `Lat`, `Lng`) VALUES
(1, '1', 'NOMBRE1', 444, 1, 1),
(2, 'Alem', 'Rio Rhin', 44444, 1, 1),
(3, 'Gonza.com', 'Gonzu', 44554, 3, 555),
(4, 'Gonza.com', 'El vasco de gonza', 4111, 4, 55);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipocomida`
--

DROP TABLE IF EXISTS `tipocomida`;
CREATE TABLE IF NOT EXISTS `tipocomida` (
  `IdTipoC` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`IdTipoC`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipocomida`
--

INSERT INTO `tipocomida` (`IdTipoC`, `Descripcion`) VALUES
(1, 'Mucha comida china'),
(2, 'Mucha comida rica gonzi'),
(3, 'sopas ricas ricas'),
(4, 'Comida judia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipocomidaxlocal`
--

DROP TABLE IF EXISTS `tipocomidaxlocal`;
CREATE TABLE IF NOT EXISTS `tipocomidaxlocal` (
  `IdTCxL` int(11) NOT NULL AUTO_INCREMENT,
  `IdLocal` varchar(45) NOT NULL,
  `IdTipoC` varchar(45) NOT NULL,
  `Local_idLocal` int(11) NOT NULL,
  `TipoComida_IdTipoC` int(11) NOT NULL,
  PRIMARY KEY (`IdTCxL`,`Local_idLocal`),
  KEY `fk_TipoComidaxLocal_Local1_idx` (`Local_idLocal`),
  KEY `fk_TipoComidaxLocal_TipoComida1_idx` (`TipoComida_IdTipoC`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipocomidaxlocal`
--

INSERT INTO `tipocomidaxlocal` (`IdTCxL`, `IdLocal`, `IdTipoC`, `Local_idLocal`, `TipoComida_IdTipoC`) VALUES
(1, '1', '1', 1, 1),
(2, '2', '2', 2, 2),
(3, '3', '3', 3, 3),
(4, '4', '4', 4, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `idUsuariocol` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Contrasena` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Admin` bit(1) DEFAULT NULL,
  PRIMARY KEY (`idUsuariocol`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuariocol`, `Nombre`, `Contrasena`, `Email`, `Admin`) VALUES
(1, 'Nico', '111', 'nico', b'1'),
(2, 'chaian', '222', 'chaia', b'0'),
(3, 'gonzu', '333', 'gonzi', b'1'),
(4, 'hola', '444', 'hola', b'0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valoracion`
--

DROP TABLE IF EXISTS `valoracion`;
CREATE TABLE IF NOT EXISTS `valoracion` (
  `IdValoracion` int(11) NOT NULL AUTO_INCREMENT,
  `IdLocal` int(45) NOT NULL,
  `IdUsuario` int(11) NOT NULL,
  `Valoracion` int(11) DEFAULT NULL,
  `Comentario` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`IdValoracion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `valoracion`
--

INSERT INTO `valoracion` (`IdValoracion`, `IdLocal`, `IdUsuario`, `Valoracion`, `Comentario`) VALUES
(1, 1, 1, 1, 'rico'),
(2, 2, 2, 2, 'lol'),
(3, 3, 3, 3, 'eeeee');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tipocomidaxlocal`
--
ALTER TABLE `tipocomidaxlocal`
  ADD CONSTRAINT `fk_TipoComidaxLocal_Local1` FOREIGN KEY (`Local_idLocal`) REFERENCES `local` (`idLocal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_TipoComidaxLocal_TipoComida1` FOREIGN KEY (`TipoComida_IdTipoC`) REFERENCES `tipocomida` (`IdTipoC`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
