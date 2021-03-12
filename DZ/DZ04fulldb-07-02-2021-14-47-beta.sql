-- MariaDB dump 10.17  Distrib 10.4.15-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_21
-- ------------------------------------------------------
-- Server version	10.4.15-MariaDB-cll-lve

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
-- Table structure for table `communities`
--

USE vk;


DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `communities_name_idx` (`name`),
  KEY `admin_user_id` (`admin_user_id`),
  CONSTRAINT `communities_ibfk_1` FOREIGN KEY (`admin_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (1,'eius',1),(2,'deserunt',2),(3,'provident',3),(4,'veritatis',4),(5,'laborum',5),(6,'excepturi',6),(7,'assumenda',7),(8,'placeat',8),(9,'ut',9),(10,'et',10),(11,'voluptas',11),(12,'fugiat',12),(13,'dolorum',13),(14,'quia',14),(15,'architecto',15),(16,'corrupti',16),(17,'eos',17),(18,'in',18),(19,'tempora',19),(20,'saepe',20),(21,'architecto',21),(22,'vitae',22),(23,'aut',23),(24,'dolorem',24),(25,'laborum',25),(26,'ratione',26),(27,'aperiam',27),(28,'perferendis',28),(29,'animi',29),(30,'quas',30),(31,'distinctio',31),(32,'iste',32),(33,'alias',33),(34,'labore',34),(35,'optio',35),(36,'consequatur',36),(37,'dolore',37),(38,'veniam',38),(39,'molestiae',39),(40,'suscipit',40),(41,'odio',41),(42,'placeat',42),(43,'et',43),(44,'labore',44),(45,'aut',45),(46,'alias',46),(47,'debitis',47),(48,'labore',48),(49,'tempore',49),(50,'et',50);
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community_articles`
--

DROP TABLE IF EXISTS `community_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `community_articles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `community_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `community_id` (`community_id`),
  KEY `user_id` (`user_id`),
  KEY `article_name_idx` (`name`),
  CONSTRAINT `community_articles_ibfk_1` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `community_articles_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community_articles`
--

LOCK TABLES `community_articles` WRITE;
/*!40000 ALTER TABLE `community_articles` DISABLE KEYS */;
INSERT INTO `community_articles` VALUES (1,'tempore','1976-12-28 21:17:31',1,1,'Est magni quos autem sunt expedita unde nulla. Inventore quaerat ex ut aut. Quidem eveniet quia saepe rerum delectus veritatis recusandae. Impedit dolorem quaerat porro at quam.'),(2,'animi','1994-08-25 03:36:29',2,2,'Possimus laudantium et consequuntur omnis sed ab aut. Aut magni sed animi fugit et. Voluptatem eos dicta eos accusantium reprehenderit quod. Autem eius eos ut quia culpa enim.'),(3,'soluta','2009-11-13 22:16:16',3,3,'Expedita reprehenderit nisi ea corporis vel repellendus. Minima sequi voluptas in numquam doloremque. Quaerat temporibus voluptatem provident totam voluptates quo.'),(4,'tenetur','1975-08-18 05:25:21',4,4,'Cupiditate modi voluptas ducimus quaerat. Placeat maxime magnam eius eligendi aliquam quia repudiandae voluptatibus. Quos consequuntur nihil dolor itaque vitae.'),(5,'est','2001-04-04 17:33:07',5,5,'Dolores tempora numquam atque ullam quia dolorum sit. Est qui iure ipsa ipsam dolor necessitatibus in nam. Est qui accusantium et et.'),(6,'explicabo','1994-12-14 19:18:45',6,6,'Consectetur laboriosam tenetur voluptatem. Quasi consequatur labore atque animi quod et. Reprehenderit et id dolorum corrupti facilis et odit deleniti.'),(7,'aut','1988-05-29 01:58:22',7,7,'Amet occaecati hic dicta. Ullam minus adipisci fuga sunt quibusdam eos maiores harum. Debitis sint ut temporibus quasi illo incidunt repellendus. Cupiditate eveniet deleniti doloribus eligendi eos rerum quasi.'),(8,'sed','1973-12-09 10:14:30',8,8,'Vero impedit ab voluptatum similique. Eum officia eum ut sit. A architecto dolore autem molestiae quibusdam. Quae odit natus dolores et. Aut dicta dolores molestiae ut ut ut.'),(9,'autem','1997-05-06 18:45:43',9,9,'Unde corrupti possimus eos. Non rerum rerum similique sed dolore modi minus. Voluptates non omnis iure aut maxime. Magni dolor vel cum aut quaerat impedit. Cupiditate voluptatem sed eum suscipit.'),(10,'est','2014-04-13 00:18:33',10,10,'Dolores quibusdam rem occaecati eum dolores ut et. Et dolorem autem ut corrupti enim. Laborum dolore consectetur voluptas aut odit. Modi quod natus sed repudiandae nisi eveniet cumque.'),(11,'dolor','1973-05-29 19:46:13',11,11,'Quod qui voluptate quo illo. Animi nisi animi hic qui omnis ex. Perspiciatis assumenda dicta dolorum cumque reiciendis incidunt fugit esse. Explicabo illum amet ratione nulla.'),(12,'rerum','1989-08-13 04:04:07',12,12,'Est sed qui qui similique. Iure illo ut possimus. Dolorem totam ut eveniet repellat nihil facilis ad alias. Commodi saepe provident recusandae laboriosam quasi eum facere est.'),(13,'atque','1990-11-22 20:06:35',13,13,'Nihil asperiores debitis doloribus et officiis est vero. Dolore nemo voluptatem tempora numquam recusandae non eligendi. Impedit quis ut in quia omnis qui repellat.'),(14,'quos','1995-04-20 10:10:56',14,14,'Sapiente enim quibusdam impedit quam optio quas. Explicabo perspiciatis possimus molestiae iusto eum assumenda saepe consequuntur. Voluptas voluptas laborum adipisci.'),(15,'vel','1987-12-04 23:13:07',15,15,'Recusandae quis esse sint dignissimos assumenda. Aut quo totam perferendis perferendis. Fuga animi doloremque voluptatem quia perferendis ab debitis.'),(16,'tenetur','2008-02-20 21:25:57',16,16,'Et architecto omnis fuga. Quasi ex qui facilis quod. Aut aut quaerat quas sequi et voluptates natus. Officiis et architecto sed qui eum optio.'),(17,'repudiandae','2014-03-14 11:03:08',17,17,'Nihil fugit iure et. Reiciendis incidunt optio tempora omnis corporis non. Doloremque enim repudiandae aliquid explicabo eos doloribus sunt.'),(18,'quis','1994-10-14 11:11:21',18,18,'Nulla quod ut qui ducimus. Qui quia incidunt cum iste. Error doloribus culpa beatae officiis.'),(19,'quo','2018-06-27 06:31:34',19,19,'Doloribus voluptas quo et et molestiae error ratione. Ipsam non voluptatibus voluptatem sint accusantium. Consequuntur sit ut a qui. Ut iste itaque ex sed.'),(20,'rerum','1985-01-30 07:46:17',20,20,'Ex recusandae qui voluptatem nemo est et. Voluptatibus sit voluptatem deserunt consectetur sunt officia. Et perspiciatis cupiditate et aliquid. Dolores in omnis non doloribus suscipit.'),(21,'veritatis','1971-11-28 03:43:33',21,21,'Blanditiis commodi nulla cum iusto quia aut hic. Sed ipsum autem rerum tenetur hic. At perferendis dolores sint ab qui aut. Magnam inventore rerum ducimus et.'),(22,'eligendi','1974-11-08 23:14:04',22,22,'Harum ea qui et natus nemo amet harum. Dolor est aperiam est dolores fuga rerum. Omnis odit quidem et quod.'),(23,'unde','1981-02-13 03:14:46',23,23,'Ut sequi ratione quo. Nihil officia dicta repellendus quia debitis et. Magnam molestiae temporibus velit est excepturi ex. Culpa aut quibusdam omnis nihil enim porro voluptatibus.'),(24,'ut','2011-05-01 11:41:06',24,24,'Alias autem eos saepe est molestias labore. Voluptatem vitae odio qui et est vel corrupti. Ut facilis eligendi voluptates qui excepturi atque. Est id et rerum inventore.'),(25,'omnis','1995-06-09 21:52:18',25,25,'Incidunt reiciendis suscipit non incidunt cum facilis. Ea officiis neque dolorem eum eum natus consequuntur atque. Expedita aliquam numquam autem quis quam sequi.'),(26,'est','1984-01-23 22:29:20',26,26,'Quae cupiditate et nihil laudantium molestias eum vel neque. Voluptate autem voluptas et minus ut ut. Enim impedit dolores non. Qui nam eum aut voluptate voluptatem sequi ducimus.'),(27,'voluptatem','1986-12-21 11:33:54',27,27,'Asperiores ea iusto ut voluptas modi id. Error tempora est autem dolores. Facilis quae odit iste est magnam quasi.'),(28,'unde','2017-04-26 12:21:11',28,28,'In quibusdam adipisci est suscipit. Fuga doloremque aperiam fuga commodi. Repudiandae ad ullam et qui nam est.'),(29,'corporis','1980-01-24 02:32:18',29,29,'Sed deserunt blanditiis eligendi deleniti voluptate. Sit expedita veritatis pariatur dolor. Soluta vel numquam ut autem voluptatibus.'),(30,'qui','2000-04-14 11:07:29',30,30,'Nihil incidunt id placeat id ratione. Repellendus alias aperiam sint enim natus. Consequatur qui incidunt rerum odit.'),(31,'dolores','1996-04-11 22:17:34',31,31,'Laboriosam et voluptas qui cumque nam temporibus. Iure molestias autem aut magni eos a at. Architecto et et distinctio minus veritatis. Veniam quis dolor in.'),(32,'voluptate','1982-04-25 22:29:19',32,32,'Tempore sint asperiores quo fugiat aut nam ea. Nihil et aut dolorem et consequatur voluptas dolore. Nemo sint amet expedita quas neque ex fuga.'),(33,'dolor','1981-04-01 11:15:51',33,33,'Iusto adipisci necessitatibus porro error. Fugiat ut tenetur qui qui dolorem. Unde aspernatur et et nesciunt illum. Ut error voluptate nulla in voluptas. Aspernatur laborum alias maxime exercitationem.'),(34,'debitis','2004-12-26 13:21:54',34,34,'Neque possimus voluptatem quasi quos et debitis. Cupiditate ipsum aut id debitis omnis quam sint. Ut nihil excepturi architecto nihil.'),(35,'qui','1988-04-09 00:32:11',35,35,'Ab omnis voluptatem magnam molestias voluptates nisi similique. Libero est illo at rerum qui ut. Placeat iusto totam similique optio id rerum quibusdam.'),(36,'odio','1992-09-18 09:31:09',36,36,'Corrupti et sunt voluptatem quia delectus corrupti et. Est et maxime incidunt maxime qui tenetur expedita. Et adipisci temporibus et fuga ea qui doloribus. Consequatur voluptas sapiente porro sint quo aut.'),(37,'perspiciatis','1981-08-08 03:13:22',37,37,'Reprehenderit dolorem ut quibusdam ea excepturi vel. Voluptatem et aut suscipit ut. Labore aut ut perferendis omnis eos autem.'),(38,'quis','1991-02-26 18:01:16',38,38,'Voluptatem voluptate nostrum cumque eveniet ipsam et culpa. Veritatis ratione vel temporibus facilis officiis.'),(39,'sed','1983-05-12 13:48:38',39,39,'Et et velit enim quaerat natus. Totam quaerat omnis nobis omnis. Sed et non beatae qui nihil eligendi nostrum. Temporibus sequi et exercitationem exercitationem.'),(40,'aperiam','2019-01-06 20:14:33',40,40,'Ullam veniam sed labore ullam id. Rerum assumenda nihil illo ducimus minima esse provident. Maiores dolor mollitia saepe at quod.'),(41,'dolor','2018-03-02 09:16:43',41,41,'Amet quam molestiae et ipsam laudantium dicta deleniti. Aut aut id esse. Corrupti necessitatibus sunt quia et sint deleniti. Minus ut vel et iure.'),(42,'excepturi','1970-01-15 21:30:10',42,42,'Similique facilis blanditiis earum vel. Iste voluptatem doloremque qui eum. Et impedit id quo ratione qui consectetur omnis. In quia excepturi enim et ut.'),(43,'et','2016-02-24 02:40:33',43,43,'Soluta id quas porro quod laboriosam velit. Iste rem minus enim debitis. Est mollitia ipsum aliquam est excepturi.'),(44,'odio','2005-05-14 21:47:58',44,44,'Sunt vel dolorem sapiente voluptate eaque ut. Qui fuga sunt voluptatum modi quo impedit a. Maiores assumenda consequatur aut voluptatem quia.'),(45,'ad','1973-03-04 05:26:55',45,45,'Ab tempore rerum in numquam nobis. Voluptatibus id consectetur saepe. At aperiam perspiciatis aut error. Dolores aut fuga eos ut consequatur consequatur.'),(46,'et','1990-02-10 02:32:05',46,46,'Sit corrupti excepturi labore. Dolore doloribus sed ea ducimus qui. Ducimus ipsam voluptatum est ipsa consequuntur. Quos laudantium vel nihil dolorum deserunt.'),(47,'voluptates','2004-11-24 09:00:01',47,47,'Necessitatibus dicta id ex qui qui. Aut placeat vitae quo sit non qui eos quia. Deleniti atque dolorum et magni nam.'),(48,'voluptas','1992-06-13 18:30:46',48,48,'Dignissimos consequatur quidem possimus omnis tenetur qui laboriosam. Quidem ut alias excepturi facilis. Quia aut ea quod delectus similique iusto. Repellat voluptas voluptas rerum quia aspernatur nam.'),(49,'consectetur','2000-10-18 23:20:20',49,49,'Est et doloremque maxime et asperiores. Dolorem numquam quasi quas laborum voluptas.'),(50,'tenetur','1993-09-16 17:12:02',50,50,'Culpa adipisci est minus est. Aspernatur et tempora sunt debitis. Ex mollitia aliquid quia fugit modi nostrum impedit asperiores.');
/*!40000 ALTER TABLE `community_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussing_topic`
--

DROP TABLE IF EXISTS `discussing_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussing_topic` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  `moderator_id` bigint(20) unsigned DEFAULT NULL,
  `number_of_messages` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `discussing_topic_idx` (`name`),
  KEY `moderator_id` (`moderator_id`),
  CONSTRAINT `discussing_topic_ibfk_1` FOREIGN KEY (`moderator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussing_topic`
--

LOCK TABLES `discussing_topic` WRITE;
/*!40000 ALTER TABLE `discussing_topic` DISABLE KEYS */;
INSERT INTO `discussing_topic` VALUES (1,'odio','1984-04-11 06:16:55','2009-08-11 10:54:48',1,80),(2,'esse','2014-10-08 19:56:49','1984-11-26 11:19:56',2,1507),(3,'vitae','1983-06-27 20:38:28','2001-09-01 14:39:16',3,0),(4,'neque','1983-03-17 12:01:16','2007-11-07 10:16:39',4,294647663),(5,'suscipit','1974-04-28 19:15:59','1987-12-30 00:02:54',5,60),(6,'molestiae','2000-10-19 23:35:56','1981-02-24 01:57:29',6,11709),(7,'quae','1992-04-10 19:39:54','2012-03-05 13:15:19',7,70),(8,'dolor','1980-09-16 13:36:59','2003-02-18 09:12:20',8,0),(9,'debitis','1976-01-30 06:40:06','1981-05-02 19:01:36',9,0),(10,'dolor','2008-08-12 22:49:07','2018-09-19 10:20:55',10,686188735),(11,'ut','1974-10-07 23:04:56','2005-05-05 06:59:30',11,12),(12,'est','1979-04-12 12:32:59','1977-08-05 08:52:05',12,0),(13,'omnis','1981-02-17 09:04:33','1989-04-13 06:01:23',13,39582),(14,'facere','1984-07-18 23:08:37','1978-05-02 07:05:09',14,751392404),(15,'suscipit','1975-01-12 19:32:44','2020-03-03 18:54:50',15,73),(16,'magnam','2004-06-16 09:35:46','2003-06-13 08:24:52',16,426),(17,'accusantium','1982-06-11 23:43:56','1979-07-28 05:51:38',17,8),(18,'consequatur','1994-09-13 03:11:57','2005-04-28 01:16:27',18,56639979),(19,'ipsum','2002-07-02 04:51:12','1996-11-13 07:47:17',19,23619894),(20,'architecto','2010-07-28 09:22:18','2005-05-17 10:56:35',20,321416),(21,'sunt','2012-02-08 23:31:32','1976-09-27 19:06:15',21,4696),(22,'vel','2002-11-19 20:26:59','1992-10-05 02:39:30',22,9598),(23,'qui','2019-11-04 09:42:07','1972-06-03 19:56:56',23,9684),(24,'facere','1985-12-03 13:46:16','1970-07-09 10:32:13',24,22),(25,'consequatur','2003-01-24 06:12:39','2000-04-23 23:24:22',25,70357318),(26,'earum','1979-11-08 23:26:05','2020-05-11 12:50:06',26,88),(27,'et','1988-04-21 10:11:25','1981-12-06 21:00:48',27,57),(28,'molestias','1987-03-03 04:19:02','1995-10-05 11:09:24',28,100),(29,'est','2013-03-25 11:34:36','1988-02-27 11:11:51',29,918823),(30,'beatae','1974-06-28 05:14:01','1975-09-10 02:11:48',30,3),(31,'pariatur','1971-02-23 21:14:41','2018-09-06 12:12:26',31,415),(32,'maxime','1996-09-13 17:13:13','1990-02-11 10:11:12',32,681),(33,'deserunt','2007-05-05 00:26:46','2017-09-24 10:36:06',33,8291358),(34,'dolor','2007-04-22 06:19:58','1997-12-04 23:30:05',34,3551),(35,'atque','1990-07-17 20:11:12','1975-03-15 04:21:52',35,10221665),(36,'illo','2014-01-21 12:00:30','1990-07-26 20:03:18',36,0),(37,'veritatis','2009-08-17 03:36:09','1973-09-14 03:46:22',37,15727193),(38,'magnam','2006-09-07 03:29:08','1987-02-06 22:41:01',38,64),(39,'est','1980-01-18 08:27:58','1998-08-23 11:11:09',39,694347749),(40,'sapiente','2013-07-05 12:16:45','2012-09-06 02:41:06',40,63193),(41,'aperiam','1982-01-03 03:12:13','1983-04-26 15:43:30',41,754276),(42,'non','2008-03-29 13:05:51','1995-02-21 16:15:46',42,557),(43,'eum','1988-04-16 01:08:14','1972-03-31 04:19:58',43,0),(44,'illo','1985-11-09 21:56:54','2005-08-11 04:32:04',44,835),(45,'dolorem','1992-03-12 02:47:28','1980-09-11 11:59:00',45,0),(46,'dolores','2006-02-02 12:00:00','1999-01-02 22:51:52',46,547),(47,'est','2016-10-24 07:07:07','1975-02-28 16:25:36',47,6803037),(48,'quod','1982-08-26 03:42:35','1996-09-13 10:25:59',48,133895),(49,'voluptatem','1976-05-30 18:41:23','1998-02-07 04:05:48',49,106686),(50,'rem','1991-11-16 07:29:19','2019-11-13 08:28:17',50,14935527);
/*!40000 ALTER TABLE `discussing_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friend_requests` (
  `initiator_user_id` bigint(20) unsigned NOT NULL,
  `target_user_id` bigint(20) unsigned NOT NULL,
  `status` enum('requested','approved','declined','unfriended') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requested_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`initiator_user_id`,`target_user_id`),
  KEY `target_user_id` (`target_user_id`),
  CONSTRAINT `friend_requests_ibfk_1` FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `friend_requests_ibfk_2` FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_requests`
--

LOCK TABLES `friend_requests` WRITE;
/*!40000 ALTER TABLE `friend_requests` DISABLE KEYS */;
INSERT INTO `friend_requests` VALUES (1,1,'declined','1994-07-25 11:37:40','1984-06-22 06:13:10'),(2,2,'unfriended','1988-12-09 13:39:23','1976-03-24 04:18:44'),(3,3,'approved','1982-06-08 20:55:10','1970-05-30 01:51:21'),(4,4,'requested','1979-03-18 13:26:29','1992-03-08 00:53:37'),(5,5,'declined','2006-10-08 20:11:39','2016-03-05 10:20:25'),(6,6,'approved','1995-12-02 23:42:08','2002-11-20 05:13:17'),(7,7,'requested','2011-08-21 21:50:39','1994-02-05 18:33:48'),(8,8,'requested','1986-12-12 02:23:08','1990-01-28 04:40:44'),(9,9,'unfriended','1988-12-15 03:06:50','2006-12-03 19:31:57'),(10,10,'unfriended','2016-11-07 03:59:52','1983-04-21 16:55:13'),(11,11,'declined','1990-04-03 03:52:20','2014-12-28 03:00:01'),(12,12,'requested','1991-01-05 03:10:48','1978-02-03 10:16:47'),(13,13,'requested','1971-02-03 15:31:42','1994-06-13 05:54:26'),(14,14,'unfriended','2018-09-01 06:54:10','2016-01-31 05:45:55'),(15,15,'declined','1999-04-18 11:11:40','1998-07-01 10:13:57'),(16,16,'approved','1983-07-30 17:17:36','1976-11-17 05:34:25'),(17,17,'declined','1981-08-17 11:28:51','1989-03-23 22:40:14'),(18,18,'declined','2017-05-11 04:51:59','2006-06-26 04:33:22'),(19,19,'approved','2005-11-30 11:29:03','2003-10-25 14:29:53'),(20,20,'unfriended','2004-07-20 00:42:17','2008-05-27 00:00:50'),(21,21,'requested','1997-09-08 00:53:58','1979-07-04 00:16:56'),(22,22,'requested','2001-03-07 07:41:36','2013-11-10 22:00:52'),(23,23,'approved','1983-02-04 04:32:12','1976-03-19 14:59:25'),(24,24,'requested','2018-01-31 03:33:50','1991-03-27 00:30:00'),(25,25,'approved','1975-07-29 12:09:43','1983-06-28 14:30:06'),(26,26,'declined','1990-02-23 21:39:17','1980-05-06 20:19:38'),(27,27,'unfriended','1976-08-05 13:21:56','2019-06-24 10:13:07'),(28,28,'declined','1972-04-06 15:29:42','2003-12-27 20:53:35'),(29,29,'requested','2011-05-26 16:18:47','2009-05-03 18:16:10'),(30,30,'approved','2016-03-26 03:35:59','1978-06-12 16:15:46'),(31,31,'approved','2014-07-16 08:32:16','1996-05-30 18:05:56'),(32,32,'declined','1972-04-06 03:20:14','1991-09-01 17:12:08'),(33,33,'unfriended','1998-05-31 11:39:06','1979-03-09 19:05:52'),(34,34,'unfriended','2004-12-02 16:59:34','2008-08-31 12:36:20'),(35,35,'requested','2000-04-17 09:08:18','2000-02-17 17:44:56'),(36,36,'approved','1995-11-13 04:17:44','1977-08-23 01:54:20'),(37,37,'declined','2015-11-21 04:27:11','2006-07-20 23:23:42'),(38,38,'approved','1975-10-03 19:54:33','1998-03-19 01:12:21'),(39,39,'declined','1993-06-29 19:33:05','1976-03-25 18:50:39'),(40,40,'unfriended','2016-07-29 02:05:51','2014-06-11 05:37:02'),(41,41,'approved','2006-10-25 19:50:38','1983-12-02 10:01:35'),(42,42,'declined','1972-03-19 23:08:12','1990-12-10 16:01:20'),(43,43,'unfriended','2014-11-22 21:48:32','1995-07-13 16:06:24'),(44,44,'unfriended','1989-01-17 17:36:47','1981-10-18 02:58:47'),(45,45,'approved','2020-02-25 10:57:14','2009-07-12 15:50:50'),(46,46,'declined','1996-08-03 13:55:54','1980-06-02 01:55:12'),(47,47,'approved','1999-03-14 16:40:03','2009-03-14 22:45:40'),(48,48,'approved','2007-04-02 06:11:21','1997-05-25 17:41:45'),(49,49,'approved','1975-02-08 07:24:46','1992-05-05 12:43:14'),(50,50,'declined','2015-09-13 01:28:07','1988-08-11 09:33:09');
/*!40000 ALTER TABLE `friend_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,1,1,'2001-05-31 16:15:20'),(2,2,2,'2003-10-08 05:37:03'),(3,3,3,'1981-01-03 07:45:49'),(4,4,4,'1980-01-11 07:13:08'),(5,5,5,'1970-11-23 00:33:23'),(6,6,6,'1983-01-30 18:55:33'),(7,7,7,'1985-06-22 01:18:36'),(8,8,8,'1972-01-29 14:08:51'),(9,9,9,'1984-11-21 17:54:42'),(10,10,10,'1983-11-05 08:31:38'),(11,11,11,'2012-11-17 01:35:05'),(12,12,12,'1978-09-29 20:19:42'),(13,13,13,'2020-11-10 09:54:02'),(14,14,14,'2000-08-29 01:41:41'),(15,15,15,'2020-04-11 11:15:30'),(16,16,16,'2001-06-13 08:10:38'),(17,17,17,'2014-07-26 04:09:51'),(18,18,18,'2001-09-16 12:41:58'),(19,19,19,'2001-09-05 15:36:50'),(20,20,20,'1976-06-29 02:05:10'),(21,21,21,'2000-12-29 16:57:17'),(22,22,22,'2006-10-16 20:23:55'),(23,23,23,'1985-04-04 00:33:56'),(24,24,24,'1999-08-08 07:25:42'),(25,25,25,'1992-09-28 23:21:04'),(26,26,26,'2005-01-08 22:09:31'),(27,27,27,'1989-06-04 15:11:54'),(28,28,28,'1995-04-19 03:54:15'),(29,29,29,'2006-02-02 06:56:26'),(30,30,30,'1977-08-04 03:42:57'),(31,31,31,'1978-12-06 02:41:34'),(32,32,32,'1974-09-18 16:58:20'),(33,33,33,'2015-05-03 05:22:15'),(34,34,34,'1970-08-22 11:40:04'),(35,35,35,'1992-12-17 06:02:36'),(36,36,36,'2007-02-14 01:25:48'),(37,37,37,'1993-12-12 22:07:00'),(38,38,38,'1986-12-02 13:19:23'),(39,39,39,'2011-02-11 16:49:06'),(40,40,40,'2008-10-11 09:07:48'),(41,41,41,'1995-05-24 20:39:56'),(42,42,42,'1993-01-15 10:21:37'),(43,43,43,'2000-09-14 13:56:18'),(44,44,44,'1991-12-02 13:17:48'),(45,45,45,'1972-09-08 16:48:04'),(46,46,46,'1987-08-02 02:32:22'),(47,47,47,'1974-03-09 03:38:05'),(48,48,48,'1972-04-22 22:29:57'),(49,49,49,'1992-03-14 10:48:30'),(50,50,50,'1980-04-19 09:26:23');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `media_type_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_type_id` (`media_type_id`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,1,1,'Voluptatem reiciendis rem qui ut nisi. Quod mollitia exercitationem facilis occaecati ratione. Voluptas consequatur quo quod sed enim ut. Saepe ut autem placeat ut recusandae. Qui saepe cupiditate id qui nesciunt repudiandae praesentium.','doloribus',4968763,NULL,'1998-06-26 21:16:54','2015-04-12 14:33:56'),(2,2,2,'Et sit consequatur dolor dolore molestiae. Alias iure labore maxime ullam rem eos. Ad libero error quis soluta.','corporis',0,NULL,'1984-01-15 07:52:23','1982-09-23 08:06:15'),(3,3,3,'A nihil nobis fugiat laborum voluptas magnam alias quia. Cum at quia quidem aut dolores. Alias laborum doloremque eos qui nostrum. Nam eligendi ratione ut odio molestiae cum fugit aliquid.','aut',0,NULL,'1982-04-09 16:16:51','1981-04-20 05:40:45'),(4,4,4,'Sunt ratione eveniet aut autem veritatis excepturi. Consequatur praesentium vitae officiis. Harum explicabo reprehenderit voluptate. At nemo consequatur earum.','aut',2584,NULL,'2019-02-16 13:18:33','1988-03-21 02:29:40'),(5,5,5,'Est dolor velit sit veniam. Exercitationem autem beatae ipsa velit iusto. Itaque nobis quam at optio qui ea.','sed',3479,NULL,'2000-08-20 17:04:53','2009-05-17 19:55:50'),(6,6,6,'Esse dolore soluta voluptatem iure deleniti. Placeat officiis recusandae omnis quas modi. Quo molestias quasi consequatur dolor nostrum dolor. Fugiat dicta tempore eos debitis nostrum in quam.','voluptate',787,NULL,'2011-09-16 11:04:26','1989-06-16 08:49:24'),(7,7,7,'Numquam excepturi deserunt animi voluptatem in itaque deserunt. Temporibus voluptatum temporibus voluptates aperiam nostrum molestiae voluptatum. Omnis aut quam rerum suscipit. Voluptas ea molestiae sit eaque dolorem iusto.','error',5,NULL,'1980-05-26 04:59:10','2005-02-15 10:29:29'),(8,8,8,'Explicabo quia eligendi quaerat hic minima illo. Iusto et nostrum est. Exercitationem sit doloremque hic velit sunt voluptate velit.','dicta',633,NULL,'2001-05-07 12:03:26','1976-07-26 17:03:26'),(9,9,9,'Eos id rerum minima harum est. Vel fugit quibusdam veritatis. Ut aspernatur error vel doloremque qui ipsa harum.','perspiciatis',0,NULL,'1999-10-23 07:56:52','1972-09-18 04:33:50'),(10,10,10,'Eum laudantium laboriosam ut nisi ab illum. Tenetur doloribus officiis quo commodi quaerat ipsum quibusdam. Magnam delectus consequuntur laboriosam magni et. Amet sit officiis quia et.','possimus',101,NULL,'2015-09-13 05:31:07','2019-03-15 18:11:57'),(11,11,11,'Et consequatur facere tempora sint aut delectus. Incidunt vero blanditiis doloremque aspernatur perspiciatis repudiandae laboriosam. Atque cumque iure rerum iste distinctio.','architecto',0,NULL,'1974-08-02 10:08:16','1996-07-07 17:49:53'),(12,12,12,'Rem eos eveniet totam consequatur. Quod quod blanditiis asperiores aperiam. Tempore a tenetur et unde cumque distinctio.','eos',5378,NULL,'2000-05-15 04:19:59','1992-04-01 08:01:10'),(13,13,13,'Tempora esse molestiae quod hic. Iure est autem quis autem officiis illum. Sit voluptatem ipsa odit aut quos vero.','in',666790832,NULL,'2013-01-07 21:25:29','2008-12-05 03:41:25'),(14,14,14,'Debitis eos vel voluptatibus fugit quas perspiciatis ipsam. Et velit nulla culpa atque ullam. Quia quo est labore omnis labore earum provident veritatis.','qui',7798,NULL,'1984-03-16 23:49:32','2000-10-23 19:24:27'),(15,15,15,'Praesentium quam velit dicta facilis facere optio voluptate. Aut labore sit natus ex sunt. Totam expedita dolorem rerum ea temporibus vitae officia. Assumenda adipisci dolor atque dolore.','quis',3,NULL,'1997-06-14 03:12:09','2015-04-09 15:19:59'),(16,16,16,'Ut esse quisquam praesentium omnis aut. Sapiente architecto amet voluptas quo totam. Quaerat magni quo saepe est consectetur dolor ipsa. Vel vel voluptates et asperiores culpa possimus necessitatibus.','qui',7,NULL,'1985-07-02 03:40:55','1985-08-16 08:25:04'),(17,17,17,'Itaque provident at dicta. Rem dolorem id ipsa aliquam facere. Laudantium qui provident doloremque et.','nemo',5003,NULL,'2000-06-06 11:01:44','2002-08-05 01:57:31'),(18,18,18,'Deserunt cumque doloremque dolor ut. Quidem eos inventore quam fugiat minima assumenda odio.','et',33266857,NULL,'2014-07-10 23:12:25','1970-08-08 08:05:02'),(19,19,19,'Repellendus qui quidem optio vitae officiis illum cumque quis. Sed accusantium et aliquid eveniet quibusdam quibusdam est. Illum maxime voluptate natus laborum occaecati.','delectus',828814,NULL,'1992-07-29 06:36:45','1991-04-26 08:59:34'),(20,20,20,'Aut aperiam adipisci ut. Cupiditate quisquam explicabo molestiae corrupti unde. Aut quia omnis libero quisquam.','nihil',0,NULL,'2011-05-28 20:30:30','1980-06-20 02:24:25'),(21,21,21,'Quis in deleniti sed pariatur velit. Veritatis adipisci neque quia quis. Dicta blanditiis ex voluptate expedita eaque sunt. Necessitatibus eveniet fugiat unde eaque.','tenetur',449486052,NULL,'2009-01-26 18:31:49','1991-03-28 12:37:36'),(22,22,22,'Consequatur reprehenderit sint expedita quidem. Recusandae consequuntur perferendis incidunt excepturi. Esse molestiae dignissimos autem dolores aut debitis incidunt.','et',232505,NULL,'1977-06-25 17:22:09','2009-11-27 20:30:54'),(23,23,23,'Qui veniam dolorem nam ut aliquid et. Voluptas voluptatem ad illo quisquam aut nihil enim. Ducimus adipisci natus dolor et.','quis',829,NULL,'1997-06-27 09:44:27','2007-08-07 13:40:53'),(24,24,24,'Beatae cumque facilis quas labore recusandae amet voluptatibus exercitationem. Qui quis ipsam culpa nihil. Quo ab maiores hic rem. Doloremque rerum blanditiis eos temporibus quasi veniam consequatur quam. Aut nihil atque totam id.','molestiae',495,NULL,'2010-06-22 09:04:33','2000-09-07 14:15:46'),(25,25,25,'Voluptatem aperiam occaecati quia laborum vel earum dolor debitis. Ullam autem sed veritatis cupiditate earum neque quis. Quasi architecto accusamus repellat autem rerum reprehenderit. Non omnis architecto qui id quam dolores.','explicabo',81759,NULL,'2008-04-09 22:26:20','2011-08-16 15:59:20'),(26,26,26,'Tempore nobis velit illum maiores omnis aut et architecto. Architecto odit quia autem consequatur et alias aspernatur. Velit cumque mollitia dignissimos voluptas ea autem voluptatibus. Odit illo voluptas voluptates dolor labore qui.','iure',58794,NULL,'2015-12-14 08:33:28','1991-04-25 10:40:47'),(27,27,27,'Et impedit modi aut sit quisquam. Ut molestiae provident nostrum laudantium accusantium. Numquam assumenda libero ut veritatis adipisci consequatur deleniti. Quo et ducimus porro.','animi',4,NULL,'1974-02-10 01:26:38','1972-12-23 08:30:33'),(28,28,28,'Qui aut ratione reprehenderit ut repudiandae. Ipsam est voluptatem velit aliquam et sint voluptates. Reprehenderit facilis placeat natus est est. Dolor consequatur temporibus libero illum sed accusamus aut sunt.','labore',28995120,NULL,'2006-10-16 03:07:38','1975-05-06 15:59:43'),(29,29,29,'Veritatis placeat autem sed libero autem nihil. Sint modi omnis nihil. Unde quisquam odio sit nesciunt. Rerum nisi quo saepe at reprehenderit consectetur.','inventore',50,NULL,'1974-01-26 08:27:09','1998-03-01 21:58:12'),(30,30,30,'Nulla odio ut voluptates adipisci. Molestiae ipsum quaerat numquam similique et ipsam. Quia exercitationem nihil accusantium quasi fugit.','labore',965294,NULL,'1993-01-23 21:22:26','1980-06-09 05:16:43'),(31,31,31,'Labore quibusdam quam repellendus tempore. Labore et esse reprehenderit illum temporibus. Suscipit soluta vel eos laboriosam sequi dicta vero quis.','natus',2553123,NULL,'2012-01-11 00:30:03','2020-12-11 07:19:41'),(32,32,32,'Temporibus occaecati laborum autem id eligendi nisi. Accusantium eaque natus esse amet fugit est. Harum excepturi voluptas omnis quos.','quos',0,NULL,'2020-06-30 03:30:07','1984-09-09 21:41:17'),(33,33,33,'In corrupti eius autem rerum quia illo esse. Quis in repudiandae voluptatibus. Aut ut enim enim deleniti aliquid commodi. Dolores voluptatem perferendis blanditiis reiciendis.','quis',77786360,NULL,'1974-03-21 19:26:21','2002-04-20 14:19:49'),(34,34,34,'Eos sapiente et fugiat. Ea et voluptatem velit in sed deleniti. Quia nam non in ducimus vel iure. Explicabo iure impedit velit in sed atque.','repellendus',5658791,NULL,'1997-07-29 12:34:07','2008-11-05 02:44:58'),(35,35,35,'Vitae eius suscipit quaerat deleniti eum est. Rerum illum rerum et perspiciatis voluptas. Praesentium voluptatem temporibus voluptate doloribus sit doloribus qui.','neque',0,NULL,'1980-09-02 19:14:49','2011-04-05 01:15:33'),(36,36,36,'Repudiandae voluptate odio praesentium. Id ut voluptatem aut enim consequuntur cupiditate. Corrupti nam et est id. Voluptatem incidunt dolor omnis rerum et et.','ullam',5312,NULL,'1994-01-19 22:30:02','1984-11-19 21:46:13'),(37,37,37,'Possimus magni inventore impedit dignissimos minima. Voluptas rerum aut eligendi ut at. Amet neque velit quo dolorem qui.','molestiae',706,NULL,'2010-10-05 10:57:49','1997-06-19 02:25:28'),(38,38,38,'Aut et non et eos distinctio voluptatem. Porro omnis iusto eos facere commodi ea consectetur doloremque. Officiis omnis voluptates sed expedita. Natus quo hic ducimus ratione.','distinctio',51,NULL,'2006-08-24 02:31:07','2015-08-29 10:42:19'),(39,39,39,'Ut facilis unde qui esse. Et eius consequatur soluta occaecati. Ad numquam laborum possimus qui omnis autem nisi. Non perferendis repellendus distinctio.','et',9786948,NULL,'2015-06-18 10:01:48','1998-07-01 01:27:06'),(40,40,40,'Rerum voluptas nulla quia asperiores ratione aut. Eum delectus dolores dignissimos sint ducimus.','odio',62944,NULL,'2016-12-11 15:37:00','2018-03-29 14:23:49'),(41,41,41,'Rem incidunt accusamus architecto voluptatem et aliquid tempore. Culpa neque sit placeat accusantium. Aut ex voluptatem rem quia mollitia voluptas aut.','soluta',606,NULL,'2008-10-22 00:39:56','2003-09-24 12:45:54'),(42,42,42,'Sequi pariatur hic autem tempora blanditiis ut ipsam. Eveniet officia est ut. Qui quas quae vel ut.','et',57,NULL,'2002-01-06 01:37:23','2002-07-11 19:53:09'),(43,43,43,'Nihil ut velit eum. Quod possimus provident facilis a. Inventore autem voluptas quaerat quas numquam. Omnis quidem quo sit recusandae.','nisi',95880,NULL,'1985-09-10 08:36:31','1995-05-06 03:14:22'),(44,44,44,'Dolorem consequatur eligendi quod rem quasi voluptates. Esse hic quibusdam et repellendus sunt distinctio. Distinctio ut vitae est ut.','incidunt',377,NULL,'1970-12-31 16:35:13','2012-06-18 06:07:38'),(45,45,45,'Amet quis ullam occaecati laborum quia. Consequatur mollitia dolorem dolores est a ea. Maiores dolor sed odit doloremque omnis animi recusandae. Et culpa id sit laborum ut est aliquam fugiat.','qui',91477582,NULL,'2010-07-14 14:43:43','1983-07-15 01:56:11'),(46,46,46,'Unde repudiandae sequi facere eos deleniti ad ad. Consequatur hic iusto deleniti. Itaque ut atque sed velit fugiat eveniet est. Eos qui inventore libero quaerat.','officiis',7229,NULL,'1982-05-25 00:13:28','1985-03-16 05:41:07'),(47,47,47,'Aliquam in voluptatem iure ipsum. Blanditiis beatae nihil asperiores. Et quo quo magnam ea sed omnis.','tenetur',0,NULL,'1977-05-11 03:30:26','1985-05-16 20:11:53'),(48,48,48,'Sed autem est accusamus sequi voluptatem. Qui consequatur rerum placeat qui.','molestias',256744,NULL,'2019-10-03 07:26:39','2002-11-28 13:59:32'),(49,49,49,'Aut quo facilis consequatur dolorem ad nesciunt laborum ratione. Dolore sapiente quas et dicta. Et et quisquam exercitationem id exercitationem et. Odit deserunt totam porro facere cumque.','quia',47,NULL,'1991-09-12 21:47:23','2001-07-15 08:32:28'),(50,50,50,'Sunt autem sint magnam ex sit quisquam non eligendi. Optio blanditiis nisi minus voluptatem. Itaque voluptate aperiam animi quia dolores est soluta. Quia architecto temporibus libero itaque.','dignissimos',4898329,NULL,'1975-03-08 14:40:27','1976-04-26 15:36:53');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,'error','2005-02-11 22:50:02','1977-01-26 13:27:44'),(2,'consequatur','1975-06-17 16:54:31','1976-12-23 19:00:53'),(3,'voluptates','2006-09-27 01:46:58','2004-09-14 01:40:26'),(4,'assumenda','2015-08-20 03:41:41','1983-05-31 13:23:35'),(5,'non','1993-04-02 20:45:12','2009-03-14 15:51:01'),(6,'unde','2000-10-05 03:53:59','2005-09-06 10:21:05'),(7,'est','1983-12-02 04:24:56','1981-10-26 17:07:35'),(8,'qui','1993-07-03 21:48:46','1982-08-29 17:02:40'),(9,'sint','2011-04-15 22:40:10','2000-07-22 19:30:50'),(10,'quia','1991-04-10 00:35:45','1991-08-09 23:05:38'),(11,'voluptate','1988-12-17 06:56:21','1972-11-08 07:47:19'),(12,'voluptates','1995-10-11 11:48:24','2000-06-21 15:20:15'),(13,'quam','2001-07-21 08:03:59','1999-07-05 02:17:10'),(14,'culpa','1992-01-14 22:54:03','2002-11-11 19:22:01'),(15,'id','1976-10-18 17:43:05','2008-08-07 14:19:26'),(16,'ea','2012-03-30 16:24:53','1975-02-24 19:29:14'),(17,'qui','2019-02-26 12:52:40','1979-10-02 21:33:32'),(18,'a','1984-12-13 03:26:58','1990-05-02 16:43:06'),(19,'quia','2007-06-22 17:31:33','1981-12-26 22:27:34'),(20,'velit','2003-10-16 00:07:35','1980-09-18 23:40:36'),(21,'ut','2013-11-17 22:44:09','1975-01-14 19:19:34'),(22,'culpa','1987-04-23 00:12:05','2012-07-16 04:13:54'),(23,'ut','1990-03-11 12:40:28','1983-06-14 22:50:51'),(24,'quia','2012-10-06 23:02:18','2000-04-04 07:48:20'),(25,'dignissimos','2012-06-04 21:47:18','1994-01-10 14:34:59'),(26,'id','2002-11-15 18:06:47','2011-03-13 03:55:05'),(27,'voluptatem','1990-01-12 00:39:24','2015-09-16 19:54:44'),(28,'sed','1999-01-13 06:56:17','1971-11-15 10:08:58'),(29,'aut','2013-04-14 12:06:46','1996-11-16 06:26:49'),(30,'ut','1977-09-21 00:09:12','2018-01-14 23:21:11'),(31,'quaerat','2000-12-13 19:25:32','2011-02-03 12:25:33'),(32,'corrupti','2017-06-21 11:04:16','2000-08-30 16:00:03'),(33,'natus','2002-07-04 20:10:04','2001-02-19 00:38:27'),(34,'rerum','2015-12-03 14:44:52','2015-07-09 14:34:19'),(35,'ut','2015-01-29 02:11:15','1986-06-16 20:16:28'),(36,'sit','1990-07-31 22:08:11','1994-07-16 01:26:25'),(37,'aut','2016-08-25 08:02:09','2000-05-22 09:04:09'),(38,'sed','1988-09-24 18:03:03','1989-02-16 23:02:25'),(39,'dolores','1986-03-29 06:42:40','1972-01-25 19:31:14'),(40,'ullam','2000-02-21 17:38:33','1991-01-14 10:28:19'),(41,'dolores','2012-12-17 22:16:46','2011-04-04 02:49:12'),(42,'ea','1987-03-12 17:40:21','1996-03-03 22:15:36'),(43,'ratione','1998-12-02 17:54:13','1973-01-14 22:14:22'),(44,'non','2020-10-25 11:15:25','1978-07-28 16:03:44'),(45,'praesentium','2007-04-13 00:16:02','1979-07-01 04:28:24'),(46,'aut','2008-03-07 12:26:46','2011-12-29 10:24:03'),(47,'ab','1975-08-13 19:00:32','1973-03-17 06:54:12'),(48,'itaque','2019-03-03 12:54:30','2001-01-19 03:58:45'),(49,'nesciunt','1989-06-22 17:21:20','2019-09-22 11:04:36'),(50,'aperiam','1984-06-28 18:26:17','1974-03-04 23:16:21');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint(20) unsigned NOT NULL,
  `to_user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,1,1,'Autem quia mollitia et ad laborum vero eum. Perferendis non magnam ea eius saepe. Et provident reiciendis laborum neque fuga laudantium. Occaecati harum eligendi dicta totam quod reprehenderit ea. Consectetur voluptatem et vel consequatur consequatur.','2010-04-02 23:25:46'),(2,2,2,'Saepe rerum architecto maxime provident cumque autem eveniet. Quae labore qui quaerat unde. Voluptatem quam in porro ut saepe. Necessitatibus repellendus porro aut dolor.','2005-05-09 05:13:23'),(3,3,3,'Soluta illum animi et ipsum mollitia sed deleniti. Ipsa aperiam eum reprehenderit ipsum eos ut enim est. Molestiae quo in accusantium esse unde ut. Odio recusandae quia perspiciatis et ad reiciendis.','2018-12-13 18:06:43'),(4,4,4,'Et rerum molestiae quibusdam sunt labore ducimus velit. Dolorem ea necessitatibus dolor suscipit quo. Nihil unde aspernatur nisi. Adipisci voluptatum aut amet odit in.','1985-08-11 23:49:35'),(5,5,5,'Voluptatem laborum quaerat sed. Necessitatibus et est ratione est aut. Optio nobis assumenda aut. Dolore dolore sit ut officiis.','1980-05-06 00:23:01'),(6,6,6,'Quod dolorem dolorem aliquam eaque. Id et natus consequatur omnis voluptatem. Delectus velit in enim. Laboriosam quo fugit pariatur dolorem saepe aut voluptatem occaecati.','1993-11-22 14:11:38'),(7,7,7,'Officiis et nam veritatis qui quia iure. Rerum est enim rerum laborum autem.','1989-05-24 03:52:07'),(8,8,8,'Eveniet quos molestias ratione sit. Laudantium expedita deleniti aut quae nihil. Illo expedita ut ex deserunt animi vel sunt. Rerum exercitationem quaerat vel voluptate veniam iusto laudantium nostrum.','2007-05-28 12:19:54'),(9,9,9,'Facere ullam et dolorum mollitia est. Odio numquam quis nam eveniet. Ex vero consequatur porro aut ut nostrum expedita.','1990-05-28 10:59:28'),(10,10,10,'Quis quod quia eaque sunt optio necessitatibus. Dolorem ea omnis ut provident. Ut totam quos ea et.','1976-01-14 21:47:30'),(11,11,11,'Quia porro eum minus quis. Cumque magni facere et sint. Voluptas et debitis temporibus dignissimos assumenda porro. Voluptas tenetur eveniet optio unde. Ab nulla aliquam voluptates ut.','2014-01-16 04:46:47'),(12,12,12,'Nisi est maxime quas. Deleniti impedit sed doloribus quasi molestiae dolor. Eum est voluptatum nemo vel. Cupiditate ipsa perferendis voluptas.','2016-12-14 18:45:41'),(13,13,13,'Nihil quod neque blanditiis exercitationem eos. Cupiditate quibusdam omnis voluptatum aut. Autem exercitationem non consequatur nobis. Eligendi exercitationem velit culpa quas dolore adipisci perferendis.','1994-02-27 16:25:27'),(14,14,14,'Eos ad cupiditate qui id sapiente ab non. Magnam eveniet corporis iusto et est consectetur. Molestias temporibus ut voluptatibus sunt animi consequuntur. Ipsam ab praesentium nulla.','2005-05-02 19:20:33'),(15,15,15,'Dolorum dolores quos adipisci non totam similique. Veritatis explicabo et dolores rem repellat in. Voluptatem sed dolores aut rerum.','2018-11-24 11:55:11'),(16,16,16,'Rerum doloribus temporibus voluptates sunt quisquam et. Omnis minima aliquam consequatur incidunt animi enim optio inventore.','1988-04-26 08:01:48'),(17,17,17,'Id ab esse sapiente eos excepturi. Unde exercitationem voluptas suscipit cumque reprehenderit. Architecto accusantium quo aut voluptate.','2004-03-13 00:22:37'),(18,18,18,'Non numquam eius fugiat et. Et laboriosam unde qui vitae qui deleniti ipsa. Accusamus doloribus quaerat molestiae ut omnis nobis eveniet.','2001-04-13 23:50:11'),(19,19,19,'Voluptatem in cupiditate minus sint rem aut. Quia quae dolorem corporis beatae ullam possimus omnis. Vero ipsam non molestiae doloremque est quam sint. Dolor harum non hic.','1987-05-25 02:38:58'),(20,20,20,'Suscipit incidunt voluptatem non ut incidunt quidem. Est molestiae incidunt enim provident recusandae incidunt. Voluptatem sit vel modi voluptatum sapiente.','2003-11-23 23:19:52'),(21,21,21,'Consequuntur dolorum magni doloremque voluptatem pariatur neque doloribus quia. Maxime qui voluptate nam architecto nam.','1972-04-09 11:52:10'),(22,22,22,'Id libero vero quisquam consequatur ducimus harum quod. Deserunt iusto eaque similique. Veritatis ut fugit sint est id iure et.','2002-10-04 04:16:40'),(23,23,23,'Sunt quis amet nihil sit ducimus omnis. Iusto ut nobis ut saepe. Natus nihil recusandae consequatur veritatis aut. Occaecati est odio quia tempore officia quo autem aliquam.','2016-03-17 13:31:13'),(24,24,24,'Vitae et aut ut beatae sit commodi. Placeat nobis voluptatem eum voluptatem. Voluptatibus est expedita nisi omnis neque. Expedita ut qui mollitia quibusdam cum quos debitis. Sed dignissimos nemo reprehenderit debitis explicabo sint et.','2008-07-06 02:25:57'),(25,25,25,'Magnam officia cum consectetur quae officia voluptates rerum quas. Consequatur numquam ut qui sapiente. Doloribus quasi sit veniam temporibus quia.','2002-08-27 12:06:29'),(26,26,26,'Et sed vero quos fugit aut. Voluptates est necessitatibus non aliquid aut quasi.','2012-11-28 02:09:06'),(27,27,27,'Magnam beatae qui temporibus qui fugiat dolores. Est in dolorem laborum omnis vitae. Est doloremque iste qui. Ut qui velit quod.','2018-08-22 10:50:34'),(28,28,28,'Expedita quia amet quas. Enim unde non et dicta nam ea. Consequatur omnis aspernatur omnis enim ipsa consequatur beatae quam. Expedita doloribus dolorum nemo officia ad possimus magni.','2008-01-24 22:26:16'),(29,29,29,'Possimus consequatur rerum expedita ut possimus et delectus. Ut et modi omnis eum ut sit. Qui commodi aut doloremque nam voluptatibus quia et. Sed et aspernatur sint doloremque voluptatem at eos.','2018-01-01 01:30:37'),(30,30,30,'Ut necessitatibus nihil facilis illo quia voluptatum. Veritatis hic aut ut assumenda officia. Quis iusto rerum quae omnis quisquam voluptates non.','1996-03-31 19:00:52'),(31,31,31,'Magnam et alias voluptate sit. Aliquam odio recusandae architecto. Omnis quia iste dolore vitae.','1992-01-29 18:26:55'),(32,32,32,'Consequatur ut magnam dolorem nihil suscipit natus. Eveniet qui deserunt blanditiis odio dolore suscipit numquam. Rem vel eligendi itaque sint nobis corporis ut.','2002-04-02 11:32:41'),(33,33,33,'Officiis tenetur non quasi sed incidunt dignissimos qui. Dolor cupiditate omnis ut quo facilis voluptas. Reprehenderit possimus eos magni aut. Praesentium reiciendis quia eaque non.','2013-11-14 02:09:28'),(34,34,34,'Cum accusamus sapiente maiores porro. Similique ducimus quia nam debitis rerum temporibus commodi ut. Aliquid dolor eius cumque aut quam.','2019-11-04 23:07:17'),(35,35,35,'Consequatur est voluptatem numquam quia fuga. Necessitatibus dicta architecto aut architecto qui quas. Dolores adipisci velit dolore aliquid sunt et aperiam.','2008-01-30 07:11:29'),(36,36,36,'Voluptas ex recusandae velit dolorem. Ut corrupti sunt rerum facere ut est. At magnam molestiae iste error.','2013-05-26 15:57:21'),(37,37,37,'Quos ratione deleniti rerum et. Voluptas rerum ratione veniam labore reprehenderit quibusdam. A animi debitis laboriosam maxime. Quidem unde aut voluptas repellat cupiditate quidem repellat.','1990-01-23 09:25:49'),(38,38,38,'Corporis quia laudantium ex explicabo consectetur ipsa. Aperiam rerum nam omnis nihil velit.','1983-12-27 10:05:04'),(39,39,39,'Iure praesentium eaque molestiae. Eaque est et ab nihil.','1971-08-28 15:38:24'),(40,40,40,'Saepe animi in assumenda ut aperiam id aspernatur. Consequuntur non facere molestias voluptas vero reiciendis assumenda. Explicabo voluptas quidem vel expedita aut. Voluptatem doloremque dolorem et atque aliquid doloremque expedita qui.','1975-04-23 07:49:28'),(41,41,41,'Enim consequatur eum omnis fuga. Sint distinctio eius cum voluptatem in excepturi iure. Saepe placeat consequatur libero voluptate ea est consequatur.','1983-06-18 13:55:46'),(42,42,42,'Et modi illo quidem necessitatibus doloremque. Provident atque qui corrupti eveniet eveniet. Illum eaque non velit hic nisi.','1992-01-11 12:41:39'),(43,43,43,'Repellendus atque quos et aut quo id. Voluptatem ad similique omnis sit sed sint quam molestiae. Eum et fuga ipsam magni quibusdam dolores. Non ut et iusto enim est non.','1986-06-05 23:51:40'),(44,44,44,'Itaque eum dolorem libero corrupti consequatur. Iusto fuga quia numquam atque sint iusto rem molestiae. Repellat doloribus aut est quam sed.','1990-09-25 17:45:45'),(45,45,45,'Saepe est maxime id qui. Ipsa natus excepturi tempora et qui soluta. Rerum culpa et rerum placeat facere est sint magnam. Sed est tempora ab enim exercitationem saepe est possimus.','1973-12-25 21:42:40'),(46,46,46,'Accusantium non esse quas harum dignissimos possimus. Ab et odit dolorem odit perspiciatis alias aliquid.','2013-06-16 21:43:15'),(47,47,47,'Accusamus molestiae rerum beatae ea necessitatibus id nemo. Voluptas culpa qui officia ad. Sit ipsa magnam fugiat doloremque. In est facilis voluptatum harum reprehenderit ea.','1992-06-26 08:56:44'),(48,48,48,'Consequatur tenetur consequatur officiis dolores odit. Rem blanditiis et libero adipisci fugiat. Ad accusantium itaque molestiae repudiandae ea fugit nihil.','1984-08-30 01:44:52'),(49,49,49,'Quisquam vero vel et expedita. Qui hic quaerat amet ut aliquam corrupti. Et rerum voluptas quia nisi eligendi quos. Natus est ut officiis atque modi modi rerum sunt.','1997-12-27 23:04:20'),(50,50,50,'Harum sapiente possimus rem quos omnis aperiam. Ut corporis velit aliquid. Nulla autem mollitia molestiae cupiditate. Numquam alias quisquam facere ipsa.','1980-03-29 22:05:04');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_albums`
--

DROP TABLE IF EXISTS `photo_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo_albums` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `photo_albums_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_albums`
--

LOCK TABLES `photo_albums` WRITE;
/*!40000 ALTER TABLE `photo_albums` DISABLE KEYS */;
INSERT INTO `photo_albums` VALUES (1,'id',1),(2,'ullam',2),(3,'sed',3),(4,'earum',4),(5,'fugit',5),(6,'veritatis',6),(7,'impedit',7),(8,'ut',8),(9,'perferendis',9),(10,'et',10),(11,'qui',11),(12,'deserunt',12),(13,'ex',13),(14,'ut',14),(15,'soluta',15),(16,'iste',16),(17,'nihil',17),(18,'aut',18),(19,'quo',19),(20,'temporibus',20),(21,'nihil',21),(22,'eos',22),(23,'expedita',23),(24,'est',24),(25,'perferendis',25),(26,'qui',26),(27,'sed',27),(28,'culpa',28),(29,'quasi',29),(30,'id',30),(31,'molestiae',31),(32,'necessitatibus',32),(33,'eum',33),(34,'quaerat',34),(35,'sequi',35),(36,'voluptas',36),(37,'rerum',37),(38,'rerum',38),(39,'occaecati',39),(40,'accusamus',40),(41,'quibusdam',41),(42,'consequuntur',42),(43,'incidunt',43),(44,'sapiente',44),(45,'temporibus',45),(46,'aliquid',46),(47,'vitae',47),(48,'illum',48),(49,'doloremque',49),(50,'doloribus',50);
/*!40000 ALTER TABLE `photo_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `album_id` (`album_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `photo_albums` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `photos_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10),(11,11,11),(12,12,12),(13,13,13),(14,14,14),(15,15,15),(16,16,16),(17,17,17),(18,18,18),(19,19,19),(20,20,20),(21,21,21),(22,22,22),(23,23,23),(24,24,24),(25,25,25),(26,26,26),(27,27,27),(28,28,28),(29,29,29),(30,30,30),(31,31,31),(32,32,32),(33,33,33),(34,34,34),(35,35,35),(36,36,36),(37,37,37),(38,38,38),(39,39,39),(40,40,40),(41,41,41),(42,42,42),(43,43,43),(44,44,44),(45,45,45),(46,46,46),(47,47,47),(48,48,48),(49,49,49),(50,50,50);
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gender` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `photo_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `hometown` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_photo_id` (`photo_id`),
  CONSTRAINT `fk_photo_id` FOREIGN KEY (`photo_id`) REFERENCES `photos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'m','1994-04-08',1,'1978-01-23 05:15:20',NULL),(2,'f','2016-05-03',2,'1988-07-15 00:00:39',NULL),(3,'m','1970-03-29',3,'1981-04-02 11:23:29',NULL),(4,'m','1987-10-01',4,'2007-03-18 03:30:52',NULL),(5,'f','2015-05-17',5,'1996-10-04 13:07:45',NULL),(6,'f','1993-06-05',6,'1982-05-21 04:06:06',NULL),(7,'m','1992-08-29',7,'2002-08-23 15:48:25',NULL),(8,'m','1975-04-14',8,'2016-12-27 09:16:47',NULL),(9,'f','2004-09-05',9,'1991-06-15 01:33:17',NULL),(10,'m','2008-11-03',10,'2015-11-27 20:53:38',NULL),(11,'m','1973-03-06',11,'1971-10-19 23:52:50',NULL),(12,'f','1990-01-15',12,'1975-11-25 04:13:05',NULL),(13,'m','1986-01-17',13,'1972-02-15 10:10:00',NULL),(14,'m','1987-07-21',14,'1980-06-01 01:21:09',NULL),(15,'f','2018-07-18',15,'1973-05-06 08:49:48',NULL),(16,'m','1992-03-06',16,'2014-01-21 08:57:26',NULL),(17,'f','1977-01-05',17,'1989-02-18 09:17:06',NULL),(18,'m','1997-05-04',18,'1987-07-09 11:52:44',NULL),(19,'f','1979-07-18',19,'1982-10-20 13:09:31',NULL),(20,'m','1992-12-22',20,'2007-01-23 21:00:10',NULL),(21,'f','1997-04-19',21,'1988-08-31 09:22:59',NULL),(22,'f','2001-02-27',22,'2008-11-19 21:48:41',NULL),(23,'f','1999-01-16',23,'2019-05-20 21:43:17',NULL),(24,'f','2019-07-08',24,'1995-02-14 21:05:06',NULL),(25,'f','2017-07-04',25,'1975-10-22 21:02:19',NULL),(26,'f','1972-01-27',26,'1997-03-26 13:41:08',NULL),(27,'f','1994-06-19',27,'2019-12-12 00:23:17',NULL),(28,'m','2011-10-20',28,'1983-01-07 01:45:11',NULL),(29,'m','1978-01-21',29,'1988-01-23 23:59:13',NULL),(30,'f','2002-10-02',30,'2000-06-04 22:26:42',NULL),(31,'f','2016-12-17',31,'1994-12-16 11:23:43',NULL),(32,'m','2018-12-15',32,'1990-03-26 14:54:40',NULL),(33,'f','2000-08-22',33,'2016-01-25 13:30:11',NULL),(34,'f','1992-12-05',34,'2011-05-30 08:51:15',NULL),(35,'m','1992-05-08',35,'2003-07-04 09:37:01',NULL),(36,'f','2008-06-15',36,'1978-03-21 15:46:01',NULL),(37,'m','2006-07-06',37,'2007-05-22 18:28:41',NULL),(38,'m','1970-02-19',38,'1984-08-13 04:45:55',NULL),(39,'m','2002-02-02',39,'1997-02-22 02:02:44',NULL),(40,'m','2014-09-30',40,'1989-11-11 08:03:56',NULL),(41,'f','2016-08-11',41,'2002-02-23 14:52:40',NULL),(42,'f','2007-04-13',42,'1989-02-10 05:08:16',NULL),(43,'f','2015-08-24',43,'1988-06-06 02:32:14',NULL),(44,'m','1982-08-02',44,'2013-08-12 19:39:08',NULL),(45,'m','2011-01-24',45,'2019-03-29 00:37:24',NULL),(46,'f','1976-11-23',46,'1994-08-28 03:05:09',NULL),(47,'m','2003-10-28',47,'1982-02-20 04:06:51',NULL),(48,'m','1977-09-23',48,'1980-10-16 03:59:06',NULL),(49,'f','2010-09-04',49,'2020-04-21 22:32:59',NULL),(50,'f','2014-10-01',50,'2008-01-19 05:33:08',NULL);
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic_messages`
--

DROP TABLE IF EXISTS `topic_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic_messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `message_author` bigint(20) unsigned NOT NULL,
  `discussing_topic_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `message_author` (`message_author`),
  KEY `discussing_topic_id` (`discussing_topic_id`),
  CONSTRAINT `topic_messages_ibfk_1` FOREIGN KEY (`message_author`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `topic_messages_ibfk_2` FOREIGN KEY (`discussing_topic_id`) REFERENCES `discussing_topic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1231 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic_messages`
--

LOCK TABLES `topic_messages` WRITE;
/*!40000 ALTER TABLE `topic_messages` DISABLE KEYS */;
INSERT INTO `topic_messages` VALUES (1181,'Consequatur dolor veniam accusamus voluptate. Corporis non ut consequatur provident excepturi. Nobis recusandae vero non voluptatibus ex est sit assumenda.','1982-06-05 01:10:51',1,1),(1182,'Consequatur beatae rerum dicta nulla et enim. Sint et at corporis repellendus. Maxime fugiat et est autem autem quia.','1983-02-04 21:09:35',2,2),(1183,'Dignissimos ipsa dolores quibusdam rem eveniet est. Qui sunt molestiae sunt ea nihil. Sed officia blanditiis omnis est ut eaque ipsam. Amet neque qui commodi. Eos delectus eos ratione dolores quas.','1993-03-15 08:32:06',3,3),(1184,'Sed veritatis necessitatibus sed autem provident. Nemo enim voluptas tenetur corrupti est. Enim pariatur nulla nisi totam.','2005-05-08 11:09:14',4,4),(1185,'Aliquam sequi adipisci deleniti necessitatibus ex quibusdam blanditiis. Sint sunt pariatur natus sint doloribus architecto. Dolores quia necessitatibus sapiente voluptates ad id quibusdam. Id et fuga dignissimos sunt beatae ratione numquam natus. Voluptates sunt eveniet quia unde magni.','2015-11-15 09:10:39',5,5),(1186,'Quis dicta sint earum eos in dignissimos ex. Voluptatem in laudantium quia ut vitae id et sed. Illum aliquam similique dolorem exercitationem dignissimos culpa.','1972-05-22 07:32:38',6,6),(1187,'Id velit eos ut fugiat quis ea dolor. Nihil dicta sint et culpa. Eos ipsa dolorem et laboriosam asperiores. Totam qui voluptate est minima.','1992-03-26 00:45:03',7,7),(1188,'Dolorum et architecto minus. At quas sint quas quo rerum quia quo. Tenetur voluptas maiores nulla a sed occaecati optio. A error aliquid sapiente at.','2014-03-24 16:17:32',8,8),(1189,'Molestias ullam qui velit distinctio ea. Aliquid rerum aut vitae laboriosam. Qui et quasi aut quidem consequuntur voluptas dolorem dolorem. Et incidunt consequuntur quis non.','1976-12-08 16:40:48',9,9),(1190,'Voluptatem a enim commodi. Fugit saepe iste voluptatem suscipit in excepturi. Cum est sunt illo non magni. Iure aut necessitatibus et quisquam eum quasi.','2005-09-17 07:51:29',10,10),(1191,'Id tempore voluptatem aut quis alias ea est corporis. Ex et at suscipit quasi maxime. Odit tempore necessitatibus ipsam quia laboriosam molestiae voluptas.','1999-02-17 07:40:16',11,11),(1192,'Qui ducimus dolor laboriosam quas. Velit omnis dolorum maiores alias commodi eaque. Expedita consequatur saepe omnis accusamus.','1996-10-08 17:25:59',12,12),(1193,'Repudiandae tempore aperiam eaque corporis fugiat sit. Fugiat suscipit magnam voluptas omnis. Perferendis cum tenetur pariatur et reprehenderit quaerat. Aliquid mollitia sit velit.','2013-11-08 20:32:43',13,13),(1194,'In recusandae eum totam ut. Adipisci atque et delectus et fuga. Atque quo consectetur omnis minus qui facilis fugiat.','1990-08-16 01:00:01',14,14),(1195,'Eum nisi doloribus iste debitis. Aut eum dolor et ut asperiores sed qui. Accusantium et et enim dicta ea eum.','2003-12-28 22:15:01',15,15),(1196,'Consequatur molestiae odio rem ullam fugiat tempore. Ullam molestiae dolorem tempora officia itaque expedita consequatur nihil. Animi quos nemo sit dolore aut ex blanditiis. Velit cupiditate aliquam ducimus ad dolorem dolores autem.','1983-11-21 22:53:30',16,16),(1197,'Explicabo aut facere mollitia beatae voluptate. Consequatur mollitia doloribus quod et. Aut dignissimos recusandae deleniti delectus. Omnis deserunt non repudiandae natus est totam et.','1972-04-07 04:52:45',17,17),(1198,'Numquam voluptatem ut ea et possimus. Velit aperiam dignissimos velit doloremque consequatur ut dolore. Iste est rerum consequuntur nulla omnis. Eos est qui est numquam.','2006-03-21 06:15:25',18,18),(1199,'Corporis tenetur et perferendis impedit minus dolorem libero. At dolore id est accusantium. Temporibus aspernatur aut voluptas laudantium. Maxime fuga exercitationem accusamus quisquam.','2002-05-03 09:23:13',19,19),(1200,'Possimus quo quae voluptatibus doloribus. Aut quod saepe in dignissimos. Corporis aut quia laboriosam ab.','2016-09-06 22:05:03',20,20),(1201,'Ex illum veniam quo voluptatibus. Delectus suscipit exercitationem nobis ut laborum. Qui quidem fugit vel voluptate. Beatae dolor et sunt dolor maiores. Iure dolorum id blanditiis harum repudiandae.','2011-02-21 11:49:07',21,21),(1202,'Explicabo eum vel nam possimus. Placeat amet aut soluta itaque rerum eveniet. Perferendis eum culpa voluptates fugiat neque rem. Repellat dolorem amet dolorem placeat dolorum.','2015-09-22 22:03:01',22,22),(1203,'Rerum asperiores molestiae qui cupiditate. Voluptas minus et nihil omnis voluptate praesentium. Et quia facere impedit ipsum soluta hic.','1993-11-09 03:12:38',23,23),(1204,'Earum voluptatem sit quia quis ea. Voluptates voluptatem nihil ipsa doloremque sint nobis fugit veniam. Est veniam non qui nam.','1979-02-24 16:01:01',24,24),(1205,'Est ut asperiores fuga harum omnis quod facere. Magni dolores nulla labore. Perferendis voluptas veritatis ipsa inventore unde impedit qui.','1983-06-25 04:26:30',25,25),(1206,'Dolore aut et voluptatum optio nesciunt impedit. Velit et in quo alias cum hic. Omnis eveniet in veniam provident impedit adipisci quia in. In possimus repudiandae omnis natus. Cum ad dolores cum itaque.','2000-09-05 19:35:34',26,26),(1207,'Aliquid odio voluptatem delectus assumenda vel est et et. Quae iusto illo qui qui aut. Ut quo voluptas accusantium consectetur. Architecto nesciunt non libero distinctio voluptates sint rerum ex.','2007-12-24 11:40:42',27,27),(1208,'Tempore beatae vel aliquam sunt repellendus optio animi rem. Eos veniam eos in fugit tenetur. Vitae qui est nostrum.','1994-01-07 23:25:03',28,28),(1209,'Sit illum ea ut velit vel et sed ipsam. Molestiae illo blanditiis laudantium minus laudantium magni quibusdam. Assumenda laboriosam ipsa ea et ducimus reiciendis repudiandae. Alias omnis ab nemo et repudiandae. Ex nam facere voluptatem laboriosam vel.','2010-02-06 12:06:14',29,29),(1210,'Dolorum reiciendis eius blanditiis nulla sint enim. Facere omnis voluptatem et perferendis placeat ipsam voluptatem. Sunt eos repudiandae et natus vel iusto.','1992-12-16 22:11:36',30,30),(1211,'Beatae commodi et et eaque. Animi autem corporis repudiandae beatae sit eos nam. Ex non et fuga modi quia nemo nostrum. Occaecati velit corrupti quo temporibus voluptatem aliquid.','2006-03-29 14:35:42',31,31),(1212,'Molestias et quia consectetur et. Eos esse aut vel ea. Rerum rerum labore quis aliquam ex et at voluptatibus. Et at consequatur rerum quam. Incidunt ipsa et ipsum accusantium voluptas exercitationem quia.','2014-03-09 07:35:42',32,32),(1213,'Veniam facilis placeat et quia molestias. Nam libero distinctio reprehenderit adipisci repudiandae. Repudiandae non soluta ad esse ut modi. Qui unde maiores perferendis delectus harum ut est.','2006-04-02 06:26:08',33,33),(1214,'Dolor quas voluptatum sunt architecto ut et. Doloribus tempore eum voluptas esse ducimus. Earum rerum unde molestias fugit.','2002-10-04 13:54:43',34,34),(1215,'Vitae veniam provident quod aliquam ipsa assumenda iusto. Ut adipisci rerum itaque quis dolor repudiandae repudiandae quia. Consectetur vero nesciunt earum eveniet et cum voluptates. Voluptas accusantium dolorem temporibus.','1996-10-22 14:55:10',35,35),(1216,'Pariatur cupiditate cupiditate labore optio. Et sunt quaerat voluptatem unde sunt. Nostrum voluptatem est et sed.','2018-02-20 15:11:46',36,36),(1217,'Quam exercitationem id maiores vel modi. Quibusdam et alias facere id. Consequuntur et ipsum dolorem sed. Laboriosam consequatur in natus eos magni.','1997-11-30 05:48:11',37,37),(1218,'Sint magnam mollitia consequuntur rerum consectetur molestiae eveniet. Nam voluptatem iste optio quia. Voluptatum commodi animi quae delectus voluptate voluptas provident. Dignissimos deleniti odio possimus in officiis.','1976-08-25 01:08:43',38,38),(1219,'Magni consequatur omnis totam dolorem deserunt quia. Molestiae dolor qui corporis reprehenderit. Perspiciatis nam nesciunt exercitationem illum autem.','1990-10-05 04:30:09',39,39),(1220,'Molestiae magni eligendi non. Aut ut natus quidem.','2008-12-03 23:02:27',40,40),(1221,'Quia quam sit et rerum voluptas aut eum. Fugiat repellat at magnam vero sapiente. Recusandae sint et explicabo iste occaecati facere quod.','1990-05-30 19:26:06',41,41),(1222,'Aut iure dicta ut tempore. Soluta doloribus quod ipsam dolorem voluptates. Voluptatibus qui illum aut natus molestiae.','1974-04-23 21:21:24',42,42),(1223,'Odit dignissimos praesentium consequatur dicta enim voluptate et. Ut nesciunt consequatur maiores aliquam. Soluta est officiis illum cupiditate.','1985-04-05 12:14:15',43,43),(1224,'Rerum veritatis illo expedita animi. Sed quia velit ea et.','1980-03-20 00:06:48',44,44),(1225,'Et minus temporibus tempore fuga voluptas necessitatibus est. Aliquam aut doloribus est nobis qui. Optio molestiae reprehenderit ut eos molestiae quo.','2008-02-21 05:47:12',45,45),(1226,'Dignissimos at consequatur cum doloribus consequatur tempora. Illum amet aut quas quo corrupti eum. Est dolorum est consequatur omnis. Nobis aut vero vero id consequuntur sequi quisquam.','2018-08-28 10:36:39',46,46),(1227,'Repellat et nobis quidem odit. Cupiditate consectetur sint voluptatem rerum est quibusdam. Vitae aspernatur labore quia rem consectetur. Eaque aut consequuntur molestiae.','1987-08-22 22:44:51',47,47),(1228,'A assumenda accusantium dolor omnis non distinctio nihil. Laborum sed natus officiis maxime. Temporibus incidunt assumenda qui laborum et aut nulla dicta. Et cupiditate autem reiciendis ut aperiam libero voluptas.','1970-08-17 09:17:23',48,48),(1229,'Eius voluptates neque nobis aut. Ut assumenda sapiente ratione adipisci nostrum et voluptatem ipsam. Optio optio accusantium doloribus quos laudantium molestiae aut.','2004-02-01 08:13:08',49,49),(1230,'Aut perspiciatis molestias quo reprehenderit ut nulla. Officia minima quo illo possimus accusamus quis totam. Aut nemo natus eum. Officia id ut iste consequuntur doloremque.','1998-07-20 21:30:31',50,50);
/*!40000 ALTER TABLE `topic_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Фамилия',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_hash` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `users_firstname_lastname_idx` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Akeem','Green','broderick77@example.com','5d1bad521c94520bc811fb2b85451a7c7c475b8b',9175523488,''),(2,'Henriette','Dibbert','kheidenreich@example.com','ddb82269b268b5de13096786f94332fffa5a22f8',9528861467,'\0'),(3,'Jarod','Yost','roderick.keebler@example.net','29c3ab09230a89913e5700fdc8a42c86eb87cbb0',9268948368,''),(4,'Gudrun','Anderson','farrell.hermann@example.org','12a05f9a556998e181032d5ea039b10a42c8b269',9266861205,'\0'),(5,'Katelin','Mante','camron.hessel@example.net','52295b0ecf44dd7ba7d55a9294df46e8c3bcbe10',9967282422,'\0'),(6,'Bernadine','Emard','aurelio89@example.org','c07af440ef85fb71c91a940326aa518f7789c685',9503622911,''),(7,'Jovanny','Welch','zechariah81@example.com','d2540c559949deccbad8c48d97ca66f4d4c7e768',9702087084,''),(8,'Gabriel','Metz','yundt.lonnie@example.com','2a801802ffeb6e9dd770c96637948fac96144e75',9248899144,'\0'),(9,'Dagmar','Heaney','celestine.goodwin@example.org','971b2b5acc3473def9ed3c89b64faedbbbdd4a73',9296219748,''),(10,'Constance','Ankunding','fgrady@example.net','c09ba242846148aca4af64948b7e6abc66d3fcbc',9080097659,''),(11,'Tatum','Parker','zulauf.chelsea@example.com','7d2b8845a081a002c1b8f16b62bc1bfbcda3d8ea',9567895285,''),(12,'Derek','Predovic','vblick@example.com','d06a8b4023bc94c65e6370f5fdb02f48ce462ed2',9353029801,'\0'),(13,'Audreanne','Dietrich','williamson.vladimir@example.com','7f75a7d43f541ab3d801fe8527b2e59e0a4f03f2',9293160920,'\0'),(14,'Flavio','Goodwin','kub.torrey@example.net','e925d0ba840e1441b6be051d69a967ea9d5a089c',9039820144,''),(15,'Hellen','Jacobs','yokuneva@example.org','adda7dcd615c70a84367506d58f5cd32581d156c',9222022113,''),(16,'Aubrey','Friesen','isac94@example.org','3917cc34ecb3b9b0718a594d673f90ba14c7ad94',9608672508,'\0'),(17,'Efrain','Williamson','owyman@example.org','06f2aca2add848eb7aae308ae7e28e963354dbee',9040786346,''),(18,'Ted','Stark','qstoltenberg@example.org','76cc650dea1011ee04c8b1604e2160a8066b7dbf',9395947755,'\0'),(19,'Mitchell','Armstrong','zboncak.mozell@example.net','ea90b2647597db5028c296f6f9e382fd2bbbe816',9664593055,'\0'),(20,'Keely','Cormier','leland.grimes@example.com','34c90e53d3f0665512d7dc4664c9736784118eda',9331953454,''),(21,'Clinton','Wunsch','robert57@example.com','b04b07162b027cd68be299b45b24c25c28715f1e',9296037099,''),(22,'Kadin','Johnston','mo\'reilly@example.net','0714442a626848e78d5cb515943b12085228be8c',9689431364,'\0'),(23,'Maximilian','Konopelski','karen.luettgen@example.net','75e57990f90c7b0a44a67cd4a0ebf6ad8e4318ed',9762418700,'\0'),(24,'Sallie','Stokes','luis.christiansen@example.com','0faf4cdd761f8938ce3bbe7e5a8de67a9671a2fc',9415276213,''),(25,'Javier','Heller','annetta.mckenzie@example.org','650f920213ed58f31acdfef9795bc3c80573ca10',9415583629,''),(26,'Chasity','Carter','caleigh14@example.net','5c555c687cddf393238f2233e35cb89686aef96b',9767583481,'\0'),(27,'Aisha','McCullough','frunte@example.com','47899c8e969e2ce63638badab82cc95a5572158c',9743536427,'\0'),(28,'Teresa','Fadel','runolfsson.harrison@example.net','ccd84aafddd7278e1c2fc0a0d79f450ef03ea26e',9175912245,''),(29,'Hillary','Wuckert','graham.jewell@example.org','1efd69ded293a322c3cc9afe0dac6e3342961509',9997375157,''),(30,'Lorena','Fritsch','baumbach.eldridge@example.net','9378b0527663be0ab146095279eacbe4129238ed',9963232615,''),(31,'Dudley','VonRueden','mokuneva@example.com','81e159ffb0a00cc5df9bbcba9be4eb2f048c6112',9318696847,'\0'),(32,'Reymundo','Ward','quigley.kylie@example.net','e851bc089776b4ac130e92b81d3f55bc7df00a1d',9990288912,'\0'),(33,'Elinor','Walker','kiara21@example.com','9c083f6ece1bb167aaf554e89482f906ed654037',9851709739,'\0'),(34,'Lemuel','Fadel','nreynolds@example.org','3476a24c3896e2026b5044a51e0b2b78feeee444',9078135315,''),(35,'Gabe','Fisher','willis85@example.com','4cc0f4ebeeb74b1d1b81c20c7304574b631c4aca',9258446140,''),(36,'Gavin','Swaniawski','anthony54@example.com','6cf76259de989811862e1fb2eea3f09183dd06ae',9542643456,'\0'),(37,'Holly','Bartell','emard.christelle@example.org','d8ab2372ebaf39794a8d8a83c27f0c11e1f0ad82',9566432823,'\0'),(38,'Katelynn','Gleichner','stanford.boyer@example.com','fba0b274f2788f2ce4825dc8be537c3e542265c6',9780681368,''),(39,'Moriah','Hills','jaclyn.zieme@example.net','89bc2f9d07e6fbef89ea8f1b01b09c3340d5f39a',9247590714,''),(40,'Garrison','Roberts','obaumbach@example.net','bb079cbcb08547033e06822bdd71a090b30eed94',9736596169,'\0'),(41,'Marquise','Ledner','bechtelar.candido@example.com','6b0b1a9f5ef6ec8b28e639aad170e74419f630df',9209336639,''),(42,'Lolita','Crooks','zmarvin@example.com','0f084b90f7e5960a599c86aa089d633adab99171',9475700389,'\0'),(43,'Narciso','Schimmel','vesta83@example.net','9228992287b448f3c224fe5c906e08bc85bb8a9e',9458814649,''),(44,'Nellie','Lehner','dax71@example.net','2db26dfa93b92bf4b306ca18f2a07b88ac937837',9503663857,'\0'),(45,'Aniyah','Sporer','leonora.hodkiewicz@example.org','9c5ddced3ad6d6155cc8cdef793c3bb0b1cea78b',9744081487,''),(46,'Jose','Rice','elza13@example.net','dbfe7c36a9ebc195980eba73b78beae0fcb27061',9216270472,'\0'),(47,'Alexa','Block','dare.ralph@example.org','0372f058ed7b261cacac3df339f831a971661fba',9045273230,''),(48,'Rylan','Skiles','dandre.weber@example.net','930a96cdb987237751cc33e2905ac329d526c866',9082291455,''),(49,'Tyree','Hackett','ubalistreri@example.net','3313fd849ff9c7c2216ba2b523685925754b3f6f',9503330536,'\0'),(50,'Blanche','Wolff','lane02@example.net','3378c5c85011ffdbbd180c400c850f89d8730b13',9617087890,'');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_communities`
--

DROP TABLE IF EXISTS `users_communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_communities` (
  `user_id` bigint(20) unsigned NOT NULL,
  `community_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`community_id`),
  KEY `community_id` (`community_id`),
  CONSTRAINT `users_communities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `users_communities_ibfk_2` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_communities`
--

LOCK TABLES `users_communities` WRITE;
/*!40000 ALTER TABLE `users_communities` DISABLE KEYS */;
INSERT INTO `users_communities` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20),(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),(27,27),(28,28),(29,29),(30,30),(31,31),(32,32),(33,33),(34,34),(35,35),(36,36),(37,37),(38,38),(39,39),(40,40),(41,41),(42,42),(43,43),(44,44),(45,45),(46,46),(47,47),(48,48),(49,49),(50,50);
/*!40000 ALTER TABLE `users_communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_discussing_topic`
--

DROP TABLE IF EXISTS `users_discussing_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_discussing_topic` (
  `user_id` bigint(20) unsigned NOT NULL,
  `discussing_topic_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`discussing_topic_id`),
  KEY `discussing_topic_id` (`discussing_topic_id`),
  CONSTRAINT `users_discussing_topic_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `users_discussing_topic_ibfk_2` FOREIGN KEY (`discussing_topic_id`) REFERENCES `discussing_topic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_discussing_topic`
--

LOCK TABLES `users_discussing_topic` WRITE;
/*!40000 ALTER TABLE `users_discussing_topic` DISABLE KEYS */;
INSERT INTO `users_discussing_topic` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20),(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),(27,27),(28,28),(29,29),(30,30),(31,31),(32,32),(33,33),(34,34),(35,35),(36,36),(37,37),(38,38),(39,39),(40,40),(41,41),(42,42),(43,43),(44,44),(45,45),(46,46),(47,47),(48,48),(49,49),(50,50);
/*!40000 ALTER TABLE `users_discussing_topic` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-07 14:48:03
