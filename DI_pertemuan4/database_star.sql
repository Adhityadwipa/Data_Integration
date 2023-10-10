/*
SQLyog Ultimate - MySQL GUI v8.21 
MySQL - 5.5.5-10.4.27-MariaDB : Database - sales
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sales` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `sales`;

/*Table structure for table `dim_employee` */

DROP TABLE IF EXISTS `dim_employee`;

CREATE TABLE `dim_employee` (
  `EMPLOYEE_ID` int(11) NOT NULL,
  `FIRST_NAME` varchar(128) DEFAULT NULL,
  `LAST_NAME` varchar(128) DEFAULT NULL,
  `BIRTH_YEAR` int(11) DEFAULT NULL,
  PRIMARY KEY (`EMPLOYEE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `dim_employee` */

/*Table structure for table `dim_product` */

DROP TABLE IF EXISTS `dim_product`;

CREATE TABLE `dim_product` (
  `PRODUCT_ID` int(11) NOT NULL,
  `PRODUCT_NAME` varchar(256) DEFAULT NULL,
  `PRODUCT_TYPE` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `dim_product` */

/*Table structure for table `dim_sales_type` */

DROP TABLE IF EXISTS `dim_sales_type`;

CREATE TABLE `dim_sales_type` (
  `SALES_TYPE_ID` int(11) NOT NULL,
  `TYPE_NAME` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`SALES_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `dim_sales_type` */

/*Table structure for table `dim_store` */

DROP TABLE IF EXISTS `dim_store`;

CREATE TABLE `dim_store` (
  `STORE_ID` int(11) NOT NULL,
  `STORE_ADDRESS` varchar(256) DEFAULT NULL,
  `CITY` varchar(128) DEFAULT NULL,
  `REGION` varchar(128) DEFAULT NULL,
  `STATE` varchar(128) DEFAULT NULL,
  `COUNTRY` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`STORE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `dim_store` */

/*Table structure for table `dim_time` */

DROP TABLE IF EXISTS `dim_time`;

CREATE TABLE `dim_time` (
  `TIME_ID` int(11) NOT NULL,
  `ACTION_DATE` date DEFAULT NULL,
  `ACTION_WEEK` int(11) DEFAULT NULL,
  `ACTION_MONTH` int(11) DEFAULT NULL,
  `ACTION_YEAR` int(11) DEFAULT NULL,
  `ACTION_WEEKDAY` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`TIME_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `dim_time` */

/*Table structure for table `fact_sales` */

DROP TABLE IF EXISTS `fact_sales`;

CREATE TABLE `fact_sales` (
  `PRODUCT_ID` int(11) NOT NULL,
  `EMPLOYEE_ID` int(11) NOT NULL,
  `TIME_ID` int(11) NOT NULL,
  `STORE_ID` int(11) NOT NULL,
  `SALES_TYPE_ID` int(11) NOT NULL,
  `PRICE` decimal(8,2) DEFAULT NULL,
  `QUANTITY` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_ID`,`EMPLOYEE_ID`,`TIME_ID`,`STORE_ID`,`SALES_TYPE_ID`),
  KEY `FK_RELATIONSHIP_1` (`EMPLOYEE_ID`),
  KEY `FK_RELATIONSHIP_2` (`SALES_TYPE_ID`),
  KEY `FK_RELATIONSHIP_3` (`STORE_ID`),
  KEY `FK_RELATIONSHIP_4` (`TIME_ID`),
  CONSTRAINT `FK_RELATIONSHIP_1` FOREIGN KEY (`EMPLOYEE_ID`) REFERENCES `dim_employee` (`EMPLOYEE_ID`),
  CONSTRAINT `FK_RELATIONSHIP_2` FOREIGN KEY (`SALES_TYPE_ID`) REFERENCES `dim_sales_type` (`SALES_TYPE_ID`),
  CONSTRAINT `FK_RELATIONSHIP_3` FOREIGN KEY (`STORE_ID`) REFERENCES `dim_store` (`STORE_ID`),
  CONSTRAINT `FK_RELATIONSHIP_4` FOREIGN KEY (`TIME_ID`) REFERENCES `dim_time` (`TIME_ID`),
  CONSTRAINT `FK_RELATIONSHIP_5` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `dim_product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `fact_sales` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
