/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.5.54 : Database - novel
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`novel` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `novel`;

/*Table structure for table `novel_adcdumn` */

DROP TABLE IF EXISTS `novel_adcdumn`;

CREATE TABLE `novel_adcdumn` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '广告栏主键',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_by` int(11) DEFAULT NULL COMMENT '创建者',
  `modify_date` datetime DEFAULT NULL COMMENT '修改日期',
  `modify_by` int(11) DEFAULT NULL COMMENT '修改者',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `novel_adcdumn` */

/*Table structure for table `novel_category` */

DROP TABLE IF EXISTS `novel_category`;

CREATE TABLE `novel_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '小说分类主键',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '分类名字',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_by` int(11) DEFAULT NULL COMMENT '创建者',
  `modify_date` datetime DEFAULT NULL COMMENT '修改日期',
  `modifu_by` int(11) DEFAULT NULL COMMENT '修改者',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `novel_category` */

insert  into `novel_category`(`id`,`name`,`create_date`,`create_by`,`modify_date`,`modifu_by`) values (1,'玄幻','2017-04-09 16:28:03',1,'2017-04-09 16:28:08',1),(2,'言情','2017-04-09 16:28:57',1,'2017-04-09 16:31:23',1),(3,'军事','2017-04-09 16:29:07',1,'2017-04-09 16:31:25',1),(4,NULL,NULL,1,'2017-04-09 16:31:27',1),(5,'穿越','2017-04-09 16:37:54',1,'2017-04-09 16:37:57',1),(6,'推理','2017-04-09 16:38:05',1,'2017-04-09 16:38:08',1),(7,'修真','2017-04-09 16:38:34',1,'2017-04-09 16:38:37',1),(8,'都市','2017-04-09 16:38:48',1,'2017-04-09 16:38:50',1),(9,'游戏','2017-04-09 16:39:01',1,'2017-04-09 16:39:03',1);

/*Table structure for table `novel_comment` */

DROP TABLE IF EXISTS `novel_comment`;

CREATE TABLE `novel_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '小说评论主键',
  `novel_detail_id` int(11) DEFAULT NULL COMMENT '小说id',
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '评论内容',
  `create_date` datetime DEFAULT NULL COMMENT '评论日期',
  `create_by` int(11) DEFAULT NULL COMMENT '评论者',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `novel_comment` */

/*Table structure for table `novel_detail` */

DROP TABLE IF EXISTS `novel_detail`;

CREATE TABLE `novel_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '小说主键id',
  `category_id` int(11) DEFAULT NULL COMMENT '分类id',
  `novel_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '小说名字',
  `novel_summary` varchar(510) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '小说摘要',
  `novel_author` int(11) DEFAULT NULL COMMENT '小说作者',
  `novel_file_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '小说文件路径',
  `novel_filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '小说文件名',
  `novel_pic_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '小说图片路径',
  `novel_pic_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '小说图片名字',
  `novel_click_rate` int(11) DEFAULT NULL COMMENT '小说点击量',
  `novel_buy_count` int(11) DEFAULT NULL COMMENT '小说购买量',
  `novel_total` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '小说总章数',
  `novel_is_finish` tinyint(4) DEFAULT NULL COMMENT '0.未完结1.完结',
  `price` int(11) DEFAULT NULL COMMENT '小说价格 单位:游戏币',
  `create_date` datetime DEFAULT NULL COMMENT '小说发布日期',
  `modify_date` datetime DEFAULT NULL COMMENT '小说更新日期',
  `create_by` int(11) DEFAULT NULL COMMENT '小说发布者',
  `modify_by` int(11) DEFAULT NULL COMMENT '小说更新者',
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

/*Table structure for table `novel_user_author` */

DROP TABLE IF EXISTS `novel_user_author`;

CREATE TABLE `novel_user_author` (
  `user_id` int(11) NOT NULL COMMENT '关联user表',
  `birth_date` date DEFAULT NULL COMMENT '作者出生年月',
  `pen_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '作者笔名',
  `birth_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '作者出生地',
  `author_introduce` varchar(510) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '作者介绍'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `novel_user_author` */

/*Table structure for table `novel_user_buy` */

DROP TABLE IF EXISTS `novel_user_buy`;

CREATE TABLE `novel_user_buy` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '小说购买主键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `novel_id` int(11) DEFAULT NULL COMMENT '小说id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `novel_user_buy` */

/*Table structure for table `novel_user_collection` */

DROP TABLE IF EXISTS `novel_user_collection`;

CREATE TABLE `novel_user_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收藏书籍主键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `detail_id` int(11) DEFAULT NULL COMMENT '小说id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `novel_user_collection` */

/*Table structure for table `novel_user_info` */

DROP TABLE IF EXISTS `novel_user_info`;

CREATE TABLE `novel_user_info` (
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `real_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户真实姓名',
  `phone` int(11) DEFAULT NULL COMMENT '用户电话',
  `money` int(11) DEFAULT NULL COMMENT '用户余额',
  `gender` tinyint(4) DEFAULT NULL COMMENT '0.女1.男',
  `head_sculpture_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '头像路径'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `novel_user_info` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
