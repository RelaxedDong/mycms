-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: mycms
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `advertisement`
--

DROP TABLE IF EXISTS `advertisement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advertisement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` varchar(100) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `img_url` varchar(400) DEFAULT NULL,
  `link_url` varchar(200) DEFAULT NULL,
  `is_using` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisement`
--

LOCK TABLES `advertisement` WRITE;
/*!40000 ALTER TABLE `advertisement` DISABLE KEYS */;
INSERT INTO `advertisement` VALUES (1,'2','2018-09-29 17:43:47','https://oimagec3.ydstatic.com/image?id=-4079072378446082542&product=adpublish&w=300&h=250&sc=0&rm=0','https://ke.youdao.com/course/detail/12957?outVendor=sdksy_syyy_waibu_doubanpc_banner_12957_2_12f85e1f-9dd8-4548-a744-f8913b62334f_294256',1),(7,'2','2018-09-29 17:54:05','http://img06.tooopen.com/images/20180825/tooopen_sl_172656265613217.jpg','http://img06.tooopen.com/images/20180825/tooopen_sl_172656265613217.jpg',0),(9,'2','2018-10-13 16:21:11','http://pages.c-ctrip.com/hotel/201805/thailand/220330.jpg','http://hotels.ctrip.com/events/2018thailandtesty1pc#ctm_ref=ssc_hp_htl_sni_txt_5',1);
/*!40000 ALTER TABLE `advertisement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `see_count` int(11) DEFAULT NULL,
  `desc` text,
  `author_id` varchar(150) DEFAULT NULL,
  `power` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `album_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `front_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (1,'烟火一样的美丽','2018-09-22 14:41:50',174,'第一个相册哦~','ysNWsnHoG8p2EGzEXKvaCj',1),(2,'神龙潭','2018-09-22 21:07:24',158,'织金洞景区','HF2GpEcvkpTbW6qbyc9TMf',0),(3,'美食回顾','2018-09-22 21:21:27',5,'2013 美食回顾','mLVKzNwXjNUx9B2Nsthp9F',0),(4,' 西来古镇 ','2018-09-22 21:24:40',3,'西来古镇位于四川省成都市蒲江县境内，不仅完整地保持着大量明清时期的川西民居，还有12棵声名远播的千年古榕。西来历史悠久，原为临溪县治地，距今已有1700多年的历史。','AaPykFXjjwquWaoHtVDumS',0),(5,'一个萌萌的学生会主席','2018-09-22 21:26:38',21,'在郑州师范学院教学楼里拍的一位非常萌的妹子，还是学生会主席。','zRBQfUrUWmfX9W5JsEs23V',0),(6,'幻境','2018-09-22 21:28:55',2,'抛开现实中的一切杂念，进入幻想在梦境，在现实与幻想之间游离！','kY2ZPxXTwkqLU5muCPcgA5',0),(7,'嘘~~别吱声...','2018-09-22 21:30:32',6,'他专注且活泼，柔韧而敏捷，肌肉发达但不笨重。被毛中等长度，粗硬。断尾或自然的短尾巴。','FNdFhqoMAjAnGH8sNJySXB',0),(8,'渐暖','2018-09-22 21:33:07',0,'摄影展区 > 植物\n','LNhDD3XjqoeNS9HqhSDzyQ',0),(9,'乳白色清晨','2018-09-22 21:34:59',7,'阳光满屋的清晨心情都不错！','xBzNaGs62R9RbHzPA6nZzC',0),(10,'金秋的满都海公园','2018-09-22 21:36:41',6,'去年秋天拍满都海公园是在国庆节期间，今年太忙了，国庆没能去拍。这周天气不错，抱着试试看的想法去了一趟公园，没想到由于天气转凉比较缓慢，我有幸拍到了金色的旱柳.','5ABqQEnhMzAAdcPM3CPYBQ',0),(11,' 英伦海岸','2018-09-22 21:39:11',0,'行走间，记录下大不列颠这座神奇岛屿无与伦比的海岸光影。','eKf4NyNtLko9fiaL2gvfy6',0),(12,'第一个相册','2018-09-23 11:19:28',18,'第二个相册','ysNWsnHoG8p2EGzEXKvaCj',0),(13,' 浮生若梦 ','2018-09-24 21:48:48',3,'“夫天地者，万物之逆旅也；光阴者，百代之过客也。而浮生若梦，为欢几何。”','HF2GpEcvkpTbW6qbyc9TMf',0),(14,'静等花开，知花语','2018-09-24 21:50:01',1,'光影雕刻的模样 关于薰衣草的梦 如花开般无声 却如阳光般灿烂 闭上眼睛 还能看见你在等我的模样 我们刻骨铭心的记忆 别人却早已忘记','FNdFhqoMAjAnGH8sNJySXB',0),(15,'HK聖誕燈飾','2018-09-24 21:51:52',1,'今年沒去年給力，隨便拍了一些···','AaPykFXjjwquWaoHtVDumS',0),(16,'雨一直的下','2018-09-24 21:55:18',1,'南京，多雨，黄梅天。','VSwcS6gb7h3qQbkWTcYyWL',0),(17,'夕阳下的冰雪雕塑','2018-09-24 21:58:19',0,' 黑龙江 哈尔滨','mLVKzNwXjNUx9B2Nsthp9F',0),(18,'少女日记','2018-09-24 22:00:30',5,'少女日记 第一章节','zRBQfUrUWmfX9W5JsEs23V',0),(19,'第二个相册','2018-09-24 22:06:33',4,'mememe','ysNWsnHoG8p2EGzEXKvaCj',1),(20,'呼伦贝尔','2018-10-09 21:04:12',3,' 内蒙古 呼伦贝尔 ','VSwcS6gb7h3qQbkWTcYyWL',0),(21,'腾龙洞','2018-10-05 22:25:17',33,'恩施土家族苗族自治州腾龙洞    晴','ysNWsnHoG8p2EGzEXKvaCj',0),(22,'三峡人家','2018-10-02 23:30:46',0,'宜昌市三峡人家风景区  多云','ysNWsnHoG8p2EGzEXKvaCj',0),(23,'龙缸','2018-03-24 23:34:26',0,'云阳龙缸风景区  多云','ysNWsnHoG8p2EGzEXKvaCj',0),(24,'恩施大峡谷','2018-07-14 20:34:51',2,'湖北恩施大峡谷风景区  多云','ysNWsnHoG8p2EGzEXKvaCj',0);
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `album_comment`
--

DROP TABLE IF EXISTS `album_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `album_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `album_id` int(11) DEFAULT NULL,
  `author_id` varchar(100) DEFAULT NULL,
  `origin_comment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `album_id` (`album_id`),
  KEY `author_id` (`author_id`),
  KEY `origin_comment_id` (`origin_comment_id`),
  CONSTRAINT `album_comment_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `album` (`id`),
  CONSTRAINT `album_comment_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `front_user` (`id`),
  CONSTRAINT `album_comment_ibfk_3` FOREIGN KEY (`origin_comment_id`) REFERENCES `album_comment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album_comment`
--

LOCK TABLES `album_comment` WRITE;
/*!40000 ALTER TABLE `album_comment` DISABLE KEYS */;
INSERT INTO `album_comment` VALUES (10,'666','2018-09-23 19:03:58',1,'ysNWsnHoG8p2EGzEXKvaCj',NULL),(22,'好看','2018-10-10 11:26:58',21,'ysNWsnHoG8p2EGzEXKvaCj',NULL),(23,'好看','2018-10-12 11:45:43',2,'ysNWsnHoG8p2EGzEXKvaCj',NULL);
/*!40000 ALTER TABLE `album_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `album_star`
--

DROP TABLE IF EXISTS `album_star`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `album_star` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `album_id` int(11) DEFAULT NULL,
  `author_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `album_id` (`album_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `album_star_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `album` (`id`),
  CONSTRAINT `album_star_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `front_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album_star`
--

