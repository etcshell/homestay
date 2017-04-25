-- MySQL dump 10.13  Distrib 5.7.17, for osx10.11 (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	5.7.17

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
-- Table structure for table `api_auth_token`
--

DROP TABLE IF EXISTS `api_auth_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_auth_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(11) NOT NULL COMMENT '用户',
  `token` varchar(255) NOT NULL COMMENT 'TOKEN',
  `ip` int(10) DEFAULT '0' COMMENT 'IP',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `created_at` int(11) NOT NULL COMMENT '添加时间',
  `updated_at` int(11) NOT NULL COMMENT '登录时间',
  PRIMARY KEY (`id`,`user_id`),
  UNIQUE KEY `token_unique` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_auth_token`
--

LOCK TABLES `api_auth_token` WRITE;
/*!40000 ALTER TABLE `api_auth_token` DISABLE KEYS */;
INSERT INTO `api_auth_token` VALUES (2,14,'2',0,10,1483516248,1483516248),(3,20,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiIsImp0aSI6IjMzNDAzMzNCMkMifQ.eyJpc3MiOiIxNjdDNDNFQ0FCIiwiYXVkIjoiODMxRTEzM0Q1NiIsImp0aSI6IjMzNDAzMzNCMkMiLCJ1aWQiOjIwfQ.beR4ZIssRT2J3HSS6Upjrwbqj9nCdiSgWy-2lPY72z4',0,10,1483516741,1483516741),(4,23,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiIsImp0aSI6IjMzNDAzMzNCMkMifQ.eyJpc3MiOiIxNjdDNDNFQ0FCIiwiYXVkIjoiODMxRTEzM0Q1NiIsImp0aSI6IjMzNDAzMzNCMkMiLCJ1aWQiOjIzfQ.K8PwO9mPm5XGvcC_W9lfK6wJb7aiKEU67FVc5v9hh-o',2130706433,10,1483517069,1483517069),(5,24,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiIsImp0aSI6IjMzNDAzMzNCMkMifQ.eyJpc3MiOiIxNjdDNDNFQ0FCIiwiYXVkIjoiODMxRTEzM0Q1NiIsImp0aSI6IjMzNDAzMzNCMkMiLCJ1aWQiOjI0fQ.WM5SWh7Rh4J61-5WXpAoRf1Adpa1IdTJWDKyyM75PjE',2130706433,10,1483517305,1483517305),(6,26,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiIsImp0aSI6IjMzNDAzMzNCMkMifQ.eyJpc3MiOiIxNjdDNDNFQ0FCIiwiYXVkIjoiODMxRTEzM0Q1NiIsImp0aSI6IjMzNDAzMzNCMkMiLCJ1aWQiOjI2fQ.bLVDpAdPZZL9Fy7Q55COLFla7GWJhhGRj41R5jrZNmg',2130706433,10,1483517493,1483517493),(7,31,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiIsImp0aSI6IjMzNDAzMzNCMkMifQ.eyJpc3MiOiIxNjdDNDNFQ0FCIiwiYXVkIjoiODMxRTEzM0Q1NiIsImp0aSI6IjMzNDAzMzNCMkMiLCJ1aWQiOjMxfQ.JlWPeAx8z5ZqDE3nVhpxU4JRDQGvTNVa3Z7LwYvUXWc',2130706433,10,1483519754,1483519754),(8,32,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiIsImp0aSI6IjMzNDAzMzNCMkMifQ.eyJpc3MiOiIxNjdDNDNFQ0FCIiwiYXVkIjoiODMxRTEzM0Q1NiIsImp0aSI6IjMzNDAzMzNCMkMiLCJ1aWQiOjMyfQ.bA7gGpR5rCzDusmA-rVttzvmWlC0V9ua3xPxolUjCOA',2130706433,10,1483519847,1483519847),(9,33,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiIsImp0aSI6IjMzNDAzMzNCMkMifQ.eyJpc3MiOiIxNjdDNDNFQ0FCIiwiYXVkIjoiODMxRTEzM0Q1NiIsImp0aSI6IjMzNDAzMzNCMkMiLCJ1aWQiOjMzfQ.5HsoWvsMCgDjXiacZOTkl-oZmwqwV8C4Qlqs6UODz58',2130706433,10,1483519887,1483519887),(10,34,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiIsImp0aSI6IjMzNDAzMzNCMkMifQ.eyJpc3MiOiIxNjdDNDNFQ0FCIiwiYXVkIjoiODMxRTEzM0Q1NiIsImp0aSI6IjMzNDAzMzNCMkMiLCJ1aWQiOjM0fQ.t9H4AlgO7e4Yz0JCcdzYQCPPMIxbIdfXV-YOyZ55fxw',2130706433,10,1483519941,1483519941),(11,35,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiIsImp0aSI6IjMzNDAzMzNCMkMifQ.eyJpc3MiOiIxNjdDNDNFQ0FCIiwiYXVkIjoiODMxRTEzM0Q1NiIsImp0aSI6IjMzNDAzMzNCMkMiLCJ1aWQiOjM1fQ.QyZSgJVWMF0k3429PomHve752W_ewUeoZWDbkq7n_bM',2130706433,10,1483519943,1483519943),(12,36,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiIsImp0aSI6IjMzNDAzMzNCMkMifQ.eyJpc3MiOiIxNjdDNDNFQ0FCIiwiYXVkIjoiODMxRTEzM0Q1NiIsImp0aSI6IjMzNDAzMzNCMkMiLCJ1aWQiOjM2fQ.gs--RpzX6ivvekmejMQuttxEiSiG95uvEkCBEG-yyFc',2130706433,10,1483519944,1483519944),(13,37,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiIsImp0aSI6IjMzNDAzMzNCMkMifQ.eyJpc3MiOiIxNjdDNDNFQ0FCIiwiYXVkIjoiODMxRTEzM0Q1NiIsImp0aSI6IjMzNDAzMzNCMkMiLCJ1aWQiOjM3fQ.tsFgEFlJdUowynf1u0c9xBEGk6y6z71UwYKTRZs2mLo',2130706433,10,1483519946,1483519946),(14,38,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiIsImp0aSI6IjMzNDAzMzNCMkMifQ.eyJpc3MiOiIxNjdDNDNFQ0FCIiwiYXVkIjoiODMxRTEzM0Q1NiIsImp0aSI6IjMzNDAzMzNCMkMiLCJ1aWQiOjM4fQ.Ier-Qbq9uMKLN7wloauchXDxtKrufV3HmWq4s4v4U-0',2130706433,10,1483519948,1483519948),(15,39,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiIsImp0aSI6IjMzNDAzMzNCMkMifQ.eyJpc3MiOiIxNjdDNDNFQ0FCIiwiYXVkIjoiODMxRTEzM0Q1NiIsImp0aSI6IjMzNDAzMzNCMkMiLCJ1aWQiOjM5fQ.ax5QRqfSa2oFCAwxJ7boygalSDvcl-6pUQacWLu_MBY',2130706433,10,1483519949,1483519949),(16,40,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiIsImp0aSI6IjMzNDAzMzNCMkMifQ.eyJpc3MiOiIxNjdDNDNFQ0FCIiwiYXVkIjoiODMxRTEzM0Q1NiIsImp0aSI6IjMzNDAzMzNCMkMiLCJ1aWQiOjQwfQ.jaVeVyTbHA8vFB0Rnn9vS-3p6y4QYsbKbAEhIVBsaM8',2130706433,10,1483519951,1483519951),(17,41,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiIsImp0aSI6IjMzNDAzMzNCMkMifQ.eyJpc3MiOiIxNjdDNDNFQ0FCIiwiYXVkIjoiODMxRTEzM0Q1NiIsImp0aSI6IjMzNDAzMzNCMkMiLCJ1aWQiOjQxfQ.qecfpUFTonpE6Zg56bgObD3Fdtzv4rbNwlffQvBNcsc',2130706433,10,1483519953,1483519953),(18,42,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiIsImp0aSI6IjMzNDAzMzNCMkMifQ.eyJpc3MiOiIxNjdDNDNFQ0FCIiwiYXVkIjoiODMxRTEzM0Q1NiIsImp0aSI6IjMzNDAzMzNCMkMiLCJ1aWQiOjQyfQ.9J4Kvt1jV7XrCRCUJVZG-f2ZGbNNLy0_ZKXtlYOcy04',2130706433,10,1483519954,1483519954),(19,43,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiIsImp0aSI6IjMzNDAzMzNCMkMifQ.eyJpc3MiOiIxNjdDNDNFQ0FCIiwiYXVkIjoiODMxRTEzM0Q1NiIsImp0aSI6IjMzNDAzMzNCMkMiLCJ1aWQiOjQzfQ.Wk4_V5IPguxTrDl1j0iaLDw3LcAe76eq6z-RleL5KQI',2130706433,10,1483519957,1483519957);
/*!40000 ALTER TABLE `api_auth_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_assignment`
--

DROP TABLE IF EXISTS `auth_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_assignment`
--

LOCK TABLES `auth_assignment` WRITE;
/*!40000 ALTER TABLE `auth_assignment` DISABLE KEYS */;
INSERT INTO `auth_assignment` VALUES ('权限控制','1',1478575681),('用户管理','2',1478579011),('站长','2',1478576753),('系统管理员','1',1478573274);
/*!40000 ALTER TABLE `auth_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item`
--

DROP TABLE IF EXISTS `auth_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item` (
  `name` varchar(64) NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item`
--

LOCK TABLES `auth_item` WRITE;
/*!40000 ALTER TABLE `auth_item` DISABLE KEYS */;
INSERT INTO `auth_item` VALUES ('/admin/assignment/*',2,NULL,NULL,NULL,1478572789,1478572789),('/admin/assignment/index',2,NULL,NULL,NULL,1478573736,1478573736),('/admin/menu/*',2,NULL,NULL,NULL,1478574217,1478574217),('/admin/menu/index',2,NULL,NULL,NULL,1478574220,1478574220),('/admin/permission/*',2,NULL,NULL,NULL,1478572784,1478572784),('/admin/permission/index',2,NULL,NULL,NULL,1478573745,1478573745),('/admin/role/*',2,NULL,NULL,NULL,1478572799,1478572799),('/admin/role/index',2,NULL,NULL,NULL,1478573750,1478573750),('/admin/route/*',2,NULL,NULL,NULL,1478572811,1478572811),('/admin/route/index',2,NULL,NULL,NULL,1478573756,1478573756),('/admin/rule/*',2,NULL,NULL,NULL,1478577983,1478577983),('/admin/rule/index',2,NULL,NULL,NULL,1478577988,1478577988),('/cms/*',2,NULL,NULL,NULL,1482591198,1482591198),('/cms/cms-catalog/*',2,NULL,NULL,NULL,1482591198,1482591198),('/cms/cms-catalog/create',2,NULL,NULL,NULL,1482591198,1482591198),('/cms/cms-catalog/delete',2,NULL,NULL,NULL,1482591198,1482591198),('/cms/cms-catalog/index',2,NULL,NULL,NULL,1482591198,1482591198),('/cms/cms-catalog/update',2,NULL,NULL,NULL,1482591198,1482591198),('/cms/cms-catalog/view',2,NULL,NULL,NULL,1482591198,1482591198),('/cms/cms-show/*',2,NULL,NULL,NULL,1482591198,1482591198),('/cms/cms-show/create',2,NULL,NULL,NULL,1482591198,1482591198),('/cms/cms-show/delete',2,NULL,NULL,NULL,1482591198,1482591198),('/cms/cms-show/index',2,NULL,NULL,NULL,1482591198,1482591198),('/cms/cms-show/update',2,NULL,NULL,NULL,1482591198,1482591198),('/cms/cms-show/view',2,NULL,NULL,NULL,1482591198,1482591198),('/cms/default/*',2,NULL,NULL,NULL,1482591198,1482591198),('/cms/default/index',2,NULL,NULL,NULL,1482591198,1482591198),('/debug/*',2,NULL,NULL,NULL,1478575975,1478575975),('/debug/default/index',2,NULL,NULL,NULL,1478576331,1478576331),('/externalapimanager/*',2,NULL,NULL,NULL,1485164345,1485164345),('/externalapimanager/default/*',2,NULL,NULL,NULL,1485164345,1485164345),('/externalapimanager/default/index',2,NULL,NULL,NULL,1485164345,1485164345),('/gii/*',2,NULL,NULL,NULL,1482334226,1482334226),('/gii/default/index',2,NULL,NULL,NULL,1482334230,1482334230),('/setting/*',2,NULL,NULL,NULL,1482588331,1482588331),('/setting/default/*',2,NULL,NULL,NULL,1482588324,1482588324),('/setting/default/index',2,NULL,NULL,NULL,1482588314,1482588314),('/user/*',2,NULL,NULL,NULL,1482334411,1482334411),('/user/create',2,NULL,NULL,NULL,1482334560,1482334560),('/user/delete',2,NULL,NULL,NULL,1482334560,1482334560),('/user/index',2,NULL,NULL,NULL,1482334416,1482334416),('/user/update',2,NULL,NULL,NULL,1482334560,1482334560),('/user/view',2,NULL,NULL,NULL,1482334560,1482334560),('/wechat/*',2,NULL,NULL,NULL,1482590138,1482590138),('/wechat/api/*',2,NULL,NULL,NULL,1482590138,1482590138),('/wechat/api/index',2,NULL,NULL,NULL,1482590138,1482590138),('/wechat/default/*',2,NULL,NULL,NULL,1482590138,1482590138),('/wechat/default/index',2,NULL,NULL,NULL,1482477435,1482477435),('/wechat/fans/*',2,NULL,NULL,NULL,1482590138,1482590138),('/wechat/fans/index',2,NULL,NULL,NULL,1482590138,1482590138),('/wechat/fans/message',2,NULL,NULL,NULL,1482590138,1482590138),('/wechat/fans/update',2,NULL,NULL,NULL,1482590138,1482590138),('/wechat/fans/upload',2,NULL,NULL,NULL,1482590138,1482590138),('/wechat/media/*',2,NULL,NULL,NULL,1482590138,1482590138),('/wechat/media/create',2,NULL,NULL,NULL,1482590138,1482590138),('/wechat/media/delete',2,NULL,NULL,NULL,1482590138,1482590138),('/wechat/media/index',2,NULL,NULL,NULL,1482590138,1482590138),('/wechat/media/pick',2,NULL,NULL,NULL,1482590138,1482590138),('/wechat/media/update',2,NULL,NULL,NULL,1482590138,1482590138),('/wechat/media/upload',2,NULL,NULL,NULL,1482590138,1482590138),('/wechat/media/view',2,NULL,NULL,NULL,1482590138,1482590138),('/wechat/menu/*',2,NULL,NULL,NULL,1482590138,1482590138),('/wechat/menu/index',2,NULL,NULL,NULL,1482590138,1482590138),('/wechat/module/*',2,NULL,NULL,NULL,1482590138,1482590138),('/wechat/module/index',2,NULL,NULL,NULL,1482590138,1482590138),('/wechat/module/install',2,NULL,NULL,NULL,1482590138,1482590138),('/wechat/module/uninstall',2,NULL,NULL,NULL,1482590138,1482590138),('/wechat/process/fans/*',2,NULL,NULL,NULL,1482590138,1482590138),('/wechat/process/fans/record',2,NULL,NULL,NULL,1482590138,1482590138),('/wechat/process/fans/subscribe',2,NULL,NULL,NULL,1482590138,1482590138),('/wechat/process/fans/unsubscribe',2,NULL,NULL,NULL,1482590138,1482590138),('/wechat/reply/*',2,NULL,NULL,NULL,1482590138,1482590138),('/wechat/reply/create',2,NULL,NULL,NULL,1482590138,1482590138),('/wechat/reply/delete',2,NULL,NULL,NULL,1482590138,1482590138),('/wechat/reply/index',2,NULL,NULL,NULL,1482590138,1482590138),('/wechat/reply/update',2,NULL,NULL,NULL,1482590138,1482590138),('/wechat/simulator/*',2,NULL,NULL,NULL,1482590138,1482590138),('/wechat/simulator/index',2,NULL,NULL,NULL,1482590138,1482590138),('/wechat/wechat/*',2,NULL,NULL,NULL,1482479820,1482479820),('/wechat/wechat/create',2,NULL,NULL,NULL,1482590138,1482590138),('/wechat/wechat/delete',2,NULL,NULL,NULL,1482590138,1482590138),('/wechat/wechat/index',2,NULL,NULL,NULL,1482590138,1482590138),('/wechat/wechat/manage',2,NULL,NULL,NULL,1482590138,1482590138),('/wechat/wechat/update',2,NULL,NULL,NULL,1482590138,1482590138),('/wechat/wechat/upload',2,NULL,NULL,NULL,1482590138,1482590138),('内容管理',2,NULL,NULL,NULL,1482591274,1482591274),('微信营销',2,NULL,NULL,NULL,1482590206,1482590206),('接口管理',2,'接口管理',NULL,NULL,1485164440,1485164440),('权限控制',2,NULL,NULL,NULL,1478574313,1478574313),('用户管理',2,NULL,NULL,NULL,1478578171,1478578171),('站长',1,NULL,NULL,NULL,1478576128,1478576128),('系统管理员',1,NULL,NULL,NULL,1478573215,1478578896),('系统设置',2,NULL,NULL,NULL,1482588386,1482588386),('系统调试',2,NULL,NULL,NULL,1478575904,1478575904);
/*!40000 ALTER TABLE `auth_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item_child`
--

DROP TABLE IF EXISTS `auth_item_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item_child`
--

LOCK TABLES `auth_item_child` WRITE;
/*!40000 ALTER TABLE `auth_item_child` DISABLE KEYS */;
INSERT INTO `auth_item_child` VALUES ('权限控制','/admin/assignment/*'),('权限控制','/admin/menu/*'),('权限控制','/admin/permission/*'),('权限控制','/admin/role/*'),('权限控制','/admin/route/*'),('权限控制','/admin/rule/*'),('内容管理','/cms/*'),('内容管理','/cms/cms-catalog/*'),('内容管理','/cms/cms-catalog/create'),('内容管理','/cms/cms-catalog/delete'),('内容管理','/cms/cms-catalog/index'),('内容管理','/cms/cms-catalog/update'),('内容管理','/cms/cms-catalog/view'),('内容管理','/cms/cms-show/*'),('内容管理','/cms/cms-show/create'),('内容管理','/cms/cms-show/delete'),('内容管理','/cms/cms-show/index'),('内容管理','/cms/cms-show/update'),('内容管理','/cms/cms-show/view'),('内容管理','/cms/default/*'),('内容管理','/cms/default/index'),('权限控制','/debug/*'),('系统调试','/debug/*'),('权限控制','/debug/default/index'),('系统调试','/debug/default/index'),('接口管理','/externalapimanager/*'),('接口管理','/externalapimanager/default/*'),('接口管理','/externalapimanager/default/index'),('权限控制','/gii/*'),('系统调试','/gii/*'),('权限控制','/gii/default/index'),('系统调试','/gii/default/index'),('系统设置','/setting/*'),('系统设置','/setting/default/*'),('系统设置','/setting/default/index'),('用户管理','/user/*'),('用户管理','/user/create'),('用户管理','/user/delete'),('用户管理','/user/index'),('用户管理','/user/update'),('用户管理','/user/view'),('微信营销','/wechat/*'),('微信营销','/wechat/api/*'),('微信营销','/wechat/api/index'),('微信营销','/wechat/default/*'),('微信营销','/wechat/default/index'),('权限控制','/wechat/default/index'),('微信营销','/wechat/fans/*'),('微信营销','/wechat/fans/index'),('微信营销','/wechat/fans/message'),('微信营销','/wechat/fans/update'),('微信营销','/wechat/fans/upload'),('微信营销','/wechat/media/*'),('微信营销','/wechat/media/create'),('微信营销','/wechat/media/delete'),('微信营销','/wechat/media/index'),('微信营销','/wechat/media/pick'),('微信营销','/wechat/media/update'),('微信营销','/wechat/media/upload'),('微信营销','/wechat/media/view'),('微信营销','/wechat/menu/*'),('微信营销','/wechat/menu/index'),('微信营销','/wechat/module/*'),('微信营销','/wechat/module/index'),('微信营销','/wechat/module/install'),('微信营销','/wechat/module/uninstall'),('微信营销','/wechat/process/fans/*'),('微信营销','/wechat/process/fans/record'),('微信营销','/wechat/process/fans/subscribe'),('微信营销','/wechat/process/fans/unsubscribe'),('微信营销','/wechat/reply/*'),('微信营销','/wechat/reply/create'),('微信营销','/wechat/reply/delete'),('微信营销','/wechat/reply/index'),('微信营销','/wechat/reply/update'),('微信营销','/wechat/simulator/*'),('微信营销','/wechat/simulator/index'),('微信营销','/wechat/wechat/*'),('权限控制','/wechat/wechat/*'),('微信营销','/wechat/wechat/create'),('微信营销','/wechat/wechat/delete'),('微信营销','/wechat/wechat/index'),('微信营销','/wechat/wechat/manage'),('微信营销','/wechat/wechat/update'),('微信营销','/wechat/wechat/upload'),('系统管理员','内容管理'),('系统管理员','微信营销'),('系统管理员','接口管理'),('站长','权限控制'),('系统管理员','权限控制'),('站长','用户管理'),('系统管理员','用户管理'),('站长','系统管理员'),('站长','系统设置'),('系统管理员','系统设置'),('系统管理员','系统调试');
/*!40000 ALTER TABLE `auth_item_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_rule`
--

DROP TABLE IF EXISTS `auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_rule`
--

LOCK TABLES `auth_rule` WRITE;
/*!40000 ALTER TABLE `auth_rule` DISABLE KEYS */;
INSERT INTO `auth_rule` VALUES ('修改用户','O:27:\"backend\\components\\UserRule\":3:{s:4:\"name\";s:12:\"修改用户\";s:9:\"createdAt\";i:1482335707;s:9:\"updatedAt\";i:1482335707;}',1482335707,1482335707);
/*!40000 ALTER TABLE `auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_catalog`
--

DROP TABLE IF EXISTS `cms_catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_catalog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `brief` varchar(1022) DEFAULT NULL,
  `content` text,
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_keywords` varchar(255) DEFAULT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `is_nav` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '50',
  `page_type` varchar(255) NOT NULL DEFAULT 'page',
  `page_size` int(11) NOT NULL DEFAULT '10',
  `template_list` varchar(255) NOT NULL DEFAULT 'list',
  `template_show` varchar(255) NOT NULL DEFAULT 'show',
  `template_page` varchar(255) NOT NULL DEFAULT 'page',
  `redirect_url` varchar(255) DEFAULT NULL,
  `click` int(11) DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `is_nav` (`is_nav`),
  KEY `sort_order` (`sort_order`),
  KEY `status` (`status`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_catalog`
--

LOCK TABLES `cms_catalog` WRITE;
/*!40000 ALTER TABLE `cms_catalog` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_show`
--

DROP TABLE IF EXISTS `cms_show`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_show` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalog_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `surname` varchar(128) DEFAULT NULL,
  `brief` varchar(1022) DEFAULT NULL,
  `content` text,
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_keywords` varchar(255) DEFAULT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `template_show` varchar(255) NOT NULL DEFAULT 'show',
  `author` varchar(255) NOT NULL DEFAULT 'admin',
  `click` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_id` (`catalog_id`),
  KEY `status` (`status`),
  KEY `created_at` (`created_at`),
  CONSTRAINT `FK_cms_catalog` FOREIGN KEY (`catalog_id`) REFERENCES `cms_catalog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_show`
--

LOCK TABLES `cms_show` WRITE;
/*!40000 ALTER TABLE `cms_show` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_show` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(256) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` blob,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'用户管理菜单',NULL,NULL,NULL,NULL),(2,'权限控制',NULL,NULL,NULL,'{\"icon\":\"fa fa-lock\",\"visible\":true}'),(3,'路由',2,'/admin/route/index',1,NULL),(4,'权限',2,'/admin/permission/index',2,NULL),(5,'角色',2,'/admin/role/index',3,NULL),(6,'分配',2,'/admin/assignment/index',4,NULL),(7,'菜单',2,'/admin/menu/index',5,NULL),(8,'系统调试',NULL,NULL,NULL,'{\"icon\":\" fa fa-bug\"}'),(9,'gii',8,'/gii/default/index',1,NULL),(10,'debug',8,'/debug/default/index',2,NULL),(11,'规则',2,'/admin/rule/index',6,NULL),(12,'用户管理',NULL,NULL,NULL,'{\"icon\":\"fa fa-user\",\"visible\":true}'),(13,'用户列表',12,'/user/index',1,NULL),(14,'系统设置',NULL,NULL,1,'{\"icon\":\"fa  fa-gear\",\"visible\":true}'),(15,'网站配置',14,'/setting/default/index',1,NULL),(16,'微信营销',NULL,'/wechat/default/index',2,'{\"icon\":\"fa fa-comment\",\"visible\":true}'),(17,'内容管理',NULL,'/cms/cms-show/index',3,'{\"icon\":\"fa fa-book\",\"visible\":true}'),(18,'接口管理',NULL,'/externalapimanager/default/index',1,NULL);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration`
--

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` VALUES ('m000000_000000_base',1482413895),('m141208_201481_cms_init',1482590994),('m141208_201488_setting_init',1482584182),('m150217_131752_initWechat',1482476991);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(32) NOT NULL,
  `type` varchar(32) NOT NULL,
  `store_range` varchar(255) DEFAULT NULL,
  `store_dir` varchar(255) DEFAULT NULL,
  `value` text,
  `sort_order` int(11) NOT NULL DEFAULT '50',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `code` (`code`),
  KEY `sort_order` (`sort_order`)
) ENGINE=InnoDB AUTO_INCREMENT=3116 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT INTO `setting` VALUES (11,0,'info','group','','','',50),(21,0,'basic','group','','','',50),(31,0,'smtp','group','','','',50),(1111,11,'siteName','text','','','地推宝',50),(1112,11,'siteTitle','text','','','包你满意',50),(1113,11,'siteKeyword','text','','','地推，推广',50),(2111,21,'timezone','select','-12,-11,-10,-9,-8,-7,-6,-5,-4,-3.5,-3,-2,-1,0,1,2,3,3.5,4,4.5,5,5.5,5.75,6,6.5,7,8,9,9.5,10,11,12','','8',50),(2112,21,'commentCheck','select','0,1','','1',50),(3111,31,'smtpHost','text','','','localhost',50),(3112,31,'smtpPort','text','','','',50),(3113,31,'smtpUser','text','','','admin',50),(3114,31,'smtpPassword','password','','','111111',50),(3115,31,'smtpMail','text','','','',50);
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `auth_key` varchar(32) NOT NULL COMMENT '自动登录key',
  `password_hash` varchar(255) NOT NULL COMMENT '加密密码',
  `password_reset_token` varchar(255) DEFAULT NULL COMMENT '重置密码token',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `role` smallint(6) NOT NULL DEFAULT '10' COMMENT '角色等级',
  `status` smallint(6) NOT NULL DEFAULT '10' COMMENT '状态',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL COMMENT '更新时间',
  `access_token` varchar(255) NOT NULL DEFAULT '' COMMENT '数据请求token',
  `allowance_updated_at` int(11) DEFAULT NULL COMMENT '请求时间',
  `allowance` int(11) DEFAULT NULL COMMENT '请求数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','Y-DA8cQrziKco8bQCIdz7UI2Hkx5U_Jz','$2y$13$L.hdh3v/plmqe7BticUqR.P4YKZwwsOfHDPYJCWysQ69h1hbNb7PO',NULL,'61558262@qq.com',10,10,1478497390,1478497390,'123',0,0),(2,'kimi','JOTFaOu84l0NC8nLQc4-MpWjJNrZLtai','$2y$13$fOz0yXJfmgN31N6Ytz/iKOFTKaBRzjAhltdnC5tJVVf341j3So9Ye',NULL,'61558263@qq.com',10,10,1478576730,1478576730,'',0,0),(3,'李蔷','FLjlwKFoUUiBNjsMdyJV6P103ojt4mMg','$2y$13$ybuTV08UhYJVHygDZu.Ip.mWcHcrVKsbP9V/N8Hw7zZaIdxL1pfVm',NULL,'615582622@qq.com',10,10,1478577061,1478577061,'',0,0),(4,'kimi.gu','edj-5Z54lECFRakmevZQt6oHbQ9a6NFW','$2y$13$oou7seGNQWGe63GNpyem9u4W1ZnbjNINWavmabRAtLWilJjAB7bkW',NULL,'666342342@qq.com',10,10,1483514536,1483514536,'',0,0),(5,'kimi2.gu','b5YhI7quzWxHsvT9r61fgKy-xjsQChdu','$2y$13$lI5qQafGnkIYw7c1crvkceArRNbriCkEAYxi0HyFuj3jLxHVAIoAO',NULL,'6663423422@qq.com',10,10,1483514756,1483514756,'',0,0),(6,'kimi23.gu','JpMt8kgFrKy_IUPDk-39-DcYNBecbWm_','$2y$13$nxXfRf7HP4qu4tf9PJ/8ret9.NXx1LarV2tSXGBUirK3wZjXkc/7.',NULL,'66634234223@qq.com',10,10,1483515614,1483515614,'',0,0),(7,'kimi243.gu','KQYzgdEC8m3XIK8aK_HR2IJxxfZnQ50n','$2y$13$iWNGeS5g8f3rWr5TuCMBY.bSYgtkQQbnUue3lZzz2DyA5dnKSS/P6',NULL,'666342342233@qq.com',10,10,1483515680,1483515680,'',0,0),(8,'kimi2433.gu','L7a03GdTt5uyTw767lkUfgIKASxExFPC','$2y$13$9q4iRgn5wCr8GFjyli6qd.V/8xOVrWfSdW91sXQ3JLItTMJf4HIR6',NULL,'6663423422333@qq.com',10,10,1483515713,1483515713,'',0,0),(9,'kimi24333.gu','oSobNrgAxrWKRPClZVo3h0LjMq-k75NP','$2y$13$so8LsLFD/39ZMST82OENZ.k/mNkOEG3tWs.w715OAYdR3GAasVxJ2',NULL,'66634234232333@qq.com',10,10,1483515810,1483515810,'',0,0),(10,'kimi243333.gu','chkOYT6SAxiBXVPllbGgetiKR0G_gK6y','$2y$13$WVJo2IfSbXgzueSf9vvI.ebSCA7V9SW8W6CErwJ2svSpLaEPYsMyi',NULL,'666342342332333@qq.com',10,10,1483515844,1483515844,'',0,0),(11,'kimi243e333.gu','tOLCrT-HRDc6sQePu85KlLSCJNmVyVOI','$2y$13$Ob1iwVBhBeyw/IS/Ak7FiO9.eTxtzIGtnyi9cOb0V7/WtnoaMf0Hq',NULL,'6663423423323e33@qq.com',10,10,1483516015,1483516015,'',0,0),(12,'kimi243e3233.gu','kmReZ8ELy2aBasfSq73a5mUqQUtEq6BX','$2y$13$O.Kwbf5rBMqofffCf9Spbel/nGdzkbr7uESON/kEmbTWMfHYXLGu2',NULL,'6663423423323e233@qq.com',10,10,1483516131,1483516131,'',0,0),(13,'kimi2343e3233.gu','EZE7Cs1DKnbOM1yXZqqaZQFX0fIWMkmp','$2y$13$N7PI.onwOCtE3mrKJUvOIOCGkcDEJoNhczCCj.kum59WcXGsCNGhy',NULL,'63663423423323e233@qq.com',10,10,1483516181,1483516181,'',0,0),(14,'kimi2343e32333.gu','PIUDiASONJ4-eYgAPDH-pE1tL-U-A-qf','$2y$13$MA8GnsDJ6UuN6K4A8SpYkOqE6VsV8S1rQx9USkxxYnSjmCZjiBwRa',NULL,'636634233423323e233@qq.com',10,10,1483516248,1483516248,'',0,0),(15,'kimi2343e332333.gu','kjqMbrVbVBI0GLO3-rdAHNj2Y0S2ZmQb','$2y$13$DuBBdahwjUQo56djJCezfOh/TTRKobFRbiqDEIj0ckzwUoQf4FLfa',NULL,'6366342333423323e233@qq.com',10,10,1483516386,1483516386,'',0,0),(16,'kimi2343e33d2333.gu','WQg2hq2jJzJ0NybfuXJc23jJwEmeUNF2','$2y$13$CTi6BSy70RmEL9xvnN2ndeeDVumOp2egGgp2MYLMUZFYPqhuypSH2',NULL,'636634233e3423323e233@qq.com',10,10,1483516412,1483516412,'',0,0),(17,'kimi2343e33d32333.gu','YNSfc3BVSQkIdDoSy2kvYN1r3-SfUBcW','$2y$13$lHO1/emFVkhDhEf/TXmV2.5Uv.991HIha/.qCchUO25C3bqtnN1sO',NULL,'636634233e34233323e233@qq.com',10,10,1483516489,1483516489,'',0,0),(18,'kimi2343e33d32333.gu','t6tIydj0LHvtqUYcHxYYGIjV-NNGO2x5','$2y$13$idM7ZIJdSDZ4vDIVOXPfeOyG9rMgCWhXI1hRNI1zulnVEo49II3fC',NULL,'636634233e34233323e233@qq.com',10,10,1483516637,1483516637,'',0,0),(19,'kimi2343e33d32333.gu','kGAQXTdTUkZ3rimQhDADyDLLHEzfStTQ','$2y$13$wIgrpilr/eutw6BCA6KrJuajHyCAC3O4LqeR.FoBgxX2T6nF3JZuu',NULL,'636634233e34233323e233@qq.com',10,10,1483516672,1483516672,'',0,0),(21,'kimi2343e33d32333.gu','UPB3KXFVhq3tLw4Zb89QYz-RC-iyWrwI','$2y$13$8oIrX0twLtnb2jA5Ze1as.9uaoWi4V2c/wGMTSPuckPNisSkg0VOG',NULL,'636634233e34233323e233@qq.com',10,10,1483517037,1483517037,'',0,0),(22,'kimi2343e33d32333.gu','MjZyULFOqS5WALVTaNp67GzzMOnhicz6','$2y$13$X0IfO4BvHLGxpytjkCQMbuRybObtSMpifoKnsLbgvKCvBWl7iaPRS',NULL,'636634233e34233323e233@qq.com',10,10,1483517056,1483517056,'',0,0),(23,'kimi2343e33d32333.gu','el-4tSIdQmtNfwmTmvQcd9fc6-jQ15E6','$2y$13$AXC1Ruzw/T4ZXEor1zVieOeLaCm8d7XXBkbZ/M8yN7WLOwvXfErhi',NULL,'636634233e34233323e233@qq.com',10,10,1483517069,1483517069,'',0,0),(24,'kimi23343e33d32333.gu','-lCZdPMkhITKHpZ52ok7LqTOKkMr-d5v','$2y$13$CkLBi201pJN7GWgXM/Ue0O.mpUKrywZT5mpsFC4tnVu3LlgxhIaSe',NULL,'6366343233e34233323e233@qq.com',10,10,1483517305,1483517305,'',0,0),(25,'kimi23343e333d32333.gu','Vo63kFBwyOyw1x_UcnGVU_NxoUQz0lHC','$2y$13$mt7IKreKObg0hRmPG9wRrOyIRxaTK8GiCqFS3liMSKV/nsIGX4UiW',NULL,'6366343233e334233323e233@qq.com',10,10,1483517441,1483517441,'',0,0),(26,'kimi23343e333d323e33.gu','9DN8UnTTT6lAnF9wOarbBUAiBo7calsq','$2y$13$cZ/9K9a6.DILb988ZgGfbeKoM6NLyYxjJRXSeRNFkKgZ0lukte1ki',NULL,'6366343233e334e233323e233@qq.com',10,10,1483517493,1483517493,'',0,0),(27,'kimi23343e3333d323e33.gu','0O6EUuGKBgZI-xUF8P7izP4A6YzgqTTe','$2y$13$S1Ab05rG8IwzkTKg2U7Cz.25wG1kE2bnOTHEVu9jpjycHwzrOvRG.',NULL,'63663432333e334e233323e233@qq.com',10,10,1483519545,1483519545,'',NULL,NULL),(28,'kimi23343e3333d323e33.gu','0O6EUuGKBgZI-xUF8P7izP4A6YzgqTTe','$2y$13$S1Ab05rG8IwzkTKg2U7Cz.25wG1kE2bnOTHEVu9jpjycHwzrOvRG.',NULL,'63663432333e334e233323e233@qq.com',10,10,1483519545,1483519545,'',NULL,NULL),(29,'kimi23343e3333d323e33.gu','0O6EUuGKBgZI-xUF8P7izP4A6YzgqTTe','$2y$13$S1Ab05rG8IwzkTKg2U7Cz.25wG1kE2bnOTHEVu9jpjycHwzrOvRG.',NULL,'63663432333e334e233323e233@qq.com',10,10,1483519545,1483519545,'',NULL,NULL),(30,'kimi23343e3333d323e33.gu','0O6EUuGKBgZI-xUF8P7izP4A6YzgqTTe','$2y$13$S1Ab05rG8IwzkTKg2U7Cz.25wG1kE2bnOTHEVu9jpjycHwzrOvRG.',NULL,'63663432333e334e233323e233@qq.com',10,10,1483519545,1483519545,'',NULL,NULL),(31,'kimi23343e333e3d323e33.gu','OuhXL0qxc6hWxJv3b_kITSqBhx-Xg0sz','$2y$13$GZVtCO8g34xkBwFrPhoN2eJbvT2gsTixEHxqPun2kgOs29wu2T9ci',NULL,'63663432333ee334e233323e233@qq.com',10,10,1483519754,1483519754,'',NULL,NULL),(32,'kimi23343e333e33d323e33.gu','KO_mtikUPABqQkwIHTLGoKRy4COHZcsA','$2y$13$iIXtFvQLJja/7NY6t0hcOuIve2HHP5pbQJYWmmNoJ932pbUyIqere',NULL,'63663432333ee3334e233323e233@qq.com',10,10,1483519847,1483519847,'',NULL,NULL),(33,'kimi23343e333e33ed323e33.gu','KKhcRM8knGMfnoU330uVzHjGT86kuH2u','$2y$13$tweU954xjQ2zWjqPdpbeleO.BDdi14cABqDF56UgYYDhW9uiXW65u',NULL,'e63663432333ee3334e233323e233@qq.com',10,10,1483519887,1483519887,'',NULL,NULL),(34,'kimi23343e333e33ed323e33.gu','v9O1OfmAhHyXKYQSZUDSLw3uaGs0Lhbw','$2y$13$lpdIjdhMUBm4OQnCjJq7w.IXfYCKqR2l1a9Yl16yU8iTaOTIg.ysy',NULL,'e63663432333ee3334e233323e233@qq.com',10,10,1483519941,1483519941,'',NULL,NULL),(35,'kimi23343e333e33ed323e33.gu','hIj7BmHfiodAX_2qvaNI3GRZ5ndz_nvf','$2y$13$NnAKh99c7vK7UHEtvYdcQu2HIFfbpZMGYyP7VmTjUIvgHzBnqyTwi',NULL,'e63663432333ee3334e233323e233@qq.com',10,10,1483519943,1483519943,'',NULL,NULL),(36,'kimi23343e333e33ed323e33.gu','J4icBMc80NAmmHlRYoE29GbDgJeHkD9w','$2y$13$QcLQRJR8MOYxpsH5SYwxqu/NYU7tRjLGqeMAZZgJNFrysOa3lCO8W',NULL,'e63663432333ee3334e233323e233@qq.com',10,10,1483519944,1483519944,'',NULL,NULL),(37,'kimi23343e333e33ed323e33.gu','N4X1sLWylvfsTjlYd1N8IT-KjAdy2ngG','$2y$13$IppFy.IyN6DdGIDF3ddPZOBtAoZZjiLrpQnO7kvnE2Bld7JeSNVqu',NULL,'e63663432333ee3334e233323e233@qq.com',10,10,1483519946,1483519946,'',NULL,NULL),(38,'kimi23343e333e33ed323e33.gu','Oyo8brhoYwenNYatayFek_AU48N2rQpI','$2y$13$e684tjJG1GQz9.y89nLcOuZHpSG7MGBTFapIYnXBupnF8UCE.a4dC',NULL,'e63663432333ee3334e233323e233@qq.com',10,10,1483519948,1483519948,'',NULL,NULL),(39,'kimi23343e333e33ed323e33.gu','2ll4ZNeMYDw4sdPSAevUwZIqcVXlbBOe','$2y$13$sRW.TcrrbXbcbjYhMg5YY.sItGj2EqCQBgAWDVjjRbwOenN9al5PS',NULL,'e63663432333ee3334e233323e233@qq.com',10,10,1483519949,1483519949,'',NULL,NULL),(40,'kimi23343e333e33ed323e33.gu','tslUegtLzwFx5Hp3YiVzSrc6Yc6iq64k','$2y$13$bt88Byqdk64kqItBArx0QuHxOlBrKVd53XfbfuBaddcNbjcgxKBh6',NULL,'e63663432333ee3334e233323e233@qq.com',10,10,1483519951,1483519951,'',NULL,NULL),(41,'kimi23343e333e33ed323e33.gu','DlwomES-t4ea7C6iiLoxA25jQFoVtBM2','$2y$13$C4QDNzpboazthE9dBId/POw6/s0A42P1pKA5VCgIBkCGCmZS0M11q',NULL,'e63663432333ee3334e233323e233@qq.com',10,10,1483519953,1483519953,'',NULL,NULL),(42,'kimi23343e333e33ed323e33.gu','FicpSvOJ1iFsaQtHcs1JRx4khSdCzxYn','$2y$13$91buIVoKXDEicKrs56giPOwknzefBLPEsl8KwZ22eK8YgduluK3ye',NULL,'e63663432333ee3334e233323e233@qq.com',10,10,1483519954,1483519954,'',NULL,NULL),(43,'kimi23343e333e33ed323e33.gu','pjPvcOFUeSJRC8ccPa8kGNMvZvyr7YVi','$2y$13$qrfBMTONSJynpVarUQibq.f2T5PeQb.U1hLouxdOLiQEuu7YIHMsa',NULL,'e63663432333ee3334e233323e233@qq.com',10,10,1483519957,1483521155,'',1483521155,4);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat`
--

DROP TABLE IF EXISTS `wechat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '公众号名称',
  `token` varchar(32) NOT NULL DEFAULT '' COMMENT '微信服务访问验证token',
  `access_token` varchar(255) NOT NULL DEFAULT '' COMMENT '访问微信服务验证token',
  `account` varchar(30) NOT NULL DEFAULT '' COMMENT '微信号',
  `original` varchar(40) NOT NULL DEFAULT '' COMMENT '原始ID',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '公众号类型',
  `key` varchar(50) NOT NULL DEFAULT '' COMMENT '公众号的AppID',
  `secret` varchar(50) NOT NULL DEFAULT '' COMMENT '公众号的AppSecret',
  `encoding_aes_key` varchar(43) NOT NULL DEFAULT '' COMMENT '消息加密秘钥EncodingAesKey',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '头像地址',
  `qrcode` varchar(255) NOT NULL DEFAULT '' COMMENT '二维码地址',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '所在地址',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '公众号简介',
  `username` varchar(40) NOT NULL DEFAULT '' COMMENT '微信官网登录名',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '微信官网登录密码',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat`
--

LOCK TABLES `wechat` WRITE;
/*!40000 ALTER TABLE `wechat` DISABLE KEYS */;
/*!40000 ALTER TABLE `wechat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_fans`
--

DROP TABLE IF EXISTS `wechat_fans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_fans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属微信公众号ID',
  `open_id` varchar(50) NOT NULL DEFAULT '' COMMENT '微信ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '关注状态',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '关注时间',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `wid` (`wid`),
  KEY `open_id` (`open_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_fans`
--

LOCK TABLES `wechat_fans` WRITE;
/*!40000 ALTER TABLE `wechat_fans` DISABLE KEYS */;
/*!40000 ALTER TABLE `wechat_fans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_media`
--

DROP TABLE IF EXISTS `wechat_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mediaId` varchar(100) NOT NULL DEFAULT '' COMMENT '素材ID',
  `filename` varchar(100) NOT NULL COMMENT '文件名',
  `result` text NOT NULL COMMENT '微信返回数据',
  `type` varchar(10) NOT NULL DEFAULT '' COMMENT '素材类型',
  `material` varchar(20) NOT NULL DEFAULT '' COMMENT '素材类别',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_media`
--

LOCK TABLES `wechat_media` WRITE;
/*!40000 ALTER TABLE `wechat_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `wechat_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_message_history`
--

DROP TABLE IF EXISTS `wechat_message_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_message_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属微信公众号ID',
  `rid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '相应规则ID',
  `kid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属关键字ID',
  `from` varchar(50) NOT NULL DEFAULT '' COMMENT '请求用户ID',
  `to` varchar(50) NOT NULL DEFAULT '' COMMENT '相应用户ID',
  `module` varchar(20) NOT NULL DEFAULT '' COMMENT '处理模块',
  `message` text NOT NULL COMMENT '消息体内容',
  `type` varchar(10) NOT NULL DEFAULT '' COMMENT '发送类型',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `wid` (`wid`),
  KEY `module` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_message_history`
--

LOCK TABLES `wechat_message_history` WRITE;
/*!40000 ALTER TABLE `wechat_message_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `wechat_message_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_module`
--

DROP TABLE IF EXISTS `wechat_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_module` (
  `id` varchar(20) NOT NULL DEFAULT '' COMMENT '模块ID',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '模块名称',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '模块类型',
  `category` varchar(20) NOT NULL DEFAULT '' COMMENT '模块类型',
  `version` varchar(10) NOT NULL DEFAULT '' COMMENT '模块版本',
  `ability` varchar(100) NOT NULL DEFAULT '' COMMENT '模块功能简述',
  `description` text NOT NULL COMMENT '模块详细描述',
  `author` varchar(50) NOT NULL DEFAULT '' COMMENT '模块作者',
  `site` varchar(255) NOT NULL DEFAULT '' COMMENT '模块详情地址',
  `admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有后台界面',
  `migration` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有迁移数据',
  `reply_rule` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用回复规则',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_module`
--

LOCK TABLES `wechat_module` WRITE;
/*!40000 ALTER TABLE `wechat_module` DISABLE KEYS */;
/*!40000 ALTER TABLE `wechat_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_mp_user`
--

DROP TABLE IF EXISTS `wechat_mp_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_mp_user` (
  `id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '粉丝ID',
  `nickname` varchar(20) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `city` varchar(40) NOT NULL DEFAULT '' COMMENT '所在城市',
  `country` varchar(40) NOT NULL DEFAULT '' COMMENT '所在省',
  `province` varchar(40) NOT NULL DEFAULT '' COMMENT '微信ID',
  `language` varchar(40) NOT NULL DEFAULT '' COMMENT '用户语言',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `subscribe_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '关注时间',
  `union_id` varchar(30) NOT NULL DEFAULT '' COMMENT '用户头像',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `group_id` smallint(6) NOT NULL DEFAULT '0' COMMENT '分组ID',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_mp_user`
--

LOCK TABLES `wechat_mp_user` WRITE;
/*!40000 ALTER TABLE `wechat_mp_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `wechat_mp_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_reply_rule`
--

DROP TABLE IF EXISTS `wechat_reply_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_reply_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属微信公众号ID',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '规则名称',
  `mid` varchar(20) NOT NULL DEFAULT '' COMMENT '处理的插件模块',
  `processor` varchar(40) NOT NULL DEFAULT '' COMMENT '处理类',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `priority` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '优先级',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `wid` (`wid`),
  KEY `mid` (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_reply_rule`
--

LOCK TABLES `wechat_reply_rule` WRITE;
/*!40000 ALTER TABLE `wechat_reply_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `wechat_reply_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_reply_rule_keyword`
--

DROP TABLE IF EXISTS `wechat_reply_rule_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_reply_rule_keyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属规则ID',
  `keyword` varchar(255) NOT NULL DEFAULT '' COMMENT '规则关键字',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '关键字类型',
  `priority` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '优先级',
  `start_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`),
  KEY `keyword` (`keyword`),
  KEY `type` (`type`),
  KEY `start_at` (`start_at`),
  KEY `end_at` (`end_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_reply_rule_keyword`
--

LOCK TABLES `wechat_reply_rule_keyword` WRITE;
/*!40000 ALTER TABLE `wechat_reply_rule_keyword` DISABLE KEYS */;
/*!40000 ALTER TABLE `wechat_reply_rule_keyword` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-20 10:34:18
