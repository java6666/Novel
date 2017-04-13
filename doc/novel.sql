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

/*Table structure for table `novel_advert` */

DROP TABLE IF EXISTS `novel_advert`;

CREATE TABLE `novel_advert` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '广告栏主键',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_by` int(11) DEFAULT NULL COMMENT '创建者',
  `modify_date` datetime DEFAULT NULL COMMENT '修改日期',
  `modify_by` int(11) DEFAULT NULL COMMENT '修改者',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `novel_advert` */

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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `novel_category` */

insert  into `novel_category`(`id`,`name`,`create_date`,`create_by`,`modify_date`,`modifu_by`) values (1,'玄幻','2017-04-09 16:28:03',1,'2017-04-09 16:28:08',1),(2,'言情','2017-04-09 16:28:57',1,'2017-04-09 16:31:23',1),(3,'军事','2017-04-09 16:29:07',1,'2017-04-09 16:31:25',1),(9,'武侠','2017-04-11 13:23:12',1,'2017-04-11 13:23:15',1),(4,'穿越','2017-04-09 16:37:54',1,'2017-04-09 16:37:57',1),(5,'推理','2017-04-09 16:38:05',1,'2017-04-09 16:38:08',1),(6,'修真','2017-04-09 16:38:34',1,'2017-04-09 16:38:37',1),(7,'都市','2017-04-09 16:38:48',1,'2017-04-09 16:38:50',1),(8,'游戏','2017-04-09 16:39:01',1,'2017-04-09 16:39:03',1);

/*Table structure for table `novel_comment` */

DROP TABLE IF EXISTS `novel_comment`;

CREATE TABLE `novel_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '小说评论主键',
  `novel_detail_id` int(11) DEFAULT NULL COMMENT '小说id',
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '评论内容',
  `create_date` datetime DEFAULT NULL COMMENT '评论日期',
  `create_by` int(11) DEFAULT NULL COMMENT '评论者',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `novel_comment` */

insert  into `novel_comment`(`id`,`novel_detail_id`,`content`,`create_date`,`create_by`) values (1,1,'这书不错','2017-04-11 13:29:07',3),(2,2,'这书不好看','2017-04-11 13:29:29',3);

/*Table structure for table `novel_detail` */

DROP TABLE IF EXISTS `novel_detail`;

CREATE TABLE `novel_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '小说主键id',
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
  `novel_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '小说类型',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `novel_detail` */

insert  into `novel_detail`(`id`,`novel_name`,`novel_summary`,`novel_author`,`novel_file_path`,`novel_filename`,`novel_pic_path`,`novel_pic_name`,`novel_click_rate`,`novel_buy_count`,`novel_total`,`novel_is_finish`,`price`,`create_date`,`modify_date`,`create_by`,`modify_by`,`novel_type`) values (1,'凡人修仙','《凡人修仙传》是网络作家忘语连载于起点中文网的一部玄幻修仙型小说。小说讲述了一个普通的山村穷小子，偶然之下，跨入到一个江湖小门派，成了一名记名弟子。虽然资质平庸，但依靠自身的坚持不懈和合理算计一步步渐成大道。',2,NULL,NULL,NULL,NULL,334,122,'43242',1,0,'2017-04-11 13:11:45','2017-04-11 13:11:48',2,2,'玄幻/修真'),(2,'穿越黑棺','告诉你们一个秘密，李阳有一口铁箱子，称之为黑棺，居然能穿越世界，电影、电视剧、动漫……',2,NULL,NULL,NULL,NULL,231,3123,'321',1,0,'2017-04-13 15:50:54','2017-04-11 13:19:07',2,2,'都市/爱情');

/*Table structure for table `novel_emailbox` */

DROP TABLE IF EXISTS `novel_emailbox`;

CREATE TABLE `novel_emailbox` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '邮箱表主键id',
  `addressee_id` int(11) DEFAULT NULL COMMENT '发件人id',
  `recipinents_id` int(11) DEFAULT NULL COMMENT '收件人id',
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '消息内容',
  `create_date` datetime DEFAULT NULL COMMENT '发件时间',
  `mail_type` int(11) DEFAULT NULL COMMENT '消息类型1.普通消息2.申请作者3.举报信息',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `novel_emailbox` */

