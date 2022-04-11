-- MariaDB dump 10.19  Distrib 10.7.3-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: pedia_db
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf32_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf32_bin NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf32_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf32 COLLATE=utf32_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add matches',7,'add_matches'),
(26,'Can change matches',7,'change_matches'),
(27,'Can delete matches',7,'delete_matches'),
(28,'Can view matches',7,'view_matches'),
(29,'Can add teams',8,'add_teams'),
(30,'Can change teams',8,'change_teams'),
(31,'Can delete teams',8,'delete_teams'),
(32,'Can view teams',8,'view_teams'),
(33,'Can add tournies',9,'add_tournies'),
(34,'Can change tournies',9,'change_tournies'),
(35,'Can delete tournies',9,'delete_tournies'),
(36,'Can view tournies',9,'view_tournies'),
(37,'Can add match result',10,'add_matchresult'),
(38,'Can change match result',10,'change_matchresult'),
(39,'Can delete match result',10,'delete_matchresult'),
(40,'Can view match result',10,'view_matchresult'),
(41,'Can add players',11,'add_players'),
(42,'Can change players',11,'change_players'),
(43,'Can delete players',11,'delete_players'),
(44,'Can view players',11,'view_players'),
(45,'Can add news',12,'add_news'),
(46,'Can change news',12,'change_news'),
(47,'Can delete news',12,'delete_news'),
(48,'Can view news',12,'view_news'),
(49,'Can add feedback',13,'add_feedback'),
(50,'Can change feedback',13,'change_feedback'),
(51,'Can delete feedback',13,'delete_feedback'),
(52,'Can view feedback',13,'view_feedback');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf32_bin NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf32_bin NOT NULL,
  `first_name` varchar(150) COLLATE utf32_bin NOT NULL,
  `last_name` varchar(150) COLLATE utf32_bin NOT NULL,
  `email` varchar(254) COLLATE utf32_bin NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf32 COLLATE=utf32_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES
(1,'pbkdf2_sha256$320000$bpgy39grk2Q5QgaS6eFjEI$AcnE/mY1z2LXLJY1iWoICIihEpPGcgeQSoKB14aXxoU=','2022-04-11 14:37:33.557494',1,'aureri','','','',1,1,'2022-04-08 16:01:29.571313'),
(2,'pbkdf2_sha256$320000$oupEhsRqt7ftOZA92YAFRa$d887umMKa5dxpwKg8qki56HlxbnDHN2RNsFXhKMYPrw=','2022-04-11 18:37:39.389695',0,'bobsmith','Bob','Smith','bobsmith@gmail.com',0,1,'2022-04-09 19:35:42.864528');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf32_bin DEFAULT NULL,
  `object_repr` varchar(200) COLLATE utf32_bin NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext COLLATE utf32_bin NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf32_bin NOT NULL,
  `model` varchar(100) COLLATE utf32_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf32 COLLATE=utf32_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(13,'pedia_app','feedback'),
