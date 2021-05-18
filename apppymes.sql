-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 18-05-2021 a las 02:01:48
-- Versión del servidor: 5.7.31
-- Versión de PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `apppymes`
--

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `sp_agregar_cliente`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_agregar_cliente` (IN `vRut` VARCHAR(20), IN `vNombres` VARCHAR(40), IN `vApellidos` VARCHAR(40), IN `vTelefono` VARCHAR(20), IN `vCorreo` VARCHAR(40), IN `vContraseña` VARCHAR(20), IN `vDireccion` VARCHAR(30), IN `vComuna` INT)  NO SQL
begin

select @id := max(id) + 1 from direccion;

insert into direccion values (@id, vDireccion, vComuna);
insert into cliente values (vRut, vNombres, vApellidos, vTelefono, vCorreo, vContraseña, @id);

end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_producto`
--

DROP TABLE IF EXISTS `categoria_producto`;
CREATE TABLE IF NOT EXISTS `categoria_producto` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria_producto`
--

INSERT INTO `categoria_producto` (`id`, `descripcion`) VALUES
(1, 'Vestuario Hombre'),
(2, 'Vestuario Mujer');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_pyme`
--

DROP TABLE IF EXISTS `categoria_pyme`;
CREATE TABLE IF NOT EXISTS `categoria_pyme` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria_pyme`
--

INSERT INTO `categoria_pyme` (`id`, `descripcion`) VALUES
(1, 'Chaquetas'),
(2, 'Pantalones'),
(3, 'Zapatillas'),
(4, 'Celulares'),
(5, 'Televisores');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
CREATE TABLE IF NOT EXISTS `ciudad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(20) NOT NULL,
  `id_region` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ciudad_fk_region` (`id_region`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`id`, `descripcion`, `id_region`) VALUES
(1, 'San José de Maipo', 7),
(2, 'Santiago', 7),
(3, 'Colina', 7),
(4, 'Chicureo', 7),
(5, 'Lampa', 7),
(6, 'Buin', 7),
(7, 'Paine', 7),
(8, 'Talagante', 7),
(9, 'Isla de Maipo', 7),
(10, 'Peñaflor', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `rut` varchar(20) NOT NULL,
  `nombres` varchar(20) NOT NULL,
  `apellidos` varchar(20) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `contrasena` varchar(20) NOT NULL,
  `id_direccion` int(11) DEFAULT NULL,
  PRIMARY KEY (`rut`),
  KEY `id_direccion` (`id_direccion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comuna`
--

DROP TABLE IF EXISTS `comuna`;
CREATE TABLE IF NOT EXISTS `comuna` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(20) NOT NULL,
  `id_ciudad` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comuna_fk_ciudad` (`id_ciudad`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `comuna`
--

INSERT INTO `comuna` (`id`, `descripcion`, `id_ciudad`) VALUES
(1, 'Santiago', 2),
(2, 'Conchalí', 2),
(3, 'Huechuraba', 2),
(4, 'Independencia.', 2),
(5, 'Quilicura', 2),
(6, 'Recoleta', 2),
(7, 'Renca', 2),
(8, 'Las Condes', 2),
(9, 'Lo Barnechea', 2),
(10, 'Providencia', 2),
(11, 'Vitacura', 2),
(12, 'La Reina', 2),
(13, 'Macul', 2),
(14, 'Ñuñoa', 2),
(15, 'Peñalolén', 2),
(16, 'La Florida', 2),
(17, 'La Granja', 2),
(18, 'El Bosque', 2),
(19, 'La Cisterna', 2),
(20, 'La Pintana', 2),
(21, 'San Ramón', 2),
(22, 'Lo Espejo', 2),
(23, 'Pedro Aguirre Cerda', 2),
(24, 'San Joaquín', 2),
(25, 'San Miguel', 2),
(26, 'Cerrillos', 2),
(27, 'Estación Central', 2),
(28, 'Maipú', 2),
(29, 'Cerro Navia', 2),
(30, 'Lo Prado', 2),
(31, 'Pudahuel', 2),
(32, 'Quinta Normal', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

DROP TABLE IF EXISTS `direccion`;
CREATE TABLE IF NOT EXISTS `direccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(20) NOT NULL,
  `id_comuna` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `direccion_fk_comuna` (`id_comuna`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`id`, `descripcion`, `id_comuna`) VALUES
(20, 'Efeso 3396', 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

DROP TABLE IF EXISTS `estado`;
CREATE TABLE IF NOT EXISTS `estado` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id`, `descripcion`) VALUES
(100, 'Activo'),
(200, 'Inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_pedido`
--

DROP TABLE IF EXISTS `estado_pedido`;
CREATE TABLE IF NOT EXISTS `estado_pedido` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE IF NOT EXISTS `pedidos` (
  `boleta` int(11) NOT NULL,
  `rut_cliente` varchar(20) NOT NULL,
  `id_pyme` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha` varchar(20) NOT NULL,
  `total` int(11) NOT NULL,
  `id_estado_pedido` int(11) NOT NULL,
  PRIMARY KEY (`boleta`),
  KEY `pedidos_fk_pyme` (`id_pyme`),
  KEY `pedidos_fk_cliente` (`rut_cliente`),
  KEY `pedidos_fk_estado_pedido` (`id_estado_pedido`),
  KEY `pedidos_fk_productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(20) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `foto` varchar(20) NOT NULL,
  `precio` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `id_pyme` int(11) NOT NULL,
  `id_categoria_producto` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `productos_fk_pyme` (`id_pyme`),
  KEY `productos_fk_categoria_producto` (`id_categoria_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `titulo`, `descripcion`, `foto`, `precio`, `stock`, `id_pyme`, `id_categoria_producto`) VALUES
(11, 'CHAQUETA ROSA', 'chaqueta hermosa rosa ', 'chaqueta.jpg', 1000, 12, 1, 2),
(12, 'Chaqueta Negra', 'hermosa chaqueta negra', 'chaquetanegra.jpg', 15000, 12, 1, 2),
(14, 'chaqueta verde', 'chaqueta verde', 'chaquetaverde.jpg', 12000, 12, 1, 2),
(15, 'Chaqueta  morada', 'Chaqueta morada', 'chaquetamorada.jpg', 10200, 12, 1, 2),
(16, 'Chaqueta chiquita', 'chaqueta chiquita', 'chaquetachiquita.jpg', 5000, 12, 1, 2),
(17, 'Chaqueton', 'Chaquetonnn', 'chaqueton.jpg', 12000, 12, 1, 1),
(18, 'Chaquetote', 'chaquetote', 'chaquetote.jpg', 12000, 12, 1, 1),
(19, 'Chaquetonazo', 'chaquetonazo', 'chaquetonazo.jpg', 12000, 12, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pyme`
--

DROP TABLE IF EXISTS `pyme`;
CREATE TABLE IF NOT EXISTS `pyme` (
  `id` int(11) NOT NULL,
  `nombres` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `rut` varchar(20) NOT NULL,
  `nombre_pyme` varchar(20) NOT NULL,
  `correo` varchar(40) NOT NULL,
  `contrasena` varchar(20) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `id_categoria_pyme` int(11) NOT NULL,
  `id_direccion` int(11) NOT NULL,
  `id_estado` int(11) NOT NULL,
  `logo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pyme_fk_categoria_pyme` (`id_categoria_pyme`),
  KEY `pyme_fk_direccion` (`id_direccion`),
  KEY `pyme_fk_estado` (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pyme`
--

INSERT INTO `pyme` (`id`, `nombres`, `apellidos`, `rut`, `nombre_pyme`, `correo`, `contrasena`, `telefono`, `id_categoria_pyme`, `id_direccion`, `id_estado`, `logo`) VALUES
(1, 'Francisco', 'Poblete', '207462179', 'Krasna', 'fpoblete018@gmail.com', '1234', '123456789', 1, 20, 100, 'logo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `region`
--

DROP TABLE IF EXISTS `region`;
CREATE TABLE IF NOT EXISTS `region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `region`
--

INSERT INTO `region` (`id`, `descripcion`) VALUES
(1, 'Arica y Parinacota'),
(2, 'Tarapacá'),
(3, 'Antofagasta'),
(4, 'Atacama'),
(5, 'Coquimbo'),
(6, 'Valparaíso'),
(7, 'Metropolitana'),
(8, 'Bernardo O\'Higgins'),
(9, 'Maule'),
(10, 'Ñuble'),
(11, 'Biobío'),
(12, 'La Araucanía'),
(13, 'Los Ríos'),
(14, 'Los Lagos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `validacion`
--

DROP TABLE IF EXISTS `validacion`;
CREATE TABLE IF NOT EXISTS `validacion` (
  `id` int(11) NOT NULL,
  `id_pyme` int(11) NOT NULL,
  `archivo` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `validacion_fk_pyme` (`id_pyme`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD CONSTRAINT `ciudad_fk_region` FOREIGN KEY (`id_region`) REFERENCES `region` (`id`);

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `comuna`
--
ALTER TABLE `comuna`
  ADD CONSTRAINT `comuna_fk_ciudad` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id`);

--
-- Filtros para la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD CONSTRAINT `direccion_fk_comuna` FOREIGN KEY (`id_comuna`) REFERENCES `comuna` (`id`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_fk_cliente` FOREIGN KEY (`rut_cliente`) REFERENCES `cliente` (`rut`),
  ADD CONSTRAINT `pedidos_fk_estado_pedido` FOREIGN KEY (`id_estado_pedido`) REFERENCES `estado_pedido` (`id`),
  ADD CONSTRAINT `pedidos_fk_productos` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `pedidos_fk_pyme` FOREIGN KEY (`id_pyme`) REFERENCES `pyme` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_fk_categoria_producto` FOREIGN KEY (`id_categoria_producto`) REFERENCES `categoria_producto` (`id`),
  ADD CONSTRAINT `productos_fk_pyme` FOREIGN KEY (`id_pyme`) REFERENCES `pyme` (`id`);

--
-- Filtros para la tabla `pyme`
--
ALTER TABLE `pyme`
  ADD CONSTRAINT `pyme_fk_categoria_pyme` FOREIGN KEY (`id_categoria_pyme`) REFERENCES `categoria_pyme` (`id`),
  ADD CONSTRAINT `pyme_fk_direccion` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id`),
  ADD CONSTRAINT `pyme_fk_estado` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id`);

--
-- Filtros para la tabla `validacion`
--
ALTER TABLE `validacion`
  ADD CONSTRAINT `validacion_fk_pyme` FOREIGN KEY (`id_pyme`) REFERENCES `pyme` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
