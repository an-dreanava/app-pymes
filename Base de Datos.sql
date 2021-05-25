-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 25-05-2021 a las 18:25:19
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `apppymes`
--
CREATE DATABASE `apppymes` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `apppymes`;

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_agregar_cliente`(IN `vRut` VARCHAR(20), IN `vNombres` VARCHAR(40), IN `vApellidos` VARCHAR(40), IN `vTelefono` VARCHAR(20), IN `vCorreo` VARCHAR(40), IN `vContraseña` VARCHAR(20), IN `vDireccion` VARCHAR(30), IN `vComuna` INT)
    NO SQL
begin

select @id := max(id) + 1 from direccion;

insert into direccion values (@id, vDireccion, vComuna);
insert into cliente values (vRut, vNombres, vApellidos, vTelefono, vCorreo, vContraseña, @id);

end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_modificar_cliente`(IN `vRut` VARCHAR(20), IN `vNombres` VARCHAR(40), IN `vApellidos` VARCHAR(40), IN `vTelefono` VARCHAR(20), IN `vCorreo` VARCHAR(40), IN `vDireccion` VARCHAR(30), IN `vComuna` INT)
    NO SQL
begin

SELECT @id := D.ID FROM DIRECCION D INNER JOIN CLIENTE C ON D.ID = C.ID_DIRECCION WHERE C.RUT = vRut;

UPDATE DIRECCION SET DESCRIPCION = vDireccion, ID_COMUNA = vComuna WHERE ID = @id;
UPDATE CLIENTE SET NOMBRES = vNombres, APELLIDOS = vApellidos, TELEFONO = vTelefono, CORREO = vCorreo WHERE RUT = vRut;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_producto`
--

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
(2, 'Vestuario Mujer'),
(3, 'Vestuario Infantil'),
(4, 'Hogar'),
(5, 'Tecnología'),
(6, 'Papelería');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_pyme`
--

CREATE TABLE IF NOT EXISTS `categoria_pyme` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria_pyme`
--

INSERT INTO `categoria_pyme` (`id`, `descripcion`) VALUES
(1, 'Vestuario '),
(2, 'Calzado'),
(3, 'Papelería'),
(4, 'Hogar'),
(5, 'Infantil'),
(6, 'Tecnología');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE IF NOT EXISTS `ciudad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(20) NOT NULL,
  `id_region` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ciudad_fk_region` (`id_region`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

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

CREATE TABLE IF NOT EXISTS `cliente` (
  `rut` varchar(20) NOT NULL,
  `nombres` varchar(20) NOT NULL,
  `apellidos` varchar(20) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `contrasena` varchar(20) NOT NULL,
  `id_direccion` int(11) DEFAULT NULL,
  PRIMARY KEY (`rut`),
  UNIQUE KEY `correo` (`correo`),
  KEY `id_direccion` (`id_direccion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`rut`, `nombres`, `apellidos`, `telefono`, `correo`, `contrasena`, `id_direccion`) VALUES