(7,'pedia_app','matches'),
(10,'pedia_app','matchresult'),
(12,'pedia_app','news'),
(11,'pedia_app','players'),
(8,'pedia_app','teams'),
(9,'pedia_app','tournies'),
(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf32_bin NOT NULL,
  `name` varchar(255) COLLATE utf32_bin NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf32 COLLATE=utf32_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES
(1,'contenttypes','0001_initial','2022-03-20 12:33:14.304691'),
(2,'auth','0001_initial','2022-03-20 12:33:22.632278'),
(3,'admin','0001_initial','2022-03-20 12:33:25.524124'),
(4,'admin','0002_logentry_remove_auto_add','2022-03-20 12:33:25.579552'),
(5,'admin','0003_logentry_add_action_flag_choices','2022-03-20 12:33:25.654351'),
(6,'contenttypes','0002_remove_content_type_name','2022-03-20 12:33:26.418123'),
(7,'auth','0002_alter_permission_name_max_length','2022-03-20 12:33:27.145468'),
(8,'auth','0003_alter_user_email_max_length','2022-03-20 12:33:27.245882'),
(9,'auth','0004_alter_user_username_opts','2022-03-20 12:33:27.284636'),
(10,'auth','0005_alter_user_last_login_null','2022-03-20 12:33:27.782406'),
(11,'auth','0006_require_contenttypes_0002','2022-03-20 12:33:27.823967'),
(12,'auth','0007_alter_validators_add_error_messages','2022-03-20 12:33:27.872129'),
(13,'auth','0008_alter_user_username_max_length','2022-03-20 12:33:27.991359'),
(14,'auth','0009_alter_user_last_name_max_length','2022-03-20 12:33:28.116869'),
(15,'auth','0010_alter_group_name_max_length','2022-03-20 12:33:28.233915'),
(16,'auth','0011_update_proxy_permissions','2022-03-20 12:33:28.280874'),
(17,'auth','0012_alter_user_first_name_max_length','2022-03-20 12:33:28.392719'),
(18,'pedia_app','0001_initial','2022-03-20 12:33:29.637435'),
(19,'sessions','0001_initial','2022-03-20 12:33:30.013976'),
(20,'pedia_app','0002_alter_tournies_tier','2022-03-20 13:04:05.668917'),
(21,'pedia_app','0003_alter_tournies_tier','2022-03-20 13:04:39.386897'),
(22,'pedia_app','0004_remove_matches_team1_remove_matches_team2_and_more','2022-03-25 13:44:06.369978'),
(23,'pedia_app','0005_rename_t1_id_matches_team1_and_more','2022-03-30 14:32:31.566998'),
(24,'pedia_app','0006_matches_is_finished','2022-03-30 16:19:34.397424'),
(25,'pedia_app','0007_alter_matches_is_finished','2022-04-01 10:58:39.859611'),
(26,'pedia_app','0008_players','2022-04-08 14:04:45.129193'),
(27,'pedia_app','0009_alter_tournies_is_finished_alter_tournies_winner','2022-04-11 08:01:22.788129'),
(28,'pedia_app','0010_players_rank','2022-04-11 13:08:42.101297'),
(29,'pedia_app','0011_news','2022-04-11 15:55:18.562223'),
(30,'pedia_app','0012_feedback','2022-04-11 18:06:20.642490');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf32_bin NOT NULL,
  `session_data` longtext COLLATE utf32_bin NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES
('1bi2axszoj8l6g2pfkg3miq4ya2kdwhu','.eJxVjDsOwjAQBe_iGllRdv0JJT1nsNZrLw4gW4qTCnF3iJQC2jcz76UCbWsJW89LmJM6q1GdfrdI_Mh1B-lO9dY0t7ouc9S7og_a9bWl_Lwc7t9BoV6-tTEDcBKwE3KObkhILjoBxFEgeU8iNoMDEZZoXZ6I0VkLnr2JKKjeH_fIOIU:1ndyUk:rN1KVjykGUgKxKS6Ni4-5D-kRG95cyCMf3drZvTApCM','2022-04-25 18:10:34.422556'),
('618rvp6q8xuqxugx6m51guh3f7f2nbv0','e30:1nckmX:5eZ67BotsNlpaCceKMudJGrhjDFF-g6KZxiqe3t5R3s','2022-04-22 09:19:53.221168'),
('a9sya6858lz2risrn48hjaj7txgonw1e','e30:1nZZjV:8v2iiEC-CAw1061sXYWG-EXnR1KYNeu538KAyuE__Z0','2022-04-13 14:55:37.828875'),
('b44yegdb4emvvv0jydm0wn1okua3diyg','e30:1ndhSw:OaKvrYvbtxh7iIbsLayVNEL-l_rFxImLeJ2LOsptp2M','2022-04-24 23:59:34.643558'),
('b71ixuyvvaxehv883hms7ztgs7skjfp3','e30:1naF14:HoVu6j4Y2C9jGqjNAQTIZnwhyOgZQ08RFzxsi0k5Jq4','2022-04-15 11:00:30.569394'),
('cxc7fltgs7zpbj744734vzb43mdldldq','.eJxVjDsOwjAQBe_iGllRdv0JJT1nsNZrLw4gW4qTCnF3iJQC2jcz76UCbWsJW89LmJM6q1GdfrdI_Mh1B-lO9dY0t7ouc9S7og_a9bWl_Lwc7t9BoV6-tTEDcBKwE3KObkhILjoBxFEgeU8iNoMDEZZoXZ6I0VkLnr2JKKjeH_fIOIU:1ndJNV:JJifsWyHb31mR-dZzOlMB08mbZv-Vcp5c42-lqBP6YE','2022-04-23 22:16:21.981020'),
('fk2jxniagf7egbgfz8hwcm19bal38t8c','.eJydzjELwjAQhuG_ct6cQQsubkWtm5O4NKWc5pBIk0jusij-d0EQXNP1g4fvfeEYWIRuLLjBvrc4jndJ8bdaNLA00KwNWDylkiMFjgrKoitonWO3sDgYqJKz4I6UOx9pqtBMAY6kReDs45UzV9oDhYuvyf2iBvbySFmlEnYle5pr6cmwnShWulY00-T_7gZ8fwAngaiA:1nVwtq:fY2J2eF-2CyIWRPyJMqdHMcec7MzNi_Sm02iyYWZJcQ','2022-04-03 14:51:18.250513'),
('h0780yt3a7l0v76djmu6xp37up2mbw37','.eJxVjDsOwjAQBe_iGllRdv0JJT1nsNZrLw4gW4qTCnF3iJQC2jcz76UCbWsJW89LmJM6q1GdfrdI_Mh1B-lO9dY0t7ouc9S7og_a9bWl_Lwc7t9BoV6-tTEDcBKwE3KObkhILjoBxFEgeU8iNoMDEZZoXZ6I0VkLnr2JKKjeH_fIOIU:1ndxwX:68NdoZmc8LwU1J7eUAS9kCiDdmTWJJ0tOCFsUZER06w','2022-04-25 17:35:13.762525'),
('knvf4stawfn7jguecg3sopsxv05qt7xk','.eJxVjMsOwiAQAP-FsyF0y9Ojd7-B7C4gVdMmpT0Z_11JetDrzGReIuK-1bi3vMYpibMYxOmXEfIjz12kO863RfIyb-tEsifysE1el5Sfl6P9G1RstW8TmRLyCOyyLzASG0_ow6hAawpMSXkHCqzRFguBpQGYGIt1_kuCeH8A7Nc4AQ:1ncr3Z:oGGFxjQpsVBmRL60lPivEk-fJCib_V9oyrHIMR9e8AQ','2022-04-22 16:01:53.569110'),
('mmqayu8kv8ncbf0dyk5w71ga93nu5oww','.eJxVjDsOwjAQBe_iGllRdv0JJT1nsNZrLw4gW4qTCnF3iJQC2jcz76UCbWsJW89LmJM6q1GdfrdI_Mh1B-lO9dY0t7ouc9S7og_a9bWl_Lwc7t9BoV6-tTEDcBKwE3KObkhILjoBxFEgeU8iNoMDEZZoXZ6I0VkLnr2JKKjeH_fIOIU:1ndyux:IzIsTrc5vrWsWW2_vDPMoPYeZEqjAsTy82anHTeOBCs','2022-04-25 18:37:39.487264'),
('newhmaegpdkvdos5aedtj161uzevdb6z','e30:1ndHAZ:u3tZXsHWNAZSWBtJ63wEO_XDrPEL-QZvh_DjM764e28','2022-04-23 19:54:51.896903'),
('qkv41rarqwxnz48cfuhijad4lo9toh9e','e30:1nYFR3:TVyPOukbHvfXrBxyZvxDXVTy7SmDawAKUP0UOrWugNo','2022-04-09 23:03:05.886713'),
('z1tldngd3kk13a6r3euc8vp2dpyp0woe','.eJydzbEKwkAQhOFXGbe-QgQbO59Bu1w4juyoSBLF3StC8N29xpQiaX_4ZmZJA83ylSYHaZooKd3tMX5rlIBtwG4fEOXMPICjvyaUp2anRmkDfqNT6bqaL6WfoOxZFfxG-DL2x8iq5_XIaY6jKnVTSSvvDzg3YAE:1nW2Bn:nHQV4b9D6NKiqWxqIiMmomD1eSlCNuOvwtNlk5djh88','2022-04-03 20:30:11.805782'),
('zf1akbiy2cdpvq8hpyr3myu3ques1pfx','.eJyrVorPTS0uTkxPLVayUoqOjlGKj88qzs-DicYo6SgY6CgYmeooxCgFlyYnA4XTSnMqFVJSc1JLUlMUSjJSFUpSE3MVUvNKiipjlGJ1FKhgSKxSLQDHaDRY:1nWYxN:Yb_TXwbsrEVFXVRPIDWZdkhTunb-RzSVUigy4s7vnCE','2022-04-05 07:29:29.454119');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedia_app_feedback`
--

DROP TABLE IF EXISTS `pedia_app_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedia_app_feedback` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf32_bin DEFAULT NULL,
  `email` longtext COLLATE utf32_bin DEFAULT NULL,
  `msg` longtext COLLATE utf32_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf32 COLLATE=utf32_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedia_app_feedback`
--

LOCK TABLES `pedia_app_feedback` WRITE;
/*!40000 ALTER TABLE `pedia_app_feedback` DISABLE KEYS */;
INSERT INTO `pedia_app_feedback` VALUES
(1,'Not Bob Smith','notbobsmith@mail.com','Not Valuable Feedback'),
(2,'Actual Bob Smith','actsmith@gmail.com','Very Valuable Feedback');
/*!40000 ALTER TABLE `pedia_app_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedia_app_matches`
--

DROP TABLE IF EXISTS `pedia_app_matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedia_app_matches` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `score1` int(11) NOT NULL,
  `score2` int(11) NOT NULL,
  `time` datetime(6) NOT NULL,
  `team1_id` bigint(20) NOT NULL,
  `team2_id` bigint(20) NOT NULL,
  `tourney_id` bigint(20) NOT NULL,
  `winner` varchar(2) COLLATE utf32_bin NOT NULL,
  `is_finished` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pedia_app_matches_team1_id_269e348c_fk_pedia_app_teams_id` (`team1_id`),
  KEY `pedia_app_matches_team2_id_e5adc162_fk_pedia_app_teams_id` (`team2_id`),
  KEY `pedia_app_matches_tourney_id_73be92d4_fk_pedia_app_tournies_id` (`tourney_id`),
  CONSTRAINT `pedia_app_matches_team1_id_269e348c_fk_pedia_app_teams_id` FOREIGN KEY (`team1_id`) REFERENCES `pedia_app_teams` (`id`),
  CONSTRAINT `pedia_app_matches_team2_id_e5adc162_fk_pedia_app_teams_id` FOREIGN KEY (`team2_id`) REFERENCES `pedia_app_teams` (`id`),
  CONSTRAINT `pedia_app_matches_tourney_id_73be92d4_fk_pedia_app_tournies_id` FOREIGN KEY (`tourney_id`) REFERENCES `pedia_app_tournies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf32 COLLATE=utf32_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedia_app_matches`
--

LOCK TABLES `pedia_app_matches` WRITE;
/*!40000 ALTER TABLE `pedia_app_matches` DISABLE KEYS */;
INSERT INTO `pedia_app_matches` VALUES
(20,2,1,'2021-12-31 18:00:00.000000',31,27,14,'T1',1),
(21,1,2,'2022-01-01 18:00:00.000000',15,31,14,'T2',1),
(22,1,1,'2022-03-01 12:00:00.000000',31,25,14,'DW',1),
(23,2,0,'2022-03-08 18:00:00.000000',5,8,9,'T1',1),
(24,1,1,'2022-03-09 06:00:00.000000',13,5,9,'DW',1),
(25,1,2,'2022-03-11 18:00:00.000000',14,5,9,'T2',1),
(26,0,0,'2022-04-14 17:35:00.000000',4,31,11,'ON',0),
(27,0,0,'2022-04-14 06:00:00.000000',25,29,11,'ON',0),
(28,0,0,'2022-04-18 06:00:00.000000',29,15,11,'ON',0);
/*!40000 ALTER TABLE `pedia_app_matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedia_app_news`
--

DROP TABLE IF EXISTS `pedia_app_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedia_app_news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` longtext COLLATE utf32_bin DEFAULT NULL,
  `banner` varchar(100) COLLATE utf32_bin DEFAULT NULL,
  `body` longtext COLLATE utf32_bin DEFAULT NULL,
  `time` datetime(6) NOT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pedia_app_news_author_id_2215f937_fk_auth_user_id` (`author_id`),
  CONSTRAINT `pedia_app_news_author_id_2215f937_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf32 COLLATE=utf32_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedia_app_news`
--

LOCK TABLES `pedia_app_news` WRITE;
/*!40000 ALTER TABLE `pedia_app_news` DISABLE KEYS */;
INSERT INTO `pedia_app_news` VALUES
(7,'WolfY takes break from CS:GO; benched in ECSTATIC','news/uploads/wolfy_takes_break.webp','ECSTATIC have announced a change in their roster as their 23-year-old sniper Adam \"⁠WolfY⁠\" Andersson decided to take \"a small break from competitive CS:GO\". The organization is looking for a replacement for the American AWPer.','2022-04-11 16:23:47.515125',2),
(9,'PGL Major Antwerp Americas RMR Fantasy game is now open','news/uploads/pglmajor_dhuRHa3.jpg','The first of the Regional Major Ranking events of 2022 will decide which teams from North and South America will earn their right to attend the most prestigious event on the CS:GO calendar. Alongside the tournament, our Fantasy game will also be online, giving users the chance to test their Counter-Strike knowledge and compete for the top places on the leaderboard. ','2022-04-11 16:30:17.200828',2),
(10,'Brazilian teams prevail in opening matches at Americas RMR','news/uploads/brazil_6CYUvfT.jpg',' FURIA, Isurus, Case, and Imperial earned their first wins in their quest to qualify for the PGL Major. Brazilian Counter-Strike fans will be happy to wake up to four of their nine teams in attendance already earning their first victories in Romania after four matches, including one of the heavy favorites in FURIA and the \'Last Dance\' project under Imperial, who took down South American opposition in Leviatan and Sao Caetano, respectively. ','2022-04-11 16:30:33.622604',2),
(11,'ENCE knock out NIP en route to ESL Pro League grand final','news/uploads/enceknockout_N0y9pCb.jpg','ENCE became the first grand finalists of ESL Pro League Season 15, eliminating NIP with a 2-0 victory in the semi-finals (Nuke 16-10, Ancient 16-14). Marco \"⁠Snappi⁠\" Pfeiffer\'s team is set to face the winner of FURIA vs. FaZe in the best-of-five title decider on Sunday at 21:00. ','2022-04-11 16:31:10.034182',2),
(12,'FaZe win ESL Pro League Season 15','news/uploads/fazewinesl_9C32b6T.jpg','GGs! ENCE held out for a while thanks to a 1v2 clutch from Marco \"⁠Snappi⁠\" Pfeiffer, but FaZe quickly returned to winning ways with aggressive play towards middle and lower dark, taking charge of the pace and closing out the map before it got too close. ','2022-04-11 16:31:34.644494',2),
(13,'ropz: \"I can\'t wait to play more tournaments and keep the wins coming\"','news/uploads/ropzcantplay_xCHGP3z.jpg','After picking up the HLTV x BitSkins MVP, Robin \"⁠ropz⁠\" Kool took a moment to give some insight on the ESL Pro League win. FaZe continued a blistering start to the year here in Düsseldorf by making it back-to-back big event wins, this time conquering ESL Pro League Season 15. After topping the scoreboards to carry his team to victory in the final, ropz took a quick break from celebrations to chat to HLTV about the grand final win over ENCE. ','2022-04-11 16:32:00.860375',2);
/*!40000 ALTER TABLE `pedia_app_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedia_app_players`
--

DROP TABLE IF EXISTS `pedia_app_players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedia_app_players` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf32_bin NOT NULL,
  `country` varchar(100) COLLATE utf32_bin NOT NULL,
  `age` int(11) NOT NULL,
  `ign` varchar(100) COLLATE utf32_bin NOT NULL,
  `photo` varchar(100) COLLATE utf32_bin DEFAULT NULL,
  `team_id` bigint(20) DEFAULT NULL,
  `rank` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pedia_app_players_team_id_126956ba_fk_pedia_app_teams_id` (`team_id`),
  CONSTRAINT `pedia_app_players_team_id_126956ba_fk_pedia_app_teams_id` FOREIGN KEY (`team_id`) REFERENCES `pedia_app_teams` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf32 COLLATE=utf32_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedia_app_players`
--

LOCK TABLES `pedia_app_players` WRITE;
/*!40000 ALTER TABLE `pedia_app_players` DISABLE KEYS */;
INSERT INTO `pedia_app_players` VALUES
(2,'Aleksandr Kostyliev','Ukraine ',23,'s1mple','players/uploads/simple.webp',8,1),
(3,'Mathieu Herbaut','France ',20,'ZywOo ','players/uploads/ar42RpUCdD68IaCxZGD1eP.webp',12,2),
(4,'Dmitry Sokolov','Russia ',18,'sh1ro ','players/uploads/BdarGeGFrVkqTeGANja0Gk.webp',2,3),
(5,'Nikola Kovač','Bosnia and Herzegovina ',29,'NiKo ','players/uploads/JDxiCoK-7_ZeBNCLNiSvFX.webp',3,4),
(6,'Sergey Rykhtorov','Russia ',24,'Ax1Le ','players/uploads/nfk2J6cJ_0Fq1tjerx_u_4.webp',2,5),
(7,'Abay Khasenov','Kazakhstan',26,'HObbit ','players/uploads/A14UdvKmEs_ixvzricq4NR.webp',2,6),
(8,'Denis Sharipov','Russia',34,'electroNic','players/uploads/BugxKUSuXiyJVpK4P27Ys1.webp',8,7),
(9,'Robin Kool','Estonia',22,' ropz','players/uploads/u4pC59vUFrq9R3FUJNn_CE.webp',5,8),
(10,'Nicolai Reedtz','Denmark',25,'device','players/uploads/e-VpY--MZr_3XFDmj8DBd6.webp',11,9),
(11,'Russel Van Dulken','Canada',23,'Twistzz','players/uploads/bqU4MKp5dg2NKjboZXmWI4.webp',5,10),
(12,'Benjamin Bremer','Denmark',26,'blameF','players/uploads/ZQMIcaRX2cC3h97k1-LZyR.webp',13,11);
/*!40000 ALTER TABLE `pedia_app_players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedia_app_teams`
--

DROP TABLE IF EXISTS `pedia_app_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedia_app_teams` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf32_bin NOT NULL,
  `region` varchar(50) COLLATE utf32_bin NOT NULL,
  `logo` varchar(100) COLLATE utf32_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf32 COLLATE=utf32_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedia_app_teams`
--

LOCK TABLES `pedia_app_teams` WRITE;
/*!40000 ALTER TABLE `pedia_app_teams` DISABLE KEYS */;
INSERT INTO `pedia_app_teams` VALUES
(2,3,'Gambit','Europe','teams/uploads/pNV-lVdpvYZIkDwHdEXXg-_wMu5DzR.svg'),
(3,4,'G2 Esports','Europe','teams/uploads/zFLwAELOD15BjJSDMMNBWQ_JohPEix.webp'),
(4,3,'Furia Esports','America','teams/uploads/mvNQc4csFGtxXk5guAh8m1.svg'),
(5,2,'Faze Clan','International','teams/uploads/SMhzsxzbkIrgqCOOKGRXlW_l5MRD6D.svg'),
(8,1,'Natus Vincere','Europe','teams/uploads/9iMirAi7ArBLNU8p3kqUTZ_HcbJbib.svg'),
(9,5,'Heroic','Europe','teams/uploads/ffSPDr5mbWSKI4yruyfVtx_2iod4I4.svg'),
(10,6,'Virtus.pro','Europe','teams/uploads/yZ6Bpuui1rW3jocXQ68XgZ.svg'),
(11,7,'Ninjas in Pyjamas','Europe','teams/uploads/mbY2YeFKUAbL9NyO6ab7-c.webp'),
(12,8,'Vitality','Europe','teams/uploads/GAlByJtDTnkgbb9p_71SUL.webp'),
(13,9,'Astralis','Europe','teams/uploads/9bgXHp-oh1oaXr7F0mTGmd.svg'),
(14,10,'ENCE','Europe','teams/uploads/-X8NoyWC_1gYqUHvZqcpkc.svg'),
(15,11,'FURIA','America','teams/uploads/mvNQc4csFGtxXk5guAh8m1_mlhHlSU.svg'),
(16,12,'Copenhagen Flames','Europe','teams/uploads/o9gWbZqKaYgDJL5ttGKuqQ.webp'),
(17,13,'Entropiq','America','teams/uploads/_x9xMubeeb-fqq_21BJ6Fd.webp'),
(18,14,'OG','International','teams/uploads/7b6DouMNGWcqENDx1vw_Ot.webp'),
(19,15,'MOUZ','Europe','teams/uploads/RfR1zmFJ0eP08VmFb6UOu3.webp'),
(20,16,'Fnatic','Europe','teams/uploads/dLtWEdSV58lIX1amAFggy0.svg'),
(21,17,'SKADE','Europe','teams/uploads/YFPiz1uP4VOVNeqWOiFaOk.svg'),
(22,18,'Movistar Riders','Europe','teams/uploads/Y37ZjhQhf-74eg44YCXe_m.webp'),
(23,19,'BIG','Europe','teams/uploads/yQB6cm3KZ_BcyrgppBQMjc.svg'),
(24,20,'HEET','Ocenia','teams/uploads/x5v1XBdI9Q8Qg9TA8Rj2n-.webp'),
(25,21,'Team Liquid','America','teams/uploads/JMeLLbWKCIEJrmfPaqOz4O.svg'),
(26,22,'K23','Asia','teams/uploads/e-KLQKZ-WCaZQPpqkwYEAg.webp'),
(27,23,'forZe','Africa','teams/uploads/Qnpb1nBNLJUCyf4fRMFbzr.svg'),
(28,24,'ECSTATIC','International','teams/uploads/-Wa4og1Vm7ZxJesd3xbnUu.webp'),
(29,25,'Complexity','Europe','teams/uploads/0-i_bEjrf3v4eYqaG0Bix7.svg'),
(30,26,'GODSENT','America','teams/uploads/WQl1L0NmsdhupV8S-fzQvA.svg'),
(31,27,'MIBR','America','teams/uploads/m_JQ624LNFHWiUY-25uuaE.webp');
/*!40000 ALTER TABLE `pedia_app_teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedia_app_tournies`
--

DROP TABLE IF EXISTS `pedia_app_tournies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedia_app_tournies` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tier` varchar(1) COLLATE utf32_bin NOT NULL,
  `name` varchar(100) COLLATE utf32_bin NOT NULL,
  `region` varchar(50) COLLATE utf32_bin NOT NULL,
  `logo` varchar(100) COLLATE utf32_bin DEFAULT NULL,
  `date_start` datetime(6) NOT NULL,
  `date_end` datetime(6) NOT NULL,
  `is_finished` tinyint(1) NOT NULL,
  `winner_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pedia_app_tournies_winner_id_723044f8` (`winner_id`),
  CONSTRAINT `pedia_app_tournies_winner_id_723044f8_fk_pedia_app_teams_id` FOREIGN KEY (`winner_id`) REFERENCES `pedia_app_teams` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf32 COLLATE=utf32_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedia_app_tournies`
--

LOCK TABLES `pedia_app_tournies` WRITE;
/*!40000 ALTER TABLE `pedia_app_tournies` DISABLE KEYS */;
INSERT INTO `pedia_app_tournies` VALUES
(9,'S','ESL Pro League Season 15','International','tournies/uploads/50px-ESL_Pro_League_2019_new_icon.png','2022-03-09 00:00:00.000000','2022-06-10 00:00:00.000000',1,5),
(10,'S','Intel Extreme Masters XVI - Katowice','International','tournies/uploads/50px-Intel_Extreme_Masters_2022_icon_allmode.png','2022-02-15 00:00:00.000000','2022-04-27 00:00:00.000000',1,11),
(11,'A','PGL Major Antwerp 2022: American RMR','America','tournies/uploads/40px-PGL_Antwerp_2022_Americas_RMR_icon_allmode.png','2022-04-11 00:00:00.000000','2022-11-18 00:00:00.000000',0,NULL),
(12,'S','BLAST Premier: Spring Groups 2022','Europe','tournies/uploads/42px-BLAST_Premier_icon_allmode.png','2022-01-28 00:00:00.000000','2022-02-06 00:00:00.000000',1,12),
(13,'S','PGL Major Stockholm 2021','International','tournies/uploads/600px-PGL_Major_Stockholm_2021_allmode.png','2021-10-26 00:00:00.000000','2021-11-07 00:00:00.000000',1,8),
(14,'B','ESL Challenger League Season 40: North America','America','tournies/uploads/50px-ESL_Challenger_League_icon_lightmode.png','2022-01-19 00:00:00.000000','2022-04-03 00:00:00.000000',1,31),
(15,'B','ESL Challenger League Season 40: Europe','Europe','tournies/uploads/50px-ESL_Challenger_League_icon_lightmode_Ouwn4kj.png','2022-01-25 00:00:00.000000','2022-04-03 00:00:00.000000',1,27),
(16,'B','ESL Challenger League Season 40: Asia-Pacific','Asia','tournies/uploads/50px-ESL_Challenger_League_icon_lightmode_3OWjy2x.png','2022-02-08 00:00:00.000000','2022-04-03 00:00:00.000000',1,21),
(17,'A','Pinnacle Cup III','Europe','tournies/uploads/600px-Pinnacle_Cup_III_lightmode.png','2022-03-14 00:00:00.000000','2022-03-29 00:00:00.000000',1,21);
/*!40000 ALTER TABLE `pedia_app_tournies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-12  1:05:49
