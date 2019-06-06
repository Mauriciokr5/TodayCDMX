CREATE DATABASE  IF NOT EXISTS `proaula` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `proaula`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: proaula
-- ------------------------------------------------------
-- Server version	5.5.60-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alcaldias`
--

DROP TABLE IF EXISTS `alcaldias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alcaldias` (
  `idalcaldias` int(11) NOT NULL AUTO_INCREMENT,
  `alcaldia` varchar(45) NOT NULL,
  `visibilidad` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idalcaldias`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcaldias`
--

LOCK TABLES `alcaldias` WRITE;
/*!40000 ALTER TABLE `alcaldias` DISABLE KEYS */;
INSERT INTO `alcaldias` VALUES (1,'Tlalpan',1),(2,'Tláhuac',1),(3,'Venustiano Carranza',1),(4,'Cuauhtémoc',1),(5,'Iztapalapa',1),(6,'Azcapotzalco',1),(7,'Benito Juárez',1),(8,'Cuajimalpa de Morelos',1),(9,'Iztacalco',1),(10,'Gustavo A. Madero',1),(11,'Miguel Hidalgo',1),(12,'La Magdalena Contreras',1),(13,'Coyoacán',1),(14,'Milpa Alta',1),(15,'Álvaro Obregón',1),(16,'Xochimilco',1),(17,'prueba',1),(18,'prueba2',1),(19,'noms',1),(20,'prueba3',1);
/*!40000 ALTER TABLE `alcaldias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comentarios` (
  `idcomentarios` int(11) NOT NULL AUTO_INCREMENT,
  `idUsu` int(11) NOT NULL,
  `comentario` varchar(500) NOT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idcomentarios`),
  KEY `fk_idusuario_idx` (`idUsu`),
  CONSTRAINT `fk_idusuario` FOREIGN KEY (`idUsu`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
INSERT INTO `comentarios` VALUES (1,1,'hola','2019-06-01 00:01:31'),(2,8,'como estas','2019-06-01 00:01:31'),(3,8,'asdf','2019-06-01 00:01:31'),(4,8,':0','2019-06-01 00:27:44'),(5,8,'hola\r\n','2019-06-04 04:52:56');
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enclisto`
--

DROP TABLE IF EXISTS `enclisto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enclisto` (
  `idenclisto` int(11) NOT NULL AUTO_INCREMENT,
  `idUsu` int(11) NOT NULL,
  `hecho` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idenclisto`),
  KEY `fk_idusuarios_idx` (`idUsu`),
  CONSTRAINT `fk_idusuarios` FOREIGN KEY (`idUsu`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enclisto`
--

LOCK TABLES `enclisto` WRITE;
/*!40000 ALTER TABLE `enclisto` DISABLE KEYS */;
INSERT INTO `enclisto` VALUES (1,2,0),(2,7,0),(3,8,1),(4,9,0),(5,10,0),(6,11,0);
/*!40000 ALTER TABLE `enclisto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `graficas`
--

DROP TABLE IF EXISTS `graficas`;
/*!50001 DROP VIEW IF EXISTS `graficas`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `graficas` AS SELECT 
 1 AS `idgraficasdata`,
 1 AS `idtipograf`,
 1 AS `idalcaldia`,
 1 AS `atras`,
 1 AS `now`,
 1 AS `delante`,
 1 AS `idtipografica`,
 1 AS `tipografica`,
 1 AS `idalcaldias`,
 1 AS `alcaldia`,
 1 AS `visibilidad`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `graficasdata`
--

DROP TABLE IF EXISTS `graficasdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graficasdata` (
  `idgraficasdata` int(11) NOT NULL AUTO_INCREMENT,
  `idtipograf` int(11) NOT NULL,
  `idalcaldia` int(11) NOT NULL,
  `atras` float DEFAULT '0',
  `now` float DEFAULT '0',
  `delante` float DEFAULT '0',
  PRIMARY KEY (`idgraficasdata`),
  KEY `fk_alca_idx` (`idalcaldia`),
  KEY `fk_tipgraf_idx` (`idtipograf`),
  CONSTRAINT `fk_alca` FOREIGN KEY (`idalcaldia`) REFERENCES `alcaldias` (`idalcaldias`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tipgraf` FOREIGN KEY (`idtipograf`) REFERENCES `tipografica` (`idtipografica`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graficasdata`
--

LOCK TABLES `graficasdata` WRITE;
/*!40000 ALTER TABLE `graficasdata` DISABLE KEYS */;
INSERT INTO `graficasdata` VALUES (1,1,1,1000,1200,1440),(2,2,1,5,10,20),(3,3,1,50,60,70),(4,1,2,10,10,10),(5,2,2,0,0,0),(6,3,2,12,12,12),(7,1,6,0,0,0),(8,2,6,0,0,0),(9,2,4,0,0,0),(10,1,7,0,0,0),(11,3,7,0,0,0),(12,2,11,0,0,0),(13,1,11,0,0,0),(14,3,11,0,0,0),(15,1,19,0,0,0),(16,2,19,0,0,0),(17,3,19,0,0,0),(18,1,20,0,0,0);
/*!40000 ALTER TABLE `graficasdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opciones`
--

DROP TABLE IF EXISTS `opciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opciones` (
  `idopciones` int(11) NOT NULL AUTO_INCREMENT,
  `idpregunta` int(11) NOT NULL,
  `opcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idopciones`),
  KEY `fk_op-preg_idx` (`idpregunta`),
  CONSTRAINT `fk_op-preg` FOREIGN KEY (`idpregunta`) REFERENCES `preguntas` (`idpreguntas`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opciones`
--

LOCK TABLES `opciones` WRITE;
/*!40000 ALTER TABLE `opciones` DISABLE KEYS */;
INSERT INTO `opciones` VALUES (1,1,'Si'),(2,1,'No'),(3,2,'Solo yo'),(4,2,'2-4'),(5,2,'4-6'),(6,2,'6-10'),(7,3,'Si'),(8,3,'No'),(9,4,'1'),(10,4,'2'),(11,4,'3'),(12,4,'4-7'),(13,5,'50-100L'),(14,5,'100-150L'),(15,5,'150-200L'),(16,5,'200-250L'),(17,6,'Si'),(18,6,'No'),(19,7,'Si'),(20,7,'No'),(21,8,'Agua'),(22,8,'Basura'),(23,8,'Otros'),(24,8,'Ninguno'),(25,9,'Si'),(26,9,'No'),(27,10,'Si'),(28,10,'No');
/*!40000 ALTER TABLE `opciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preguntas`
--

DROP TABLE IF EXISTS `preguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preguntas` (
  `idpreguntas` int(11) NOT NULL,
  `pregunta` varchar(200) NOT NULL,
  PRIMARY KEY (`idpreguntas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preguntas`
--

LOCK TABLES `preguntas` WRITE;
/*!40000 ALTER TABLE `preguntas` DISABLE KEYS */;
INSERT INTO `preguntas` VALUES (1,'¿Vive en la CDMX?'),(2,'¿Cuántas personas viven con usted?'),(3,' ¿Está al tanto del consumo de agua y producción de basura que genera su familia?'),(4,'¿Cuántas veces a la semana tiran la basura?'),(5,'¿Aproximadamente cuánta agua ocupan?'),(6,'¿Considera usted que vive en una zona con un gran número de personas?'),(7,'¿Cree usted que la zona donde vive es un buen lugar para vivir en los próximos 20 años?'),(8,'¿Tiene problemas con algún servicio público?'),(9,'¿Cree que antes de adquirir un condominio o un establecimiento, es de suma importancia informarse sobre la zona?'),(10,'¿Usted se suscribiría a un servicio en línea gratuito para mantenerse informado sobre los servicios públicos de su zona?');
/*!40000 ALTER TABLE `preguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuestas`
--

DROP TABLE IF EXISTS `respuestas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `respuestas` (
  `idrespuestas` int(11) NOT NULL AUTO_INCREMENT,
  `idpregunta` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idopcion` int(11) NOT NULL,
  PRIMARY KEY (`idrespuestas`),
  KEY `fk_idpregunta_idx` (`idpregunta`),
  KEY `fk_idusuario_idx` (`idusuario`),
  KEY `fk_op_idx` (`idopcion`),
  CONSTRAINT `fk_idpregunta` FOREIGN KEY (`idpregunta`) REFERENCES `preguntas` (`idpreguntas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_idusuariop` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_op` FOREIGN KEY (`idopcion`) REFERENCES `opciones` (`idopciones`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuestas`
--

LOCK TABLES `respuestas` WRITE;
/*!40000 ALTER TABLE `respuestas` DISABLE KEYS */;
INSERT INTO `respuestas` VALUES (1,1,8,1),(2,2,8,3),(3,3,8,7),(4,4,8,9),(5,5,8,13),(6,6,8,17),(7,7,8,19),(8,8,8,21),(9,9,8,25),(10,10,8,27);
/*!40000 ALTER TABLE `respuestas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipografica`
--

DROP TABLE IF EXISTS `tipografica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipografica` (
  `idtipografica` int(11) NOT NULL,
  `tipografica` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipografica`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipografica`
--

LOCK TABLES `tipografica` WRITE;
/*!40000 ALTER TABLE `tipografica` DISABLE KEYS */;
INSERT INTO `tipografica` VALUES (1,'Consumo de Agua'),(2,'Producción de Basura'),(3,'Crecimiento Demográfico');
/*!40000 ALTER TABLE `tipografica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipousuario`
--

DROP TABLE IF EXISTS `tipousuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipousuario` (
  `idtipoUsuario` int(11) NOT NULL,
  `tipoUsuario` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipoUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipousuario`
--

LOCK TABLES `tipousuario` WRITE;
/*!40000 ALTER TABLE `tipousuario` DISABLE KEYS */;
INSERT INTO `tipousuario` VALUES (1,'Administrador'),(2,'Cliente');
/*!40000 ALTER TABLE `tipousuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `contrasena` varchar(45) NOT NULL,
  `idtipo` int(11) NOT NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `correo_UNIQUE` (`correo`),
  KEY `fk_tipousu_idx` (`idtipo`),
  CONSTRAINT `fk_tipousu` FOREIGN KEY (`idtipo`) REFERENCES `tipousuario` (`idtipoUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'admin','admin@admin.com','admin',1),(2,'fgsdgdf','gdfs@fgdaf','fgfdsf',2),(7,'hola','fdsaf@fdasdf.cop','dafs',2),(8,'nose','nose@nose.com','nose',2),(9,'asdf','adsfs@dsa','dsa',2),(10,'como','como@como.com','como',2),(11,'hol','hol@hol','hol',2);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger encuestalisto 
after insert 
on usuario 
for each row
insert into enclisto(idUsu) values(new.idusuario) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `graficas`
--

/*!50001 DROP VIEW IF EXISTS `graficas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `graficas` AS select `graficasdata`.`idgraficasdata` AS `idgraficasdata`,`graficasdata`.`idtipograf` AS `idtipograf`,`graficasdata`.`idalcaldia` AS `idalcaldia`,`graficasdata`.`atras` AS `atras`,`graficasdata`.`now` AS `now`,`graficasdata`.`delante` AS `delante`,`tipografica`.`idtipografica` AS `idtipografica`,`tipografica`.`tipografica` AS `tipografica`,`alcaldias`.`idalcaldias` AS `idalcaldias`,`alcaldias`.`alcaldia` AS `alcaldia`,`alcaldias`.`visibilidad` AS `visibilidad` from ((`graficasdata` join `tipografica` on((`tipografica`.`idtipografica` = `graficasdata`.`idtipograf`))) join `alcaldias` on((`graficasdata`.`idalcaldia` = `alcaldias`.`idalcaldias`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-05 20:20:47
