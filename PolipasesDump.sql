-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: Polipases
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `EquipoFutbol`
--

DROP TABLE IF EXISTS `EquipoFutbol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EquipoFutbol` (
  `idEquipoFutbol` int NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEquipoFutbol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EquipoFutbol`
--

LOCK TABLES `EquipoFutbol` WRITE;
/*!40000 ALTER TABLE `EquipoFutbol` DISABLE KEYS */;
INSERT INTO `EquipoFutbol` VALUES (1,'Babao'),(2,'Itabira'),(3,'Tangwei'),(4,'Boca'),(5,'River'),(6,'Huaquirca'),(7,'Nonohonis'),(8,'Mykonos'),(9,'Jialai'),(10,'Belém'),(11,'Independiente'),(12,'Kralice na Hané'),(13,'San Lorenzo'),(14,'Bang Lamung'),(15,'Barracas'),(16,'San Telmo'),(17,'Chadian'),(18,'Krajan Satu'),(19,'Pengfang'),(20,'Nueva Chicago'),(21,'Francova Lhota'),(22,'Tuusula'),(23,'Palangkaraya'),(24,'Nofoali‘i'),(25,'Viking'),(26,'Uavdoxss'),(27,'Kluczbork'),(28,'La Campora'),(29,'Concordia'),(30,'Ajax'),(31,'Bugana'),(32,'Yingyang'),(33,'Malway'),(34,'Lop Buri'),(35,'Obihiro'),(36,'Santiago Atitlán'),(37,'Santa Catalina'),(38,'Gaojiabu'),(39,'Chapelton');
/*!40000 ALTER TABLE `EquipoFutbol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fichaje`
--

DROP TABLE IF EXISTS `Fichaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Fichaje` (
  `idFichaje` int NOT NULL,
  `IdJugadores` int DEFAULT NULL,
  `idEquipoFutbol` int DEFAULT NULL,
  `FechaFichaje` date DEFAULT NULL,
  `EstadoDelFichaje` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idFichaje`),
  KEY `IdJugadores_idx` (`IdJugadores`),
  KEY `IdEquipoFutbol_idx` (`idEquipoFutbol`),
  CONSTRAINT `FK_IdEquipoFutbol` FOREIGN KEY (`idEquipoFutbol`) REFERENCES `EquipoFutbol` (`idEquipoFutbol`),
  CONSTRAINT `FK_IdJugadores` FOREIGN KEY (`IdJugadores`) REFERENCES `Jugadores` (`IdJugadores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fichaje`
--

LOCK TABLES `Fichaje` WRITE;
/*!40000 ALTER TABLE `Fichaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `Fichaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Jugadores`
--

DROP TABLE IF EXISTS `Jugadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Jugadores` (
  `idPersona2` int NOT NULL,
  `IdJugadores` int NOT NULL,
  `Representante` int DEFAULT NULL,
  `Salario` int DEFAULT NULL,
  PRIMARY KEY (`IdJugadores`),
  KEY `idPersona2_idx` (`idPersona2`),
  KEY `Representante` (`Representante`),
  CONSTRAINT `IdPersona2` FOREIGN KEY (`idPersona2`) REFERENCES `Persona` (`idPersona`),
  CONSTRAINT `Representante` FOREIGN KEY (`Representante`) REFERENCES `Managers` (`idManagers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Jugadores`
--

LOCK TABLES `Jugadores` WRITE;
/*!40000 ALTER TABLE `Jugadores` DISABLE KEYS */;
INSERT INTO `Jugadores` VALUES (31,1,28,17404),(32,2,30,35078),(33,3,14,23178),(34,4,18,90659),(35,5,3,13755),(36,6,28,56803),(37,7,4,52747),(38,8,12,83329),(39,9,11,68400),(40,10,22,82014),(41,11,9,14870),(42,12,1,88311),(43,13,4,26939),(44,14,17,39767),(45,15,6,18017),(46,16,27,50785),(47,17,17,99876),(48,18,16,67020),(49,19,26,25474),(50,20,27,96314),(51,21,29,35142),(52,22,14,56773),(53,23,19,78439),(54,24,23,31873),(55,25,26,94049),(56,26,19,94624),(57,27,30,90973),(58,28,28,70993),(59,29,3,72046),(60,30,24,47252),(61,31,21,10123),(62,32,17,78858),(63,33,1,83922),(64,34,24,83035),(65,35,3,63409),(66,36,21,57938),(67,37,28,89465),(68,38,27,83510),(69,39,20,49153),(70,40,22,75236),(71,41,25,38721),(72,42,8,47898),(73,43,14,23325),(74,44,7,52933),(75,45,3,94690),(76,46,29,34649),(77,47,26,59179),(78,48,23,91944),(79,49,3,92183),(80,50,3,85084),(81,51,11,48870),(82,52,2,69098),(83,53,30,98880),(84,54,8,97106),(85,55,3,88891),(86,56,29,53134),(87,57,1,78998),(88,58,16,45587),(89,59,19,70941),(90,60,10,27944),(91,61,24,96901),(92,62,5,30666),(93,63,22,32632),(94,64,29,61164),(95,65,16,17919),(96,66,19,76108),(97,67,15,46782),(98,68,19,85585),(99,69,25,97576),(100,70,15,41127),(101,71,15,82907),(102,72,1,11152),(103,73,7,67041),(104,74,21,21747),(105,75,9,77615),(106,76,8,42832),(107,77,26,61318);
/*!40000 ALTER TABLE `Jugadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Managers`
--

DROP TABLE IF EXISTS `Managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Managers` (
  `idManagers` int NOT NULL,
  `IdPersona` int NOT NULL,
  PRIMARY KEY (`idManagers`,`IdPersona`),
  KEY `IdPersona_idx` (`IdPersona`),
  CONSTRAINT `IdPersona` FOREIGN KEY (`IdPersona`) REFERENCES `Persona` (`idPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Managers`
--

LOCK TABLES `Managers` WRITE;
/*!40000 ALTER TABLE `Managers` DISABLE KEYS */;
INSERT INTO `Managers` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20),(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),(27,27),(28,28),(29,29),(30,30);
/*!40000 ALTER TABLE `Managers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Persona`
--

DROP TABLE IF EXISTS `Persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Persona` (
  `idPersona` int NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Apellido` varchar(45) DEFAULT NULL,
  `DNI` int DEFAULT NULL,
  PRIMARY KEY (`idPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Persona`
--

LOCK TABLES `Persona` WRITE;
/*!40000 ALTER TABLE `Persona` DISABLE KEYS */;
INSERT INTO `Persona` VALUES (1,'Keeley','Le Ball',43675901),(2,'Kerry','Murthwaite',44037040),(3,'Lexi','Salvador',48079054),(4,'Grace','Rumgay',44488150),(5,'Terese','Brister',48996636),(6,'Reba','Cobleigh',43502089),(7,'Bald','Persey',42311961),(8,'Shanda','Erskin',43596298),(9,'Darrelle','Gwillyam',48932194),(10,'Lew','Pallas',49851560),(11,'Susann','Whitwham',43340086),(12,'Dorothy','Annets',49247903),(13,'Cherye','Hauch',48179722),(14,'Gayler','Digance',41141944),(15,'Anjela','Enstone',44347547),(16,'Federica','Durker',49358367),(17,'Lauree','Curgenven',42858160),(18,'Corrie','Swan',49902942),(19,'Jamil','Stoffels',45285840),(20,'Britteny','Hulkes',43155236),(21,'Jonie','Brim',43579462),(22,'Chastity','Orman',40082723),(23,'Stanwood','Huffy',44753894),(24,'Duffy','Hurlston',49766978),(25,'Whitney','Alexandersson',46401484),(26,'Roth','Eliff',43152058),(27,'Martita','Duiguid',45750981),(28,'Morey','Netherwood',47847268),(29,'Ike','Olman',45925211),(30,'Brena','Leil',43782650),(31,'Darcie','Lowsely',41350144),(32,'Locke','Bleackly',46820772),(33,'Cristine','Tomasutti',43438011),(34,'Marlon','Peres',48392854),(35,'Kermy','Streather',43409656),(36,'Fernande','Piel',45347698),(37,'Cacilie','Trase',41176646),(38,'Frans','Fabbro',41010426),(39,'Evyn','Huthart',45362953),(40,'Livvie','Moiser',46139974),(41,'Mort','Bellanger',45078191),(42,'Bartholomeo','Aspinell',42943625),(43,'Candis','Elliker',48245567),(44,'Philipa','Ellph',44081950),(45,'Felipa','Pollitt',44198932),(46,'Corrianne','Kenderdine',45348705),(47,'Gill','Greatbach',43732389),(48,'Georgi','Natt',45001072),(49,'Marketa','Brotherhood',41625262),(50,'Bendicty','McCanny',48080218),(51,'Cyndi','Adriaens',43934779),(52,'Andreana','Mulles',46873802),(53,'Janie','Mylchreest',41941401),(54,'Celesta','Hendren',46871640),(55,'Vivyanne','Sangra',49077341),(56,'Marylou','Jannaway',46557839),(57,'Catherin','Scrigmour',48388242),(58,'Vinnie','Boylan',47466781),(59,'Cullie','Kopje',48914942),(60,'Joellen','Kenney',44668291),(61,'Becki','Ranklin',43828739),(62,'Bartholemy','Phillipps',43220254),(63,'Aili','Wareham',44779302),(64,'Odetta','Djurkovic',42498359),(65,'Riannon','O\'Leahy',40107032),(66,'Norrie','Pinder',46135170),(67,'Raff','Olivas',45075658),(68,'Mora','Jori',42090586),(69,'Andrej','Rossant',42633811),(70,'Othella','Aronowitz',42212490),(71,'Brianne','Peizer',42004818),(72,'Donella','Furbank',40493854),(73,'Van','Bartolacci',42522697),(74,'Norris','Barnewille',44359724),(75,'Sibeal','Dicky',46032293),(76,'Henderson','Van T\'Hoog',49295470),(77,'Levi','Colquete',48501185),(78,'Elle','Nasi',41426253),(79,'Verney','Finnis',42443346),(80,'Roshelle','Redihalgh',46389874),(81,'Fedora','Morteo',40859131),(82,'Joellen','MacLennan',41438551),(83,'Callean','Canedo',42039806),(84,'Briant','Petrello',47318574),(85,'Locke','Beed',46833853),(86,'Davide','Morse',40921030),(87,'Carlina','O\'Fallone',46616759),(88,'Towny','McKintosh',46956005),(89,'Lesya','Alenikov',46128853),(90,'Federica','Spieght',40338291),(91,'Bendite','Santo',40030876),(92,'Brooks','Ygou',40489142),(93,'Odey','Lecointe',41314301),(94,'Alastair','Clyne',42314680),(95,'Waylin','Semrad',44585472),(96,'Erik','McElane',49802804),(97,'Ajay','Treuge',44505768),(98,'Trace','Gerhts',46947977),(99,'Isak','Bushen',45241765),(100,'Alisha','Yanshin',48926713),(101,'Inglis','Fendley',43424586),(102,'Harlie','McClaughlin',45431038),(103,'Waldon','Clarke-Williams',47750707),(104,'Merrel','Van Dalen',43944296),(105,'Rudd','Gonnet',47559890),(106,'Pembroke','Penddreth',41194228),(107,'Blair','Cicco',45518603),(108,'Jannelle','Martusewicz',40303113),(109,'Gradey','Baribal',42707962),(110,'Jilleen','Koppen',43045695),(111,'Barbabra','Stammirs',41966733),(112,'Carissa','Curedell',48277278),(113,'Zondra','Ginnally',49366106),(114,'Cirillo','Benbrick',46434659),(115,'Larry','Iacopo',40454906),(116,'Calley','Tantrum',45971134),(117,'Sollie','Hannis',42688984),(118,'Cullin','Codrington',46540061),(119,'Shandra','Ricson',44319253),(120,'Mirna','Howlin',42945115),(121,'Moll','Bazley',41859900),(122,'Ame','Bugbee',42768777),(123,'Louella','Bolletti',42678198),(124,'Kerk','MacLeod',47703670),(125,'Elfrieda','Prine',40773054),(126,'Dun','Reinhardt',43074695),(127,'Denver','Joy',48977517),(128,'Fina','Bails',49637861),(129,'Letta','Coslett',46094379),(130,'Melita','Lantiff',49869903),(131,'Humphrey','Beadnell',42355594),(132,'Wynn','Clohisey',42382962),(133,'Hildegarde','Chene',45019776),(134,'Cad','Warde',49775464),(135,'Shaina','Androck',44242719),(136,'Franciskus','Lawly',48391830),(137,'Lillian','Grimbaldeston',45666627),(138,'Garrik','Andreassen',41750066),(139,'Alistair','Scarsbrick',48752148),(140,'Elysia','Hanigan',40897102),(141,'Austine','De Brett',42098046),(142,'Belita','Bartol',45302463),(143,'Levon','Wisden',44890173),(144,'Kelby','Matthiae',40432941),(145,'Mitchel','Kroch',49555558),(146,'Cammie','Couthard',48994854),(147,'Tadeo','Glazer',46647323),(148,'Hadley','Chantree',42613113),(149,'Bartlet','Robers',40596521),(150,'Christen','Goymer',40159873),(151,'Jamie','Maraga',42697786),(152,'Thorndike','Maleney',40635376),(153,'Leroi','Fairpool',46465921),(154,'Morse','McRill',44645082),(155,'Margret','Rosone',48783647),(156,'Thorstein','Dollen',44777303),(157,'Eddie','Lots',44759551),(158,'Sloan','Ruvel',45479153),(159,'Darby','Shallo',44501728),(160,'Aurie','Fortescue',41726079),(161,'Ignace','Celloni',42216057),(162,'Nichole','Hammill',43889119),(163,'Thaddeus','Halliburton',48200670),(164,'Jessa','O\'Dowd',44503554),(165,'Vasili','McGibbon',49528191),(166,'Gherardo','Iddenden',41665392),(167,'Deanne','Stuckow',42783974),(168,'Aidan','Dorricott',44271468),(169,'Magda','Relfe',45299379),(170,'Carmella','Mammatt',48913317),(171,'Charla','Blomfield',49247278),(172,'Brigida','Boulding',46434482),(173,'Silvio','Randales',43513052),(174,'Gaby','Garrat',45761169),(175,'Candra','Griffen',42614035),(176,'Lark','O\'Howbane',43098059),(177,'Tabitha','Cossington',42453344),(178,'Humfrey','Vint',49851165),(179,'Ferrell','Hrinchenko',47061604),(180,'Fonzie','Hurley',43560160),(181,'Bradley','Lashley',48949670),(182,'Brunhilde','Crimmins',48746938),(183,'Bab','O\'Keevan',45749828),(184,'Merry','Vooght',41036489),(185,'Jeannie','Dunderdale',44487028),(186,'Illa','Gorch',41652736),(187,'Elbert','Standring',44662305),(188,'Carita','Stubbe',47388714),(189,'Ladonna','Rawe',49526323),(190,'Kennie','Simko',49822956),(191,'Bell','Carle',44184593),(192,'Yehudit','Nutley',44830435),(193,'Phelia','Brandts',44509774),(194,'Jessamyn','Bletcher',45585737),(195,'Valerie','Giacobelli',40172259),(196,'Jeniffer','Mattimoe',49106399),(197,'Toma','Pineaux',44382110),(198,'Izak','Spriddle',41961165),(199,'Kale','Phoenix',49703396),(200,'Myer','Blackstock',45261177),(201,'Ruthy','Scathard',41326034),(202,'Ansley','Mazillius',43986506),(203,'Andie','Shavel',42906128),(204,'Sergent','Kyte',47937032),(205,'Allx','Swendell',46619728),(206,'Deana','Kummerlowe',49767594),(207,'Abel','Swain',41630602),(208,'Mella','Ive',48584375),(209,'Tisha','Warricker',46997304),(210,'Gustavo','Goldin',46563333),(211,'Murielle','Matthew',42595973),(212,'Cariotta','Adamsen',44870047),(213,'Darcy','Stuchburie',47653038),(214,'Petronille','Benza',49887656),(215,'Gerome','Merlin',42519214),(216,'Franky','Antoniottii',49657672),(217,'Clea','Honisch',40236297),(218,'Timoteo','Murison',45027017),(219,'Lettie','Saunton',43810993),(220,'Josefina','Zettoi',42196231),(221,'Lorine','Rosenau',40614892),(222,'Aldridge','Heersema',41981207),(223,'Darrick','Pavluk',47322652),(224,'Sherye','Jordine',48980571),(225,'Myron','Veschambes',43920480),(226,'Rosabella','Dungey',49954791),(227,'Alec','Murdy',49303342),(228,'Antoni','ducarme',42863055),(229,'Zane','Gors',44881342),(230,'Thorny','Boshere',42565261),(231,'Trixie','Tayloe',48000819),(232,'Rozalie','Dain',45890233),(233,'Tobit','Grishaev',47648836),(234,'Dorie','Richardon',42589383),(235,'Wylie','Pleat',40623633),(236,'Gay','Rosle',41318476),(237,'Brooks','Haglinton',42241324),(238,'Casandra','Spellworth',45629247),(239,'Humbert','Norcross',45475030),(240,'Beckie','Sullivan',43926233),(241,'Georgine','Dunniom',43166995),(242,'Rhodie','Windross',47037592),(243,'Dyan','Overy',46544095),(244,'Arty','Bilsborrow',44362204),(245,'Indira','Illwell',48422440),(246,'Chrisy','Lindman',46457128),(247,'Adolphus','Peidro',49940074),(248,'Barnard','Bernardo',40883043),(249,'Lauretta','Davies',42795166),(250,'Dido','Tyer',40819391);
/*!40000 ALTER TABLE `Persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Plantilla`
--

DROP TABLE IF EXISTS `Plantilla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Plantilla` (
  `idPlantilla` int NOT NULL AUTO_INCREMENT,
  `idJugador` int DEFAULT NULL,
  `Posiciones_idPosiciones` int NOT NULL,
  `NumeroDorsal` varchar(45) DEFAULT NULL,
  `idEquipoFutbol` int DEFAULT NULL,
  PRIMARY KEY (`idPlantilla`,`Posiciones_idPosiciones`),
  KEY `IdJugadores_Plantilla_idx` (`idJugador`),
  KEY `fk_Plantilla_Posiciones1_idx` (`Posiciones_idPosiciones`),
  KEY `IdEquipoFutbol_idx` (`idEquipoFutbol`),
  CONSTRAINT `fk_Plantilla_Posiciones1` FOREIGN KEY (`Posiciones_idPosiciones`) REFERENCES `Posiciones` (`idPosiciones`),
  CONSTRAINT `IdEquipoFutbol` FOREIGN KEY (`idEquipoFutbol`) REFERENCES `EquipoFutbol` (`idEquipoFutbol`),
  CONSTRAINT `IdJugador` FOREIGN KEY (`idJugador`) REFERENCES `Jugadores` (`IdJugadores`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Plantilla`
--

LOCK TABLES `Plantilla` WRITE;
/*!40000 ALTER TABLE `Plantilla` DISABLE KEYS */;
INSERT INTO `Plantilla` VALUES (1,31,1,'1',32),(2,32,2,'2',12),(2,32,3,'2',20),(3,33,4,'3',11),(4,34,1,'4',29),(5,35,2,'5',12),(6,36,3,'6',6),(7,37,4,'7',36),(8,38,4,'8',7),(9,39,4,'9',4),(10,40,3,'10',9),(11,41,4,'11',13),(12,42,3,'12',35),(13,43,3,'13',35),(14,44,2,'14',37),(15,45,3,'15',28),(16,46,2,'16',39),(17,47,3,'17',20),(18,48,2,'18',29),(19,49,2,'19',16),(20,50,4,'20',32),(21,51,1,'21',35),(22,52,1,'22',18),(23,53,3,'23',31),(24,54,1,'24',32),(25,55,4,'25',13),(26,56,3,'26',26),(27,57,1,'27',24),(28,58,3,'28',23),(29,59,4,'29',28),(30,60,4,'30',10),(31,61,3,'31',11),(32,62,3,'32',35),(33,63,4,'33',20),(34,64,1,'34',27),(35,65,2,'35',11),(36,66,3,'36',36),(37,67,4,'37',3),(38,68,2,'38',8),(39,69,2,'39',30),(40,70,2,'40',33),(41,71,4,'41',33),(42,72,3,'42',14),(43,73,1,'43',11),(44,74,1,'44',6),(45,75,1,'45',3),(46,76,1,'46',38),(47,77,3,'47',29);
/*!40000 ALTER TABLE `Plantilla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Posiciones`
--

DROP TABLE IF EXISTS `Posiciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Posiciones` (
  `idPosiciones` int NOT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  `JugadoresConvocados` int DEFAULT NULL,
  PRIMARY KEY (`idPosiciones`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Posiciones`
--

LOCK TABLES `Posiciones` WRITE;
/*!40000 ALTER TABLE `Posiciones` DISABLE KEYS */;
INSERT INTO `Posiciones` VALUES (1,'ARQUERO',NULL),(2,'DEFENSA',NULL),(3,'MEDICAMPO',NULL),(4,'DELANTERO',NULL);
/*!40000 ALTER TABLE `Posiciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Relacion`
--

DROP TABLE IF EXISTS `Relacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Relacion` (
  `Managers_idManagers` int NOT NULL,
  `EquipoFutbol_idEquipoFutbol` int NOT NULL,
  `Relacion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Managers_idManagers`,`EquipoFutbol_idEquipoFutbol`),
  KEY `fk_Managers_has_EquipoFutbol_EquipoFutbol1_idx` (`EquipoFutbol_idEquipoFutbol`),
  KEY `fk_Managers_has_EquipoFutbol_Managers1_idx` (`Managers_idManagers`),
  CONSTRAINT `fk_Managers_has_EquipoFutbol_EquipoFutbol1` FOREIGN KEY (`EquipoFutbol_idEquipoFutbol`) REFERENCES `EquipoFutbol` (`idEquipoFutbol`),
  CONSTRAINT `fk_Managers_has_EquipoFutbol_Managers1` FOREIGN KEY (`Managers_idManagers`) REFERENCES `Managers` (`idManagers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Relacion`
--

LOCK TABLES `Relacion` WRITE;
/*!40000 ALTER TABLE `Relacion` DISABLE KEYS */;
INSERT INTO `Relacion` VALUES (1,1,'Prohibida'),(2,2,'Asociada'),(3,3,'Asociada'),(4,4,'Prohibida'),(5,5,'Prohibida'),(6,6,'Asociada'),(7,7,'Prohibida'),(8,8,'Prohibida'),(9,9,'Prohibida'),(10,10,'Asociada'),(11,11,'Prohibida'),(12,12,'Asociada'),(13,13,'Asociada'),(14,14,'Prohibida'),(15,15,'Prohibida'),(16,16,'Prohibida'),(17,17,'Prohibida'),(18,18,'Asociada'),(19,19,'Asociada'),(20,20,'Prohibida'),(21,21,'Asociada'),(22,22,'Prohibida'),(23,23,'Asociada'),(24,24,'Asociada'),(25,25,'Prohibida'),(26,26,'Prohibida'),(27,27,'Asociada'),(28,28,'Asociada'),(29,29,'Asociada'),(30,30,'Prohibida');
/*!40000 ALTER TABLE `Relacion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-11 10:36:14
