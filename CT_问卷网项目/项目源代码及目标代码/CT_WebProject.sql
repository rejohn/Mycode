CREATE DATABASE  IF NOT EXISTS `webdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `webdb`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: webdb
-- ------------------------------------------------------
-- Server version	5.5.37

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
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answers` (
  `idAnswers` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) DEFAULT NULL,
  `answer` varchar(945) NOT NULL,
  `Questionare_idQuestionare` int(11) NOT NULL,
  `IPaddress` varchar(32) NOT NULL,
  PRIMARY KEY (`idAnswers`),
  KEY `fk_Answers_Questionare1_idx` (`Questionare_idQuestionare`),
  CONSTRAINT `fk_Answers_Questionare1` FOREIGN KEY (`Questionare_idQuestionare`) REFERENCES `questionaire` (`idQuestionare`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8 COMMENT='存放用户答案，userID不是外键，可谓空，为空';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (50,36,'7bZf嘿嘿;HhL5jZf0;HhL6jZf1;HhL4mZf1;HhL4mZf2;HhL4mZf3;HhL3mZf0;HhL3mZf1;HhL1sZf1;HhL2sZf2;HhL4mZf0;HhL',107,'192.168.17.212'),(58,34,'7bZf不告诉你;HhL5jZf0;HhL6jZf1;HhL4mZf1;HhL4mZf2;HhL4mZf3;HhL3mZf0;HhL3mZf1;HhL1sZf1;HhL2sZf2;HhL4mZf0;HhL',107,'192.168.17.212'),(60,38,'7bZfSHAZHU;HhL5jZf0;HhL6jZf0;HhL4mZf1;HhL3mZf1;HhL1sZf1;HhL2sZf1;HhL4mZf0;HhL',107,'0:0:0:0:0:0:0:1'),(61,34,'3jZf0;HhL2mZf0;HhL4bZf好;HhL1sZf0;HhL',110,'192.168.17.212'),(62,36,'7bZf123;HhL5jZf0;HhL6jZf1;HhL4mZf2;HhL4mZf3;HhL3mZf0;HhL3mZf1;HhL1sZf1;HhL2sZf2;HhL',107,'192.168.17.212'),(63,38,'7bZf撒地方;HhL5jZf1;HhL6jZf1;HhL3mZf1;HhL3mZf2;HhL1sZf1;HhL2sZf1;HhL4mZf0;HhL',107,'0:0:0:0:0:0:0:1'),(64,36,'7bZf;m;HhL5jZf0;HhL6jZf1;HhL4mZf2;HhL3mZf2;HhL3mZf3;HhL1sZf2;HhL2sZf1;HhL4mZf0;HhL',107,'192.168.17.212'),(67,35,'8sZf0;HhL7mZf0;HhL1bZf45;HhL7mZf1;HhL5sZf1;HhL6sZf1;HhL4mZf4;HhL2bZf学生;HhL3sZf0;HhL',119,'192.168.178.140'),(68,1,'8sZf0;HhL7mZf4;HhL7mZf3;HhL7mZf2;HhL7mZf0;HhL1bZf18;HhL7mZf1;HhL5sZf1;HhL6sZf2;HhL4mZf3;HhL2bZf大宝剑;HhL3sZf2;HhL',119,'192.168.178.140'),(69,1,'7bZf放屁，先杀狗;HhL5jZf1;HhL6jZf0;HhL4mZf1;HhL3mZf1;HhL1sZf0;HhL2sZf3;HhL4mZf0;HhL',107,'192.168.178.140'),(70,40,'8sZf0;HhL7mZf0;HhL4mZf1;HhL1bZf22;HhL7mZf1;HhL5sZf0;HhL4mZf2;HhL6sZf1;HhL4mZf3;HhL2bZf学生;HhL3sZf0;HhL',119,'192.168.178.140'),(71,41,'2jZf0;HhL4bZf2;HhL3mZf0;HhL3mZf1;HhL1sZf1;HhL',122,'192.168.178.140'),(72,40,'3jZf1;HhL2mZf2;HhL4bZf繁忙;HhL1sZf1;HhL',110,'192.168.178.140'),(73,40,'3jZf1;HhL2mZf2;HhL4bZf繁忙;HhL1sZf1;HhL',110,'192.168.178.140'),(74,40,'2jZf1;HhL5sZf2;HhL4bZf热情;HhL3mZf0;HhL1sZf1;HhL',121,'192.168.178.140'),(75,40,'7bZf不知道啊，你呢;HhL5jZf1;HhL6jZf1;HhL3mZf0;HhL1sZf2;HhL2sZf2;HhL4mZf0;HhL',107,'192.168.178.140'),(77,41,'2jZf1;HhL4bZf3;HhL3mZf1;HhL1sZf0;HhL',122,'192.168.178.140'),(78,41,'2jZf0;HhL4bZf3;HhL3mZf1;HhL1sZf1;HhL',122,'192.168.178.140'),(81,1,'3jZf1;HhL2mZf0;HhL4bZfrae;HhL1sZf2;HhL',110,'192.168.178.140'),(83,34,'2jZf0;HhL4bZf2;HhL3mZf1;HhL1sZf1;HhL',122,'192.168.17.212'),(84,34,'2jZf0;HhL5sZf0;HhL4bZf孝顺;HhL3mZf0;HhL1sZf1;HhL',121,'192.168.17.212'),(86,34,'2jZf0;HhL4bZf2;HhL3mZf1;HhL1sZf1;HhL',122,'192.168.17.212'),(88,40,'2jZf0;HhL5sZf0;HhL4bZf细心照料他们;HhL3mZf0;HhL3mZf2;HhL1sZf0;HhL',121,'192.168.17.212'),(89,34,'4mZf1;HhL5bZf能省则省;HhL1sZf1;HhL2sZf2;HhL4mZf0;HhL3sZf1;HhL',124,'192.168.17.212'),(92,34,'4jZf1;HhL2mZf3;HhL2mZf0;HhL2mZf1;HhL3bZf很大的影响;HhL1sZf0;HhL',125,'192.168.17.212'),(93,1,'8sZf0;HhL7mZf2;HhL4mZf1;HhL1bZf22;HhL7mZf1;HhL5sZf1;HhL6sZf1;HhL2bZf学生;HhL4mZf0;HhL3sZf2;HhL',119,'192.168.17.212'),(94,43,'4jZf1;HhL2mZf3;HhL2mZf0;HhL2mZf2;HhL3bZf思维方式的变迁;HhL1sZf0;HhL',125,'192.168.17.212'),(95,35,'4mZf4;HhL5bZf勤俭节约;HhL1sZf0;HhL2sZf1;HhL4mZf0;HhL3sZf0;HhL',124,'192.168.17.212'),(96,1,'4mZf4;HhL5bZf自己挣钱养活自己;HhL1sZf0;HhL2sZf2;HhL4mZf0;HhL3sZf0;HhL',124,'192.168.17.212'),(97,1,'4jZf1;HhL2mZf0;HhL2mZf1;HhL3bZf没影响;HhL1sZf0;HhL',125,'192.168.17.212'),(98,43,'7bZf你TM在逗我？;HhL5jZf0;HhL6jZf1;HhL3mZf3;HhL1sZf1;HhL2sZf3;HhL4mZf0;HhL',107,'192.168.17.212'),(100,34,'8mZf2;HhL4sZf0;HhL8mZf1;HhL5sZf1;HhL8mZf3;HhL7sZf2;HhL6mZf0;HhL1sZf1;HhL2sZf2;HhL6mZf2;HhL3sZf0;HhL6mZf1;HhL6mZf3;HhL9bZf没有建议;HhL8mZf0;HhL',126,'192.168.17.212'),(101,35,'9bZf呵呵;HhL8mZf0;HhL4sZf0;HhL5sZf0;HhL7sZf0;HhL6mZf0;HhL1sZf0;HhL2sZf0;HhL3sZf0;HhL',126,'192.168.17.212'),(102,44,'9bZf娱乐就好，不要盲从盲信;HhL8mZf0;HhL8mZf2;HhL4sZf2;HhL8mZf1;HhL5sZf1;HhL7sZf2;HhL6mZf0;HhL1sZf0;HhL6mZf2;HhL2sZf2;HhL3sZf0;HhL',126,'192.168.17.212'),(103,35,'9bZf呵呵呵;HhL4sZf0;HhL8mZf1;HhL5sZf0;HhL7sZf1;HhL6mZf0;HhL1sZf0;HhL2sZf3;HhL3sZf1;HhL',126,'192.168.17.212'),(104,38,'6mZf3;HhL9bZf没什么建议;HhL8mZf0;HhL4sZf1;HhL5sZf1;HhL7sZf2;HhL1sZf0;HhL2sZf2;HhL3sZf0;HhL',126,'0:0:0:0:0:0:0:1'),(105,37,'7bZf啊啊;HhL5jZf0;HhL6jZf1;HhL4mZf2;HhL3mZf0;HhL3mZf1;HhL1sZf1;HhL2sZf0;HhL4mZf0;HhL',107,'192.168.17.212'),(106,34,'4mZf7;HhL4mZf1;HhL4mZf4;HhL4mZf0;HhL8mZf2;HhL5sZf2;HhL6sZf0;HhL8mZf3;HhL7sZf1;HhL1sZf0;HhL2sZf0;HhL3sZf0;HhL8mZf0;HhL',128,'192.168.17.212'),(107,37,'9bZf无;HhL8mZf2;HhL4sZf1;HhL5sZf1;HhL8mZf3;HhL7sZf1;HhL6mZf0;HhL1sZf0;HhL2sZf3;HhL6mZf1;HhL3sZf0;HhL',126,'192.168.17.212'),(108,34,'8mZf0;HhL1bZf学生;HhL4bZf娱乐;HhL3bZf每天;HhL7sZf0;HhL2bZf21;HhL9mZf0;HhL5bZf是的;HhL6bZf是的;HhL',130,'192.168.17.212'),(109,44,'6mZf3;HhL9bZf还好;HhL8mZf0;HhL4sZf2;HhL5sZf0;HhL7sZf2;HhL1sZf1;HhL2sZf1;HhL3sZf2;HhL',126,'192.168.17.212'),(110,44,'8sZf0;HhL7mZf0;HhL7mZf1;HhL5sZf1;HhL6sZf0;HhL3sZf2;HhL7mZf4;HhL7mZf2;HhL1bZf21;HhL4mZf1;HhL4mZf2;HhL4mZf3;HhL2bZf白领;HhL4mZf4;HhL4mZf0;HhL',119,'192.168.17.212'),(111,35,'9bZf喝好;HhL4sZf0;HhL8mZf1;HhL5sZf0;HhL7sZf1;HhL6mZf0;HhL1sZf0;HhL2sZf0;HhL3sZf0;HhL',126,'192.168.17.212'),(129,35,'9bZf呵呵呵呵;HhL8mZf2;HhL4sZf1;HhL5sZf2;HhL7sZf2;HhL1sZf0;HhL2sZf1;HhL6mZf1;HhL3sZf1;HhL',126,'192.168.17.212'),(130,35,'9bZfhh;HhL8mZf0;HhL4sZf0;HhL5sZf0;HhL7sZf0;HhL6mZf0;HhL1sZf0;HhL2sZf0;HhL3sZf0;HhL',126,'192.168.17.212'),(131,34,'4jZf1;HhL2mZf0;HhL2mZf1;HhL3bZf恩恩;HhL1sZf0;HhL',125,'192.168.17.212'),(132,36,'1bZf1;HhL8mZf1;HhL4bZf4;HhL3bZf3;HhL7sZf1;HhL2bZf2;HhL9mZf0;HhL5bZf5;HhL6bZf6;HhL',130,'192.168.17.212');
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionaire`
--

DROP TABLE IF EXISTS `questionaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questionaire` (
  `idQuestionare` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(45) NOT NULL,
  `title` varchar(45) NOT NULL,
  `subject` varchar(45) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `launchdate` datetime NOT NULL,
  `isalive` tinyint(1) NOT NULL,
  `Users_idUsers` int(11) NOT NULL,
  `isAnonymous` int(11) DEFAULT '1',
  `ageMin` int(11) NOT NULL DEFAULT '0',
  `ageMax` int(11) NOT NULL DEFAULT '100',
  `sexLimit` int(11) DEFAULT '0',
  `analysis` int(11) DEFAULT '0',
  `ipLimit` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idQuestionare`),
  KEY `fk_Questionare_Users_idx` (`Users_idUsers`),
  CONSTRAINT `fk_Questionare_Users` FOREIGN KEY (`Users_idUsers`) REFERENCES `users` (`idUsers`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8 COMMENT='调查表存放处，isa';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionaire`
--

LOCK TABLES `questionaire` WRITE;
/*!40000 ALTER TABLE `questionaire` DISABLE KEYS */;
INSERT INTO `questionaire` VALUES (107,'open','母猪的产后护理调查','Renliziyuan','你存在，我深深的脑海','2014-07-10 14:15:11','2014-08-09 14:15:11','2014-07-10 14:10:54',1,36,1,0,100,0,1,0),(109,'closed','通天塔','品牌营销','他','2014-07-10 15:35:14','2014-07-11 15:35:14','2014-07-10 14:30:25',1,36,1,0,100,0,0,0),(110,'open','调查爱好','其他','爱好调查','2014-07-10 15:21:33','2014-07-11 15:21:33','2014-07-10 15:20:05',1,38,1,0,100,0,0,0),(111,'closed','测试用','品牌营销','测试用','2014-07-10 15:22:36','2014-07-11 15:22:36','2014-07-10 15:22:11',1,38,1,0,100,0,0,0),(119,'open','90后消费者习惯调查','消费分析','调查90后消费者的习惯','2014-07-10 21:14:41','2014-07-12 21:14:41','2014-07-10 21:07:23',1,38,1,18,30,0,0,0),(121,'open','论修养与人生态度','学术教育','如何用态度改变人生','2014-07-10 22:25:09','2014-07-16 22:25:09','2014-07-10 22:08:51',1,40,1,0,100,0,0,0),(122,'open','一个问卷','品牌营销','问卷','2014-07-10 22:22:44','2014-07-11 22:22:44','2014-07-10 22:09:29',1,1,0,18,26,2,0,0),(124,'open','消费观','其他','大学生消费观','2014-07-11 08:59:13','2014-10-19 08:59:13','2014-07-11 08:56:34',1,34,0,3,100,0,0,1),(125,'open','大数据','学术教育','大数据的影响','2014-07-11 09:02:55','2014-10-19 09:02:55','2014-07-11 09:00:53',1,34,1,1,100,0,1,0),(126,'open','微信、微博的影响','其他','微信、微博在大学生中的影响','2014-07-11 09:13:14','2014-08-10 09:13:14','2014-07-11 09:07:41',1,34,1,1,100,0,1,1),(127,'creating','小组战斗力调查','品牌营销','',NULL,NULL,'2014-07-11 09:12:42',1,43,1,0,100,0,0,1),(128,'open','网络消费者购物行为分析','品牌营销','网络消费者购物行为分析','2014-07-11 09:21:34','2014-10-19 09:21:34','2014-07-11 09:15:53',1,34,1,0,100,0,1,0),(130,'open','暑期实践调查表','社会民意','学生问卷调查','2014-07-11 09:22:42','2014-07-20 09:22:42','2014-07-11 09:19:50',1,44,0,0,100,0,0,0),(131,'closed','哈哈哈','品牌营销','嘿嘿嘿','2014-07-11 12:49:24','2014-07-12 12:49:24','2014-07-11 12:46:48',1,36,1,0,100,0,0,1);
/*!40000 ALTER TABLE `questionaire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `idQuestion` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  `question` varchar(445) NOT NULL,
  `answers` varchar(445) DEFAULT NULL,
  `analysise` varchar(445) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `Questionare_idQuestionare` int(11) NOT NULL,
  PRIMARY KEY (`idQuestion`),
  KEY `fk_Questions_Questionare1_idx` (`Questionare_idQuestionare`),
  CONSTRAINT `fk_Questions_Questionare1` FOREIGN KEY (`Questionare_idQuestionare`) REFERENCES `questionaire` (`idQuestionare`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=262 DEFAULT CHARSET=utf8 COMMENT='存放问题，每一个表单的问题存放在此';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (131,'single','对于母猪的产后护理进行调查，应选哪种动物作为实验对象','公猪;母猪;公驴;母鸡;',NULL,1,107),(132,'single','母猪的产后护理中，工作人员需要有什么','武器;C#教材;热情;照烧鸡腿堡;',NULL,2,107),(133,'mutiple','母猪一次通常可以产出几只小猪','1只;3只;10000只;-5只;',NULL,3,107),(134,'mutiple','历史上有哪些人没有研究过母猪的产后护理','孙悟空;金委员长;隔壁老王;路人乙;',NULL,4,107),(135,'judge','母猪的交配对象通常为公猪','',NULL,5,107),(136,'judge','母猪的交配时间通常为秋雨过后','',NULL,6,107),(137,'blank','过年了大家想吃肉，你认为是先杀猪还是先杀驴呢？为什么？','',NULL,7,107),(138,'single','1','11;',NULL,1,109),(139,'mutiple','1','1;1;',NULL,2,109),(140,'single','6','7;9;',NULL,3,109),(141,'single','你喜欢干什么？','听歌;看书;玩游戏;',NULL,1,110),(142,'mutiple','你喜欢学习什么语言','英语;日语;韩语;俄语;',NULL,2,110),(143,'judge','你喜欢回家吗','',NULL,3,110),(144,'blank','请谈谈你小学期的感受','',NULL,4,110),(145,'single','测试用','测试用;测试用;',NULL,1,111),(146,'mutiple','测试用','测试用;测试用;测试用;',NULL,2,111),(147,'judge','测试用','',NULL,3,111),(148,'blank','测试用','',NULL,4,111),(167,'blank','请输入你的年龄','',NULL,1,119),(168,'blank','请输入你的职业','',NULL,2,119),(169,'single','您每月的消费主要花在哪一方面？','生活类;服装类;娱乐类;其他;',NULL,3,119),(170,'mutiple','您平时比较关注哪方面的商品信息？','服装及化妆品;数码产品;体育用品;娱乐消费;其他;',NULL,4,119),(171,'single','您购买产品是否会受到其代言人或者广告影响？','会;不会;看情况;',NULL,5,119),(172,'single','您会追求名牌但价格高昂的产品吗？','会;不会;等价格跌了买;看情况而定;',NULL,6,119),(173,'mutiple','您拥有的数码产品有？','手机;电脑;Pad;MP3;数码相机;',NULL,7,119),(174,'single','您对网上购物有什么想法？','很好用，经常用;觉得不方便;不喜欢，不常用;其他;',NULL,8,119),(182,'single','在那些情形下您会思考人生','平时;遇到挫折;比较闲;',NULL,1,121),(183,'judge','你喜欢老子的人生哲学吗','',NULL,2,121),(184,'mutiple','论人生态度','无论输赢，只为认真;无所谓;细心雕琢生命;',NULL,3,121),(185,'blank','你如何对待父母','',NULL,4,121),(186,'single','你平时爱买人生方面的书吗','爱买;不买;没时间看;',NULL,5,121),(187,'single','1+1=','1;2;3;4;',NULL,1,122),(188,'judge','1+1=2','',NULL,2,122),(189,'mutiple','1+1=','2+0;2;1;3;',NULL,3,122),(190,'blank','1+1=','',NULL,4,122),(193,'single','你的性别','男;女;',NULL,1,124),(194,'single','你的年级','大一;大二 ;大三;大四;',NULL,2,124),(195,'single','你每个月的花费是多少','600;1000;1500;2000;',NULL,3,124),(196,'mutiple','你的消费在哪些方面？','伙食费;书籍等学习用品;娱乐;衣服;其他;',NULL,4,124),(197,'blank','你觉得大学生应该培养怎样的消费观念？','',NULL,5,124),(198,'single','大数据对生活有影响吗？','有;没有;',NULL,1,125),(199,'mutiple','大数据的特点是什么','高效率;高质量;高速;大量;',NULL,2,125),(200,'blank','你觉得大数据带来了什么影响？','',NULL,3,125),(201,'judge','大数据没有任何用处','',NULL,4,125),(202,'single','你的性别','男;女;',NULL,1,126),(203,'single','你的年级','大一;大二;大三;大四;',NULL,2,126),(204,'single','请问您是否使用微信、微博','都使用;使用其中之一;都不使用;',NULL,3,126),(205,'single','对于社会中的突发事件或公共事件，您是否会去微博发表自己的观点，了解大家的想法？','会去，微博上的观点可以代表真实民意;会去，但不完全相信别人观点的真实性;不会去，微博上的观点不能代表真实民意;',NULL,4,126),(206,'single','您觉得微信微博中的信息可信度有多高','50%以下;50%—70%;70%—90%;90%以上;',NULL,5,126),(207,'mutiple','您登陆微博、微信一般做些什么','娱乐新闻;时事政治;热点话题;好友动态;',NULL,6,126),(208,'single','您会在微信微博上结交新的朋友吗','经常会;偶尔会;不会;',NULL,7,126),(209,'mutiple','您关注的人大多数为','亲戚，朋友，同事;明星偶像;有一定影响力的社会名人;新闻媒体;陌生朋友;其它;',NULL,8,126),(210,'blank','请问您对青年群体微信、微博的使用情况有何建议','',NULL,9,126),(211,'single','你觉得自己的战斗力为多少','5;5;5;5;',NULL,1,127),(212,'single','你觉得咱们小组的战斗力为多少','-5;5;5*9;',NULL,2,127),(213,'single','你觉得自己的战斗力为多少','5;5;5;5;',NULL,1,127),(214,'single','你觉得咱们小组的战斗力为多少','-5;5;5*9;',NULL,2,127),(216,'single','您的性别','女;男;',NULL,1,128),(217,'single','您经常在网上购物吗？',' 经常;偶尔; 从来不;',NULL,2,128),(218,'single','您在网上购买商品价格通常是在','100元以下; 100~300; 300~500;500元以上;',NULL,3,128),(219,'mutiple','在网购过程中，您认为哪些网站会对您的购买行为产生影响','网站信用、信誉好;价格实惠;商品齐全; 促销活动多;网友购买后的评价心得好; 快递给力; 网站中的页面布局舒服; 朋友推荐的;',NULL,4,128),(220,'single','购前你会不会去实体店进行对购买物品的体验么','会;不会;偶尔;自己也不清楚;',NULL,5,128),(221,'single','你在网购中是更倾向于什么品牌？','自己经常购买的品牌。;自己了解过但是还未购买过品牌。;偶尔; 完全新的品牌。; 随意购买自己喜欢的，没有特殊的品牌限制。;',NULL,6,128),(222,'single','你认为网上购物的可信度有多少？',' 40%及以下;40%~60%; 60%~90%;90%以上;',NULL,7,128),(223,'mutiple','你认为网上购物有何不足之处？',' 实际商品与网上看的有差别;有些要试的东西不方便试,比如衣服;快递很贵,怕商品运送途中损坏;送货速度慢;容易被不法分子欺骗; 其他;',NULL,8,128),(224,'blank','您的职业是','',NULL,1,130),(225,'blank','您的年龄是？','',NULL,2,130),(226,'blank','您每天使用智能手机的时间是？','',NULL,3,130),(227,'blank','您平时使用智能手机的主要用途是？','',NULL,4,130),(228,'blank','您在空闲时间是否会情不自禁拿出手机来玩？','',NULL,5,130),(229,'blank','您参加的聚会中是否出现过所有人都在拿着手机玩的情况？','',NULL,6,130),(230,'single','您是否更喜欢跟朋友用手机联系？','是;不是;',NULL,7,130),(231,'mutiple','您觉得通过智能手机获得的外界信息能否代替报纸杂志？','是;偶尔是;不是;',NULL,8,130),(232,'mutiple','您周末一般怎么度过？','在家玩电脑;看电影;去旅游;',NULL,9,130),(237,'single','发发发','11;',NULL,1,131),(238,'mutiple','1','1;1;',NULL,2,131),(239,'judge','111111111111','',NULL,3,131),(240,'mutiple','232','23;232;',NULL,4,131),(241,'blank','2313','',NULL,5,131);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `idUsers` int(11) NOT NULL AUTO_INCREMENT,
  `usersname` varchar(45) DEFAULT NULL,
  `userAuthority` int(11) DEFAULT '1',
  `userpassword` varchar(45) DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `address` varchar(145) DEFAULT NULL,
  `isonline` tinyint(1) NOT NULL,
  `isalive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idUsers`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='用户表，userauthority 存放用户权限，1为普通用';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin',2,'admin',1,22,'344',1,1),(34,'零下',2,'123456',0,21,'北京',0,1),(35,'江山寒树',1,'111111',1,22,'北航',0,1),(36,'11211066',1,'11211066',1,22,'Beihang University',0,1),(37,'11211059',1,'bl19960705',1,27,'123.456.789',0,1),(38,'11211071',1,'123456',1,22,'BUAA',0,1),(39,'rejohn',1,'123456',0,22,'BUAA',0,1),(40,'黄海亮',1,'199281abc',1,22,'344',0,1),(41,'我是少女',1,'shaonv',0,20,'Beijing',0,1),(43,'ss',1,'asdfgh',1,19,'bhx37b',0,1),(44,'hhl',1,'199281abc',1,22,'阿富汗',0,1),(45,'我是女生2',1,'nvsheng',0,20,'BEIJING',0,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-07-11 15:13:59
