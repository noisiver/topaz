-- MySQL dump 10.16  Distrib 10.1.36-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: dspfish
-- ------------------------------------------------------
-- Server version	10.1.36-MariaDB

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
-- Table structure for table `fishing_mob`
--

DROP TABLE IF EXISTS `fishing_mob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fishing_mob` (
  `mobid` int(10) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  `zoneid` smallint(5) unsigned NOT NULL,
  `level` tinyint(3) unsigned NOT NULL,
  `size` tinyint(3) unsigned NOT NULL,
  `base_delay` tinyint(2) unsigned NOT NULL,
  `base_move` tinyint(2) unsigned NOT NULL,
  `log` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `quest` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `nm` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `nm_flags` int(11) unsigned NOT NULL DEFAULT '0',
  `areaid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `rarity` smallint(5) unsigned NOT NULL DEFAULT '0',
  `min_respawn` int(10) unsigned NOT NULL DEFAULT '0',
  `required_lureid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `required_key_item` smallint(5) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`mobid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fishing_mob`
--

LOCK TABLES `fishing_mob` WRITE;
/*!40000 ALTER TABLE `fishing_mob` DISABLE KEYS */;
INSERT INTO `fishing_mob` VALUES (17396141,'Odontotyrannus',151,1,15,15,2,0,91,1,0,1,0,0,17001,0,0);

-- West Ronfaure 
INSERT INTO `fishing_mob` VALUES (17186817,'Tree_Crab',100,1,1,15,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17186818,'Limicoline_Crab',100,1,1,15,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17186819,'Land_Crab',100,1,1,15,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17186820,'Vermivorous_Crab',100,1,1,15,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17186821,'Passage_Crab',100,1,1,15,15,255,255,0,0,1,1000,0,0,0,0);

-- East Ronfaure
INSERT INTO `fishing_mob` VALUES (17190913,'Pugil',101,1,1,9,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17190914,'Cheval_Pugil',101,1,1,9,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17190915,'Mud_Pugil',101,1,1,9,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17190916,'Pug_Pugil',101,1,1,9,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17190917,'Fighting_Pugil',101,1,1,9,15,255,255,0,0,1,1000,0,0,0,0);

-- West Sarutabaruta
INSERT INTO `fishing_mob` VALUES (17248257,'Palm_Crab',115,1,1,9,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17248258,'Savanna_Crab',115,1,1,11,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17248259,'Land_Crab',115,1,1,11,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17248260,'Mugger_Crab',115,1,1,11,15,255,255,0,0,2,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17248261,'Passage_Crab',115,1,1,11,15,255,255,0,0,2,1000,0,0,0,0);

-- East Sarutabaruta
INSERT INTO `fishing_mob` VALUES (17252353,'Palm_Crab',116,1,1,14,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17252354,'Savanna_Crab',116,1,15,11,15,255,255,0,0,2,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17252355,'Mud_Pugil',116,1,1,10,15,255,255,0,0,3,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17252356,'Pug_Pugil',116,1,1,9,15,255,255,0,0,4,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17252357,'Fighting_Pugil',116,1,1,8,15,255,255,0,0,5,1000,0,0,0,0);

-- North Gustaberg
INSERT INTO `fishing_mob` VALUES (17211393,'Stone_Crab',106,1,1,14,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17211394,'Sand_Crab',106,1,15,11,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17211395,'Land_Crab',106,1,1,10,15,255,255,0,0,2,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17211396,'Pug_Pugil',106,1,1,9,15,255,255,0,0,2,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17211397,'Fighting_Pugil',106,1,1,8,15,255,255,0,0,2,1000,0,0,0,0);

-- South Gustaberg
INSERT INTO `fishing_mob` VALUES (17215489,'Stone_Crab',107,1,1,14,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17215490,'Sand_Crab',107,1,15,11,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17215491,'Land_Crab',107,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17215492,'Mole_Crab',107,1,1,9,15,255,255,0,0,2,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17215493,'Passage_Crab',107,1,1,8,15,255,255,0,0,2,1000,0,0,0,0);

-- Sea Serpent Grotto
INSERT INTO `fishing_mob` VALUES (17498113,'Big_Jaw_fished',176,1,1,14,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17498114,'Big_Jaw_fished',176,1,1,14,15,255,255,0,0,2,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17498115,'Bigclaw',176,1,15,11,15,255,255,0,0,3,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17498116,'Rock_Crab',176,1,1,10,15,255,255,0,0,4,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17498117,'Stygian_Pugil',176,1,1,9,15,255,255,0,0,5,1000,0,0,0,0);

-- Ship Bound for Selbina
INSERT INTO `fishing_mob` VALUES (17678337,'Sea_Pugil',220,1,1,14,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17678338,'Ocean_Crab',220,1,1,14,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17678339,'Ocean_Pugil',220,1,15,11,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17678340,'Pirate_Pugil',220,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17678341,'Sea_Monk',220,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);

-- Ship Bound for Mhaura
INSERT INTO `fishing_mob` VALUES (17682433,'Sea_Pugil',221,1,1,14,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17682434,'Ocean_Crab',221,1,1,14,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17682435,'Ocean_Pugil',221,1,15,11,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17682436,'Pirate_Pugil',221,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17682437,'Sea_Monk',221,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);

-- Qufim Island
INSERT INTO `fishing_mob` VALUES (17293313,'Qufim_Pugil',126,1,1,14,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17293314,'Greater_Pugil_fished',126,1,1,14,15,255,255,0,0,2,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17293315,'Sea_Bishop',126,1,15,11,15,255,255,0,0,3,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17293316,'Vepar',126,1,1,10,15,255,255,0,0,3,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17293317,'Kraken',126,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17293318,'Kraken',126,1,1,10,15,255,255,0,0,2,1000,0,0,0,0);

-- Buburimu Penisula
INSERT INTO `fishing_mob` VALUES (17260545,'Stag_Crab',118,1,1,14,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17260546,'Puffer_Pugil',118,1,1,14,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17260547,'Snipper',118,1,15,11,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17260548,'Shoal_Pugil',118,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17260549,'Clipper',118,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);

-- Valkurm Dunes
INSERT INTO `fishing_mob` VALUES (17199105,'Stag_Crab',103,1,1,14,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17199106,'Puffer_Pugil',103,1,1,14,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17199107,'Snipper',103,1,15,11,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17199108,'Beach_Pugil',103,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17199109,'Cutter',103,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);

-- Cape Teriggan
INSERT INTO `fishing_mob` VALUES (17240065,'Razorjaw_Pugil',113,1,1,14,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17240066,'Rock_Crab',113,1,1,14,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17240067,'Stygian_Pugil',113,1,15,11,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17240068,'Stygian_Pugil',113,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17240069,'Stygian_Pugil',113,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17240070,'Devil_Manta',113,50,1,8,15,255,255,1,106,1,1000,600,0,0,0);

-- Dragon's Aery
INSERT INTO `fishing_mob` VALUES (17408001,'Demonic_Pugil',154,1,1,14,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17408002,'Demonic_Pugil',154,1,1,14,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17408003,'Demonic_Pugil',154,1,15,11,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17408004,'Demonic_Pugil',154,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17408005,'Demonic_Pugil',154,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);

-- Jugner Forest
INSERT INTO `fishing_mob` VALUES (17203201,'Stag_Crab',104,1,1,14,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17203202,'Spring_Pugil',104,1,1,14,15,255,255,0,0,2,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17203203,'Thread_Leech',104,1,15,11,15,255,255,0,0,3,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17203204,'Ferocious_Pugil',104,1,1,10,15,255,255,0,0,4,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17203205,'Huge_Leech',104,1,1,10,15,255,255,0,0,5,1000,0,0,0,0);

-- Beaucedine Glacier
INSERT INTO `fishing_mob` VALUES (17231873,'Greater_Pugil',111,1,1,14,15,255,255,0,0,2,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17231874,'Vepar',111,1,1,14,15,255,255,0,0,2,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17231875,'Kraken',111,1,15,11,15,255,255,0,0,2,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17231876,'Apsaras',111,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17231877,'Morgawr',111,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);

-- Bibiki_Bay(Purgonorgo Isle)
INSERT INTO `fishing_mob` VALUES (16793601,'Ghost_Crab_fished',4,1,1,14,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (16793602,'Grindylow',4,1,1,14,15,255,255,0,0,2,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (16793603,'Greater_Pugil_fished',4,1,15,11,15,255,255,0,0,3,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (16793604,'Apsaras',4,1,1,10,15,255,255,0,0,4,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (16793605,'Kraken_fished',4,1,1,10,15,255,255,0,0,5,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (16793606,'Lancet_Jagil',4,1,1,10,15,255,255,0,0,6,1000,0,0,0,0);

-- Kuftal Tunnel
INSERT INTO `fishing_mob` VALUES (17489921,'Scavenger_Crab',174,1,1,11,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17489922,'Scavenger_Crab',174,1,1,11,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17489923,'Stygian_Pugil',174,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17489924,'Stygian_Pugil',174,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17489925,'Devil_Manta',174,50,1,8,15,255,255,1,106,1,1000,600,0,0,0);

-- Sauromugue Champaign 
INSERT INTO `fishing_mob` VALUES (17268737,'Big_Jaw_fished',120,1,1,11,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17268738,'Snipper_fished',120,1,1,11,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17268739,'Greater_Pugil_fished',120,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17268740,'Cutter_fished',120,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17268741,'Kraken_fished',120,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);

-- Batallia Downs
INSERT INTO `fishing_mob` VALUES (17207297,'Snipper_fished',105,1,1,11,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17207298,'Land_Pugil',105,1,1,11,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17207299,'Cutter_fished',105,1,1,10,15,255,255,0,0,2,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17207300,'Greater_Pugil_fished',105,1,1,10,15,255,255,0,0,2,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17207301,'Kraken_fished',105,1,1,10,15,255,255,0,0,2,1000,0,0,0,0);

-- Pashhow Marshlands
INSERT INTO `fishing_mob` VALUES (17223681,'Swamp_Leech',109,1,1,11,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17223682,'Stag_Crab',109,1,1,11,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17223683,'Swamp_Pugil',109,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17223684,'Thread_Leech',109,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17223685,'Snipper',109,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);

-- Rolanberry Fields
INSERT INTO `fishing_mob` VALUES (17227777,'Snipper',110,1,1,11,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17227778,'Big_Jaw',110,1,1,11,15,255,255,0,0,2,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17227779,'Horrid_Fluke',110,1,1,10,15,255,255,0,0,3,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17227780,'Greater_Pugil',110,1,1,10,15,255,255,0,0,3,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17227781,'Big_Leech',110,1,1,10,15,255,255,0,0,4,1000,0,0,0,0);

-- La Theine Plateau
INSERT INTO `fishing_mob` VALUES (17195009,'Coral_Crab',102,1,1,11,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17195010,'Pug_Pugil',102,1,1,11,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17195011,'Thickshell',102,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17195012,'Giant_Pugil',102,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17195013,'Puffer_Pugil',102,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);

-- The Sanctuary of ZiTah
INSERT INTO `fishing_mob` VALUES (17272833,'Greater_Pugil',121,1,1,11,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17272834,'Clipper',121,1,1,11,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17272835,'Greater_Pugil',121,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17272836,'Bigclaw',121,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17272837,'Apsaras',121,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);

-- Ghelsba Outpost
INSERT INTO `fishing_mob` VALUES (17350657,'Pugil',140,1,1,11,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17350658,'Pugil',140,1,1,11,15,255,255,0,0,2,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17350659,'Pug_Pugil',140,1,1,10,15,255,255,0,0,3,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17350660,'Giant_Pugil',140,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17350661,'Puffer_Pugil',140,1,1,10,15,255,255,0,0,2,1000,0,0,0,0);

-- Davoi
INSERT INTO `fishing_mob` VALUES (17387521,'Ferocious_Pugil',149,1,1,11,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17387522,'Ferocious_Pugil',149,1,1,11,15,255,255,0,0,3,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17387523,'Greater_Pugil',149,1,1,10,15,255,255,0,0,4,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17387524,'Gloop',149,1,1,10,15,255,255,0,0,2,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17387525,'Oil_Spill',149,1,1,10,15,255,255,0,0,2,1000,0,0,0,0);

-- Giddeus
INSERT INTO `fishing_mob` VALUES (17371137,'Pugil',145,1,1,11,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17371138,'Pugil',145,1,1,11,15,255,255,0,0,2,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17371139,'Pug_Pugil',145,1,1,10,15,255,255,0,0,3,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17371140,'Puffer_Pugil',145,1,1,10,15,255,255,0,0,4,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17371141,'Land_Pugil',145,1,1,10,15,255,255,0,0,4,1000,0,0,0,0);

-- Gusgen Mines
INSERT INTO `fishing_mob` VALUES (17580033,'Pirate_Pugil',196,1,1,11,15,255,255,0,0,4,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17580034,'Pirate_Pugil',196,1,1,11,15,255,255,0,0,5,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17580035,'Greater_Pugil',196,1,1,10,15,255,255,0,0,6,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17580036,'Ooze',196,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17580037,'Mush',196,1,1,10,15,255,255,0,0,2,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17281547,'Mush',196,1,1,10,15,255,255,0,0,3,1000,0,0,0,0);

-- Yuhtunga Jungle
INSERT INTO `fishing_mob` VALUES (17281025,'Ironshell',123,1,1,11,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17281026,'Ironshell',123,1,1,11,15,255,255,0,0,2,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17281027,'Bigclaw',123,1,1,10,15,255,255,0,0,3,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17281028,'Bigclaw',123,1,1,10,15,255,255,0,0,4,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17281029,'Bloodsucker',123,1,1,10,15,255,255,0,0,5,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17282047,'Bloodsucker',123,1,1,10,15,255,255,0,0,6,1000,0,0,0,0);

-- Yhoator Jungle
INSERT INTO `fishing_mob` VALUES (17285121,'Greater_Pugil',124,1,1,11,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17285573,'Greater_Pugil',124,1,1,11,15,255,255,0,0,2,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17285122,'Clipper',124,1,1,11,15,255,255,0,0,3,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17285123,'Vepar',124,1,1,10,15,255,255,0,0,4,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17285124,'Vepar',124,1,1,10,15,255,255,0,0,5,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17285125,'Makara',124,1,1,10,15,255,255,0,0,6,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17286143,'Makara',124,1,1,10,15,255,255,0,0,7,1000,0,0,0,0);

-- Eastern Altepa Desert
INSERT INTO `fishing_mob` VALUES (17244161,'Greater_Pugil',114,1,1,11,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17244162,'Cutter',114,1,1,11,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17244163,'Ironshell',114,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17244164,'Makara',114,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17244165,'Bigclaw',114,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);

-- Western Altepa Desert
INSERT INTO `fishing_mob` VALUES (17289217,'Ironshell',125,1,1,11,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17289218,'Apsaras',125,1,1,11,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17289219,'Bigclaw',125,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17289220,'Bigclaw',125,1,1,10,15,255,255,0,0,2,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17289221,'Razorjaw_Pugil',125,1,1,10,15,255,255,0,0,2,1000,0,0,0,0);

-- Korroloka Tunnel
INSERT INTO `fishing_mob` VALUES (17485825,'Snipper',173,1,1,11,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17485826,'Snipper',173,1,1,11,15,255,255,0,0,2,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17485827,'Greater_Pugil',173,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17485828,'Greater_Pugil',173,1,1,10,15,255,255,0,0,2,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17485829,'Kraken',173,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);

-- The Boyahda Tree
INSERT INTO `fishing_mob` VALUES (17403905,'Scavenger_Crab',153,1,1,11,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17403906,'Stygian_Pugil',153,1,1,11,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17403907,'Bouncing_Ball',153,1,1,10,15,255,255,0,0,2,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17403908,'Demonic_Pugil',153,1,1,10,15,255,255,0,0,2,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17403909,'Demonic_Pugil',153,1,1,10,15,255,255,0,0,3,1000,0,0,0,0);

-- Oldton Movalpolos
INSERT INTO `fishing_mob` VALUES (16822273,'Snipper',11,1,1,11,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (16822274,'Blind_Crab',11,1,1,11,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (16822275,'Cutter',11,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (16822276,'Ghost_Crab',11,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (16822277,'Amoebic_Nodule',11,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);

-- Den of Rancor
INSERT INTO `fishing_mob` VALUES (17432577,'Rock_Crab',160,1,1,11,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17432578,'Razorjaw_Pugil',160,1,1,11,15,255,255,0,0,3,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17432579,'Bloodsucker',160,1,1,10,15,255,255,0,0,2,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17432580,'Mousse',160,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (17432581,'Mousse',160,1,1,10,15,255,255,0,0,2,1000,0,0,0,0);

-- Lufaise Meadows
INSERT INTO `fishing_mob` VALUES (16875521,'Clipper',24,1,1,11,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (16875522,'Grindylow',24,1,1,11,15,255,255,0,0,3,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (16875523,'Greater_Pugil',24,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (16875524,'Greater_Pugil',24,1,1,10,15,255,255,0,0,3,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (16875525,'Apsaras',24,1,1,10,15,255,255,0,0,2,1000,0,0,0,0);

-- Misareaux Coast
INSERT INTO `fishing_mob` VALUES (16879617,'Clipper',25,1,1,11,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (16879618,'Grindylow',25,1,1,11,15,255,255,0,0,2,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (16879619,'Greater_Pugil',25,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (16879620,'Greater_Pugil',25,1,1,10,15,255,255,0,0,2,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (16879621,'Mantrap',25,1,1,10,15,255,255,0,0,3,1000,0,0,0,0);

-- Manaclipper
INSERT INTO `fishing_mob` VALUES (16789505,'Ghost_Crab',3,1,1,11,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (16789506,'Ghost_Crab',3,1,1,11,15,255,255,0,0,2,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (16789507,'Greater_Pugil',3,1,1,10,15,255,255,0,0,3,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (16789508,'Kraken',3,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (16789509,'Harajnite',3,1,1,10,15,255,255,1,106,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (16789519,'Harajnite',3,1,1,10,15,255,255,1,106,2,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (16789520,'Harajnite',3,1,1,10,15,255,255,1,106,3,1000,0,0,0,0);

-- Carpenters' Landing
INSERT INTO `fishing_mob` VALUES (16785409,'Snipper',2,1,1,11,15,255,255,0,0,1,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (16785410,'Triangle_Crab',2,1,1,11,15,255,255,0,0,2,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (16785411,'Clipper',2,1,1,10,15,255,255,0,0,3,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (16785412,'Greater_Pugil',2,1,1,10,15,255,255,0,0,4,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (16785413,'Fishtrap',2,1,1,10,15,255,255,0,0,5,1000,0,0,0,0);
INSERT INTO `fishing_mob` VALUES (16786431,'Fishtrap',2,1,1,10,15,255,255,0,0,6,1000,0,0,0,0);


-- Phanauet Cannel
--INSERT INTO `fishing_mob` VALUES (16781313,'Snipper',1,1,1,11,15,255,255,0,0,1,1000,0,0,0,0);
--INSERT INTO `fishing_mob` VALUES (17244162,'Snipper',1,1,1,11,15,255,255,0,0,1,1000,0,0,0,0);
--INSERT INTO `fishing_mob` VALUES (17244163,'Big_Jaw',1,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);
--INSERT INTO `fishing_mob` VALUES (17244164,'Fishtrap',1,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);
--INSERT INTO `fishing_mob` VALUES (17244165,'Protozoan',1,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);
--INSERT INTO `fishing_mob` VALUES (17244165,'Aipaloovik',1,1,1,10,15,255,255,0,0,1,1000,0,0,0,0);



/*!40000 ALTER TABLE `fishing_mob` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-02 20:00:44
