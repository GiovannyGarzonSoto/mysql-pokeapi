-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: pkapi
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.18.04.1

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
-- Table structure for table `clases`
--

DROP TABLE IF EXISTS `clases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clases` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `public_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clases`
--

LOCK TABLES `clases` WRITE;
/*!40000 ALTER TABLE `clases` DISABLE KEYS */;
INSERT INTO `clases` VALUES (4,'Fisico','https://res.cloudinary.com/dlejpqwlh/image/upload/v1559119834/jhc0lucxitj130t5sj5j.gif','jhc0lucxitj130t5sj5j'),(5,'Especial','https://res.cloudinary.com/dlejpqwlh/image/upload/v1559119853/h4labjbfgf8f81kklqya.gif','h4labjbfgf8f81kklqya'),(6,'Estado','https://res.cloudinary.com/dlejpqwlh/image/upload/v1559119862/rl1fbyhyxmi983qm9zhc.gif','rl1fbyhyxmi983qm9zhc');
/*!40000 ALTER TABLE `clases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupos`
--

DROP TABLE IF EXISTS `grupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupos`
--

LOCK TABLES `grupos` WRITE;
/*!40000 ALTER TABLE `grupos` DISABLE KEYS */;
INSERT INTO `grupos` VALUES (1,'Planta'),(2,'Bicho'),(3,'Volador'),(4,'Humanoide'),(5,'Mineral'),(6,'Amorfo'),(7,'Campo'),(8,'Agua 1'),(9,'Agua 2'),(10,'Agua 3'),(11,'Monstruo'),(12,'Hada'),(13,'Dragon');
/*!40000 ALTER TABLE `grupos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habilidades`
--

DROP TABLE IF EXISTS `habilidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `habilidades` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habilidades`
--

LOCK TABLES `habilidades` WRITE;
/*!40000 ALTER TABLE `habilidades` DISABLE KEYS */;
INSERT INTO `habilidades` VALUES (1,'Absorve Agua','Recupera PS al recibir ataques de tipo Agua.'),(2,'Absorve Electricidad','Recupera PS al recibir ataques de tipo electrico.'),(3,'Absorve Fuego','Potencia movimientos de tipo fuego si ha sufrido antes alguno.'),(4,'Aclimatacion','Anula los efectos del tiempo atmosférico.'),(5,'Agallas','Sube el ataque si sufre un problema de estado.'),(6,'Armadura Batalla','Bloquea los golpes críticos.'),(7,'Ausente','El Pokémon no atacará en turnos consecutivos.');
/*!40000 ALTER TABLE `habilidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos`
--

DROP TABLE IF EXISTS `movimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movimientos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_tipo` int(10) NOT NULL,
  `id_clase` int(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  `potencia` int(10) DEFAULT NULL,
  `presicion` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_movimiento_tipo` (`id_tipo`),
  KEY `fk_movimiento_clase` (`id_clase`),
  CONSTRAINT `fk_movimiento_clase` FOREIGN KEY (`id_clase`) REFERENCES `clases` (`id`),
  CONSTRAINT `fk_movimiento_tipo` FOREIGN KEY (`id_tipo`) REFERENCES `tipos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos`
--

LOCK TABLES `movimientos` WRITE;
/*!40000 ALTER TABLE `movimientos` DISABLE KEYS */;
INSERT INTO `movimientos` VALUES (1,29,4,'A Bocajarro','A bocajarro causa daño y no tiene ningún efecto secundario, pero baja un nivel la defensa y la defensa especial del usuario.',120,100),(2,22,6,'A Defender','A defender aumenta en un nivel la defensa y defensa especial del usuario.',0,0);
/*!40000 ALTER TABLE `movimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemon`
--

DROP TABLE IF EXISTS `pokemon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pokemon` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_habilidad` int(10) NOT NULL,
  `id_habilidad2` int(10) DEFAULT NULL,
  `id_habilidad3` int(10) DEFAULT NULL,
  `id_tipo` int(10) NOT NULL,
  `id_tipo2` int(10) DEFAULT NULL,
  `id_grupo` int(10) DEFAULT NULL,
  `id_grupo2` int(10) DEFAULT NULL,
  `numero` int(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` mediumtext NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `peso` float(10,2) NOT NULL,
  `altura` float(10,2) NOT NULL,
  `hp` int(10) NOT NULL,
  `ata` int(10) NOT NULL,
  `def` int(10) NOT NULL,
  `ataesp` int(10) NOT NULL,
  `defesp` int(10) NOT NULL,
  `vel` int(10) NOT NULL,
  `public_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pokemon_habilidad` (`id_habilidad`),
  KEY `fk_pokemon_habilidad2` (`id_habilidad2`),
  KEY `fk_pokemon_habilidad3` (`id_habilidad3`),
  KEY `fk_pokemon_tipo` (`id_tipo`),
  KEY `fk_pokemon_tipo2` (`id_tipo2`),
  KEY `fk_pokemon_grupo` (`id_grupo`),
  KEY `fk_pokemon_grupo2` (`id_grupo2`),
  CONSTRAINT `fk_pokemon_grupo` FOREIGN KEY (`id_grupo`) REFERENCES `grupos` (`id`),
  CONSTRAINT `fk_pokemon_grupo2` FOREIGN KEY (`id_grupo2`) REFERENCES `grupos` (`id`),
  CONSTRAINT `fk_pokemon_habilidad` FOREIGN KEY (`id_habilidad`) REFERENCES `habilidades` (`id`),
  CONSTRAINT `fk_pokemon_habilidad2` FOREIGN KEY (`id_habilidad2`) REFERENCES `habilidades` (`id`),
  CONSTRAINT `fk_pokemon_habilidad3` FOREIGN KEY (`id_habilidad3`) REFERENCES `habilidades` (`id`),
  CONSTRAINT `fk_pokemon_tipo` FOREIGN KEY (`id_tipo`) REFERENCES `tipos` (`id`),
  CONSTRAINT `fk_pokemon_tipo2` FOREIGN KEY (`id_tipo2`) REFERENCES `tipos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon`
--

LOCK TABLES `pokemon` WRITE;
/*!40000 ALTER TABLE `pokemon` DISABLE KEYS */;
/*!40000 ALTER TABLE `pokemon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos`
--

DROP TABLE IF EXISTS `tipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `public_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos`
--

LOCK TABLES `tipos` WRITE;
/*!40000 ALTER TABLE `tipos` DISABLE KEYS */;
INSERT INTO `tipos` VALUES (20,'Acero','https://res.cloudinary.com/dlejpqwlh/image/upload/v1559117532/z1fsjjadikjomixgoaie.gif','z1fsjjadikjomixgoaie'),(21,'Agua','https://res.cloudinary.com/dlejpqwlh/image/upload/v1559117630/nfpynszi77rbblpqsw99.gif','nfpynszi77rbblpqsw99'),(22,'Bicho','https://res.cloudinary.com/dlejpqwlh/image/upload/v1559117785/c4cnkxjveulvyiafuucy.gif','c4cnkxjveulvyiafuucy'),(23,'Dragon','https://res.cloudinary.com/dlejpqwlh/image/upload/v1559117843/lgtwh5pazk8wpfdrvt7w.gif','lgtwh5pazk8wpfdrvt7w'),(24,'Electrico','https://res.cloudinary.com/dlejpqwlh/image/upload/v1559117852/qvhiufupxsqtknjz1ske.gif','qvhiufupxsqtknjz1ske'),(25,'Fantasma','https://res.cloudinary.com/dlejpqwlh/image/upload/v1559117867/fveqb5am604ub9zl4nml.gif','fveqb5am604ub9zl4nml'),(26,'Fuego','https://res.cloudinary.com/dlejpqwlh/image/upload/v1559117876/xnuztofjo96kfz4njy7y.gif','xnuztofjo96kfz4njy7y'),(27,'Hada','https://res.cloudinary.com/dlejpqwlh/image/upload/v1559117884/vww0qnerss0mw03jm3qg.gif','vww0qnerss0mw03jm3qg'),(28,'Hielo','https://res.cloudinary.com/dlejpqwlh/image/upload/v1559117892/qsxksjgnkwgohvvuit5c.gif','qsxksjgnkwgohvvuit5c'),(29,'Lucha','https://res.cloudinary.com/dlejpqwlh/image/upload/v1559117904/bxjyk3r5nyzscguimhtq.gif','bxjyk3r5nyzscguimhtq'),(30,'Normal','https://res.cloudinary.com/dlejpqwlh/image/upload/v1559117911/wauf0oump0j2wzmc2qyk.gif','wauf0oump0j2wzmc2qyk'),(31,'Planta','https://res.cloudinary.com/dlejpqwlh/image/upload/v1559117920/ooflnkbgqwprj4slujog.gif','ooflnkbgqwprj4slujog'),(32,'Psiquico','https://res.cloudinary.com/dlejpqwlh/image/upload/v1559117931/cbq1snj50dwrm7vhotnc.gif','cbq1snj50dwrm7vhotnc'),(33,'Roca','https://res.cloudinary.com/dlejpqwlh/image/upload/v1559117945/zfs2j6raokgazo1unyxu.gif','zfs2j6raokgazo1unyxu'),(34,'Siniestro','https://res.cloudinary.com/dlejpqwlh/image/upload/v1559117953/ui7cahbybanpjsfcq2ad.gif','ui7cahbybanpjsfcq2ad'),(35,'Tierra','https://res.cloudinary.com/dlejpqwlh/image/upload/v1559117983/x2mriscentbk64gjr9xo.gif','x2mriscentbk64gjr9xo'),(36,'Veneno','https://res.cloudinary.com/dlejpqwlh/image/upload/v1559117991/ftjfq86qhs8fyjveknfk.gif','ftjfq86qhs8fyjveknfk'),(37,'Volador','https://res.cloudinary.com/dlejpqwlh/image/upload/v1559117999/kjpzrsnzyolti9ppuy72.gif','kjpzrsnzyolti9ppuy72');
/*!40000 ALTER TABLE `tipos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-20 23:05:57

create table usuarios(
  id int(10) not null auto_increment,
  nombre varchar(255) not null,
  pass varchar(255) not null,
  mail varchar(255) not null,
  admin tinyint(1) not null,
  CONSTRAINT pk_users PRIMARY KEY(id) 
)ENGINE=InnoDB;