insert  into `novel_emailbox`(`id`,`addressee_id`,`recipinents_id`,`content`,`create_date`,`mail_type`) values (25,3,1,'普通用户申请升级为作者,请管理员处理','2017-04-12 22:07:31',2),(2,3,2,'嗨!','2017-04-11 13:30:27',1),(27,3,1,'普通用户申请升级为作者,请管理员处理','2017-04-12 22:32:39',2),(34,2,3,'safsafds','2017-04-13 15:53:26',1),(33,1,3,'asfa','2017-04-13 15:53:11',1);

/*Table structure for table `novel_user` */

DROP TABLE IF EXISTS `novel_user`;

CREATE TABLE `novel_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户主键id',
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户密码',
  `user_type` int(11) DEFAULT NULL COMMENT '用户类型1.管理员2.作者3.普通用户',
  `account_type` int(11) DEFAULT NULL COMMENT '账号状态1.正常2.封停3.删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `novel_user` */

insert  into `novel_user`(`id`,`username`,`password`,`user_type`,`account_type`) values (1,'zhangsan','123',1,1),(2,'xiaoming','123',2,1),(3,'biaojie','123',3,1);

/*Table structure for table `novel_user_author` */

DROP TABLE IF EXISTS `novel_user_author`;

CREATE TABLE `novel_user_author` (
  `user_id` int(11) NOT NULL COMMENT '关联user表',
  `birth_date` date DEFAULT NULL COMMENT '作者出生年月',
  `pen_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '作者笔名',
  `birth_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '作者出生地',
  `author_introduce` varchar(510) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '作者介绍',
  `create_date` datetime DEFAULT NULL COMMENT '升级为作者时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `novel_user_author` */

insert  into `novel_user_author`(`user_id`,`birth_date`,`pen_name`,`birth_address`,`author_introduce`,`create_date`) values (2,'1995-08-24','三毛','台湾','1964年，得到文化大学创办人张其昀先生的特许，到该校哲学系当旁听生，课业成绩优异。','2017-04-11 13:26:49'),(3,'1993-12-01','aha','32131','312132','2017-04-13 11:31:32');

/*Table structure for table `novel_user_buy` */

DROP TABLE IF EXISTS `novel_user_buy`;

CREATE TABLE `novel_user_buy` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '小说购买主键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `novel_id` int(11) DEFAULT NULL COMMENT '小说id',
  `create_date` datetime DEFAULT NULL COMMENT '购买日期',
  `read_now` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '阅读至',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `novel_user_buy` */

insert  into `novel_user_buy`(`id`,`user_id`,`novel_id`,`create_date`,`read_now`) values (1,3,1,'2017-04-11 13:24:56',NULL),(2,3,2,'2017-04-11 13:25:00',NULL);

/*Table structure for table `novel_user_collection` */

DROP TABLE IF EXISTS `novel_user_collection`;

CREATE TABLE `novel_user_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收藏书籍主键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `detail_id` int(11) DEFAULT NULL COMMENT '小说id',
  `create_date` datetime DEFAULT NULL COMMENT '收藏日期',
  `read_now` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '阅读至',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `novel_user_collection` */

insert  into `novel_user_collection`(`id`,`user_id`,`detail_id`,`create_date`,`read_now`) values (1,3,1,'2017-04-11 13:25:23',NULL),(3,2,1,'2017-04-11 13:25:34',NULL),(4,2,2,'2017-04-11 13:25:38',NULL);

/*Table structure for table `novel_user_info` */

DROP TABLE IF EXISTS `novel_user_info`;

CREATE TABLE `novel_user_info` (
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `real_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户真实姓名',
  `phone` int(11) DEFAULT NULL COMMENT '用户电话',
  `money` int(11) DEFAULT NULL COMMENT '用户余额',
  `gender` tinyint(4) DEFAULT NULL COMMENT '0.女1.男',
  `head_sculpture_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '头像路径',
  `create_date` datetime DEFAULT NULL COMMENT '用户注册日期'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `novel_user_info` */

insert  into `novel_user_info`(`user_id`,`real_name`,`phone`,`money`,`gender`,`head_sculpture_path`,`create_date`) values (1,'张三',2147483647,0,1,NULL,'2017-04-11 12:46:17'),(2,'小明',2147483647,0,1,NULL,'2017-04-11 12:46:51'),(3,'李杰',2147483647,NULL,0,'head\\1492054332886.jpg',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
