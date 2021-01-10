-- --------------------------------------------------------
-- 主机:                           localhost
-- 服务器版本:                        8.0.22 - MySQL Community Server - GPL
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 urlmon 的数据库结构
CREATE DATABASE IF NOT EXISTS `urlmon` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `urlmon`;

-- 导出  表 urlmon.monitor 结构
CREATE TABLE IF NOT EXISTS `monitor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `site_name` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userid` int DEFAULT NULL,
  `last_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  urlmon.monitor 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `monitor` DISABLE KEYS */;
INSERT INTO `monitor` (`id`, `site_name`, `userid`, `last_updated`) VALUES
	(3, 'http://www.baidu.com', 45, '2021-01-10 21:53:02'),
	(4, 'http://localhost/filemanagercn.php', 45, '2021-01-10 21:58:33');
/*!40000 ALTER TABLE `monitor` ENABLE KEYS */;

-- 导出  表 urlmon.monitor_application 结构
CREATE TABLE IF NOT EXISTS `monitor_application` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int DEFAULT NULL,
  `site_name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `milliseconds` bigint DEFAULT NULL,
  `seconds` int DEFAULT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  urlmon.monitor_application 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `monitor_application` DISABLE KEYS */;
INSERT INTO `monitor_application` (`id`, `userid`, `site_name`, `status`, `milliseconds`, `seconds`, `time`) VALUES
	(1, 45, 'http://www.baidu.com', 'SUCCESS', 32, 32, '2021-01-10 22:11:32'),
	(2, 45, 'http://www.baidu.com', 'SUCCESS', 32, 32, '2021-01-10 22:11:32'),
	(3, 45, 'http://localhost/filemanagercn.php', 'SUCCESS', 9, 9, '2021-01-10 22:11:32'),
	(4, 45, 'http://localhost/filemanagercn.php', 'SUCCESS', 9, 9, '2021-01-10 22:11:32');
/*!40000 ALTER TABLE `monitor_application` ENABLE KEYS */;

-- 导出  表 urlmon.user 结构
CREATE TABLE IF NOT EXISTS `user` (
  `userid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  urlmon.user 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`userid`, `username`, `password`) VALUES
	(45, 'admin', 'eb3e2b2b8508e30fffe6a27959fb3b264b2af06b');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
