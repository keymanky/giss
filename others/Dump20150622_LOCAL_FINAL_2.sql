/*
Navicat MySQL Data Transfer

Source Server         : MYSQL LOCAL
Source Server Version : 50623
Source Host           : localhost:3306
Source Database       : sicud

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2015-06-22 22:28:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for direccion
-- ----------------------------
DROP TABLE IF EXISTS `direccion`;
CREATE TABLE `direccion` (
  `id_direccion` int(11) NOT NULL AUTO_INCREMENT,
  `id_entidad_federativa` int(11) DEFAULT NULL,
  `calle` varchar(50) DEFAULT NULL,
  `num_ext` varchar(20) DEFAULT NULL,
  `num_int` varchar(20) DEFAULT NULL,
  `codigo_postal` varchar(5) DEFAULT NULL,
  `colonia` varchar(50) DEFAULT NULL,
  `localidad` varchar(50) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `telefono_particular` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_direccion`),
  KEY `f4_idx` (`id_entidad_federativa`),
  CONSTRAINT `f4` FOREIGN KEY (`id_entidad_federativa`) REFERENCES `entidad_federativa` (`id_identidad_federativa`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of direccion
-- ----------------------------
INSERT INTO `direccion` VALUES ('1', '15', 'Av. de los Barrios', '1', ' ', '54090', 'Los reyes Ixtacala', 'Zona metropolitana', 'Tlalnepantla', '56231333');
INSERT INTO `direccion` VALUES ('2', '15', 'Av. de los Barrios', '1', ' ', '54090', 'Los reyes Ixtacala', 'Zona metropolitana', 'Tlalnepantla', '5538169364');
INSERT INTO `direccion` VALUES ('3', '9', 'Desconocido', 'S/N', ' ', '02070', 'Azcapotzalco', 'Zona metropolitana', 'Azcapotzalco', '5527651866');
INSERT INTO `direccion` VALUES ('4', '15', 'Desconocido', '24', ' ', '54150', 'Acueducto de Tenayuca', 'Zona metropolitana', 'Tlalnepantla', '5534748105');
INSERT INTO `direccion` VALUES ('5', '15', 'Av. Alcanfores y San Juan Totoltepec', 'S/N', ' ', '53150', 'Santa Cruz Acatlán', 'Zona metropolitana', 'Tlalnepantla', '5531984102');
INSERT INTO `direccion` VALUES ('6', '1', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ');
INSERT INTO `direccion` VALUES ('7', '1', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ');
INSERT INTO `direccion` VALUES ('8', '1', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ');

-- ----------------------------
-- Table structure for entidad_federativa
-- ----------------------------
DROP TABLE IF EXISTS `entidad_federativa`;
CREATE TABLE `entidad_federativa` (
  `id_identidad_federativa` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_identidad_federativa`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of entidad_federativa
-- ----------------------------
INSERT INTO `entidad_federativa` VALUES ('1', 'Aguascalientes');
INSERT INTO `entidad_federativa` VALUES ('2', 'Baja California');
INSERT INTO `entidad_federativa` VALUES ('3', 'Baja California Sur');
INSERT INTO `entidad_federativa` VALUES ('4', 'Campeche');
INSERT INTO `entidad_federativa` VALUES ('5', 'Coahuila de Zaragoza');
INSERT INTO `entidad_federativa` VALUES ('6', 'Colima');
INSERT INTO `entidad_federativa` VALUES ('7', 'Chiapas');
INSERT INTO `entidad_federativa` VALUES ('8', 'Chihuahua');
INSERT INTO `entidad_federativa` VALUES ('9', 'Distrito Federal');
INSERT INTO `entidad_federativa` VALUES ('10', 'Durango');
INSERT INTO `entidad_federativa` VALUES ('11', 'Guanajuato');
INSERT INTO `entidad_federativa` VALUES ('12', 'Guerrero');
INSERT INTO `entidad_federativa` VALUES ('13', 'Hidalgo');
INSERT INTO `entidad_federativa` VALUES ('14', 'Jalisco');
INSERT INTO `entidad_federativa` VALUES ('15', 'México');
INSERT INTO `entidad_federativa` VALUES ('16', 'Michoacán de Ocampo');
INSERT INTO `entidad_federativa` VALUES ('17', 'Morelos');
INSERT INTO `entidad_federativa` VALUES ('18', 'Nayarit');
INSERT INTO `entidad_federativa` VALUES ('19', 'Nuevo León');
INSERT INTO `entidad_federativa` VALUES ('20', 'Oaxaca');
INSERT INTO `entidad_federativa` VALUES ('21', 'Puebla');
INSERT INTO `entidad_federativa` VALUES ('22', 'Querétaro');
INSERT INTO `entidad_federativa` VALUES ('23', 'Quintana Roo');
INSERT INTO `entidad_federativa` VALUES ('24', 'San Luis Potosí');
INSERT INTO `entidad_federativa` VALUES ('25', 'Sinaloa');
INSERT INTO `entidad_federativa` VALUES ('26', 'Sonora');
INSERT INTO `entidad_federativa` VALUES ('27', 'Tabasco');
INSERT INTO `entidad_federativa` VALUES ('28', 'Tamaulipas');
INSERT INTO `entidad_federativa` VALUES ('29', 'Tlaxcala');
INSERT INTO `entidad_federativa` VALUES ('30', 'Veracruz');
INSERT INTO `entidad_federativa` VALUES ('31', 'Yucatán');
INSERT INTO `entidad_federativa` VALUES ('32', 'Zacatecas');

-- ----------------------------
-- Table structure for inciso
-- ----------------------------
DROP TABLE IF EXISTS `inciso`;
CREATE TABLE `inciso` (
  `id_inciso` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `ruta_imagen` varchar(100) DEFAULT NULL,
  `secuencia` int(11) DEFAULT NULL,
  `id_pregunta` int(11) DEFAULT NULL,
  `codificacion` int(11) DEFAULT '0',
  `salta_a_la_seccion_id` int(11) DEFAULT NULL,
  `estatus` int(11) DEFAULT '1',
  PRIMARY KEY (`id_inciso`),
  KEY `f10_idx` (`id_pregunta`),
  CONSTRAINT `f10` FOREIGN KEY (`id_pregunta`) REFERENCES `pregunta` (`id_pregunta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=324 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inciso
-- ----------------------------
INSERT INTO `inciso` VALUES ('1', '', '', null, null, null, null, '1');
INSERT INTO `inciso` VALUES ('2', 'Hipoacúsico', './imagenes/Inciso2.jpg', '1', '1', '1', null, '1');
INSERT INTO `inciso` VALUES ('3', 'Sordo', './imagenes/Inciso3.jpg', '2', '1', '2', null, '1');
INSERT INTO `inciso` VALUES ('4', 'Visual', './imagenes/Inciso4.jpg', '1', '10', '1', null, '1');
INSERT INTO `inciso` VALUES ('5', 'Auditiva', './imagenes/Inciso5.jpg', '2', '10', '2', null, '1');
INSERT INTO `inciso` VALUES ('6', 'Motriz', './imagenes/Inciso6.jpg', '3', '10', '3', null, '1');
INSERT INTO `inciso` VALUES ('7', 'Otra', '', '4', '10', '4', null, '1');
INSERT INTO `inciso` VALUES ('8', 'NO tiene discapacidad', '', '5', '10', '5', null, '1');
INSERT INTO `inciso` VALUES ('9', 'Juntos', '', '1', '11', '1', null, '1');
INSERT INTO `inciso` VALUES ('10', 'Separados', '', '2', '11', '2', null, '1');
INSERT INTO `inciso` VALUES ('11', 'No hay estudios', '', '1', '14', '1', null, '1');
INSERT INTO `inciso` VALUES ('12', 'Aprender oficio', '', '2', '14', '2', null, '1');
INSERT INTO `inciso` VALUES ('13', 'Primaria', '', '3', '14', '3', null, '1');
INSERT INTO `inciso` VALUES ('14', 'Secundario o Carrera Técnica', '', '4', '14', '4', null, '1');
INSERT INTO `inciso` VALUES ('15', 'Preparatoria', '', '5', '14', '5', null, '1');
INSERT INTO `inciso` VALUES ('16', 'Universidad', '', '6', '14', '6', null, '1');
INSERT INTO `inciso` VALUES ('17', 'No hay estudios', '', '1', '15', '1', null, '1');
INSERT INTO `inciso` VALUES ('18', 'Aprender oficio', '', '2', '15', '2', null, '1');
INSERT INTO `inciso` VALUES ('19', 'Primaria', '', '3', '15', '3', null, '1');
INSERT INTO `inciso` VALUES ('20', 'Secundario o Carrera Técnica', '', '4', '15', '4', null, '1');
INSERT INTO `inciso` VALUES ('21', 'Preparatoria', '', '5', '15', '5', null, '1');
INSERT INTO `inciso` VALUES ('22', 'Universidad', '', '6', '15', '6', null, '1');
INSERT INTO `inciso` VALUES ('23', 'Casa papá y mamá', '', '1', '16', '1', null, '1');
INSERT INTO `inciso` VALUES ('24', 'Casa mamá', '', '2', '16', '2', null, '1');
INSERT INTO `inciso` VALUES ('25', 'Casa papá', '', '3', '16', '3', null, '1');
INSERT INTO `inciso` VALUES ('26', 'Casa otra persona mi familia', '', '4', '16', '4', null, '1');
INSERT INTO `inciso` VALUES ('27', 'Internado - Casa gobierno', '', '5', '16', '5', null, '1');
INSERT INTO `inciso` VALUES ('28', 'Casa yo dueño', '', '6', '16', '6', null, '1');
INSERT INTO `inciso` VALUES ('29', 'Sí', '', '1', '17', '1', null, '1');
INSERT INTO `inciso` VALUES ('30', 'No', '', '2', '17', '2', null, '1');
INSERT INTO `inciso` VALUES ('31', 'Sí', '', '1', '18', '1', null, '1');
INSERT INTO `inciso` VALUES ('32', 'No', '', '2', '18', '2', null, '1');
INSERT INTO `inciso` VALUES ('33', 'Sí', '', '1', '19', '1', null, '1');
INSERT INTO `inciso` VALUES ('34', 'No', '', '2', '19', '2', null, '1');
INSERT INTO `inciso` VALUES ('35', 'Nunca / Jamás', './imagenes/Inciso35.jpg', '1', '20', '1', null, '1');
INSERT INTO `inciso` VALUES ('36', 'Poco', './imagenes/Inciso36.jpg', '2', '20', '2', null, '1');
INSERT INTO `inciso` VALUES ('37', 'A veces', './imagenes/Inciso37.jpg', '3', '20', '3', null, '1');
INSERT INTO `inciso` VALUES ('38', 'Mucho', './imagenes/Inciso38.jpg', '4', '20', '4', null, '1');
INSERT INTO `inciso` VALUES ('39', 'Mucho más / Siempre', './imagenes/Inciso39.jpg', '5', '20', '5', null, '1');
INSERT INTO `inciso` VALUES ('40', 'Nunca / Jamás', './imagenes/Inciso40.jpg', '1', '21', '1', null, '1');
INSERT INTO `inciso` VALUES ('41', 'Poco', './imagenes/Inciso41.jpg', '2', '21', '2', null, '1');
INSERT INTO `inciso` VALUES ('42', 'A veces', './imagenes/Inciso42.jpg', '3', '21', '3', null, '1');
INSERT INTO `inciso` VALUES ('43', 'Mucho', './imagenes/Inciso43.jpg', '4', '21', '4', null, '1');
INSERT INTO `inciso` VALUES ('44', 'Mucho más / Siempre', './imagenes/Inciso44.jpg', '5', '21', '5', null, '1');
INSERT INTO `inciso` VALUES ('45', 'Nunca / Jamás', './imagenes/Inciso45.jpg', '1', '22', '1', null, '1');
INSERT INTO `inciso` VALUES ('46', 'Poco', './imagenes/Inciso46.jpg', '2', '22', '2', null, '1');
INSERT INTO `inciso` VALUES ('47', 'A veces', './imagenes/Inciso47.jpg', '3', '22', '3', null, '1');
INSERT INTO `inciso` VALUES ('48', 'Mucho', './imagenes/Inciso48.jpg', '4', '22', '4', null, '1');
INSERT INTO `inciso` VALUES ('49', 'Mucho más / Siempre', './imagenes/Inciso49.jpg', '5', '22', '5', null, '1');
INSERT INTO `inciso` VALUES ('50', 'Nunca / Jamás', './imagenes/Inciso50.jpg', '1', '23', '1', null, '1');
INSERT INTO `inciso` VALUES ('51', 'Poco', './imagenes/Inciso51.jpg', '2', '23', '2', null, '1');
INSERT INTO `inciso` VALUES ('52', 'A veces', './imagenes/Inciso52.jpg', '3', '23', '3', null, '1');
INSERT INTO `inciso` VALUES ('53', 'Mucho', './imagenes/Inciso53.jpg', '4', '23', '4', null, '1');
INSERT INTO `inciso` VALUES ('54', 'Mucho más / Siempre', './imagenes/Inciso54.jpg', '5', '23', '5', null, '1');
INSERT INTO `inciso` VALUES ('55', 'Nunca / Jamás', './imagenes/Inciso55.jpg', '1', '24', '1', null, '1');
INSERT INTO `inciso` VALUES ('56', 'Poco', './imagenes/Inciso56.jpg', '2', '24', '2', null, '1');
INSERT INTO `inciso` VALUES ('57', 'A veces', './imagenes/Inciso57.jpg', '3', '24', '3', null, '1');
INSERT INTO `inciso` VALUES ('58', 'Mucho', './imagenes/Inciso58.jpg', '4', '24', '4', null, '1');
INSERT INTO `inciso` VALUES ('59', 'Mucho más / Siempre', './imagenes/Inciso59.jpg', '5', '24', '5', null, '1');
INSERT INTO `inciso` VALUES ('60', 'Nunca / Jamás', './imagenes/Inciso60.jpg', '1', '25', '1', null, '1');
INSERT INTO `inciso` VALUES ('61', 'Poco', './imagenes/Inciso61.jpg', '2', '25', '2', null, '1');
INSERT INTO `inciso` VALUES ('62', 'A veces', './imagenes/Inciso62.jpg', '3', '25', '3', null, '1');
INSERT INTO `inciso` VALUES ('63', 'Mucho', './imagenes/Inciso63.jpg', '4', '25', '4', null, '1');
INSERT INTO `inciso` VALUES ('64', 'Mucho más / Siempre', './imagenes/Inciso64.jpg', '5', '25', '5', null, '1');
INSERT INTO `inciso` VALUES ('65', 'Nunca / Jamás', './imagenes/Inciso65.jpg', '1', '26', '1', null, '1');
INSERT INTO `inciso` VALUES ('66', 'Poco', './imagenes/Inciso66.jpg', '2', '26', '2', null, '1');
INSERT INTO `inciso` VALUES ('67', 'A veces', './imagenes/Inciso67.jpg', '3', '26', '3', null, '1');
INSERT INTO `inciso` VALUES ('68', 'Mucho', './imagenes/Inciso68.jpg', '4', '26', '4', null, '1');
INSERT INTO `inciso` VALUES ('69', 'Mucho más / Siempre', './imagenes/Inciso69.jpg', '5', '26', '5', null, '1');
INSERT INTO `inciso` VALUES ('70', 'Nunca / Jamás', './imagenes/Inciso70.jpg', '1', '27', '1', null, '1');
INSERT INTO `inciso` VALUES ('71', 'Poco', './imagenes/Inciso71.jpg', '2', '27', '2', null, '1');
INSERT INTO `inciso` VALUES ('72', 'A veces', './imagenes/Inciso72.jpg', '3', '27', '3', null, '1');
INSERT INTO `inciso` VALUES ('73', 'Mucho', './imagenes/Inciso73.jpg', '4', '27', '4', null, '1');
INSERT INTO `inciso` VALUES ('74', 'Mucho más / Siempre', './imagenes/Inciso74.jpg', '5', '27', '5', null, '1');
INSERT INTO `inciso` VALUES ('75', 'Nunca / Jamás', './imagenes/Inciso75.jpg', '1', '28', '1', null, '1');
INSERT INTO `inciso` VALUES ('76', 'Poco', './imagenes/Inciso76.jpg', '2', '28', '2', null, '1');
INSERT INTO `inciso` VALUES ('77', 'A veces', './imagenes/Inciso77.jpg', '3', '28', '3', null, '1');
INSERT INTO `inciso` VALUES ('78', 'Mucho', './imagenes/Inciso78.jpg', '4', '28', '4', null, '1');
INSERT INTO `inciso` VALUES ('79', 'Mucho más / Siempre', './imagenes/Inciso79.jpg', '5', '28', '5', null, '1');
INSERT INTO `inciso` VALUES ('80', 'Nunca / Jamás', './imagenes/Inciso80.jpg', '1', '29', '1', null, '1');
INSERT INTO `inciso` VALUES ('81', 'Poco', './imagenes/Inciso81.jpg', '2', '29', '2', null, '1');
INSERT INTO `inciso` VALUES ('82', 'A veces', './imagenes/Inciso82.jpg', '3', '29', '3', null, '1');
INSERT INTO `inciso` VALUES ('83', 'Mucho', './imagenes/Inciso83.jpg', '4', '29', '4', null, '1');
INSERT INTO `inciso` VALUES ('84', 'Mucho más / Siempre', './imagenes/Inciso84.jpg', '5', '29', '5', null, '1');
INSERT INTO `inciso` VALUES ('85', 'Hombre', './imagenes/Inciso85.jpg', '1', '3', '1', null, '1');
INSERT INTO `inciso` VALUES ('86', 'Mujer', './imagenes/Inciso86.jpg', '2', '3', '2', null, '1');
INSERT INTO `inciso` VALUES ('87', 'Nunca / Jamás', './imagenes/Inciso87.jpg', '1', '30', '1', null, '1');
INSERT INTO `inciso` VALUES ('88', 'Poco', './imagenes/Inciso88.jpg', '2', '30', '2', null, '1');
INSERT INTO `inciso` VALUES ('89', 'A veces', './imagenes/Inciso89.jpg', '3', '30', '3', null, '1');
INSERT INTO `inciso` VALUES ('90', 'Mucho', './imagenes/Inciso90.jpg', '4', '30', '4', null, '1');
INSERT INTO `inciso` VALUES ('91', 'Mucho más / Siempre', './imagenes/Inciso91.jpg', '5', '30', '5', null, '1');
INSERT INTO `inciso` VALUES ('92', 'Nunca / Jamás', './imagenes/Inciso92.jpg', '1', '31', '1', null, '1');
INSERT INTO `inciso` VALUES ('93', 'Poco', './imagenes/Inciso93.jpg', '2', '31', '2', null, '1');
INSERT INTO `inciso` VALUES ('94', 'A veces', './imagenes/Inciso94.jpg', '3', '31', '3', null, '1');
INSERT INTO `inciso` VALUES ('95', 'Mucho', './imagenes/Inciso95.jpg', '4', '31', '4', null, '1');
INSERT INTO `inciso` VALUES ('96', 'Mucho más / Siempre', './imagenes/Inciso96.jpg', '5', '31', '5', null, '1');
INSERT INTO `inciso` VALUES ('97', 'Nunca / Jamás', './imagenes/Inciso97.jpg', '1', '32', '1', null, '1');
INSERT INTO `inciso` VALUES ('98', 'Poco', './imagenes/Inciso98.jpg', '2', '32', '2', null, '1');
INSERT INTO `inciso` VALUES ('99', 'A veces', './imagenes/Inciso99.jpg', '3', '32', '3', null, '1');
INSERT INTO `inciso` VALUES ('100', 'Mucho', './imagenes/Inciso100.jpg', '4', '32', '4', null, '1');
INSERT INTO `inciso` VALUES ('101', 'Mucho más / Siempre', './imagenes/Inciso101.jpg', '5', '32', '5', null, '1');
INSERT INTO `inciso` VALUES ('102', 'Nunca / Jamás', './imagenes/Inciso102.jpg', '1', '33', '1', null, '1');
INSERT INTO `inciso` VALUES ('103', 'Poco', './imagenes/Inciso103.jpg', '2', '33', '2', null, '1');
INSERT INTO `inciso` VALUES ('104', 'A veces', './imagenes/Inciso104.jpg', '3', '33', '3', null, '1');
INSERT INTO `inciso` VALUES ('105', 'Mucho', './imagenes/Inciso105.jpg', '4', '33', '4', null, '1');
INSERT INTO `inciso` VALUES ('106', 'Mucho más / Siempre', './imagenes/Inciso106.jpg', '5', '33', '5', null, '1');
INSERT INTO `inciso` VALUES ('107', 'Nunca / Jamás', './imagenes/Inciso107.jpg', '1', '34', '1', null, '1');
INSERT INTO `inciso` VALUES ('108', 'Poco', './imagenes/Inciso108.jpg', '2', '34', '2', null, '1');
INSERT INTO `inciso` VALUES ('109', 'A veces', './imagenes/Inciso109.jpg', '3', '34', '3', null, '1');
INSERT INTO `inciso` VALUES ('110', 'Mucho', './imagenes/Inciso110.jpg', '4', '34', '4', null, '1');
INSERT INTO `inciso` VALUES ('111', 'Mucho más / Siempre', './imagenes/Inciso111.jpg', '5', '34', '5', null, '1');
INSERT INTO `inciso` VALUES ('112', 'Nunca / Jamás', './imagenes/Inciso112.jpg', '1', '35', '1', null, '1');
INSERT INTO `inciso` VALUES ('113', 'Poco', './imagenes/Inciso113.jpg', '2', '35', '2', null, '1');
INSERT INTO `inciso` VALUES ('114', 'A veces', './imagenes/Inciso114.jpg', '3', '35', '3', null, '1');
INSERT INTO `inciso` VALUES ('115', 'Mucho', './imagenes/Inciso115.jpg', '4', '35', '4', null, '1');
INSERT INTO `inciso` VALUES ('116', 'Mucho más / Siempre', './imagenes/Inciso116.jpg', '5', '35', '5', null, '1');
INSERT INTO `inciso` VALUES ('117', 'Nunca / Jamás', './imagenes/Inciso117.jpg', '1', '36', '1', null, '1');
INSERT INTO `inciso` VALUES ('118', 'Poco', './imagenes/Inciso118.jpg', '2', '36', '2', null, '1');
INSERT INTO `inciso` VALUES ('119', 'A veces', './imagenes/Inciso119.jpg', '3', '36', '3', null, '1');
INSERT INTO `inciso` VALUES ('120', 'Mucho', './imagenes/Inciso120.jpg', '4', '36', '4', null, '1');
INSERT INTO `inciso` VALUES ('121', 'Mucho más / Siempre', './imagenes/Inciso121.jpg', '5', '36', '5', null, '1');
INSERT INTO `inciso` VALUES ('122', 'Nunca / Jamás', './imagenes/Inciso122.jpg', '1', '37', '1', null, '1');
INSERT INTO `inciso` VALUES ('123', 'Poco', './imagenes/Inciso123.jpg', '2', '37', '2', null, '1');
INSERT INTO `inciso` VALUES ('124', 'A veces', './imagenes/Inciso124.jpg', '3', '37', '3', null, '1');
INSERT INTO `inciso` VALUES ('125', 'Mucho', './imagenes/Inciso125.jpg', '4', '37', '4', null, '1');
INSERT INTO `inciso` VALUES ('126', 'Mucho más / Siempre', './imagenes/Inciso126.jpg', '5', '37', '5', null, '1');
INSERT INTO `inciso` VALUES ('127', 'Nunca / Jamás', './imagenes/Inciso127.jpg', '1', '38', '1', null, '1');
INSERT INTO `inciso` VALUES ('128', 'Poco', './imagenes/Inciso128.jpg', '2', '38', '2', null, '1');
INSERT INTO `inciso` VALUES ('129', 'A veces', './imagenes/Inciso129.jpg', '3', '38', '3', null, '1');
INSERT INTO `inciso` VALUES ('130', 'Mucho', './imagenes/Inciso130.jpg', '4', '38', '4', null, '1');
INSERT INTO `inciso` VALUES ('131', 'Mucho más / Siempre', './imagenes/Inciso131.jpg', '5', '38', '5', null, '1');
INSERT INTO `inciso` VALUES ('132', 'Nunca / Jamás', './imagenes/Inciso132.jpg', '1', '39', '1', null, '1');
INSERT INTO `inciso` VALUES ('133', 'Poco', './imagenes/Inciso133.jpg', '2', '39', '2', null, '1');
INSERT INTO `inciso` VALUES ('134', 'A veces', './imagenes/Inciso134.jpg', '3', '39', '3', null, '1');
INSERT INTO `inciso` VALUES ('135', 'Mucho', './imagenes/Inciso135.jpg', '4', '39', '4', null, '1');
INSERT INTO `inciso` VALUES ('136', 'Mucho más / Siempre', './imagenes/Inciso136.jpg', '5', '39', '5', null, '1');
INSERT INTO `inciso` VALUES ('137', 'Nunca / Jamás', './imagenes/Inciso137.jpg', '1', '40', '1', null, '1');
INSERT INTO `inciso` VALUES ('138', 'Poco', './imagenes/Inciso138.jpg', '2', '40', '2', null, '1');
INSERT INTO `inciso` VALUES ('139', 'A veces', './imagenes/Inciso139.jpg', '3', '40', '3', null, '1');
INSERT INTO `inciso` VALUES ('140', 'Mucho', './imagenes/Inciso140.jpg', '4', '40', '4', null, '1');
INSERT INTO `inciso` VALUES ('141', 'Mucho más / Siempre', './imagenes/Inciso141.jpg', '5', '40', '5', null, '1');
INSERT INTO `inciso` VALUES ('142', 'Nunca / Jamás', './imagenes/Inciso142.jpg', '1', '41', '1', null, '1');
INSERT INTO `inciso` VALUES ('143', 'Poco', './imagenes/Inciso143.jpg', '2', '41', '2', null, '1');
INSERT INTO `inciso` VALUES ('144', 'A veces', './imagenes/Inciso144.jpg', '3', '41', '3', null, '1');
INSERT INTO `inciso` VALUES ('145', 'Mucho', './imagenes/Inciso145.jpg', '4', '41', '4', null, '1');
INSERT INTO `inciso` VALUES ('146', 'Mucho más / Siempre', './imagenes/Inciso146.jpg', '5', '41', '5', null, '1');
INSERT INTO `inciso` VALUES ('147', 'Nunca / Jamás', './imagenes/Inciso147.jpg', '1', '42', '1', null, '1');
INSERT INTO `inciso` VALUES ('148', 'Poco', './imagenes/Inciso148.jpg', '2', '42', '2', null, '1');
INSERT INTO `inciso` VALUES ('149', 'A veces', './imagenes/Inciso149.jpg', '3', '42', '3', null, '1');
INSERT INTO `inciso` VALUES ('150', 'Mucho', './imagenes/Inciso150.jpg', '4', '42', '4', null, '1');
INSERT INTO `inciso` VALUES ('151', 'Mucho más / Siempre', './imagenes/Inciso151.jpg', '5', '42', '5', null, '1');
INSERT INTO `inciso` VALUES ('152', 'Nunca / Jamás', './imagenes/Inciso152.jpg', '1', '43', '1', null, '1');
INSERT INTO `inciso` VALUES ('153', 'Poco', './imagenes/Inciso153.jpg', '2', '43', '2', null, '1');
INSERT INTO `inciso` VALUES ('154', 'A veces', './imagenes/Inciso154.jpg', '3', '43', '3', null, '1');
INSERT INTO `inciso` VALUES ('155', 'Mucho', './imagenes/Inciso155.jpg', '4', '43', '4', null, '1');
INSERT INTO `inciso` VALUES ('156', 'Mucho más / Siempre', './imagenes/Inciso156.jpg', '5', '43', '5', null, '1');
INSERT INTO `inciso` VALUES ('157', 'Nunca / Jamás', './imagenes/Inciso157.jpg', '1', '44', '1', null, '1');
INSERT INTO `inciso` VALUES ('158', 'Poco', './imagenes/Inciso158.jpg', '2', '44', '2', null, '1');
INSERT INTO `inciso` VALUES ('159', 'A veces ', './imagenes/Inciso159.jpg', '3', '44', '3', null, '1');
INSERT INTO `inciso` VALUES ('160', 'Mucho', './imagenes/Inciso160.jpg', '4', '44', '4', null, '1');
INSERT INTO `inciso` VALUES ('161', 'Mucho más / Siempre', './imagenes/Inciso161.jpg', '5', '44', '5', null, '1');
INSERT INTO `inciso` VALUES ('162', 'Nunca / Jamás', './imagenes/Inciso162.jpg', '1', '45', '1', null, '1');
INSERT INTO `inciso` VALUES ('163', 'Poco', './imagenes/Inciso163.jpg', '2', '45', '2', null, '1');
INSERT INTO `inciso` VALUES ('164', 'A veces', './imagenes/Inciso164.jpg', '3', '45', '3', null, '1');
INSERT INTO `inciso` VALUES ('165', 'Mucho', './imagenes/Inciso165.jpg', '4', '45', '4', null, '1');
INSERT INTO `inciso` VALUES ('166', 'Mucho más / Siempre', './imagenes/Inciso166.jpg', '5', '45', '5', null, '1');
INSERT INTO `inciso` VALUES ('167', 'Nunca / Jamás', './imagenes/Inciso167.jpg', '1', '46', '1', null, '1');
INSERT INTO `inciso` VALUES ('168', 'Poco', './imagenes/Inciso168.jpg', '2', '46', '2', null, '1');
INSERT INTO `inciso` VALUES ('169', 'A veces', './imagenes/Inciso169.jpg', '3', '46', '3', null, '1');
INSERT INTO `inciso` VALUES ('170', 'Mucho', './imagenes/Inciso170.jpg', '4', '46', '4', null, '1');
INSERT INTO `inciso` VALUES ('171', 'Mucho más / Siempre', './imagenes/Inciso171.jpg', '5', '46', '5', null, '1');
INSERT INTO `inciso` VALUES ('172', 'Nunca / Jamás', './imagenes/Inciso172.jpg', '1', '47', '1', null, '1');
INSERT INTO `inciso` VALUES ('173', 'Poco', './imagenes/Inciso173.jpg', '2', '47', '2', null, '1');
INSERT INTO `inciso` VALUES ('174', 'A veces', './imagenes/Inciso174.jpg', '3', '47', '3', null, '1');
INSERT INTO `inciso` VALUES ('175', 'Mucho', './imagenes/Inciso175.jpg', '4', '47', '4', null, '1');
INSERT INTO `inciso` VALUES ('176', 'Mucho más / Siempre', './imagenes/Inciso176.jpg', '5', '47', '5', null, '1');
INSERT INTO `inciso` VALUES ('177', 'Sí', '', '1', '48', '1', null, '1');
INSERT INTO `inciso` VALUES ('178', 'No', '', '2', '48', '2', null, '1');
INSERT INTO `inciso` VALUES ('179', 'Soltero', './imagenes/Inciso179.jpg', '1', '5', '1', null, '1');
INSERT INTO `inciso` VALUES ('180', 'Casado', './imagenes/Inciso180.jpg', '2', '5', '2', null, '1');
INSERT INTO `inciso` VALUES ('181', 'Unión Libre', './imagenes/Inciso181.jpg', '3', '5', '3', null, '1');
INSERT INTO `inciso` VALUES ('182', 'Otro', '', '4', '5', '4', null, '1');
INSERT INTO `inciso` VALUES ('183', 'Novio o novia', '', '1', '50', '1', null, '1');
INSERT INTO `inciso` VALUES ('184', 'Amigo o amiga', '', '2', '50', '2', null, '1');
INSERT INTO `inciso` VALUES ('185', 'Un familiar', '', '3', '50', '3', null, '1');
INSERT INTO `inciso` VALUES ('186', 'Alguien desconocido', '', '4', '50', '4', null, '1');
INSERT INTO `inciso` VALUES ('187', 'Otro', '', '5', '50', null, null, '1');
INSERT INTO `inciso` VALUES ('188', 'Sí', '', '1', '51', '1', null, '1');
INSERT INTO `inciso` VALUES ('189', 'No', '', '2', '51', '2', null, '1');
INSERT INTO `inciso` VALUES ('190', 'Sí', '', '1', '52', '1', null, '1');
INSERT INTO `inciso` VALUES ('191', 'No', '', '2', '52', '2', null, '1');
INSERT INTO `inciso` VALUES ('192', 'Mi casa', '', '1', '53', '1', null, '1');
INSERT INTO `inciso` VALUES ('193', 'Casa amigo o amiga', '', '2', '53', '2', null, '1');
INSERT INTO `inciso` VALUES ('194', 'Casa mi novio o novia', '', '3', '53', '3', null, '1');
INSERT INTO `inciso` VALUES ('195', 'Hotel', '', '4', '53', '4', null, '1');
INSERT INTO `inciso` VALUES ('196', 'Casa familia', '', '5', '53', '5', null, '1');
INSERT INTO `inciso` VALUES ('197', 'Sí', '', '1', '54', '1', null, '1');
INSERT INTO `inciso` VALUES ('198', 'No', '', '2', '54', '2', null, '1');
INSERT INTO `inciso` VALUES ('199', 'Nada', '', '1', '55', '1', null, '1');
INSERT INTO `inciso` VALUES ('200', 'Condón hombre', '', '2', '55', '2', null, '1');
INSERT INTO `inciso` VALUES ('201', 'Pastilas anticonceptivas o del día siguiente ( pastilla para NO bebé)', '', '3', '55', '3', null, '1');
INSERT INTO `inciso` VALUES ('202', 'No eyacular (moco blanco hombre) NO adentro mujer', '', '4', '55', '4', null, '1');
INSERT INTO `inciso` VALUES ('203', 'Sexo ano', '', '5', '55', '5', null, '1');
INSERT INTO `inciso` VALUES ('204', 'Otro', '', '6', '55', '6', null, '1');
INSERT INTO `inciso` VALUES ('205', 'No tiene escuela', '', '1', '6', '1', null, '1');
INSERT INTO `inciso` VALUES ('206', 'Aprender oficio', '', '2', '6', '2', null, '1');
INSERT INTO `inciso` VALUES ('207', 'Primaria', '', '3', '6', '3', null, '1');
INSERT INTO `inciso` VALUES ('208', 'Secundario o Carrera Técnica', '', '4', '6', '4', null, '1');
INSERT INTO `inciso` VALUES ('209', 'Preparatoria', '', '5', '6', '5', null, '1');
INSERT INTO `inciso` VALUES ('210', 'Universidad', '', '6', '6', '6', null, '1');
INSERT INTO `inciso` VALUES ('211', '1 (sólo una)', '', '1', '60', '1', null, '1');
INSERT INTO `inciso` VALUES ('212', '2 (dos)', '', '2', '60', '2', null, '1');
INSERT INTO `inciso` VALUES ('213', '3 (tres)', '', '3', '60', '3', null, '1');
INSERT INTO `inciso` VALUES ('214', '4 (cuatro o MÁS)', '', '4', '60', '4', null, '1');
INSERT INTO `inciso` VALUES ('215', 'Sí', '', '1', '63', '1', null, '1');
INSERT INTO `inciso` VALUES ('216', 'No', '', '2', '63', '2', null, '1');
INSERT INTO `inciso` VALUES ('217', 'Sí', '', '1', '64', '1', null, '1');
INSERT INTO `inciso` VALUES ('218', 'No', '', '2', '64', '2', null, '1');
INSERT INTO `inciso` VALUES ('219', 'Sí', '', '1', '65', '1', null, '1');
INSERT INTO `inciso` VALUES ('220', 'No', '', '2', '65', '2', null, '1');
INSERT INTO `inciso` VALUES ('221', 'Sí', '', '1', '66', '1', null, '1');
INSERT INTO `inciso` VALUES ('222', 'No', '', '2', '66', '2', null, '1');
INSERT INTO `inciso` VALUES ('223', 'Sí', '', '1', '67', '1', null, '1');
INSERT INTO `inciso` VALUES ('224', 'No', '', '2', '67', '2', null, '1');
INSERT INTO `inciso` VALUES ('225', 'Sí', '', '1', '68', '1', null, '1');
INSERT INTO `inciso` VALUES ('226', 'No', '', '2', '68', '2', null, '1');
INSERT INTO `inciso` VALUES ('227', 'Sí', '', '1', '69', '1', null, '1');
INSERT INTO `inciso` VALUES ('228', 'No', '', '2', '69', '2', null, '1');
INSERT INTO `inciso` VALUES ('229', 'Sí', '', '1', '7', '1', null, '1');
INSERT INTO `inciso` VALUES ('230', 'No', '', '2', '7', '2', null, '1');
INSERT INTO `inciso` VALUES ('231', 'Sí', '', '1', '70', '1', null, '1');
INSERT INTO `inciso` VALUES ('232', 'No', '', '2', '70', '2', null, '1');
INSERT INTO `inciso` VALUES ('233', 'Sí', '', '1', '71', '1', null, '1');
INSERT INTO `inciso` VALUES ('234', 'No', '', '2', '71', '2', null, '1');
INSERT INTO `inciso` VALUES ('235', 'Nunca / Jamás', './imagenes/Inciso235.jpg', '1', '72', '1', null, '1');
INSERT INTO `inciso` VALUES ('236', 'Poco', './imagenes/Inciso236.jpg', '2', '72', '2', null, '1');
INSERT INTO `inciso` VALUES ('237', 'A veces', './imagenes/Inciso237.jpg', '3', '72', '3', null, '1');
INSERT INTO `inciso` VALUES ('238', 'Mucho', './imagenes/Inciso238.jpg', '4', '72', '4', null, '1');
INSERT INTO `inciso` VALUES ('239', 'Mucho más / Siempre', './imagenes/Inciso239.jpg', '5', '72', '5', null, '1');
INSERT INTO `inciso` VALUES ('240', 'Nunca / Jamás', './imagenes/Inciso240.jpg', '1', '73', '1', null, '1');
INSERT INTO `inciso` VALUES ('241', 'Poco', './imagenes/Inciso241.jpg', '2', '73', '2', null, '1');
INSERT INTO `inciso` VALUES ('242', 'A veces', './imagenes/Inciso242.jpg', '3', '73', '3', null, '1');
INSERT INTO `inciso` VALUES ('243', 'Mucho', './imagenes/Inciso243.jpg', '4', '73', '4', null, '1');
INSERT INTO `inciso` VALUES ('244', 'Mucho más / Siempre', './imagenes/Inciso244.jpg', '5', '73', '5', null, '1');
INSERT INTO `inciso` VALUES ('245', 'Nunca / Jamás', './imagenes/Inciso245.jpg', '1', '74', '1', null, '1');
INSERT INTO `inciso` VALUES ('246', 'Poco', './imagenes/Inciso246.jpg', '2', '74', '2', null, '1');
INSERT INTO `inciso` VALUES ('247', 'A veces', './imagenes/Inciso247.jpg', '3', '74', '3', null, '1');
INSERT INTO `inciso` VALUES ('248', 'Mucho', './imagenes/Inciso248.jpg', '4', '74', '4', null, '1');
INSERT INTO `inciso` VALUES ('249', 'Mucho más / Siempre', './imagenes/Inciso249.jpg', '5', '74', '5', null, '1');
INSERT INTO `inciso` VALUES ('250', 'Nunca / Jamás', './imagenes/Inciso250.jpg', '1', '75', '1', null, '1');
INSERT INTO `inciso` VALUES ('251', 'Poco', './imagenes/Inciso251.jpg', '2', '75', '2', null, '1');
INSERT INTO `inciso` VALUES ('252', 'A veces', './imagenes/Inciso252.jpg', '3', '75', '3', null, '1');
INSERT INTO `inciso` VALUES ('253', 'Mucho', './imagenes/Inciso253.jpg', '4', '75', '4', null, '1');
INSERT INTO `inciso` VALUES ('254', 'Mucho más / Siempre', './imagenes/Inciso254.jpg', '5', '75', '5', null, '1');
INSERT INTO `inciso` VALUES ('255', 'Nunca / Jamás', './imagenes/Inciso255.jpg', '1', '76', '1', null, '1');
INSERT INTO `inciso` VALUES ('256', 'Poco', './imagenes/Inciso256.jpg', '2', '76', '2', null, '1');
INSERT INTO `inciso` VALUES ('257', 'A veces', './imagenes/Inciso257.jpg', '3', '76', '3', null, '1');
INSERT INTO `inciso` VALUES ('258', 'Mucho', './imagenes/Inciso258.jpg', '4', '76', '4', null, '1');
INSERT INTO `inciso` VALUES ('259', 'Mucho más / Siempre', './imagenes/Inciso259.jpg', '5', '76', '5', null, '1');
INSERT INTO `inciso` VALUES ('260', 'Nunca / Jamás', '', '1', '77', '1', null, '1');
INSERT INTO `inciso` VALUES ('261', 'Poco', '', '2', '77', '2', null, '1');
INSERT INTO `inciso` VALUES ('262', 'A veces', '', '3', '77', '3', null, '1');
INSERT INTO `inciso` VALUES ('263', 'Mucho', '', '4', '77', '4', null, '1');
INSERT INTO `inciso` VALUES ('264', 'Mucho más / Siempre', '', '5', '77', '5', null, '1');
INSERT INTO `inciso` VALUES ('265', 'Nunca / Jamás', '', '1', '78', '1', null, '1');
INSERT INTO `inciso` VALUES ('266', 'Poco', '', '2', '78', '2', null, '1');
INSERT INTO `inciso` VALUES ('267', 'A veces', '', '3', '78', '3', null, '1');
INSERT INTO `inciso` VALUES ('268', 'Mucho', '', '4', '78', '4', null, '1');
INSERT INTO `inciso` VALUES ('269', 'Mucho más / Siempre', '', '5', '78', '5', null, '1');
INSERT INTO `inciso` VALUES ('270', 'Nunca / Jamás', '', '1', '79', '1', null, '1');
INSERT INTO `inciso` VALUES ('271', 'Poco', '', '2', '79', '2', null, '1');
INSERT INTO `inciso` VALUES ('272', 'A veces', '', '3', '79', '3', null, '1');
INSERT INTO `inciso` VALUES ('273', 'Mucho', '', '4', '79', '4', null, '1');
INSERT INTO `inciso` VALUES ('274', 'Mucho más / Siempre', '', '5', '79', '5', null, '1');
INSERT INTO `inciso` VALUES ('275', 'Visual', './imagenes/Inciso275.jpg', '1', '8', '1', null, '1');
INSERT INTO `inciso` VALUES ('276', 'Auditiva', './imagenes/Inciso276.jpg', '2', '8', '2', null, '1');
INSERT INTO `inciso` VALUES ('277', 'Motriz', './imagenes/Inciso277.jpg', '3', '8', '3', null, '1');
INSERT INTO `inciso` VALUES ('278', 'Otra', '', '4', '8', '4', null, '1');
INSERT INTO `inciso` VALUES ('279', 'NO tiene discapacidad', '', '5', '8', '5', null, '1');
INSERT INTO `inciso` VALUES ('280', 'Verdadero', '', '1', '80', '1', null, '1');
INSERT INTO `inciso` VALUES ('281', 'Falso', '', '2', '80', '2', null, '1');
INSERT INTO `inciso` VALUES ('282', 'No sé', '', '3', '80', '3', null, '1');
INSERT INTO `inciso` VALUES ('283', 'Verdadero', '', '1', '81', '1', null, '1');
INSERT INTO `inciso` VALUES ('284', 'Falso', '', '2', '81', '2', null, '1');
INSERT INTO `inciso` VALUES ('285', 'No sé', '', '3', '81', '3', null, '1');
INSERT INTO `inciso` VALUES ('286', 'Verdadero', '', '1', '82', '1', null, '1');
INSERT INTO `inciso` VALUES ('287', 'Falso', '', '2', '82', '2', null, '1');
INSERT INTO `inciso` VALUES ('288', 'No sé', '', '3', '82', '3', null, '1');
INSERT INTO `inciso` VALUES ('289', 'Verdadero', '', '1', '83', '1', null, '1');
INSERT INTO `inciso` VALUES ('290', 'Falso', '', '2', '83', '2', null, '1');
INSERT INTO `inciso` VALUES ('291', 'No sé', '', '3', '83', '3', null, '1');
INSERT INTO `inciso` VALUES ('292', 'Verdadero', '', '1', '84', '1', null, '1');
INSERT INTO `inciso` VALUES ('293', 'Falso', '', '2', '84', '2', null, '1');
INSERT INTO `inciso` VALUES ('294', 'No sé', '', '3', '84', '3', null, '1');
INSERT INTO `inciso` VALUES ('295', 'Verdadero', '', '1', '85', '1', null, '1');
INSERT INTO `inciso` VALUES ('296', 'Falso', '', '2', '85', '2', null, '1');
INSERT INTO `inciso` VALUES ('297', 'No sé', '', '3', '85', '3', null, '1');
INSERT INTO `inciso` VALUES ('298', 'Verdadero', '', '1', '86', '1', null, '1');
INSERT INTO `inciso` VALUES ('299', 'Falso', '', '2', '86', '2', null, '1');
INSERT INTO `inciso` VALUES ('300', 'No sé', '', '3', '86', '3', null, '1');
INSERT INTO `inciso` VALUES ('301', 'Verdadero', '', '1', '87', '1', null, '1');
INSERT INTO `inciso` VALUES ('302', 'Falso', '', '2', '87', '2', null, '1');
INSERT INTO `inciso` VALUES ('303', 'No sé', '', '3', '87', '3', null, '1');
INSERT INTO `inciso` VALUES ('304', 'Verdadero', '', '1', '88', '1', null, '1');
INSERT INTO `inciso` VALUES ('305', 'Falso', '', '2', '88', '2', null, '1');
INSERT INTO `inciso` VALUES ('306', 'No sé', '', '3', '88', '3', null, '1');
INSERT INTO `inciso` VALUES ('307', 'Verdadero', '', '1', '89', '1', null, '1');
INSERT INTO `inciso` VALUES ('308', 'Falso', '', '2', '89', '2', null, '1');
INSERT INTO `inciso` VALUES ('309', 'No sé', '', '3', '89', '3', null, '1');
INSERT INTO `inciso` VALUES ('310', 'Sí', '', '1', '9', '1', null, '1');
INSERT INTO `inciso` VALUES ('311', 'No', '', '2', '9', '2', null, '1');
INSERT INTO `inciso` VALUES ('312', 'Verdadero', '', '1', '90', '1', null, '1');
INSERT INTO `inciso` VALUES ('313', 'Falso', '', '2', '90', '2', null, '1');
INSERT INTO `inciso` VALUES ('314', 'No sé', '', '3', '90', '3', null, '1');
INSERT INTO `inciso` VALUES ('315', 'Verdadero', '', '1', '91', '1', null, '1');
INSERT INTO `inciso` VALUES ('316', 'Falso', '', '2', '91', '2', null, '1');
INSERT INTO `inciso` VALUES ('317', 'No sé', '', '3', '91', '3', null, '1');
INSERT INTO `inciso` VALUES ('318', 'Verdadero', '', '1', '92', '1', null, '1');
INSERT INTO `inciso` VALUES ('319', 'Falso', '', '2', '92', '2', null, '1');
INSERT INTO `inciso` VALUES ('320', 'No sé', '', '3', '92', '3', null, '1');
INSERT INTO `inciso` VALUES ('321', 'Verdadero', '', '1', '93', '1', null, '1');
INSERT INTO `inciso` VALUES ('322', 'Falso', '', '2', '93', '2', null, '1');
INSERT INTO `inciso` VALUES ('323', 'No sé', '', '3', '93', '3', null, '1');

-- ----------------------------
-- Table structure for pantalla_de_instruccion
-- ----------------------------
DROP TABLE IF EXISTS `pantalla_de_instruccion`;
CREATE TABLE `pantalla_de_instruccion` (
  `id_pantalla_de_instruccion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `ruta_imagen` varchar(100) DEFAULT NULL,
  `ruta_video` varchar(100) DEFAULT NULL,
  `secuencia` int(11) DEFAULT NULL,
  `estatus` tinyint(1) DEFAULT NULL,
  `id_seccion` int(11) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`id_pantalla_de_instruccion`),
  KEY `f12_idx` (`id_seccion`),
  CONSTRAINT `f12` FOREIGN KEY (`id_seccion`) REFERENCES `pregunta` (`id_seccion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pantalla_de_instruccion
-- ----------------------------

-- ----------------------------
-- Table structure for permiso
-- ----------------------------
DROP TABLE IF EXISTS `permiso`;
CREATE TABLE `permiso` (
  `id_permiso` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_permiso`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permiso
-- ----------------------------
INSERT INTO `permiso` VALUES ('1', 'lectura');
INSERT INTO `permiso` VALUES ('2', 'creacion y modificacion');
INSERT INTO `permiso` VALUES ('3', 'mantenimiento');

-- ----------------------------
-- Table structure for persona
-- ----------------------------
DROP TABLE IF EXISTS `persona`;
CREATE TABLE `persona` (
  `id_persona` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido_paterno` varchar(35) DEFAULT NULL,
  `apellido_materno` varchar(35) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `genero` int(11) DEFAULT NULL,
  `id_direccion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_persona`),
  KEY `f5_idx` (`id_direccion`),
  CONSTRAINT `f5` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id_direccion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of persona
-- ----------------------------
INSERT INTO `persona` VALUES ('1', 'susana', 'robles', 'montijo', 'susana@campus.iztacala.unam.mx', null, '1', '1');
INSERT INTO `persona` VALUES ('2', 'breatriz', 'frías', 'arroyo', 'bety.frias@gmail.com', null, '1', '2');
INSERT INTO `persona` VALUES ('3', 'yuma', 'yoaly', 'pérez', 'yoaly_yu@hotmail.com', null, '1', '3');
INSERT INTO `persona` VALUES ('4', 'jorge', 'salgado', 'mendoza', 'keymanky@hotmail.com', '1991-01-16', '2', '4');
INSERT INTO `persona` VALUES ('5', 'dyana erika', 'marrón', 'luna', 'dyana.marron@gmail.com', null, '1', '5');
INSERT INTO `persona` VALUES ('6', ' ', ' ', ' ', ' ', '0000-00-00', null, '6');
INSERT INTO `persona` VALUES ('7', ' ', ' ', ' ', ' ', '0000-00-00', null, '7');
INSERT INTO `persona` VALUES ('8', ' ', ' ', ' ', ' ', '0000-00-00', null, '8');

-- ----------------------------
-- Table structure for pregunta
-- ----------------------------
DROP TABLE IF EXISTS `pregunta`;
CREATE TABLE `pregunta` (
  `id_pregunta` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` text,
  `ruta_imagen` varchar(100) DEFAULT NULL,
  `ruta_video` varchar(100) DEFAULT NULL,
  `secuencia` int(11) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `id_seccion` int(11) DEFAULT NULL,
  `estatus` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_pregunta`),
  KEY `f9_idx` (`id_seccion`),
  CONSTRAINT `f9` FOREIGN KEY (`id_seccion`) REFERENCES `seccion` (`id_seccion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pregunta
-- ----------------------------
INSERT INTO `pregunta` VALUES ('1', 'Tú:', null, './videos/Pregunta1.mp4', '1', 'Tipo o nivel de la discapacidad', '1', '1');
INSERT INTO `pregunta` VALUES ('2', 'Tú sordo o hipoacusia ASÍ NACIÓ o cuando NIÑO tu sordo o hipoacusia cuántos años:', null, './videos/Pregunta2.mp4', '2', 'Edad inicial de la discapacidad', '1', '1');
INSERT INTO `pregunta` VALUES ('3', 'Tú:', null, './videos/Pregunta3.mp4', '3', 'Sexo', '1', '1');
INSERT INTO `pregunta` VALUES ('4', 'Tú cuántos años ahorita:', null, './videos/Pregunta4.mp4', '4', 'Edad actual', '1', '1');
INSERT INTO `pregunta` VALUES ('5', 'Tú:', null, './videos/Pregunta5.mp4', '5', 'Estado civil', '1', '1');
INSERT INTO `pregunta` VALUES ('6', 'Tú nivel estudios hasta:', null, './videos/Pregunta6.mp4', '6', 'Nivel Estudios', '1', '1');
INSERT INTO `pregunta` VALUES ('7', '¿Tu PAPÁ vive?', null, './videos/Pregunta7.mp4', '7', 'Vive papá', '1', '1');
INSERT INTO `pregunta` VALUES ('8', '¿Tu PAPÁ tiene discapacidad:', null, './videos/Pregunta8.mp4', '8', 'Discapacidad del papá', '1', '1');
INSERT INTO `pregunta` VALUES ('9', '¿Tu MAMÁ vive?', null, './videos/Pregunta9.mp4', '9', 'Vive mamá', '1', '1');
INSERT INTO `pregunta` VALUES ('10', '¿Tu MAMÁ tiene discapacidad?', null, './videos/Pregunta10.mp4', '10', 'Discapacidad de la mamá', '1', '1');
INSERT INTO `pregunta` VALUES ('11', '¿Tu PAPÁ y MAMÁ viven:', null, './videos/Pregunta11.mp4', '11', 'Papá y mamá viven juntos o separados', '1', '1');
INSERT INTO `pregunta` VALUES ('12', 'Tu PAPÁ cuántos años ahorita:', null, './videos/Pregunta12.mp4', '12', 'Edad del papá', '1', '1');
INSERT INTO `pregunta` VALUES ('13', 'Tu MAMÁ cuántos años ahorita:', null, './videos/Pregunta13.mp4', '13', 'Edad de la mamá', '1', '1');
INSERT INTO `pregunta` VALUES ('14', 'Tu PAPÁ nivel estudios:', null, './videos/Pregunta14.mp4', '14', 'Nivel de estudios del papá', '1', '1');
INSERT INTO `pregunta` VALUES ('15', 'Tu MAMÁ nivel estudios:', null, './videos/Pregunta15.mp4', '15', 'Nivel de estudios de la mamá', '1', '1');
INSERT INTO `pregunta` VALUES ('16', '¿TÚ ahorita dónde vives?', null, './videos/Pregunta16.mp4', '16', 'Con quién vive el participante', '1', '1');
INSERT INTO `pregunta` VALUES ('17', 'Tu PAPÁ trabaja', null, './videos/Pregunta17.mp4', '17', 'El papá trabaja', '1', '1');
INSERT INTO `pregunta` VALUES ('18', 'Tu MAMÁ trabaja', null, './videos/Pregunta18.mp4', '18', 'La mamá trabaja', '1', '1');
INSERT INTO `pregunta` VALUES ('19', 'TÚ trabajas', null, './videos/Pregunta19.mp4', '19', 'Trabaja el participante', '1', '1');
INSERT INTO `pregunta` VALUES ('20', 'TÚ y tu PAPÁ cuánto platicar\n\"bien o mal cuando hay sexo\"', null, './videos/Pregunta20.mp4', '1', 'Papá - Ventajas y desventajas de tener relaciones sexuales', '2', '1');
INSERT INTO `pregunta` VALUES ('21', 'TÚ y tu PAPÁ cuánto platicar\n\"tú esperar después para sexo, ahorita NO\"', null, './videos/Pregunta21.mp4', '2', 'Papá - Posponer encuentro sexual', '2', '1');
INSERT INTO `pregunta` VALUES ('22', 'TÚ y tu PAPÁ cuánto platicar\n\"tú decir SÍ o NO quiere sexo\"', null, './videos/Pregunta22.mp4', '3', 'Papá - Tener relaciones sexuales por decisión propia', '2', '1');
INSERT INTO `pregunta` VALUES ('23', 'TÚ y tu PAPÁ cuánto platicar\n\"OTRA PERSONA tocar tuyo cuerpo o quiere sexo a fuerza y TÚ NO quiere sexo, tú decir NO\"', null, './videos/Pregunta23.mp4', '4', 'Papá - No permitir abuso sexual ', '2', '1');
INSERT INTO `pregunta` VALUES ('24', 'TÚ y tu PAPÁ cuánto platicar\n\"CÓMO cuidar para NO embarazo\"', null, './videos/Pregunta24.mp4', '5', 'Papá - Cómo evitar un embarazo', '2', '1');
INSERT INTO `pregunta` VALUES ('25', 'TÚ y tu PAPÁ cuánto platicar\n\"CÓMO pega las infecciones sexo y SIDA\"', null, './videos/Pregunta25.mp4', '6', 'Papá - Cómo se contraen las ETS', '2', '1');
INSERT INTO `pregunta` VALUES ('26', 'TÚ y tu PAPÁ cuánto platicar\n\"Métodos anticonceptivos\"\nEjemplo: Pastillas para no embarazo, condón, dispositivo.', null, './videos/Pregunta26.mp4', '7', 'Papá - Comunicación sobre métodos anticonceptivos', '2', '1');
INSERT INTO `pregunta` VALUES ('27', 'TÚ y tu PAPÁ cuánto platicar\n\"CÓMO usar CONDÓN HOMBRE\"', null, './videos/Pregunta27.mp4', '8', 'Papá - Cómo usar condón masculino ', '2', '1');
INSERT INTO `pregunta` VALUES ('28', 'TÚ y tu PAPÁ cuánto platicar\n\"CÓMO usar CONDÓN MUJER\"', null, './videos/Pregunta28.mp4', '9', 'Papá - Cómo usar condón femenino', '2', '1');
INSERT INTO `pregunta` VALUES ('29', 'TÚ y tu PAPÁ cuánto platicar\n\"DÓNDE comprar o personas regalar CONDONES\"', null, './videos/Pregunta29.mp4', '10', 'Papá - Dónde comprar o adquirir condones', '2', '1');
INSERT INTO `pregunta` VALUES ('30', 'TÚ y tu PAPÁ cuánto platicar\n\"CONDÓN bueno seguro no pegar infección sexo o no embarazo\"', null, './videos/Pregunta30.mp4', '11', 'Papá - Efectividad del condón para prevenir infecciones y embarazos', '2', '1');
INSERT INTO `pregunta` VALUES ('31', 'TÚ y tu MAMÁ cuánto platicar\n\"bien o mal cuando hay sexo\"', null, './videos/Pregunta31.mp4', '12', 'Mamá - Ventajas y desventajas de tener relaciones sexuales', '2', '1');
INSERT INTO `pregunta` VALUES ('32', 'TÚ y tu MAMÁ cuánto platicar\n\"tú esperar después para sexo, ahorita NO\"', null, './videos/Pregunta32.mp4', '13', 'Mamá - posponer encuentro sexual', '2', '1');
INSERT INTO `pregunta` VALUES ('33', 'TÚ y tu MAMÁ cuánto platicar\n\"tú decir SI o NO quiere sexo\"', null, './videos/Pregunta33.mp4', '14', 'Mamá - Tener relaciones sexuales por decisión propia', '2', '1');
INSERT INTO `pregunta` VALUES ('34', 'TÚ y tu MAMÁ cuánto platicar\n\"OTRA PERSONA tocar tuyo cuerpo o quiere sexo a fuerza y TÚ NO quiere sexo, tú decir NO\"', null, './videos/Pregunta34.mp4', '15', 'Mamá - No permitir el abuso sexual', '2', '1');
INSERT INTO `pregunta` VALUES ('35', 'TÚ y tu MAMÁ cuánto platicar\n\"CÓMO cuidar para NO embarazo\"', null, './videos/Pregunta35.mp4', '16', 'Mamá - Cómo evitar un embarazo', '2', '1');
INSERT INTO `pregunta` VALUES ('36', 'TÚ y tu MAMÁ cuánto platicar\n\"CÓMO pega las infecciones sexo y SIDA\"', null, './videos/Pregunta36.mp4', '17', 'Mamá - Cómo se contraen las ETS', '2', '1');
INSERT INTO `pregunta` VALUES ('37', 'TÚ y tu MAMÁ cuánto platicar\n\"Métodos anticonceptivos\"\nEjemplo: Pastillas para NO embarazo, condón, dispositivo.', null, './videos/Pregunta37.mp4', '18', 'Mamá - Comunicación sobre métodos anticonceptivos', '2', '1');
INSERT INTO `pregunta` VALUES ('38', 'TÚ y tu MAMÁ cuánto platicar\n\"CÓMO usar CONDÓN HOMBRE\"', null, './videos/Pregunta38.mp4', '19', 'Mamá - Cómo usar condón masculino', '2', '1');
INSERT INTO `pregunta` VALUES ('39', 'TÚ y tu MAMÁ cuánto platicar\n\"CÓMO usar CONDÓN MUJER\"', null, './videos/Pregunta39.mp4', '20', 'Mamá - Cómo usar condón femenino', '2', '1');
INSERT INTO `pregunta` VALUES ('40', 'TÚ y tu MAMÁ cuánto platicar, \n\"DÓNDE comprar o personas regalar CONDONES\"', null, './videos/Pregunta40.mp4', '21', 'Mamá - Dónde comparar o adquirir condones', '2', '1');
INSERT INTO `pregunta` VALUES ('41', 'TÚ y tu MAMÁ cuánto platicar\n\"CONDÓN bueno seguro no pegar infección sexo y no embarazo\"', null, './videos/Pregunta41.mp4', '22', 'Mamá - Efectividad del condón para prevenir infecciones y embarazos', '2', '1');
INSERT INTO `pregunta` VALUES ('42', 'Tu PAPÁ ayuda para TÚ aprender cosas sexo', null, './videos/Pregunta42.mp4', '23', 'Papá - Apoyo educación sexual', '2', '1');
INSERT INTO `pregunta` VALUES ('43', 'Tu MAMÁ ayuda para TÚ aprender cosas sexo', null, './videos/Pregunta43.mp4', '24', 'Mamá - Apoyo en educación sexual', '2', '1');
INSERT INTO `pregunta` VALUES ('44', 'Tu PAPÁ ayuda para TÚ bien, salud y sexo cuidado NO infección sexo, NO embarazo', null, './videos/Pregunta44.mp4', '25', 'Papá - Contribución en Bienestar y Salud', '2', '1');
INSERT INTO `pregunta` VALUES ('45', 'Tu MAMÁ ayuda para TÚ bien, salud y sexo cuidado NO infección sexo, NO embarazo', null, './videos/Pregunta45.mp4', '26', 'Mamá - Contribución en Bienestar y Salud', '2', '1');
INSERT INTO `pregunta` VALUES ('46', 'Tu PAPÁ cuida, platica, pregunta cosas TU escuela o amigos o novio(a)', null, './videos/Pregunta46.mp4', '27', 'Padre al pendiente de su hijo', '2', '1');
INSERT INTO `pregunta` VALUES ('47', 'Tu MAMÁ cuida, platica, pregunta cosas TU escuela o amigos o novio(a)', null, './videos/Pregunta47.mp4', '28', 'Madre al pendiente de su hijo', '2', '1');
INSERT INTO `pregunta` VALUES ('48', '¿TÚ ya antes hay sexo?', null, './videos/Pregunta48.mp4', '1', 'Tener relaciones sexuales', '3', '1');
INSERT INTO `pregunta` VALUES ('49', '¿TÚ cuántos años cuando PRIMERO sexo?', null, './videos/Pregunta49.mp4', '2', 'Edad primera relación sexual', '3', '1');
INSERT INTO `pregunta` VALUES ('50', 'TÚ cuál persona PRIMERO sexo', null, './videos/Pregunta50.mp4', '3', 'Primer persona sexo', '3', '1');
INSERT INTO `pregunta` VALUES ('51', 'TÚ PRIMERO relación sexo otra persona A FUERZA y TÚ no gusta o no quiere', null, './videos/Pregunta51.mp4', '4', 'Primera relación sexual forzada', '3', '1');
INSERT INTO `pregunta` VALUES ('52', 'TÚ piensa dónde, cómo y cuándo PRIMERO relación sexo', null, './videos/Pregunta52.mp4', '5', 'Planeación de la primera relación sexual', '3', '1');
INSERT INTO `pregunta` VALUES ('53', 'TÚ dónde PRIMERO sexo', null, './videos/Pregunta53.mp4', '6', 'Lugar de la primera relación sexual', '3', '1');
INSERT INTO `pregunta` VALUES ('54', 'TÚ PRIMERO sexo tú USAR método anticonceptivo\nEjemplo: condón, pastilla no embarazo, dispositivo', null, './videos/Pregunta54.mp4', '7', 'Uso de métodos anticonceptivos en primera relación sexual', '3', '1');
INSERT INTO `pregunta` VALUES ('55', 'TÚ cuál USAR PRIMERO relación sexo', null, './videos/Pregunta55.mp4', '8', 'Método anticonceptivo usado en primera relación sexual', '3', '1');
INSERT INTO `pregunta` VALUES ('56', 'TÚ cuántas veces tener relaciones sexo hasta ahora ', null, './videos/Pregunta56.mp4', '9', 'Número de relaciones sexuales en toda la vida', '3', '1');
INSERT INTO `pregunta` VALUES ('57', 'TÚ cuántas veces usar condón hasta ahora ', null, './videos/Pregunta57.mp4', '10', 'Número de veces que usó condón en toda la vida', '3', '1');
INSERT INTO `pregunta` VALUES ('58', 'TÚ cuántas veces relaciones sexo últimos 3 meses ', null, './videos/Pregunta58.mp4', '11', 'Número relaciones últimos 3 meses', '3', '1');
INSERT INTO `pregunta` VALUES ('59', 'TÚ cuántas veces usar condón últimos 3 meses', null, './videos/Pregunta59.mp4', '12', 'Número de veces usó condón últimos 3 meses', '3', '1');
INSERT INTO `pregunta` VALUES ('60', 'TÚ cuántas parejas (novio/a, esposo/a, amigo/a) para sexo hasta ahora', null, './videos/Pregunta60.mp4', '13', 'Número de parejas sexuales en toda la vida', '3', '1');
INSERT INTO `pregunta` VALUES ('61', 'TÚ cuántas veces tener relaciones sexo personas otras NO novio o novia', null, './videos/Pregunta61.mp4', '14', 'Número de relaciones sexuales con desconocidos', '3', '1');
INSERT INTO `pregunta` VALUES ('62', 'TÚ tener relaciones sexo otra persona NO novios o novias cuántas veces USAR CONDÓN', null, './videos/Pregunta62.mp4', '15', 'Número de veces usó condón con personas desconocidas', '3', '1');
INSERT INTO `pregunta` VALUES ('63', 'TÚ después PRIMERO relación sexo de tu primera relación sexual otra persona a fuerza y TÚ NO gusta o NO quiere', null, './videos/Pregunta63.mp4', '16', 'Relaciones forzadas subsecuentes', '3', '1');
INSERT INTO `pregunta` VALUES ('64', 'TÚ ya antes embarazada o TÚ embarazar tu novia', null, './videos/Pregunta64.mp4', '17', 'Haber tenido un embarazo', '3', '1');
INSERT INTO `pregunta` VALUES ('65', 'TÚ o tu novia aborto bebé', null, './videos/Pregunta65.mp4', '18', 'Haber tenido un aborto', '3', '1');
INSERT INTO `pregunta` VALUES ('66', 'TÚ antes o ahora hay sexo homosexual (gay, lesbiana)', null, './videos/Pregunta66.mp4', '19', 'Relaciones homosexuales', '3', '1');
INSERT INTO `pregunta` VALUES ('67', 'TÚ ya antes o ahora ir laboratorio prueba para ver hay INFECCIÓN sexo', null, './videos/Pregunta67.mp4', '20', 'Hacerse pruebas para ITS', '3', '1');
INSERT INTO `pregunta` VALUES ('68', 'TÚ hay antes o ahora INFECCIÓN sexo', null, './videos/Pregunta68.mp4', '21', 'Haber tenido alguna ITS', '3', '1');
INSERT INTO `pregunta` VALUES ('69', 'PERSONA tocar TU CUERPO (partes íntimas) a fuerza TÚ NO gusta o NO quiere', null, './videos/Pregunta69.mp4', '22', 'Tocar partes íntimas a fuerza', '3', '1');
INSERT INTO `pregunta` VALUES ('70', 'PERSONA dice TÚ tocar tu cuerpo a fuerza, TÚ NO quiere o NO gusta', null, './videos/Pregunta70.mp4', '23', 'Alguien te pide que a fuerza toques tus partes íntimas', '3', '1');
INSERT INTO `pregunta` VALUES ('71', 'PERSONA dice TÚ quitar ropa para ver cuerpo a fuerza, TÚ NO quiere o NO gusta', null, './videos/Pregunta71.mp4', '24', 'Alguien te ha forzado a quitarte la ropa para ver tu cuerpo', '3', '1');
INSERT INTO `pregunta` VALUES ('72', 'TÚ y tu novio(a) poner condón al revés y después voltea condón para poner bien', null, './videos/Pregunta72.mp4', '1', 'Falla 1: ponerse el condón al revés', '4', '1');
INSERT INTO `pregunta` VALUES ('73', 'TÚ y tu novio(a) hay sexo SIN condón y ANTES eyacular (moco blanco hombre) poner condón pene', null, './videos/Pregunta73.mp4', '2', 'Falla 2: ponerse el condón después de penetración', '4', '1');
INSERT INTO `pregunta` VALUES ('74', 'TÚ y tu novio(a) poner condón cuando pene NO erecto (NO duro).', null, './videos/Pregunta74.mp4', '3', 'Falla 3: Poner condón cuando pene no está erecto', '4', '1');
INSERT INTO `pregunta` VALUES ('75', 'TÚ antes usar condón ver fecha para NO viejo', null, './videos/Pregunta75.mp4', '4', 'Falla 4: Revisar fecha caducidad', '4', '1');
INSERT INTO `pregunta` VALUES ('76', 'TÚ y tu novio(a) quitar condón pene DÉBIL, DORMIDO (NO ERECTO)', null, './videos/Pregunta76.mp4', '5', 'Falla 5: Quitar condón cuando pene no está erecto', '4', '1');
INSERT INTO `pregunta` VALUES ('77', 'TÚ y tu novio(a) poner condón pene deja  aire punta', null, './videos/Pregunta77.mp4', '6', 'Falla 6: poner condón dejando aire en la punta', '4', '1');
INSERT INTO `pregunta` VALUES ('78', 'TÚ y tu novio(a) rompe condón cuando hay sexo', null, './videos/Pregunta78.mp4', '7', 'Ruptura del condón', '4', '1');
INSERT INTO `pregunta` VALUES ('79', 'TÚ y tu novio(a) hay sexo condón adentro vagina, pene no tiene condón', null, './videos/Pregunta79.mp4', '8', 'Deslizamiento del condón', '4', '1');
INSERT INTO `pregunta` VALUES ('80', 'TÚ piensa cuando CONDÓN calor sol, guardar pantalón o cartera (dinero) ya no sirve', null, './videos/Pregunta80.mp4', '1', 'Conocimientos uso condón 1. Exponer condones al calor.', '5', '1');
INSERT INTO `pregunta` VALUES ('81', 'CONDÓN cuya fecha de caducidad vence en año puede usarse sin riesgo de que se rompa', null, './videos/Pregunta81.mp4', '2', 'Conocimiento uso condón 2. Condón que está por vencer su caducidad en un año', '5', '1');
INSERT INTO `pregunta` VALUES ('82', 'Antes abrir bolsa dentro condón TÚ baja condón con dedos, después abrir para no romper condón', null, './videos/Pregunta82.mp4', '3', 'Conocimiento uso condón 3. Recorrer el condón para evitar que se dañe', '5', '1');
INSERT INTO `pregunta` VALUES ('83', 'Los lubricantes a base de agua deben usarse sólo con condones de látex', null, './videos/Pregunta83.mp4', '4', 'Conocimiento uso condón 4. Lubricantes a base de agua y condones de látex', '5', '1');
INSERT INTO `pregunta` VALUES ('84', 'Cuando se coloca un condón en el pene NO dejar aire punta', null, './videos/Pregunta84.mp4', '5', 'Conocimiento uso condón 5. No dejar espacio en la punta del condón', '5', '1');
INSERT INTO `pregunta` VALUES ('85', 'Es necesario colocar el condón hasta la base del pene porque si no se desliza durante el acto sexual', null, './videos/Pregunta85.mp4', '6', 'Conocimiento uso condón 6. Poner condón hasta la base del pene', '5', '1');
INSERT INTO `pregunta` VALUES ('86', 'Infeccion VIH hay diarrea, calentura, sudar noche y pierde peso (flaco)', null, './videos/Pregunta86.mp4', '7', 'Conocimiento ETS 1. Síntomas VIH', '5', '1');
INSERT INTO `pregunta` VALUES ('87', 'VIH pega usar jeringas desechables y esterilizadas', null, './videos/Pregunta87.mp4', '8', 'Conocimiento ETS 2. Transmisión VIH por jeringas desechables', '5', '1');
INSERT INTO `pregunta` VALUES ('88', 'Tener relaciones sexuales con la misma pareja sana disminuye el riesgo de infectarse con VIH', null, './videos/Pregunta88.mp4', '9', 'Conocimiento ETS 3. Relaciones sexuales con la misma pareja', '5', '1');
INSERT INTO `pregunta` VALUES ('89', 'Gonorrea, Clamidia y Tricomoniasis INFECCIONES SEXO no puede curar doctor', null, './videos/Pregunta89.mp4', '10', 'Conocimiento ETS 4. ETS que no pueden curarse con tratamiento médico', '5', '1');
INSERT INTO `pregunta` VALUES ('90', 'Métodos anticonceptivos, PASTILLAS PARA NO BEBÉ ayuda para NO INFECCIONES SEXO', null, './videos/Pregunta90.mp4', '11', 'Conocimiento ETS 5. Métodos anticonceptivos orales y enfermedades de transmisión sexual', '5', '1');
INSERT INTO `pregunta` VALUES ('91', 'Tener relaciones sexuales sin penetración evita contraer algunas infecciones de transmisión sexual', null, './videos/Pregunta91.mp4', '12', 'Conocimientos ETS 6. Relaciones sexuales sin penetración', '5', '1');
INSERT INTO `pregunta` VALUES ('92', 'Mujer hay INFECCIÓN SEXO puede aborto bebé o bebé nace antes. Hombre o mujer NO PUEDE HIJOS después', null, './videos/Pregunta92.mp4', '13', 'Conocimiento ETS 7. Infecciones de transmisión sexual provocan abortos, partos prematuros', '5', '1');
INSERT INTO `pregunta` VALUES ('93', 'Virus del papiloma humano puede CÁNCER', null, './videos/Pregunta93.mp4', '14', 'Conocimientos ETS 8. Virus papiloma humano provoca cáncer', '5', '1');

-- ----------------------------
-- Table structure for rol
-- ----------------------------
DROP TABLE IF EXISTS `rol`;
CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `descripcion` text,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rol
-- ----------------------------
INSERT INTO `rol` VALUES ('1', 'joven con discapacidad', 'Jóven con discapacidad auditiva y contesta el cuestionario');
INSERT INTO `rol` VALUES ('2', 'administrativo', 'encargado de dar mantenimiento al catalogo de secciones, preguntas e incisos');
INSERT INTO `rol` VALUES ('3', 'administrador', 'encargado de dar mantenimiento general al sistema');

-- ----------------------------
-- Table structure for rol_permiso
-- ----------------------------
DROP TABLE IF EXISTS `rol_permiso`;
CREATE TABLE `rol_permiso` (
  `id_rol_permiso` int(11) NOT NULL AUTO_INCREMENT,
  `id_rol` int(11) NOT NULL,
  `id_permiso` int(11) NOT NULL,
  PRIMARY KEY (`id_rol_permiso`),
  KEY `f2_idx` (`id_rol`),
  KEY `f3_idx` (`id_permiso`),
  CONSTRAINT `f2` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`),
  CONSTRAINT `f3` FOREIGN KEY (`id_permiso`) REFERENCES `permiso` (`id_permiso`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rol_permiso
-- ----------------------------
INSERT INTO `rol_permiso` VALUES ('1', '1', '1');
INSERT INTO `rol_permiso` VALUES ('2', '2', '1');
INSERT INTO `rol_permiso` VALUES ('3', '2', '2');
INSERT INTO `rol_permiso` VALUES ('4', '3', '3');

-- ----------------------------
-- Table structure for seccion
-- ----------------------------
DROP TABLE IF EXISTS `seccion`;
CREATE TABLE `seccion` (
  `id_seccion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `ruta_imagen` varchar(100) DEFAULT NULL,
  `ruta_video` varchar(100) DEFAULT NULL,
  `secuencia` int(11) DEFAULT NULL,
  `es_final` tinyint(1) DEFAULT NULL,
  `estatus` tinyint(1) DEFAULT '1',
  `descripcion` text,
  PRIMARY KEY (`id_seccion`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of seccion
-- ----------------------------
INSERT INTO `seccion` VALUES ('1', 'SECCIÓN I: DATOS GENERALES', null, './videos/Seccion1.mp4', '1', '0', '1', '');
INSERT INTO `seccion` VALUES ('2', 'SECCIÓN II: COMUNICACIÓN CON PADRES', null, './videos/Seccion2.mp4', '2', '0', '1', '');
INSERT INTO `seccion` VALUES ('3', 'SECCIÓN III: COMPORTAMIENTO SEXUAL', null, './videos/Seccion3.mp4', '3', '0', '1', '');
INSERT INTO `seccion` VALUES ('4', 'SECCIÓN III: COMPORTAMIENTO SEXUAL ÚLTIMOS 6 MESES', null, './videos/Seccion4.mp4', '4', '0', '1', '');
INSERT INTO `seccion` VALUES ('5', 'SECCIÓN IV:  CONOCIMIENTOS', null, './videos/Seccion5.mp4', '5', '0', '1', '');
INSERT INTO `seccion` VALUES ('6', 'Gracias Por ayudar', null, './videos/Seccion6.mp4', '6', '1', '1', 'Gracias Por ayudar');

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `id_persona` int(11) DEFAULT NULL,
  `name_login` varchar(20) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `estatus` tinyint(1) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `ultima_pregunta_contestada_id` int(11) DEFAULT NULL,
  `id_rol` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `f1_idx` (`id_rol`),
  KEY `f6_idx` (`id_persona`),
  CONSTRAINT `f1` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`),
  CONSTRAINT `f6` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO `usuario` VALUES ('1', '1', 'susana', 'susana', '1', '1', null, '2');
INSERT INTO `usuario` VALUES ('2', '2', 'bety', 'bety', '1', '1', null, '2');
INSERT INTO `usuario` VALUES ('3', '3', 'yuma', 'yuma', '1', '1', null, '2');
INSERT INTO `usuario` VALUES ('4', '4', 'jorge', 'jorge', '1', '1', null, '3');
INSERT INTO `usuario` VALUES ('5', '5', 'diana', 'diana', '1', '1', null, '3');
INSERT INTO `usuario` VALUES ('6', '6', 'folio', 'ejemplo', '1', '1', null, '1');
INSERT INTO `usuario` VALUES ('7', '7', 'folio', 'JU227', '1', '1', '11', '1');
INSERT INTO `usuario` VALUES ('8', '8', 'folio', 'JU228', '1', '1', '93', '1');

-- ----------------------------
-- Table structure for usuario_respuesta
-- ----------------------------
DROP TABLE IF EXISTS `usuario_respuesta`;
CREATE TABLE `usuario_respuesta` (
  `id_usuario_respuesta` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_pregunta` int(11) NOT NULL,
  `id_inciso` int(11) DEFAULT NULL,
  `fecha_hora_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `comentario` varchar(20) DEFAULT NULL,
  `estatus` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_usuario_respuesta`),
  KEY `f7_idx` (`id_usuario`),
  KEY `f8_idx` (`id_inciso`),
  CONSTRAINT `f7` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `f8` FOREIGN KEY (`id_inciso`) REFERENCES `inciso` (`id_inciso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usuario_respuesta
-- ----------------------------
INSERT INTO `usuario_respuesta` VALUES ('1', '8', '1', '2', '2015-06-22 22:16:44', null, null);
INSERT INTO `usuario_respuesta` VALUES ('2', '8', '2', null, '2015-06-22 22:16:50', '5', null);
INSERT INTO `usuario_respuesta` VALUES ('3', '8', '3', '86', '2015-06-22 22:16:52', null, null);
INSERT INTO `usuario_respuesta` VALUES ('4', '8', '4', null, '2015-06-22 22:16:59', '12', null);
INSERT INTO `usuario_respuesta` VALUES ('5', '8', '5', '182', '2015-06-22 22:17:02', null, null);
INSERT INTO `usuario_respuesta` VALUES ('6', '8', '6', '205', '2015-06-22 22:17:06', null, null);
INSERT INTO `usuario_respuesta` VALUES ('7', '8', '7', '230', '2015-06-22 22:17:07', null, null);
INSERT INTO `usuario_respuesta` VALUES ('8', '8', '8', '279', '2015-06-22 22:17:11', null, null);
INSERT INTO `usuario_respuesta` VALUES ('9', '8', '9', '310', '2015-06-22 22:17:12', null, null);
INSERT INTO `usuario_respuesta` VALUES ('10', '8', '10', '6', '2015-06-22 22:17:14', null, null);
INSERT INTO `usuario_respuesta` VALUES ('11', '8', '11', '9', '2015-06-22 22:17:16', null, null);
INSERT INTO `usuario_respuesta` VALUES ('12', '8', '12', null, '2015-06-22 22:17:24', '26', null);
INSERT INTO `usuario_respuesta` VALUES ('13', '8', '13', null, '2015-06-22 22:17:29', '12', null);
INSERT INTO `usuario_respuesta` VALUES ('14', '8', '14', '11', '2015-06-22 22:18:15', null, null);
INSERT INTO `usuario_respuesta` VALUES ('15', '8', '15', '18', '2015-06-22 22:18:17', null, null);
INSERT INTO `usuario_respuesta` VALUES ('16', '8', '16', '26', '2015-06-22 22:18:18', null, null);
INSERT INTO `usuario_respuesta` VALUES ('17', '8', '17', '30', '2015-06-22 22:18:20', null, null);
INSERT INTO `usuario_respuesta` VALUES ('18', '8', '18', '31', '2015-06-22 22:19:14', null, null);
INSERT INTO `usuario_respuesta` VALUES ('19', '8', '19', '34', '2015-06-22 22:19:16', null, null);
INSERT INTO `usuario_respuesta` VALUES ('20', '8', '20', '35', '2015-06-22 22:19:28', null, null);
INSERT INTO `usuario_respuesta` VALUES ('21', '8', '21', '43', '2015-06-22 22:19:32', null, null);
INSERT INTO `usuario_respuesta` VALUES ('22', '8', '22', '45', '2015-06-22 22:19:36', null, null);
INSERT INTO `usuario_respuesta` VALUES ('23', '8', '23', '51', '2015-06-22 22:19:38', null, null);
INSERT INTO `usuario_respuesta` VALUES ('24', '8', '24', '55', '2015-06-22 22:19:41', null, null);
INSERT INTO `usuario_respuesta` VALUES ('25', '8', '25', '63', '2015-06-22 22:19:45', null, null);
INSERT INTO `usuario_respuesta` VALUES ('26', '8', '26', '69', '2015-06-22 22:19:48', null, null);
INSERT INTO `usuario_respuesta` VALUES ('27', '8', '27', '71', '2015-06-22 22:19:52', null, null);
INSERT INTO `usuario_respuesta` VALUES ('28', '8', '28', '75', '2015-06-22 22:19:55', null, null);
INSERT INTO `usuario_respuesta` VALUES ('29', '8', '29', '81', '2015-06-22 22:19:57', null, null);
INSERT INTO `usuario_respuesta` VALUES ('30', '8', '30', '90', '2015-06-22 22:20:02', null, null);
INSERT INTO `usuario_respuesta` VALUES ('31', '8', '31', '96', '2015-06-22 22:20:05', null, null);
INSERT INTO `usuario_respuesta` VALUES ('32', '8', '32', '97', '2015-06-22 22:20:21', null, null);
INSERT INTO `usuario_respuesta` VALUES ('33', '8', '33', '103', '2015-06-22 22:20:25', null, null);
INSERT INTO `usuario_respuesta` VALUES ('34', '8', '34', '111', '2015-06-22 22:20:30', null, null);
INSERT INTO `usuario_respuesta` VALUES ('35', '8', '35', '113', '2015-06-22 22:20:35', null, null);
INSERT INTO `usuario_respuesta` VALUES ('36', '8', '36', '117', '2015-06-22 22:20:39', null, null);
INSERT INTO `usuario_respuesta` VALUES ('37', '8', '37', '124', '2015-06-22 22:20:42', null, null);
INSERT INTO `usuario_respuesta` VALUES ('38', '8', '38', '131', '2015-06-22 22:20:50', null, null);
INSERT INTO `usuario_respuesta` VALUES ('39', '8', '39', '135', '2015-06-22 22:20:54', null, null);
INSERT INTO `usuario_respuesta` VALUES ('40', '8', '40', '137', '2015-06-22 22:20:57', null, null);
INSERT INTO `usuario_respuesta` VALUES ('41', '8', '41', '144', '2015-06-22 22:21:03', null, null);
INSERT INTO `usuario_respuesta` VALUES ('42', '8', '42', '147', '2015-06-22 22:21:10', null, null);
INSERT INTO `usuario_respuesta` VALUES ('43', '8', '43', '154', '2015-06-22 22:21:15', null, null);
INSERT INTO `usuario_respuesta` VALUES ('44', '8', '44', '160', '2015-06-22 22:21:19', null, null);
INSERT INTO `usuario_respuesta` VALUES ('45', '8', '45', '162', '2015-06-22 22:21:22', null, null);
INSERT INTO `usuario_respuesta` VALUES ('46', '8', '46', '171', '2015-06-22 22:21:27', null, null);
INSERT INTO `usuario_respuesta` VALUES ('47', '8', '47', '173', '2015-06-22 22:21:31', null, null);
INSERT INTO `usuario_respuesta` VALUES ('48', '8', '48', '177', '2015-06-22 22:21:40', null, null);
INSERT INTO `usuario_respuesta` VALUES ('49', '8', '49', null, '2015-06-22 22:21:47', '23', null);
INSERT INTO `usuario_respuesta` VALUES ('50', '8', '50', '185', '2015-06-22 22:21:52', null, null);
INSERT INTO `usuario_respuesta` VALUES ('51', '8', '51', '189', '2015-06-22 22:21:54', null, null);
INSERT INTO `usuario_respuesta` VALUES ('52', '8', '52', '190', '2015-06-22 22:21:57', null, null);
INSERT INTO `usuario_respuesta` VALUES ('53', '8', '53', '195', '2015-06-22 22:21:59', null, null);
INSERT INTO `usuario_respuesta` VALUES ('54', '8', '54', '197', '2015-06-22 22:22:01', null, null);
INSERT INTO `usuario_respuesta` VALUES ('55', '8', '55', '203', '2015-06-22 22:22:04', null, null);
INSERT INTO `usuario_respuesta` VALUES ('56', '8', '56', null, '2015-06-22 22:22:10', '12', null);
INSERT INTO `usuario_respuesta` VALUES ('57', '8', '57', null, '2015-06-22 22:22:17', '34', null);
INSERT INTO `usuario_respuesta` VALUES ('58', '8', '58', null, '2015-06-22 22:22:23', '50', null);
INSERT INTO `usuario_respuesta` VALUES ('59', '8', '59', null, '2015-06-22 22:22:28', '1', null);
INSERT INTO `usuario_respuesta` VALUES ('60', '8', '60', '213', '2015-06-22 22:22:31', null, null);
INSERT INTO `usuario_respuesta` VALUES ('61', '8', '61', null, '2015-06-22 22:22:40', '2', null);
INSERT INTO `usuario_respuesta` VALUES ('62', '8', '62', null, '2015-06-22 22:22:49', '12', null);
INSERT INTO `usuario_respuesta` VALUES ('63', '8', '63', '215', '2015-06-22 22:22:54', null, null);
INSERT INTO `usuario_respuesta` VALUES ('64', '8', '64', '217', '2015-06-22 22:22:58', null, null);
INSERT INTO `usuario_respuesta` VALUES ('65', '8', '65', '220', '2015-06-22 22:23:01', null, null);
INSERT INTO `usuario_respuesta` VALUES ('66', '8', '66', '221', '2015-06-22 22:23:10', null, null);
INSERT INTO `usuario_respuesta` VALUES ('67', '8', '67', '224', '2015-06-22 22:23:14', null, null);
INSERT INTO `usuario_respuesta` VALUES ('68', '8', '68', '225', '2015-06-22 22:23:22', null, null);
INSERT INTO `usuario_respuesta` VALUES ('69', '8', '69', '228', '2015-06-22 22:23:26', null, null);
INSERT INTO `usuario_respuesta` VALUES ('70', '8', '70', '231', '2015-06-22 22:23:29', null, null);
INSERT INTO `usuario_respuesta` VALUES ('71', '8', '71', '234', '2015-06-22 22:23:33', null, null);
INSERT INTO `usuario_respuesta` VALUES ('72', '8', '72', '235', '2015-06-22 22:24:00', null, null);
INSERT INTO `usuario_respuesta` VALUES ('73', '8', '73', '243', '2015-06-22 22:24:06', null, null);
INSERT INTO `usuario_respuesta` VALUES ('74', '8', '74', '249', '2015-06-22 22:24:09', null, null);
INSERT INTO `usuario_respuesta` VALUES ('75', '8', '75', '250', '2015-06-22 22:24:13', null, null);
INSERT INTO `usuario_respuesta` VALUES ('76', '8', '76', '255', '2015-06-22 22:24:18', null, null);
INSERT INTO `usuario_respuesta` VALUES ('77', '8', '77', '264', '2015-06-22 22:24:27', null, null);
INSERT INTO `usuario_respuesta` VALUES ('78', '8', '78', '265', '2015-06-22 22:24:31', null, null);
INSERT INTO `usuario_respuesta` VALUES ('79', '8', '79', '272', '2015-06-22 22:24:47', null, null);
INSERT INTO `usuario_respuesta` VALUES ('80', '8', '80', '280', '2015-06-22 22:25:07', null, null);
INSERT INTO `usuario_respuesta` VALUES ('81', '8', '81', '284', '2015-06-22 22:25:10', null, null);
INSERT INTO `usuario_respuesta` VALUES ('82', '8', '82', '288', '2015-06-22 22:25:12', null, null);
INSERT INTO `usuario_respuesta` VALUES ('83', '8', '83', '290', '2015-06-22 22:25:34', null, null);
INSERT INTO `usuario_respuesta` VALUES ('84', '8', '84', '292', '2015-06-22 22:25:37', null, null);
INSERT INTO `usuario_respuesta` VALUES ('85', '8', '85', '297', '2015-06-22 22:25:40', null, null);
INSERT INTO `usuario_respuesta` VALUES ('86', '8', '86', '298', '2015-06-22 22:25:43', null, null);
INSERT INTO `usuario_respuesta` VALUES ('87', '8', '87', '302', '2015-06-22 22:25:46', null, null);
INSERT INTO `usuario_respuesta` VALUES ('88', '8', '88', '304', '2015-06-22 22:26:05', null, null);
INSERT INTO `usuario_respuesta` VALUES ('89', '8', '89', '308', '2015-06-22 22:26:09', null, null);
INSERT INTO `usuario_respuesta` VALUES ('90', '8', '90', '314', '2015-06-22 22:26:12', null, null);
INSERT INTO `usuario_respuesta` VALUES ('91', '8', '91', '316', '2015-06-22 22:26:14', null, null);
INSERT INTO `usuario_respuesta` VALUES ('92', '8', '92', '318', '2015-06-22 22:26:17', null, null);
INSERT INTO `usuario_respuesta` VALUES ('93', '8', '93', '322', '2015-06-22 22:26:21', null, null);
