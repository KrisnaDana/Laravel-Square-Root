/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 8.0.30 : Database - laravel-square-root
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`laravel-square-root` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `logs` */

DROP TABLE IF EXISTS `logs`;

CREATE TABLE `logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `input` double unsigned NOT NULL,
  `hasil` double unsigned NOT NULL,
  `waktu` double unsigned NOT NULL,
  `jenis` enum('API','PL-SQL') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `logs` */

insert  into `logs`(`id`,`input`,`hasil`,`waktu`,`jenis`,`created_at`,`updated_at`) values 
(1,0,0,0.0000013,'API','2023-09-17 05:33:51','2023-09-17 05:33:51'),
(2,1.000033,1.0000164998639,0.0000044,'API','2023-09-17 05:34:07','2023-09-17 05:34:07'),
(3,1.000033,1.0000164998639,0.0000041,'API','2023-09-17 05:34:12','2023-09-17 05:34:12'),
(4,1.000033,1.0000164998639,0.0000021,'API','2023-09-17 05:34:13','2023-09-17 05:34:13'),
(5,1.00003333333,1.0000166665261,0.0000019,'API','2023-09-17 05:34:16','2023-09-17 05:34:16'),
(6,0.003155531,0.056174113255164,0.0000026,'API','2023-09-17 05:34:56','2023-09-17 05:34:56'),
(7,0.003155531,0.056174113255164,0.0000023,'API','2023-09-17 06:17:24','2023-09-17 06:17:24'),
(8,0.003155531,0.056174113255164,0.0000022,'API','2023-09-17 06:17:25','2023-09-17 06:17:25'),
(9,10,3.162277660168379,0.000055,'PL-SQL','2023-09-17 14:46:44','2023-09-17 14:46:44'),
(10,10,3.162277660168379,0.000047,'PL-SQL','2023-09-17 14:47:02','2023-09-17 14:47:02'),
(11,10,3.162277660168379,0.000061,'PL-SQL','2023-09-17 14:47:03','2023-09-17 14:47:03'),
(12,10,3.162277660168379,0.000053,'PL-SQL','2023-09-17 14:47:04','2023-09-17 14:47:04'),
(13,10,3.162277660168379,0.000054,'PL-SQL','2023-09-17 14:47:04','2023-09-17 14:47:04'),
(14,10,3.162277660168379,0.000097,'PL-SQL','2023-09-17 14:47:05','2023-09-17 14:47:05'),
(15,10,3.162277660168379,0.000056,'PL-SQL','2023-09-17 14:47:07','2023-09-17 14:47:07'),
(16,10,3.162277660168379,0.000055,'PL-SQL','2023-09-17 14:47:08','2023-09-17 14:47:08'),
(17,10,3.1622776601684,0.0000022,'API','2023-09-17 06:47:28','2023-09-17 06:47:28');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_reset_tokens_table',1),
(3,'2019_08_19_000000_create_failed_jobs_table',1),
(4,'2019_12_14_000001_create_personal_access_tokens_table',1),
(5,'2023_09_17_044341_create_logs_table',1);

/*Table structure for table `password_reset_tokens` */

DROP TABLE IF EXISTS `password_reset_tokens`;

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_reset_tokens` */

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `personal_access_tokens` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

/* Procedure structure for procedure `square_root` */

/*!50003 DROP PROCEDURE IF EXISTS  `square_root` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `square_root`(IN input DOUBLE, OUT output DOUBLE, OUT timeoutput DOUBLE)
BEGIN
		DECLARE hasil DOUBLE;
		DECLARE tebak DOUBLE;
		DECLARE toleransi DOUBLE;
		
		SET hasil = input/2;
		SET tebak = 0;
		SET toleransi = 0.00001;
		
		SET @mulai = now(6)+0;
		WHILE abs(hasil - tebak) > toleransi DO
			SET tebak = hasil;
			SET hasil = 0.5 * (hasil + (input/hasil));
		END WHILE;
		SET @akhir = NOW(6)+0;
		SET @waktu = @akhir - @mulai;
		
		INSERT INTO `logs`(input, hasil, waktu, jenis, created_at, updated_at)
		VALUES(
			input,
			hasil,
			@waktu,
			'PL-SQL',
			NOW(),
			NOW()
		);
		
		set output = hasil;
		SET timeoutput = @waktu;
	END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
