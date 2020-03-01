-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.29-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             10.3.0.5771
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping data for table auctionista.bids: ~4 rows (approximately)
/*!40000 ALTER TABLE `bids` DISABLE KEYS */;
REPLACE INTO `bids` (`bids_id`, `bid`, `object_id`, `buyer`) VALUES
	(1, 30000.00, 3, 1),
	(2, 5000.00, 3, 1),
	(5, 5300000.00, 2, 2),
	(6, 300000.00, 2, 4);
/*!40000 ALTER TABLE `bids` ENABLE KEYS */;

-- Dumping data for table auctionista.categories: ~2 rows (approximately)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
REPLACE INTO `categories` (`id`, `category`, `object_id`) VALUES
	(2, 'Car', 2),
	(3, 'Car', 3);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Dumping data for table auctionista.objects: ~3 rows (approximately)
/*!40000 ALTER TABLE `objects` DISABLE KEYS */;
REPLACE INTO `objects` (`id`, `seller`, `title`, `description`, `time_start`, `time_end`, `price_start`, `price_reservation`) VALUES
	(1, 1, 'cheap old cheese', 'best cheese in town', '2020-02-10 15:05:17', '2020-02-10 16:05:17', 299.00, 599.00),
	(2, 1, 'Volvo', 'C70', '2020-02-07 13:07:43', '2020-02-17 15:07:43', NULL, 180000.00),
	(3, 1, 'Audi', 'A6', '2020-02-07 13:19:52', '2020-02-07 15:30:52', NULL, 600000.00);
/*!40000 ALTER TABLE `objects` ENABLE KEYS */;

-- Dumping data for table auctionista.pics: ~4 rows (approximately)
/*!40000 ALTER TABLE `pics` DISABLE KEYS */;
REPLACE INTO `pics` (`id`, `pic`, `object_id`) VALUES
	(1, _binary 0x687474703A2F2F64756D6D79696D6167652E636F6D2F323137783132352E706E672F3566613264642F666666666666, 1),
	(2, _binary 0x436865657365, 1),
	(3, _binary 0x636172, 2),
	(4, _binary 0x636172, 2);
/*!40000 ALTER TABLE `pics` ENABLE KEYS */;

-- Dumping data for table auctionista.users: ~4 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
REPLACE INTO `users` (`id`, `name`) VALUES
	(1, 'Tobbe'),
	(2, 'Helena'),
	(3, 'Sandra'),
	(4, 'Lisa');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
