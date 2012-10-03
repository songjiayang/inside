/*
SQLyog Ultimate v8.71 
MySQL - 5.0.22-community-nt : Database - secondhand
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`secondhand` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `secondhand`;

/*Table structure for table `t_adminuser` */

DROP TABLE IF EXISTS `t_adminuser`;

CREATE TABLE `t_adminuser` (
  `id` bigint(20) NOT NULL auto_increment,
  `a_username` varchar(50) default NULL,
  `a_password` varchar(50) default NULL,
  `a_permission` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_adminuser` */

/*Table structure for table `t_cateogry` */

DROP TABLE IF EXISTS `t_cateogry`;

CREATE TABLE `t_cateogry` (
  `id` bigint(20) NOT NULL auto_increment,
  `c_name` varchar(50) default NULL,
  `c_description` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_cateogry` */

insert  into `t_cateogry`(`id`,`c_name`,`c_description`) values (1,'书籍','表示所有的书籍'),(2,'运动器件','所有的运动器材'),(3,'数码产品','表示所有的电脑配件'),(4,'服装','所有二手服装'),(5,'饰品','饰品'),(6,'其它','其它');
/*Table structure for table `t_goods` */

DROP TABLE IF EXISTS `t_goods`;

CREATE TABLE `t_goods` (
  `id` bigint(20) NOT NULL auto_increment,
  `g_imgurl` varchar(100) default NULL,
  `g_title` varchar(50) default NULL,
  `g_category` bigint(20) default NULL,
  `g_introduction` mediumtext,
  `g_price` float default NULL,
  `g_releasetime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `g_userid` bigint(20) default NULL,
  `g_tradetype` int(11) default '0',
  `g_condition` int(11) default '1',
  `g_isreport` int(11) default '0',
  `g_newlevel` varchar(10) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_Goods` (`g_userid`),
  CONSTRAINT `FK_Goods` FOREIGN KEY (`g_userid`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_goods` */

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL auto_increment,
  `u_username` varchar(50) default NULL unique,
  `u_password` varchar(50) default NULL,
  `u_email` varchar(50) default NULL unique,
  `u_sex` char(1) default NULL,
  `u_realname` varchar(50) default NULL,
  `u_idnum` char(19) default NULL,
  `u_tel` char(11) default NULL,
  `u_qq` varchar(20) default NULL,
  `u_school` varchar(50) default NULL,
  `u_city` varchar(50) default NULL,
  `u_registertime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `u_registerip` varchar(50) default NULL,
  `u_specialty` varchar(50) default NULL,
  `u_isvalidate` int(1) default '0',
  `u_grade` int(11) default '2009',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