LOCK TABLES `album_star` WRITE;
/*!40000 ALTER TABLE `album_star` DISABLE KEYS */;
INSERT INTO `album_star` VALUES (1,2,'ysNWsnHoG8p2EGzEXKvaCj'),(2,2,'eKf4NyNtLko9fiaL2gvfy6'),(3,1,'ysNWsnHoG8p2EGzEXKvaCj'),(4,5,'ysNWsnHoG8p2EGzEXKvaCj'),(5,10,'ysNWsnHoG8p2EGzEXKvaCj');
/*!40000 ALTER TABLE `album_star` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `album_tag`
--

DROP TABLE IF EXISTS `album_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `album_tag` (
  `album_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`album_id`,`tag_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `album_tag_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `album` (`id`),
  CONSTRAINT `album_tag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `img_tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album_tag`
--

LOCK TABLES `album_tag` WRITE;
/*!40000 ALTER TABLE `album_tag` DISABLE KEYS */;
INSERT INTO `album_tag` VALUES (1,3),(1,4),(5,4),(24,4),(4,5),(1,6),(4,6),(5,7),(3,8),(15,9),(13,10),(14,11),(16,12),(21,12),(16,13),(6,14),(10,15),(2,16),(10,16),(12,16),(20,16),(17,17),(17,18);
/*!40000 ALTER TABLE `album_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alembic_version`
--

DROP TABLE IF EXISTS `alembic_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alembic_version`
--

LOCK TABLES `alembic_version` WRITE;
/*!40000 ALTER TABLE `alembic_version` DISABLE KEYS */;
INSERT INTO `alembic_version` VALUES ('b66256cc250d');
/*!40000 ALTER TABLE `alembic_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banner`
--

DROP TABLE IF EXISTS `banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `img_url` varchar(200) DEFAULT NULL,
  `link_url` varchar(200) DEFAULT NULL,
  `content` text,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner`
--

LOCK TABLES `banner` WRITE;
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
INSERT INTO `banner` VALUES (1,'donghao',2,'https://donghaocms.oss-cn-beijing.aliyuncs.com/20180915183301timg.jpg','https://www.baidu.com','Dohoom站点','2018-09-06 20:27:11'),(7,'donghao',1,'https://donghaocms.oss-cn-beijing.aliyuncs.com/20180915180030we.jpg','www.baidu.com','Dohoom站点','2018-09-15 18:00:43'),(8,'donghao',2,'https://donghaocms.oss-cn-beijing.aliyuncs.com/20180924171444timg.jpg','www.baidu.com','Dohoom站点','2018-09-15 18:01:11');
/*!40000 ALTER TABLE `banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_user`
--

DROP TABLE IF EXISTS `cms_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `_password` varchar(150) NOT NULL,
  `email` varchar(50) NOT NULL,
  `join_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_user`
--

LOCK TABLES `cms_user` WRITE;
/*!40000 ALTER TABLE `cms_user` DISABLE KEYS */;
INSERT INTO `cms_user` VALUES (2,'donghao','pbkdf2:sha256:50000$EtID0v0f$be150ea9af54d7625a6a9fa9ee2e37a92b55f0f25bc5f17ffd66e777d955209a','1417766861@qq.com','2018-08-25 22:24:01');
/*!40000 ALTER TABLE `cms_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collect`
--

DROP TABLE IF EXISTS `collect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collect_time` datetime DEFAULT NULL,
  `post_id` varchar(150) DEFAULT NULL,
  `author_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `collect_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `front_user` (`id`),
  CONSTRAINT `collect_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collect`
--

LOCK TABLES `collect` WRITE;
/*!40000 ALTER TABLE `collect` DISABLE KEYS */;
INSERT INTO `collect` VALUES (15,'2018-09-08 12:18:24','CiKycWfSSo3F79To7AcXgJ','ysNWsnHoG8p2EGzEXKvaCj'),(16,'2018-09-08 14:06:14','v5Y9FL5vTsoGbV9TVtVvCY','mLVKzNwXjNUx9B2Nsthp9F'),(17,'2018-09-09 09:59:31','tKsuqedKJgqwNRVg2iPHm2','ysNWsnHoG8p2EGzEXKvaCj'),(18,'2018-09-10 22:59:09','rcXjxFCFZQRoXgp7Gchnjm','ysNWsnHoG8p2EGzEXKvaCj'),(20,'2018-09-15 21:55:16','xQhRxekV7b224KS6GgPswW','HF2GpEcvkpTbW6qbyc9TMf'),(21,'2018-09-19 09:57:16','igiyooy8r5ytgNdEikudSE','HF2GpEcvkpTbW6qbyc9TMf'),(22,'2018-09-21 17:21:11','9vvMtCh3QKevqyvg5vinuY','ysNWsnHoG8p2EGzEXKvaCj'),(23,'2018-09-25 15:52:04','xRt8fdQo7qo3A48fn6U7Vk','ysNWsnHoG8p2EGzEXKvaCj'),(32,'2018-10-14 10:13:30','cZBezRxAkvK63aLLfcF3rn','ysNWsnHoG8p2EGzEXKvaCj');
/*!40000 ALTER TABLE `collect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `post_id` varchar(150) DEFAULT NULL,
  `author_id` varchar(100) DEFAULT NULL,
  `origin_comment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  KEY `origin_comment_id` (`origin_comment_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `front_user` (`id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`origin_comment_id`) REFERENCES `comment` (`id`),
  CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (35,'12','2018-09-08 12:18:26','CiKycWfSSo3F79To7AcXgJ','ysNWsnHoG8p2EGzEXKvaCj',NULL),(36,'111','2018-09-08 14:06:17','v5Y9FL5vTsoGbV9TVtVvCY','mLVKzNwXjNUx9B2Nsthp9F',NULL),(37,'12','2018-09-09 10:35:56','v5Y9FL5vTsoGbV9TVtVvCY','mLVKzNwXjNUx9B2Nsthp9F',NULL),(38,'12','2018-09-09 10:36:03','A2728FV98M7NnHcMzp7ZMA','mLVKzNwXjNUx9B2Nsthp9F',NULL),(39,'666','2018-09-09 10:36:11','QXtq2ZNotCvpHiRs6YsctY','mLVKzNwXjNUx9B2Nsthp9F',NULL),(40,'ad','2018-09-09 10:36:18','ryh5UtWYgRd3bhbqNRQdrK','mLVKzNwXjNUx9B2Nsthp9F',NULL),(41,'fg','2018-09-09 10:36:28','PcFfgriHaZWr66ohovfwzn','mLVKzNwXjNUx9B2Nsthp9F',NULL),(42,'12','2018-09-09 10:37:00','PcFfgriHaZWr66ohovfwzn','mLVKzNwXjNUx9B2Nsthp9F',NULL),(55,'asfd','2018-09-19 09:58:00','igiyooy8r5ytgNdEikudSE','HF2GpEcvkpTbW6qbyc9TMf',NULL),(56,'在许昌这些','2018-10-14 10:13:33','cZBezRxAkvK63aLLfcF3rn','ysNWsnHoG8p2EGzEXKvaCj',NULL);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `error`
--

DROP TABLE IF EXISTS `error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `error` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `reporter` varchar(150) NOT NULL,
  `bereporter` varchar(150) NOT NULL,
  `content` text NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `place` varchar(150) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `error`
--

LOCK TABLES `error` WRITE;
/*!40000 ALTER TABLE `error` DISABLE KEYS */;
INSERT INTO `error` VALUES (4,'帖子','ysNWsnHoG8p2EGzEXKvaCj','FNdFhqoMAjAnGH8sNJySXB','园区内目前还有许多新修的项目，与实际不符','2018-10-14 15:20:31','http://127.0.0.1:5000/post_detail/Jq9Evr3WeCLASx3kQoFhYJ/?lang=ch',1),(5,'相册','PtwqBv4uHUYnDMqkA2NFkX','HF2GpEcvkpTbW6qbyc9TMf','盗用他人图片，请严肃处理！','2018-10-14 15:21:22','http://127.0.0.1:5000/b/album_detail/2',0),(6,'帖子','LNhDD3XjqoeNS9HqhSDzyQ','kY2ZPxXTwkqLU5muCPcgA5','盗用他人帖子信息~~~','2018-10-14 15:24:34','http://127.0.0.1:5000/post_detail/xRt8fdQo7qo3A48fn6U7Vk/?lang=ch',0);
/*!40000 ALTER TABLE `error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `focus`
--

DROP TABLE IF EXISTS `focus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `focus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `focus_time` datetime DEFAULT NULL,
  `own_user_id` varchar(150) NOT NULL,
  `author_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `focus_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `front_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `focus`
--

LOCK TABLES `focus` WRITE;
/*!40000 ALTER TABLE `focus` DISABLE KEYS */;
INSERT INTO `focus` VALUES (12,'2018-09-18 20:00:47','ysNWsnHoG8p2EGzEXKvaCj','FNdFhqoMAjAnGH8sNJySXB'),(14,'2018-09-18 20:01:02','ysNWsnHoG8p2EGzEXKvaCj','mLVKzNwXjNUx9B2Nsthp9F'),(16,'2018-09-18 20:01:12','ysNWsnHoG8p2EGzEXKvaCj','zRBQfUrUWmfX9W5JsEs23V'),(17,'2018-09-18 20:01:24','ysNWsnHoG8p2EGzEXKvaCj','LNhDD3XjqoeNS9HqhSDzyQ'),(18,'2018-09-18 20:08:10','ysNWsnHoG8p2EGzEXKvaCj','VSwcS6gb7h3qQbkWTcYyWL'),(37,'2018-09-18 21:46:22','VSwcS6gb7h3qQbkWTcYyWL','AaPykFXjjwquWaoHtVDumS'),(38,'2018-09-18 21:46:35','ysNWsnHoG8p2EGzEXKvaCj','AaPykFXjjwquWaoHtVDumS'),(41,'2018-09-19 09:57:10','ysNWsnHoG8p2EGzEXKvaCj','HF2GpEcvkpTbW6qbyc9TMf'),(68,'2018-09-25 16:36:16','kY2ZPxXTwkqLU5muCPcgA5','ysNWsnHoG8p2EGzEXKvaCj'),(73,'2018-10-14 10:13:26','HF2GpEcvkpTbW6qbyc9TMf','ysNWsnHoG8p2EGzEXKvaCj');
/*!40000 ALTER TABLE `focus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `front_user`
--

DROP TABLE IF EXISTS `front_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `front_user` (
  `id` varchar(100) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `_password` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `realname` varchar(50) DEFAULT NULL,
  `telephone` varchar(11) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `signature` text,
  `join_time` datetime DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `nickname` varchar(100) DEFAULT NULL,
  `old_avater` varchar(300) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `my_web` varchar(100) DEFAULT NULL,
  `charactors` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `front_user`
--

LOCK TABLES `front_user` WRITE;
/*!40000 ALTER TABLE `front_user` DISABLE KEYS */;
INSERT INTO `front_user` VALUES ('5ABqQEnhMzAAdcPM3CPYBQ','user9','pbkdf2:sha256:50000$1awxIzcH$7bab377c947882f5f4860a3814887a845fc31c2807f3d263b4d82500fdf72659','user9@qq.com',NULL,NULL,NULL,'https://donghaocms.oss-cn-beijing.aliyuncs.com/avater/default.jpg','这家伙很懒，什么都没有留下~','2018-09-12 10:00:58',2,'新用户1',NULL,'秘密',NULL,0,0,'广西-南宁市-市辖区','#ffffff'),('7SWuncBDfghCL9rdFu3NHP','moran','pbkdf2:sha256:50000$l77CHfvl$12a7a085376cd69fbd8d1eb1216487372961b0fa22478b468c79bb66f2534af2','m2345691@126.com',NULL,NULL,NULL,'https://donghaocms.oss-cn-beijing.aliyuncs.com/avater/2018091421451621.jpg','这家伙很懒，什么都没有留下~','2018-09-14 21:43:18',2,'moran',NULL,'秘密',NULL,517,1,'北京-市辖区-海淀区','#ffffff'),('AaPykFXjjwquWaoHtVDumS','user1','pbkdf2:sha256:50000$Ffg3COz3$49bdc8c69ff2d35fad7a036aaeffa6d791891782dabadefc1cf1007c1e4700b4','user1@qq.com','',NULL,'None','https://donghaocms.oss-cn-beijing.aliyuncs.com/avater/2018091423235616.jpg','这家伙很懒，什么都没有留下~','2018-09-12 09:55:33',2,' 熊笨熊二',NULL,'女','None',275,1,'浙江-杭州市-市辖区','#ffffff'),('AY7DfpfrWVN9v5tnv3LVXK','董豪','pbkdf2:sha256:50000$AMTrVW6h$976d9baa306c8a7f437ad637cc874c001862f951c982d1d1cd930dd36174e457','407257357@qq.com',NULL,NULL,NULL,'https://donghaocms.oss-cn-beijing.aliyuncs.com/avater/2018091422452079.jpg','这家伙很懒，什么都没有留下~','2018-09-14 22:44:27',0,'董豪',NULL,'秘密',NULL,1262,1,'河南-信阳市-潢川县','#ffffff'),('eKf4NyNtLko9fiaL2gvfy6','user10','pbkdf2:sha256:50000$ZSUG75EM$8c9515265794a22acf1471ac547151907560063b39a9f5203606cd70527297ff','user10@qq.com',NULL,NULL,NULL,'https://donghaocms.oss-cn-beijing.aliyuncs.com/avater/default.jpg','这家伙很懒，什么都没有留下~','2018-09-12 10:01:06',0,'新用户3',NULL,'秘密',NULL,85,1,'宁夏-银川市-市辖区','#ffffff'),('FNdFhqoMAjAnGH8sNJySXB','user5','pbkdf2:sha256:50000$cRsGFyS9$8f3c52e22a325d0dfa43a795fc4e6651086ba9723a63c2ce8187af4c4d234c9a','user5@qq.com',NULL,NULL,NULL,'https://donghaocms.oss-cn-beijing.aliyuncs.com/avater/20180915202928e.jpg','这家伙很懒，什么都没有留下~','2018-09-12 10:00:27',4,'小姐姐',NULL,'秘密',NULL,1264,1,'重庆-市辖区-万州区','#ffffff'),('HF2GpEcvkpTbW6qbyc9TMf',NULL,'pbkdf2:sha256:50000$ZPuGEe07$ceb37c11013f5e303702d668dc8957a3c38dca566a8fe23ab6b5c73b4c6953f7','1228903468@qq.com','未填写',NULL,'未填写','https://donghaocms.oss-cn-beijing.aliyuncs.com/avater/20180915214938s.jpg','这家伙很懒，什么都没有留下~','2018-09-15 16:31:28',10,'花心坏',NULL,'秘密',NULL,41,1,'贵州-贵阳市-市辖区','#ffffff'),('kY2ZPxXTwkqLU5muCPcgA5','user3','pbkdf2:sha256:50000$wC6KqT86$929f08315aaf7a757c41a814e6f8d853dfd70bb9751e0236a218dd4d3ffc6088','user3@qq.com',NULL,NULL,NULL,'https://donghaocms.oss-cn-beijing.aliyuncs.com/avater/20180915202833w.jpg','这家伙很懒，什么都没有留下~','2018-09-12 09:55:54',2,' 懒鹅-N443',NULL,'秘密',NULL,973,1,'四川-成都市-市辖区','#ffffff'),('LNhDD3XjqoeNS9HqhSDzyQ','user7','pbkdf2:sha256:50000$NVBz9gIm$d57eefc099b8514cd74e31e80b4ea586a5d024f9cae4c572f4a478f5021dfb8a','user7@qq.com',NULL,NULL,NULL,'https://donghaocms.oss-cn-beijing.aliyuncs.com/avater/20180916174012x.jpg','这家伙很懒，什么都没有留下~','2018-09-12 10:00:44',0,'笑笑笑',NULL,'秘密',NULL,162,1,'甘肃-兰州市-市辖区','#ffffff'),('mLVKzNwXjNUx9B2Nsthp9F','tanyajuan','pbkdf2:sha256:50000$gvwW9zrh$3e3556adebaf0de21178030fdddc1fbf88d764385337a661d9ce921e8033986d','1585743021@qq.com','谭雅娟',NULL,'1585743021','https://donghaocms.oss-cn-beijing.aliyuncs.com/avater/20180908140552TX.jpg','None','2018-08-31 10:27:48',30,'最漂亮的猪',NULL,'秘密','None',251,1,'重庆-市辖区-万州区','#ffffff'),('PtwqBv4uHUYnDMqkA2NFkX','user4','pbkdf2:sha256:50000$7jAEiLdn$d85d3c7a378a55838395fa4116864b72e9bc3929557965befd08e65dc5a8fcf5','user4@qq.com',NULL,NULL,NULL,'https://donghaocms.oss-cn-beijing.aliyuncs.com/avater/default.jpg','这家伙很懒，什么都没有留下~','2018-09-12 10:00:18',0,'新用户7',NULL,'秘密',NULL,954,1,'湖南-长沙市-长沙县','#ffffff'),('VSwcS6gb7h3qQbkWTcYyWL','user6','pbkdf2:sha256:50000$xk33twC8$d5ed239ae3a977f547f0193e8a231cba15ac6b9d851a0ff41e5bc58b075083d3','user6@qq.com',NULL,NULL,NULL,'https://donghaocms.oss-cn-beijing.aliyuncs.com/avater/20180915203432r.jpg','这家伙很懒，什么都没有留下~','2018-09-12 10:00:36',2,'月半弯',NULL,'秘密',NULL,22,1,'云南-昆明市-市辖区','#ffffff'),('xBzNaGs62R9RbHzPA6nZzC','user8','pbkdf2:sha256:50000$g7OncGnz$3920976682410146de4d3da724bad779e2402d986116717ae8a753527f011f4d','user8@qq.com',NULL,NULL,NULL,'https://donghaocms.oss-cn-beijing.aliyuncs.com/avater/20180916174129z.jpg','这家伙很懒，什么都没有留下~','2018-09-12 10:00:51',0,'等一个人',NULL,'秘密',NULL,1495,1,'重庆-市辖区-万州区','#ffffff'),('ysNWsnHoG8p2EGzEXKvaCj','donghao','pbkdf2:sha256:50000$fHlCCypc$634617a8fa153d71761dbfaf514884fe638f419fda006d7f1ca4f5e6be6f1025','1417766861@qq.com','董豪',NULL,'14177668861','https://donghaocms.oss-cn-beijing.aliyuncs.com/avater/2018092416575620.jpg','我就是我，不一样的烟火火','2018-08-28 13:01:43',155,'最美的烟火',NULL,'男','http://www.donghao.club',0,1,'重庆-市辖区-万州区','#ffffff'),('zRBQfUrUWmfX9W5JsEs23V','user2','pbkdf2:sha256:50000$aFfLs6wj$174c445dca9fff63ff003e57c2ee811c28dd06f6c01808874ec3cb57c44e7b99','user2@qq.com',NULL,NULL,NULL,'https://donghaocms.oss-cn-beijing.aliyuncs.com/avater/20180915200126q.jpg','这家伙很懒，什么都没有留下~','2018-09-12 09:55:46',2,'敏敏剑仙',NULL,'秘密',NULL,589,1,'湖北-武汉市-市辖区','#ffffff');
/*!40000 ALTER TABLE `front_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(100) NOT NULL,
  `point` int(11) DEFAULT NULL,
  `desc` text,
  `avatar` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES (2,'旅游组','2018-09-16 16:01:32','ysNWsnHoG8p2EGzEXKvaCj',216,'旅游小组，爱旅行，爱生活（旅游，驴友，骑行，穷游) ','https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3121353256,3417346115&fm=200&gp=0.jpg'),(3,'摄影小组','2018-09-16 16:04:01','ysNWsnHoG8p2EGzEXKvaCj',110,'摄影交流.分享','https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1564728592,1146430848&fm=27&gp=0.jpg'),(5,'美食','2018-09-17 08:54:51','ysNWsnHoG8p2EGzEXKvaCj',12,'吃喝玩乐','https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2928323508,191152411&fm=27&gp=0.jpg'),(6,'记录旅途中的风景','2018-09-18 22:56:22','FNdFhqoMAjAnGH8sNJySXB',20,'将自己觉得美，觉得有意义的风景照分享出来，最好配上一段文字。\r\n\r\n每一张照片都是一段故事，一种心情。\r\n\r\n记录旅途中的风景，分享照片，寻找共鸣，期待你的参与。','https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=267168189,3441090847&fm=200&gp=0.jpg');
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_manage`
--

DROP TABLE IF EXISTS `group_manage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_manage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `author_id` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `group_manage_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `front_user` (`id`),
  CONSTRAINT `group_manage_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_manage`
--

LOCK TABLES `group_manage` WRITE;
/*!40000 ALTER TABLE `group_manage` DISABLE KEYS */;
INSERT INTO `group_manage` VALUES (9,2,'FNdFhqoMAjAnGH8sNJySXB'),(10,6,'ysNWsnHoG8p2EGzEXKvaCj'),(14,3,'LNhDD3XjqoeNS9HqhSDzyQ'),(15,3,'VSwcS6gb7h3qQbkWTcYyWL'),(18,3,'HF2GpEcvkpTbW6qbyc9TMf');
/*!40000 ALTER TABLE `group_manage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hightlight_post`
--

DROP TABLE IF EXISTS `hightlight_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hightlight_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` varchar(150) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `hightlight_post_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=791 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hightlight_post`
--

LOCK TABLES `hightlight_post` WRITE;
/*!40000 ALTER TABLE `hightlight_post` DISABLE KEYS */;
INSERT INTO `hightlight_post` VALUES (783,'v5Y9FL5vTsoGbV9TVtVvCY','2018-10-13 12:30:07'),(789,'gcbxu9aUHFc4uASkC9Kr5Y','2018-10-13 12:31:09'),(790,'xRt8fdQo7qo3A48fn6U7Vk','2018-10-13 12:52:17');
/*!40000 ALTER TABLE `hightlight_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(150) DEFAULT NULL,
  `album_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `album_id` (`album_id`),
  CONSTRAINT `image_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `album` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (7,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809222047576E17C9423D367B327FD6715ECA4D8687.jpg9a622fbfcd.jpg',1,'2018-09-22 20:48:05'),(9,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/2018092220475824D538C2FFB474665921863AD17971C7.jpgef75828716.jpg',1,'2018-09-22 20:48:06'),(10,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/2018092220480542D191EEE0FD7DE28196D014154F8069.jpgd75310fd28.jpg',1,'2018-09-22 20:48:06'),(11,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809222119516597634915635713059.jpgb3baec9f7a.jpg',2,'2018-09-22 21:19:53'),(12,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809222119516608217715052491362.jpgdc43aff321.jpg',2,'2018-09-22 21:19:53'),(13,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809222119516632699440956570521.jpgcf241c2853.jpg',2,'2018-09-22 21:19:53'),(14,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/20180922212337631629847756634470.jpgd5e54b6e4d.jpg',3,'2018-09-22 21:23:38'),(15,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809222123373092002619184611343.jpg2b99332265.jpg',3,'2018-09-22 21:23:38'),(16,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809222123376597322654332609796.jpg9c2a04ab4b.jpg',3,'2018-09-22 21:23:38'),(17,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809222125166599292979168744025.jpg327b66287d.jpg',4,'2018-09-22 21:25:18'),(18,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809222125176599294078680371831.jpg1480be6f20.jpg',4,'2018-09-22 21:25:18'),(19,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809222125176599328163540827740.jpgca1b7523af.jpg',4,'2018-09-22 21:25:18'),(20,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809222125176608239705283481401.jpgabccac26c5.jpg',4,'2018-09-22 21:25:18'),(21,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809222127196630570786443677435.jpg0e65e09b3e.jpg',5,'2018-09-22 21:27:19'),(22,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809222127196630730215629707427.jpg0fd10ca675.jpg',5,'2018-09-22 21:27:19'),(23,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809222127196630784091699466533.jpgd6c8d04963.jpg',5,'2018-09-22 21:27:19'),(24,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809222129281317865840977114750.jpg94e3fb4794.jpg',6,'2018-09-22 21:29:28'),(25,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809222129283078491820302259881.jpg84e2ca2c13.jpg',6,'2018-09-22 21:29:29'),(26,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809222129286597466690353928720.jpg97b8557776.jpg',6,'2018-09-22 21:29:29'),(30,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809222132056597158827098891242.jpg0ed6fddcc4.jpg',7,'2018-09-22 21:32:05'),(31,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809222132056597362236749893846.jpg097188c5af.jpg',7,'2018-09-22 21:32:05'),(32,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809222132056597445799632770103.jpgde20fae050.jpg',7,'2018-09-22 21:32:05'),(33,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809222133363876754854335977149.jpga243ea46cc.jpg',8,'2018-09-22 21:33:37'),(34,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809222133363911939226424835097.jpgf9d724ab09.jpg',8,'2018-09-22 21:33:37'),(35,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809222133366597730573146367893.jpg803b424fd0.jpg',8,'2018-09-22 21:33:37'),(36,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809222133366597783349704508248.jpgfff1809d82.jpg',8,'2018-09-22 21:33:37'),(37,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809222135302571273912269711515.jpg47222620f1.jpg',9,'2018-09-22 21:35:30'),(38,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809222135302597169610127099066.jpg7414b5f7aa.jpg',9,'2018-09-22 21:35:30'),(39,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809222135306597821832609761988.jpg6b5d45e14a.jpg',9,'2018-09-22 21:35:30'),(40,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809222137181115766807698554937.jpg7fd2943120.jpg',10,'2018-09-22 21:37:21'),(41,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809222137191134907106114854077.jpg8004eceaf8.jpg',10,'2018-09-22 21:37:21'),(42,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809222137191168402628343335451.jpgd2a04ebdb8.jpg',10,'2018-09-22 21:37:21'),(43,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809222137202783506044708993080.jpge54be6343c.jpg',10,'2018-09-22 21:37:21'),(44,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809222137213115365042250950197.jpgc11ec92e8e.jpg',10,'2018-09-22 21:37:21'),(45,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809222139361075515886029550117.jpg247ee328ec.jpg',11,'2018-09-22 21:39:38'),(46,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809222139362995175227278382153.jpg6c6ac1387d.jpg',11,'2018-09-22 21:39:38'),(47,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809222139376598251741658008544.jpgb974749744.jpg',11,'2018-09-22 21:39:38'),(48,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809231127440H3BF8CDAJ0Q2BV4GN.pnge862835673.jpg',1,'2018-09-23 11:27:45'),(56,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809242149043215570134042599088.jpgae85710623.jpg',13,'2018-09-24 21:49:05'),(57,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809242149046597593134193033337.jpg2858a8f4bd.jpg',13,'2018-09-24 21:49:05'),(58,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809242149046597950475472066092.jpge622d07ed9.jpg',13,'2018-09-24 21:49:05'),(59,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809242149046598179173890429127.jpgc5e3d72aeb.jpg',13,'2018-09-24 21:49:05'),(60,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/20180924215034288511851228517358.jpg83c28d4662.jpg',14,'2018-09-24 21:50:35'),(61,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809242150341670835461854548997.jpge6b5f84061.jpg',14,'2018-09-24 21:50:35'),(62,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809242150343855362756105906037.jpg496b791929.jpg',14,'2018-09-24 21:50:35'),(63,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809242150346597881206239298131.jpg6768310fc2.jpg',14,'2018-09-24 21:50:35'),(64,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809242152231468173478622991881.jpg9e8c384301.jpg',15,'2018-09-24 21:52:26'),(65,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809242152242852185939109523577.jpg3e80566921.jpg',15,'2018-09-24 21:52:26'),(66,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809242152243901243177310181636.jpg4e04e36c76.jpg',15,'2018-09-24 21:52:26'),(67,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809242152254854598923428825724.jpg631e0c6328.jpg',15,'2018-09-24 21:52:26'),(68,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/20180924215546905505000178396000.jpg2bec9dbcc9.jpg',16,'2018-09-24 21:55:48'),(69,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809242155463903213502146804412.jpgc3c5e66f89.jpg',16,'2018-09-24 21:55:48'),(70,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809242155476597909793541726232.jpg80cc1e1ac7.jpg',16,'2018-09-24 21:55:48'),(71,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809242158431047086913381575130.jpg828a352156.jpg',17,'2018-09-24 21:58:44'),(72,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809242158431068760486670814445.jpgf8e9c010ef.jpg',17,'2018-09-24 21:58:44'),(73,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809242158432768024920990385888.jpg2ba8cb213e.jpg',17,'2018-09-24 21:58:44'),(74,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809242158432768024920990385893.jpg52a6b81da6.jpg',17,'2018-09-24 21:58:44'),(75,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/20180924220109982910618690393175.jpg032d1595d3.jpg',18,'2018-09-24 22:01:10'),(76,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809242201091261852320694088368.jpgff2082923b.jpg',18,'2018-09-24 22:01:10'),(77,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809242201103019382075275873103.jpg22b725b538.jpg',18,'2018-09-24 22:01:10'),(78,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809242201106608514583190271913.jpg3feb1edfba.jpg',18,'2018-09-24 22:01:10'),(79,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201809242201106619438231211908993.jpg6b618d8e0c.jpg',18,'2018-09-24 22:01:10'),(81,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/20180924220743-6ed76f25c0f8255f.jpga278009fa0.jpg',19,'2018-09-24 22:07:45'),(82,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/20180924220744-272ae17e47e80ee1.jpgfe4be5a61b.jpg',19,'2018-09-24 22:07:45'),(83,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/20180924220744-539ee25c470459cb.jpgf8effbbe52.jpg',19,'2018-09-24 22:07:45'),(84,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/20180924220744658a82379f4c50e2.jpg174f45691a.jpg',19,'2018-09-24 22:07:45'),(85,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/20181009172005IMG_20181005_141005.jpgfd1fb7908c.jpg',1,'2018-10-09 17:20:14'),(86,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/20181009172010IMG_20181005_142829.jpg9e9890b7c1.jpg',1,'2018-10-09 17:20:15'),(113,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/20181010115255IMG_20181005_115940.jpg42def5f8ff.jpg',21,'2018-10-10 11:53:49'),(114,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/20181010115301IMG_20181005_121531.jpg0f15a1b326.jpg',21,'2018-10-10 11:53:49'),(115,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/20181010115305IMG_20181005_124616.jpg0e9fc57c8e.jpg',21,'2018-10-10 11:53:49'),(116,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/20181010115310IMG_20181005_131608.jpg5ace21102c.jpg',21,'2018-10-10 11:53:49'),(117,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/20181010115316IMG_20181005_131709.jpg00a6aa8df0.jpg',21,'2018-10-10 11:53:49'),(118,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/20181010115321IMG_20181005_135306_mh1538734656050.jpgcfa987adcc.jpg',21,'2018-10-10 11:53:49'),(119,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/20181010115323IMG_20181005_140443.jpg48fb9756ab.jpg',21,'2018-10-10 11:53:49'),(120,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/20181010115328IMG_20181005_140514.jpg401572298d.jpg',21,'2018-10-10 11:53:49'),(121,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/20181010115333IMG_20181005_140638.jpg60e033a736.jpg',21,'2018-10-10 11:53:49'),(122,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/20181010115336IMG_20181005_142829.jpgb760cb929e.jpg',21,'2018-10-10 11:53:49'),(123,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/20181010115340IMG_20181005_153608.jpgb244d328fd.jpg',21,'2018-10-10 11:53:49'),(124,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/20181010120532IMG_20181001_144058.jpg8acfa34910.jpg',22,'2018-10-10 12:05:41'),(125,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/20181010120535IMG_20181001_150347.jpg98dcfa4389.jpg',22,'2018-10-10 12:05:42'),(138,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/20181010120847IMG_20181001_121027.jpgeefd3f1238.jpg',22,'2018-10-10 12:09:38'),(139,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/20181010120854IMG_20181001_121038.jpg67eed10e23.jpg',22,'2018-10-10 12:09:38'),(140,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/20181010120900IMG_20181001_122835.jpg4e22811544.jpg',22,'2018-10-10 12:09:38'),(141,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/20181010120907IMG_20181001_125358.jpg6fcaad9b40.jpg',22,'2018-10-10 12:09:38'),(142,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/20181010120916IMG_20181001_132451.jpgba34796fce.jpg',22,'2018-10-10 12:09:38'),(143,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/20181010120918IMG_20181001_133301.jpg0f704527ec.jpg',22,'2018-10-10 12:09:38'),(144,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/20181010120926IMG_20181001_133749.jpg53e9f5c4fb.jpg',22,'2018-10-10 12:09:38'),(145,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/20181010120934IMG_20181001_144058.jpg88c10d7259.jpg',22,'2018-10-10 12:09:38'),(146,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201810101210271539144208571.jpeg6aa9223c1b.jpg',23,'2018-10-10 12:10:29'),(147,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201810101210271539144208716.jpegb2e4914813.jpg',23,'2018-10-10 12:10:29'),(148,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201810101210271539144208995.jpega8b230f368.jpg',23,'2018-10-10 12:10:29'),(149,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201810101210281539144209068.jpegd752ea1962.jpg',23,'2018-10-10 12:10:30'),(150,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201810101210281539144209333.jpeg39398399b7.jpg',23,'2018-10-10 12:10:30'),(151,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201810101210281539144209446.jpeg7540bb70e2.jpg',23,'2018-10-10 12:10:31'),(152,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201810101210281539144209620.jpeg163bfda4bf.jpg',23,'2018-10-10 12:10:31'),(153,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201810101210281539144209997.jpegb73dad451e.jpg',23,'2018-10-10 12:10:31'),(154,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201810101210571539142651890.jpeg3fe16ad7ba.jpg',24,'2018-10-10 12:11:31'),(155,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201810101211001539142654246.jpegbdc489c11a.jpg',24,'2018-10-10 12:11:32'),(156,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201810101211051539142662986.jpeg52603f9c26.jpg',24,'2018-10-10 12:11:32'),(157,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201810101211091539142667476.jpegddd4e279c4.jpg',24,'2018-10-10 12:11:32'),(158,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201810101211121539142668050.jpegfb90e3afb9.jpg',24,'2018-10-10 12:11:32'),(159,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201810101211191539142672937.jpegcab773a6d8.jpg',24,'2018-10-10 12:11:32'),(160,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201810101211211539142675630.jpegd7ace8a2a0.jpg',24,'2018-10-10 12:11:32'),(161,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201810101211271539142678551.jpeg14dc8ecd2e.jpg',24,'2018-10-10 12:11:32'),(162,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201810101223451417507982815341511.jpg976a17001e.jpg',20,'2018-10-10 12:23:47'),(163,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201810101223461961599112797041033.jpgff67113d1f.jpg',20,'2018-10-10 12:23:47'),(164,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201810101223462113595600220772214.jpg43e1c98d8e.jpg',20,'2018-10-10 12:23:47'),(165,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/201810101223466631483381098825314.jpgf6fc277652.jpg',20,'2018-10-10 12:23:47'),(170,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/20181012104103DSC_5224.JPGd7b694c685.jpg',3,'2018-10-12 10:41:28'),(171,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/20181012104111DSC_5225.JPG8168839197.jpg',3,'2018-10-12 10:41:28'),(172,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/20181012104119DSC_5229.JPGdf5ce6de31.jpg',3,'2018-10-12 10:41:28'),(182,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/20181012113953DSC_0254_-_.JPG36b680383c.jpg',12,'2018-10-12 11:39:57'),(183,'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/20181012113955DSC_0258.JPG52b449da31.jpg',12,'2018-10-12 11:39:57');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `img_tag`
--

DROP TABLE IF EXISTS `img_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `img_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tagname` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `img_tag`
--

LOCK TABLES `img_tag` WRITE;
/*!40000 ALTER TABLE `img_tag` DISABLE KEYS */;
INSERT INTO `img_tag` VALUES (3,'测试'),(4,'美女'),(5,'西来古镇'),(6,'古镇'),(7,'美少女'),(8,'美食'),(9,'达物'),(10,'概念'),(11,'LOMO'),(12,'人文'),(13,'雨'),(14,'动物'),(15,'秋'),(16,'风景'),(17,'展会'),(18,'冬');
/*!40000 ALTER TABLE `img_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tag`
--

DROP TABLE IF EXISTS `post_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_tag` (
  `post_id` varchar(150) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`post_id`,`tag_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `post_tag_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `post_tag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tag`
--

LOCK TABLES `post_tag` WRITE;
/*!40000 ALTER TABLE `post_tag` DISABLE KEYS */;
INSERT INTO `post_tag` VALUES ('9vvMtCh3QKevqyvg5vinuY',26),('igiyooy8r5ytgNdEikudSE',26),('mf4xnuibRaNhBgCVZYRLXK',26),('xRt8fdQo7qo3A48fn6U7Vk',26),('mf4xnuibRaNhBgCVZYRLXK',28),('rYFcES9XR22S9dvtihGGnE',28),('txPW7z6PZ6eZEeAtjZP5PQ',28),('xRt8fdQo7qo3A48fn6U7Vk',28),('mf4xnuibRaNhBgCVZYRLXK',29),('9vvMtCh3QKevqyvg5vinuY',30),('igiyooy8r5ytgNdEikudSE',30),('igiyooy8r5ytgNdEikudSE',31),('9vvMtCh3QKevqyvg5vinuY',32),('rYFcES9XR22S9dvtihGGnE',32),('txPW7z6PZ6eZEeAtjZP5PQ',32),('xRt8fdQo7qo3A48fn6U7Vk',32),('rBu3mEx73kuWVhGN6RJqNL',36),('anrykoFiWMXJmottEd8gW6',40),('anrykoFiWMXJmottEd8gW6',41),('xQhRxekV7b224KS6GgPswW',42),('xQhRxekV7b224KS6GgPswW',43),('BNkY6UU7UicxZk7DpGCbXL',44),('cZBezRxAkvK63aLLfcF3rn',44),('gcbxu9aUHFc4uASkC9Kr5Y',44),('BNkY6UU7UicxZk7DpGCbXL',45),('Jq9Evr3WeCLASx3kQoFhYJ',46),('Jq9Evr3WeCLASx3kQoFhYJ',47),('qFG2WEVv7YrihgYNaHJ7E8',48),('7qqpTy9RSJa8eSnTudzFCb',49),('qFG2WEVv7YrihgYNaHJ7E8',49);
/*!40000 ALTER TABLE `post_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` varchar(150) NOT NULL,
  `title` varchar(150) NOT NULL,
  `content` text NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `read_count` int(11) DEFAULT NULL,
  `author_id` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `front_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES ('6U5dnryto99cA7FMQhhh8X','想知道迷失在千亩向日葵地里是什么感觉么？就在成都这了…想知道迷失在千亩向日葵地里是什么感觉么？就在成都这了…想知道迷失在千亩向日葵地里是什么感觉么？就在成都这了…','<p>\n</p><div><img src=\"http://p.qpic.cn/smart_cd/0/3dd0065ffe3a8026a9d25be472ffe667/800\"></div> <div><div><ul><li>昨天处暑，意思是暑气已尽，夏天终于过去了。<br><br>提醒我秋天的第一件事，当然，是吃月饼和大闸蟹啦！<br></li><li><img src=\"http://p.qpic.cn/smart_cd/0/243a895b1fdae59adf50e6c11c3a423e/800\"></li><li>每年到了这个时候，差不多也就是大家开始催问：<br><br>「啥子时候开始团紫薯？」的时候了。</li><li><img src=\"http://p.qpic.cn/smart_cd/0/1b2157775e7eccb93f40db381821a8e4/0\"></li><li>紫薯，很显然并不是一个品牌名。那么，它是什么？</li></ul> <div><span><em></em>2018/08/24 09:31</span></div></div> <div><ul><li><img src=\"http://p.qpic.cn/smart_cd/0/17485101761319d25e9e329a4b1d5573/800\"></li><li><br>成都市做各种食物的手工作坊有很多，做得好的也多，但是被很多人心心念念每年都要追着买的，这家是挺难得的。</li><li><img src=\"http://p.qpic.cn/smart_cd/0/9b74d382abbaf8360dc9559cbe7fcc75/800\"></li><li>吃了那么多年，今年才第一次知道，原来它的起源，是一个烘焙爱好者为了一种食材而做出的研究成果。<br><br>这种食材，就是月饼中间的这层馅儿了。</li><li><img src=\"http://p.qpic.cn/smart_cd/0/1c3de90e22885070b13b83e4b2244518/800\"></li><li>它是一种特殊调味的芸豆沙，而当年的创始人，在偶然间得到这种馅料之后，觉得特别好吃，就一直想用它来做个啥。<br><br>试过包包子，结果很难吃… 用来做蛋黄酥，嚯！绝赞！</li></ul></div></div>\n\n','2018-09-02 11:09:56',30,'ysNWsnHoG8p2EGzEXKvaCj'),('6WgRGk3JsQYgvYdtAD3UiS','蓝色海洋的传说—仙本那','<p>\n</p><br><div>  </div>  <div><img src=\"http://p.qpic.cn/smart_cd/0/12fe643bcadb956098682714d038c3a1/800\"></div> <div><div><ul><li>计划了大半年的仙本那之旅终于在七月底成行啦，现在回想起来那片蔚蓝的海，也是陶醉得不要不要的~<br><br>先来贡献一点干货<br>签证：去马来西亚的话，我是选择在淘宝提前办理电子签，可以停留15天，三个月的有效期。<br>住宿：我用过Agoda,爱彼迎，和携程（相对来说Agoda订房间最便宜）<br>交通：机票是在亚航大促的时候订的，吉隆坡往返成都1655，吉隆坡往返斗湖500，ps:亚航真的冷死个人！！！长裤外套袜子都是必备品！<br>其他的交通我都是订的懒猫的接送机和用的东南亚滴滴Grab，因为懒惰不想做公交和地铁的攻略，只有多花钱了。<br><br>美美的仙本那~<br><br></li><li><img src=\"http://p.qpic.cn/smart_cd/0/083d7a90a6df2d8fdd1b9f7848c72319/800\"> <p>敦沙兰卡公园的附近</p></li><li><img src=\"http://p.qpic.cn/smart_cd/0/76252b148c15a264b9e4faa8348d57d0/800\"> <p>马步岛度假村，住宿一晚是1500/人，适合度蜜月~<br></p></li><li><img src=\"http://p.qpic.cn/smart_cd/0/a28a421fd8b0e4a99945f2adaeeab0d8/800\"></li><li><img src=\"http://p.qpic.cn/smart_cd/0/c1d09be2dd4a502ab3ec4bd93bc32e33/800\"></li><li><img src=\"http://p.qpic.cn/smart_cd/0/78029ff3a7373c270c2e1c0740558858/800\"></li><li><img src=\"http://p.qpic.cn/smart_cd/0/0a584c334f92ffe315f4b12ff4d3da05/800\"> <p>这是传说中的海上吉普赛人-巴瑶族，只要船只靠近他们的生活区，他们就会划着船过来要食物</p></li><li><img src=\"http://p.qpic.cn/smart_cd/0/3c76ac86b8fb92356aa91e08320a4b19/800\"></li></ul></div></div>\n\n','2018-09-05 10:12:36',14,'ysNWsnHoG8p2EGzEXKvaCj'),('7qqpTy9RSJa8eSnTudzFCb','相册功能完成','<p>界面：</p><p><img src=\"https://donghaocms.oss-cn-beijing.aliyuncs.com/posts/20181013174006image.png\"></p>','2018-10-13 17:40:21',97,'ysNWsnHoG8p2EGzEXKvaCj'),('8AedYg4CiGhdytzc4nTEmc','完美“仙本那”:上帝的调色盘,飘浮在海上的天堂','<p>\n<li>有一个海岛，她的名字天生带魔力，不属于凡间。有一个梦境，她远离喧嚣，默默地独处一隅。她是完美的，有完美的天空，云朵，海洋，沙滩。她叫：“\n 仙本那 ”！是 马来西亚 沙巴 东海 岸的一座小渔村，这里靠近 菲律宾 ，地处西伯斯海，这里从来没有地震，海啸，台风。被称为“风下之乡”。</li> <li>仙本那\n 在马来语是：“完美的”意思。而我更喜欢它的中文译名：“仙”境“本”该“那”样。第一次听说 仙本那 \n，就被这个名字所吸引。而让我更向往的原因的是两张照片：敦沙卡兰珍珠岛的VIEWPIONT \n和巴瑶族小孩的“悬浮船”。作为一个“风景控”，这么美的地方，当然要作为“有生之年必去系列”。从2014年关注 仙本那 \n，到2018年终于去到这个魂牵梦绕的地方，激动的心情难以言表！<br></li> <li><img src=\"http://p.qpic.cn/smart_cd/0/736f3f7aa63f9e21f4cc161ff2472504/800\"></li> <li><img src=\"http://p.qpic.cn/smart_cd/0/e6197f4663283b63e99b3cd4454f7674/800\"></li> <li><strong>开销情况(穷游)：</strong><br>成都 飞 吉隆坡 往返：775元， 吉隆坡 飞 斗湖 往返：388元，签证费：134元，4晚住宿：204元，吃喝：210元，大马电话卡：21元，三天出海+接送机+2次深潜：957元，总开销：2710元。 </li> <li><strong>行程安排</strong><br>4月5日 23:55---04:30 成都 飞 吉隆坡 <br>4月6日 7:40 吉隆坡 飞 斗湖 ， 斗湖 坐车到 仙本那 <br>4月7日 敦沙卡兰一日游<br>4月8日 马达京+邦邦岛深潜一日游<br>4月9日 马达京+汀巴汀巴一日游<br>4月10日 斗湖 飞 吉隆坡 ， 吉隆坡 飞 成都 </li>\n\n</p>','2018-09-10 16:13:26',15,'ysNWsnHoG8p2EGzEXKvaCj'),('9vvMtCh3QKevqyvg5vinuY','最向往的是天边，最喜欢的是路上 ','<p>\n</p><div><ul><li><img src=\"http://p.qpic.cn/smart_cd/0/55b18727322cd3057dec70e9650dcb20/800\"></li><li><img src=\"http://p.qpic.cn/smart_cd/0/46fea360449496bf630bea28634b721e/800\"></li><li><img src=\"http://p.qpic.cn/smart_cd/0/37f518d737dccfc7ce4161a0263a10bb/800\"></li></ul> </div> <div><ul><li>  又一次踏上草原天路，天穹下弯延曲折的公路，好像是一条腾飞的巨龙，朝着蔚蓝的天空飞奔。</li><li><img src=\"http://p.qpic.cn/smart_cd/0/b7774c6d786722f801a50dd5a8e71b7a/800\"></li><li><img src=\"http://p.qpic.cn/smart_cd/0/cf73eebdbd659e949e848be3dd040059/800\"> <p>日落映红了山头，<span><span></span></span>也如期而遇，今天才十四，月亮又大又圆，是离天太近？不是十五<span><span></span></span>十六才圆吗？</p></li><li><img src=\"http://p.qpic.cn/smart_cd/0/c2424419f84dd70cb2f50714e4a70fee/800\"></li></ul></div>\n\n','2018-09-15 20:31:36',24,'FNdFhqoMAjAnGH8sNJySXB'),('A2728FV98M7NnHcMzp7ZMA','收藏癖：你家有多少景区门票，他的收藏很值钱！','<p>\n</p><div><img src=\"http://p.qpic.cn/smart_cd/0/5fae6900953a4beaf297faaba3c673e2/0\"></div> <div><div><ul><li>  收藏其实很极端，或陶冶情操，或血压升高。<br>  看过一则对“收藏”打趣的解答：从生理上说，你要收藏了一把夜壶，不仅收藏到了中国的传统文化，晚上上厕所还很方便。虽谬论，但也导出了收藏得某些内核。<br>\n  \n我认为，每个人都应该有收藏爱好，或实物、或虚体。我喜欢收藏门票。问其原因，我唯一能想到的佐证应该是上小学那会儿，班里有一个叫王慧的同学在某个周末去了杜甫草堂，她在日记作业里，不仅用文字描述了草堂寺，还将门票贴在那篇日记上，这事被班主任频频夸赞。……后来，我也开始收集门票，各种门票，演出的、景区的，只是我不将它们贴在日记本上，而是放在信封里，闲暇时翻出来看看，仅限自娱自乐。</li><li><img src=\"http://p.qpic.cn/smart_cd/0/b67132a85403c5df2a60c592735c1986/0\"> <p>  最珍贵的门票之一：都江堰景区门票（1999年）<br>   图中上方的四张票，是都江堰景区在没有成为“世界文化遗产”之前的门票，那时的都江堰景区分为离堆公园、过江索道、二王庙、安澜索桥，四个景点分别售票。而下方则是成为世遗后的景区通票，而那过江索道也因为破坏原始环境在申报世遗时被拆除。</p></li><li><img src=\"http://p.qpic.cn/smart_cd/0/7c5d7abf0eb5a30e1b2028c2d8947811/0\"> <p>  最珍贵的门票：西游记艺术宫（1992年）<br>  这是很多成都人的记忆，这里也是西南地区第一家体验式乐园（世界乐园、欢乐谷、国色天香的前辈）。<br>  当年电视剧《西游记》正热播，郫县就以“西游记”为主题打造了这样一个乐园，记得入园就像进水帘洞一样，需要穿过瀑布。后来，新都也照搬修了一个，只是我没有去过。这张票记录了我的童年，你还记得这个地方吗？</p></li><li><img src=\"http://p.qpic.cn/smart_cd/0/d2a3231b7960563351dc1dcb7550c2d1/0\"> <p>  最珍贵的门票：成都首届民间艺术节灯会门票（1992年）<br>\n  \n这张票是上辈收藏的，后来转赠予给我的，单看纸张都会觉得很有历史感。从这票我们知道：1992年举办的“成都首届民间艺术灯会”是在夏天，而且是在郫县县城里，我无法将“夏天”—“灯会”—“县城”—“收门票”联想到一起。门票信息里，证明了“成都晚报”的确是90年代成都最具影响力的媒体。</p></li><li><img src=\"http://p.qpic.cn/smart_cd/0/f2d6d63f0f928c10c0e4d485fa2bc23d/0\"></li></ul></div></div>\n\n','2018-09-05 10:35:52',9,'ysNWsnHoG8p2EGzEXKvaCj'),('aEi5Agz9bzm7coGNJK39fj','被遗忘的秘境冶勒湖，周末出游正合适！','<p>\n</p><div><img src=\"http://p.qpic.cn/smart_cd/0/c63bde74adea800b767482c61e2952ee/800\"></div> <div><div><ul><li>这个世界上总有一些美景，<br>是我们心向往之的。<br>有人向往新疆的辽阔无边，<br>有人热爱西藏的纯净空灵，<br>有人喜欢丽江的热情似火。<br><br>而我唯独对川西情有独钟，走过稻城的亚丁，看过色达的天葬，去过白玉的亚青。而现在，我要去探寻一个更原始更神秘的地方-凉山州。</li><li><img src=\"http://p.qpic.cn/smart_cd/0/5ae34cfbde170abf06d6eaae667f2ebd/800\"></li><li>7月以来，四川便进入了阴雨绵绵的雨季模式，一直持续到本周才略有好转。听闻四川有一个媲美泸沽湖的神秘仙境冶勒湖，在做好充足准备后我们决定前去探寻一番。</li><li><br></li><li><strong>孟获城高山草甸</strong><br><br>⊙高山花海草甸<br>⊙三国传说孟获城<br>⊙17°的夏天<br><br>在进入冶勒湖之前，我们先来到了孟获城，这里山高林密，还有着一大片高山生态草甸。</li><li><img src=\"http://p.qpic.cn/smart_cd/0/75b399ec50ef62cde6bd35afd53b38b6/800\"></li></ul></div></div>\n\n','2018-09-05 10:57:06',15,'ysNWsnHoG8p2EGzEXKvaCj'),('anrykoFiWMXJmottEd8gW6','美丽的秋','美丽的秋美丽的秋美丽的秋美丽的秋美丽的秋','2018-09-15 20:34:19',9,'VSwcS6gb7h3qQbkWTcYyWL'),('BNkY6UU7UicxZk7DpGCbXL','今日中秋','<p>\n</p><p>原标题:今日中秋</p> \n<p>中秋节一直被人们喻为最具有人情味，最富有诗情画意的节日，而这一天天上的月亮又分外明亮，分外的圆，所以又叫团圆节。<br></p> \n<img src=\"http://p0.ifengimg.com/pmop/2018/0924/91FDC20E24908235C1F46AFDDAE566BF23934FC3_size26_w210_h248.png\"> \n<span><strong>节日由来</strong></span> \n<p>中秋节始于唐朝初年，盛行于宋朝，至明清时，已成为与春节齐名的中国传统节日之一。时在农历八月十五，因其恰值三秋之半，故名，也有些地方将中秋节定在八月十六。<br></p> \n<p>受中华文化的影响，中秋节也是东亚和东南亚一些国家尤其是当地的华人华侨的传统节日。自2008年起中秋节被列为国家法定节假日。</p> \n<p>中秋节自古便有祭月、赏月、拜月、吃月饼、赏桂花、饮桂花酒等习俗，流传至今，经久不息。中秋节以月之圆兆人之团圆，为寄托思念故乡，思念亲人之情，祈盼丰收、幸福，成为丰富多彩、弥足珍贵的文化遗产。<br></p> \n<img src=\"http://p0.ifengimg.com/pmop/2018/0924/91FDC20E24908235C1F46AFDDAE566BF23934FC3_size26_w210_h248.png\"> \n<p><span><strong>传统习俗：</strong></span></p> \n<p><span><strong>赏月、拜月、祭月</strong></span></p> \n<p>《礼记》早有记载“秋暮夕月”，意为拜祭月神，逢此时则要举行迎寒和祭月，设香案。&nbsp;到了周代，每逢中秋夜都要举行迎寒和祭月。设大香案，摆上月饼、西瓜、苹果、红枣、李子、葡萄等祭品。在月下，将月亮神像放在月亮的方向，红烛高燃，全家人依次拜祭月亮。</p> \n<p>相传古代齐国丑女无盐，幼年时曾虔诚拜月，长大后，以超群品德入宫，但未被宠幸。某年八月十五赏月，天子在月光下见到她，觉得她美丽出众，后立她为皇后，中秋拜月由此而来。月中嫦娥，以美貌著称，故少女拜月，愿“貌似嫦娥，面如皓月”。云南傣族在中秋之夜，同样盛行“拜月”风俗。&nbsp;</p> \n<p>中秋赏月的风俗在唐代十分流行，许多诗人的名篇中都有咏月的诗句。到宋代，中秋赏月之风更盛，每逢这一日，“贵家结饰台榭，民间争占酒楼玩月”。明清宫廷和民间的拜月赏月活动更具规模，中国各地至今遗存着许多“拜月坛”、“拜月亭”、“望月楼”等古迹。文人士大夫对赏月更是情有独钟，他们或登楼揽月或泛舟邀月，饮酒赋诗，留下不少脍炙人口的千古绝唱。如杜甫《八月十五夜月》用象征团圆的十五明月反衬自己飘泊异乡的羁旅愁思；宋代文豪苏轼，中秋欢饮达旦，大醉而作《水调歌头》，借月之圆缺喻人之离合。直到今天，一家人围坐在一起，欣赏皓月当空的美景仍是中秋佳节必不可少的活动之一。</p> \n<p><span><strong>吃月饼</strong></span></p> \n<p>中秋节赏月赏月和吃月饼是中国各地过中秋节的必备习俗，俗话说“八月十五月正圆，中秋月饼香又甜”。月饼一词，源于南宋吴自牧的《梦梁录》，那时仅是一种点心食品。到后来人们逐渐把赏月与月饼结合在一起，寓意家人团圆，寄托思念。同时，月饼也是中秋时节朋友间用来联络感情的重要礼物。在福建厦门地区还有博饼的习俗，而且博饼被列为国家非物质文化遗产项目。</p> \n<p><span><strong>赏桂花、饮桂花酒</strong></span></p> \n<p>人们经常在中秋时吃月饼赏桂花，食用桂花制作的各种食品，以糕点、糖果最为多见。中秋之夜，仰望着月中丹桂，闻着阵阵桂香，喝一杯桂花蜜酒，欢庆合家甜甜蜜蜜，已成为节日一种美的享受。</p> \n<img src=\"http://p0.ifengimg.com/pmop/2018/0924/91FDC20E24908235C1F46AFDDAE566BF23934FC3_size26_w210_h248.png\"> \n<p><span><strong>生活提醒</strong></span></p> \n<p>今年的秋分已于22日9时54分、早于中秋节一天到来，此时阴阳相半，昼夜均长，寒暑平分。秋分至，残暑终，意味着秋季正式来临，昼夜温差较大，不时有秋雨降临，正所谓“一场秋雨一场寒”。</p> \n<p><strong>冷水洗脸适当秋冻防感冒</strong></p> \n<p>秋季早晚温差大，应根据天气变化和每个人的体质情况，及时增减衣物，预防风寒。但也不必过早“多穿衣”，应注意耐寒锻炼，也就是常说的“秋冻”。</p> \n<p>秋季养生，应以“收”为主。运动宜选择轻松平缓、活动量不大的项目。还可适当进行一些耐寒锻炼和有氧运动，适当的冷水锻炼对预防伤风感冒、流鼻涕、支气管炎也有一定效果。</p> \n<p><strong>防燥多宜吃“辛酸”食物</strong></p> \n<p>秋分时节，饮食上要特别注意预防秋燥。秋分的“燥”是凉燥，饮食上要注意多吃一些清润、温润为主的食物，比如：芝麻、核桃、糯米等。</p> \n<p>秋分时节，还可适当多吃一些辛味、酸味、甘润或具有降肺气功效的果蔬，特别是白萝卜、胡萝卜。预防秋燥方面，对运动者来说，每次锻炼后应多吃一些滋阴、润肺、补液、生津的食物，比如：生梨、芝麻、银耳等。若出汗较多，还可适量补充一些盐水，补充时以“少量、多次缓饮”为准则。秋分药膳还要善用百合，像百合莲子羹、银耳百合羹等，都是不错的选择。</p> \n<p>除饮食外，还要记得给皮肤做些保养，以防皮肤干裂。</p> \n<img src=\"http://p0.ifengimg.com/pmop/2018/0924/91FDC20E24908235C1F46AFDDAE566BF23934FC3_size26_w210_h248.png\"> \n<p><strong>今晚最佳赏月地</strong></p> \n<p>中央气象台预计，中秋节当天最宜赏月的地方是辽宁、北京、天津、河北、河南、山东、山西等地，这也意味着这些地区可以欣赏到“皓月顶空照”美景。</p> \n<p>“平分秋色一轮满，长伴云衢千里明。”天文专家提醒说，中秋节当晚，感兴趣的公众不妨寻一处避开城镇灯光之处，静候“皓月顶空照”美景出现。有条件的公众如果选择靠近河、湖、海的地方赏月，更有意境。</p>\n\n','2018-09-24 16:31:23',8,'ysNWsnHoG8p2EGzEXKvaCj'),('CiKycWfSSo3F79To7AcXgJ','来一场说走就走的旅行——到清迈去逛吃，逛吃，逛吃','<p>\n</p><div><img src=\"http://p.qpic.cn/smart_cd/0/2d75cb07c0c28aa3f250472fdcb4acd0/800\"></div> <div><div><ul><li>正在参加“我是企鹅旅行家第一期”活动<a target=\"_blank\" href=\"http://panda.qq.com/cd/thread/1032410893164842\">http://panda.qq.com/cd/thread/1032410893164842</a>；<br><br><br>前几天还在和二姐说，国庆去哪里玩啊？机票这么贵。然后社区就这么体贴地推出了送机票的活动，为了感谢知心小姐姐，为了机票，我也翻出老照片拼一把<em></em>。<br><br><br>    本来没打算去清迈的，那天侄女的老公说到清迈的机票来回1500元，还含税。现在不是流行来一场说走就走的旅行么，那我们也来一场说走就走的旅行吧。<br>\n    \n8月24号订的8月30号下午五点的机票，办签证已经来不及，那就落地签好了。又订了住宿，准备落地签的泰铢（1块人民币等于5块多泰铢，感觉好赚的样子\n ）、准备各种表格，那是小两口的事，谁叫我们老了，英语完全白瞎呢？没有做旅游的功课，他们说要来一场说走就走的旅行，走到哪算哪。<br>    到清迈机场下飞机是当地时间七点，比北京时间刚好晚一小时，我们因为早有准备，所以落地签办得很快，不像别的那些人，下了飞机才开始慢慢填表格什么的。非快过关，打的，直奔早已订好的民宿。<br></li><li><img src=\"http://p.qpic.cn/smart_cd/0/837b6340881f4507f7288ad75035f280/800\"> <p>1000元的大票，签证费每人1000铢，小费要了每人200铢，6000块，一下就没了，突然有了土豪的感觉</p></li><li><img src=\"http://p.qpic.cn/smart_cd/0/d3ecc24b1ae9d0e11ec9bc8fc0ec6a54/800\"> <p>出发前查了清迈的天气预报，居然是这样的，居然！好嘛，我们要到清迈那个小清新之地去浪漫了，我们要到清迈去看海了</p></li><li><img src=\"http://p.qpic.cn/smart_cd/0/c7e9dde6caa839e58ef2cab0a72601fd/800\"> <p>国航好漂亮的熊猫飞机，我们坐的川航，服务好，态度好，飞机餐足足的</p></li><li><img src=\"http://p.qpic.cn/smart_cd/0/ba3927e84a3c1a4470dc6eeec2d171f9/800\"> <p>偷拍的签证大厅里的地图。大家注意：在国外机场出关前，拿出手机和相机都是不明智，小心被抓到了会被罚款，甚至遣返。</p></li><li><img src=\"http://p.qpic.cn/smart_cd/0/07e27733661b67c7c2db8a8bda707aef/800\"> <p>打的来到预订的哦他哇民宿，好小清新的样子，泰国人开的，清洁卫生，态度非常友好，到了之后给我们看地图，告诉我们该去什么地方玩，还有免费早餐免费水果，真心赞啊，标间才800铢一间。正置周末，无心细看，放下行李，直奔夜市。</p></li><li><img src=\"http://p.qpic.cn/smart_cd/0/16db73407838e49defaf97363d93cea7/800\"> <p>一到市场就看见这个，太诱人了。<br>是不是觉得都没过渡，一下就进入主题了，是的，就这么任性！</p></li><li><img src=\"http://p.qpic.cn/smart_cd/0/c60f9d1c77bd31401fd716787cd5c3b5/800\"></li><li><img src=\"http://p.qpic.cn/smart_cd/0/fc3cbd4921cb4da7bf97d2ffd185ce02/800\"></li></ul></div></div>\n\n','2018-09-07 10:41:16',78,'mLVKzNwXjNUx9B2Nsthp9F'),('cZBezRxAkvK63aLLfcF3rn','中秋快乐哈！','<p>\n<br>\n<img alt=\"中秋节搞笑说说\" src=\"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=3964590580,3669943996&fm=175&app=25&f=JPEG?w=640&h=568&s=DA08FA0FDA137FDCD839E7830300E087\">\n\n</p><p>\n月到中秋了，你我天各一方。岁月流失的都是美好，我会想你的，明月情依依，繁星语切切。\n\n\n\n</p>','2018-09-24 17:13:05',82,'HF2GpEcvkpTbW6qbyc9TMf'),('gcbxu9aUHFc4uASkC9Kr5Y','祝大家 中秋快乐~','<p>\n又是中秋又是圆，祝你月圆人圆事事圆满！ <br></p><p>\n</p><div id=\"left-container\"><div><div id=\"article\"><div><div><img src=\"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=2833606502,170856221&fm=175&app=25&f=JPEG?w=640&h=424&s=3E3C4686682B1F036C27A96D03008069\"></div><br><div><br></div><div><br></div></div></div></div></div>','2018-09-24 17:25:24',122,'ysNWsnHoG8p2EGzEXKvaCj'),('igiyooy8r5ytgNdEikudSE','北海道夏日薰衣草——独自暴走的浪漫＠函馆札幌小樽富良野东京','<p>\n</p><div><img src=\"http://p.qpic.cn/smart_cd/0/96f8300a6d49c83c3b4fa31db01791d6/800\"></div> <div><div><ul><li>正在参加“我是企鹅旅行家第一期”活动<a target=\"_blank\" href=\"http://panda.qq.com/cd/thread/1032410893164842\">http://panda.qq.com/cd/thread/1032410893164842</a>；</li><li><img src=\"http://p.qpic.cn/smart_cd/0/9dc8150fca4009097c1a7bfab6f611ea/800\"> <p>最爱此图，站在山坡眺望拍到的，天气甚好，薰衣草香气漫漫。<br>----------------------------------------------------<br>这次主要目的就是看花，没错~犯花痴的人就是要看花解馋！！虽然我家乡 成都 也有薰衣草，还是很想感受一下 北海道 的清新之美.....<br>看看我用手机照得下图，够美吧，在 彩香之里 ，天气素晴....<br>----------------------------------------------------</p></li></ul></div></div>\n\n','2018-09-11 13:32:34',49,'ysNWsnHoG8p2EGzEXKvaCj'),('Jq9Evr3WeCLASx3kQoFhYJ','成都自由行','<p>\n</p><div><img src=\"http://p.qpic.cn/smart_cd/0/fe2f523c9ef555c131953fd13d998cfd/800\"></div> <div><div><ul><li><strong>【近况】</strong><br>哈喽，大家好最近有没有想我呢？\n \n最近帽子真是太忙了，在这也感谢大家长期对帽子的支持啦！作为一名摄影师每天的生活就是跑跑跑，拍拍拍。太久没有发文了，想着十一黄金周马上来临，找了最近一次\n 成都 旅拍写了一篇游记攻略供大家参考，拍的一般请大家多多包涵，未来也会带给大家更多的作品~</li><li><strong>【旅行之前】</strong><br>成都\n ，作为帽子的家乡，在最近几年可谓是赚足了大家的眼球， 成都 也一跃成为了大家心目当中的网红城市代表，大家对 成都 \n的热情说实话，让帽子真是受宠若惊，最近私信我旅拍的小伙伴越来越多，最近一位小姐姐找到帽子，表示自己国庆节需要加班，因此只能赶在国庆之前提前请假，来成都体验最地道的\n 成都 范儿。也正是因为这一点帽子也选择帮助这位小姐姐实现她的梦想。<br></li><li><strong>【旅行线路】</strong><br>小姐姐完全不知道地道的 成都 范儿景点与在何处，作为本地人的帽子也带着她体验了一次与众不同的 成都 之旅，要拍好照片又要体验 成都 文化，帽子也为她定制了一条超级完美的线路，大家如果觉得有用的话可以在十一黄金周的时候试一试，一定让你的旅行变的非常简单轻松。<br>线路规划：梵木创艺区——文殊院——宽窄巷子——人民公园——春熙路<br>梵木创艺区是因为小姐姐住宿在东站这边，才给小姐姐的定制的线路（毕竟旅游还是要拍很多美美的照片嘛），话不多说，看一看这次帽子的佳作吧~</li><li><strong>梵木创艺区——“文艺犯”的天堂</strong><br>这是一个典型的后现代艺术空间，这里梧桐树镶嵌在钢筋水泥的建筑中间，如今每一座城市都有自己的文创产业园，而 成都 大家往往只知道最出名的东郊记忆，U37创意仓库，殊不知，在 成都 东站1000米外有一处拍照的好去处一——321梵木创艺区。</li><li><img src=\"http://p.qpic.cn/smart_cd/0/89b9a13600247a091015dc656ed6d38e/800\"></li><li><img src=\"http://p.qpic.cn/smart_cd/0/ac8119f123add57b93a4429a8371a1c3/800\"></li><li>带着标志性的后工业气息，有躁辣火热的现场音乐，赏心悦目的画作影像，充满设计感的建筑，都是让这里赏心悦目的因素。</li><li><img src=\"http://p.qpic.cn/smart_cd/0/c87f059119b04f3f51c1fcbd1480e05f/800\"></li><li><img src=\"http://p.qpic.cn/smart_cd/0/4982a8570472ee68871eda2302843c1a/800\"></li><li>一枚合格的 成都 “文艺犯”，是一定要去一次梵木创艺区的，当然了，这里拍照自带艺术感。</li><li><img src=\"http://p.qpic.cn/smart_cd/0/8cbe44eb6e2ec601649524059c0eb795/800\"></li><li><img src=\"http://p.qpic.cn/smart_cd/0/863c77216647afd45f3ec31700ecaec9/800\"></li><li>梵木创艺区的咖啡店，人不多非常适合拍照</li><li><img src=\"http://p.qpic.cn/smart_cd/0/9997e8c0c894dbc0e3243e298c03841f/800\"></li><li><img src=\"http://p.qpic.cn/smart_cd/0/3eb7523e2a25442de58ff3737786afcc/800\"></li><li>年代感十足的红墙，配时尚文艺范儿的小姐姐正好</li><li><img src=\"http://p.qpic.cn/smart_cd/0/d64eef616c46075abb21a4703d464dc4/800\"></li><li><img src=\"http://p.qpic.cn/smart_cd/0/74229bfda9008c61371547109a7ef427/800\"></li><li><img src=\"http://p.qpic.cn/smart_cd/0/d9e3d78b47baa49cc70d685ff8fd257b/800\"></li><li><img src=\"http://p.qpic.cn/smart_cd/0/e57d52954b5effc099bad1eb12530409/800\"></li><li>设计工作室外的吧台</li><li><img src=\"http://p.qpic.cn/smart_cd/0/cbae9df8c356b8491d5fa0683357c298/800\"></li><li>走累了还是找家店休息一下</li><li><img src=\"http://p.qpic.cn/smart_cd/0/5c633768856979d862b494e2c2f7aa6c/800\"></li><li>这家店里的狗狗超级可爱，据老板讲就是园区内的流浪狗，自从喂过一次后天天来这里休（ceng）息（fan）</li><li><img src=\"http://p.qpic.cn/smart_cd/0/658ee453e482d8541b2c41863b371af0/800\"></li><li><img src=\"http://p.qpic.cn/smart_cd/0/73cd9b4ef930171cb9d3e09463d44122/800\"></li><li>梵木创艺区前的小足球场，正在踢球的小孩们</li><li><img src=\"http://p.qpic.cn/smart_cd/0/1032f861029709f361fef6528debb4fc/800\"></li><li>当我们正准备走的时候的又遇见了一只园区内的流狼狗</li><li><img src=\"http://p.qpic.cn/smart_cd/0/3bbeb851fc7e399366939993d47bf9d5/800\"></li><li><img src=\"http://p.qpic.cn/smart_cd/0/8d8cf2023a1f92c31aa439994f671127/800\"></li><li>梵木创意区的结束，也意味着我们今天旅行的正式开始。梵木，是 成都 不可多得的文创基地之一，与东郊记忆、u37不同的是，在梵木你感受到的是更强烈的设计风格与新潮元素。如果大到达 成都 的首站的是东站的话，帽子还是很推荐大家来这里的。</li><li><strong>地址：</strong><br>成都 市东洪路666号，因为666号这个名字， 成都 本地的文艺青年，更喜欢叫它 “666”。<br><strong>交通：</strong><br><br>地铁2号线成渝立交站C口走出，步行200米即到<br><strong>小Tips：</strong><br>①一座非常适合拍照的文创园，但是注意拍照的时候不要的误闯别人的办公区域<br>②园区内目前还有许多新修的项目，拍照的时候不要误入施工现场<br>③梵木经常举办一些演唱会或者漫展，喜欢的朋友可以关注一下<br>④目前人流量还比较少，我们是周日去的，每个咖啡馆没坐满。<br>价格：免费</li></ul></div></div>\n\n','2018-09-24 17:03:03',23,'FNdFhqoMAjAnGH8sNJySXB'),('kQr9huV4TkKiqLcJmyd3vh','尝试了今秋第一波大闸蟹，期待10月吃蟹','<p>\n<li>世界上有两个桃花源，一个在你心中，一个在重庆酉阳 。<br>以前书本上学的《桃花源记》，那描述的世外桃源般的生活<br>没有想到其实就在我们身边，就在重庆。<br>这一次从成都出发，感受了一次穿越秦汉的穿越之旅。<br>也体验到了咱们古人读书上课的国学之风。<br>还有美丽的龚滩古镇，百里乌江画廊上的一颗明珠。</li> <li><img src=\"http://p.qpic.cn/smart_cd/0/93950d661e254d2d956a036492a605dd/800\"></li> <li>关于行程<br>D1 成都--重庆南川--龚滩古镇<br>D2 龚滩古镇--酉阳桃花源<br>D3 酉阳桃花源--阿蓬江大峡谷--成都<br>成都到酉阳现在是全程高速，路程大概7个小时。<br>龚滩古镇需要到彭水下高速，然后再开一段县道，从成都出发大概也是7小时的车程。</li> <li><img src=\"http://p.qpic.cn/smart_cd/0/1a3a90f5c60b7c3461bb87b7ecf7b493/800\"></li> <li><strong>D1 十里画廊，龚滩古镇</strong><br>早上7点，太阳才刚刚升起<br>行驶在成都的三环路<br>一路向东想成安渝高速出发。</li> <li><img src=\"http://p.qpic.cn/smart_cd/0/0bd7425105b13e8e8b9b47a1f5404f3e/800\"></li>\n\n</p>','2018-08-29 22:31:48',2,'ysNWsnHoG8p2EGzEXKvaCj'),('mf4xnuibRaNhBgCVZYRLXK','红糖烧饼——一种唤起味觉记忆的幸福感','<p>\n</p><br><div>  </div>  <div><img src=\"http://p.qpic.cn/smart_cd/0/def76b1621603e19b7702bc161aa93a0/800\"></div> <div><div><ul><li>要说我做这个烧饼，还是纯属偶然。其实我也不知道应该叫它什么，因为是干煎的馍馍，好吧，就给取个烧饼的名字吧，我就是这么任性。<br><br>前天，我给我家小木木蒸馒头的时候，刚要蒸，他就闹着要吃了，哭得很凶。我就想，怎么可以更加快速让小木木吃到，然后就想到了煎饼饼，结果煎出来意外好吃。然后第二天就做了红糖饼子，你们叫我出方子，所以，我就又做了一遍，是不是很敬业呀？<br></li><li><img src=\"http://p.qpic.cn/smart_cd/0/51801884979caa01a45d3ae6ce35e834/0\"></li><li><strong>红糖馅儿</strong><br><br>红糖馅儿材料：红糖60克，白糖10克，面粉10克<br>红糖切碎，加上面粉白糖混合均匀。加面粉的原因是为了让热得红糖满口留，吃得到处都是。当然，你喜欢满嘴流的感觉可以不加面粉的。</li><li><img src=\"http://p.qpic.cn/smart_cd/0/d8da97e399f4dda005088ed3e34e0977/800\"></li><li><img src=\"http://p.qpic.cn/smart_cd/0/7e6c2eeb485d26d1e63fd1908bb06339/800\"></li><li><img src=\"http://p.qpic.cn/smart_cd/0/99ffd5123ce282fb8a4ebd31467403ba/800\"></li><li><strong>做烧饼</strong><br><br>面团材料：中筋面粉250克，水125克，酵母2克，白糖10克<br>其实这就是揉馒头包子的配方<br>1，温水（30度样子，和手温差不多的温度）125克，加入2克酵母，10克白糖混合均匀，静置2分钟。温水和面知不知道？温水有利于激发酵母的活性哈，当然，加入白糖也是激发酵母活性。不喜欢白糖的朋友可以不加哈，不过要增加激活酵母时间哈。<br><br>还有，<strong>告诉大家一个揉包子馒头面的技巧</strong>，就是面水比例是2:1，面粉和酵母比例是1：0.01。比如100克面粉，就用50克水，1克酵母，看懂了吗？以后按照这个比例做包子馒头巴巴适适的，免得你少了水又加水，少了面又加面，本来只做一锅馒头的，最后做出了三锅馒头，哈哈哈哈哈。<br></li><li><img src=\"http://p.qpic.cn/smart_cd/0/0926902e9f184d5644f6d462ab647345/800\"></li><li>2，加入面粉，揉成光滑面团。面团揉得好的标志，盆光面光手光的三光政策。<br>还有点儿巴盆子，不要太在意细节哈<br>揉好的面团盖上保鲜膜醒发半个小时<br></li><li><img src=\"http://p.qpic.cn/smart_cd/0/32315d7f7e4659fa857c95370df2cd14/800\"></li><li><img src=\"http://p.qpic.cn/smart_cd/0/3fb5e0928144dca60638a5979f4a6c84/800\"></li><li>3，这就是醒发好的面团，半个小时就这么大了。</li><li><img src=\"http://p.qpic.cn/smart_cd/0/11d18897dfafcb0585ec022d7bf10e7b/800\"></li><li>4，等分成8个小剂子，盖上保鲜膜醒发10分钟。</li><li><img src=\"http://p.qpic.cn/smart_cd/0/afdbd2dd8e07edda0409ffdc7fc10b59/800\"></li><li>5，醒发好的面团包裹上红糖馅儿（不要贪多哦，不然擀得时候要爆），揉成圆，然后用擀面杖擀成长舌状。。嗯嗯，就给外面卖的一样。<br></li><li><img src=\"http://p.qpic.cn/smart_cd/0/19bfd5d1f989a97d28e19578b3964bb6/800\"></li><li><img src=\"http://p.qpic.cn/smart_cd/0/a5ce1b66ae1151a8e599d786a02eb762/800\"></li><li><img src=\"http://p.qpic.cn/smart_cd/0/b324b709a7b455a531ea63638e701248/800\"></li><li>如果要吃白糖馅儿的，就包白糖哈，要吃肉馅儿红枣红豆馅儿就分别包肉红枣红豆馅儿就是哈</li></ul></div></div>\n\n','2018-09-11 13:22:41',18,'ysNWsnHoG8p2EGzEXKvaCj'),('PcFfgriHaZWr66ohovfwzn','尝试了今秋第一波大闸蟹，期待10月吃蟹~','<p>\n</p><div><img src=\"http://p.qpic.cn/smart_cd/0/a0d81c125823384f1e13cca91c0b4d9d/800\"></div> <div><div><ul><li>前几天吃了今年第一波大闸蟹，好巴适啊~</li><li>拿到蟹的时候还在吐泡泡</li><li><img src=\"http://p.qpic.cn/smart_cd/0/f2476188c719b73daa66689b2d84e55f/800\"></li><li>没有调色的图，我家厨房太暗了，拍出来有点糊</li><li><img src=\"http://p.qpic.cn/smart_cd/0/e5d1bf63b7c4fa79cfc8e4484df6f39b/800\"></li><li>因为还没到时候，现在吃的都是公蟹，还有点小</li><li><img src=\"http://p.qpic.cn/smart_cd/0/51b78bdffefd45832a9c5bf0fd0085d3/800\"></li><li>蟹膏不算太多，毕竟还没到时间，不过蟹肉还是很饱满啦</li><li><img src=\"http://p.qpic.cn/smart_cd/0/8fb0ecaa3425a4d5a5160a3866b4257c/800\"></li><li>比较小，蒸了15分钟感觉有点久了</li><li><img src=\"http://p.qpic.cn/smart_cd/0/1110ac1e3f365f5a60bdadf65c352ecd/800\"></li><li>每年你们都吃大闸蟹么？一般买成好多钱嘞？</li></ul></div></div>\n\n','2018-08-30 09:20:56',11,'ysNWsnHoG8p2EGzEXKvaCj'),('qFG2WEVv7YrihgYNaHJ7E8','后台帖子管理功能完成','<p>效果展示</p><p>界面：</p><p><img src=\"https://donghaocms.oss-cn-beijing.aliyuncs.com/posts/20181013124735image.png\"></p><p>主要的查询功能：</p><p>每当查询到相信内容，不相关内容隐藏</p><p>动态加精和取消，页面不刷新</p><p>vue:&nbsp;<span style=\"font-size: 12px;\">hightlight函数：</span></p><p><span style=\"font-size: 12px;\">成功返回后，Search函数执行，相当于刷新页面</span></p><p><img src=\"https://donghaocms.oss-cn-beijing.aliyuncs.com/posts/20181013125107image.png\"></p><p>效果：</p><p><img src=\"https://donghaocms.oss-cn-beijing.aliyuncs.com/posts/20181013125233image.png\"></p>','2018-10-13 12:53:00',25,'ysNWsnHoG8p2EGzEXKvaCj'),('QXtq2ZNotCvpHiRs6YsctY','想知道迷失在千亩向日葵地里是什么感觉么？就在成都这了…想知道迷失在千亩向日葵地里是什么感觉么？就在成都这了…想知道迷失在千亩向日葵地里是什么感觉么？就在成都这了…','<p>xxx<br></p>','2018-09-02 11:08:44',10,'ysNWsnHoG8p2EGzEXKvaCj'),('rBu3mEx73kuWVhGN6RJqNL','闷声色狼','<p><img src=\"https://donghaocms.oss-cn-beijing.aliyuncs.com/posts/20180914214732ca1349540923dd545cc81eb0dd09b3de9d8248aa.jpg\">-</p>','2018-09-14 21:48:44',24,'7SWuncBDfghCL9rdFu3NHP'),('rcXjxFCFZQRoXgp7Gchnjm','曼谷，致你30岁一支MV','<p>\n</p><div><img src=\"http://p.qpic.cn/smart_cd/0/dc11e4ccb3b941ced75a7fa1582af5aa/800\"></div> <div><div><ul><li>正在参加“我是企鹅旅行家第一期”活动<a target=\"_blank\" href=\"http://panda.qq.com/cd/thread/1032410893164842\">http://panda.qq.com/cd/thread/1032410893164842</a><br><br>时光总是匆匆，悄然间我们前后相差15天步入30。那些逼近30的日子仿佛变成了最后一丝光亮，而当翻过30这座大山之后，是否会“风雨变幻”、天翻地覆？抑或“风生水起”、天降鸿运？<br><br>惶恐。<br><br>在你生日之时，我带你去到湄南河畔的曼谷 ，致你一支30岁的Music Video。<br><br>MV简介：<br>猪脚：后文中的“你”或“裙摆侠”；<br>BGM：会去接你的<br><strong>MV高清版地址： <a target=\"_blank\" href=\"https://v.qq.com/x/page/d0765hd7ch8.html\">https://v.qq.com/x/page/d0765hd7ch8.html</a></strong><br><br>Video故事很简单，讲述了一对恋人在一起时嬉笑打闹，又在分别的日子里牵肠挂肚，一如我们在一起的时光，哭着争吵又笑着和好。是不是天下的情人，相爱就不会分开？<br><br>我不是专业的导演、编辑、摄像、演员、后期.....我仅仅只是一名记录者，记录好你的璀璨年华，记录我们在一起的第8个年，用照片和帧画谱写我们的故事。</li><li><strong>你掏出硬币，我随你而行</strong></li><li><img src=\"http://p.qpic.cn/smart_cd/0/1fcda6eb8ef733b90d3d14d5924605ac/800\"></li><li>拍摄地点:郑王庙<br>MV：2’06”—2’11”<br><br>初至曼谷 ，你告诉我：“你知道吗？在每个泰国硬币背面，都雕刻着一处名刹古庙的标志性建筑图案。这些寺庙大多历史悠久，有着神秘的传说。”<br><br>我掏出一枚10铢硬币，研究后得知上面是曼谷的郑王庙。<br><br>“如果只看一座寺庙，那就它吧？”</li><li><img src=\"http://p.qpic.cn/smart_cd/0/23bf8b93891956c17a4230618cc461a2/800\"></li><li>“ 亚洲最堵”的曼谷仿佛让时间静止了下来，短短十几公里的路程经历了一个半小时的车程。好在，我们在夕阳西下之前邂逅了坐落在湄南河东岸的郑王庙。</li><li><img src=\"http://p.qpic.cn/smart_cd/0/20f01db31640bd762869d04c43a093f5/800\"></li><li>郑王庙是纪念 泰国 民族英雄郑昭的寺庙。听说因为那高79米的“拍攀”大佛塔直入云端，每天最先接触到阳光，郑王庙也被称为“黎明寺”。</li><li><img src=\"http://p.qpic.cn/smart_cd/0/70681f05273557d2e0e2d84aebbbe869/800\"></li><li>拍摄地点：郑王庙旁郑昭塑像旁<br>MV：2’17”—2’20”<br><br>数头大象围绕在郑昭塑像周围，陪着他凝望着湄南河，守护着湄南河。<br>湄南河孕育了一代又一代 泰国 人，它自北而南贯穿 泰国 ，在 曼谷 入 海口 投入海洋的怀抱。</li><li><img src=\"http://p.qpic.cn/smart_cd/0/2e6c148a0d07cdbf054983a697d6cd58/800\"></li><li>因为寺内有规定，进入寺庙的女生下身衣物要过膝，上身不能露肩，我们在短暂整理着装后入内。</li><li><img src=\"http://p.qpic.cn/smart_cd/0/0859fc947e252bdadea4f92203f58a10/800\"></li><li>寺内有五座一模一样的佛舍利塔，一大四小。大塔和周围四座小塔组成了庞大而美丽的塔群。身在寺内，游客可以顺梯而上，站在塔上可以眺望到湄南河对岸的曼谷市景。</li><li><img src=\"http://p.qpic.cn/smart_cd/0/744ace388f26e6f681937925324f2967/800\"></li><li>塔身由许多瓷片装饰镶嵌，穿行塔身周围，我说我们照张背影牵手照吧，你反对：多土啊。我无奈的说，照片里从来都没有我，露露手也不行吗？你转过身来，伸出了手。</li></ul></div></div>\n\n','2018-09-10 19:14:00',30,'ysNWsnHoG8p2EGzEXKvaCj'),('rYFcES9XR22S9dvtihGGnE','纳尼~有气泡才是手搓冰粉？来图解一下你没吃过的冰籽籽~','<p>\n</p><div><img src=\"http://p.qpic.cn/smart_cd/0/0bf11cc48287f56e176976c17bdf1472/800\"></div> <div><div><ul><li><br>话说今天瞄了一眼温度计，34.4℃～\n 这预示着在不久的将来会迎来人蒸桑拿，多肉渡劫的日子～ 为了应对炎炎夏日，成都各种以冰粉为主题的小店雨后春笋般的架势疯狂开了起来～ \n不少公众号也都把成都各稀奇古怪与藏在大犄角旮旯的冰粉店给翻了出来～ 文章里几乎都有提到“嗯～ \n冰粉有气泡，确认手工无疑～”“手工冰粉有气泡，没气泡的是冰粉粉兑的～” <br><br>纳尼～ \n回忆小时候妈妈奶奶手搓的冰粉都没有气泡啊，一碗晶莹剔透而又饱满的透明冰粉，混以小碗红糖熬制的糖水，豪气的大口送入嘴中，饱满而又吹弹可破的冰粉在口腔了崩开，一股沁人心脾的清凉瞬间化解夏日的炎炎～\n 这爽快的感觉可不是需要加冰的果冻式软趴气泡冰粉能够比拟的～<br><br>于是疑惑来了，儿时记忆的宜宾冰粉口感色泽都有异于成都常见的气泡冰粉，而曾经在贵州遵义出现的野冰粉，台湾的爱玉冰，与之相比也是大相径庭的～\n 所以究竟是有多少种冰籽籽呢？每每向店家打听，店家回答都是出奇的一致：当然是冰籽啦～ 但永远说不清楚此款冰籽取自于哪种植物～<br><br>只能尝试在旅行的记忆碎片中寻觅线索，加之强大的度娘，于是得知以下几种冰籽：<br><br><strong>果香十足，号称最为好吃的玫瑰色冰粉的山枇杷～</strong><br><br>植物形态：（以下图片来自于百度～）<br></li><li><img src=\"http://p.qpic.cn/smart_cd/0/8c2488209f31ae7e49a049b2d0fe03f6/800\"></li><li><img src=\"http://p.qpic.cn/smart_cd/0/394ae703c97a9be1504419059929631e/800\"></li><li><img src=\"http://p.qpic.cn/smart_cd/0/254545ba3e2b3ca19218756b032507e6/800\"></li><li><img src=\"http://p.qpic.cn/smart_cd/0/4be042f6053ca04f425ec39689c3109d/800\"></li><li><br>在万能的某宝没有见到其身影，于是无法购买，可能是产量少加上季节性的原因吧～</li><li>\n<br></li><li><strong>台湾爱玉冰的爱玉籽，以阿里山出产的野生爱玉最好～</strong><br><br>植物形态：（以下图片来自于百度～）<br></li></ul> <li><img src=\"http://p.qpic.cn/smart_cd/0/d6bf32e7978b2396d3a1aad986c436f8/800\"></li> <li><img src=\"http://p.qpic.cn/smart_cd/0/1062e0adac22f03a1f35c8536bb37c28/800\"></li> <li><br><strong>冰籽籽形态：</strong></li> <li><img src=\"http://p.qpic.cn/smart_cd/0/7788bc12a96cd1702ed64cd62e1aea93/800\"></li> <li><br></li>\n\n</div></div>\n\n','2018-09-15 20:24:35',11,'zRBQfUrUWmfX9W5JsEs23V'),('ryh5UtWYgRd3bhbqNRQdrK','想知道迷失在千亩向日葵地里是什么感觉么？就在成都这了…','<p>\n</p><div><img src=\"http://p.qpic.cn/smart_cd/0/9ebc4b0e9078531da9ab0216e3f60697/800\"></div> <div><div><ul><li>_<br> <br>    向阳而开的花，<br>    盛开的如阳光般灿烂，<br>    充满着阳光的味道。<br><br>    想躺在向日葵上，<br>    即使沮丧，<br>    也能面朝阳光。<br> <br>每个人，对向日葵都藏着一份爱恋，爱它对太阳守护的执着，爱它的灿烂，爱它的明媚。</li><li><img src=\"http://p.qpic.cn/smart_cd/0/a4c02fb4569020ea4260ba5627e5d6f7/800\"></li><li><img src=\"http://p.qpic.cn/smart_cd/0/3dc7eaaba75b1678ea44549e1c1797ec/800\"></li><li><img src=\"http://p.qpic.cn/smart_cd/0/cceeb337114eb7d5bcca66c184f2629c/800\"></li><li><img src=\"http://p.qpic.cn/smart_cd/0/b3f369c6399b44bbff587b2bbd023988/800\"></li><li><img src=\"http://p.qpic.cn/smart_cd/0/894110be84feb5aa3b9b66c0052f0a12/800\"></li></ul></div></div>\n\n','2018-08-30 09:22:22',4,'ysNWsnHoG8p2EGzEXKvaCj'),('tdKF6BPNzxbL38JyUd9LeH','成都人过中秋节的家宴，饭桌上肯定会出现这6样菜','<p>\n</p><div><img src=\"http://p.qpic.cn/smart_cd/0/5795c879e072740db20be98431db11bb/800\"></div> <div><div><ul><li>你们每年最难过的一段时间是好久？<br><br>对于我来说，就是端午到中秋之间。因为这是一年的节假日中间最长的间隔，整整3个多月，除了周末没有假期。<br><br>熬过了这段时间，终于等来的中秋节，除了耍，我还一定会跟家里人一起吃一顿「不随便的家宴」。既然是「不随便」，就还是要讲究一定的形式感，噶。</li><li><img src=\"http://p.qpic.cn/smart_cd/0/2987bb3ecf864f861d3867e09fe585af/800\"></li><li>这个形式感最重要的还不是在家弄还是下馆子，而是：「饭桌上一定要出现哪几道菜」。</li><li>成都人的家宴菜式，印象中少不了这几样：<br><br>·红油拌的凉菜<br>·一边看电视/吹牛/喝酒一边拿在手上啃的肉<br>·上台面又不过分奢侈的海鲜<br>·老年人喜欢的蹄膀肘子<br>·非川味但又对成都人胃口的菜<br>·传统的饭后甜品<br>……</li><li>上周五，饭团就邀请了8位网友，在成都香格里拉大酒店的香宫中餐厅一起提前吃了一顿中秋团圆宴。</li><li><img src=\"http://p.qpic.cn/smart_cd/0/5fcf8a5f4510b95e51cd3b4d590952e6/800\"></li><li>为什么会选择香宫呢？<br><br>因为今年成都推出中秋家宴的五星级酒店不多，香宫的中秋家宴，价格在酒店里比较适中。加上香宫本身的中餐水平在业界做得还不错，所以他们性价比还是有的。</li><li><img src=\"http://p.qpic.cn/smart_cd/0/cad5cebc46b6a880adbb2b2741a17f3f/800\"></li><li>就在这天的饭桌上，我找到了成都人家宴的仪式感。</li><li>【这几道菜组成了成都人的家宴】</li><li>这次中秋团圆宴的菜单，先放在前面，一共十六份21道菜。其中的菜品，我就按照前面说的成都人家宴必现菜式的顺序来讲一讲。</li><li><img src=\"http://p.qpic.cn/smart_cd/0/ccd9b1ea170ce62ef37df46710508df4/800\"></li><li>·红油拌的凉菜<br><br>餐前的凉菜，一定是红油最先打开成都人的胃口，凉拌耳片、凉拌拱嘴……最经典的还是凉拌鸡。在香宫，这道菜叫鸿运鸡，作为头盘寓意也不错。</li><li><img src=\"http://p.qpic.cn/smart_cd/0/2edd1646bf0f6f1ce833b08e0495d71a/800\"></li><li>·一边看电视/吹牛/喝酒一边拿在手上啃的肉<br><br>香宫的烤乳鸽一直是成都做得拔尖的一家，外皮烤得焦香，又锁住了肉的水分。另外他们的鸭脑壳特别适合下酒，又麻又辣，比很多外头的网红川菜馆子的鸭脑壳都做得更香。</li><li><img src=\"http://p.qpic.cn/smart_cd/0/13550d623a0fbfcf678b538d2bfb29a4/800\"></li><li>因为是和家人坐在一起吃饭，所以多几样啃的肉也没有失礼一说。迎宾六味碟里的黄花鱼也炸得很酥，咸香味也下酒。</li><li><img src=\"http://p.qpic.cn/smart_cd/0/871e4ee3f8cd95097ac5c47494770ed6/800\"></li><li>·上台面又不过分奢侈的海鲜<br><br>波士顿龙虾从性价比和肉量来说，都像是为一家人share而生的一种海鲜，香宫这里做的避风塘口味，肉多、不绵有弹性，而且不辣所以对老人小孩都友好。</li></ul></div></div>\n\n','2018-09-10 16:49:45',2,'ysNWsnHoG8p2EGzEXKvaCj'),('tKsuqedKJgqwNRVg2iPHm2','Nemo贰周岁的旅行——那个夏天留在普吉岛的脚印','<div><div><br></div></div><div><img src=\"http://p.qpic.cn/smart_cd/0/fb33f7e8c9a2693038727908b2215197/800\"></div><div><div><ul><li><img src=\"http://p.qpic.cn/smart_cd/0/1f43e7a4cc5a65c19c88de2ee36a704b/800\"></li><li>正在参加“我是企鹅旅行家第一期”活动<a target=\"_blank\" href=\"http://panda.qq.com/cd/thread/1032410893164842\">http://panda.qq.com/cd/thread/1032410893164842</a><br><br><br>老规矩，攻略资讯都在文末，还有神秘彩蛋在等你</li><li><img src=\"http://p.qpic.cn/smart_cd/0/67f8b0ebe87fc43b8073f124a2cd1d88/800\"></li><li>从呱呱坠地到牙牙学语<br>从步履蹒跚到自在欢跑<br>两年时光匆匆而去<br>一转眼怀里的小婴儿也已成长了两周岁<br>两周岁的小孩是敏感的<br>会在旅途中用心感受那些一点一滴的快乐和不开心<br>两周岁的小孩也是叛逆的<br>可以非常自我的在旅途中做出一些固执的坚持<br>喜欢她在海滩边追逐海浪时欢快笑容<br>喜欢她咿咿呀呀哼着我们听不懂的歌曲时懵懂的表情<br>喜欢她在看到看到大象后害怕得扑倒我们的怀里<br>喜欢她疯累后半睁着疲惫的双眼趴在我们肩头<br>成长<br>就是一场漫长旅行<br>还记得那个夏天<br>在 普吉岛 的沙滩上<br>留下了你两周岁的第一个脚印</li><li><img src=\"http://p.qpic.cn/smart_cd/0/08bcca798e7efd911f8e0e226576f0ac/800\"></li><li><img src=\"http://p.qpic.cn/smart_cd/0/eb7303a2b4a8aba48a65c407cfacbe50/800\"></li><li>在小Nemo两岁生日前很久，Nemo麻麻就开始算计生日的时候带Nemo去哪里。<br>作为喜欢旅行的粑粑麻麻，一直认为，只要有机会，就带上小Nemo出去走走看看是一件很好不错的选择。即可以在旅途中增长很多见识，也可以在旅途中磨灭一些小孩在家里不好的习惯。<br>于是选择目的地成了很头疼的一件事情，从 三亚 到 芽庄 ，从 富国岛 到 苏梅岛 ， 普吉岛 ，基本上把这些目的地挨着捋了个遍。最后还是把目的地定在了 普吉岛 。其实这些地方都是比较适合亲子游的目的地。 普吉岛 的亲子项目相对来说更加成熟一些，因为雨季所以机票酒店这些价格也还算便宜。所以麻麻最终把小Nemo的两周岁生日旅行目的地定在了 普吉岛 。但是其实这个时间去 普吉岛 不太好，因为是雨季，所以经常都是下雨，而且海面的浪比较大。所以这里还是不建议大家暑假的时候去 普吉岛 。<br>整个旅行还算是一场完美的旅行，当然中间也有一些悲催的小插曲。其中最不好的一件事还是在旅途中小Nemo在亲子酒店里感染上了手口足病。还好是轻症，发了一天多烧就恢复了，所以没有影响到后面的旅途。这个事情后面会有详细的介绍，文末会有一些注意事项，希望带宝贝出门的粑粑麻麻们都注意一下。<br>旅途的前半部分是两家人，后面因为行程和假期时间，在芭东就分开了。<br>有个小姐姐在一起Nemo还是很开心的。<br>我们在卡马拉海滩的SUNWING亲子酒店住了2天<br>芭 东海 滩住了2天<br>皇帝岛住了2天<br>因为带Nemo去 曼谷 野生动物园所以 曼谷 住了一天</li><li><img src=\"http://p.qpic.cn/smart_cd/0/7e3f4b6ebd6f94e5b3b9ecc0bcf1a892/800\"></li><li>Nemo和同行的萱萱小姐姐，非常文静的小女孩。Nemo和她比起来就是一个小汉子。旅途中小Nemo反而经常把萱萱姐姐欺负得哭。真的也是醉了。</li><li><strong>出发！去普吉</strong></li><li>从 成都 出发，1个多小时的高铁加上轻轨，来到了 重庆 的江北国际机场。<br>在小Nemo10个月左右的时候，我们曾经也带她去过一次 泰国 甲米 。那个时候真的是天使宝宝。<br>可以参看那时候的游记<br><a target=\"_blank\" href=\"http://panda.qq.com/cd/thread/1019812254253374\">http://panda.qq.com/cd/thread/1019812254253374</a></li></ul></div></div>','2018-09-08 15:04:29',29,'mLVKzNwXjNUx9B2Nsthp9F'),('txPW7z6PZ6eZEeAtjZP5PQ','韩式炒年糕','<p>\n</p><p>虽然不追韩星，但是真的是特别喜欢看韩剧，每次看韩剧的时候还会对着韩国的美食流口水，简直太诱人了，所以就学着做了这道韩式炒年糕。 </p><img src=\"http://images01.mopimg.cn/imgs/20180914/20180914_e2e9d37139749097f3b93d7a0f30535e.JPEG\" width=\"400\" height=\"300\"><p>\n 韩式炒年糕 原料：年糕300克、洋葱半个、鱼丸4个、青椒1个、韩式甜辣酱、番茄酱。  做法： \n1、洋葱切片、青椒切块，炒锅内先铺一层切好的洋葱、再铺上青椒  2、放上鱼丸，鱼丸上铺年糕  3、两大勺辣酱放在上面，不用翻动  \n4、倒一点水，没过食材的一半  5、煮十分钟，出锅前调入番茄酱即可。  经验分享：  1、年糕制作前先用热水烫软，防粘锅。  \n2、煮制时加水的量一定不要太多，等基本收干水份即可关火。 </p><p>3、出锅时加入番茄酱口感更好。</p>\n\n','2018-09-14 23:23:38',181,'AaPykFXjjwquWaoHtVDumS'),('v5Y9FL5vTsoGbV9TVtVvCY','【成都美食攻略】不可错过的6家网红餐厅','<p>\n</p><div><img src=\"http://p.qpic.cn/smart_cd/0/4a94389acaef5a61e3f89e5ecb2f0367/800\"></div> <div><div><ul><li>成都，一个值得你吃一辈子的城市。<br>大街上除了肤白貌美的川妹子外，最吸引人的就是街边的各种美食了。<br>曾经有一个段子：<br>“一个来自美国的老外，来到成都就夸下海口说要花1年时间吃遍成都。<br>如今，15年过去了，他都还在成都吃……还当起了成都电视台的吃货主持人……”<br>很多外地人觉得，成都能吃的只有火锅、串串……<br>不过，成都美食可不仅仅局限在火锅上<br>只是这满街的美食，选起来也实在费劲。<br>今天，我就选几家成都目前比较火的一些店推荐给大家。<br>我推荐的这几家店都在成都市中心的位置，交通方便，不少都已经是网红店了<br>如果大家觉得还不错想去体验的，尽量早点去……</li><li><strong>1. 成都吃客（致民路店）【精品川菜】</strong><br><br>地址：致民路48号附1号<br>附近景点推荐：春熙路、太古里、九眼桥<br>交通：地铁3号线B出口，直行50米。<br>人均消费：85/人<br>推荐指数：五颗星。</li><li><img src=\"http://p.qpic.cn/smart_cd/0/267fc59c9e57583e338fbe6a021b00d4/800\"></li><li>“成都吃客”在成都已经是非常火爆的一家网红餐厅了，致民路这家店是他们新开业的分店。<br>相比他们魁星楼的老店，用餐环境可以说是好了很多，餐厅的面积也大了许多。<br>不过，虽然是新店，但是因为“成都吃客”的名气实在太大了，晚上来吃饭的话，依然需要排队。<br>我是中午过来的，而且是开业第二天来的，来的比较早，都没有排队。</li><li><img src=\"http://p.qpic.cn/smart_cd/0/22ce91418d7b0cfd5537c1c4c2c0be59/800\"></li><li>用餐环境比老店好多了，装修设计都充满了设计感。<br>附近也是成都的一些热门景点。<br>比如：太古里，春熙路，IFS，九眼桥，合江亭等，这些景点步行就可以到达。<br>另外成都的共享单车和网约车都很方便。</li><li><img src=\"http://p.qpic.cn/smart_cd/0/ed17c9b6c35d6454a7eb011db6034288/800\"></li><li><img src=\"http://p.qpic.cn/smart_cd/0/daed34db6a497c2cbdf1e703ecaedf83/800\"> <p>银耳雪梨汤：他们家很有特色的饮品，装在一个保温壶里，汤很浓稠，解辣养生。</p></li></ul></div></div>\n\n','2018-09-05 11:35:27',135,'ysNWsnHoG8p2EGzEXKvaCj'),('VxeNhh82fmKWLVqTB6viKQ','自驾酉阳桃花源，穿越回古代做一个读书人','<p>\n</p><div><img src=\"http://p.qpic.cn/smart_cd/0/1435b6245537b66771df3d3f2ff5465d/800\"></div> <div><div><ul><li>世界上有两个桃花源，一个在你心中，一个在重庆酉阳 。<br>以前书本上学的《桃花源记》，那描述的世外桃源般的生活<br>没有想到其实就在我们身边，就在重庆。<br>这一次从成都出发，感受了一次穿越秦汉的穿越之旅。<br>也体验到了咱们古人读书上课的国学之风。<br>还有美丽的龚滩古镇，百里乌江画廊上的一颗明珠。</li><li><img src=\"http://p.qpic.cn/smart_cd/0/93950d661e254d2d956a036492a605dd/800\"></li><li>关于行程<br>D1 成都--重庆南川--龚滩古镇<br>D2 龚滩古镇--酉阳桃花源<br>D3 酉阳桃花源--阿蓬江大峡谷--成都<br>成都到酉阳现在是全程高速，路程大概7个小时。<br>龚滩古镇需要到彭水下高速，然后再开一段县道，从成都出发大概也是7小时的车程。</li></ul></div></div>\n\n','2018-09-10 17:13:10',7,'mLVKzNwXjNUx9B2Nsthp9F'),('Wnp389r2oLEmjVoUUfWFDi','避暑圣地——成都周边自驾二日游（孟获城、治勒湖，草科温泉等）','<p>\n</p><br><div>  </div>  <div><img src=\"http://p.qpic.cn/smart_cd/0/6a7504a4eaa1dfa92354da2cd71125e4/800\"></div> <div><div><ul><li>这几天成都实在是太太太......热了，那个太阳<span><span></span></span>晒的人着不住，准备周末找个凉快的地方避个暑，顺便拍点好看的照片。先发几张照片看看。</li><li><img src=\"http://p.qpic.cn/smart_cd/0/51c7f3fb59887ff6fec429f8e3d10815/800\"></li><li><img src=\"http://p.qpic.cn/smart_cd/0/f823bcb8bce8c039c50193f5421303a7/800\"> <p>高山草甸+蓝天+白云</p></li><li><img src=\"http://p.qpic.cn/smart_cd/0/755473aaa55b0f6905e199278882718b/800\"></li></ul></div></div>\n\n','2018-09-10 17:13:07',7,'mLVKzNwXjNUx9B2Nsthp9F'),('xQhRxekV7b224KS6GgPswW','不服来试下！','<p><font size=\"4\">\n1、初入江湖：化肥会挥发</font></p><p><font size=\"4\"><br></font></p><p><font size=\"4\">2、小有名气：黑化肥发灰，灰化肥发黑</font></p><p><font size=\"4\"><br></font></p><p><font size=\"4\">3、名动一方：黑化肥发灰会挥发；灰化肥挥发会发黑</font></p><p><font size=\"4\"><br></font></p><p><font size=\"4\">4、天下闻名：黑化肥挥发发灰会花飞；灰化肥挥发发黑会飞花</font></p><p><font size=\"4\"><br></font></p><p><font size=\"4\">5、一代宗师：黑灰化肥会挥发发灰黑讳为花飞；灰黑化肥会挥发发黑灰为讳飞花</font></p><p><font size=\"4\"><br></font></p><p><font size=\"4\">6、超凡入圣：黑灰化肥灰会挥发发灰黑讳为黑灰花会飞；灰黑化肥会会挥发发黑灰为讳飞花化为灰 <br></font></p><p><font size=\"4\"><br></font></p><p><font size=\"4\">7、天外飞仙：黑化黑灰化肥灰会挥发发灰黑讳为黑灰花会回飞；灰化灰黑化肥会会挥发发黑灰为讳飞花回化为灰\n\n\n</font></p>','2018-09-15 21:55:04',37,'HF2GpEcvkpTbW6qbyc9TMf'),('xRt8fdQo7qo3A48fn6U7Vk','中秋期待旅行-成都','<p>\n</p><div><img src=\"http://p.qpic.cn/smart_cd/0/fe9a88b3bf7922a64fdf0bfda03c6083/800\"></div> <div><div><ul><li>衣<br>成都市区的温度要比江苏的偏冷一些，9月中下旬，适宜带一件薄外套，应对早晚温差和阴雨降温；九寨沟、黄龙和峨眉山海拔都在3000-4000米，早晚温差大、天气无常、常降雨，9月中旬适宜毛衣、冲锋衣、防水登山鞋；对比九寨黄龙，峨眉山金顶更冷，山间温差更大，9月中旬山顶温度仅5-6度，且伴有风雨，适宜羽绒服。<br><br>食<br>四川口味偏重、麻、辣，但并非只有辛辣的食物。容易上火、喜好清淡的朋友不必担心。在成都的日常饮食均由老家亲人们安排妥当，加之时间有限，没有去发掘小巷里的美食。我品尝的当地特色在这里推荐给大家：麻辣火锅（涮猪脑、鹅肠、鸭胗、牛肚、辣牛肉等）、罗鸡肉（青城山附近）、芭夯兔火锅（涮兔肉、酱兔头）。回来的时候还塞给了麻椒和辣椒面，到家行旅箱一打开，满箱子的老家味道，好香好香，爱吃的朋友可以带点。相比于成都市区，九寨黄龙一程的伙食简直就是一夜回到解放前，特别是九寨沟内条件有限，自己一定要多备点食物。<br>住<br>本次一共入住了三家酒店，分别是：九寨黄龙——金龙国际度假酒店（两日）、成都市区——成都维也纳国际酒店（环球中心新会展店），这家酒店是本次最满意酒店之一，毕竟是连锁品牌，中秋特价258元，峨眉乐山——熊猫旅馆（一日），总体满意。五星的金龙国际度假酒店住宿条件最好，酒店很新、设施齐全、隔音安静，早餐和晚餐都是自助、品种较多；值的注意的是，九寨黄龙一般的普通酒店是没有洗漱用品提供的，需要自备。成都正熙酒店位置很好，离地铁二号线春熙路口很近，周边吃饭购物很方便，住宿条件一般。熊猫旅馆类似于家庭酒店，我们定了三人间，是一个跃层，可以住下四个人，房间整洁、空间较大、设备齐全、设施较新，酒店位于别墅区，要注意防蚊，总体还是不错的。酒店的话建议大家提前预定，这样才能更加划算。<br>成都市区交通较堵，建议地铁出行。<br>其他<br>1、防晒：九寨黄龙海拔高、紫外线强，一定要防晒、带墨镜！我用了50++防水防汗的水宝宝，还是晒黑了。<br>2、晕车：全程山路十八弯，容易晕车的同学一定要备好药品。<br>3、高原反应：海拔3000-4000米，正常人多多少少都会有点高原反应（头晕、头痛、恶心、呕吐、缺氧等），各人体质各异，在黄龙上看到有人被担架抬下，我个人高原反应是轻微头晕，下车登山后，逐渐适应；建议大家出行前保持充足睡眠，不易产生高原反应，而抗高反的药物，应根据个人具体情况进行准备。<br></li><li><img src=\"http://p.qpic.cn/smart_cd/0/de79c1c3802c7ad1566c84f119f93fde/800\"></li><li><img src=\"http://p.qpic.cn/smart_cd/0/bf786500e282b20e3a7a8c981e0e44e0/800\"></li></ul></div></div>\n\n','2018-09-15 20:28:11',68,'kY2ZPxXTwkqLU5muCPcgA5'),('YUQPXhiep3hBHrkWeXZCR9','成都拍星空，不爬山，哈哈哈哈','<p>\n</p><div><img src=\"http://p.qpic.cn/smart_cd/0/10539b32b22b560967dc56d9eca66cea/800\"></div> <div><div><ul><li>一直想到一个地方，可以拍星空，又不想爬山，避免山区的危险，这下，终于如愿了。</li><li><img src=\"http://p.qpic.cn/smart_cd/0/a6efd390b3d73b6cbd0d289863946b35/800\"> <p>朝霞先上，总体感觉还是不错，可惜是带的最长50端，拍出来效果不是很好。</p></li><li><img src=\"http://p.qpic.cn/smart_cd/0/b6d6795cc57ec965f20cd99090a950a8/800\"> <p>如果有个长焦，拍出来应该更好看吧。</p></li><li><img src=\"http://p.qpic.cn/smart_cd/0/33d7d7cc7ad57a3ae6a1be42e51dc372/800\"> <p>太阳要出来咯。</p></li><li><img src=\"http://p.qpic.cn/smart_cd/0/85b4ef39025934c0add8fab000852530/800\"> <p>然后太阳就出来了。</p></li><li><img src=\"http://p.qpic.cn/smart_cd/0/69d29abb540c26dc36aaecef73239bf2/800\"> <p>忽然一场阵雨，下了几分钟，早上7点的彩虹，也是让我古时积攒的人品得到了体现。</p></li><li><img src=\"http://p.qpic.cn/smart_cd/0/e33fe3b138328910148b5648987aead5/800\"> <p>昨晚就是住这个地方，炎热的8月，三十多度的成都，这儿竟然只有17度，凉爽，凉爽！</p></li><li><img src=\"http://p.qpic.cn/smart_cd/0/608cf8e47bf30d494545e6070ca8a6e9/800\"> <p>拍一张花，本人不是那么喜欢拍花，眼看这花进入尾期了，拍张吧。</p></li><li>天黑了，开始有月亮，没有星星，就玩光绘，等月亮下山好拍星空。</li></ul></div></div>\n\n','2018-09-10 17:11:30',3,'ysNWsnHoG8p2EGzEXKvaCj');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `star`
--

DROP TABLE IF EXISTS `star`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `star` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` varchar(150) DEFAULT NULL,
  `author_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `star_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `front_user` (`id`),
  CONSTRAINT `star_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `star`
--

LOCK TABLES `star` WRITE;
/*!40000 ALTER TABLE `star` DISABLE KEYS */;
INSERT INTO `star` VALUES (26,'CiKycWfSSo3F79To7AcXgJ','ysNWsnHoG8p2EGzEXKvaCj'),(27,'v5Y9FL5vTsoGbV9TVtVvCY','mLVKzNwXjNUx9B2Nsthp9F'),(28,NULL,'ysNWsnHoG8p2EGzEXKvaCj'),(29,'tKsuqedKJgqwNRVg2iPHm2','ysNWsnHoG8p2EGzEXKvaCj'),(30,'rcXjxFCFZQRoXgp7Gchnjm','ysNWsnHoG8p2EGzEXKvaCj'),(32,'xQhRxekV7b224KS6GgPswW','HF2GpEcvkpTbW6qbyc9TMf'),(33,'Wnp389r2oLEmjVoUUfWFDi','mLVKzNwXjNUx9B2Nsthp9F'),(34,'VxeNhh82fmKWLVqTB6viKQ','mLVKzNwXjNUx9B2Nsthp9F'),(35,'igiyooy8r5ytgNdEikudSE','HF2GpEcvkpTbW6qbyc9TMf'),(36,'kQr9huV4TkKiqLcJmyd3vh','ysNWsnHoG8p2EGzEXKvaCj'),(37,'9vvMtCh3QKevqyvg5vinuY','ysNWsnHoG8p2EGzEXKvaCj'),(38,'xRt8fdQo7qo3A48fn6U7Vk','ysNWsnHoG8p2EGzEXKvaCj'),(39,'v5Y9FL5vTsoGbV9TVtVvCY','ysNWsnHoG8p2EGzEXKvaCj'),(40,'PcFfgriHaZWr66ohovfwzn','ysNWsnHoG8p2EGzEXKvaCj'),(42,'igiyooy8r5ytgNdEikudSE','ysNWsnHoG8p2EGzEXKvaCj'),(44,'7qqpTy9RSJa8eSnTudzFCb','ysNWsnHoG8p2EGzEXKvaCj'),(45,'cZBezRxAkvK63aLLfcF3rn','ysNWsnHoG8p2EGzEXKvaCj');
/*!40000 ALTER TABLE `star` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tagname` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (24,'读书'),(26,'旅游'),(27,'大学'),(28,'美食'),(29,'红糖烧饼'),(30,'自驾游'),(31,'薰衣草'),(32,'好玩儿'),(33,'风景'),(34,'青海翡翠湖'),(35,'互联网'),(36,'美女'),(38,'食谱'),(39,'美味'),(40,'赏秋'),(41,'美景'),(42,'娱乐'),(43,'绕口令'),(44,'中秋'),(45,'八月十五'),(46,'成都'),(47,'自由行'),(48,'vue'),(49,'本站');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topcomment`
--

DROP TABLE IF EXISTS `topcomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topcomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `topic_id` varchar(150) DEFAULT NULL,
  `author_id` varchar(100) DEFAULT NULL,
  `origin_comment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  KEY `origin_comment_id` (`origin_comment_id`),
  KEY `topic_id` (`topic_id`),
  CONSTRAINT `topcomment_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `front_user` (`id`),
  CONSTRAINT `topcomment_ibfk_2` FOREIGN KEY (`origin_comment_id`) REFERENCES `topcomment` (`id`),
  CONSTRAINT `topcomment_ibfk_3` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topcomment`
--

LOCK TABLES `topcomment` WRITE;
/*!40000 ALTER TABLE `topcomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `topcomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic` (
  `id` varchar(150) NOT NULL,
  `title` varchar(150) NOT NULL,
  `content` text NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `author_id` varchar(150) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `topic_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `front_user` (`id`),
  CONSTRAINT `topic_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES ('gn4aPHymDtRN6h5wmKT7tZ','去年国庆在熊猫基地人挤人，今年出去游山玩水','<p>\n</p><div><img src=\"http://p.qpic.cn/smart_cd/0/c917bc043c9bb0aa1037f25b46f07f50/800\"></div> <div><div><ul><li>   每次过节放假，都想着要一家人出去去，心头才安逸。<br>   在经历了，上一年国庆：预产期都快到了，说带大宝去熊猫基地看熊猫，坐在3号线上，看着好多小朋友，而且过了春熙路，之后的站都没有人下车，就预感到了动物园和熊猫基地有多火爆。在熊猫大道上，道路拥堵，还是不死心，这都还没有到，不可能就回去了吧！<br>\n    \n买了门票，继续前进，因为出门早，人还不少特别多。结果，到了看“滚滚”的地方，排队老长老长，就那样一步一步的被人推着往前走，那一圈，走了半个多小时。而且滚滚已经晒好太阳，不出来了。就去熊猫基地看人了，再往上，都想去小仔仔的，算了，我们提前回来吧，别再晚点回来都没有车了。下来坐车，看等公交的人100以上，问了打车费用，300到宽窄巷子，疯了......（现在有景区直通车，稍微好一点）<br>   春节：小区里就几个人，广场上没有人，就觉得成都空城了，所以想着去人民公园晒太阳，划船......结果，到了人民公园门口，傻眼了吧，全是人，难道成都人民都来这晒太阳了?<br>   于是，说了，以后要出门，节日坚决不在成都了。再成都就是蹲家里看电视最巴适。</li><li>  所以，今年去小众的地方，散心为主。</li></ul></div></div>\n\n','2018-10-12 13:53:36','ysNWsnHoG8p2EGzEXKvaCj',2),('TgkjvY48gNTQedYTBNW5mG','几个灵感秘诀 当你不知道要拍什么的时候 ','<p>\n</p><p>每一名拍摄者都会遭遇到瓶颈期，经常都会拍了一大堆内容之后变得没有东西可拍，倒不是真的没什么可以拍的内容了，只是觉得什么内容都拍过了，再拍也了然无趣。</p><p>　　灵感并不是常伴左右的，当我们失去了我们的灵感缪斯的时候，只能静下心来寻求改变，让自己在平和的心态中重新找回灵感。当我们发现自己没东西可拍的时候，不妨试试做做这几件事，也许可以帮助我们重新寻回我们的缪斯。</p><p><a href=\"http://academy.fengniao.com/535/pic_5352738_1.html\"><img src=\"https://cms.qn.img-space.com/product/158/627/ceOZVExfme0Y.jpg?imageView2/2/w/700/h/2000/q/90/ignore-error/1/\" title=\"几个灵感秘诀 当你不知道要拍什么的时候 \" alt=\"几个灵感秘诀 当你不知道要拍什么的时候 \" width=\"700\" height=\"466\" align=\"no\"></a></p><p><strong>1、追逐光影</strong></p><p>　　就像我们所知道的那样，摄影永远是关于光的。不管我们拍摄什么题材，不管是建筑、风景、人像还是花花草草，都是在寻找最好的光影。光会以各种各样的方式来改变主体的样子，不管是正午的太阳下形成的强烈阴影，还是傍晚柔和的金色的夕阳，甚至是夜晚城市里五彩的霓虹。</p><p>　　但是实话实说，自然光并不总是完美的，尤其是我们无法随心所欲的去控制自然光，往往要让光来控制我们的拍摄。有光的地方就有阴影，好的阴影和光线一样重要，如果我们能够找到一种方法将光线和阴影同时结合起来的话，那就再好不过了。光无处不在，哪怕在我们没东西可拍的时候，也要观察光，观察影，了解并掌握它们的特性，这样才能够更加得心应手的去利用它们拍出更好看的照片。</p><p><a href=\"http://academy.fengniao.com/535/pic_5352738_2.html\"><img src=\"https://cms.qn.img-space.com/product/158/628/ceZD60draXbE.jpg?imageView2/2/w/700/h/2000/q/90/ignore-error/1/\" title=\"几个灵感秘诀 当你不知道要拍什么的时候 \" alt=\"几个灵感秘诀 当你不知道要拍什么的时候 \" width=\"700\" height=\"466\" align=\"no\"></a></p><p><strong>2、尝试新技术</strong></p><p>　　当我们对一个拍摄题材感到厌烦的时候，不妨尝试一下用另外一种形式去表现。像是我们一直都是拍彩色，这次不妨就尝试一下拍摄黑白，如果我们一直都是拍数码，就尝试一下去拍摄胶片，如果我们总是在白天拍照，下次就不妨试试晚上出去拍照。新的表现一定会带给我们不一样的体验。</p><p><a href=\"http://academy.fengniao.com/535/pic_5352738_3.html\"><img src=\"https://cms.qn.img-space.com/product/158/629/ceQDuAcDOTHU.jpg?imageView2/2/w/700/h/2000/q/90/ignore-error/1/\" title=\"几个灵感秘诀 当你不知道要拍什么的时候 \" alt=\"几个灵感秘诀 当你不知道要拍什么的时候 \" width=\"700\" height=\"466\" align=\"no\"></a></p><p><strong>3、拍摄你所能够想到的最不寻常的东西</strong></p><p>　　可能我们想象不出还能够再拍什么的一个重要的原因是我们总是按照别人的想法去思考拍摄的目标，总是会在拍摄之前想设定别人喜欢什么样的照片，然后尽量去拍出让别人满意的照片。</p><p>　　现在忽视掉这一切，然后按照自己的思绪去思考在你的脑海里究竟什么才是最不寻常，最意想不到的内容，你肯定会为自己开辟一条全新的创意通道。它不一定是古怪的东西，也不一定是新奇的东西，但一定是我们平常最不常注意到的东西。无论你的想法多么疯狂，尽管去拍就是了，说不定就会很有趣呢。</p><p><a href=\"http://academy.fengniao.com/535/pic_5352738_4.html\"><img src=\"https://cms.qn.img-space.com/product/158/630/cejVia623Pzc6.jpg?imageView2/2/w/700/h/2000/q/90/ignore-error/1/\" title=\"几个灵感秘诀 当你不知道要拍什么的时候 \" alt=\"几个灵感秘诀 当你不知道要拍什么的时候 \" width=\"533\" height=\"800\" align=\"no\"></a></p><p><strong>4、去一个新的地方</strong></p><p>　　很多时候我们感到厌烦不过也就是因为面对久了，就跟旅行一样，旅行不过是从自己住烦了的地方跑去别人住烦了的地方。当我们换了一个新的环境，好奇心一定会重新占据上风，看到什么都觉得新鲜，也就有了想要拍照的冲动，陌生的环境，陌生的人和习惯，甚至是陌生的食物，都会为我们提供有价值的主题。</p>\n\n','2018-10-12 14:06:06','zRBQfUrUWmfX9W5JsEs23V',3),('YduCW8X4v8M5HLthVEY3y5','重庆旅游火锅遍地开花 专为选择困难症定制的火锅选... ','<p><br>\n</p><p>我们重庆可以说是国庆旅游呼声最高的城市了，不知道过节期间又有多少的帅哥美女来到重庆，来重庆耍自然耍的是洪崖洞、磁器口、南山这些地方，景点就在那里相信大家也不会走偏方向，游玩也只是分个先后而已。但是到重庆还有一件事不得不做，那就是吃火锅儿，重庆火锅好吃这个是大家都知道的，但是哪一家好吃，这个可能大家就不知道了~这就造成了大家来旅游的一个通病——选择困难症。</p><div><div><img src=\"https://img1.doubanio.com/view/group_topic/l/public/p139780537.jpg\" width=\"500\"></div></div><p>不过没得关系！今天就由我这个混迹重庆火锅江湖的好吃嘴儿来告诉大家，来重庆吃火锅很简单，无论你吃不吃得辣，你是不是选择困难症，在我这份攻略里都帮你们统统解决。来嘛，跟到我来看一看这份专为你们选择困难症定制的火锅选择攻略。</p><p><span>最地道——渝味晓宇火锅</span></p><p>俗话说“旅游吃美食，首先还是吃个地道”，我这个人不喜欢整虚的（不实际）。我推荐还是从最地道的重庆老火锅开始。渝味晓宇火锅相信许多重庆人都不陌生，曾经因为舌尖2红极一时的渝味晓宇，如今也保持着当年那份地道的重庆味道。而且渝味晓宇的本地食客和外地食客比例其实差不多，也就证明渝味晓宇在我们重庆吃货心中还是受到认同的。渝味晓宇位于枇杷山正街86号，这边是渝中区的旧城区也是重庆的老街，历史摆在那里查都查的到。味道上渝味晓宇始终都以纯正的麻辣鲜香深得我心，我几次去两路口办事，路过枇杷山都看到老板在老街上亲自炒料，就这一点，就问那个重庆老火锅火了之后还坚持炒料这门手艺的？食材也很新鲜，我从来没有吃他家拉过肚子，辣度个人感觉适合大众（那些说重庆必须要辣翻天的重庆崽儿些，你们咋不去啃海椒呢？老火锅的精髓才不只有辣，麻和香同样重要）。</p><div><div><img src=\"https://img3.doubanio.com/view/group_topic/l/public/p139780592.jpg\" width=\"500\"></div></div><div><div><img src=\"https://img3.doubanio.com/view/group_topic/l/public/p139780611.jpg\" width=\"500\"></div></div><p>地址：枇杷山正街86号</p><p>交通：轻轨1号线七星岗站下车步行1公里左右</p><p><span>最网红——珮姐老火锅</span></p><p>珮姐老火锅，可以说是现在最网红的重庆火锅店了，有很多的外地朋友、大学同学都在联系我，问我来重庆要不要去试一试网红珮姐。首先我想给在这给大家聊聊，我个人的看法，珮姐老火锅的味道其实还算可以，我个人不“感冒”（喜欢）是因为珮姐最近几年的网红气，珮姐在洪崖洞、较场口这些旅游区都有店，每天人也很多，基本外地游客占多数，珮姐有一点不好，就是辣，过于的执着于这个“辣”字而忘记了老火锅的精髓。我承认珮姐的辣椒是比较霸道，也能激发大家的食欲，但是珮姐的辣，我这个重庆本地人都遭不住，所以如果是喜欢打卡网红店的吃货，我还是推荐你们去的（温馨提示：吃不得辣的朋友准备一下胃药）</p><div><div><img src=\"https://img3.doubanio.com/view/group_topic/l/public/p139780682.jpg\" width=\"500\"></div></div><div><div><img src=\"https://img3.doubanio.com/view/group_topic/l/public/p139780692.jpg\" width=\"500\"></div></div><p>地址：民族路新重庆广场中国工商银行旁边</p><p>交通：公交洪崖洞站111路;151路;181路; 轨道交通1号线、轨道交通6号线小什字站</p><p><span>最特色——洞亭火锅</span></p><p>《火锅英雄》大家都看过吧？洞亭火锅就是电影中提到的洞子火锅，在重庆有很多防空洞都没有使用，为了节省用地，就有人想到了在洞子里面开火锅店，谁知道还火了。洞亭火锅算是众多洞子火锅中比较出名的了，作为重庆本地人的我，我其实去的次数不多，但是洞亭火锅那种氛围还是十分不错的，如果是想要看一看重庆防空洞又想吃一吃重庆老火锅的朋友，洞亭火锅可以说是你的不二之选。</p><div><div><img src=\"https://img3.doubanio.com/view/group_topic/l/public/p139780751.jpg\" width=\"500\"></div></div><div><div><img src=\"https://img3.doubanio.com/view/group_topic/l/public/p139780783.jpg\" width=\"500\"></div></div><p>地址：中山三路153号附1号</p><p>交通：文化宫中门401路;461路;465路;0491路;601路;615路;829路</p><p><span>最新奇——陆派.巴倒烫火锅</span></p><p>到重庆耍分两拨人，一拨人白天，一拨人晚上。耍晚上的人，自然要去一个地方看夜景——重庆南山。巴倒烫火锅，对于重庆人来说，不用我介绍了，天天出租车里面都在广告，虽然人家做广告做的凶，但是巴倒烫火锅也有可取之处，那就是巴倒烫火锅位于重庆南山这个占据地理优势的位置，而且最新奇的是，巴倒烫火锅不是寻常我们坐在馆子里面吃火锅，而是在南山上一层挨着一层，看着重庆夜景吃着重庆火锅儿。从味道来说，巴倒烫火锅味道还是很地道的，我们重庆人还是比较喜欢他家的味道的，就只是我们不经常往南山跑而已，喜欢新奇事物的你，我推荐你去吃一吃。</p><div><div><img src=\"https://img1.doubanio.com/view/group_topic/l/public/p139780829.jpg\" width=\"500\"></div></div><div><div><img src=\"https://img3.doubanio.com/view/group_topic/l/public/p139780836.jpg\" width=\"500\"></div></div><p>地址：南山街道黄金公路陆派火锅一条街</p><p>交通：窝子沟331路</p>\n\n','2018-10-12 14:01:36','ysNWsnHoG8p2EGzEXKvaCj',2);
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group` (
  `user_id` varchar(100) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `user_group_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`),
  CONSTRAINT `user_group_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `front_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group`
--

LOCK TABLES `user_group` WRITE;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;
INSERT INTO `user_group` VALUES ('FNdFhqoMAjAnGH8sNJySXB',2),('HF2GpEcvkpTbW6qbyc9TMf',2),('LNhDD3XjqoeNS9HqhSDzyQ',2),('xBzNaGs62R9RbHzPA6nZzC',2),('ysNWsnHoG8p2EGzEXKvaCj',2),('AaPykFXjjwquWaoHtVDumS',3),('HF2GpEcvkpTbW6qbyc9TMf',3),('kY2ZPxXTwkqLU5muCPcgA5',3),('LNhDD3XjqoeNS9HqhSDzyQ',3),('PtwqBv4uHUYnDMqkA2NFkX',3),('VSwcS6gb7h3qQbkWTcYyWL',3),('xBzNaGs62R9RbHzPA6nZzC',3),('ysNWsnHoG8p2EGzEXKvaCj',3),('zRBQfUrUWmfX9W5JsEs23V',3),('ysNWsnHoG8p2EGzEXKvaCj',5),('FNdFhqoMAjAnGH8sNJySXB',6),('ysNWsnHoG8p2EGzEXKvaCj',6);
/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-14 19:25:19