('26.638.804-7', 'Angie', 'Riera', '(+56) 9 3013 0211', 'angie@gmail.com', '12345', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comuna`
--

CREATE TABLE IF NOT EXISTS `comuna` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(20) NOT NULL,
  `id_ciudad` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comuna_fk_ciudad` (`id_ciudad`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

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

CREATE TABLE IF NOT EXISTS `direccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(20) NOT NULL,
  `id_comuna` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `direccion_fk_comuna` (`id_comuna`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`id`, `descripcion`, `id_comuna`) VALUES
(1, 'Efeso 3396', 13),
(2, 'Siria 3396', 13),
(3, 'Siria 3396', 13),
(4, 'Efeso 420', 30),
(5, 'Siria', 4),
(6, 'Siria', 4),
(7, 'Siria', 4),
(8, 'Siria', 4),
(9, 'Siria', 4),
(10, 'Siria', 4),
(11, 'Siria 3396', 13),
(12, 'prueba direccon', 4),
(13, 'Siria 3396', 6),
(14, 'Siria 3396', 13),
(15, 'siria', 2),
(16, 'Siria 3396', 13),
(17, 'siria', 7),
(18, 'efeso 420', 7),
(19, 'siria', 3),
(20, 'Efeso 420', 6),
(21, 'Las condes 1252', 8),
(22, 'Ernesto Hevia 52', 12),
(23, 'Av keneddy 123', 6),
(24, 'Siria 3396', 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE IF NOT EXISTS `estado` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id`, `descripcion`) VALUES
(1, 'Activo'),
(2, 'Inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_pedido`
--

CREATE TABLE IF NOT EXISTS `estado_pedido` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estado_pedido`
--

INSERT INTO `estado_pedido` (`id`, `descripcion`) VALUES
(1, 'Ingresada'),
(2, 'Pagada'),
(3, 'Finalizada'),
(4, 'Cancelada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favoritos`
--

CREATE TABLE IF NOT EXISTS `favoritos` (
  `id_favorito` int(10) NOT NULL AUTO_INCREMENT,
  `rut_cliente` varchar(20) NOT NULL,
  `id_producto` int(10) NOT NULL,
  PRIMARY KEY (`id_favorito`),
  KEY `rut_cliente` (`rut_cliente`),
  KEY `id_producto` (`id_producto`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `favoritos`
--

INSERT INTO `favoritos` (`id_favorito`, `rut_cliente`, `id_producto`) VALUES
(6, '26.638.804-7', 10),
(7, '26.638.804-7', 13),
(8, '26.638.804-7', 19),
(9, '26.638.804-7', 17);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE IF NOT EXISTS `pedidos` (
  `boleta` int(11) NOT NULL AUTO_INCREMENT,
  `rut_cliente` varchar(20) NOT NULL,
  `id_pyme` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha` varchar(35) NOT NULL,
  `total` int(11) NOT NULL,
  `id_estado_pedido` int(11) NOT NULL,
  PRIMARY KEY (`boleta`),
  KEY `pedidos_fk_pyme` (`id_pyme`),
  KEY `pedidos_fk_cliente` (`rut_cliente`),
  KEY `pedidos_fk_estado_pedido` (`id_estado_pedido`),
  KEY `pedidos_fk_productos` (`id_producto`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`boleta`, `rut_cliente`, `id_pyme`, `id_producto`, `cantidad`, `fecha`, `total`, `id_estado_pedido`) VALUES
(9, '26.638.804-7', 10, 11, 2, '24/05/2021 11:10 p.m.', 53980, 3),
(10, '26.638.804-7', 10, 12, 1, '24/05/2021 11:27 p.m.', 14990, 4),
(11, '26.638.804-7', 10, 10, 2, '24/05/2021 11:27 p.m.', 43980, 2),
(12, '26.638.804-7', 10, 13, 3, '24/05/2021 11:27 p.m.', 65970, 2),
(13, '26.638.804-7', 10, 11, 1, '24/05/2021 11:28 p.m.', 26990, 1),
(14, '26.638.804-7', 10, 14, 2, '24/05/2021 11:28 p.m.', 31980, 1),
(15, '26.638.804-7', 10, 14, 2, '24/05/2021 11:46 p.m.', 31980, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE IF NOT EXISTS `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(30) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `foto` varchar(20) NOT NULL,
  `precio` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `id_pyme` int(11) NOT NULL,
  `id_categoria_producto` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `productos_fk_pyme` (`id_pyme`),
  KEY `productos_fk_categoria_producto` (`id_categoria_producto`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `titulo`, `descripcion`, `foto`, `precio`, `stock`, `id_pyme`, `id_categoria_producto`) VALUES
(9, 'BLAZER GIRL ', '  Finally, el esperado por muchas\r\n\r\n- Fabricado en Simil Cuerina Elasticada.\r\n\r\n- Made in Chile.', 'producto2.jpg', 24990, 32, 10, 2),
(10, 'ROMPER ALLISON BLACK', 'Llega Winter Dollz para que este invierno sea a lo grande.\n\n- Fabricado en Canuton Elasticado.\n\n- Made in Chile.', 'producto.jpg', 21990, 42, 10, 2),
(11, 'WIDE LEG CUERINA', 'Finally, llegan los esperados y mas perfectos pantalones.\n\n- Fabricado en Simil Cuerina Elasticada.\n\n- Made in Chile.\n\n- 100% elasticado y adaptable a la figura.\n\n- Soon more sizes.', 'producto3.jpg', 26990, 78, 10, 2),
(12, 'BEATLE MODE BLACK', 'Llega Winter Dollz para que este invierno sea a lo grande.\n\n- Fabricado en canuton elasticado.\n\n- Made in Chile.', 'producto4.jpg', 14990, 23, 10, 2),
(13, 'ADDISON DRESS LATTE', 'Llega Winter Dollz para que este invierno sea a lo grande.\n\n- Fabricado en Canuton Elasticado.\n\n- Made in Chile.', 'producto5.jpg', 21990, 46, 10, 2),
(14, 'CORSET BRI WHITE', 'Llega Winter Dollz para que este invierno sea a lo grande.\n\n- Fabricado en Franela Elasticada\n\n- Made in Chile.\n\n- Cierre en la espalda.', 'producto6.jpg', 15990, 65, 10, 2),
(15, 'CHALECO GINNY LADRILLO', 'Medidas: Largo: 43 cm; Ancho o contorno de busto: 100 cm; Largo de manga: 67 cms; Alto del cuello: 22 cm', 'producto7.jpg', 14990, 23, 11, 2),
(16, 'JACKET POLONIA', 'Jacket cuenta con bolsillos laterales y broches ajustables en muÃ±ecas.', 'producto8.jpg', 22990, 23, 11, 2),
(17, 'JEAN TRADER NEGRO', 'Talla M/34-36: Cintura: 68cm Caderas: 96cm Muslo: 56cm Tiro: 33cm Largo: 93cm\r\nTalla L/36-38: Cintura: 72cm Caderas: 102cm Muslo: 58cm Tiro: 33cm Largo: 93cm\r\nTalla XL/38-40: Cintura: 76cm Caderas: 106cm Muslo: 58cm Tiro: 33cm Largo: 96cm', 'producto9.jpg', 19990, 32, 11, 2),
(18, 'POLERÃ?N PORTLAND CHOCOLATE', 'Medidas Talla estÃ¡ndar: Largo: 74 cm; Ancho o contorno de busto: 112 cm; Largo de manga: 78 cms\r\n*IMPORTANTE:\r\n-GÃ©nero: franela algodÃ³n nacional\r\n-Fit normal\r\n-Modelo es talla S-M usualmente, detallar calce.', 'producto10.jpg', 20990, 15, 11, 2),
(19, 'PELUDO ROJO', 'Largo: 67cm Largo mangas: 63cm Ancho: 112cm\r\n*Modelo doble tela: con chiporro en su exterior e interior de polar para tallas s,m,l\r\n\r\n*Mega abrigador y grueso', 'producto11.PNG', 26000, 11, 11, 2),
(20, ' SWEATER BLEU ROSA', 'Modelo extremadamente grueso y suave, talla estÃ¡ndar.\r\nBotones reales, puedes desabrocharlo\r\nIdeal para tallas s,m,l\r\nMedidas: Largo: 64cm Ancho: 120cm Largo manga: 73cm\r\nModelo oversize', 'producto12.jpg', 23990, 11, 11, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pyme`
--

CREATE TABLE IF NOT EXISTS `pyme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `logo` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo` (`correo`),
  KEY `pyme_fk_categoria_pyme` (`id_categoria_pyme`),
  KEY `pyme_fk_direccion` (`id_direccion`),
  KEY `pyme_fk_estado` (`id_estado`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `pyme`
--

INSERT INTO `pyme` (`id`, `nombres`, `apellidos`, `rut`, `nombre_pyme`, `correo`, `contrasena`, `telefono`, `id_categoria_pyme`, `id_direccion`, `id_estado`, `logo`) VALUES
(10, 'Ana', 'Perez', '20.606.612-0', 'Modelandola', 'mode@gmail.com', '12345', '(+56) 9 9201 2325', 1, 20, 2, 'modelandola.png'),
(11, 'Hanna', 'Hayes', '15.856.235-4', 'Vaiem', 'vaiem@gmail.com', '12345', '(+56) 9 5452 2566', 1, 21, 2, 'vaiem.jpg'),
(12, 'Genyis Thais', 'Bolivar Torres', '27.221.538-7', 'Krasna', 'genyis@gmail.com', '12345', '(+56) 9 3013 0211', 5, 22, 2, 'krasna.png'),
(13, 'Andrea ', 'Nava', '14.255.682-0', 'Loop', 'loop@gmail.com', '12345', '(+56) 9 2548 3266', 6, 23, 2, 'loop.jpg'),
(14, 'Francisco', 'Poblete', '14.523.577-1', 'Pekas', 'pekas@gmail.com', '12345', '(+56) 9 5623 4862', 5, 24, 2, 'pekas.jpeg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `region`
--

CREATE TABLE IF NOT EXISTS `region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

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
(8, 'Bernardo O''Higgins'),
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
-- Filtros para la tabla `favoritos`
--
ALTER TABLE `favoritos`
  ADD CONSTRAINT `favoritos_ibfk_4` FOREIGN KEY (`rut_cliente`) REFERENCES `cliente` (`rut`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favoritos_ibfk_3` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_4` FOREIGN KEY (`id_estado_pedido`) REFERENCES `estado_pedido` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`rut_cliente`) REFERENCES `cliente` (`rut`) ON DELETE CASCADE,
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`id_pyme`) REFERENCES `pyme` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pedidos_ibfk_3` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`) ON DELETE CASCADE;

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
