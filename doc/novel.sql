/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.5.54 : Database - noval
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`noval` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `noval`;

/*Table structure for table `novel_category` */

DROP TABLE IF EXISTS `novel_category`;

CREATE TABLE `novel_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '小说分类主键',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '分类名字',
  `createdate` datetime DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `novel_category` */

/*Table structure for table `novel_detail` */

DROP TABLE IF EXISTS `novel_detail`;

CREATE TABLE `novel_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '小说主键id',
  `category_id` int(11) DEFAULT NULL COMMENT '分类id',
  `novel_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '小说名字',
  `novel_summary` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '小说摘要',
  `novel_author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '小说作者',
  `novel_file_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '小说文件路径',
  `novel_filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '小说文件名',
  `novel_pic_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '小说图片路径',
  `novel_pic_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '小说图片名字',
  `novel_click_rate` int(11) DEFAULT NULL COMMENT '小说点击量',
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `create_by` datetime DEFAULT NULL,
  `modify_by` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `novel_detail` */

/*Table structure for table `novel_user` */

DROP TABLE IF EXISTS `novel_user`;

CREATE TABLE `novel_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户主键id',
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户密码',
  `userType` int(11) DEFAULT NULL COMMENT '用户类型',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `novel_user` */

/*Table structure for table `novel_user_info` */

DROP TABLE IF EXISTS `novel_user_info`;

CREATE TABLE `novel_user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户信息主键id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `real_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户真实姓名',
  `phone` int(11) DEFAULT NULL COMMENT '用户电话',
  `money` int(11) DEFAULT NULL COMMENT '用户余额',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `novel_user_info` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
