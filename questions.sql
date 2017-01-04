-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Jan 02, 2017 at 02:09 PM
-- Server version: 5.5.52-cll
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
--

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE IF NOT EXISTS `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(500) NOT NULL,
  `a` varchar(500) NOT NULL,
  `b` varchar(500) NOT NULL,
  `c` varchar(500) NOT NULL,
  `d` varchar(500) NOT NULL,
  `answer` varchar(1) NOT NULL,
  `category` tinyint(1) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question`, `a`, `b`, `c`, `d`, `answer`, `category`, `date_created`) VALUES
(1, 'Which is the smallest state in the Midwest?', 'Iowa', 'Illinois', 'Indiana', 'Missuri', 'c', 1, '0000-00-00 00:00:00'),
(2, 'Which is the third largest city in the United States?', 'San Francisco', 'Los Angeles', 'New York', 'Chicago', 'd', 1, '2016-01-30 20:29:46'),
(3, 'Which country was partitioned by Austria, Russia and Prussia throughout the 1800s?', 'Finland', 'Poland', 'Romania', 'Switzerland', 'b', 2, '2016-01-31 09:45:32'),
(4, 'Which Greek leader created a large empire before he died in 323BC?', 'Alexander The Great', 'Leonidas', 'Lysander', 'Philip of Macedon', 'a', 2, '2016-01-31 09:46:44'),
(5, 'Upon which river does Washington DC stand?', 'Hudson', 'Mississippi', 'Ohio', 'Potomac', 'd', 1, '2016-01-31 09:49:30'),
(6, 'In which Canadian province is Montreal located?', 'Manitoba', 'Nova Scotia', 'Ontario', 'Quebec', 'd', 1, '2016-01-31 09:50:37'),
(7, 'Mount Etna, one of the world''s most active volcanoes, is located in which country?', 'Italy', 'Dubai', 'France', 'Egypt', 'a', 1, '2016-01-31 11:38:27'),
(8, 'Which is the capital of Thailand?', 'Bangkok', 'Berne', 'Jakarta', 'Rangoon', 'a', 1, '2016-01-31 11:38:27'),
(9, 'The capital of New Zealand is:', 'Christchurch', 'Auckland', 'Wellington', 'Napier', 'c', 1, '2016-01-31 11:42:56'),
(10, 'The capital of Colombia is:', 'Lima', 'Buenos Aires', 'Bogotá', 'Nabia', 'c', 1, '2016-01-31 11:42:56'),
(11, 'What is the name of the Stone Age between Paleolithic and Neolithic?', 'Paralithic', 'Mesolithic', 'Demolithic', 'Penolthic', 'b', 2, '2016-01-31 11:47:34'),
(12, 'The remnants of what can be found at La Roche aux Fees in France?', 'Bluestone temple', 'Bronze mine shaft', 'Megalithic gallery grave', 'Sacrificial altar stone', 'c', 2, '2016-01-31 11:47:34'),
(13, 'The First and Second Battles of El Alamein took place in 1942 in which African country?', 'Algeria', 'Libya', 'Egypt', 'Tunisia', 'c', 2, '2016-01-31 11:51:31'),
(14, 'Which country was attacked by the Soviet Union on 30 November 1939?', 'Denmark', 'Norway', 'Poland', 'Finland', 'd', 2, '2016-01-31 11:51:31'),
(15, 'Which Japanese island was invaded by US Marines on 19 February 1945?', 'Guadalcanal', 'Tarawa', 'Okinawa', 'Iwo Jima', 'd', 2, '2016-01-31 11:54:44'),
(16, 'Which country was invaded by Iraq in August 1990?', 'Bahrain', 'Iran', 'Kuwait', 'Qatar', 'c', 2, '2016-01-31 11:54:44'),
(17, 'What is the Capital of Afghanistan ?', 'Mexico City', 'Kabul', 'Zagreb', 'Abu Dhabi', 'b', 1, '2016-02-01 18:04:07'),
(18, 'What is the Capital of Albania?', 'Yerevan', 'Abuja', 'Melekeok', 'Tirane', 'd', 1, '2016-02-01 18:05:51'),
(19, 'What is the Capital of Australia ?', 'Ankara', 'Vilnius', 'Sydney', 'Canberra', 'd', 1, '2016-02-01 18:06:51'),
(20, 'A primary purpose for building the Suez Canal was to:', 'encourage Jewish settlement in nearby Palestine', 'increase trade between the Middle East, Europe and Asia', 'reduce the time needed for travel between the Atlantic Ocean and the Caribbean Sea', 'allow Indian merchants to reach the east coast of Africa', 'b', 2, '2016-02-01 18:09:08'),
(21, 'The battle that allowed Lincoln to issue the Emancipation Proclamation was:', 'Bull Run', 'Antietam', 'Cold Harbor', 'Gettysburg', 'b', 2, '2016-02-01 18:11:51'),
(22, 'Tripitakas are sacred books of:', 'Buddhists', 'Hindus', 'Jains', 'None of the above', 'a', 2, '2016-02-01 18:13:46'),
(23, 'Which Fascist paramilitary group was Benito Mussolini the Commandant-General of?', 'The Red Devils', 'The Blackshirts ', 'The Snakes', 'The Black Brigade', 'b', 2, '2016-02-01 18:18:24'),
(24, 'What event greatly disrupted the colonial ambitions of 18th century Portugal?', 'The 1755 Lisbon earthquake', 'The Great Awakening', 'The Great Northern War', 'Famine caused by the Thirty Years’ War', 'a', 2, '2016-02-01 18:19:19'),
(25, 'What became a physical symbol of the Cold War, and more specifically, the Iron Curtain?', 'The Great Wall of China', 'The Statue of Liberty', 'The Kremlin', 'The Berlin War', 'd', 2, '2016-02-01 18:20:04');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
