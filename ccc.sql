-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 09, 2017 at 01:01 PM
-- Server version: 5.5.55-0+deb8u1
-- PHP Version: 5.6.30-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ccc`
--

-- --------------------------------------------------------

--
-- Table structure for table `accesslevel`
--

CREATE TABLE IF NOT EXISTS `accesslevel` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accesslevel`
--

INSERT INTO `accesslevel` (`id`, `name`) VALUES
(1, 'admin'),
(2, 'Operator'),
(3, 'User');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `name`, `subject`, `email`, `telephone`, `comment`, `timestamp`) VALUES
(1, 'Wohlig', '', 'wohlig@wohlig.com', '02227691245', 'Very Good', '2015-12-01 09:45:09'),
(2, '', '', '', '', '', '2016-04-06 13:06:33'),
(3, '??? ???? ??????? ????', 'drftgyhuji', 'gadarohan17@gmail.com', '', 'Rohana', '2016-04-06 13:06:33'),
(4, '', '', '', '', '', '2016-04-06 13:18:03'),
(5, '??? ???? ??????? ????', 'drftgyhuji', 'gadarohan17@gmail.com', '', 'RohanGada', '2016-04-06 13:18:04'),
(6, '', '', '', '', '', '2016-04-06 13:19:08'),
(7, '', '', '', '', '', '2016-04-06 13:19:08'),
(8, '??? ???? ??????? ????', 'drftgyhuji', 'gadarohan17@gmail.com', '', 'ewewewewwe', '2016-04-06 13:19:09'),
(9, '??? ???? ??????? ????', 'drftgyhuji', 'gadarohan17@gmail.com', '', 'ewewewewwe', '2016-04-06 13:19:09'),
(10, '', '', '', '', '', '2016-04-06 13:20:24'),
(11, '??? ???? ??????? ????', 'drftgyhuji', 'gadarohan17@gmail.com', '', '1qweeqwewqeq', '2016-04-06 13:20:24'),
(12, '', '', '', '', '', '2016-04-06 13:21:16'),
(13, '??? ???? ??????? ????', 'drftgyhuji', 'gadarohan17@gmail.com', '', 'wqeqweqweqw', '2016-04-06 13:21:16'),
(14, '11', '11', '11@11.com', '', '11', '2016-04-07 06:08:20'),
(15, 'John', 'Cricket', 'John@gmail.com', '', 'I want whites', '2016-04-14 06:51:55'),
(16, 'vinod', 'test', 'vinodwohlig@gmail.com', '', 'test msg', '2016-04-14 13:24:55'),
(17, 'imran', 'imran', 'imran@gmail.com', '', 'imran', '2016-04-15 06:21:38'),
(18, '', '', '', '', '', '2016-04-15 11:29:28'),
(19, 'Rohan', 'Rohan', 'gadarohan17@gmail.com', '', 'Nothing much, just wanted to say Hi! and test the form.', '2016-04-15 11:29:29'),
(20, 'Shiva Singh', 'testing', 'shivasingh1101@gmail.com', '', 'looking forward for a great start of ccc and will try marketing it till my reach', '2016-04-21 12:33:39'),
(21, 'digvijay', 'nothing', 'digvijay@osians.com', '', 'test', '2016-04-26 10:28:27'),
(22, 'digvijay', 'nothing', 'digvijay@osians.com', '', 'test', '2016-04-26 10:28:28'),
(23, 'jj', 'jjj', 'jjj@gmail', '', 'jjj', '2016-04-26 11:20:39'),
(24, 'f', 'f', 'f@f', '', 'f', '2016-04-26 11:36:47'),
(25, 'Sneha Jajodia', 'Enquiry', 'snay.jajodia@gmail.com', '', 'Hi..\nI was just wondering if you can customise for children as well?', '2016-04-26 17:06:52'),
(26, 'Rohan', 'test', 'gadarohan17@gmail.com', '', 'djfkdsfndsjcndskns,', '2016-04-27 05:19:33'),
(27, 'hellow', 'hello', 'hello@gmail.com', '', 'hello test', '2016-05-03 07:05:48'),
(28, 'hellow', 'hello', 'hello@gmail.com', '', 'hello test', '2016-05-03 07:05:48'),
(29, 'avinash', 'hi', 'contactavinash572@gmail.com', '', 'hello', '2017-04-11 09:20:01');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE IF NOT EXISTS `country` (
`id` int(11) NOT NULL,
  `iso` char(2) NOT NULL,
  `name` varchar(80) NOT NULL,
  `nicename` varchar(80) NOT NULL,
  `iso3` char(3) DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL,
  `phonecode` int(5) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=240 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES
(1, 'AF', 'AFGHANISTAN', 'Afghanistan', 'AFG', 4, 93),
(2, 'AL', 'ALBANIA', 'Albania', 'ALB', 8, 355),
(3, 'DZ', 'ALGERIA', 'Algeria', 'DZA', 12, 213),
(4, 'AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', 16, 1684),
(5, 'AD', 'ANDORRA', 'Andorra', 'AND', 20, 376),
(6, 'AO', 'ANGOLA', 'Angola', 'AGO', 24, 244),
(7, 'AI', 'ANGUILLA', 'Anguilla', 'AIA', 660, 1264),
(8, 'AQ', 'ANTARCTICA', 'Antarctica', NULL, NULL, 0),
(9, 'AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', 28, 1268),
(10, 'AR', 'ARGENTINA', 'Argentina', 'ARG', 32, 54),
(11, 'AM', 'ARMENIA', 'Armenia', 'ARM', 51, 374),
(12, 'AW', 'ARUBA', 'Aruba', 'ABW', 533, 297),
(13, 'AU', 'AUSTRALIA', 'Australia', 'AUS', 36, 61),
(14, 'AT', 'AUSTRIA', 'Austria', 'AUT', 40, 43),
(15, 'AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', 31, 994),
(16, 'BS', 'BAHAMAS', 'Bahamas', 'BHS', 44, 1242),
(17, 'BH', 'BAHRAIN', 'Bahrain', 'BHR', 48, 973),
(18, 'BD', 'BANGLADESH', 'Bangladesh', 'BGD', 50, 880),
(19, 'BB', 'BARBADOS', 'Barbados', 'BRB', 52, 1246),
(20, 'BY', 'BELARUS', 'Belarus', 'BLR', 112, 375),
(21, 'BE', 'BELGIUM', 'Belgium', 'BEL', 56, 32),
(22, 'BZ', 'BELIZE', 'Belize', 'BLZ', 84, 501),
(23, 'BJ', 'BENIN', 'Benin', 'BEN', 204, 229),
(24, 'BM', 'BERMUDA', 'Bermuda', 'BMU', 60, 1441),
(25, 'BT', 'BHUTAN', 'Bhutan', 'BTN', 64, 975),
(26, 'BO', 'BOLIVIA', 'Bolivia', 'BOL', 68, 591),
(27, 'BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', 70, 387),
(28, 'BW', 'BOTSWANA', 'Botswana', 'BWA', 72, 267),
(29, 'BV', 'BOUVET ISLAND', 'Bouvet Island', NULL, NULL, 0),
(30, 'BR', 'BRAZIL', 'Brazil', 'BRA', 76, 55),
(31, 'IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', NULL, NULL, 246),
(32, 'BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', 96, 673),
(33, 'BG', 'BULGARIA', 'Bulgaria', 'BGR', 100, 359),
(34, 'BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', 854, 226),
(35, 'BI', 'BURUNDI', 'Burundi', 'BDI', 108, 257),
(36, 'KH', 'CAMBODIA', 'Cambodia', 'KHM', 116, 855),
(37, 'CM', 'CAMEROON', 'Cameroon', 'CMR', 120, 237),
(38, 'CA', 'CANADA', 'Canada', 'CAN', 124, 1),
(39, 'CV', 'CAPE VERDE', 'Cape Verde', 'CPV', 132, 238),
(40, 'KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', 136, 1345),
(41, 'CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', 140, 236),
(42, 'TD', 'CHAD', 'Chad', 'TCD', 148, 235),
(43, 'CL', 'CHILE', 'Chile', 'CHL', 152, 56),
(44, 'CN', 'CHINA', 'China', 'CHN', 156, 86),
(45, 'CX', 'CHRISTMAS ISLAND', 'Christmas Island', NULL, NULL, 61),
(46, 'CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', NULL, NULL, 672),
(47, 'CO', 'COLOMBIA', 'Colombia', 'COL', 170, 57),
(48, 'KM', 'COMOROS', 'Comoros', 'COM', 174, 269),
(49, 'CG', 'CONGO', 'Congo', 'COG', 178, 242),
(50, 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', 180, 242),
(51, 'CK', 'COOK ISLANDS', 'Cook Islands', 'COK', 184, 682),
(52, 'CR', 'COSTA RICA', 'Costa Rica', 'CRI', 188, 506),
(53, 'CI', 'COTE D''IVOIRE', 'Cote D''Ivoire', 'CIV', 384, 225),
(54, 'HR', 'CROATIA', 'Croatia', 'HRV', 191, 385),
(55, 'CU', 'CUBA', 'Cuba', 'CUB', 192, 53),
(56, 'CY', 'CYPRUS', 'Cyprus', 'CYP', 196, 357),
(57, 'CZ', 'CZECH REPUBLIC', 'Czech Republic', 'CZE', 203, 420),
(58, 'DK', 'DENMARK', 'Denmark', 'DNK', 208, 45),
(59, 'DJ', 'DJIBOUTI', 'Djibouti', 'DJI', 262, 253),
(60, 'DM', 'DOMINICA', 'Dominica', 'DMA', 212, 1767),
(61, 'DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', 214, 1809),
(62, 'EC', 'ECUADOR', 'Ecuador', 'ECU', 218, 593),
(63, 'EG', 'EGYPT', 'Egypt', 'EGY', 818, 20),
(64, 'SV', 'EL SALVADOR', 'El Salvador', 'SLV', 222, 503),
(65, 'GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', 226, 240),
(66, 'ER', 'ERITREA', 'Eritrea', 'ERI', 232, 291),
(67, 'EE', 'ESTONIA', 'Estonia', 'EST', 233, 372),
(68, 'ET', 'ETHIOPIA', 'Ethiopia', 'ETH', 231, 251),
(69, 'FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', 238, 500),
(70, 'FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', 234, 298),
(71, 'FJ', 'FIJI', 'Fiji', 'FJI', 242, 679),
(72, 'FI', 'FINLAND', 'Finland', 'FIN', 246, 358),
(73, 'FR', 'FRANCE', 'France', 'FRA', 250, 33),
(74, 'GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', 254, 594),
(75, 'PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', 258, 689),
(76, 'TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', NULL, NULL, 0),
(77, 'GA', 'GABON', 'Gabon', 'GAB', 266, 241),
(78, 'GM', 'GAMBIA', 'Gambia', 'GMB', 270, 220),
(79, 'GE', 'GEORGIA', 'Georgia', 'GEO', 268, 995),
(80, 'DE', 'GERMANY', 'Germany', 'DEU', 276, 49),
(81, 'GH', 'GHANA', 'Ghana', 'GHA', 288, 233),
(82, 'GI', 'GIBRALTAR', 'Gibraltar', 'GIB', 292, 350),
(83, 'GR', 'GREECE', 'Greece', 'GRC', 300, 30),
(84, 'GL', 'GREENLAND', 'Greenland', 'GRL', 304, 299),
(85, 'GD', 'GRENADA', 'Grenada', 'GRD', 308, 1473),
(86, 'GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', 312, 590),
(87, 'GU', 'GUAM', 'Guam', 'GUM', 316, 1671),
(88, 'GT', 'GUATEMALA', 'Guatemala', 'GTM', 320, 502),
(89, 'GN', 'GUINEA', 'Guinea', 'GIN', 324, 224),
(90, 'GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', 624, 245),
(91, 'GY', 'GUYANA', 'Guyana', 'GUY', 328, 592),
(92, 'HT', 'HAITI', 'Haiti', 'HTI', 332, 509),
(93, 'HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', NULL, NULL, 0),
(94, 'VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', 336, 39),
(95, 'HN', 'HONDURAS', 'Honduras', 'HND', 340, 504),
(96, 'HK', 'HONG KONG', 'Hong Kong', 'HKG', 344, 852),
(97, 'HU', 'HUNGARY', 'Hungary', 'HUN', 348, 36),
(98, 'IS', 'ICELAND', 'Iceland', 'ISL', 352, 354),
(99, 'IN', 'INDIA', 'India', 'IND', 356, 91),
(100, 'ID', 'INDONESIA', 'Indonesia', 'IDN', 360, 62),
(101, 'IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', 364, 98),
(102, 'IQ', 'IRAQ', 'Iraq', 'IRQ', 368, 964),
(103, 'IE', 'IRELAND', 'Ireland', 'IRL', 372, 353),
(104, 'IL', 'ISRAEL', 'Israel', 'ISR', 376, 972),
(105, 'IT', 'ITALY', 'Italy', 'ITA', 380, 39),
(106, 'JM', 'JAMAICA', 'Jamaica', 'JAM', 388, 1876),
(107, 'JP', 'JAPAN', 'Japan', 'JPN', 392, 81),
(108, 'JO', 'JORDAN', 'Jordan', 'JOR', 400, 962),
(109, 'KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', 398, 7),
(110, 'KE', 'KENYA', 'Kenya', 'KEN', 404, 254),
(111, 'KI', 'KIRIBATI', 'Kiribati', 'KIR', 296, 686),
(112, 'KP', 'KOREA, DEMOCRATIC PEOPLE''S REPUBLIC OF', 'Korea, Democratic People''s Republic of', 'PRK', 408, 850),
(113, 'KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR', 410, 82),
(114, 'KW', 'KUWAIT', 'Kuwait', 'KWT', 414, 965),
(115, 'KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', 417, 996),
(116, 'LA', 'LAO PEOPLE''S DEMOCRATIC REPUBLIC', 'Lao People''s Democratic Republic', 'LAO', 418, 856),
(117, 'LV', 'LATVIA', 'Latvia', 'LVA', 428, 371),
(118, 'LB', 'LEBANON', 'Lebanon', 'LBN', 422, 961),
(119, 'LS', 'LESOTHO', 'Lesotho', 'LSO', 426, 266),
(120, 'LR', 'LIBERIA', 'Liberia', 'LBR', 430, 231),
(121, 'LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', 434, 218),
(122, 'LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', 438, 423),
(123, 'LT', 'LITHUANIA', 'Lithuania', 'LTU', 440, 370),
(124, 'LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', 442, 352),
(125, 'MO', 'MACAO', 'Macao', 'MAC', 446, 853),
(126, 'MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 807, 389),
(127, 'MG', 'MADAGASCAR', 'Madagascar', 'MDG', 450, 261),
(128, 'MW', 'MALAWI', 'Malawi', 'MWI', 454, 265),
(129, 'MY', 'MALAYSIA', 'Malaysia', 'MYS', 458, 60),
(130, 'MV', 'MALDIVES', 'Maldives', 'MDV', 462, 960),
(131, 'ML', 'MALI', 'Mali', 'MLI', 466, 223),
(132, 'MT', 'MALTA', 'Malta', 'MLT', 470, 356),
(133, 'MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', 584, 692),
(134, 'MQ', 'MARTINIQUE', 'Martinique', 'MTQ', 474, 596),
(135, 'MR', 'MAURITANIA', 'Mauritania', 'MRT', 478, 222),
(136, 'MU', 'MAURITIUS', 'Mauritius', 'MUS', 480, 230),
(137, 'YT', 'MAYOTTE', 'Mayotte', NULL, NULL, 269),
(138, 'MX', 'MEXICO', 'Mexico', 'MEX', 484, 52),
(139, 'FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', 583, 691),
(140, 'MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', 498, 373),
(141, 'MC', 'MONACO', 'Monaco', 'MCO', 492, 377),
(142, 'MN', 'MONGOLIA', 'Mongolia', 'MNG', 496, 976),
(143, 'MS', 'MONTSERRAT', 'Montserrat', 'MSR', 500, 1664),
(144, 'MA', 'MOROCCO', 'Morocco', 'MAR', 504, 212),
(145, 'MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', 508, 258),
(146, 'MM', 'MYANMAR', 'Myanmar', 'MMR', 104, 95),
(147, 'NA', 'NAMIBIA', 'Namibia', 'NAM', 516, 264),
(148, 'NR', 'NAURU', 'Nauru', 'NRU', 520, 674),
(149, 'NP', 'NEPAL', 'Nepal', 'NPL', 524, 977),
(150, 'NL', 'NETHERLANDS', 'Netherlands', 'NLD', 528, 31),
(151, 'AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', 530, 599),
(152, 'NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', 540, 687),
(153, 'NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', 554, 64),
(154, 'NI', 'NICARAGUA', 'Nicaragua', 'NIC', 558, 505),
(155, 'NE', 'NIGER', 'Niger', 'NER', 562, 227),
(156, 'NG', 'NIGERIA', 'Nigeria', 'NGA', 566, 234),
(157, 'NU', 'NIUE', 'Niue', 'NIU', 570, 683),
(158, 'NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', 574, 672),
(159, 'MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', 580, 1670),
(160, 'NO', 'NORWAY', 'Norway', 'NOR', 578, 47),
(161, 'OM', 'OMAN', 'Oman', 'OMN', 512, 968),
(162, 'PK', 'PAKISTAN', 'Pakistan', 'PAK', 586, 92),
(163, 'PW', 'PALAU', 'Palau', 'PLW', 585, 680),
(164, 'PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL, NULL, 970),
(165, 'PA', 'PANAMA', 'Panama', 'PAN', 591, 507),
(166, 'PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', 598, 675),
(167, 'PY', 'PARAGUAY', 'Paraguay', 'PRY', 600, 595),
(168, 'PE', 'PERU', 'Peru', 'PER', 604, 51),
(169, 'PH', 'PHILIPPINES', 'Philippines', 'PHL', 608, 63),
(170, 'PN', 'PITCAIRN', 'Pitcairn', 'PCN', 612, 0),
(171, 'PL', 'POLAND', 'Poland', 'POL', 616, 48),
(172, 'PT', 'PORTUGAL', 'Portugal', 'PRT', 620, 351),
(173, 'PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', 630, 1787),
(174, 'QA', 'QATAR', 'Qatar', 'QAT', 634, 974),
(175, 'RE', 'REUNION', 'Reunion', 'REU', 638, 262),
(176, 'RO', 'ROMANIA', 'Romania', 'ROM', 642, 40),
(177, 'RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', 643, 70),
(178, 'RW', 'RWANDA', 'Rwanda', 'RWA', 646, 250),
(179, 'SH', 'SAINT HELENA', 'Saint Helena', 'SHN', 654, 290),
(180, 'KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', 659, 1869),
(181, 'LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', 662, 1758),
(182, 'PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', 666, 508),
(183, 'VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', 670, 1784),
(184, 'WS', 'SAMOA', 'Samoa', 'WSM', 882, 684),
(185, 'SM', 'SAN MARINO', 'San Marino', 'SMR', 674, 378),
(186, 'ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', 678, 239),
(187, 'SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', 682, 966),
(188, 'SN', 'SENEGAL', 'Senegal', 'SEN', 686, 221),
(189, 'CS', 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', NULL, NULL, 381),
(190, 'SC', 'SEYCHELLES', 'Seychelles', 'SYC', 690, 248),
(191, 'SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', 694, 232),
(192, 'SG', 'SINGAPORE', 'Singapore', 'SGP', 702, 65),
(193, 'SK', 'SLOVAKIA', 'Slovakia', 'SVK', 703, 421),
(194, 'SI', 'SLOVENIA', 'Slovenia', 'SVN', 705, 386),
(195, 'SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', 90, 677),
(196, 'SO', 'SOMALIA', 'Somalia', 'SOM', 706, 252),
(197, 'ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', 710, 27),
(198, 'GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', NULL, NULL, 0),
(199, 'ES', 'SPAIN', 'Spain', 'ESP', 724, 34),
(200, 'LK', 'SRI LANKA', 'Sri Lanka', 'LKA', 144, 94),
(201, 'SD', 'SUDAN', 'Sudan', 'SDN', 736, 249),
(202, 'SR', 'SURINAME', 'Suriname', 'SUR', 740, 597),
(203, 'SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', 744, 47),
(204, 'SZ', 'SWAZILAND', 'Swaziland', 'SWZ', 748, 268),
(205, 'SE', 'SWEDEN', 'Sweden', 'SWE', 752, 46),
(206, 'CH', 'SWITZERLAND', 'Switzerland', 'CHE', 756, 41),
(207, 'SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', 760, 963),
(208, 'TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', 'TWN', 158, 886),
(209, 'TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', 762, 992),
(210, 'TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', 834, 255),
(211, 'TH', 'THAILAND', 'Thailand', 'THA', 764, 66),
(212, 'TL', 'TIMOR-LESTE', 'Timor-Leste', NULL, NULL, 670),
(213, 'TG', 'TOGO', 'Togo', 'TGO', 768, 228),
(214, 'TK', 'TOKELAU', 'Tokelau', 'TKL', 772, 690),
(215, 'TO', 'TONGA', 'Tonga', 'TON', 776, 676),
(216, 'TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', 780, 1868),
(217, 'TN', 'TUNISIA', 'Tunisia', 'TUN', 788, 216),
(218, 'TR', 'TURKEY', 'Turkey', 'TUR', 792, 90),
(219, 'TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', 795, 7370),
(220, 'TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', 796, 1649),
(221, 'TV', 'TUVALU', 'Tuvalu', 'TUV', 798, 688),
(222, 'UG', 'UGANDA', 'Uganda', 'UGA', 800, 256),
(223, 'UA', 'UKRAINE', 'Ukraine', 'UKR', 804, 380),
(224, 'AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE', 784, 971),
(225, 'GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', 826, 44),
(226, 'US', 'UNITED STATES', 'United States', 'USA', 840, 1),
(227, 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', NULL, NULL, 1),
(228, 'UY', 'URUGUAY', 'Uruguay', 'URY', 858, 598),
(229, 'UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', 860, 998),
(230, 'VU', 'VANUATU', 'Vanuatu', 'VUT', 548, 678),
(231, 'VE', 'VENEZUELA', 'Venezuela', 'VEN', 862, 58),
(232, 'VN', 'VIET NAM', 'Viet Nam', 'VNM', 704, 84),
(233, 'VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', 92, 1284),
(234, 'VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', 850, 1340),
(235, 'WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', 876, 681),
(236, 'EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', 732, 212),
(237, 'YE', 'YEMEN', 'Yemen', 'YEM', 887, 967),
(238, 'ZM', 'ZAMBIA', 'Zambia', 'ZMB', 894, 260),
(239, 'ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', 716, 263);

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE IF NOT EXISTS `currency` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `shipping` double NOT NULL,
  `minimumshipping` double NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`id`, `name`, `shipping`, `minimumshipping`) VALUES
(1, 'INR', 500, 5000),
(2, 'USD', 60, 150),
(3, 'GBP', 35, 150),
(4, 'EUR', 50, 150),
(5, 'ZAF', 1500, 5000),
(6, 'AUD', 90, 250),
(7, 'NZD', 100, 250);

-- --------------------------------------------------------

--
-- Table structure for table `currency_country`
--

CREATE TABLE IF NOT EXISTS `currency_country` (
  `currency` int(11) NOT NULL,
  `country` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `currency_country`
--

INSERT INTO `currency_country` (`currency`, `country`) VALUES
(4, 13);

-- --------------------------------------------------------

--
-- Table structure for table `customize`
--

CREATE TABLE IF NOT EXISTS `customize` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `teamname` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `teaminitials` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `interest` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customize`
--

INSERT INTO `customize` (`id`, `name`, `image`, `teamname`, `color`, `teaminitials`, `message`, `interest`, `email`) VALUES
(1, 'pooja', 'abc.png', 'jpp', 'blue', 'dfghj', 'messages', 'int', 'pooja.wohlig@gmail.com'),
(2, 'pooja', 'abc.png', 'jpp', 'blue', 'dfghj', 'messages', 'int', 'pooja.wohlig@gmail.com'),
(3, 'pooja', 'abc.png', '', 'blue', '', '', '', 'pooja.wohlig@gmail.com'),
(4, 'pooja', '', '', 'blue', '', '', '', 'pooja.wohlig@gmail.com'),
(5, '', '', '', '', '', '', '', ''),
(6, 'pooja', 'abc.png', 'jpp', 'blue', 'dfghj', 'messages', 'int', 'pooja.wohlig@gmail.com'),
(7, 'pooja', 'abc.png', 'jpp', 'blue', 'dfghj', 'messages', 'int', 'pooja.wohlig@gmail.com'),
(8, 'pooja', 'abc.png', 'jpp', 'blue', 'dfghj', 'messages', 'int', 'pooja.wohlig@gmail.com'),
(9, 'Rohan', '', '', '', '', '', 'Bats', 'rohanwohlig@gmail.com'),
(10, 'Rohan', '', '', '', '', '', 'Bats', 'rohanwohlig@gmail.com'),
(11, 'Rohan', '', '', '', '', '', 'Bats', 'rohanwohlig@gmail.com'),
(12, 'Rohan', '', '', '', '', '', 'Bats', 'rohanwohlig@gmail.com'),
(13, 'Rohan', '', '', '', '', '', 'Bats', 'rohanwohlig@gmail.com'),
(14, 'Rohan', '', 'Osian', 'Narangi', 'OCC', 'sdasdsadsadsadsa', 'Bats', 'gadarohan17@gmail.com'),
(15, 'pooja', 'image-556411459855678.png', 'jpp', 'blue', 'dfghj', 'messages', 'int', 'pooja.wohlig@gmail.com'),
(16, 'Virat', 'image-545741459860180.png', '', '', '', '', 'Whites', 'rohanwohlig@gmail.com'),
(17, 'tag1', 'image-636471459926326.gif', '', '', '', '', 'Whites', 'vinodwohlig@gmail.com'),
(18, 'Digvijay Singh', 'image-46691459930650.gif', 'osians cc', 'yellow and blue', 'OCC', 'nothing', 'whites', 'dkathiwada@gmail.com'),
(19, 'Harshit', 'image-339071459930630.png', 'test', 'test', 'test', '111', 'whites', 'hshah248@gmail.com'),
(20, '111', 'image-442671459930795.png', '11', '11', '11', '111', '111', '111@111.com'),
(21, '11', '', '11', '11', '11', '11', '11', '11'),
(22, '11', '', '11', '11', '11', '11', '11', '1'),
(23, '??? ???? ??????? ????', 'image-715671460017038.png', 'Osian', '', '', '', 'Whites', 'gadarohan17@gmail.com'),
(24, 'ad', 'image-301271460016961.png', 'a', 'a', 'a', '', 'a', 'aaa@asd.com'),
(25, 'ad', 'image-301271460016961.png', 'a', 'a', 'a', '', 'a', 'aaa@asd.com'),
(26, 'ss', 'image-200441460032993.png', 'ss', 'sss', 'ss', '', 'ss', 'ss@adasd.co'),
(27, 'Imran', 'image-821781460617083.png', 'Imran CC', 'Red and yellow', 'ICC', 'Can you copy something similar for me. Also can you make me a pair of gloves with my logo', 'Whites', 'imranpatel42@gmail.com'),
(28, 'im', '<p>The filetype you are attempting to upload is not allowed.</p>', '', '', '', '', 'hh', 'iii'),
(29, 'Virat', '', 'iuh', '', '', '', 'h', 'fhsvisdj'),
(30, 'Virat', '', 'Osian', '', '', '', 'KitBags', 'gadarohan'),
(31, 'JD', '', 'Titans', '', '', '', 'Gloves', 'jignesh.dhanak@yahio.com'),
(32, 'Zoravar Singh', '', '', '', '', '', 'Kitbag', 'zorav2000@gnail.com'),
(33, 'Sameer', 'image-475591461769916.jpeg', 'Waff club', 'Blue & green', 'WC8', '', 'Cap', 'sam_waff@yahoo.com'),
(34, 'Kunal Bhatia', '', '', '', '', '', 'Apparel', 'kunalmbhatia@gmail.com'),
(35, 'Siddharth Mertia', 'image-252391463214775.png', 'Salt Lake City club', 'Black and white', 'SLC', '', 'Whites . Caps, tracks', 'mertia.siddharth@gmail.com'),
(36, 'PRAVEEN', 'image-536051463469685.JPG', 'cottons', '', '', '', 'baggy caps, whites', 'praveenlekhraj@gmail.com'),
(37, 'Mark Oman', 'image-589951463819049.jpg', 'Slovenian Cricket Team', 'Blue White', '', 'I am interested in purchasing for 15 pcs for U13 National Team, U15 National Team and Senior National Team all same colors and designs just different sizes.', 'One Day Colors', 'mark_oman@hotmail.com'),
(38, 'Bjorn Briggs', 'image-983261466839013.png', 'OTF', 'Black and yellow', '', '', 'Bags', 'bjorn@lastmanstands.net'),
(39, 'Bjorn Briggs', 'image-983261466839013.png', 'OTF', 'Black and yellow', '', '', 'Bags', 'bjorn@lastmanstands.net'),
(40, 'virat', '', '', '', '', '', 'batting', 'shn619@gmial.com'),
(41, 'siddharth', 'image-352101469196089.png', 'osians cricket club', 'red', 'occ', '', 'whites', 'shivasingh1101@gmail.com'),
(42, 'Dhruv Mehra', '<p>The filetype you are attempting to upload is not allowed.</p>', '', 'Black & Silver', '', '', 'Kitbags', 'dhruvmehra88@gmail.com'),
(43, 'Josh Tobin', 'image-532221485419260.JPG', 'Port Talbot Town cricket Club', 'Blue & yellow', '', '', 'Pads, gloves', 'josh_tobin01@hotmail.com'),
(44, 'Aaron wells', 'image-271241486311464.JPG', 'Middle Rasen', 'Blue and white', 'MRCC', '', 'Whites', 'aaronwella@msn.com');

-- --------------------------------------------------------

--
-- Table structure for table `customizeorder`
--

CREATE TABLE IF NOT EXISTS `customizeorder` (
`id` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `type` varchar(555) NOT NULL,
  `email` varchar(555) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mainsponserlogo` varchar(555) NOT NULL,
  `leftsleeve` varchar(555) NOT NULL,
  `rightsleeve` varchar(555) NOT NULL,
  `backsponser` varchar(555) NOT NULL,
  `teamlogo` varchar(555) NOT NULL,
  `rightchest` varchar(555) NOT NULL,
  `note` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=420 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customizeorder`
--

INSERT INTO `customizeorder` (`id`, `description`, `type`, `email`, `date`, `mainsponserlogo`, `leftsleeve`, `rightsleeve`, `backsponser`, `teamlogo`, `rightchest`, `note`) VALUES
(243, '{"design":{"base":"img/padscolor/updated/ngreen/1.png","name":"HOWZAT 101"},"color":{"base":"#82e716"},"teamLogo":{"image":"image-747821489731974.png","size":50},"quantity":[{"quantity":20,"size":"Left"},{"quantity":20,"size":"Right"}],"type":"pads","sendTeamLogoLater":false,"totalAmount":115000}', 'pads', 'wohlig@wohlig.com', '2017-03-17 06:26:37', '', '', '', '', '', '', ''),
(339, '{"trim":{"highlightOne":{"flag":false,"tcolor":"australian_green","disable":"unnoable","hcolor":"#0080000","image":"img/odi-tshirts/trims/training/design1/back/trim1/australian_green.png"},"highlightTwo":{"flag":false,"tcolor":"black","disable":"noable","hcolor":false,"image":"img/odi-tshirts/trims/training/design1/back/trim2/black.png"},"highlightBase":{"flag":false,"tcolor":"lemon_yellow","disable":"unnoable","image":"img/odi-tshirts/trims/training/base/back/lemon_yellow.png","hcolor":"#ffff00"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":25},"divattributes":[]},"isTeamLogo":false,"printType":"embroidered","front":false,"back":false,"cloth":"img/odi-tshirts/trims/trainingbase/front/lemon_yellow.png","backdrop":"img/odi-tshirts/backdrop/training/back3.png","teamlogo":{"attributes":{"width":25},"divattributes":[],"image":"image-131101490352184.jpg","name":"Team Logo"}},"jerseyBack":[{"name":"","no":"","font":"arial","color":"white","quantity":20,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}}],"allLogos":{"rightchest":"img/logo_black.png","teamlogo":"image-131101490352184.jpg"},"designName":"design1","designType":"training","totalAmount":17000,"totalQuan":20,"name":"Pace (C&S)"}', 'odishirt', 'wohlig@wohlig.com', '2017-03-24 10:43:16', '', '', '', '', 'image-131101490352184.jpg', 'img/logo_black.png', ''),
(378, '{"design":{"base":"img/odi-tshirts/trims/odi/base/front/india_blue.png","designName":"design1","designType":"odi","highlightOne":"img/odi-tshirts/trims/odi/design1/front/trim1/grey.png","highlightTwo":"img/odi-tshirts/trims/odi/design1/front/trim2/grey.png","name":"Googly (SUB)"},"color":{"base":"#2175d9","baseColorName":"india_blue","trim1":"#666666","trim1ColorName":"grey","trim2":"#666666","trim2ColorName":"grey"},"teamLogo":{"image":null,"size":25},"rightChestLogo":{"image":"img/logo_black.png","size":25},"mainSponsorLogo":{"image":null,"size":25},"leftSleeveLogo":{"image":null,"size":25},"rightSleeveLogo":{"image":null,"size":25},"backSponsorLogo":{"image":null,"size":25},"font":{"fontStyle":"arial","fontColor":"white","nameSize":18,"nameSpacing":1,"numberSize":60,"numberSpacing":1},"type":"odi","sendTeamLogoLater":true,"quantity":[{"size":"L","quantity":20,"name":"","no":"","sleeve":""}],"totalAmount":20000,"totalQuan":20,"tab":"quantity","tabNo":4}', 'odi', 'wohlig@wohlig.com', '2017-03-29 13:02:33', '', '', '', '', '', '', ''),
(382, '{"quantity":[{"quantity":15,"size":"Left"},{"quantity":null,"size":"Right"}],"design":{"name":"SCOOP 303","base":"img/glovescolor/lorange/3.png"},"type":"gloves","color":{"base":"#ff8247"},"teamLogo":{"size":25,"image":"image-793401489995005.png"},"sendTeamLogoLater":false,"tab":"quantity","tabNo":4,"totalAmount":630}', 'gloves', 'wohlig@wohlig.com', '2017-03-30 05:36:14', '', '', '', '', '', '', ''),
(383, '{"design":{"base":"img/padscolor/dblue/dblue.png","name":"HOWZAT 101"},"color":{"base":"#48d2dc"},"teamLogo":[],"quantity":[{"quantity":12,"size":"Left"},{"quantity":null,"size":"Right"}],"type":"pads","sendTeamLogoLater":true,"totalAmount":33000,"tab":"quantity","tabNo":4}', 'pads', 'wohlig@wohlig.com', '2017-03-30 08:20:16', '', '', '', '', '', '', ''),
(384, '{"design":{"base":"img/glovescolor/red/3.png","name":"SCOOP 303"},"type":"gloves","quantity":[{"quantity":12,"size":"Left"},{"quantity":null,"size":"Right"}],"color":{"base":"#db2123"},"teamLogo":[],"sendTeamLogoLater":true,"totalAmount":28800,"tab":"quantity","tabNo":4}', 'gloves', 'wohlig@wohlig.com', '2017-03-30 08:21:46', '', '', '', '', '', '', ''),
(385, '{"pantType":"trousers","rightLogo":{"image":"img/logo_black.png","size":25},"color":{"base":"#ffffff","trim1":"#ffff00","trim2":"","baseColorName":"white","trim1ColorName":"lemon_yellow","trim2ColorName":""},"design":{"base":"img/trousers/base/front/white.png","name":"Square Leg","designName":"design4","highlightOne":"img/trousers/design4/front/trim1/lemon_yellow.png","highlightTwo":"img/trousers/design4/front/trim2/.png"},"type":"trousers","leftLogo":{"size":25},"quantity":[{"size":"L","quantity":""}],"totalAmount":0,"sendTeamLogoLater":true,"tab":"quantity","tabNo":4}', 'trousers', 'wohlig@wohlig.com', '2017-03-30 10:36:08', '', '', '', '', '', '', ''),
(386, '{"pantType":"trousers","rightLogo":{"image":"img/logo_black.png","size":25},"color":{"base":"#ffffff","trim1":"#ffff00","trim2":"","baseColorName":"white","trim1ColorName":"lemon_yellow","trim2ColorName":""},"design":{"base":"img/trousers/base/front/white.png","name":"Square Leg","designName":"design4","highlightOne":"img/trousers/design4/front/trim1/lemon_yellow.png","highlightTwo":"img/trousers/design4/front/trim2/.png"},"type":"trousers","leftLogo":{"size":25},"quantity":[{"size":"L","quantity":""},{"size":"S"},{"size":"S"}],"totalAmount":0,"sendTeamLogoLater":true,"tab":"quantity","tabNo":4}', 'trousers', 'wohlig@wohlig.com', '2017-03-30 10:37:57', '', '', '', '', '', '', ''),
(387, '{"design":{"base":"img/padscolor/dblue/dorange.png","name":"INSIDE EDGE 202"},"color":{"base":"#ee3301"},"teamLogo":{"image":null,"size":100},"quantity":[{"quantity":15,"size":"Left"},{"quantity":null,"size":"Right"}],"type":"pads","sendTeamLogoLater":true,"totalAmount":735,"tab":"quantity","tabNo":4}', 'pads', 'wohlig@wohlig.com', '2017-03-30 14:08:19', '', '', '', '', '', '', ''),
(388, '{"design":{"base":"img/glovescolor/dblue/1.png","name":"SWEEP 101"},"type":"gloves","quantity":[{"quantity":12,"size":"Left"},{"quantity":null,"size":"Right"}],"color":{"base":"#00008b"},"teamLogo":{"size":102,"image":"image-375071490883331.jpg"},"sendTeamLogoLater":false,"totalAmount":384,"tab":"quantity","tabNo":4}', 'gloves', 'wohlig@wohlig.com', '2017-03-30 14:15:50', '', '', '', '', '', '', 'test note'),
(389, '{"design":{"base":"img/padscolor/updated/pink/1.png","name":"howzat 101"},"color":{"base":"#ff5588"},"teamLogo":{"image":"image-25321492673174.png","size":42},"quantity":[{"quantity":6,"size":"Left"},{"quantity":6,"size":"Right"}],"type":"pads","sendTeamLogoLater":false,"totalAmount":33000,"isBase":true,"isTrim1":false,"isTrim2":false,"tab":"quantity","tabNo":4}', 'pads', 'imran@kathiwadagroup.com', '2017-04-20 07:26:40', '', '', '', '', '', '', ''),
(390, '{"design":{"base":"img/padscolor/dblue/dblue.png","name":"howzat 101"},"color":{"base":"#00008b"},"teamLogo":{"image":null,"size":100},"quantity":[{"quantity":12,"size":"Left"},{"quantity":null,"size":"Right"}],"type":"pads","sendTeamLogoLater":true,"totalAmount":33000,"isBase":true,"isTrim1":false,"isTrim2":false,"tab":"quantity","tabNo":4}', 'pads', 'Array', '2017-04-20 07:35:33', '', '', '', '', '', '', ''),
(391, '{"design":{"base":"img/glovescolor/dblue/1.png","name":"Sweep 101"},"type":"gloves","quantity":[{"quantity":6,"size":"Left"},{"quantity":6,"size":"Right"}],"color":{"base":"#00008b"},"teamLogo":{"size":25},"sendTeamLogoLater":true,"totalAmount":21600,"isBase":true,"isTrim1":false,"isTrim2":false,"tab":"quantity","tabNo":4}', 'gloves', 'imran@kathiwadagroup.com', '2017-04-20 12:48:39', '', '', '', '', '', '', ''),
(392, '{"design":{"base":"img/padscolor/dblue/dblue.png","name":"howzat 101"},"color":{"base":"#00008b"},"teamLogo":{"image":null,"size":100},"quantity":[{"quantity":12,"size":"Left"},{"quantity":null,"size":"Right"}],"type":"pads","sendTeamLogoLater":true,"totalAmount":33000,"isBase":true,"isTrim1":false,"isTrim2":false,"tab":"quantity","tabNo":4}', 'pads', 'wohlig@wohlig.com', '2017-04-21 06:27:31', '', '', '', '', '', '', ''),
(393, '{"design":{"base":"img/glovescolor/red/1.png","name":"Sweep 101"},"type":"gloves","quantity":[{"quantity":12,"size":"Left"},{"quantity":null,"size":"Right"}],"color":{"base":"#db2123"},"teamLogo":{"size":55,"image":"image-209091492756979.png"},"sendTeamLogoLater":false,"totalAmount":21600,"isBase":true,"isTrim1":false,"isTrim2":false,"tab":"quantity","tabNo":4}', 'gloves', 'imran@kathiwadagroup.com', '2017-04-21 06:47:32', '', '', '', '', '', '', ''),
(394, '{"pantType":"trousers","rightLogo":{"image":"img/logo_black.png","size":17,"border":false},"color":{"base":"#2175d9","baseColorName":"india_blue","trim1":"#ffd700","trim2":"","trim1ColorName":"golden_yellow","trim2ColorName":""},"design":{"base":"img/trousers/base/front/india_blue.png","highlightOne":"img/trousers/design3/front/trim1/golden_yellow.png","name":"Long Off","designName":"design3","highlightTwo":"img/trousers/design3/front/trim2/.png"},"type":"trousers","leftLogo":{"size":28,"image":"image-307571492758619.png","border":false},"quantity":[{"size":"S","quantity":5},{"size":"L","quantity":5},{"size":"XXL","quantity":5},{"size":"XXXL","quantity":5}],"totalAmount":17000,"sendTeamLogoLater":false,"isBase":true,"isTrim1":true,"isTrim2":false,"tab":"quantity","tabNo":4,"variable":{"width":25}}', 'trousers', 'imran@kathiwadagroup.com', '2017-04-21 07:11:06', '', '', '', '', '', '', ''),
(395, '{"design":{"base":"img/odi-tshirts/trims/odi/base/front/neon_green.png","designName":"design4","designType":"odi","highlightOne":"img/odi-tshirts/trims/odi/design4/front/trim1/white.png","highlightTwo":"img/odi-tshirts/trims/odi/design4/front/trim2/dark_green.png","name":"Plumb (SUB)"},"color":{"base":"#ccff00","baseColorName":"neon_green","trim1":"#fff","trim1ColorName":"white","trim2":"#1a472a","trim2ColorName":"dark_green"},"teamLogo":{"image":"image-867201492759114.png","size":34,"border":null},"rightChestLogo":{"image":"img/logo_black.png","size":25},"mainSponsorLogo":{"image":"image-253711492759139.png","size":24,"border":null},"leftSleeveLogo":{"image":"image-644951492759150.png","size":28,"border":null},"rightSleeveLogo":{"image":"image-951231492759189.png","size":27,"border":null},"backSponsorLogo":{"image":"image-40801492759205.png","size":18,"border":null},"font":{"fontStyle":"arial","fontColor":"black","nameSize":35,"nameSpacing":1,"numberSize":38,"numberSpacing":1},"type":"odi","sendTeamLogoLater":false,"quantity":[{"size":"L","quantity":23,"name":"Swati","no":"07","sleeve":"long"}],"totalAmount":23000,"totalQuan":23,"leftSleeveLogoBack":{"image":"image-644951492759150.png","size":28,"border":null},"rightSleeveLogoBack":{"image":"image-951231492759189.png","size":27,"border":null},"isBase":true,"isTrim1":true,"isTrim2":true,"tab":"quantity","tabNo":4}', 'odi', 'imran@kathiwadagroup.com', '2017-04-21 07:26:25', '', '', '', '', '', '', ''),
(396, '{"design":{"base":"img/glovescolor/red/1.png","name":"Sweep 101"},"type":"gloves","quantity":[{"quantity":5,"size":"Left"},{"quantity":10,"size":"Right"}],"color":{"base":"#db2123"},"teamLogo":{"size":44,"image":"image-680061492764696.jpg"},"sendTeamLogoLater":false,"totalAmount":27000,"isBase":true,"isTrim1":false,"isTrim2":false,"tab":"quantity","tabNo":4}', 'gloves', 'swati@kathiwada.com', '2017-04-21 08:53:24', '', '', '', '', '', '', ''),
(397, '{"design":{"base":"img/padscolor/updated/pink/1.png","name":"howzat 101"},"color":{"base":"#ff5588"},"teamLogo":{"image":"image-950911492765306.jpg","size":100},"quantity":[{"quantity":4,"size":"Left"},{"quantity":8,"size":"Right"}],"type":"pads","sendTeamLogoLater":false,"totalAmount":33000,"isBase":true,"isTrim1":false,"isTrim2":false,"tab":"quantity","tabNo":4}', 'pads', 'swati@kathiwada.com', '2017-04-21 09:03:28', '', '', '', '', '', '', ''),
(398, '{"pantType":"trousers","rightLogo":{"image":"img/logo_black.png","size":25},"color":{"base":"#bf0000","baseColorName":"red","trim1":"#ffa500","trim2":"","trim1ColorName":"orange","trim2ColorName":""},"design":{"base":"img/trousers/base/front/red.png","highlightOne":"img/trousers/design3/front/trim1/orange.png","name":"Long Off","designName":"design3","highlightTwo":"img/trousers/design3/front/trim2/.png"},"type":"trousers","leftLogo":{"size":25,"image":"image-793791492765617.jpg"},"quantity":[{"size":"S","quantity":13}],"totalAmount":11050,"sendTeamLogoLater":false,"isBase":true,"isTrim1":true,"isTrim2":false,"tab":"quantity","tabNo":4,"variable":{"width":25}}', 'trousers', 'swati@kathiwada.com', '2017-04-21 09:09:33', '', '', '', '', '', '', ''),
(399, '{"design":{"base":"img/glovescolor/dblue/1.png","name":"Sweep 101"},"type":"gloves","quantity":[{"quantity":10,"size":"Left"},{"quantity":2,"size":"Right"}],"color":{"base":"#00008b"},"teamLogo":{"size":55,"image":"image-377071492774434.jpg"},"sendTeamLogoLater":true,"totalAmount":21600,"isBase":true,"isTrim1":false,"isTrim2":false,"tab":"quantity","tabNo":4}', 'gloves', 'Array', '2017-04-21 11:40:01', '', '', '', '', '', '', ''),
(400, '{"design":{"base":"img/padscolor/dblue/dblue.png","name":"howzat 101"},"color":{"base":"#00008b"},"teamLogo":{"image":"image-248031492844847.jpg","size":100},"quantity":[{"quantity":12,"size":"Left"},{"quantity":null,"size":"Right"}],"type":"pads","sendTeamLogoLater":false,"totalAmount":33000,"isBase":true,"isTrim1":false,"isTrim2":false,"tab":"quantity","tabNo":4}', 'pads', 'Array', '2017-04-22 07:08:15', '', '', '', '', '', '', ''),
(401, '{"design":{"base":"img/odi-tshirts/trims/odi/base/front/india_blue.png","designName":"design1","designType":"odi","highlightOne":"img/odi-tshirts/trims/odi/design1/front/trim1/grey.png","highlightTwo":"img/odi-tshirts/trims/odi/design1/front/trim2/grey.png","name":"Googly (SUB)"},"color":{"base":"#2175d9","baseColorName":"india_blue","trim1":"#666666","trim1ColorName":"grey","trim2":"#666666","trim2ColorName":"grey"},"teamLogo":{"image":null,"size":25},"rightChestLogo":{"image":"img/logo_black.png","size":25},"mainSponsorLogo":{"image":null,"size":25},"leftSleeveLogo":{"image":null,"size":25},"rightSleeveLogo":{"image":null,"size":25},"backSponsorLogo":{"image":null,"size":25},"font":{"fontStyle":"arial","fontColor":"white","nameSize":18,"nameSpacing":1,"numberSize":50,"numberSpacing":1},"type":"odi","sendTeamLogoLater":true,"quantity":[{"size":"L","quantity":33,"name":"tfgg","no":"454","sleeve":"short"}],"totalAmount":33000,"totalQuan":33,"leftSleeveLogoBack":{"image":null,"size":25},"rightSleeveLogoBack":{"image":null,"size":25},"isBase":true,"isTrim1":true,"isTrim2":true,"tab":"quantity","tabNo":4}', 'odi', 'wohlig@wohlig.com', '2017-04-25 05:10:14', '', '', '', '', '', '', ''),
(402, '{"pantType":"trousers","rightLogo":{"image":"img/logo_black.png","size":25},"color":{"base":"#ffffff","baseColorName":"white","trim1":"#ffff00","trim2":"","trim1ColorName":"lemon_yellow","trim2ColorName":""},"design":{"base":"img/trousers/base/front/white.png","highlightOne":"img/trousers/design4/front/trim1/lemon_yellow.png","name":"Square Leg","designName":"design4","highlightTwo":"img/trousers/design4/front/trim2/.png"},"type":"trousers","leftLogo":{"size":25},"quantity":[{"size":"S","quantity":22}],"totalAmount":18700,"sendTeamLogoLater":true,"isBase":true,"isTrim1":true,"isTrim2":false,"tab":"quantity","tabNo":4}', 'trousers', 'Array', '2017-04-25 06:13:08', '', '', '', '', '', '', ''),
(403, '{"design":{"base":"img/odi-tshirts/trims/odi/base/front/india_blue.png","designName":"design1","designType":"odi","highlightOne":"img/odi-tshirts/trims/odi/design1/front/trim1/grey.png","highlightTwo":"img/odi-tshirts/trims/odi/design1/front/trim2/grey.png","name":"Googly (SUB)"},"color":{"base":"#2175d9","baseColorName":"india_blue","trim1":"#666666","trim1ColorName":"grey","trim2":"#666666","trim2ColorName":"grey"},"teamLogo":{"image":null,"size":25},"rightChestLogo":{"image":"img/logo_black.png","size":25},"mainSponsorLogo":{"image":null,"size":25},"leftSleeveLogo":{"image":null,"size":25},"rightSleeveLogo":{"image":null,"size":25},"backSponsorLogo":{"image":null,"size":25},"font":{"fontStyle":"arial","fontColor":"white","nameSize":18,"nameSpacing":1,"numberSize":50,"numberSpacing":1},"type":"odi","sendTeamLogoLater":true,"quantity":[{"size":"L","quantity":22,"name":"gbfd","no":"454","sleeve":"short"}],"totalAmount":22000,"totalQuan":22,"leftSleeveLogoBack":{"image":null,"size":25},"rightSleeveLogoBack":{"image":null,"size":25},"isBase":true,"isTrim1":true,"isTrim2":true,"tab":"quantity","tabNo":4}', 'odi', 'wohlig@wohlig.com', '2017-04-25 06:29:19', '', '', '', '', '', '', ''),
(404, '{"design":{"base":"img/odi-tshirts/trims/odi/base/front/india_blue.png","designName":"design1","designType":"odi","highlightOne":"img/odi-tshirts/trims/odi/design1/front/trim1/grey.png","highlightTwo":"img/odi-tshirts/trims/odi/design1/front/trim2/grey.png","name":"Googly (SUB)"},"color":{"base":"#2175d9","baseColorName":"india_blue","trim1":"#666666","trim1ColorName":"grey","trim2":"#666666","trim2ColorName":"grey"},"teamLogo":{"image":null,"size":25},"rightChestLogo":{"image":"img/logo_black.png","size":25},"mainSponsorLogo":{"image":null,"size":25},"leftSleeveLogo":{"image":null,"size":25},"rightSleeveLogo":{"image":null,"size":25},"backSponsorLogo":{"image":null,"size":25},"font":{"fontStyle":"arial","fontColor":"white","nameSize":18,"nameSpacing":1,"numberSize":50,"numberSpacing":1},"type":"odi","sendTeamLogoLater":true,"quantity":[{"size":"L","quantity":22,"name":"sds","no":"211","sleeve":"short"}],"totalAmount":22000,"totalQuan":22,"leftSleeveLogoBack":{"image":null,"size":25},"rightSleeveLogoBack":{"image":null,"size":25},"isBase":true,"isTrim1":true,"isTrim2":true,"tab":"quantity","tabNo":4}', 'odi', 'wohlig@wohlig.com', '2017-04-25 07:59:48', '', '', '', '', '', '', ''),
(405, '{"design":{"base":"img/odi-tshirts/trims/odi/base/front/india_blue.png","designName":"design1","designType":"odi","highlightOne":"img/odi-tshirts/trims/odi/design1/front/trim1/grey.png","highlightTwo":"img/odi-tshirts/trims/odi/design1/front/trim2/grey.png","name":"Googly (SUB)"},"color":{"base":"#2175d9","baseColorName":"india_blue","trim1":"#666666","trim1ColorName":"grey","trim2":"#666666","trim2ColorName":"grey"},"teamLogo":{"image":null,"size":25},"rightChestLogo":{"image":"img/logo_black.png","size":25},"mainSponsorLogo":{"image":null,"size":25},"leftSleeveLogo":{"image":null,"size":25},"rightSleeveLogo":{"image":null,"size":25},"backSponsorLogo":{"image":null,"size":25},"font":{"fontStyle":"arial","fontColor":"white","nameSize":18,"nameSpacing":1,"numberSize":50,"numberSpacing":1},"type":"odi","sendTeamLogoLater":true,"quantity":[{"size":"L","quantity":22,"name":"dfdf","no":"343","sleeve":"short"}],"totalAmount":22000,"totalQuan":22,"leftSleeveLogoBack":{"image":null,"size":25},"rightSleeveLogoBack":{"image":null,"size":25},"isBase":true,"isTrim1":true,"isTrim2":true,"tab":"quantity","tabNo":4}', 'odi', 'Array', '2017-04-25 09:52:17', '', '', '', '', '', '', ''),
(406, '{"design":{"base":"img/odi-tshirts/trims/odi/base/front/india_blue.png","designName":"design1","designType":"odi","highlightOne":"img/odi-tshirts/trims/odi/design1/front/trim1/grey.png","highlightTwo":"img/odi-tshirts/trims/odi/design1/front/trim2/grey.png","name":"Googly (SUB)"},"color":{"base":"#2175d9","baseColorName":"india_blue","trim1":"#666666","trim1ColorName":"grey","trim2":"#666666","trim2ColorName":"grey"},"teamLogo":{"image":null,"size":25},"rightChestLogo":{"image":"img/logo_black.png","size":25},"mainSponsorLogo":{"image":null,"size":25},"leftSleeveLogo":{"image":null,"size":25},"rightSleeveLogo":{"image":null,"size":25},"backSponsorLogo":{"image":null,"size":25},"font":{"fontStyle":"arial","fontColor":"white","nameSize":18,"nameSpacing":1,"numberSize":50,"numberSpacing":1},"type":"odi","sendTeamLogoLater":true,"quantity":[{"size":"L","quantity":56,"name":"hgj","no":"56","sleeve":"short"}],"totalAmount":56000,"totalQuan":56,"leftSleeveLogoBack":{"image":null,"size":25},"rightSleeveLogoBack":{"image":null,"size":25},"isBase":true,"isTrim1":true,"isTrim2":true,"tab":"quantity","tabNo":4}', 'odi', 'wohlig@wohlig.com', '2017-04-25 10:54:53', '', '', '', '', '', '', ''),
(407, '{"design":{"base":"img/odi-tshirts/trims/whites/design1/front/front.png","designName":"design1","designType":"whites","highlightOne":"img/odi-tshirts/trims/whites/design1/front/trim1/white.png","highlightTwo":"img/odi-tshirts/trims/whites/design1/front/trim2/white.png","name":"First Slip"},"color":{"base":"#ffffff","baseColorName":"white","trim1":"#ffffff","trim1ColorName":"white","trim2":"#ffffff","trim2ColorName":"white"},"teamLogo":{"image":"image-789981493125666.jpg","size":25},"rightChestLogo":{"image":"img/logo_black.png","size":25},"mainSponsorLogo":{"image":"image-55541493125672.png","size":25},"leftSleeveLogo":{"image":null,"size":25},"rightSleeveLogo":{"image":null,"size":25},"backSponsorLogo":{"image":null,"size":25},"font":{"fontStyle":"arial","fontColor":"white","nameSize":18,"nameSpacing":1,"numberSize":50,"numberSpacing":1},"type":"odi","sendTeamLogoLater":true,"quantity":[{"size":"L","quantity":66,"name":"","no":"","sleeve":"short"}],"totalAmount":66000,"totalQuan":66,"leftSleeveLogoBack":{"image":null,"size":25},"rightSleeveLogoBack":{"image":null,"size":25},"isBase":false,"isTrim1":true,"isTrim2":false,"tab":"quantity","tabNo":4}', 'odi', 'Array', '2017-04-25 13:08:19', '', '', '', '', '', '', ''),
(408, '{"design":{"base":"img/odi-tshirts/trims/whites/design3/front/front.png","designName":"design3","designType":"whites","highlightOne":"img/odi-tshirts/trims/whites/design3/front/trim1/royal_blue.png","highlightTwo":"img/odi-tshirts/trims/whites/design3/front/trim2/white.png","name":"Cover"},"color":{"base":"#ffffff","baseColorName":"white","trim1":"#00308f","trim1ColorName":"royal_blue","trim2":"#ffffff","trim2ColorName":"white"},"teamLogo":{"image":"image-282391493125749.png","size":25},"rightChestLogo":{"image":"img/logo_black.png","size":25},"mainSponsorLogo":{"image":null,"size":25},"leftSleeveLogo":{"image":null,"size":25},"rightSleeveLogo":{"image":null,"size":25},"backSponsorLogo":{"image":null,"size":25},"font":{"fontStyle":"arial","fontColor":"white","nameSize":18,"nameSpacing":1,"numberSize":50,"numberSpacing":1},"type":"odi","sendTeamLogoLater":true,"quantity":[{"size":"L","quantity":23,"name":"","no":"","sleeve":"short"}],"totalAmount":23000,"totalQuan":23,"leftSleeveLogoBack":{"image":null,"size":25},"rightSleeveLogoBack":{"image":null,"size":25},"isBase":false,"isTrim1":true,"isTrim2":false,"tab":"quantity","tabNo":4}', 'odi', 'wohlig@wohlig.com', '2017-04-25 13:09:26', '', '', '', '', '', '', ''),
(409, '{"design":{"base":"img/odi-tshirts/trims/whites/design3/front/front.png","designName":"design3","designType":"whites","highlightOne":"img/odi-tshirts/trims/whites/design3/front/trim1/maroon.png","highlightTwo":"img/odi-tshirts/trims/whites/design3/front/trim2/white.png","name":"Cover"},"color":{"base":"#ffffff","baseColorName":"white","trim1":"#800000","trim1ColorName":"maroon","trim2":"#ffffff","trim2ColorName":"white"},"teamLogo":{"image":"image-825751493126554.png","size":25},"rightChestLogo":{"image":"img/logo_black.png","size":25},"mainSponsorLogo":{"image":null,"size":25},"leftSleeveLogo":{"image":null,"size":25},"rightSleeveLogo":{"image":null,"size":25},"backSponsorLogo":{"image":null,"size":25},"font":{"fontStyle":"arial","fontColor":"white","nameSize":18,"nameSpacing":1,"numberSize":50,"numberSpacing":1},"type":"odi","sendTeamLogoLater":true,"quantity":[{"size":"L","quantity":77,"name":"","no":"","sleeve":"short"}],"totalAmount":77000,"totalQuan":77,"leftSleeveLogoBack":{"image":null,"size":25},"rightSleeveLogoBack":{"image":null,"size":25},"isBase":false,"isTrim1":true,"isTrim2":false,"tab":"quantity","tabNo":4}', 'odi', 'wohlig@wohlig.com', '2017-04-25 13:22:52', '', '', '', '', '', '', ''),
(410, '{"design":{"base":"img/odi-tshirts/trims/odi/base/front/india_blue.png","designName":"design1","designType":"odi","highlightOne":"img/odi-tshirts/trims/odi/design1/front/trim1/grey.png","highlightTwo":"img/odi-tshirts/trims/odi/design1/front/trim2/grey.png","name":"Googly (SUB)"},"color":{"base":"#2175d9","baseColorName":"india_blue","trim1":"#666666","trim1ColorName":"grey","trim2":"#666666","trim2ColorName":"grey"},"teamLogo":{"image":null,"size":25},"rightChestLogo":{"image":"img/logo_black.png","size":25},"mainSponsorLogo":{"image":null,"size":25},"leftSleeveLogo":{"image":null,"size":25},"rightSleeveLogo":{"image":null,"size":25},"backSponsorLogo":{"image":null,"size":25},"font":{"fontStyle":"arial","fontColor":"white","nameSize":18,"nameSpacing":1,"numberSize":50,"numberSpacing":1},"type":"odi","sendTeamLogoLater":true,"quantity":[{"size":"L","quantity":55,"name":"","no":"","sleeve":"short"}],"totalAmount":55000,"totalQuan":55,"leftSleeveLogoBack":{"image":null,"size":25},"rightSleeveLogoBack":{"image":null,"size":25},"isBase":true,"isTrim1":true,"isTrim2":true,"tab":"quantity","tabNo":4}', 'odi', 'wohlig@wohlig.com', '2017-04-25 13:25:30', '', '', '', '', '', '', ''),
(411, '{"design":{"base":"img/odi-tshirts/trims/whites/design3/front/front.png","designName":"design3","designType":"whites","highlightOne":"img/odi-tshirts/trims/whites/design3/front/trim1/red.png","highlightTwo":"img/odi-tshirts/trims/whites/design3/front/trim2/white.png","name":"Cover"},"color":{"base":"#ffffff","baseColorName":"white","trim1":"#bf0000","trim1ColorName":"red","trim2":"#ffffff","trim2ColorName":"white"},"teamLogo":{"image":null,"size":25},"rightChestLogo":{"image":"img/logo_black.png","size":25},"mainSponsorLogo":{"image":null,"size":25},"leftSleeveLogo":{"image":null,"size":25},"rightSleeveLogo":{"image":null,"size":25},"backSponsorLogo":{"image":null,"size":25},"font":{"fontStyle":"arial","fontColor":"white","nameSize":18,"nameSpacing":1,"numberSize":50,"numberSpacing":1},"type":"odi","sendTeamLogoLater":true,"quantity":[{"size":"L","quantity":22,"name":"","no":"","sleeve":"short"}],"totalAmount":22000,"totalQuan":22,"leftSleeveLogoBack":{"image":null,"size":25},"rightSleeveLogoBack":{"image":null,"size":25},"isBase":false,"isTrim1":true,"isTrim2":false,"tab":"quantity","tabNo":4}', 'odi', 'wohlig@wohlig.com', '2017-04-25 13:26:12', '', '', '', '', '', '', ''),
(412, '{"design":{"base":"img/odi-tshirts/trims/whites/design4/front/front.png","designName":"design4","designType":"whites","highlightOne":"img/odi-tshirts/trims/whites/design4/front/trim1/black.png","highlightTwo":"img/odi-tshirts/trims/whites/design4/front/trim2/white.png","name":"Gully"},"color":{"base":"#000","baseColorName":"white","trim1":"#bf0000","trim1ColorName":"black","trim2":"#ffffff","trim2ColorName":"white"},"teamLogo":{"image":null,"size":25},"rightChestLogo":{"image":"img/logo_black.png","size":25},"mainSponsorLogo":{"image":null,"size":25},"leftSleeveLogo":{"image":null,"size":25},"rightSleeveLogo":{"image":null,"size":25},"backSponsorLogo":{"image":null,"size":25},"font":{"fontStyle":"arial","fontColor":"white","nameSize":18,"nameSpacing":1,"numberSize":50,"numberSpacing":1},"type":"odi","sendTeamLogoLater":true,"quantity":[{"size":"L","quantity":44,"name":"","no":"","sleeve":"short"}],"totalAmount":44000,"totalQuan":44,"leftSleeveLogoBack":{"image":null,"size":25},"rightSleeveLogoBack":{"image":null,"size":25},"isBase":false,"isTrim1":true,"isTrim2":false,"tab":"quantity","tabNo":4}', 'odi', 'wohlig@wohlig.com', '2017-04-25 13:26:44', '', '', '', '', '', '', ''),
(413, '{"design":{"base":"img/glovescolor/lorange/1.png","name":"Sweep 101"},"type":"gloves","quantity":[{"quantity":12,"size":"Left"},{"quantity":null,"size":"Right"}],"color":{"base":"#ff8247"},"teamLogo":{"size":25},"sendTeamLogoLater":true,"totalAmount":21600,"isBase":true,"isTrim1":false,"isTrim2":false,"tab":"quantity","tabNo":4}', 'gloves', 'Array', '2017-05-02 06:39:56', '', '', '', '', '', '', ''),
(414, '{"pantType":"trousers","rightLogo":{"image":"img/logo_black.png","size":25},"color":{"base":"#008000","baseColorName":"australian_green","trim1":"#ffff00","trim2":"","trim1ColorName":"lemon_yellow","trim2ColorName":""},"design":{"base":"img/trousers/base/front/australian_green.png","highlightOne":"img/trousers/design4/front/trim1/lemon_yellow.png","name":"Square Leg","designName":"design4","highlightTwo":"img/trousers/design4/front/trim2/.png"},"type":"trousers","leftLogo":{"size":25},"quantity":[{"size":"S","quantity":""}],"totalAmount":0,"sendTeamLogoLater":true,"isBase":true,"isTrim1":true,"isTrim2":false,"tab":"quantity","tabNo":4}', 'trousers', 'Array', '2017-05-02 06:46:37', '', '', '', '', '', '', ''),
(415, '{"design":{"base":"img/odi-tshirts/trims/odi/base/front/royal_blue.png","designName":"design4","designType":"odi","highlightOne":"img/odi-tshirts/trims/odi/design4/front/trim1/white.png","highlightTwo":"img/odi-tshirts/trims/odi/design4/front/trim2/dark_green.png","name":"Plumb (SUB)"},"color":{"base":"#00308f","baseColorName":"royal_blue","trim1":"#fff","trim1ColorName":"white","trim2":"#1a472a","trim2ColorName":"dark_green"},"teamLogo":{"image":null,"size":25},"rightChestLogo":{"image":"img/logo_black.png","size":25},"mainSponsorLogo":{"image":null,"size":25},"leftSleeveLogo":{"image":null,"size":25},"rightSleeveLogo":{"image":null,"size":25},"backSponsorLogo":{"image":null,"size":25},"font":{"fontStyle":"arial","fontColor":"white","nameSize":18,"nameSpacing":1,"numberSize":50,"numberSpacing":1},"type":"odi","sendTeamLogoLater":true,"quantity":[{"size":"L","quantity":20,"name":"imran","no":"07","sleeve":"short"}],"totalAmount":20000,"totalQuan":20,"leftSleeveLogoBack":{"image":null,"size":25},"rightSleeveLogoBack":{"image":null,"size":25},"isBase":true,"isTrim1":true,"isTrim2":true,"tab":"quantity","tabNo":4}', 'odi', 'wohlig@wohlig.com', '2017-05-02 06:51:39', '', '', '', '', '', '', ''),
(416, '{"design":{"base":"img/odi-tshirts/trims/odi/base/front/india_blue.png","designName":"design1","designType":"odi","highlightOne":"img/odi-tshirts/trims/odi/design1/front/trim1/grey.png","highlightTwo":"img/odi-tshirts/trims/odi/design1/front/trim2/grey.png","name":"Googly (SUB)"},"color":{"base":"#2175d9","baseColorName":"india_blue","trim1":"#666666","trim1ColorName":"grey","trim2":"#666666","trim2ColorName":"grey"},"teamLogo":{"image":null,"size":25},"rightChestLogo":{"image":"img/logo_black.png","size":25},"mainSponsorLogo":{"image":null,"size":25},"leftSleeveLogo":{"image":null,"size":25},"rightSleeveLogo":{"image":null,"size":25},"backSponsorLogo":{"image":"image-868181493713351.png","size":50,"border":null},"font":{"fontStyle":"arial","fontColor":"white","nameSize":22,"nameSpacing":1,"numberSize":50,"numberSpacing":1},"type":"odi","sendTeamLogoLater":true,"quantity":[{"size":"L","quantity":45,"name":"dhcj","no":"647","sleeve":"short"}],"totalAmount":45000,"totalQuan":45,"leftSleeveLogoBack":{"image":null,"size":25},"rightSleeveLogoBack":{"image":null,"size":25},"isBase":true,"isTrim1":true,"isTrim2":true,"tab":"quantity","tabNo":4}', 'odi', 'Array', '2017-05-02 08:24:14', '', '', '', '', '', '', ''),
(417, '{"design":{"base":"img/odi-tshirts/trims/odi/base/front/india_blue.png","designName":"design1","designType":"odi","highlightOne":"img/odi-tshirts/trims/odi/design1/front/trim1/grey.png","highlightTwo":"img/odi-tshirts/trims/odi/design1/front/trim2/grey.png","name":"Googly (SUB)"},"color":{"base":"#2175d9","baseColorName":"india_blue","trim1":"#666666","trim1ColorName":"grey","trim2":"#666666","trim2ColorName":"grey"},"teamLogo":{"image":null,"size":25},"rightChestLogo":{"image":"img/logo_black.png","size":25},"mainSponsorLogo":{"image":null,"size":25},"leftSleeveLogo":{"image":null,"size":25},"rightSleeveLogo":{"image":null,"size":25},"backSponsorLogo":{"image":null,"size":25},"font":{"fontStyle":"arial","fontColor":"white","nameSize":18,"nameSpacing":1,"numberSize":50,"numberSpacing":1},"type":"odi","sendTeamLogoLater":true,"quantity":[{"size":"L","quantity":43,"name":"dfdf","no":"345","sleeve":"short"}],"totalAmount":43000,"totalQuan":43,"leftSleeveLogoBack":{"image":null,"size":25},"rightSleeveLogoBack":{"image":null,"size":25},"isBase":true,"isTrim1":true,"isTrim2":true,"tab":"quantity","tabNo":4}', 'odi', 'wohlig@wohlig.com', '2017-05-02 08:26:09', '', '', '', '', '', '', ''),
(418, '{"design":{"base":"img/odi-tshirts/trims/odi/base/front/australian_green.png","designName":"design1","designType":"odi","highlightOne":"img/odi-tshirts/trims/odi/design1/front/trim1/grey.png","highlightTwo":"img/odi-tshirts/trims/odi/design1/front/trim2/grey.png","name":"Googly (SUB)"},"color":{"base":"#008000","baseColorName":"australian_green","trim1":"#666666","trim1ColorName":"grey","trim2":"#666666","trim2ColorName":"grey"},"teamLogo":{"image":null,"size":25},"rightChestLogo":{"image":"img/logo_black.png","size":25},"mainSponsorLogo":{"image":null,"size":25},"leftSleeveLogo":{"image":null,"size":25},"rightSleeveLogo":{"image":null,"size":25},"backSponsorLogo":{"image":null,"size":25},"font":{"fontStyle":"arial","fontColor":"white","nameSize":18,"nameSpacing":1,"numberSize":50,"numberSpacing":1},"type":"odi","sendTeamLogoLater":true,"quantity":[{"size":"L","quantity":20,"name":"TEST","no":"12","sleeve":"short"}],"totalAmount":340,"totalQuan":20,"leftSleeveLogoBack":{"image":null,"size":25},"rightSleeveLogoBack":{"image":null,"size":25},"isBase":true,"isTrim1":true,"isTrim2":true,"tab":"quantity","tabNo":4}', 'odi', 'Array', '2017-05-02 13:12:25', '', '', '', '', '', '', ''),
(419, '{"design":{"base":"img/odi-tshirts/trims/odi/base/front/neon_green.png","designName":"design4","designType":"odi","highlightOne":"img/odi-tshirts/trims/odi/design4/front/trim1/white.png","highlightTwo":"img/odi-tshirts/trims/odi/design4/front/trim2/dark_green.png","name":"Plumb (SUB)"},"color":{"base":"#ccff00","baseColorName":"neon_green","trim1":"#fff","trim1ColorName":"white","trim2":"#1a472a","trim2ColorName":"dark_green"},"teamLogo":{"image":null,"size":25},"rightChestLogo":{"image":"img/logo_black.png","size":25},"mainSponsorLogo":{"image":null,"size":25},"leftSleeveLogo":{"image":null,"size":25},"rightSleeveLogo":{"image":null,"size":25},"backSponsorLogo":{"image":"image-137641493894377.png","size":25},"font":{"fontStyle":"arial","fontColor":"white","nameSize":18,"nameSpacing":1,"numberSize":50,"numberSpacing":1},"type":"odi","sendTeamLogoLater":true,"quantity":[{"size":"L","quantity":33,"name":"dfdfv","no":"433","sleeve":"short"}],"totalAmount":33000,"totalQuan":33,"leftSleeveLogoBack":{"image":null,"size":25},"rightSleeveLogoBack":{"image":null,"size":25},"isBase":true,"isTrim1":true,"isTrim2":true,"tab":"quantity","tabNo":4}', 'odi', 'wohlig@wohlig.com', '2017-05-04 10:39:54', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `customorder`
--

CREATE TABLE IF NOT EXISTS `customorder` (
`id` int(10) NOT NULL,
  `user` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `billingaddress` varchar(255) NOT NULL,
  `billingcontact` varchar(255) NOT NULL,
  `billingcity` varchar(255) NOT NULL,
  `billingstate` varchar(255) NOT NULL,
  `billingpincode` varchar(255) NOT NULL,
  `billingcountry` varchar(255) NOT NULL,
  `shippingcity` varchar(255) NOT NULL,
  `shippingaddress` varchar(255) NOT NULL,
  `shippingname` varchar(255) NOT NULL,
  `shippingcountry` varchar(255) NOT NULL,
  `shippingcontact` varchar(255) NOT NULL,
  `shippingstate` varchar(255) NOT NULL,
  `shippingpincode` varchar(255) NOT NULL,
  `trackingcode` varchar(255) NOT NULL,
  `defaultcurrency` varchar(255) NOT NULL,
  `shippingmethod` varchar(255) NOT NULL,
  `orderstatus` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `billingline1` varchar(255) NOT NULL,
  `billingline2` varchar(255) NOT NULL,
  `billingline3` varchar(255) NOT NULL,
  `shippingline1` varchar(255) NOT NULL,
  `shippingline2` varchar(255) NOT NULL,
  `shippingline3` varchar(255) NOT NULL,
  `transactionid` varchar(255) NOT NULL,
  `paymentmode` varchar(255) DEFAULT NULL,
  `finalamount` varchar(50) NOT NULL,
  `totalamount` double NOT NULL,
  `discountamount` double NOT NULL,
  `shippingamount` double NOT NULL,
  `currency` varchar(255) NOT NULL,
  `payemail` varchar(555) NOT NULL,
  `paytype` varchar(255) NOT NULL,
  `payresponse` longtext NOT NULL,
  `type` int(11) NOT NULL,
  `backimage` varchar(255) NOT NULL,
  `frontimage` varchar(255) NOT NULL,
  `teamlogo` varchar(255) NOT NULL,
  `rightlogo` varchar(255) NOT NULL,
  `mainsponserlogo` varchar(255) NOT NULL,
  `leftsleeve` varchar(255) NOT NULL,
  `rightsleeve` varchar(255) NOT NULL,
  `backsponser` varchar(255) NOT NULL,
  `font` varchar(255) NOT NULL,
  `fontcolor` varchar(255) NOT NULL,
  `printingtype` varchar(255) NOT NULL,
  `customtype` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `note` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customorder`
--

INSERT INTO `customorder` (`id`, `user`, `firstname`, `lastname`, `email`, `billingaddress`, `billingcontact`, `billingcity`, `billingstate`, `billingpincode`, `billingcountry`, `shippingcity`, `shippingaddress`, `shippingname`, `shippingcountry`, `shippingcontact`, `shippingstate`, `shippingpincode`, `trackingcode`, `defaultcurrency`, `shippingmethod`, `orderstatus`, `timestamp`, `billingline1`, `billingline2`, `billingline3`, `shippingline1`, `shippingline2`, `shippingline3`, `transactionid`, `paymentmode`, `finalamount`, `totalamount`, `discountamount`, `shippingamount`, `currency`, `payemail`, `paytype`, `payresponse`, `type`, `backimage`, `frontimage`, `teamlogo`, `rightlogo`, `mainsponserlogo`, `leftsleeve`, `rightsleeve`, `backsponser`, `font`, `fontcolor`, `printingtype`, `customtype`, `description`, `note`) VALUES
(1, 107, '', '', 'wohlig@wohlig.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2017-02-06 13:23:13', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', 'gloves', '{"description":{"glovesLogo":{"divattributes":{"top":"246px","left":"355px"},"attributes":{"width":50},"printType":"embroidered"},"glovesArr":[{"direction":"left","quantity":1}],"glovesDesign":{"name":"$scope.glovesImages1","image":"img/glovescolor/dblue/1.png","color":"dblue"},"teamlogo":"","totalAmount":6800,"totalQuan":1},"glovesArr":[{"direction":"left","quantity":1}],"glovesLogo":{"divattributes":{"top":"246px","left":"355px"},"attributes":{"width":50},"printType":"embroidered"},"totalQuan":1,"totalAmount":6800,"data":{"id":"3","description":"{"glovesLogo":{"divattributes":{"top":"246px","left":"355px"},"attributes":{"width":50},"printType":"embroidered"},"glovesArr":[{"direction":"left","quantity":1}],"glovesDesign":{"name":"$scope.glovesImages1","image":"img/glovescolor/dblue/1.png","color":"dblue"},"teamlogo":"","totalAmount":6800,"totalQuan":1}","type":"gloves","email":"wohlig@wohlig.com","date":"2017-02-06 13:14:33","mainsponserlogo":"","leftsleeve":"","rightsleeve":"","backsponser":"","teamlogo":"","rightchest":""}}', ''),
(2, 107, '', '', 'wohlig@wohlig.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2017-02-06 13:27:00', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', 'gloves', '{"description":{"glovesLogo":{"divattributes":{"top":"246px","left":"355px"},"attributes":{"width":50},"printType":"embroidered"},"glovesArr":[{"direction":"left","quantity":10}],"glovesDesign":{"name":"$scope.glovesImages1","image":"img/glovescolor/dorange/1.png","color":"dorange"},"teamlogo":"","totalAmount":23000,"totalQuan":10,"designType":"gloves"},"glovesArr":[{"direction":"left","quantity":10}],"glovesLogo":{"divattributes":{"top":"246px","left":"355px"},"attributes":{"width":50},"printType":"embroidered"},"totalQuan":10,"totalAmount":23000,"data":{"id":"4","description":"{"glovesLogo":{"divattributes":{"top":"246px","left":"355px"},"attributes":{"width":50},"printType":"embroidered"},"glovesArr":[{"direction":"left","quantity":10}],"glovesDesign":{"name":"$scope.glovesImages1","image":"img/glovescolor/dorange/1.png","color":"dorange"},"teamlogo":"","totalAmount":23000,"totalQuan":10,"designType":"gloves"}","type":"gloves","email":"wohlig@wohlig.com","date":"2017-02-06 13:26:57","mainsponserlogo":"","leftsleeve":"","rightsleeve":"","backsponser":"","teamlogo":"","rightchest":""}}', ''),
(3, 107, '', '', 'wohlig@wohlig.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2017-02-06 13:54:13', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', 'gloves', '{"description":{"glovesLogo":{"divattributes":{"top":"246px","left":"355px"},"attributes":{"width":50},"printType":"embroidered"},"glovesArr":[{"direction":"left","quantity":1}],"glovesDesign":{"name":"$scope.glovesImages1","image":"img/glovescolor/yellow/1.png"},"teamlogo":"","totalAmount":6800,"totalQuan":1,"designType":"gloves"},"glovesArr":[{"direction":"left","quantity":1}],"glovesLogo":{"divattributes":{"top":"246px","left":"355px"},"attributes":{"width":50},"printType":"embroidered"},"totalQuan":1,"totalAmount":6800,"data":{"id":"6","description":"{"glovesLogo":{"divattributes":{"top":"246px","left":"355px"},"attributes":{"width":50},"printType":"embroidered"},"glovesArr":[{"direction":"left","quantity":1}],"glovesDesign":{"name":"$scope.glovesImages1","image":"img/glovescolor/yellow/1.png"},"teamlogo":"","totalAmount":6800,"totalQuan":1,"designType":"gloves"}","type":"gloves","email":"wohlig@wohlig.com","date":"2017-02-06 13:54:08","mainsponserlogo":"","leftsleeve":"","rightsleeve":"","backsponser":"","teamlogo":"","rightchest":""}}', ''),
(4, 107, '', '', 'wohlig@wohlig.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2017-02-06 13:56:21', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', 'gloves', '{"description":{"glovesLogo":{"divattributes":{"top":"246px","left":"355px"},"attributes":{"width":50},"printType":"embroidered"},"glovesArr":[{"direction":"left","quantity":1}],"glovesDesign":{"name":"$scope.glovesImages1","image":"img/glovescolor/yellow/1.png"},"teamlogo":"","totalAmount":6800,"totalQuan":1,"designType":"gloves"},"glovesArr":[{"direction":"left","quantity":1}],"glovesLogo":{"divattributes":{"top":"246px","left":"355px"},"attributes":{"width":50},"printType":"embroidered"},"totalQuan":1,"totalAmount":6800,"data":{"id":"6","description":"{"glovesLogo":{"divattributes":{"top":"246px","left":"355px"},"attributes":{"width":50},"printType":"embroidered"},"glovesArr":[{"direction":"left","quantity":1}],"glovesDesign":{"name":"$scope.glovesImages1","image":"img/glovescolor/yellow/1.png"},"teamlogo":"","totalAmount":6800,"totalQuan":1,"designType":"gloves"}","type":"gloves","email":"wohlig@wohlig.com","date":"2017-02-06 13:54:08","mainsponserlogo":"","leftsleeve":"","rightsleeve":"","backsponser":"","teamlogo":"","rightchest":""}}', ''),
(5, 107, '', '', 'wohlig@wohlig.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2017-02-06 13:57:50', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', 0, '', '', 'image-20571486389433.png', '', '', '', '', '', '', '', '', 'gloves', '{"description":{"glovesLogo":{"divattributes":{"top":"292px","left":"302px","border":"none"},"attributes":{"width":200},"printType":"embroidered","image":"image-20571486389433.png"},"glovesArr":[{"direction":"left","quantity":1},{"direction":"left","quantity":1}],"glovesDesign":{"name":"$scope.glovesImages2","image":"img/glovescolor/red/2.png","color":"red"},"teamlogo":"image-20571486389433.png","totalAmount":8600,"totalQuan":2,"designType":"gloves"},"glovesArr":[{"direction":"left","quantity":1},{"direction":"left","quantity":1}],"glovesLogo":{"divattributes":{"top":"292px","left":"302px","border":"none"},"attributes":{"width":200},"printType":"embroidered","image":"image-20571486389433.png"},"totalQuan":2,"totalAmount":8600,"data":{"id":"7","description":"{"glovesLogo":{"divattributes":{"top":"292px","left":"302px","border":"none"},"attributes":{"width":200},"printType":"embroidered","image":"image-20571486389433.png"},"glovesArr":[{"direction":"left","quantity":1},{"direction":"left","quantity":1}],"glovesDesign":{"name":"$scope.glovesImages2","image":"img/glovescolor/red/2.png","color":"red"},"teamlogo":"image-20571486389433.png","totalAmount":8600,"totalQuan":2,"designType":"gloves"}","type":"gloves","email":"wohlig@wohlig.com","date":"2017-02-06 13:57:42","mainsponserlogo":"","leftsleeve":"","rightsleeve":"","backsponser":"","teamlogo":"image-20571486389433.png","rightchest":""}}', ''),
(6, 107, '', '', 'wohlig@wohlig.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2017-02-07 10:25:34', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', 0, '', '', '', 'img/logo_black.png', '', '', '', '', '', '', '', 'odishirt', '{"description":{"trim":{"highlightOne":{"flag":false,"tcolor":"grey","disable":"undisabled","hcolor":"#666","image":"img/odi-tshirts/trims/odi/design1/back/trim1/grey.png"},"highlightTwo":{"flag":false,"tcolor":"grey","disable":"undisabled","hcolor":"#666","image":"img/odi-tshirts/trims/odi/design1/back/trim2/grey.png"},"highlightBase":{"flag":false,"tcolor":"india_blue","disable":"undisabled","image":"img/odi-tshirts/trims/odi/base/back/india_blue.png","hcolor":"#2175d9"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":25},"divattributes":[]},"printType":"embroidered","front":false,"back":true,"cloth":"img/odi-tshirts/trims/odibase/back/india_blue.png","backdrop":"img/odi-tshirts/backdrop/odi/back.png"},"jerseyBack":[{"name":"","no":"00","font":"arial","color":"white","quantity":1,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}}],"allLogos":{"rightchest":"img/logo_black.png"},"designName":"design1","designType":"odi","totalAmount":6000,"totalQuan":1},"mainsponserlogo":"","leftsleeve":"","rightsleeve":"","backsponser":"","teamlogo":"","rightchest":"img/logo_black.png","data":{"id":"9","description":"{"trim":{"highlightOne":{"flag":false,"tcolor":"grey","disable":"undisabled","hcolor":"#666","image":"img/odi-tshirts/trims/odi/design1/back/trim1/grey.png"},"highlightTwo":{"flag":false,"tcolor":"grey","disable":"undisabled","hcolor":"#666","image":"img/odi-tshirts/trims/odi/design1/back/trim2/grey.png"},"highlightBase":{"flag":false,"tcolor":"india_blue","disable":"undisabled","image":"img/odi-tshirts/trims/odi/base/back/india_blue.png","hcolor":"#2175d9"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":25},"divattributes":[]},"printType":"embroidered","front":false,"back":true,"cloth":"img/odi-tshirts/trims/odibase/back/india_blue.png","backdrop":"img/odi-tshirts/backdrop/odi/back.png"},"jerseyBack":[{"name":"","no":"00","font":"arial","color":"white","quantity":1,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}}],"allLogos":{"rightchest":"img/logo_black.png"},"designName":"design1","designType":"odi","totalAmount":6000,"totalQuan":1}","type":"odishirt","email":"wohlig@wohlig.com","date":"2017-02-07 06:46:34","mainsponserlogo":"","leftsleeve":"","rightsleeve":"","backsponser":"","teamlogo":"","rightchest":"img/logo_black.png"}}', ''),
(7, 107, '', '', 'wohlig@wohlig.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2017-02-07 10:27:18', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', 0, '', '', 'image-772911486462701.png', 'img/logo_black.png', '', '', '', '', '', '', '', 'odishirt', '{"description":{"trim":{"highlightOne":{"flag":false,"tcolor":"royal_blue","disable":"undisabled","hcolor":"#00308f","image":"img/odi-tshirts/trims/odi/design1/back/trim1/royal_blue.png"},"highlightTwo":{"flag":false,"tcolor":"grey","disable":"undisabled","hcolor":"#666","image":"img/odi-tshirts/trims/odi/design1/back/trim2/grey.png"},"highlightBase":{"flag":false,"tcolor":"india_blue","disable":"undisabled","image":"img/odi-tshirts/trims/odi/base/back/india_blue.png","hcolor":"#2175d9"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":25},"divattributes":[]},"printType":"embroidered","front":false,"back":true,"cloth":"img/odi-tshirts/trims/odibase/back/india_blue.png","backdrop":"img/odi-tshirts/backdrop/odi/back.png","teamlogo":{"attributes":{"width":25},"divattributes":[],"image":"image-772911486462701.png","name":"Team Logo"}},"jerseyBack":[{"name":"Harsh","no":"10","font":"arial","color":"white","quantity":3,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}}],"allLogos":{"rightchest":"img/logo_black.png","teamlogo":"image-772911486462701.png"},"designName":"design1","designType":"odi","totalAmount":8000,"totalQuan":3},"mainsponserlogo":"","leftsleeve":"","rightsleeve":"","backsponser":"","teamlogo":"image-772911486462701.png","rightchest":"img/logo_black.png","data":{"id":"11","description":"{"trim":{"highlightOne":{"flag":false,"tcolor":"royal_blue","disable":"undisabled","hcolor":"#00308f","image":"img/odi-tshirts/trims/odi/design1/back/trim1/royal_blue.png"},"highlightTwo":{"flag":false,"tcolor":"grey","disable":"undisabled","hcolor":"#666","image":"img/odi-tshirts/trims/odi/design1/back/trim2/grey.png"},"highlightBase":{"flag":false,"tcolor":"india_blue","disable":"undisabled","image":"img/odi-tshirts/trims/odi/base/back/india_blue.png","hcolor":"#2175d9"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":25},"divattributes":[]},"printType":"embroidered","front":false,"back":true,"cloth":"img/odi-tshirts/trims/odibase/back/india_blue.png","backdrop":"img/odi-tshirts/backdrop/odi/back.png","teamlogo":{"attributes":{"width":25},"divattributes":[],"image":"image-772911486462701.png","name":"Team Logo"}},"jerseyBack":[{"name":"Harsh","no":"10","font":"arial","color":"white","quantity":3,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}}],"allLogos":{"rightchest":"img/logo_black.png","teamlogo":"image-772911486462701.png"},"designName":"design1","designType":"odi","totalAmount":8000,"totalQuan":3}","type":"odishirt","email":"wohlig@wohlig.com","date":"2017-02-07 10:18:43","mainsponserlogo":"","leftsleeve":"","rightsleeve":"","backsponser":"","teamlogo":"image-772911486462701.png","rightchest":"img/logo_black.png"}}', ''),
(8, 107, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2017-02-07 10:30:38', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', 0, '', '', '', 'img/logo_black.png', '', '', '', '', '', '', '', 'odishirt', '{"description":{"trim":{"highlightOne":{"flag":false,"tcolor":"white","disable":"undisabled","hcolor":"#fff","image":"img/odi-tshirts/trims/odi/design4/back/trim1/white.png"},"highlightTwo":{"flag":false,"tcolor":"dark_green","disable":"undisabled","hcolor":"#1a472a","image":"img/odi-tshirts/trims/odi/design4/back/trim2/dark_green.png"},"highlightBase":{"flag":false,"tcolor":"neon_green","disable":"undisabled","image":"img/odi-tshirts/trims/odi/base/back/neon_green.png","hcolor":"#ccff00"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":25},"divattributes":[]},"printType":"embroidered","front":false,"back":true,"cloth":"img/odi-tshirts/trims/odibase/back/neon_green.png","backdrop":"img/odi-tshirts/backdrop/odi/back.png"},"jerseyBack":[{"name":"Harsh","no":"8","font":"arial","color":"white","quantity":8,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}}],"allLogos":{"rightchest":"img/logo_black.png"},"designName":"design4","designType":"odi","totalAmount":13000,"totalQuan":8},"mainsponserlogo":"","leftsleeve":"","rightsleeve":"","backsponser":"","teamlogo":"","rightchest":"img/logo_black.png","data":{"id":"13","description":"{"trim":{"highlightOne":{"flag":false,"tcolor":"white","disable":"undisabled","hcolor":"#fff","image":"img/odi-tshirts/trims/odi/design4/back/trim1/white.png"},"highlightTwo":{"flag":false,"tcolor":"dark_green","disable":"undisabled","hcolor":"#1a472a","image":"img/odi-tshirts/trims/odi/design4/back/trim2/dark_green.png"},"highlightBase":{"flag":false,"tcolor":"neon_green","disable":"undisabled","image":"img/odi-tshirts/trims/odi/base/back/neon_green.png","hcolor":"#ccff00"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":25},"divattributes":[]},"printType":"embroidered","front":false,"back":true,"cloth":"img/odi-tshirts/trims/odibase/back/neon_green.png","backdrop":"img/odi-tshirts/backdrop/odi/back.png"},"jerseyBack":[{"name":"Harsh","no":"8","font":"arial","color":"white","quantity":8,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}}],"allLogos":{"rightchest":"img/logo_black.png"},"designName":"design4","designType":"odi","totalAmount":13000,"totalQuan":8}","type":"odishirt","email":"","date":"2017-02-07 10:30:29","mainsponserlogo":"","leftsleeve":"","rightsleeve":"","backsponser":"","teamlogo":"","rightchest":"img/logo_black.png"}}', ''),
(9, 113, '', '', 'harsh.thakkar@wohlig.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2017-02-07 10:59:00', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', 0, '', '', '', 'img/logo_black.png', '', '', '', '', '', '', '', 'odishirt', '{"description":{"trim":{"highlightOne":{"flag":false,"tcolor":"orange","disable":"undisabled","hcolor":"#ffa500","image":"img/odi-tshirts/trims/training/design4/back/trim1/orange.png"},"highlightTwo":{"flag":false,"tcolor":"white","disable":"disabled","hcolor":false,"image":"img/odi-tshirts/trims/training/design4/back/trim2/white.png"},"highlightBase":{"flag":false,"tcolor":"golden_yellow","disable":"undisabled","image":"img/odi-tshirts/trims/training/base/back/golden_yellow.png","hcolor":"#ffd700"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":25},"divattributes":[]},"printType":"embroidered","front":false,"back":true,"cloth":"img/odi-tshirts/trims/trainingbase/back/golden_yellow.png","backdrop":"img/odi-tshirts/backdrop/training/back.png"},"jerseyBack":[{"name":"Harsh","no":"07","font":"arial","color":"white","quantity":1,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":40,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}}],"allLogos":{"rightchest":"img/logo_black.png"},"designName":"design4","designType":"training","totalAmount":6000,"totalQuan":1},"mainsponserlogo":"","leftsleeve":"","rightsleeve":"","backsponser":"","teamlogo":"","rightchest":"img/logo_black.png","data":{"id":"16","description":"{"trim":{"highlightOne":{"flag":false,"tcolor":"orange","disable":"undisabled","hcolor":"#ffa500","image":"img/odi-tshirts/trims/training/design4/back/trim1/orange.png"},"highlightTwo":{"flag":false,"tcolor":"white","disable":"disabled","hcolor":false,"image":"img/odi-tshirts/trims/training/design4/back/trim2/white.png"},"highlightBase":{"flag":false,"tcolor":"golden_yellow","disable":"undisabled","image":"img/odi-tshirts/trims/training/base/back/golden_yellow.png","hcolor":"#ffd700"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":25},"divattributes":[]},"printType":"embroidered","front":false,"back":true,"cloth":"img/odi-tshirts/trims/trainingbase/back/golden_yellow.png","backdrop":"img/odi-tshirts/backdrop/training/back.png"},"jerseyBack":[{"name":"Harsh","no":"07","font":"arial","color":"white","quantity":1,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":40,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}}],"allLogos":{"rightchest":"img/logo_black.png"},"designName":"design4","designType":"training","totalAmount":6000,"totalQuan":1}","type":"odishirt","email":"harsh.thakkar@wohlig.com","date":"2017-02-07 10:58:03","mainsponserlogo":"","leftsleeve":"","rightsleeve":"","backsponser":"","teamlogo":"","rightchest":"img/logo_black.png"}}', ''),
(10, 107, '', '', 'wohlig@wohlig.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2017-02-07 11:06:02', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', 0, '', '', '', 'img/logo_black.png', '', '', '', '', '', '', '', 'odishirt', '{"description":{"trim":{"highlightOne":{"flag":false,"tcolor":"india_blue","disable":"undisabled","hcolor":"#2175d9","image":"img/odi-tshirts/trims/odi/design4/back/trim1/india_blue.png"},"highlightTwo":{"flag":false,"tcolor":"white","disable":"undisabled","hcolor":"#ffffff","image":"img/odi-tshirts/trims/odi/design4/back/trim2/white.png"},"highlightBase":{"flag":false,"tcolor":"red","disable":"undisabled","image":"img/odi-tshirts/trims/odi/base/back/red.png","hcolor":"#bf0000"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":25},"divattributes":[]},"printType":"embroidered","front":false,"back":true,"cloth":"img/odi-tshirts/trims/odibase/back/red.png","backdrop":"img/odi-tshirts/backdrop/odi/back.png"},"jerseyBack":[{"name":"Harsh","no":"8","font":"arial","color":"white","quantity":5,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}}],"allLogos":{"rightchest":"img/logo_black.png"},"designName":"design4","designType":"odi","totalAmount":10000,"totalQuan":5},"mainsponserlogo":"","leftsleeve":"","rightsleeve":"","backsponser":"","teamlogo":"","rightchest":"img/logo_black.png","data":{"id":"19","description":"{"trim":{"highlightOne":{"flag":false,"tcolor":"india_blue","disable":"undisabled","hcolor":"#2175d9","image":"img/odi-tshirts/trims/odi/design4/back/trim1/india_blue.png"},"highlightTwo":{"flag":false,"tcolor":"white","disable":"undisabled","hcolor":"#ffffff","image":"img/odi-tshirts/trims/odi/design4/back/trim2/white.png"},"highlightBase":{"flag":false,"tcolor":"red","disable":"undisabled","image":"img/odi-tshirts/trims/odi/base/back/red.png","hcolor":"#bf0000"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":25},"divattributes":[]},"printType":"embroidered","front":false,"back":true,"cloth":"img/odi-tshirts/trims/odibase/back/red.png","backdrop":"img/odi-tshirts/backdrop/odi/back.png"},"jerseyBack":[{"name":"Harsh","no":"8","font":"arial","color":"white","quantity":5,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}}],"allLogos":{"rightchest":"img/logo_black.png"},"designName":"design4","designType":"odi","totalAmount":10000,"totalQuan":5}","type":"odishirt","email":"wohlig@wohlig.com","date":"2017-02-07 11:05:53","mainsponserlogo":"","leftsleeve":"","rightsleeve":"","backsponser":"","teamlogo":"","rightchest":"img/logo_black.png"}}', ''),
(11, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2017-02-07 11:07:20', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', 0, '', '', 'image-568301486465333.png', 'img/logo_black.png', 'image-901681486465351.png', 'image-43901486465363.png', 'image-402991486465374.png', 'image-904291486465398.png', '', '', '', 'odishirt', '{"description":{"trim":{"highlightOne":{"flag":false,"tcolor":"neon_orange","disable":"undisabled","hcolor":"#f07f13","image":"img/odi-tshirts/trims/training/design1/back/trim1/neon_orange.png"},"highlightTwo":{"flag":false,"tcolor":"black","disable":"disabled","hcolor":false,"image":"img/odi-tshirts/trims/training/design1/back/trim2/black.png"},"highlightBase":{"flag":false,"tcolor":"white","disable":"undisabled","image":"img/odi-tshirts/trims/training/base/back/white.png","hcolor":"#ffffff"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":25},"divattributes":[]},"printType":"sublimated","front":false,"back":true,"cloth":"img/odi-tshirts/trims/trainingbase/back/white.png","backdrop":"img/odi-tshirts/backdrop/training/back.png","teamlogo":{"attributes":{"width":55},"divattributes":{"border":"none"},"image":"image-568301486465333.png","name":"Team Logo"},"mainlogo":{"attributes":{"width":109},"divattributes":{"border":"none"},"image":"image-901681486465351.png","name":"Main Sponsor"},"leftsleeve":{"attributes":{"width":63},"divattributes":{"border":"none"},"image":"image-43901486465363.png","name":"Left Sleeve"},"rightsleeve":{"attributes":{"width":81},"divattributes":{"border":"none"},"image":"image-402991486465374.png","name":"Right Sleeve"},"backlogo":{"attributes":{"width":133},"divattributes":{"border":"none"},"image":"image-904291486465398.png","name":"Back Logo"}},"jerseyBack":[{"name":"Immabeshah","no":"06","font":"arial","color":"white","quantity":2,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":25,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":78,"border":"none","rotate":0,"letterSpacing":3}}}],"allLogos":{"mainlogo":"image-901681486465351.png","rightchest":"img/logo_black.png","leftsleeve":"image-43901486465363.png","rightsleeve":"image-402991486465374.png","teamlogo":"image-568301486465333.png","backlogo":"image-904291486465398.png"},"designName":"design1","designType":"training","totalAmount":6700,"totalQuan":2},"mainsponserlogo":"image-901681486465351.png","leftsleeve":"image-43901486465363.png","rightsleeve":"image-402991486465374.png","backsponser":"image-904291486465398.png","teamlogo":"image-568301486465333.png","rightchest":"img/logo_black.png","data":{"id":"18","description":"{"trim":{"highlightOne":{"flag":false,"tcolor":"neon_orange","disable":"undisabled","hcolor":"#f07f13","image":"img/odi-tshirts/trims/training/design1/back/trim1/neon_orange.png"},"highlightTwo":{"flag":false,"tcolor":"black","disable":"disabled","hcolor":false,"image":"img/odi-tshirts/trims/training/design1/back/trim2/black.png"},"highlightBase":{"flag":false,"tcolor":"white","disable":"undisabled","image":"img/odi-tshirts/trims/training/base/back/white.png","hcolor":"#ffffff"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":25},"divattributes":[]},"printType":"sublimated","front":false,"back":true,"cloth":"img/odi-tshirts/trims/trainingbase/back/white.png","backdrop":"img/odi-tshirts/backdrop/training/back.png","teamlogo":{"attributes":{"width":55},"divattributes":{"border":"none"},"image":"image-568301486465333.png","name":"Team Logo"},"mainlogo":{"attributes":{"width":109},"divattributes":{"border":"none"},"image":"image-901681486465351.png","name":"Main Sponsor"},"leftsleeve":{"attributes":{"width":63},"divattributes":{"border":"none"},"image":"image-43901486465363.png","name":"Left Sleeve"},"rightsleeve":{"attributes":{"width":81},"divattributes":{"border":"none"},"image":"image-402991486465374.png","name":"Right Sleeve"},"backlogo":{"attributes":{"width":133},"divattributes":{"border":"none"},"image":"image-904291486465398.png","name":"Back Logo"}},"jerseyBack":[{"name":"Immabeshah","no":"06","font":"arial","color":"white","quantity":2,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":25,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":78,"border":"none","rotate":0,"letterSpacing":3}}}],"allLogos":{"mainlogo":"image-901681486465351.png","rightchest":"img/logo_black.png","leftsleeve":"image-43901486465363.png","rightsleeve":"image-402991486465374.png","teamlogo":"image-568301486465333.png","backlogo":"image-904291486465398.png"},"designName":"design1","designType":"training","totalAmount":6700,"totalQuan":2}","type":"odishirt","email":"","date":"2017-02-07 11:04:38","mainsponserlogo":"image-901681486465351.png","leftsleeve":"image-43901486465363.png","rightsleeve":"image-402991486465374.png","backsponser":"image-904291486465398.png","teamlogo":"image-568301486465333.png","rightchest":"img/logo_black.png"}}', ''),
(12, 114, '', '', 'imran@kathiwadagroup.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2017-02-07 11:20:29', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', 0, '', '', '', 'img/logo_black.png', 'image-475811486466248.jpg', '', '', '', '', '', '', 'odishirt', '{"description":{"trim":{"highlightOne":{"flag":false,"tcolor":"royal_blue","disable":"undisabled","hcolor":"#00308f","image":"img/odi-tshirts/trims/odi/design4/back/trim1/royal_blue.png"},"highlightTwo":{"flag":false,"tcolor":"golden_yellow","disable":"undisabled","hcolor":"#ffd700","image":"img/odi-tshirts/trims/odi/design4/back/trim2/golden_yellow.png"},"highlightBase":{"flag":false,"tcolor":"maroon","disable":"undisabled","image":"img/odi-tshirts/trims/odi/base/back/maroon.png","hcolor":"#800000"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":25},"divattributes":[]},"printType":"embroidered","front":false,"back":true,"cloth":"img/odi-tshirts/trims/odibase/back/maroon.png","backdrop":"img/odi-tshirts/backdrop/odi/back.png","mainlogo":{"attributes":{"width":95},"divattributes":{"border":"none"},"image":"image-475811486466248.jpg","name":"Main Sponsor"}},"jerseyBack":[{"name":"QQQQ","no":"07","font":"arial","color":"white","quantity":2,"size":"M","sleeve":"long","attributes":{"name":{"fontSize":44,"border":"none","rotate":0,"letterSpacing":4},"number":{"fontSize":59,"border":"none","rotate":0,"letterSpacing":5}}},{"name":"","no":"00","font":"helvetica","color":"white","quantity":4,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1},"border":"none"}}],"allLogos":{"mainlogo":"image-475811486466248.jpg","rightchest":"img/logo_black.png"},"designName":"design4","designType":"odi","totalAmount":11000,"totalQuan":6},"mainsponserlogo":"image-475811486466248.jpg","leftsleeve":"","rightsleeve":"","backsponser":"","teamlogo":"","rightchest":"img/logo_black.png","data":{"id":"20","description":"{"trim":{"highlightOne":{"flag":false,"tcolor":"royal_blue","disable":"undisabled","hcolor":"#00308f","image":"img/odi-tshirts/trims/odi/design4/back/trim1/royal_blue.png"},"highlightTwo":{"flag":false,"tcolor":"golden_yellow","disable":"undisabled","hcolor":"#ffd700","image":"img/odi-tshirts/trims/odi/design4/back/trim2/golden_yellow.png"},"highlightBase":{"flag":false,"tcolor":"maroon","disable":"undisabled","image":"img/odi-tshirts/trims/odi/base/back/maroon.png","hcolor":"#800000"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":25},"divattributes":[]},"printType":"embroidered","front":false,"back":true,"cloth":"img/odi-tshirts/trims/odibase/back/maroon.png","backdrop":"img/odi-tshirts/backdrop/odi/back.png","mainlogo":{"attributes":{"width":95},"divattributes":{"border":"none"},"image":"image-475811486466248.jpg","name":"Main Sponsor"}},"jerseyBack":[{"name":"QQQQ","no":"07","font":"arial","color":"white","quantity":2,"size":"M","sleeve":"long","attributes":{"name":{"fontSize":44,"border":"none","rotate":0,"letterSpacing":4},"number":{"fontSize":59,"border":"none","rotate":0,"letterSpacing":5}}},{"name":"","no":"00","font":"helvetica","color":"white","quantity":4,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1},"border":"none"}}],"allLogos":{"mainlogo":"image-475811486466248.jpg","rightchest":"img/logo_black.png"},"designName":"design4","designType":"odi","totalAmount":11000,"totalQuan":6}","type":"odishirt","email":"imran@kathiwadagroup.com","date":"2017-02-07 11:19:59","mainsponserlogo":"image-475811486466248.jpg","leftsleeve":"","rightsleeve":"","backsponser":"","teamlogo":"","rightchest":"img/logo_black.png"}}', ''),
(13, 114, '', '', 'imran@kathiwadagroup.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2017-02-07 11:22:52', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', 0, '', '', '', 'img/logo_black.png', '', '', '', '', '', '', '', 'odishirt', '{"description":{"trim":{"highlightOne":{"flag":false,"tcolor":"grey","disable":"undisabled","hcolor":"#666","image":"img/odi-tshirts/trims/odi/design1/back/trim1/grey.png"},"highlightTwo":{"flag":false,"tcolor":"grey","disable":"undisabled","hcolor":"#666","image":"img/odi-tshirts/trims/odi/design1/back/trim2/grey.png"},"highlightBase":{"flag":false,"tcolor":"india_blue","disable":"undisabled","image":"img/odi-tshirts/trims/odi/base/back/india_blue.png","hcolor":"#2175d9"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":25},"divattributes":[]},"printType":"embroidered","front":false,"back":true,"cloth":"img/odi-tshirts/trims/odibase/back/india_blue.png","backdrop":"img/odi-tshirts/backdrop/odi/back.png"},"jerseyBack":[{"name":"","no":"00","font":"arial","color":"white","quantity":1,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}}],"allLogos":{"rightchest":"img/logo_black.png"},"designName":"design1","designType":"odi","totalAmount":6000,"totalQuan":1},"mainsponserlogo":"","leftsleeve":"","rightsleeve":"","backsponser":"","teamlogo":"","rightchest":"img/logo_black.png","data":{"id":"22","description":"{"trim":{"highlightOne":{"flag":false,"tcolor":"grey","disable":"undisabled","hcolor":"#666","image":"img/odi-tshirts/trims/odi/design1/back/trim1/grey.png"},"highlightTwo":{"flag":false,"tcolor":"grey","disable":"undisabled","hcolor":"#666","image":"img/odi-tshirts/trims/odi/design1/back/trim2/grey.png"},"highlightBase":{"flag":false,"tcolor":"india_blue","disable":"undisabled","image":"img/odi-tshirts/trims/odi/base/back/india_blue.png","hcolor":"#2175d9"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":25},"divattributes":[]},"printType":"embroidered","front":false,"back":true,"cloth":"img/odi-tshirts/trims/odibase/back/india_blue.png","backdrop":"img/odi-tshirts/backdrop/odi/back.png"},"jerseyBack":[{"name":"","no":"00","font":"arial","color":"white","quantity":1,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}}],"allLogos":{"rightchest":"img/logo_black.png"},"designName":"design1","designType":"odi","totalAmount":6000,"totalQuan":1}","type":"odishirt","email":"imran@kathiwadagroup.com","date":"2017-02-07 11:21:48","mainsponserlogo":"","leftsleeve":"","rightsleeve":"","backsponser":"","teamlogo":"","rightchest":"img/logo_black.png"}}', ''),
(14, 115, '', '', 'chirag@chirag.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2017-02-07 11:22:57', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', 0, '', '', 'image-209611486466445.png', 'img/logo_black.png', '', '', '', '', '', '', '', 'odishirt', '{"description":{"trim":{"highlightOne":{"flag":false,"tcolor":"india_blue","disable":"undisabled","hcolor":"#2175d9","image":"img/odi-tshirts/trims/training/design2/back/trim1/india_blue.png"},"highlightTwo":{"flag":false,"tcolor":"white","disable":"disabled","hcolor":false,"image":"img/odi-tshirts/trims/training/design2/back/trim2/white.png"},"highlightBase":{"flag":false,"tcolor":"red","disable":"undisabled","image":"img/odi-tshirts/trims/training/base/back/red.png","hcolor":"#bf0000"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":25},"divattributes":[]},"printType":"embroidered","front":false,"back":true,"cloth":"img/odi-tshirts/trims/trainingbase/back/red.png","backdrop":"img/odi-tshirts/backdrop/training/back.png","teamlogo":{"attributes":{"width":65},"divattributes":{"border":"none"},"image":"image-209611486466445.png","name":"Team Logo"}},"jerseyBack":[{"name":"harsh","no":"10","font":"arial","color":"white","quantity":5,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}}],"allLogos":{"rightchest":"img/logo_black.png","teamlogo":"image-209611486466445.png"},"designName":"design2","designType":"training","totalAmount":9250,"totalQuan":5},"mainsponserlogo":"","leftsleeve":"","rightsleeve":"","backsponser":"","teamlogo":"image-209611486466445.png","rightchest":"img/logo_black.png","data":{"id":"21","description":"{"trim":{"highlightOne":{"flag":false,"tcolor":"india_blue","disable":"undisabled","hcolor":"#2175d9","image":"img/odi-tshirts/trims/training/design2/back/trim1/india_blue.png"},"highlightTwo":{"flag":false,"tcolor":"white","disable":"disabled","hcolor":false,"image":"img/odi-tshirts/trims/training/design2/back/trim2/white.png"},"highlightBase":{"flag":false,"tcolor":"red","disable":"undisabled","image":"img/odi-tshirts/trims/training/base/back/red.png","hcolor":"#bf0000"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":25},"divattributes":[]},"printType":"embroidered","front":false,"back":true,"cloth":"img/odi-tshirts/trims/trainingbase/back/red.png","backdrop":"img/odi-tshirts/backdrop/training/back.png","teamlogo":{"attributes":{"width":65},"divattributes":{"border":"none"},"image":"image-209611486466445.png","name":"Team Logo"}},"jerseyBack":[{"name":"harsh","no":"10","font":"arial","color":"white","quantity":5,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}}],"allLogos":{"rightchest":"img/logo_black.png","teamlogo":"image-209611486466445.png"},"designName":"design2","designType":"training","totalAmount":9250,"totalQuan":5}","type":"odishirt","email":"chirag@chirag.com","date":"2017-02-07 11:21:42","mainsponserlogo":"","leftsleeve":"","rightsleeve":"","backsponser":"","teamlogo":"image-209611486466445.png","rightchest":"img/logo_black.png"}}', ''),
(15, 107, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2017-02-07 11:23:15', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', 0, '', '', '', 'img/logo_black.png', '', '', '', '', '', '', '', 'odishirt', '{"description":{"trim":{"highlightOne":{"flag":false,"tcolor":"royal_blue","disable":"undisabled","hcolor":"#00308f","image":"img/odi-tshirts/trims/odi/design3/back/trim1/royal_blue.png"},"highlightTwo":{"flag":false,"tcolor":"white","disable":"undisabled","hcolor":"#ffffff","image":"img/odi-tshirts/trims/odi/design3/back/trim2/white.png"},"highlightBase":{"flag":false,"tcolor":"orange","disable":"undisabled","image":"img/odi-tshirts/trims/odi/base/back/orange.png","hcolor":"#ffa500"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":25},"divattributes":[]},"printType":"embroidered","front":false,"back":true,"cloth":"img/odi-tshirts/trims/odibase/back/orange.png","backdrop":"img/odi-tshirts/backdrop/odi/back.png"},"jerseyBack":[{"name":"","no":"00","font":"arial","color":"white","quantity":1,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}}],"allLogos":{"rightchest":"img/logo_black.png"},"designName":"design3","designType":"odi","totalAmount":6000,"totalQuan":1},"mainsponserlogo":"","leftsleeve":"","rightsleeve":"","backsponser":"","teamlogo":"","rightchest":"img/logo_black.png","data":{"id":"23","description":"{"trim":{"highlightOne":{"flag":false,"tcolor":"royal_blue","disable":"undisabled","hcolor":"#00308f","image":"img/odi-tshirts/trims/odi/design3/back/trim1/royal_blue.png"},"highlightTwo":{"flag":false,"tcolor":"white","disable":"undisabled","hcolor":"#ffffff","image":"img/odi-tshirts/trims/odi/design3/back/trim2/white.png"},"highlightBase":{"flag":false,"tcolor":"orange","disable":"undisabled","image":"img/odi-tshirts/trims/odi/base/back/orange.png","hcolor":"#ffa500"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":25},"divattributes":[]},"printType":"embroidered","front":false,"back":true,"cloth":"img/odi-tshirts/trims/odibase/back/orange.png","backdrop":"img/odi-tshirts/backdrop/odi/back.png"},"jerseyBack":[{"name":"","no":"00","font":"arial","color":"white","quantity":1,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}}],"allLogos":{"rightchest":"img/logo_black.png"},"designName":"design3","designType":"odi","totalAmount":6000,"totalQuan":1}","type":"odishirt","email":"","date":"2017-02-07 11:23:11","mainsponserlogo":"","leftsleeve":"","rightsleeve":"","backsponser":"","teamlogo":"","rightchest":"img/logo_black.png"}}', ''),
(16, 114, '', '', 'imran@kathiwadagroup.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2017-02-07 12:02:04', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', 0, '', '', '', 'img/logo_black.png', '', '', '', '', '', '', '', 'odishirt', '{"description":{"trim":{"highlightOne":{"flag":false,"tcolor":"grey","disable":"undisabled","hcolor":"#666","image":"img/odi-tshirts/trims/odi/design1/back/trim1/grey.png"},"highlightTwo":{"flag":false,"tcolor":"grey","disable":"undisabled","hcolor":"#666","image":"img/odi-tshirts/trims/odi/design1/back/trim2/grey.png"},"highlightBase":{"flag":false,"tcolor":"india_blue","disable":"undisabled","image":"img/odi-tshirts/trims/odi/base/back/india_blue.png","hcolor":"#2175d9"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":25},"divattributes":[]},"printType":"embroidered","front":false,"back":true,"cloth":"img/odi-tshirts/trims/odibase/back/india_blue.png","backdrop":"img/odi-tshirts/backdrop/odi/back.png"},"jerseyBack":[{"name":"","no":"00","font":"arial","color":"white","quantity":1,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}},{"name":"","no":"00","font":"arial","color":"white","quantity":1,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}},{"name":"","no":"00","font":"arial","color":"white","quantity":1,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}},{"name":"","no":"00","font":"arial","color":"white","quantity":1,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}},{"name":"","no":"00","font":"arial","color":"white","quantity":1,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}},{"name":"","no":"00","font":"arial","color":"white","size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}}],"allLogos":{"rightchest":"img/logo_black.png"},"designName":"design1","designType":"odi","totalAmount":0,"totalQuan":null},"mainsponserlogo":"","leftsleeve":"","rightsleeve":"","backsponser":"","teamlogo":"","rightchest":"img/logo_black.png","data":{"id":"25","description":"{"trim":{"highlightOne":{"flag":false,"tcolor":"grey","disable":"undisabled","hcolor":"#666","image":"img/odi-tshirts/trims/odi/design1/back/trim1/grey.png"},"highlightTwo":{"flag":false,"tcolor":"grey","disable":"undisabled","hcolor":"#666","image":"img/odi-tshirts/trims/odi/design1/back/trim2/grey.png"},"highlightBase":{"flag":false,"tcolor":"india_blue","disable":"undisabled","image":"img/odi-tshirts/trims/odi/base/back/india_blue.png","hcolor":"#2175d9"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":25},"divattributes":[]},"printType":"embroidered","front":false,"back":true,"cloth":"img/odi-tshirts/trims/odibase/back/india_blue.png","backdrop":"img/odi-tshirts/backdrop/odi/back.png"},"jerseyBack":[{"name":"","no":"00","font":"arial","color":"white","quantity":1,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}},{"name":"","no":"00","font":"arial","color":"white","quantity":1,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}},{"name":"","no":"00","font":"arial","color":"white","quantity":1,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}},{"name":"","no":"00","font":"arial","color":"white","quantity":1,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}},{"name":"","no":"00","font":"arial","color":"white","quantity":1,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}},{"name":"","no":"00","font":"arial","color":"white","size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}}],"allLogos":{"rightchest":"img/logo_black.png"},"designName":"design1","designType":"odi","totalAmount":0,"totalQuan":null}","type":"odishirt","email":"imran@kathiwadagroup.com","date":"2017-02-07 12:00:31","mainsponserlogo":"","leftsleeve":"","rightsleeve":"","backsponser":"","teamlogo":"","rightchest":"img/logo_black.png"}}', '');
INSERT INTO `customorder` (`id`, `user`, `firstname`, `lastname`, `email`, `billingaddress`, `billingcontact`, `billingcity`, `billingstate`, `billingpincode`, `billingcountry`, `shippingcity`, `shippingaddress`, `shippingname`, `shippingcountry`, `shippingcontact`, `shippingstate`, `shippingpincode`, `trackingcode`, `defaultcurrency`, `shippingmethod`, `orderstatus`, `timestamp`, `billingline1`, `billingline2`, `billingline3`, `shippingline1`, `shippingline2`, `shippingline3`, `transactionid`, `paymentmode`, `finalamount`, `totalamount`, `discountamount`, `shippingamount`, `currency`, `payemail`, `paytype`, `payresponse`, `type`, `backimage`, `frontimage`, `teamlogo`, `rightlogo`, `mainsponserlogo`, `leftsleeve`, `rightsleeve`, `backsponser`, `font`, `fontcolor`, `printingtype`, `customtype`, `description`, `note`) VALUES
(17, 114, '', '', 'imran@kathiwadagroup.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2017-02-07 12:02:34', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', 0, '', '', '', 'img/logo_black.png', 'image-475811486466248.jpg', '', '', '', '', '', '', 'odishirt', '{"description":{"trim":{"highlightOne":{"flag":false,"tcolor":"royal_blue","disable":"undisabled","hcolor":"#00308f","image":"img/odi-tshirts/trims/odi/design4/back/trim1/royal_blue.png"},"highlightTwo":{"flag":false,"tcolor":"golden_yellow","disable":"undisabled","hcolor":"#ffd700","image":"img/odi-tshirts/trims/odi/design4/back/trim2/golden_yellow.png"},"highlightBase":{"flag":false,"tcolor":"maroon","disable":"undisabled","image":"img/odi-tshirts/trims/odi/base/back/maroon.png","hcolor":"#800000"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":25},"divattributes":[]},"printType":"embroidered","front":false,"back":true,"cloth":"img/odi-tshirts/trims/odibase/back/maroon.png","backdrop":"img/odi-tshirts/backdrop/odi/back.png","mainlogo":{"attributes":{"width":95},"divattributes":{"border":"none"},"image":"image-475811486466248.jpg","name":"Main Sponsor"}},"jerseyBack":[{"name":"QQQQ","no":"07","font":"arial","color":"white","quantity":2,"size":"M","sleeve":"long","attributes":{"name":{"fontSize":44,"border":"none","rotate":0,"letterSpacing":4},"number":{"fontSize":59,"border":"none","rotate":0,"letterSpacing":5}}},{"name":"","no":"00","font":"helvetica","color":"white","quantity":4,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1},"border":"none"}}],"allLogos":{"mainlogo":"image-475811486466248.jpg","rightchest":"img/logo_black.png"},"designName":"design4","designType":"odi","totalAmount":11000,"totalQuan":6},"mainsponserlogo":"image-475811486466248.jpg","leftsleeve":"","rightsleeve":"","backsponser":"","teamlogo":"","rightchest":"img/logo_black.png","data":{"id":"20","description":"{"trim":{"highlightOne":{"flag":false,"tcolor":"royal_blue","disable":"undisabled","hcolor":"#00308f","image":"img/odi-tshirts/trims/odi/design4/back/trim1/royal_blue.png"},"highlightTwo":{"flag":false,"tcolor":"golden_yellow","disable":"undisabled","hcolor":"#ffd700","image":"img/odi-tshirts/trims/odi/design4/back/trim2/golden_yellow.png"},"highlightBase":{"flag":false,"tcolor":"maroon","disable":"undisabled","image":"img/odi-tshirts/trims/odi/base/back/maroon.png","hcolor":"#800000"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":25},"divattributes":[]},"printType":"embroidered","front":false,"back":true,"cloth":"img/odi-tshirts/trims/odibase/back/maroon.png","backdrop":"img/odi-tshirts/backdrop/odi/back.png","mainlogo":{"attributes":{"width":95},"divattributes":{"border":"none"},"image":"image-475811486466248.jpg","name":"Main Sponsor"}},"jerseyBack":[{"name":"QQQQ","no":"07","font":"arial","color":"white","quantity":2,"size":"M","sleeve":"long","attributes":{"name":{"fontSize":44,"border":"none","rotate":0,"letterSpacing":4},"number":{"fontSize":59,"border":"none","rotate":0,"letterSpacing":5}}},{"name":"","no":"00","font":"helvetica","color":"white","quantity":4,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1},"border":"none"}}],"allLogos":{"mainlogo":"image-475811486466248.jpg","rightchest":"img/logo_black.png"},"designName":"design4","designType":"odi","totalAmount":11000,"totalQuan":6}","type":"odishirt","email":"imran@kathiwadagroup.com","date":"2017-02-07 11:19:59","mainsponserlogo":"image-475811486466248.jpg","leftsleeve":"","rightsleeve":"","backsponser":"","teamlogo":"","rightchest":"img/logo_black.png"}}', ''),
(18, 113, '', '', 'harsh.thakkar@wohlig.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2017-02-07 12:40:09', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', 'pads', '{"description":{"padLogo":{"divattributes":{"top":"386px","left":"278px"},"attributes":{"width":50},"printType":"embroidered"},"padsArr":[{"direction":"left","quantity":1}],"padsDesign":{"name":"$scope.padImages1","image":"img/padscolor/updated/yellow/1.png"},"teamlogo":"","totalAmount":7750,"totalQuan":1,"designType":"pads"},"padsArr":[{"direction":"left","quantity":1}],"padLogo":{"divattributes":{"top":"386px","left":"278px"},"attributes":{"width":50},"printType":"embroidered"},"totalQuan":1,"totalAmount":7750,"data":{"id":"26","description":"{"padLogo":{"divattributes":{"top":"386px","left":"278px"},"attributes":{"width":50},"printType":"embroidered"},"padsArr":[{"direction":"left","quantity":1}],"padsDesign":{"name":"$scope.padImages1","image":"img/padscolor/updated/yellow/1.png"},"teamlogo":"","totalAmount":7750,"totalQuan":1,"designType":"pads"}","type":"pads","email":"harsh.thakkar@wohlig.com","date":"2017-02-07 12:19:37","mainsponserlogo":"","leftsleeve":"","rightsleeve":"","backsponser":"","teamlogo":"","rightchest":""}}', ''),
(19, 113, '', '', 'harsh.thakkar@wohlig.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2017-02-07 12:42:17', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', 0, '', '', 'image-500631486471314.png', '', '', '', '', '', '', '', '', 'pads', '{"description":{"padLogo":{"divattributes":{"top":"399px","left":"295px"},"attributes":{"width":50},"printType":"embroidered","image":"image-500631486471314.png"},"padsArr":[{"direction":"right","quantity":10}],"padsDesign":{"name":"$scope.padImages2","image":"img/padscolor/updated/pink/2.png","color":"pink"},"teamlogo":"image-500631486471314.png","totalAmount":32500,"totalQuan":10,"designType":"pads"},"padsArr":[{"direction":"right","quantity":10}],"padLogo":{"divattributes":{"top":"399px","left":"295px"},"attributes":{"width":50},"printType":"embroidered","image":"image-500631486471314.png"},"totalQuan":10,"totalAmount":32500,"data":{"id":"27","description":"{"padLogo":{"divattributes":{"top":"399px","left":"295px"},"attributes":{"width":50},"printType":"embroidered","image":"image-500631486471314.png"},"padsArr":[{"direction":"right","quantity":10}],"padsDesign":{"name":"$scope.padImages2","image":"img/padscolor/updated/pink/2.png","color":"pink"},"teamlogo":"image-500631486471314.png","totalAmount":32500,"totalQuan":10,"designType":"pads"}","type":"pads","email":"harsh.thakkar@wohlig.com","date":"2017-02-07 12:42:11","mainsponserlogo":"","leftsleeve":"","rightsleeve":"","backsponser":"","teamlogo":"image-500631486471314.png","rightchest":""}}', ''),
(20, 113, '', '', 'harsh.thakkar@wohlig.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2017-02-07 13:18:38', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', 0, '', '', 'image-959921486473479.jpg', '', '', '', '', '', '', '', '', 'pads', '{"description":{"padLogo":{"divattributes":{"top":"386px","left":"278px"},"attributes":{"width":50},"printType":"embroidered","image":"image-959921486473479.jpg"},"padsArr":[{"direction":"left","quantity":1},{"direction":"left","quantity":1},{"direction":"left","quantity":1}],"padsDesign":{"name":"$scope.padImages1","image":"img/padscolor/updated/nblue/1.png","color":"nblue"},"teamlogo":"image-959921486473479.jpg","totalAmount":13250,"totalQuan":3,"designType":"pads"},"padsArr":[{"direction":"left","quantity":1},{"direction":"left","quantity":1},{"direction":"left","quantity":1}],"padLogo":{"divattributes":{"top":"386px","left":"278px"},"attributes":{"width":50},"printType":"embroidered","image":"image-959921486473479.jpg"},"totalQuan":3,"totalAmount":13250,"data":{"id":"28","description":"{"padLogo":{"divattributes":{"top":"386px","left":"278px"},"attributes":{"width":50},"printType":"embroidered","image":"image-959921486473479.jpg"},"padsArr":[{"direction":"left","quantity":1},{"direction":"left","quantity":1},{"direction":"left","quantity":1}],"padsDesign":{"name":"$scope.padImages1","image":"img/padscolor/updated/nblue/1.png","color":"nblue"},"teamlogo":"image-959921486473479.jpg","totalAmount":13250,"totalQuan":3,"designType":"pads"}","type":"pads","email":"harsh.thakkar@wohlig.com","date":"2017-02-07 13:18:25","mainsponserlogo":"","leftsleeve":"","rightsleeve":"","backsponser":"","teamlogo":"image-959921486473479.jpg","rightchest":""}}', ''),
(21, 114, '', '', 'imran@kathiwadagroup.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2017-02-08 10:09:33', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', 0, '', '', 'image-305991486548049.jpg', 'img/logo_black.png', '', '', '', '', '', '', '', 'odishirt', '{"description":{"trim":{"highlightOne":{"flag":false,"tcolor":"grey","disable":"undisabled","hcolor":"#666","image":"img/odi-tshirts/trims/odi/design1/back/trim1/grey.png"},"highlightTwo":{"flag":false,"tcolor":"grey","disable":"undisabled","hcolor":"#666","image":"img/odi-tshirts/trims/odi/design1/back/trim2/grey.png"},"highlightBase":{"flag":false,"tcolor":"india_blue","disable":"undisabled","image":"img/odi-tshirts/trims/odi/base/back/india_blue.png","hcolor":"#2175d9"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":25},"divattributes":[]},"printType":"embroidered","front":false,"back":true,"cloth":"img/odi-tshirts/trims/odibase/back/india_blue.png","backdrop":"img/odi-tshirts/backdrop/odi/back.png","teamlogo":{"attributes":{"width":10},"divattributes":{"border":"none"},"image":"image-305991486548049.jpg","name":"Team Logo"}},"jerseyBack":[{"name":"","no":"00","font":"arial","color":"white","quantity":1,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}},{"name":"","no":"00","font":"arial","color":"white","quantity":1,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}},{"name":"","no":"00","font":"arial","color":"white","quantity":1,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}},{"name":"","no":"00","font":"arial","color":"white","quantity":1,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}},{"name":"","no":"00","font":"arial","color":"white","size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}}],"allLogos":{"rightchest":"img/logo_black.png","teamlogo":"image-305991486548049.jpg"},"designName":"design1","designType":"odi","totalAmount":0,"totalQuan":null},"mainsponserlogo":"","leftsleeve":"","rightsleeve":"","backsponser":"","teamlogo":"image-305991486548049.jpg","rightchest":"img/logo_black.png","data":{"id":"29","description":"{"trim":{"highlightOne":{"flag":false,"tcolor":"grey","disable":"undisabled","hcolor":"#666","image":"img/odi-tshirts/trims/odi/design1/back/trim1/grey.png"},"highlightTwo":{"flag":false,"tcolor":"grey","disable":"undisabled","hcolor":"#666","image":"img/odi-tshirts/trims/odi/design1/back/trim2/grey.png"},"highlightBase":{"flag":false,"tcolor":"india_blue","disable":"undisabled","image":"img/odi-tshirts/trims/odi/base/back/india_blue.png","hcolor":"#2175d9"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":25},"divattributes":[]},"printType":"embroidered","front":false,"back":true,"cloth":"img/odi-tshirts/trims/odibase/back/india_blue.png","backdrop":"img/odi-tshirts/backdrop/odi/back.png","teamlogo":{"attributes":{"width":10},"divattributes":{"border":"none"},"image":"image-305991486548049.jpg","name":"Team Logo"}},"jerseyBack":[{"name":"","no":"00","font":"arial","color":"white","quantity":1,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}},{"name":"","no":"00","font":"arial","color":"white","quantity":1,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}},{"name":"","no":"00","font":"arial","color":"white","quantity":1,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}},{"name":"","no":"00","font":"arial","color":"white","quantity":1,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}},{"name":"","no":"00","font":"arial","color":"white","size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}}],"allLogos":{"rightchest":"img/logo_black.png","teamlogo":"image-305991486548049.jpg"},"designName":"design1","designType":"odi","totalAmount":0,"totalQuan":null}","type":"odishirt","email":"imran@kathiwadagroup.com","date":"2017-02-08 10:07:20","mainsponserlogo":"","leftsleeve":"","rightsleeve":"","backsponser":"","teamlogo":"image-305991486548049.jpg","rightchest":"img/logo_black.png"}}', ''),
(22, 56, '', '', 'dkathiwada@gmail.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2017-02-08 13:21:13', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', 0, '', '', '', 'img/logo_black.png', '', '', '', '', '', '', '', 'odishirt', '{"description":{"trim":{"highlightOne":{"flag":false,"tcolor":"grey","disable":"undisabled","hcolor":"#666","image":"img/odi-tshirts/trims/odi/design1/back/trim1/grey.png"},"highlightTwo":{"flag":false,"tcolor":"grey","disable":"undisabled","hcolor":"#666","image":"img/odi-tshirts/trims/odi/design1/back/trim2/grey.png"},"highlightBase":{"flag":false,"tcolor":"india_blue","disable":"undisabled","image":"img/odi-tshirts/trims/odi/base/back/india_blue.png","hcolor":"#2175d9"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":25},"divattributes":[]},"printType":"embroidered","front":false,"back":true,"cloth":"img/odi-tshirts/trims/odibase/back/india_blue.png","backdrop":"img/odi-tshirts/backdrop/odi/back.png"},"jerseyBack":[{"name":"","no":"00","font":"arial","color":"white","quantity":1,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}}],"allLogos":{"rightchest":"img/logo_black.png"},"designName":"design1","designType":"odi","totalAmount":6000,"totalQuan":1},"mainsponserlogo":"","leftsleeve":"","rightsleeve":"","backsponser":"","teamlogo":"","rightchest":"img/logo_black.png","data":{"id":"31","description":"{"trim":{"highlightOne":{"flag":false,"tcolor":"grey","disable":"undisabled","hcolor":"#666","image":"img/odi-tshirts/trims/odi/design1/back/trim1/grey.png"},"highlightTwo":{"flag":false,"tcolor":"grey","disable":"undisabled","hcolor":"#666","image":"img/odi-tshirts/trims/odi/design1/back/trim2/grey.png"},"highlightBase":{"flag":false,"tcolor":"india_blue","disable":"undisabled","image":"img/odi-tshirts/trims/odi/base/back/india_blue.png","hcolor":"#2175d9"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":25},"divattributes":[]},"printType":"embroidered","front":false,"back":true,"cloth":"img/odi-tshirts/trims/odibase/back/india_blue.png","backdrop":"img/odi-tshirts/backdrop/odi/back.png"},"jerseyBack":[{"name":"","no":"00","font":"arial","color":"white","quantity":1,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}}],"allLogos":{"rightchest":"img/logo_black.png"},"designName":"design1","designType":"odi","totalAmount":6000,"totalQuan":1}","type":"odishirt","email":"dkathiwada@gmail.com","date":"2017-02-08 13:20:43","mainsponserlogo":"","leftsleeve":"","rightsleeve":"","backsponser":"","teamlogo":"","rightchest":"img/logo_black.png"}}', ''),
(23, 113, '', '', 'harsh.thakkar@wohlig.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2017-02-10 11:34:22', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', 0, '', '', '', 'img/logo_black.png', '', '', '', '', '', '', '', 'odishirt', '{"description":{"trim":{"highlightOne":{"flag":false,"tcolor":"black","disable":"unnoable","hcolor":"#000000","image":"img/odi-tshirts/trims/odi/design4/back/trim1/black.png"},"highlightTwo":{"flag":false,"tcolor":"australian_green","disable":"unnoable","hcolor":"#008000","image":"img/odi-tshirts/trims/odi/design4/back/trim2/australian_green.png"},"highlightBase":{"flag":false,"tcolor":"lemon_yellow","disable":"unnoable","image":"img/odi-tshirts/trims/odi/base/back/lemon_yellow.png","hcolor":"#ffff00"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":25},"divattributes":[]},"isTeamLogo":true,"printType":"embroidered","front":false,"back":true,"cloth":"img/odi-tshirts/trims/odibase/back/lemon_yellow.png","backdrop":"img/odi-tshirts/backdrop/odi/back.png"},"jerseyBack":[{"name":"Harsh","no":"00","font":"arial","color":"white","quantity":10,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":40,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}}],"allLogos":{"rightchest":"img/logo_black.png"},"designName":"design4","designType":"odi","totalAmount":15000,"totalQuan":10,"name":"Plumb Front"},"mainsponserlogo":"","leftsleeve":"","rightsleeve":"","backsponser":"","teamlogo":"","rightchest":"img/logo_black.png","data":{"id":"35","description":"{"trim":{"highlightOne":{"flag":false,"tcolor":"black","disable":"unnoable","hcolor":"#000000","image":"img/odi-tshirts/trims/odi/design4/back/trim1/black.png"},"highlightTwo":{"flag":false,"tcolor":"australian_green","disable":"unnoable","hcolor":"#008000","image":"img/odi-tshirts/trims/odi/design4/back/trim2/australian_green.png"},"highlightBase":{"flag":false,"tcolor":"lemon_yellow","disable":"unnoable","image":"img/odi-tshirts/trims/odi/base/back/lemon_yellow.png","hcolor":"#ffff00"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":25},"divattributes":[]},"isTeamLogo":true,"printType":"embroidered","front":false,"back":true,"cloth":"img/odi-tshirts/trims/odibase/back/lemon_yellow.png","backdrop":"img/odi-tshirts/backdrop/odi/back.png"},"jerseyBack":[{"name":"Harsh","no":"00","font":"arial","color":"white","quantity":10,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":40,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}}],"allLogos":{"rightchest":"img/logo_black.png"},"designName":"design4","designType":"odi","totalAmount":15000,"totalQuan":10,"name":"Plumb Front"}","type":"odishirt","email":"harsh.thakkar@wohlig.com","date":"2017-02-10 11:33:28","mainsponserlogo":"","leftsleeve":"","rightsleeve":"","backsponser":"","teamlogo":"","rightchest":"img/logo_black.png"}}', ''),
(24, 113, '', '', 'harsh.thakkar@wohlig.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2017-02-10 11:37:22', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', 0, '', '', '', 'img/logo_black.png', '', '', '', '', '', '', '', 'odishirt', '{"description":{"trim":{"highlightOne":{"flag":false,"tcolor":"black","disable":"unnoable","hcolor":"#000000","image":"img/odi-tshirts/trims/training/design1/back/trim1/black.png"},"highlightTwo":{"flag":false,"tcolor":"black","disable":"noable","hcolor":false,"image":"img/odi-tshirts/trims/training/design1/back/trim2/black.png"},"highlightBase":{"flag":false,"tcolor":"red","disable":"unnoable","image":"img/odi-tshirts/trims/training/base/back/red.png","hcolor":"#bf0000"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":25},"divattributes":[]},"isTeamLogo":true,"printType":"embroidered","front":false,"back":true,"cloth":"img/odi-tshirts/trims/trainingbase/back/red.png","backdrop":"img/odi-tshirts/backdrop/training/back.png"},"jerseyBack":[{"name":"harsh","no":"04","font":"arial","color":"white","quantity":20,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":46,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}}],"allLogos":{"rightchest":"img/logo_black.png"},"designName":"design1","designType":"training","totalAmount":22000,"totalQuan":20,"name":"Pace Front"},"mainsponserlogo":"","leftsleeve":"","rightsleeve":"","backsponser":"","teamlogo":"","rightchest":"img/logo_black.png","data":{"id":"36","description":"{"trim":{"highlightOne":{"flag":false,"tcolor":"black","disable":"unnoable","hcolor":"#000000","image":"img/odi-tshirts/trims/training/design1/back/trim1/black.png"},"highlightTwo":{"flag":false,"tcolor":"black","disable":"noable","hcolor":false,"image":"img/odi-tshirts/trims/training/design1/back/trim2/black.png"},"highlightBase":{"flag":false,"tcolor":"red","disable":"unnoable","image":"img/odi-tshirts/trims/training/base/back/red.png","hcolor":"#bf0000"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":25},"divattributes":[]},"isTeamLogo":true,"printType":"embroidered","front":false,"back":true,"cloth":"img/odi-tshirts/trims/trainingbase/back/red.png","backdrop":"img/odi-tshirts/backdrop/training/back.png"},"jerseyBack":[{"name":"harsh","no":"04","font":"arial","color":"white","quantity":20,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":46,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}}],"allLogos":{"rightchest":"img/logo_black.png"},"designName":"design1","designType":"training","totalAmount":22000,"totalQuan":20,"name":"Pace Front"}","type":"odishirt","email":"harsh.thakkar@wohlig.com","date":"2017-02-10 11:36:01","mainsponserlogo":"","leftsleeve":"","rightsleeve":"","backsponser":"","teamlogo":"","rightchest":"img/logo_black.png"}}', ''),
(25, 113, '', '', 'harsh.thakkar@wohlig.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2017-02-10 11:50:19', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', 0, '', '', '', 'img/logo_black.png', '', '', '', '', '', '', '', 'odishirt', '{"description":{"trim":{"highlightOne":{"flag":false,"tcolor":"black","disable":"unnoable","hcolor":"#000000","image":"img/odi-tshirts/trims/training/design1/back/trim1/black.png"},"highlightTwo":{"flag":false,"tcolor":"black","disable":"noable","hcolor":false,"image":"img/odi-tshirts/trims/training/design1/back/trim2/black.png"},"highlightBase":{"flag":false,"tcolor":"red","disable":"unnoable","image":"img/odi-tshirts/trims/training/base/back/red.png","hcolor":"#bf0000"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":25},"divattributes":[]},"isTeamLogo":true,"printType":"embroidered","front":false,"back":true,"cloth":"img/odi-tshirts/trims/trainingbase/back/red.png","backdrop":"img/odi-tshirts/backdrop/training/back.png"},"jerseyBack":[{"name":"harsh","no":"04","font":"arial","color":"white","quantity":20,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":46,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}}],"allLogos":{"rightchest":"img/logo_black.png"},"designName":"design1","designType":"training","totalAmount":22000,"totalQuan":20,"name":"Pace Front"},"mainsponserlogo":"","leftsleeve":"","rightsleeve":"","backsponser":"","teamlogo":"","rightchest":"img/logo_black.png","data":{"id":"36","description":"{"trim":{"highlightOne":{"flag":false,"tcolor":"black","disable":"unnoable","hcolor":"#000000","image":"img/odi-tshirts/trims/training/design1/back/trim1/black.png"},"highlightTwo":{"flag":false,"tcolor":"black","disable":"noable","hcolor":false,"image":"img/odi-tshirts/trims/training/design1/back/trim2/black.png"},"highlightBase":{"flag":false,"tcolor":"red","disable":"unnoable","image":"img/odi-tshirts/trims/training/base/back/red.png","hcolor":"#bf0000"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":25},"divattributes":[]},"isTeamLogo":true,"printType":"embroidered","front":false,"back":true,"cloth":"img/odi-tshirts/trims/trainingbase/back/red.png","backdrop":"img/odi-tshirts/backdrop/training/back.png"},"jerseyBack":[{"name":"harsh","no":"04","font":"arial","color":"white","quantity":20,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":46,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}}],"allLogos":{"rightchest":"img/logo_black.png"},"designName":"design1","designType":"training","totalAmount":22000,"totalQuan":20,"name":"Pace Front"}","type":"odishirt","email":"harsh.thakkar@wohlig.com","date":"2017-02-10 11:36:01","mainsponserlogo":"","leftsleeve":"","rightsleeve":"","backsponser":"","teamlogo":"","rightchest":"img/logo_black.png"}}', '');

-- --------------------------------------------------------

--
-- Table structure for table `emailer`
--

CREATE TABLE IF NOT EXISTS `emailer` (
`id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emailer`
--

INSERT INTO `emailer` (`id`, `username`, `password`) VALUES
(1, 'YXZpbmFzaC5naGFyZQ==', 'YXZpbmFzaDEyMw==');

-- --------------------------------------------------------

--
-- Table structure for table `fynx_cart`
--

CREATE TABLE IF NOT EXISTS `fynx_cart` (
`id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `product` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `design` varchar(255) NOT NULL,
  `json` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=413 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fynx_cart`
--

INSERT INTO `fynx_cart` (`id`, `user`, `quantity`, `product`, `timestamp`, `design`, `json`) VALUES
(2, 10, 1, '7', '2016-01-19 12:12:42', '', ''),
(3, 10, 1, '6', '2016-01-19 12:21:38', '', ''),
(4, 9, 1, '6', '2016-01-19 12:24:01', '', ''),
(5, 9, 2, '8', '2016-01-19 12:25:39', '', ''),
(10, 15, 1, '7', '2016-01-19 14:20:06', '', ''),
(11, 15, 3, '6', '2016-01-19 14:21:52', '', ''),
(24, 20, 1, '9', '2016-01-20 05:33:58', '', ''),
(25, 19, 1, '6', '2016-01-20 05:39:34', '', ''),
(28, 21, 2, '6', '2016-01-20 09:39:43', '', ''),
(29, 21, 1, '7', '2016-01-20 09:39:29', '', ''),
(30, 22, 1, '7', '2016-01-20 09:53:40', '', ''),
(41, 27, 1, '21', '2016-02-24 06:00:07', '', ''),
(42, 29, 1, '21', '2016-03-03 11:15:29', '', ''),
(47, 33, 1, '10', '2016-03-08 11:18:17', '', ''),
(48, 33, 1, '11', '2016-03-08 11:18:27', '', ''),
(62, 34, 5, '49', '2016-03-11 13:01:25', '', ''),
(64, 34, 5, '6', '2016-03-11 13:10:27', '', ''),
(73, 34, 6, '31', '2016-03-12 07:38:30', '', ''),
(78, 48, 10, '10', '2016-03-12 13:35:43', '', ''),
(81, 47, 12, '49', '2016-03-12 13:57:15', '', ''),
(84, 47, 50, '48', '2016-03-12 14:25:48', '', ''),
(89, 49, 1, '48', '2016-03-17 05:03:22', '', ''),
(96, 49, 1, '31', '2016-03-17 05:03:33', '', ''),
(98, 55, 1, '31', '2016-04-20 06:52:36', '', ''),
(125, 60, 2, '21', '2016-03-23 10:52:40', '', ''),
(129, 61, 5, '6', '2016-03-23 15:00:45', '', ''),
(130, 63, 3, '21', '2016-03-23 15:14:15', '', ''),
(131, 64, 6, '56', '2016-03-24 21:39:52', '', ''),
(142, 59, 4, '21', '2016-03-28 10:40:08', '', ''),
(149, 0, 2, '9', '2016-03-30 10:08:19', '', ''),
(150, 0, 2, '6', '2016-03-30 10:09:13', '', ''),
(153, 0, 3, '12', '2016-03-30 10:14:53', '', ''),
(158, 0, 2, '21', '2016-03-30 14:52:03', '', ''),
(159, 0, 3, '22', '2016-03-30 14:52:03', '', ''),
(162, 0, 3, '22', '2016-03-30 15:29:26', '', ''),
(163, 0, 6, '25', '2016-03-30 15:29:26', '', ''),
(164, 0, 2, '171', '2016-03-30 15:29:26', '', ''),
(165, 0, 3, '22', '2016-03-30 15:29:35', '', ''),
(166, 0, 6, '25', '2016-03-30 15:29:35', '', ''),
(167, 0, 2, '171', '2016-03-30 15:29:35', '', ''),
(171, 70, 2, '6', '2016-03-30 15:43:12', '', ''),
(178, 0, 3, '21', '2016-03-31 06:48:45', '', ''),
(179, 0, 4, '128', '2016-03-31 06:48:45', '', ''),
(180, 0, 2, '146', '2016-03-31 06:48:45', '', ''),
(181, 0, 2, '22', '2016-03-31 06:48:45', '', ''),
(182, 0, 3, '6', '2016-04-01 10:01:04', '', ''),
(183, 0, 3, '9', '2016-04-01 10:01:04', '', ''),
(184, 0, 3, '10', '2016-04-01 10:01:04', '', ''),
(185, 0, 3, '7', '2016-04-01 10:01:04', '', ''),
(190, 0, 1, '128', '2016-04-02 09:19:08', '', ''),
(191, 0, 1, '128', '2016-04-02 09:19:21', '', ''),
(192, 0, 1, '128', '2016-04-02 09:21:43', '', ''),
(193, 56, 1, '126', '2016-04-02 09:23:35', '', ''),
(196, 0, 1, '128', '2016-04-02 10:11:35', '', ''),
(199, 50, 2, '7', '2016-04-04 05:52:24', '', ''),
(200, 71, 3, '6', '2016-04-04 06:18:30', '', ''),
(201, 72, 3, '11', '2016-04-04 08:09:17', '', ''),
(202, 72, 1, '126', '2016-04-04 08:09:17', '', ''),
(210, 74, 2, '102', '2016-04-05 09:31:08', '', ''),
(211, 0, 2, '58', '2016-04-05 09:32:12', '', ''),
(212, 0, 2, '112', '2016-04-05 09:33:12', '', ''),
(214, 30, 1, '128', '2016-04-08 08:29:09', '', ''),
(219, 78, 4, '96', '2016-04-05 13:10:28', '', ''),
(220, 78, 5, '91', '2016-04-05 13:10:28', '', ''),
(223, 30, 2, '6', '2016-04-05 13:17:17', '', ''),
(231, 79, 0, '2', '2016-04-06 10:23:16', '', ''),
(234, 79, 1, '9', '2016-04-06 10:36:00', '', ''),
(235, 79, 2, '128', '2016-04-06 10:36:00', '', ''),
(237, 50, 3, '1', '2016-04-07 05:46:26', '', ''),
(241, 80, 1, '129', '2016-04-07 12:15:35', '', ''),
(256, 87, 0, '3', '2016-04-07 14:37:38', '', ''),
(257, 87, 1, '1', '2016-04-07 14:38:54', '', ''),
(259, 50, 2, '3', '2016-04-08 06:10:06', '', ''),
(262, 88, 1, '6', '2016-04-08 08:34:05', '', ''),
(265, 89, 1, '6', '2016-04-08 08:37:45', '', ''),
(267, 90, 2, '6', '2016-04-08 08:54:12', '', ''),
(268, 91, 2, '135', '2016-04-08 09:03:59', '', ''),
(269, 50, 1, '6', '2016-04-08 09:12:43', '', ''),
(270, 50, 13, '9', '2016-04-08 10:21:39', '', ''),
(271, 50, 1, '11', '2016-04-08 10:21:57', '', ''),
(272, 92, 1, '6', '2016-04-08 16:25:40', '', ''),
(275, 84, 2, '1', '2016-04-09 07:59:04', '', ''),
(276, 95, 1, '128', '2016-04-13 15:29:30', '', ''),
(277, 95, 1, '130', '2016-04-13 15:29:30', '', ''),
(278, 95, 1, '129', '2016-04-13 15:29:30', '', ''),
(279, 95, 1, '122', '2016-04-13 15:29:30', '', ''),
(304, 97, 2, '129', '2016-04-20 05:52:12', '', ''),
(333, 65, 1, '122', '2016-04-20 07:14:30', '', ''),
(338, 99, 1, '128', '2016-04-20 12:57:34', '', ''),
(339, 101, 1, '114', '2016-04-21 04:15:24', '', ''),
(341, 102, 1, '128', '2016-04-21 10:39:42', '', ''),
(343, 52, 5, '6', '2016-04-21 14:12:47', '', ''),
(344, 55, 1, '129', '2016-04-22 10:37:33', '', ''),
(355, 96, 2, '36', '2016-04-27 13:32:46', '', ''),
(356, 105, 1, '176', '2016-04-27 17:47:53', '', ''),
(357, 106, 1, '106', '2016-04-30 13:56:41', '', ''),
(362, 1, 2, '176', '2016-05-11 07:25:16', '', ''),
(376, 29, 1, '4', '2016-06-03 09:51:12', '', ''),
(377, 57, 7, '4', '2016-06-14 06:32:22', '', ''),
(381, 39, 1, '86', '2016-06-07 12:06:29', '', ''),
(383, 98, 1, '113', '2016-08-04 09:42:37', '', ''),
(388, 110, 2, '135', '2016-08-09 11:31:38', '', ''),
(389, 56, 1, '170', '2017-01-10 06:20:56', '', ''),
(392, 115, 2, '57', '2017-02-10 11:43:34', '', ''),
(395, 66, 1, '165', '2017-02-23 07:50:46', '', ''),
(396, 66, 1, '86', '2017-02-23 07:51:39', '', ''),
(397, 116, 10, '3', '2017-03-07 16:15:56', '', ''),
(398, 117, 1, '129', '2017-03-07 16:24:28', '', ''),
(399, 118, 1, '129', '2017-03-07 16:24:56', '', ''),
(400, 118, 1, '129', '2017-03-07 16:25:21', '', ''),
(401, 118, 1, '129', '2017-03-07 16:25:23', '', ''),
(405, 107, 1, '256', '2017-03-21 06:33:12', '', ''),
(406, 123, 1, '11', '2017-04-28 07:41:24', '', ''),
(407, 124, 1, '237', '2017-05-09 10:52:32', '', ''),
(408, 125, 1, '237', '2017-05-09 10:52:57', '', ''),
(409, 124, 1, '238', '2017-05-09 10:59:21', '', ''),
(410, 124, 1, '237', '2017-05-09 11:25:49', '', ''),
(411, 124, 1, '265', '2017-05-09 11:25:49', '', ''),
(412, 124, 1, '238', '2017-05-09 11:49:13', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `fynx_category`
--

CREATE TABLE IF NOT EXISTS `fynx_category` (
`id` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `image1` varchar(255) DEFAULT NULL,
  `image2` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fynx_category`
--

INSERT INTO `fynx_category` (`id`, `order`, `name`, `parent`, `status`, `image1`, `image2`) VALUES
(2, 3, 'Bats', '', '2', 'Bats--Combo.png', ''),
(3, 4, 'Balls', '', '2', 'ball1.jpg', ''),
(4, 1, 'Apparel', '', '2', 'CCC-img1.png', ''),
(5, 5, 'Gloves', '', '2', 'Gloves_01.jpg', ''),
(6, 6, 'Pads', '', '2', 'a61.jpg', ''),
(7, 2, 'Kit Bags', '', '2', 'Kitbags_01.jpg', '');

-- --------------------------------------------------------

--
-- Table structure for table `fynx_color`
--

CREATE TABLE IF NOT EXISTS `fynx_color` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fynx_color`
--

INSERT INTO `fynx_color` (`id`, `name`, `status`, `timestamp`) VALUES
(1, 'White', '1', '2016-03-22 10:43:22'),
(2, 'Yellow', '1', '2016-03-22 10:43:23'),
(3, 'Black', '1', '2016-03-22 10:43:24'),
(4, 'Grey', '1', '2016-03-22 10:43:24'),
(5, 'Dark Green', '1', '2016-03-22 10:43:25'),
(6, 'Orange', '1', '2016-03-22 10:43:25'),
(7, 'Blue', '1', '2016-03-22 10:43:25'),
(8, 'Green', '1', '2016-03-22 10:43:25'),
(9, 'Red', '1', '2016-03-22 10:43:25'),
(10, 'Brown', '1', '2016-04-08 10:32:45'),
(11, 'B;ue', '1', '2017-02-07 07:34:37');

-- --------------------------------------------------------

--
-- Table structure for table `fynx_config`
--

CREATE TABLE IF NOT EXISTS `fynx_config` (
`id` int(11) NOT NULL,
  `text` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fynx_config`
--

INSERT INTO `fynx_config` (`id`, `text`, `content`) VALUES
(1, 'Enter Text For Config', 'Enter Content For Config');

-- --------------------------------------------------------

--
-- Table structure for table `fynx_coupon`
--

CREATE TABLE IF NOT EXISTS `fynx_coupon` (
`id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `min` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `max` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `count` int(11) NOT NULL,
  `currency` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fynx_coupon`
--

INSERT INTO `fynx_coupon` (`id`, `type`, `min`, `status`, `max`, `discount`, `name`, `count`, `currency`) VALUES
(1, 1, 400, 2, 1000, 20, 'ccc10', 19, 1),
(2, 1, 1000, 2, 2000, 10, 'JH10', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `fynx_credit`
--

CREATE TABLE IF NOT EXISTS `fynx_credit` (
`id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `credit` int(11) NOT NULL,
  `addcredit` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fynx_customorderenquiry`
--

CREATE TABLE IF NOT EXISTS `fynx_customorderenquiry` (
`id` int(11) NOT NULL,
  `customorder` int(11) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `country` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `note` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fynx_customorderenquiry`
--

INSERT INTO `fynx_customorderenquiry` (`id`, `customorder`, `fname`, `lname`, `email`, `mobile`, `status`, `timestamp`, `country`, `city`, `note`) VALUES
(1, 257, 'Avinash', 'Ghare', 'avinash.ghare@wohlig.com', '8989898989', 1, '2017-03-30 09:29:43', '', '', ''),
(2, 382, 'Chintan', 'Shah1', 'chintan@gmail.com', '9822232323', 0, '2017-03-30 09:51:00', '', '', ''),
(3, 381, 'avi', 'ghare1', 'avi@wohlig.com', '7878787878', 0, '2017-03-30 09:52:03', '', '', ''),
(4, 381, 'harsh', 'C', 'harsh@wohlig.com', '9999999999', 0, '2017-03-30 10:11:42', '', '', ''),
(6, 146, 'chai', 'patil', 'abc@wohlig.com', '5646548465', 0, '2017-03-30 12:40:44', '', '', ''),
(7, 387, 'harsh', 'chheda', 'harsh@wohlig.com', '9920712123', 0, '2017-03-30 14:09:03', '', '', ''),
(8, 388, 'harsh', 'cggeda', 'harsh@wohlig.com', '9920712123', 0, '2017-03-30 14:17:08', '', '', ''),
(10, 0, '', '', '', '', 0, '2017-04-07 04:45:51', '', '', ''),
(14, 388, 'avinash', 'ghare', 'avinashghare572@gmail.com', '9898909098', 0, '2017-04-19 07:15:05', 'IN', 'mumbai', 'test note'),
(15, 389, 'imran', 'patel', 'imranpatel42@gmail.com', '9820579300', 0, '2017-04-20 07:27:42', 'India', 'Mumbai', 'hoihoihoihoihoihoiho'),
(16, 390, 'Avinash', 'ghare', 'avinashghare572@gmail.com', '8983454456', 0, '2017-04-20 07:40:36', 'india', 'mumbai', ''),
(21, 390, 'avinash', 'ggg', 'avinashghare572@gmail.com', '7878787878', 0, '2017-04-20 09:08:58', 'in', 'mum', ''),
(22, 391, 'imran', 'p', 'imranpatel42@gmail.com', '9820579300', 0, '2017-04-20 12:49:00', 'India', 'Mumbai', ''),
(23, 393, 'iimran', 'patel', 'imranpatel42@gmail.com', '98', 0, '2017-04-21 06:55:03', '9', '9', ''),
(24, 394, 'irman', 'patel', 'imranpatel42@gmail.com', '9', 0, '2017-04-21 07:12:27', '9', '9', 'dfgfdgffdgdfgfdgfdgd'),
(25, 395, 'imran', 'patel', 'imran@kathiwadagroup.com', '9', 0, '2017-04-21 07:26:54', '9', '9', ''),
(26, 399, 'Digvijay', 'Kath', '1@gmail.com', '987', 0, '2017-04-21 11:47:53', 'India', 'Mum', 'can the gloves strap be a different colour?'),
(27, 404, 'qwqw', 'wqsds', '34r4r@gmail.com', '2343', 0, '2017-04-25 08:13:50', 'wedqwd', 'wqqwq', ''),
(28, 404, 'qwqw', 'wqsds', '34r4r@gmail.com', '2343', 0, '2017-04-25 08:13:50', 'wedqwd', 'wqqwq', ''),
(29, 405, 'rtsrg', 'fgbfcgbgf', 'rte@gmail.com', '4543543643', 0, '2017-04-25 10:41:56', 'dgdsgsg', '34r', ''),
(30, 406, 'erter', 'fdgdgd', 'fdgdgf@gmail.com', '3421125', 0, '2017-04-25 10:56:49', 'fdgdsf', 'dsfsdf', ''),
(31, 406, 'drfgdg', 'dfgdfgd', 'dfgfd@gmail.com', '34334', 0, '2017-04-25 10:57:34', 'dfdsfsdf', 'dsfdsf', ''),
(32, 406, 'dadwe', 'werer', 'ewrwer@gamil.com', '45445', 0, '2017-04-25 10:59:56', 'grgsrg', 'rgrgrt', ''),
(33, 409, 'jkjk', 'jhkhjk', 'hnj@hvb.jh', '66', 0, '2017-04-25 13:23:22', 'k', 'jknjk', ''),
(34, 415, 'imran', 'patel', 'imranapatel42@gmail.com', 'ffg', 0, '2017-05-02 06:52:22', 'fdasfds', 'fdfdsf', '');

-- --------------------------------------------------------

--
-- Table structure for table `fynx_designer`
--

CREATE TABLE IF NOT EXISTS `fynx_designer` (
`id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `noofdesigns` int(11) NOT NULL,
  `designerid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `commission` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fynx_designer`
--

INSERT INTO `fynx_designer` (`id`, `email`, `noofdesigns`, `designerid`, `name`, `contact`, `commission`) VALUES
(1, 'pooja1@wohlig.com', 2, 'AS123', 'Aditya', '57876', '40'),
(2, 'jagruti@wohlig.com', 2, 'J12', 'Jagruti Patil', '79798', '10');

-- --------------------------------------------------------

--
-- Table structure for table `fynx_designs`
--

CREATE TABLE IF NOT EXISTS `fynx_designs` (
`id` int(11) NOT NULL,
  `designer` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fynx_designs`
--

INSERT INTO `fynx_designs` (`id`, `designer`, `image`, `status`, `timestamp`) VALUES
(4, 2, '3Q9Q53316.JPG', '2', '2015-12-02 05:31:50'),
(6, 1, 'schools-rugby_1417187c1.jpg', '1', '2015-12-02 14:21:15');

-- --------------------------------------------------------

--
-- Table structure for table `fynx_homeslide`
--

CREATE TABLE IF NOT EXISTS `fynx_homeslide` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `link` text NOT NULL,
  `target` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `template` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `centeralign` varchar(255) NOT NULL,
  `order` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fynx_homeslide`
--

INSERT INTO `fynx_homeslide` (`id`, `name`, `link`, `target`, `status`, `image`, `template`, `class`, `text`, `centeralign`, `order`) VALUES
(19, '0', '', '0', '0', 'Home-banners(1400X556).jpg', '0', '0', '0', '0', 6),
(20, '0', 'http://customcricketcompany.com/#/categories/Kit%20Bags/Kit%20Bags', '0', '0', '01_Kitbags1.jpg', '0', '0', '0', '0', 0),
(21, '0', 'http://customcricketcompany.com/#/categories/Balls/Balls', '0', '0', '02_Ball1.jpg', '0', '0', '0', '0', 5),
(23, '0', 'http://customcricketcompany.com/#/categories/Bats', '0', '0', 'home-banner-jpeg80.jpg', '0', '0', '0', '0', 4),
(24, '0', 'http://customcricketcompany.com/#/categories/Apparel', '0', '0', '04_Apparels1.jpg', '0', '0', '0', '0', 1),
(25, '0', 'http://customcricketcompany.com/#/categories/Pads/Pads', '0', '0', '05_Pads1.jpg', '0', '0', '0', '0', 2),
(26, '0', 'http://customcricketcompany.com/#/categories/Gloves/Gloves', '0', '0', '06_Gloves2.jpg', '0', '0', '0', '0', 3);

-- --------------------------------------------------------

--
-- Table structure for table `fynx_newsletter`
--

CREATE TABLE IF NOT EXISTS `fynx_newsletter` (
`id` int(11) NOT NULL,
  `user` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fynx_newsletter`
--

INSERT INTO `fynx_newsletter` (`id`, `user`, `email`, `status`) VALUES
(1, '1', 'poojathakare55@gmail.com', '2');

-- --------------------------------------------------------

--
-- Table structure for table `fynx_offer`
--

CREATE TABLE IF NOT EXISTS `fynx_offer` (
`id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `fromdate` date NOT NULL,
  `todate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fynx_offerproduct`
--

CREATE TABLE IF NOT EXISTS `fynx_offerproduct` (
`id` int(11) NOT NULL,
  `offer` int(11) NOT NULL,
  `product` varchar(255) NOT NULL,
  `quantity` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fynx_order`
--

CREATE TABLE IF NOT EXISTS `fynx_order` (
`id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `billingaddress` varchar(255) NOT NULL,
  `billingcontact` varchar(255) NOT NULL,
  `billingcity` varchar(255) NOT NULL,
  `billingstate` varchar(255) NOT NULL,
  `billingpincode` varchar(255) NOT NULL,
  `billingcountry` varchar(255) NOT NULL,
  `shippingcity` varchar(255) NOT NULL,
  `shippingaddress` varchar(255) NOT NULL,
  `shippingname` varchar(255) NOT NULL,
  `shippingcountry` varchar(255) NOT NULL,
  `shippingcontact` varchar(255) NOT NULL,
  `shippingstate` varchar(255) NOT NULL,
  `shippingpincode` varchar(255) NOT NULL,
  `trackingcode` varchar(255) NOT NULL,
  `defaultcurrency` varchar(255) NOT NULL,
  `shippingmethod` varchar(255) NOT NULL,
  `orderstatus` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `billingline1` varchar(255) NOT NULL,
  `billingline2` varchar(255) NOT NULL,
  `billingline3` varchar(255) NOT NULL,
  `shippingline1` varchar(255) NOT NULL,
  `shippingline2` varchar(255) NOT NULL,
  `shippingline3` varchar(255) NOT NULL,
  `transactionid` varchar(255) NOT NULL,
  `paymentmode` varchar(255) DEFAULT NULL,
  `finalamount` varchar(50) NOT NULL,
  `totalamount` double NOT NULL,
  `discountamount` double NOT NULL,
  `shippingamount` double NOT NULL,
  `currency` varchar(255) NOT NULL,
  `payemail` varchar(555) NOT NULL,
  `paytype` varchar(255) NOT NULL,
  `payresponse` longtext NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=273 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fynx_order`
--

INSERT INTO `fynx_order` (`id`, `user`, `firstname`, `lastname`, `email`, `billingaddress`, `billingcontact`, `billingcity`, `billingstate`, `billingpincode`, `billingcountry`, `shippingcity`, `shippingaddress`, `shippingname`, `shippingcountry`, `shippingcontact`, `shippingstate`, `shippingpincode`, `trackingcode`, `defaultcurrency`, `shippingmethod`, `orderstatus`, `timestamp`, `billingline1`, `billingline2`, `billingline3`, `shippingline1`, `shippingline2`, `shippingline3`, `transactionid`, `paymentmode`, `finalamount`, `totalamount`, `discountamount`, `shippingamount`, `currency`, `payemail`, `paytype`, `payresponse`) VALUES
(6, 22, 'Rohan', 'Gada', 'gadarohan18@gmail.com', '', '', 'xcvb410', 'cvbndfg', '410', 'American Samoa', 'xcvb410', '', '', 'American Samoa', '', 'cvbndfg', '410', '', '', '', '1', '2016-01-20 10:11:31', 'qwertyui', 'sdfghj', 'zxcvbn', 'qwertyui', 'sdfghj', 'zxcvbn', '', '', '', 0, 0, 0, '', '', '', ''),
(8, 27, 'Rohan', 'Gada', 'gadarohan19@gmail.com', '', '', 'dasdas', 'sasdas', '741852963', 'Australia', 'dasdas', '', '', 'Australia', '', 'sasdas', '741852963', '', '', '', '1', '2016-02-24 05:44:26', 'sacdsa', 'dasdsa', 'sadsa', 'sacdsa', 'dasdsa', 'sadsa', '', '', '', 0, 0, 0, '', '', '', ''),
(10, 1, 'dgfhbmn,', 'erg', 'mai@gmail.com', '', '', 'wedf', 'efv', '7896', 'India', 'wedf', '', '', 'India', '', 'efv', '7896', '', '', '', '1', '2016-02-26 05:13:34', 'qwedfv', 'wedfw', 'qwedf', 'qwedfv', 'wedfw', 'qwedf', '', '', '', 0, 0, 0, '', '', '', ''),
(39, 34, 'vinod', 'beloshe', 'vinodwohlig@gmail.com', '', '', 'sad', 'sds', '23232323', 'Rwanda', 'sad', '', '', 'Rwanda', '', 'sds', '23232323', '', '', '', '1', '2016-04-19 12:46:27', 'qw', 'sad', 'sad', 'qw', 'sad', 'sad', 'asdsad', '', '', 0, 0, 0, '', '', '', ''),
(51, 34, 'vinod', 'beloshe', 'vinodwohlig@gmail.com', '', '', 'sad', 'sds', '234234', 'Rwanda', 'sad', '', '', 'Rwanda', '', 'sds', '234234', '', '', '', '1', '2016-03-08 05:29:45', 'qw', 'sad', 'sad', 'qw', 'sad', 'sad', '', '', '', 0, 0, 0, '', '', '', ''),
(53, 34, 'vinod', 'beloshe', 'vinodwohlig@gmail.com', '', '', 'sad', 'sds', '2313213', 'Rwanda', 'sad', '', '', 'Rwanda', '', 'sds', '2313213', '', '', '', '1', '2016-03-08 05:32:21', 'qw', 'sad', 'sad', 'qw', 'sad', 'sad', '', '', '', 0, 0, 0, '', '', '', ''),
(55, 30, 'Harshit', 'Shah', 'hshah248@gmail.com', '', '', '11', 'Mumbai', '400029', 'India', '11', '', '', 'India', '', 'Mumbai', '400029', '', '', '', '1', '2016-03-08 08:57:57', '11', '11', '11', '11', '11', '11', '', '', '', 0, 0, 0, '', '', '', ''),
(57, 30, 'Harshit', 'Shah', 'hshah248@gmail.com', '', '', '11', 'Mumbai', '400029', 'India', '11', '', '', 'India', '', 'Mumbai', '400029', '', '', '', '1', '2016-03-08 09:10:07', '11', '11', '11', '11', '11', '11', '', '', '', 0, 0, 0, '', '', '', ''),
(63, 34, 'vinod', 'beloshe', 'vinodwohlig@gmail.com', '', '', 'sad', 'sds', '234234', 'Rwanda', 'sad', '', '', 'Rwanda', '', 'sds', '234234', '', '', '', '1', '2016-03-10 09:15:53', 'qw', 'sad', 'sad', 'qw', 'sad', 'sad', '', '', '', 0, 0, 0, '', '', '', ''),
(65, 34, 'vinod', 'beloshe', 'vinodwohlig@gmail.com', '', '', 'sad', 'sds', '234234', 'Rwanda', 'sad', '', '', 'Rwanda', '', 'sds', '234234', '', '', '', '1', '2016-03-10 09:53:45', 'qw', 'sad', 'sad', 'qw', 'sad', 'sad', '', '', '', 0, 0, 0, '', '', '', ''),
(67, 34, 'vinod', 'beloshe', 'vinodwohlig@gmail.com', '', '', 'sad', 'sds', '6565656', 'Rwanda', 'sad', '', '', 'Rwanda', '', 'sds', '6565656', '', '', '', '1', '2016-03-11 07:41:25', 'qw', 'sad', 'sad', 'qw', 'sad', 'sad', '', '', '', 0, 0, 0, '', '', '', ''),
(69, 34, 'vinod', 'beloshe', 'vinodwohlig@gmail.com', '', '', 'sad', 'sds', '123123', 'Rwanda', 'sad', '', '', 'Rwanda', '', 'sds', '123123', '', '', '', '1', '2016-03-11 07:45:54', 'qw', 'sad', 'sad', 'qw', 'sad', 'sad', '', '', '', 0, 0, 0, '', '', '', ''),
(71, 34, 'vinod', 'beloshe', 'vinodwohlig@gmail.com', '', '', 'sad', 'sds', '123123', 'Rwanda', 'sad', '', '', 'Rwanda', '', 'sds', '123123', '', '', '', '1', '2016-03-11 07:46:47', 'qw', 'sad', 'sad', 'qw', 'sad', 'sad', '', '', '', 0, 0, 0, '', '', '', ''),
(73, 34, 'vinod', 'beloshe', 'vinodwohlig@gmail.com', '', '', 'sad', 'sds', '123123', 'Rwanda', 'sad', '', '', 'Rwanda', '', 'sds', '123123', '', '', '', '5', '2016-03-11 09:10:08', 'qw', 'sad', 'sad', 'qw', 'sad', 'sad', '1457687367853', '', '', 0, 0, 0, '', '', '', ''),
(74, 30, 'Harshit', 'Shah', 'hshah248@gmail.com', '', '', '11', 'Mumbai', '400029', 'India', '11', '', '', 'India', '', 'Mumbai', '400029', '', '', '', '1', '2016-03-11 10:21:17', '11', '11', '11', '11', '11', '11', '', '', '', 0, 0, 0, '', '', '', ''),
(75, 30, 'Harshit', 'Shah', 'hshah248@gmail.com', '', '', '11', 'Mumbai', '400029', 'India', '11', '', '', 'India', '', 'Mumbai', '400029', '', '', '', '1', '2016-03-11 10:23:21', '11', '11', '11', '11', '11', '11', '', '', '', 0, 0, 0, '', '', '', ''),
(77, 30, 'Harshit', 'Shah', 'hshah248@gmail.com', '', '', '11', 'Mumbai', '400029', 'India', '11', '', '', 'India', '', 'Mumbai', '400029', '', '', '', '1', '2016-03-11 11:37:00', '11', '11', '11', '11', '11', '11', '', '', '', 0, 0, 0, '', '', '', ''),
(78, 30, 'Harshit', 'Shah', 'hshah248@gmail.com', '', '', '11', 'Mumbai', '400029', 'India', '11', '', '', 'India', '', 'Mumbai', '400029', '', '', '', '1', '2016-03-11 11:40:29', '11', '11', '11', '11', '11', '11', '', '', '', 0, 0, 0, '', '', '', ''),
(79, 30, 'Harshit', 'Shah', 'hshah248@gmail.com', '', '', '11', 'Mumbai', '400029', 'India', '11', '', '', 'India', '', 'Mumbai', '400029', '', '', '', '1', '2016-03-11 11:41:49', '11', '11', '11', '11', '11', '11', '', '', '', 0, 0, 0, '', '', '', ''),
(81, 30, 'Harshit', 'Shah', 'hshah248@gmail.com', '', '', '11', 'Mumbai', '400029', 'India', '11', '', '', 'India', '', 'Mumbai', '400029', '', '', '', '1', '2016-03-11 11:43:47', '11', '11', '11', '11', '11', '11', '', '', '', 0, 0, 0, '', '', '', ''),
(82, 30, 'Harshit', 'Shah', 'hshah248@gmail.com', '', '', '11', 'Mumbai', '400029', 'India', '11', '', '', 'India', '', 'Mumbai', '400029', '', '', '', '1', '2016-03-11 11:44:23', '11', '11', '11', '11', '11', '11', '', '', '', 0, 0, 0, '', '', '', ''),
(84, 30, 'Harshit', 'Shah', 'hshah248@gmail.com', '', '', '11', 'Mumbai', '400029', 'India', '11', '', '', 'India', '', 'Mumbai', '400029', '', '', '', '1', '2016-03-11 11:47:24', '11', '11', '11', '11', '11', '11', '', '', '', 0, 0, 0, '', '', '', ''),
(85, 30, 'Harshit', 'Shah', 'hshah248@gmail.com', '', '', '11', 'Mumbai', '400029', 'India', '11', '', '', 'India', '', 'Mumbai', '400029', '', '', '', '1', '2016-03-11 11:50:09', '11', '11', '11', '11', '11', '11', '', '', '', 0, 0, 0, '', '', '', ''),
(86, 30, 'Harshit', 'Shah', 'hshah248@gmail.com', '', '', '11', 'Mumbai', '400029', 'India', '11', '', '', 'India', '', 'Mumbai', '400029', '', '', '', '1', '2016-03-11 11:52:58', '11', '11', '11', '11', '11', '11', '', '', '', 0, 0, 0, '', '', '', ''),
(87, 30, 'Harshit', 'Shah', 'hshah248@gmail.com', '', '', '11', 'Mumbai', '400029', 'India', '11', '', '', 'India', '', 'Mumbai', '400029', '', '', '', '1', '2016-03-11 11:53:56', '11', '11', '11', '11', '11', '11', '', '', '', 0, 0, 0, '', '', '', ''),
(88, 30, 'Harshit', 'Shah', 'hshah248@gmail.com', '', '', '11', 'Mumbai', '400029', 'India', '11', '', '', 'India', '', 'Mumbai', '400029', '', '', '', '1', '2016-03-11 11:56:46', '11', '11', '11', '11', '11', '11', '', '', '', 0, 0, 0, '', '', '', ''),
(90, 1, 'dgfhbmn,', 'erg', 'wohlig@wohlig.com', '', '', 'wedf', 'efv', '14562', 'India', 'wedf', '', '', 'India', '', 'efv', '14562', '', '', '', '5', '2016-03-12 11:55:21', 'qwedfv', 'wedfw', 'qwedf', 'qwedfv', 'wedfw', 'qwedf', '1457783695060', '', '', 0, 0, 0, '', '', '', ''),
(92, 49, 'vinod', 'beloshe', 'vinodwohlig@gmail.com', '', '', 'sdfsdf', 'dfgfdg', '242343', 'Antigua &amp; Ba', 'sdfsdf', '', '', 'Antigua &amp; Ba', '', 'dfgfdg', '242343', '', '', '', '1', '2016-03-12 13:41:55', 'sdfsd', 'dsfsdf', 'sdfsdf', 'sdfsd', 'dsfsdf', 'sdfsdf', '', '', '', 0, 0, 0, '', '', '', ''),
(94, 49, 'vinod', 'beloshe', 'vinodwohlig@gmail.com', '', '', 'sdfsdf', 'dfgfdg', '342234', 'Antigua &amp; Ba', 'sdfsdf', '', '', 'Antigua &amp; Ba', '', 'dfgfdg', '342234', '', '', '', '5', '2016-03-12 13:49:30', 'sdfsd', 'dsfsdf', 'sdfsdf', 'sdfsd', 'dsfsdf', 'sdfsdf', '1457790492930', '', '', 0, 0, 0, '', '', '', ''),
(98, 49, 'dfd', 'dfdf', 'vinodwohlig@gmail.com', '', '', 'sad', 'wqewq', '2428', 'India', 'sad', '', '', 'India', '', 'wqewq', '2428', '', '', '', '1', '2016-03-12 14:03:48', 'dasd', 'sad', 'asd', 'dasd', 'sad', 'asd', '', '', '', 0, 0, 0, '', '', '', ''),
(99, 49, 'vinod', 'beloshe', 'vinodwohlig@gmail.com', '', '', 'sad', 'wqewq', '2324', 'India', 'sad', '', '', 'India', '', 'wqewq', '324432', '', '', '', '1', '2016-03-12 14:08:18', 'dasd', 'sad', 'asd', 'dasd', 'sad', 'asd', '', '', '', 0, 0, 0, '', '', '', ''),
(100, 49, 'vinod', 'beloshe', 'vinodwohlig@gmail.com', '', '', 'sad', 'wqewq', '2132', 'India', 'sad', '', '', 'India', '', 'wqewq', '2132', '', '', '', '1', '2016-03-12 14:12:11', 'dasd', 'sad', 'asd', 'dasd', 'sad', 'asd', '', '', '', 0, 0, 0, '', '', '', ''),
(101, 49, 'vinod', 'beloshe', 'vinodwohlig@gmail.com', '', '', 'sad', 'wqewq', '234234', 'India', 'sad', '', '', 'India', '', 'wqewq', '234234', '', '', '', '1', '2016-03-12 14:14:21', 'dasd', 'sad', 'asd', 'dasd', 'sad', 'asd', '', '', '', 0, 0, 0, '', '', '', ''),
(102, 49, 'vinod', 'beloshe', 'vinodwohlig@gmail.com', '', '', 'sad', 'wqewq', '35345', 'India', 'sad', '', '', 'India', '', 'wqewq', '35345', '', '', '', '1', '2016-03-12 14:18:01', 'dasd', 'sad', 'asd', 'dasd', 'sad', 'asd', '', '', '', 0, 0, 0, '', '', '', ''),
(103, 49, 'vinod', 'beloshe', 'vinodwohlig@gmail.com', '', '', 'sad', 'wqewq', '324234', 'India', 'sad', '', '', 'India', '', 'wqewq', '324234', '', '', '', '5', '2016-03-14 05:16:53', 'dasd', 'sad', 'asd', 'dasd', 'sad', 'asd', '1457932518677', '', '', 0, 0, 0, '', '', '', ''),
(108, 49, 'vinod', 'beloshe', 'vinodwohlig@gmail.com', '', '', 'ads', 'dsdasd', '24', 'Albania', 'ads', '', '', 'Albania', '', 'dsdasd', '24', '', '', '', '5', '2016-03-14 05:49:31', 'asd', 'sad', 'asd', 'asd', 'sad', 'asd', '1457933581389', '', '', 0, 0, 0, '', '', '', ''),
(109, 30, 'Harshit', 'Shah', 'hshah248@gmail.com', '', '', '11', 'Mumbai', '400029', 'India', '11', '', '', 'India', '', 'Mumbai', '400029', '', '', '', '1', '2016-03-14 06:26:05', '11', '11', '11', '11', '11', '11', '', '', '', 0, 0, 0, '', '', '', ''),
(110, 49, 'vinod', 'beloshe', 'vinodwohlig@gmail.com', '', '', 'ads', 'dsdasd', '234324', 'Albania', 'ads', '', '', 'Albania', '', 'dsdasd', '234324', '', '', '', '1', '2016-03-14 06:35:09', 'asd', 'sad', 'asd', 'asd', 'sad', 'asd', '', '', '', 0, 0, 0, '', '', '', ''),
(111, 49, 'vinod', 'beloshe', 'vinodwohlig@gmail.com', '', '', 'ads', 'dsdasd', '343', 'Albania', 'ads', '', '', 'Albania', '', 'dsdasd', '343', '', '', '', '5', '2016-03-14 06:49:26', 'asd', 'sad', 'asd', 'asd', 'sad', 'asd', '1457937725566', '', '', 0, 0, 0, '', '', '', ''),
(112, 50, 'Rohan', 'Gada', 'rohanwohlig@gmail.com', '', '', 'dasadasd', 'gasdgsauy', '852960', 'Jamaica', 'dasadasd', '', '', 'Jamaica', '', 'gasdgsauy', '852960', '', '', '', '5', '2016-03-17 10:13:30', 'Rohadansdasnn', 'kn', 'kjn', 'Rohadansdasnn', 'kn', 'kjn', '1458209419722', '', '', 0, 0, 0, '', '', '', ''),
(113, 50, 'Rohan', 'Gada', 'rohanwohlig@gmail.com', '', '', 'dasadasd', 'gasdgsauy', '400079', 'Jamaica', 'dasadasd', '', '', 'Jamaica', '', 'gasdgsauy', '400079', '', '', '', '5', '2016-03-17 12:07:04', 'Rohadansdasnn', 'kn', 'kjn', 'Rohadansdasnn', 'kn', 'kjn', '1458216411356', '', '', 0, 0, 0, '', '', '', ''),
(114, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-03-17 12:10:14', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', ''),
(115, 50, 'Rohan', 'Gada', 'rohanwohlig@gmail.com', '', '', 'dasadasd', 'gasdgsauy', '123456', 'Jamaica', 'dasadasd', '', '', 'Jamaica', '', 'gasdgsauy', '123456', '', '', '', '5', '2016-03-17 12:10:27', 'Rohadansdasnn', 'kn', 'kjn', 'Rohadansdasnn', 'kn', 'kjn', '1458216618209', '', '', 0, 0, 0, '', '', '', ''),
(116, 30, 'Harshit', 'Shah', 'hshah248@gmail.com', '', '', '11', 'Mumbai', '12121212', 'India', '11', '', '', 'India', '', 'Mumbai', '12121212', '', '', '', '1', '2016-03-19 06:44:32', '11', '11', '11', '11', '11', '11', '', '', '', 0, 0, 0, '', '', '', ''),
(117, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-03-23 13:41:09', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', ''),
(118, 57, 'vinod', 'beloshe', 'vinodwohlig@gmail.com', '', '', 'wer', 'efer', '4234', 'Albania', 'wer', '', '', 'Albania', '', 'efer', '4234', '', '', '', '1', '2016-03-23 13:41:09', 'wer', 'ewr', 'wer', 'wer', 'ewr', 'wer', '', '', '', 0, 0, 0, '', '', '', ''),
(119, 57, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-03-23 14:55:43', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', ''),
(120, 61, 'Rohan', 'Gada', 'ro1@gmail.com', '', '', 'gu', 'ug', '741822', 'Uganda', 'gu', '', '', 'Uganda', '', 'ug', '741822', '', '', '', '1', '2016-03-23 15:01:24', 'gytg', 'yu', 'gbguygu', 'gytg', 'yu', 'gbguygu', '', '', '3300', 3300, 0, 0, 'INR', '', '', ''),
(121, 63, 'Harshit', 'Shah', 'chintan@wohlig.com', '', '', '11', '1111', '111111', 'Albania', '11', '', '', 'Albania', '', '1111', '111111', '', '', '', '1', '2016-03-23 15:11:45', '11', '11', '11', '11', '11', '11', '', '', '2640', 2640, 0, 0, 'INR', '', '', ''),
(122, 0, 'Hewewe', '444@yy.com', '444@gmail.com', '', '', '44', '44', '4', 'India', '44', '', '', 'India', '', '44', '4', '', '', '', '1', '2016-03-23 15:25:12', '44', '4', '4', '44', '4', '4', '', '', '3300', 3300, 0, 0, 'INR', '', '', ''),
(123, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-03-25 05:29:09', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', ''),
(124, 57, 'ewr', 'ewr', 'vinodwohlig@gmail.com', '', '', 'df', 'sdfsd', '3423', 'Armenia', 'df', '', '', 'Armenia', '', 'sdfsd', '3423', '', '', '', '5', '2016-03-25 05:31:24', 'sdf', 'sdf', 'dfs', 'sdf', 'sdf', 'dfs', '1458883750187', '', '9800', 9800, 0, 0, 'INR', '', '', ''),
(125, 0, 'dgfhbmn,', 'erg', 'pooja.wohlig@gmail.com', '', '', 'wedf', 'efv', '400708', 'India', 'wedf', '', '', 'India', '', 'efv', '400708', '', '', '', '5', '2016-03-25 07:10:39', 'qwedfv', 'wedfw', 'qwedf', 'qwedfv', 'wedfw', 'qwedf', '1458889797284', '', '710', 660, 0, 50, 'INR', '', '', ''),
(126, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-03-28 06:38:38', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', ''),
(127, 30, 'Harshit', 'Shah', 'hshah248@gmail.com', '', '', '11', 'Mumbai', '400070', 'India', '11', '', '', 'India', '', 'Mumbai', '400070', '', '', '', '1', '2016-03-28 06:38:38', '11', '11', '11', '11', '11', '11', '', '', '2560', 2560, 0, 0, 'INR', '', '', ''),
(128, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-03-28 06:44:19', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', ''),
(129, 30, 'Harshit', 'Shah', 'hshah248@gmail.com', '', '', '11', 'Mumbai', '400070', 'India', '11', '', '', 'India', '', 'Mumbai', '400070', '', '', '', '1', '2016-03-28 06:44:24', '11', '11', '11', '11', '11', '11', '', '', '2560', 2560, 0, 0, 'INR', '', '', ''),
(130, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-03-28 06:47:03', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', ''),
(131, 30, 'Harshit', 'Shah', 'hshah248@gmail.com', '', '', '11', 'Mumbai', '400070', 'India', '11', '', '', 'India', '', 'Mumbai', '400070', '', '', '', '1', '2016-03-28 06:47:03', '11', '11', '11', '11', '11', '11', '', '', '2560', 2560, 0, 0, 'INR', '', '', ''),
(132, 30, 'Harshit', 'Shah', 'hshah248@gmail.com', '', '', '11', 'Mumbai', '400070', 'India', '11', '', '', 'India', '', 'Mumbai', '400070', '', '', '', '1', '2016-03-28 06:48:59', '11', '11', '11', '11', '11', '11', '', '', '2560', 2560, 0, 0, 'INR', '', '', ''),
(133, 30, 'Harshit', 'Shah', 'hshah248@gmail.com', '', '', '11', 'Mumbai', '400070', 'India', '11', '', '', 'India', '', 'Mumbai', '400070', '', '', '', '1', '2016-03-28 06:50:31', '11', '11', '11', '11', '11', '11', '', '', '2560', 2560, 0, 0, 'INR', '', '', ''),
(134, 30, 'Harshit', 'Shah', 'hshah248@gmail.com', '', '', '11', 'Mumbai', '400070', 'India', '11', '', '', 'India', '', 'Mumbai', '400029', '', '', '', '1', '2016-03-28 20:30:10', '11', '11', '11', '11', '11', '11', '', '', '5860', 5860, 0, 0, 'INR', '', '', ''),
(135, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-03-29 12:17:29', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', ''),
(136, 30, 'Amit', 'Verma', 'amit.wohlig@gmail.com', '', '', 'rhjmkvh', 'Maharashtra', '400070', 'India', 'rhjmkvh', '', '', 'India', '', 'Maharashtra', '400070', '', '', '', '5', '2016-03-29 12:18:32', '2345ty', 'qdfn', 'hvb', '2345ty', 'qdfn', 'hvb', '1459253849898', '', '5200', 5200, 0, 0, 'INR', '', '', ''),
(137, 56, 'Digvijay', 'Kathiwada', 'dkathiwada@gmail.com', '', '', 'mumbai', 'mh', '400026', 'India', 'mumbai', '', '', 'India', '', 'mh', '400026', '', '', '', '1', '2016-04-02 09:13:10', 'melange', '33 altamount', 'bob', 'melange', '33 altamount', 'bob', '', '', '8800', 8800, 0, 0, 'INR', '', '', ''),
(138, 56, 'Digvijay', 'Kathiwada', 'dkathiwada@gmail.com', '', '', 'mumbai', 'mh', '400026', 'India', 'mumbai', '', '', 'India', '', 'mh', '400026', '', '', '', '1', '2016-04-02 10:08:58', 'melange', '33 altamount', 'bob', 'melange', '33 altamount', 'bob', '', '', '17800', 17800, 0, 0, 'INR', '', '', ''),
(139, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-04-04 06:11:02', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', ''),
(140, 0, 'ewr', 'ewr', 'vinodwohlig@gmail.com', '', '', 'edf', 'Maharashtra', '400070', 'India', 'edf', '', '', 'India', '', 'Maharashtra', '400070', '', '', '', '1', '2016-04-04 06:11:03', 'fed', 'wefd', 'fdf', 'fed', 'wefd', 'fdf', '', '', '710', 660, 0, 50, 'INR', '', '', ''),
(141, 0, 'Amit', 'Verma', 'hshah248@gmail.com', '', '', 'rhjmkvh', 'Maharashtra', '400029', 'India', 'rhjmkvh', '', '', 'India', '', 'Maharashtra', '400030', '', '', '', '1', '2016-04-05 06:24:29', '2345ty', 'qdfn', 'hvb', '2345ty', 'qdfn', 'hvb', '', '', '37120', 37120, 0, 0, 'INR', '', '', ''),
(142, 52, 'slknln', 'jkbjb', 'chirag@wohlig.com', '', '', 'dfghjkl', 'Maharashtra', '400022', 'India', 'dfghjkl', '', '', 'India', '', 'Maharashtra', '400022', '', '', '', '1', '2016-04-06 10:22:13', 'dfghjkl', 'dfghjkl', 'dfghjkl', 'dfghjkl', 'dfghjkl', 'dfghjkl', '', '', '7450', 7450, 0, 0, 'INR', '', '', ''),
(143, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-04-06 10:31:40', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', ''),
(144, 52, 'slknln', 'jkbjb', 'chirag@wohlig.com', '', '', 'dfghjkl', 'Maharashtra', '400022', 'India', 'dfghjkl', '', '', 'India', '', 'Maharashtra', '400022', '', '', '', '1', '2016-04-06 10:31:40', 'dfghjkl', 'dfghjkl', 'dfghjkl', 'dfghjkl', 'dfghjkl', 'dfghjkl', '', '', '50', 0, 0, 50, 'INR', '', '', ''),
(145, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-04-06 13:25:06', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', ''),
(146, 0, 'Rohan', 'Gada', 'rohangada17@gmail.com', '', '', 'uy', 'adcac', '400029', 'Albania', 'uy', '', '', 'Albania', '', 'adcac', '400029', '', '', '', '1', '2016-04-06 13:25:07', 'ui', 'yui', 'yi', 'ui', 'yui', 'yi', '', '', '3300', 3300, 0, 0, 'INR', '', '', ''),
(147, 50, 'Rohan', 'Gada', 'rohanwohlig@gmail.com', '', '', 'dasadasd', 'gasdgsauy', '741852', 'Jamaica', 'dasadasd', '', '', 'Jamaica', '', 'gasdgsauy', '741852', '', '', '', '1', '2016-04-07 05:47:00', 'Rohadansdasnn', 'kn', 'kjn', 'Rohadansdasnn', 'kn', 'kjn', '', '', '3300', 3300, 0, 0, 'INR', '', '', ''),
(148, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-04-07 05:55:05', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', ''),
(149, 55, 'Swati', 'Kathiwada', 'swati@kathiwada.com', '', '', 'Mumbai', 'Maharashtra', '4000036', 'India', 'Mumbai', '', '', 'India', '', 'Maharashtra', '4000036', '', '', '', '1', '2016-04-07 05:55:05', '1 Symphony', 'Nepeansea Road', 'Near Dariya Mahal', '1 Symphony', 'Nepeansea Road', 'Near Dariya Mahal', '', '', '5800', 5800, 0, 0, 'INR', '', '', ''),
(150, 50, 'Rohan', 'Gada', 'rohanwohlig@gmail.com', '', '', 'dasadasd', 'gasdgsauy', '400068', 'Jamaica', 'dasadasd', '', '', 'Jamaica', '', 'gasdgsauy', '400068', '', '', '', '1', '2016-04-07 13:22:18', 'Rohadansdasnn', 'kn', 'kjn', 'Rohadansdasnn', 'kn', 'kjn', '', '', '3300', 3300, 0, 0, 'INR', '', '', ''),
(151, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-04-07 13:38:03', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', ''),
(152, 1, 'dgfhbmn,', 'erg', 'wohlig@wohlig.com', '', '', 'wedf', 'efv', '418541', 'India', 'wedf', '', '', 'India', '', 'efv', '418541', '', '', '', '1', '2016-04-07 13:38:04', 'qwedfv', 'wedfw', 'qwedf', 'qwedfv', 'wedfw', 'qwedf', '', '', '9900', 9900, 0, 0, 'INR', '', '', ''),
(153, 1, 'dgfhbmsn,', 'erg', 'wohlig@wohlig.com', '', '', 'wedf', 'efv', '21222222222', 'India', 'wedf', '', '', 'India', '', 'efv', '418541', '', '', '', '1', '2016-04-07 13:42:13', 'qwedfv', 'wedfw', 'qwedf', 'qwedfv', 'wedfw', 'qwedf', '', '', '29150', 29150, 0, 0, 'INR', '', '', ''),
(154, 84, 'Rohan', 'Gada', 'gadarohan17@gmail.com', '', '', 'xfchgvjh', 'hgvjhbkj', '1456789', 'Guinea', 'xfchgvjh', '', '', 'Guinea', '', 'hgvjhbkj', '1456789', '', '', '', '1', '2016-04-07 13:43:55', 'erstrdfuygi', 'hx', 'fchgvjbk', 'erstrdfuygi', 'hx', 'fchgvjbk', '', '', '1320', 1320, 0, 0, 'INR', '', '', ''),
(155, 1, 'dgfhbmsn,', 'erg', 'wohlig@wohlig.com', '', '', 'wedf', 'efv', '21222222222', 'India', 'wedf', '', '', 'India', '', 'efv', '418541', '', '', '', '1', '2016-04-07 13:57:14', 'qwedfv', 'wedfw', 'qwedf', 'qwedfv', 'wedfw', 'qwedf', '', '', '900', 900, 0, 0, 'INR', '', '', ''),
(156, 1, 'dgfhbmsn,', 'erg', 'wohlig@wohlig.com', '', '', 'wedf', 'efv', '21222222222', 'India', 'wedf', '', '', 'India', '', 'efv', '418541', '', '', '', '1', '2016-04-07 14:01:53', 'qwedfv', 'wedfw', 'qwedf', 'qwedfv', 'wedfw', 'qwedf', '', '', '16250', 16250, 0, 0, 'INR', '', '', ''),
(157, 1, 'dgfhbmsn,', 'erg', 'wohlig@wohlig.com', '', '', 'wedf', 'efv', '21222222222', 'India', 'wedf', '', '', 'Guam', '', 'efv', '418541', '', '', '', '1', '2016-04-07 14:02:23', 'qwedfv', 'wedfw', 'qwedf', 'qwedfv', 'wedfw', 'qwedf', '', '', '16250', 16250, 0, 0, 'INR', '', '', ''),
(158, 1, 'dgfhbmsn,', 'erg', 'wohlig@wohlig.com', '', '', 'wedf', 'efv', '646464646464', 'India', 'wedf', '', '', 'India', '', 'efv', '646464646464', '', '', '', '1', '2016-04-07 14:03:14', 'qwedfv', 'wedfw', 'qwedf', 'qwedfv', 'wedfw', 'qwedf', '', '', '16250', 16250, 0, 0, 'INR', '', '', ''),
(159, 1, 'dgfhbmsn,', 'erg', 'wohlig@wohlig.com', '', '', 'wedf', 'efv', '646464646464', 'India', 'wedf', '', '', 'India', '', 'efv', '646464646464', '', '', '', '1', '2016-04-07 14:03:42', 'qwedfv', 'wedfw', 'qwedf', 'qwedfv', 'wedfw', 'qwedf', '', '', '16250', 16250, 0, 0, 'INR', '', '', ''),
(160, 1, 'dgfhbmsn,', 'erg', 'wohlig@wohlig.com', '', '', 'wedf', 'efv', '744852', 'India', 'wedf', '', '', 'India', '', 'efv', '744852', '', '', '', '1', '2016-04-07 14:04:18', 'qwedfv', 'wedfw', 'qwedf', 'qwedfv', 'wedfw', 'qwedf', '', '', '9750', 9750, 0, 0, 'INR', '', '', ''),
(161, 86, 'mahesh', 'maurya', 'mahesh@wohlig.co', '', '', 'Mumbai', 'Maharashtra', '400022', 'India', 'Mumbai', '', '', 'India', '', 'Maharashtra', '400022', '', '', '', '5', '2016-04-07 14:25:22', '90', 'killih kamal', 'Okay', '90', 'killih kamal', 'Okay', '1460039028412', '', '1320', 1320, 0, 0, 'INR', '', '', ''),
(162, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-04-07 14:55:55', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', ''),
(163, 84, 'Rohan', 'Gada', 'gadarohan17@gmail.com', '', '', 'xfchgvjh', 'hgvjhbkj', '1456789', 'Guinea', 'xfchgvjh', '', '', 'Guinea', '', 'hgvjhbkj', '1456789', '', '', '', '1', '2016-04-07 14:55:56', 'erstrdfuygi', 'hx', 'fchgvjbk', 'erstrdfuygi', 'hx', 'fchgvjbk', '', '', '660', 660, 0, 0, 'INR', '', '', ''),
(164, 50, 'Rohan', 'Gada', 'rohanwohlig@gmail.com', '', '', 'dasadasd', 'gasdgsauy', '400068', 'Jamaica', 'dasadasd', '', '', 'Jamaica', '', 'gasdgsauy', '400068', '', '', '', '1', '2016-04-08 06:10:29', 'Rohadansdasnn', 'kn', 'kjn', 'Rohadansdasnn', 'kn', 'kjn', '', '', '4620', 4620, 0, 0, 'INR', '', '', ''),
(165, 89, 'Sai', 'Vemula', 'sai@tingmail.in', '', '', '11', '1111', '1111111', 'Azerbaijan', '11', '', '', 'Azerbaijan', '', '1111', '1111111', '', '', '', '1', '2016-04-08 08:38:51', '11', '1', '11', '11', '1', '11', '', '', '660', 660, 0, 0, 'INR', '', '', ''),
(166, 52, 'slknln', 'jkbjb', 'chirag@wohlig.com', '', '', 'dfghjkl', 'Maharashtra', '400022', 'India', 'dfghjkl', '', '', 'India', '', 'Maharashtra', '400022', '', '', '', '1', '2016-04-08 08:48:31', 'dfghjkl', 'dfghjkl', 'dfghjkl', 'dfghjkl', 'dfghjkl', 'dfghjkl', '', '', '1320', 1320, 0, 0, 'INR', '', '', ''),
(167, 92, 'Harshit', 'Shah', 'hshah248@gmail.com', '', '', '11', '11', '111111', 'India', '11', '', '', 'India', '', '11', '111111', '', '', '', '1', '2016-04-08 16:26:51', '11', '11', '11', '11', '11', '11', '', '', '660', 660, 0, 0, 'INR', '', '', ''),
(168, 57, 'vinod', 'beloshe', 'vinodwohlig@gmail.com', '', '', 'df', 'sdfsd', '3423', 'Armenia', 'df', '', '', 'Armenia', '', 'sdfsd', '3423', '', '', '', '1', '2016-04-09 07:31:59', 'sdf', 'sdf', 'dfs', 'sdf', 'sdf', 'dfs', '', '', '1320', 1320, 0, 0, 'INR', '', '', ''),
(169, 57, 'vinod', 'beloshe', 'vinodwohlig@gmail.com', '', '', 'df', 'sdfsd', '3423', 'Armenia', 'df', '', '', 'Armenia', '', 'sdfsd', '3423', '', '', '', '1', '2016-04-09 07:44:57', 'sdf', 'sdf', 'dfs', 'sdf', 'sdf', 'dfs', '', '', '1320', 1320, 0, 0, 'INR', '', '', ''),
(170, 57, 'vinod', 'beloshe', 'vinodwohlig@gmail.com', '', '', 'df', 'sdfsd', '3423', 'Armenia', 'df', '', '', 'Armenia', '', 'sdfsd', '3423', '', '', '', '1', '2016-04-09 07:51:01', 'sdf', 'sdf', 'dfs', 'sdf', 'sdf', 'dfs', '', '', '1320', 1320, 0, 0, 'INR', '', '', ''),
(171, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'Afganistan', 'thane', '', '', 'Afganistan', '', 'maharashtra', '421201', '', '', '', '1', '2016-04-09 07:59:10', '123fasd', 'varadvinayak soc', 'maharashtra', '123fasd', 'varadvinayak soc', 'maharashtra', '', '', '1150', 1150, 0, 0, 'INR', '', '', ''),
(172, 84, 'Rohan', 'Gada', 'gadarohan17@gmail.com', '', '', 'xfchgvjh', 'hgvjhbkj', '1456789', 'Guinea', 'xfchgvjh', '', '', 'Guinea', '', 'hgvjhbkj', '1456789', '', '', '', '1', '2016-04-09 07:59:24', 'erstrdfuygi', 'hx', 'fchgvjbk', 'erstrdfuygi', 'hx', 'fchgvjbk', '', '', '1320', 1320, 0, 0, 'INR', '', '', ''),
(173, 57, 'vinod', 'beloshe', 'vinodwohlig@gmail.com', '', '', 'df', 'sdfsd', '3423', 'Armenia', 'df', '', '', 'Armenia', '', 'sdfsd', '3423', '', '', '', '1', '2016-04-09 07:59:44', 'sdf', 'sdf', 'dfs', 'sdf', 'sdf', 'dfs', '', '', '1320', 1320, 0, 0, 'INR', '', '', ''),
(174, 0, 'Rohan', 'Gada', 'gadarohan17@gmail.com', '', '', 'bchg', 'ghvjb', '9768254', 'Nambia', 'bchg', '', '', 'Nambia', '', 'ghvjb', '9768254', '', '', '', '1', '2016-04-11 05:36:27', 'rsetdcty', 'vjh', 'cghvj', 'rsetdcty', 'vjh', 'cghvj', '', '', '3300', 3300, 0, 0, 'INR', '', '', ''),
(175, 0, 'imran', 'Patel', 'imranpatel42@gmail.com', '', '', 'Mumbai', 'Maharastra', '400018', 'India', 'Mumbai', '', '', 'India', '', 'Maharastra', '400018', '', '', '', '1', '2016-04-19 13:13:02', '6 Merryland', 'Dr. R.G. Thadani Road worli mumbai 18', 'flora restaurant', '6 Merryland', 'Dr. R.G. Thadani Road worli mumbai 18', 'flora restaurant', '', '', '168', 168, 0, 0, 'EUR', '', '', ''),
(176, 52, 'slknln', 'jkbjb', 'chirag@wohlig.com', '', '', 'dfghjkl', 'Maharashtra', '400022', 'India', 'dfghjkl', '', '', 'India', '', 'Maharashtra', '400022', '', '', '', '1', '2016-04-15 06:11:11', 'dfghjkl', 'dfghjkl', 'dfghjkl', 'dfghjkl', 'dfghjkl', 'dfghjkl', '', '', '5750', 5750, 0, 0, 'INR', '', '', ''),
(177, 56, 'Digvijay', 'Kathiwada', 'dkathiwada@gmail.com', '', '', 'mumbai', 'mh', '400026', 'India', 'mumbai', '', '', 'India', '', 'mh', '400026', '', '', '', '1', '2016-04-15 06:26:24', 'melange', '33 altamount', 'bob', 'melange', '33 altamount', 'bob', '', '', '18225', 18225, 0, 0, 'INR', '', '', ''),
(178, 56, 'Digvijay', 'Kathiwada', 'dkathiwada@gmail.com', '', '', 'mumbai', 'mh', '400026', 'India', 'mumbai', '', '', 'India', '', 'mh', '400026', '', '', '', '1', '2016-04-15 06:27:26', 'melange', '33 altamount', 'bob', 'melange', '33 altamount', 'bob', '', '', '18225', 18225, 0, 0, 'INR', '', '', ''),
(179, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-04-15 12:47:03', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', ''),
(180, 0, 'Rohan', 'Gada', 'gadarohan17@gmail.com', '', '', 'gu', 'uyg', '976825', 'Uganda', 'gu', '', '', 'Uganda', '', 'uyg', '976825', '', '', '', '1', '2016-04-15 12:47:04', 'uyt', 'uy', 'gy', 'uyt', 'uy', 'gy', '', '', '1720', 1320, 0, 400, 'INR', '', '', ''),
(181, 0, 'Rohan', 'gada', 'rohan@gada.com', '', '', 'oij', 'j', 'oi', 'Bahrain', 'oij', '', '', 'Bahrain', '', 'j', 'oi', '', '', '', '1', '2016-04-15 12:56:39', 'ioadsadjaoidjsaiojoi', 'joi', 'j', 'ioadsadjaoidjsaiojoi', 'joi', 'j', '', '', '1720', 1320, 0, 400, 'INR', '', '', ''),
(182, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-04-20 06:31:38', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', ''),
(183, 98, 'Rohan', 'Gada', 'rohanwohlig@gmail.com', '', '', 'sdfg', 'Arunachal Pradesh', '474090', 'India', 'sdfg', '', '', 'India', '', 'Arunachal Pradesh', '474090', '', '', '', '1', '2016-04-20 06:31:39', 'wqwwq', 'wqwwq', 'Uttaranchal', 'wqwwq', 'wqwwq', 'Uttaranchal', '', '', '2775', 2375, 0, 400, 'INR', '', '', ''),
(184, 55, 'Swati', 'Kathiwada', 'swati@kathiwada.com', '', '', 'Mumbai', 'Maharashtra', '4000036', 'India', 'Mumbai', '', '', 'India', '', 'Maharashtra', '4000036', '', '', '', '5', '2016-04-20 06:57:25', '1 Symphony', 'Nepeansea Road', 'Near Dariya Mahal', '1 Symphony', 'Nepeansea Road', 'Near Dariya Mahal', '1461135221799', '', '1150', 750, 0, 400, 'INR', '', '', ''),
(185, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'India', 'thane', '', '', 'India', '', 'maharashtra', '421201', '', '', '', '1', '2016-04-20 07:46:41', 'varadvinayak soc', 'kjhk', 'maharashtra', 'varadvinayak soc', 'kjhk', 'maharashtra', '', '', '1600', 1200, 0, 400, 'INR', '', '', ''),
(186, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'India', 'thane', '', '', 'India', '', 'maharashtra', '421201', '', '', '', '1', '2016-04-20 07:50:01', 'varadvinayak soc', 'kjhk', 'maharashtra', 'varadvinayak soc', 'kjhk', 'maharashtra', '', '', '1600', 1200, 0, 400, 'INR', '', '', ''),
(187, 1, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'India', 'thane', '', '', 'India', '', 'maharashtra', '421201', '', '', '', '1', '2016-04-20 08:21:52', 'varadvinayak soc', 'varadvinayak soc', 'maharashtra', 'varadvinayak soc', 'varadvinayak soc', 'maharashtra', '', '', '1600', 1200, 0, 400, 'INR', '', '', ''),
(188, 1, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'India', 'thane', '', '', 'India', '', 'maharashtra', '421201', '', '', '', '1', '2016-04-20 08:26:42', 'varadvinayak soc', 'kjhk', 'maharashtra', 'varadvinayak soc', 'kjhk', 'maharashtra', '', '', '1600', 1200, 0, 400, 'INR', '', '', ''),
(189, 1, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'India', 'thane', '', '', 'India', '', 'maharashtra', '421201', '', '', '', '1', '2016-04-20 08:39:58', 'varadvinayak soc', 'kjhk', 'maharashtra', 'varadvinayak soc', 'kjhk', 'maharashtra', '1461141365045', '', '1', 1, 0, 0, 'INR', '', '', ''),
(190, 57, 'vinod', 'beloshe', 'vinodwohlig@gmail.com', '', '', 'df', 'sdfsd', '3423', 'Armenia', 'df', '', '', 'Armenia', '', 'sdfsd', '3423', '', '', '', '1', '2016-04-20 09:17:05', 'sdf', 'sdf', 'dfs', 'sdf', 'sdf', 'dfs', '', '', '1500', 1500, 0, 0, 'INR', '', '', ''),
(191, 96, 'Rohan', 'Gada', 'rohanwohlig@gmail.com', '', '', 'hjb', 'hgu', '400029', 'Guadeloupe', 'hjb', '', '', 'Guadeloupe', '', 'hgu', '400029', '', '', '', '1', '2016-04-20 12:39:48', 'ut', 'jgcuy', 'jhgjhbjhg', 'ut', 'jgcuy', 'jhgjhbjhg', '', '', '5250', 5250, 0, 0, 'INR', '', '', ''),
(192, 99, 'Midhet', 'Sulemani', 'midhet.wohlig@gmail.com', '', '', 'jkefhkwjfhh', 'dsjkfghdjksfhdjksh', '3546546547587', 'Kazakhstan', 'jkefhkwjfhh', '', '', 'Kazakhstan', '', 'dsjkfghdjksfhdjksh', '3546546547587', '', '', '', '1', '2016-04-20 12:59:55', 'dr,bfgnkjrbghjkh', 'kjhefhefh', '1kjfhkwfh', 'dr,bfgnkjrbghjkh', 'kjhefhefh', '1kjfhkwfh', '', '', '7000', 7000, 0, 0, 'INR', '', '', ''),
(193, 52, 'slknln', 'jkbjb', 'chirag@wohlig.com', '', '', 'dfghjkl', 'Maharashtra', '400022', 'India', 'dfghjkl', '', '', 'India', '', 'Maharashtra', '400022', '', '', '', '1', '2016-04-21 14:18:56', 'dfghjkl', 'dfghjkl', 'dfghjkl', 'dfghjkl', 'dfghjkl', 'dfghjkl', '', '', '3000', 3750, 0, 0, 'INR', '', '', ''),
(194, 98, 'Rohan', 'Gada', 'rohanwohlig@gmail.com', '', '', 'sdfg', 'Arunachal Pradesh', '474090', 'India', 'sdfg', '', '', 'India', '', 'Arunachal Pradesh', '474090', '', '', '', '1', '2016-04-23 06:58:27', 'wqwwq', 'wqwwq', 'Uttaranchal', 'wqwwq', 'wqwwq', 'Uttaranchal', '', '', '1500', 1500, 0, 0, 'INR', '', '', ''),
(195, 1, 'jagruti', 'patil', 'wohlig@wohlig.com', '', '', 'thane', 'maharashtra', '421201', 'India', 'thane', '', '', 'India', '', 'maharashtra', '421201', '', '', '', '1', '2016-04-26 07:32:03', 'varadvinayak soc', 'kjhk', 'maharashtra', 'varadvinayak soc', 'kjhk', 'maharashtra', '', '', '3600', 4500, 0, 0, 'INR', '', '', ''),
(196, 1, 'Rohan', 'Gada', 'rohanwohlig@gmail.com', '', '', 'uyg', 'fdsc', '78946132', 'Guadeloupe', 'uyg', '', '', 'Guadeloupe', '', 'fdsc', '78946132', '', '', '', '1', '2016-04-26 07:33:36', 'daugvy', 'vyp', 'g', 'daugvy', 'vyp', 'g', '', '', '1500', 1500, 0, 0, 'INR', '', '', ''),
(197, 96, 'Rohan', 'Gada', 'rohanwohlig@gmail.com', '', '', 'hjb', 'hgu', '400029', 'Guadeloupe', 'hjb', '', '', 'Guadeloupe', '', 'hgu', '400029', '', '', '', '1', '2016-04-26 07:35:42', 'ut', 'jgcuy', 'jhgjhbjhg', 'ut', 'jgcuy', 'jhgjhbjhg', '', '', '1200', 1500, 0, 0, 'INR', '', '', ''),
(198, 93, 'f', 'f', 'f@f', '', '', 'f', 'f', 'f', 'Falkland Islands', 'f', '', '', 'Falkland Islands', '', 'f', 'f', '', '', '', '1', '2016-04-26 11:24:52', 'f', 'f', 'f', 'f', 'f', 'f', '', '', '25000', 25000, 0, 0, 'INR', '', '', ''),
(199, 104, 'Niraj', 'Mittal', 'nirajmittalblr@gmail.com', '', '', 'Bangalore', 'Karnataka', '560001', 'India', 'Bangalore', '', '', 'India', '', 'Karnataka', '560001', '', '', '', '2', '2016-04-27 09:32:32', '109B, Mittal Tower', 'MG Road', 'MG Road', '109B, Mittal Tower', 'MG Road', 'MG Road', '1461749487262', '', '1525', 1525, 0, 0, 'INR', '', '', ''),
(200, 93, 'Imran', 'Patel', 'imran@customcricketcompany.com', '', '', 'f', 'f', 'f', 'Falkland Islands', 'f', '', '', 'Falkland Islands', '', 'f', 'f', '', '', '', '2', '2016-04-27 12:14:52', 'f', 'f', 'f', 'f', 'f', 'f', '1461759060927', '', '1250', 750, 0, 500, 'INR', '', '', ''),
(201, 96, 'Rohan', 'Gada', 'rohanwohlig@gmail.com', '', '', 'hjb', 'hgu', '400029', 'Guadeloupe', 'hjb', '', '', 'Guadeloupe', '', 'hgu', '400029', '', '', '', '1', '2016-04-27 12:31:45', 'ut', 'jgcuy', 'jhgjhbjhg', 'ut', 'jgcuy', 'jhgjhbjhg', 'test', '', '2750', 2250, 0, 500, 'INR', '', '', ''),
(202, 96, 'Rohan', 'Gada', 'rohanwohlig@gmail.com', '', '785817811', 'hjb', 'hgu', '400029', 'Guadeloupe', 'hjb', '', '', 'Guadeloupe', '785817811', 'hgu', '400029', '', '', '', '1', '2016-04-27 13:34:02', 'ut', 'jgcuy', 'jhgjhbjhg', 'ut', 'jgcuy', 'jhgjhbjhg', '', '', '2000', 1500, 0, 500, 'INR', '', '', ''),
(203, 98, 'Rohan', 'Gada', 'rohanwohlig@gmail.com', '', '6868598', 'sdfg', 'Arunachal Pradesh', '474090', 'India', 'sdfg', '', '', 'India', '6868598', 'Arunachal Pradesh', '474090', '', '', '', '1', '2016-05-01 08:02:31', 'wqwwq', 'wqwwq', 'Uttaranchal', 'wqwwq', 'wqwwq', 'Uttaranchal', '', '', '96', 36, 0, 60, 'USD', '', '', ''),
(204, 1, 'Imran', 'Patel', 'imran@customcricketcompany.com', '', '9820579300', 'uyg', 'fdsc', '78946132', 'Guadeloupe', 'uyg', '', '', 'Guadeloupe', '9820579300', 'fdsc', '78946132', '', '', '', '1', '2016-05-10 07:31:36', 'daugvy', 'vyp', 'g', 'daugvy', 'vyp', 'g', '', '', '1250', 750, 0, 500, 'INR', '', '', ''),
(205, 1, 'Imran', 'Patel', 'imran@customcricketcompany.com', '', '9820579300', 'uyg', 'fdsc', '78946132', 'Guadeloupe', 'uyg', '', '', 'Guadeloupe', '9820579300', 'fdsc', '78946132', '', '', '', '2', '2016-05-10 07:33:41', 'daugvy', 'vyp', 'g', 'daugvy', 'vyp', 'g', '1462865543951', '', '1250', 750, 0, 500, 'INR', '', '', ''),
(206, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-05-10 13:05:08', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', ''),
(207, 98, 'Rohan', 'Gada', 'rohanwohlig@gmail.com', '', '97894221', 'sdfg', 'Arunachal Pradesh', '474090', 'India', 'sdfg', '', '', 'India', '97894221', 'Arunachal Pradesh', '474090', '', '', '', '1', '2016-05-10 13:05:09', 'wqwwq', 'wqwwq', 'Uttaranchal', 'wqwwq', 'wqwwq', 'Uttaranchal', '', '', '2000', 1500, 0, 500, 'INR', '', '', ''),
(208, 57, 'vinod', 'beloshe', 'vinodwohlig@gmail.com', '', '121221212', 'df', 'sdfsd', '3423', 'Armenia', 'df', '', '', 'Armenia', '121221212', 'sdfsd', '3423', '', '', '', '1', '2016-05-10 13:09:50', 'sdf', 'sdf', 'dfs', 'sdf', 'sdf', 'dfs', '', '', '2000', 1500, 0, 500, 'INR', '', '', ''),
(209, 57, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-05-10 13:09:52', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', ''),
(210, 98, 'Rohan', 'Gada', 'rohanwohlig@gmail.com', '', '123456', 'sdfg', 'Arunachal Pradesh', '474090', 'India', 'sdfg', '', '', 'India', '123456', 'Arunachal Pradesh', '474090', '', '', '', '1', '2016-05-10 13:11:36', 'wqwwq', 'wqwwq', 'Uttaranchal', 'wqwwq', 'wqwwq', 'Uttaranchal', '', '', '2000', 1500, 0, 500, 'INR', '', '', ''),
(211, 57, 'vinod', 'beloshe', 'vinodwohlig@gmail.com', '', '9898989898', 'city', 'mah', '400080', 'India', 'city', '', '', 'India', '9898989898', 'mah', '400080', '', '', '', '1', '2016-05-11 05:37:33', 'bldng', 'street', 'city', 'bldng', 'street', 'city', '', '', '2000', 1500, 0, 500, 'INR', '', '', ''),
(212, 56, 'Digvijay', 'Kathiwada', 'dkathiwada@gmail.com', '', '9867671119', 'mumbai', 'mh', '400026', 'India', 'mumbai', '', '', 'India', '9867671119', 'mh', '400026', '', '', '', '1', '2016-05-13 06:46:17', 'melange', '33 altamount', 'bob', 'melange', '33 altamount', 'bob', '', '', '18300', 18300, 0, 0, 'INR', '', '', ''),
(213, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '9898989898', 'thane', 'maharashtra', '421201', 'India', 'thane', '', '', 'India', '9898989898', 'maharashtra', '421201', '', '', '', '1', '2016-05-20 08:13:55', 'varadvinayak soc', 'kjhk', 'maharashtra', 'varadvinayak soc', 'kjhk', 'maharashtra', '', '', '1250', 750, 0, 500, 'INR', '', '', ''),
(214, 0, 'Imran', 'PATEL', 'imranpatel42@gmail.com', '', '9820579300', 'Mumbai', 'Maharastra', '400018', 'India', 'Mumbai', '', '', 'India', '9820579300', 'Maharastra', '400018', '', '', '', '1', '2016-05-24 10:56:01', '6 MERRYLAND, 4', '6 DR R G THADANI RD, WORLI', 'Flora Restaurant', '6 MERRYLAND, 4', '6 DR R G THADANI RD, WORLI', 'Flora Restaurant', '', '', '1250', 750, 0, 500, 'INR', '', '', ''),
(215, 57, 'vinod', 'beloshe', 'vinodwohlig@gmail.com', '', '121212', 'city', 'mah', '400080', 'India', 'city', '', '', 'India', '121212', 'mah', '400080', '', '', '', '1', '2016-05-24 11:59:34', 'bldng', 'street', 'city', 'bldng', 'street', 'city', '', '', '2000', 1500, 0, 500, 'INR', '', '', ''),
(216, 57, 'vinod', 'beloshe', 'vinodwohlig@gmail.com', '', '2121200', 'city', 'mah', '400080', 'India', 'city', '', '', 'India', '2121200', 'mah', '400080', '', '', '', '1', '2016-05-24 12:28:35', 'bldng', 'street', 'city', 'bldng', 'street', 'city', '', '', '2000', 1500, 0, 500, 'INR', '', '', ''),
(217, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-05-24 12:29:29', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', ''),
(218, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-05-24 12:30:09', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', ''),
(219, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-05-24 12:30:57', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', ''),
(220, 57, 'vinod', 'beloshe', 'vinodwohlig@gmail.com', '', '122', 'city', 'mah', '400080', 'India', 'city', '', '', 'India', '122', 'mah', '400080', '', '', '', '1', '2016-05-24 12:31:07', 'bldng', 'street', 'city', 'bldng', 'street', 'city', '', '', '8650', 8650, 0, 0, 'INR', '', '', ''),
(221, 98, 'Rohan', 'Gada', 'rohanwohlig@gmail.com', '', '97368254641', 'sdfg', 'Arunachal Pradesh', '474090', 'India', 'sdfg', '', '', 'India', '97368254641', 'Arunachal Pradesh', '474090', '', '', '', '1', '2016-05-24 12:34:30', 'wqwwq', 'wqwwq', 'Uttaranchal', 'wqwwq', 'wqwwq', 'Uttaranchal', '', '', '2000', 1500, 0, 500, 'INR', '', '', ''),
(222, 57, 'vinod', 'beloshe', 'vinodwohlig@gmail.com', '', '121187', 'city', 'mah', '400080', 'India', 'city', '', '', 'India', '121187', 'mah', '400080', '', '', '', '1', '2016-05-24 12:43:40', 'bldng', 'street', 'city', 'bldng', 'street', 'city', '', '', '8650', 8650, 0, 0, 'INR', '', '', ''),
(223, 98, 'Rohan', 'Gada', 'rohanwohlig@gmail.com', '', '9768254461', 'sdfg', 'Arunachal Pradesh', '474090', 'India', 'sdfg', '', '', 'India', '9768254461', 'Arunachal Pradesh', '474090', '', '', '', '1', '2016-05-24 12:53:05', 'wqwwq', 'wqwwq', 'Uttaranchal', 'wqwwq', 'wqwwq', 'Uttaranchal', '', '', '23250', 23250, 0, 0, 'INR', '', '', ''),
(224, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-05-24 13:00:30', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', ''),
(225, 98, 'Rohan', 'Gada', 'rohanwohlig@gmail.com', '', '9768254461', 'sdfg', 'Arunachal Pradesh', '474090', 'India', 'sdfg', '', '', 'India', '9768254461', 'Arunachal Pradesh', '474090', '', '', '', '1', '2016-05-24 13:00:31', 'wqwwq', 'wqwwq', 'Uttaranchal', 'wqwwq', 'wqwwq', 'Uttaranchal', '', '', '14000', 14000, 0, 0, 'INR', '', '', ''),
(226, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-05-24 13:03:43', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', ''),
(227, 98, 'Rohan', 'Gada', 'rohanwohlig@gmail.com', '', '9768254461', 'sdfg', 'Arunachal Pradesh', '474090', 'India', 'sdfg', '', '', 'India', '9768254461', 'Arunachal Pradesh', '474090', '', '', '', '1', '2016-05-24 13:03:44', 'wqwwq', 'wqwwq', 'Uttaranchal', 'wqwwq', 'wqwwq', 'Uttaranchal', '', '', '2400', 1900, 0, 500, 'INR', '', '', ''),
(228, 57, 'vinod', 'beloshe', 'vinodwohlig@gmail.com', '', '89462', 'city', 'mah', '400080', 'India', 'city', '', '', 'India', '89462', 'mah', '400080', '', '', '', '1', '2016-05-24 13:11:47', 'bldng', 'street', 'city', 'bldng', 'street', 'city', '', '', '36000', 36000, 0, 0, 'INR', '', '', ''),
(229, 57, 'vinod', 'beloshe', 'vinodwohlig@gmail.com', '', '98741632', 'city', 'mah', '400080', 'India', 'city', '', '', 'India', '98741632', 'mah', '400080', '', '', '', '1', '2016-05-24 13:12:13', 'bldng', 'street', 'city', 'bldng', 'street', 'city', '', '', '36000', 36000, 0, 0, 'INR', '', '', ''),
(230, 57, 'vinod', 'beloshe', 'vinodwohlig@gmail.com', '', '984123', 'city', 'mah', '400080', 'India', 'city', '', '', 'India', '984123', 'mah', '400080', '', '', '', '1', '2016-05-24 13:12:51', 'bldng', 'street', 'city', 'bldng', 'street', 'city', '', '', '35000', 36000, 0, 0, 'INR', '', '', ''),
(231, 57, 'vinod', 'beloshe', 'vinodwohlig@gmail.com', '', '312312312', 'city', 'mah', '400080', 'India', 'city', '', '', 'India', '312312312', 'mah', '400080', '', '', '', '1', '2016-05-24 13:14:59', 'bldng', 'street', 'city', 'bldng', 'street', 'city', '', '', '35000', 36000, 0, 0, 'INR', '', '', ''),
(232, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-05-24 13:40:55', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', ''),
(233, 57, 'vinod', 'beloshe', 'vinodwohlig@gmail.com', '', '121212', 'city', 'mah', '400080', 'India', 'city', '', '', 'India', '121212', 'mah', '400080', '', '', '', '1', '2016-05-24 13:40:56', 'bldng', 'street', 'city', 'bldng', 'street', 'city', '', '', '35000', 36000, 1000, 0, 'INR', '', '', ''),
(234, 39, 'w', 'khjkJKHJKHK', '6847S@GMAIL.COM', '', '7213123', '4', '65', '64', 'Albania', '4', '', '', 'Albania', '7213123', '65', '64', '', '', '', '1', '2016-05-24 13:42:54', 'DASDAS', '646', 'SDA', 'DASDAS', '646', 'SDA', '', '', '2360', 2325, 465, 500, 'INR', '', '', ''),
(235, 108, 'Mark', 'Trenowden', 'cricketcurios@aol.com', '', '1732464870', 'Sevenoaks', 'Kent', 'TN13 2LH', 'United Kingdom', 'Sevenoaks', '', '', 'United Kingdom', '1732464870', 'Kent', 'TN13 2LH', '', '', '', '5', '2016-06-02 15:11:08', 'Copley Dene', '8 Kippington Road', 'Kippington Road', 'Copley Dene', '8 Kippington Road', 'Kippington Road', '1464880148955', '', '123', 88, 0, 35, 'GBP', '', '', ''),
(236, 108, 'Mark', 'Trenowden', 'cricketcurios@aol.com', '', '447711306720', 'Sevenoaks', 'Kent', 'TN13 2LH', 'United Kingdom', 'Sevenoaks', '', '', 'United Kingdom', '447711306720', 'Kent', 'TN13 2LH', '', '', '', '2', '2016-06-02 15:15:05', 'Copley Dene', '8 Kippington Road', 'Kippington Road', 'Copley Dene', '8 Kippington Road', 'Kippington Road', '1464880316493', '', '123', 88, 0, 35, 'GBP', '', '', ''),
(237, 0, 'Imran', 'PATEL', 'imran@customcricketcompany.com', '', '9820579300', 'Mumbai', 'Maharastra', '400018', 'India', 'Mumbai', '', '', 'India', '9820579300', 'Maharastra', '400018', '', '', '', '1', '2016-06-03 09:06:46', '6 MERRYLAND, 46 DR R G THADANI RD, WORLI', 'Worli', 'Flora', '6 MERRYLAND, 46 DR R G THADANI RD, WORLI', 'Worli', 'Flora', '', '', '123', 88, 0, 35, 'GBP', '', '', ''),
(238, 57, 'vinod', 'beloshe', 'vinodwohlig@gmail.com', '', '9021945077', 'city', 'mah', '400080', 'India', 'city', '', '', 'India', '9021945077', 'mah', '400080', '', '', '', '1', '2016-06-03 09:55:55', 'bldng', 'street', 'city', 'bldng', 'street', 'city', '', '', '600', 600, 0, 0, 'USD', '', '', ''),
(239, 57, 'vinod', 'beloshe', 'vinodwohlig@gmail.com', '', '5556545644', 'city', 'mah', '400080', 'India', 'city', '', '', 'India', '5556545644', 'mah', '400080', '', '', '', '1', '2016-06-03 09:57:43', 'bldng', 'street', 'city', 'bldng', 'street', 'city', '', '', '1100', 600, 0, 500, 'USD', '', '', ''),
(240, 0, 'Imran', 'PATEL', 'imran@customcricketcompany.com', '', '9820579300', 'Mumbai', 'Maharastra', '400018', 'India', 'Mumbai', '', '', 'India', '9820579300', 'Maharastra', '400018', '', '', '', '1', '2016-06-03 10:33:53', '6 MERRYLAND, 46 DR R G THADANI RD, WORLI', 'Worli', 'Flora Restaurant', '6 MERRYLAND, 46 DR R G THADANI RD, WORLI', 'Worli', 'Flora Restaurant', '', '', '25000', 25000, 0, 0, 'INR', '', '', ''),
(241, 98, 'Rohan', 'Gada', 'rohanwohlig@gmail.com', '', '6789645313', 'sdfg', 'Arunachal Pradesh', '474090', 'India', 'sdfg', '', '', 'India', '6789645313', 'Arunachal Pradesh', '474090', '', '', '', '5', '2016-06-06 05:26:02', 'wqwwq', 'wqwwq', 'Uttaranchal', 'wqwwq', 'wqwwq', 'Uttaranchal', '1465190732190', '', '3900', 3400, 0, 500, 'INR', '', '', ''),
(242, 57, 'vinod', 'beloshe', 'vinodwohlig@gmail.com', '', '97841', 'city', 'mah', '400080', 'India', 'city', '', '', 'India', '97841', 'mah', '400080', '', '', '', '1', '2016-06-07 09:53:15', 'bldng', 'street', 'city', 'bldng', 'street', 'city', '', '', '1250', 750, 0, 500, 'INR', '', '', ''),
(243, 57, 'vinod', 'beloshe', 'vinodwohlig@gmail.com', '', '57240', 'city', 'mah', '400080', 'India', 'city', '', '', 'India', '57240', 'mah', '400080', '', '', '', '1', '2016-06-07 10:01:55', 'bldng', 'street', 'city', 'bldng', 'street', 'city', '', '', '78', 18, 0, 60, 'USD', '', '', ''),
(244, 0, 'kjhlkjh', 'lkjh', 'Jagruti@hlig.com', '', '9898098789', 'kjhk', 'kjhlkjh', '987098', 'Anguilla', 'kjhk', '', '', 'Anguilla', '9898098789', 'kjhlkjh', '987098', '', '', '', '1', '2016-06-07 11:41:16', 'hlkjh', 'kjh', 'lkjhk', 'hlkjh', 'kjh', 'lkjhk', '', '', '1250', 750, 0, 500, 'INR', '', '', ''),
(245, 0, 'vinod', 'beloshe', 'vinodwohlig@gmail.com', '', '23', 'city', 'mah', '400080', 'India', 'city', '', '', 'India', '23', 'mah', '400080', '', '', '', '1', '2016-06-07 11:44:21', 'bldng', 'street', 'city', 'bldng', 'street', 'city', '', '', '25000', 25000, 0, 0, 'INR', '', '', ''),
(246, 0, 'vinod', 'beloshe', 'vinodwohlig@gmail.com', '', '22', 'city', 'mah', '400080', 'India', 'city', '', '', 'India', '22', 'mah', '400080', '', '', '', '1', '2016-06-07 11:47:41', 'bldng', 'street', 'city', 'bldng', 'street', 'city', '', '', '90', 40, 0, 50, 'EUR', '', '', ''),
(247, 0, 'vinod', 'beloshe', 'vinodwohlig@gmail.com', '', '12', 'city', 'mah', '400080', 'India', 'city', '', '', 'India', '12', 'mah', '400080', '', '', '', '5', '2016-06-07 12:17:36', 'bldng', 'street', 'city', 'bldng', 'street', 'city', '1465300584974', '', '2750', 2250, 0, 500, 'INR', '', '', ''),
(248, 39, 'w', 'khjkJKHJKHK', 'customcricketcompany@gmail.com', '', '4789', '4', '65', '64', 'Albania', '4', '', '', 'Albania', '4789', '65', '64', '', '', '', '1', '2016-06-07 12:06:46', 'DASDAS', '646', 'SDA', 'DASDAS', '646', 'SDA', '', '', '1450', 950, 0, 500, 'INR', '', '', '');
INSERT INTO `fynx_order` (`id`, `user`, `firstname`, `lastname`, `email`, `billingaddress`, `billingcontact`, `billingcity`, `billingstate`, `billingpincode`, `billingcountry`, `shippingcity`, `shippingaddress`, `shippingname`, `shippingcountry`, `shippingcontact`, `shippingstate`, `shippingpincode`, `trackingcode`, `defaultcurrency`, `shippingmethod`, `orderstatus`, `timestamp`, `billingline1`, `billingline2`, `billingline3`, `shippingline1`, `shippingline2`, `shippingline3`, `transactionid`, `paymentmode`, `finalamount`, `totalamount`, `discountamount`, `shippingamount`, `currency`, `payemail`, `paytype`, `payresponse`) VALUES
(249, 57, 'vinod', 'beloshe', 'vinodwohlig@gmail.com', '', '1323', 'city', 'mah', '400080', 'India', 'city', '', '', 'India', '1323', 'mah', '400080', '', '', '', '1', '2016-06-07 12:11:30', 'bldng', 'street', 'city', 'bldng', 'street', 'city', '', '', '54', 19, 0, 35, 'GBP', '', '', ''),
(250, 0, 'slknln', 'jkbjb', 'chirag@wohlig.com', '', '9820045678', 'dfghjkl', 'Maharashtra', '400022', 'India', 'dfghjkl', '', '', 'India', '9820045678', 'Maharashtra', '400022', '', '', '', '1', '2016-06-07 13:57:11', 'dfghjkl', 'dfghjkl', 'dfghjkl', 'dfghjkl', 'dfghjkl', 'dfghjkl', '', '', '4450', 3950, 0, 500, 'INR', '', '', ''),
(251, 0, 'slknln', 'jkbjb', 'chirag@wohlig.com', '', '9820045678', 'dfghjkl', 'Maharashtra', '400022', 'India', 'dfghjkl', '', '', 'India', '9820045678', 'Maharashtra', '400022', '', '', '', '1', '2016-06-07 14:07:49', 'dfghjkl', 'dfghjkl', 'dfghjkl', 'dfghjkl', 'dfghjkl', 'dfghjkl', '', '', '2000', 1500, 0, 500, 'INR', '', '', ''),
(252, 0, 'imran', 'patel', 'imran@customcricketcompany.com', '', '9820579300', 'Mumbai', 'Maharastra', '400018', 'India', 'Mumbai', '', '', 'India', '9820579300', 'Maharastra', '400018', '', '', '', '1', '2016-06-08 06:42:34', '6 Merryland,', 'Dr R G Thadani Road Worli Mumbai 18', 'Flora Restaurant', '6 Merryland,', 'Dr R G Thadani Road Worli Mumbai 18', 'Flora Restaurant', '', '', '25000', 25000, 0, 0, 'INR', '', '', ''),
(253, 0, 'Imran', 'Patel', 'imran@customcricketcompany.com', '', '9820579300', 'Mumbai', 'Maharastra', '400018', 'India', 'Mumbai', '', '', 'India', '9820579300', 'Maharastra', '400018', '', '', '', '1', '2016-06-08 06:43:18', '6 Merryland,', 'Dr R G Thadani Road Worli Mumbai 18', 'Flora Restaurant', '6 Merryland,', 'Dr R G Thadani Road Worli Mumbai 18', 'Flora Restaurant', '', '', '25000', 25000, 0, 0, 'INR', '', '', ''),
(254, 98, 'Rohan', 'Gada', 'rohanwohlig@gmail.com', '', '9798551', 'sdfg', 'Arunachal Pradesh', '474090', 'India', 'sdfg', '', '', 'India', '9798551', 'Arunachal Pradesh', '474090', '', '', '', '1', '2016-06-08 07:12:34', 'wqwwq', 'wqwwq', 'Uttaranchal', 'wqwwq', 'wqwwq', 'Uttaranchal', '', '', '88', 28, 0, 60, 'USD', '', '', ''),
(255, 98, 'Rohan', 'Gada', 'rohanwohlig@gmail.com', '', '123456', 'sdfg', 'Arunachal Pradesh', '474090', 'India', 'sdfg', '', '', 'India', '123456', 'Arunachal Pradesh', '474090', '', '', '', '1', '2016-06-08 11:01:56', 'wqwwq', 'wqwwq', 'Uttaranchal', 'wqwwq', 'wqwwq', 'Uttaranchal', '', '', '124', 64, 0, 60, 'USD', '', '', ''),
(256, 100, 'Rustom', 'Chowna', 'rustom.chowna@gmail.com', '', '7726638468', 'London', 'London', 'E14 3WE', 'United Kingdom', 'London', '', '', 'United Kingdom', '7726638468', 'London', 'E14 3WE', '', '', '', '2', '2016-06-08 14:43:14', '215', 'St. Davids Square', 'Island gardens', '215', 'St. Davids Square', 'Island gardens', 'O-2AH226195Y189433F', '', '55', 20, 0, 35, 'GBP', 'rustom.chowna@gmail.com', 'Paypal', '{"get_ec":{"TOKEN":"EC-5EP65585WL336161V","BILLINGAGREEMENTACCEPTEDSTATUS":"0","CHECKOUTSTATUS":"PaymentActionNotInitiated","TIMESTAMP":"2016-06-08T14:42:59Z","CORRELATIONID":"fb5ae2688db9f","ACK":"Success","VERSION":"93","BUILD":"22708556","EMAIL":"rustom.chowna@gmail.com","PAYERID":"5ZCGDT2MUHJ3W","PAYERSTATUS":"verified","FIRSTNAME":"Rustom","LASTNAME":"Chowna","COUNTRYCODE":"GB","SHIPTOPHONENUM":"7726638468","ADDRESSSTATUS":"Confirmed","CURRENCYCODE":"GBP","AMT":"55.00","ITEMAMT":"20.00","SHIPPINGAMT":"35.00","HANDLINGAMT":"0.00","TAXAMT":"0.00","INVNUM":"256","INSURANCEAMT":"0.00","SHIPDISCAMT":"0.00","INSURANCEOPTIONOFFERED":"false","L_NAME0":"Crossfit","L_NUMBER0":"81","L_QTY0":"1","L_TAXAMT0":"0.00","L_AMT0":"20.00","PAYMENTREQUEST_0_CURRENCYCODE":"GBP","PAYMENTREQUEST_0_AMT":"55.00","PAYMENTREQUEST_0_ITEMAMT":"20.00","PAYMENTREQUEST_0_SHIPPINGAMT":"35.00","PAYMENTREQUEST_0_HANDLINGAMT":"0.00","PAYMENTREQUEST_0_TAXAMT":"0.00","PAYMENTREQUEST_0_INVNUM":"256","PAYMENTREQUEST_0_INSURANCEAMT":"0.00","PAYMENTREQUEST_0_SHIPDISCAMT":"0.00","PAYMENTREQUEST_0_SELLERPAYPALACCOUNTID":"digvijay@osians.com","PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED":"false","PAYMENTREQUEST_0_SHIPTOPHONENUM":"7726638468","PAYMENTREQUEST_0_ADDRESSSTATUS":"Confirmed","L_PAYMENTREQUEST_0_NAME0":"Crossfit","L_PAYMENTREQUEST_0_NUMBER0":"81","L_PAYMENTREQUEST_0_QTY0":"1","L_PAYMENTREQUEST_0_TAXAMT0":"0.00","L_PAYMENTREQUEST_0_AMT0":"20.00","PAYMENTREQUESTINFO_0_ERRORCODE":"0","ec_status":true},"do_ec":{"TOKEN":"EC-5EP65585WL336161V","SUCCESSPAGEREDIRECTREQUESTED":"false","TIMESTAMP":"2016-06-08T14:43:02Z","CORRELATIONID":"70ef5b493c794","ACK":"SuccessWithWarning","VERSION":"93","BUILD":"22708556","L_ERRORCODE0":"11607","L_SHORTMESSAGE0":"Duplicate Request","L_LONGMESSAGE0":"A successful transaction has already been completed for this token.","L_SEVERITYCODE0":"Warning","INSURANCEOPTIONSELECTED":"false","SHIPPINGOPTIONISDEFAULT":"false","PAYMENTINFO_0_TRANSACTIONID":"O-2AH226195Y189433F","PAYMENTINFO_0_TRANSACTIONTYPE":"expresscheckout","PAYMENTINFO_0_PAYMENTTYPE":"None","PAYMENTINFO_0_ORDERTIME":"2016-06-08T14:43:00Z","PAYMENTINFO_0_AMT":"55.00","PAYMENTINFO_0_TAXAMT":"0.00","PAYMENTINFO_0_CURRENCYCODE":"GBP","PAYMENTINFO_0_PAYMENTSTATUS":"Pending","PAYMENTINFO_0_PENDINGREASON":"order","PAYMENTINFO_0_REASONCODE":"None","PAYMENTINFO_0_PROTECTIONELIGIBILITY":"None","PAYMENTINFO_0_SECUREMERCHANTACCOUNTID":"5TDUU82LQFA7S","PAYMENTINFO_0_ERRORCODE":"0","PAYMENTINFO_0_ACK":"Success","ec_status":true},"do_auth":{"TRANSACTIONID":"01H10147RT425360R","AMT":"55.00","CURRENCYCODE":"GBP","TIMESTAMP":"2016-06-08T14:43:08Z","CORRELATIONID":"c3aaed02e2478","ACK":"Success","VERSION":"93","BUILD":"22708556","PAYMENTSTATUS":"Pending","PENDINGREASON":"authorization","PROTECTIONELIGIBILITY":"Ineligible","PROTECTIONELIGIBILITYTYPE":"None","ec_status":true},"do_capture":{"AUTHORIZATIONID":"01H10147RT425360R","TIMESTAMP":"2016-06-08T14:43:12Z","CORRELATIONID":"9b15827e8f888","ACK":"Failure","VERSION":"93","BUILD":"22708556","L_ERRORCODE0":"10602","L_SHORTMESSAGE0":"Authorization completed.","L_LONGMESSAGE0":"Authorization has already been completed.","L_SEVERITYCODE0":"Error","ec_status":false},"again_get_ec":{"TOKEN":"EC-5EP65585WL336161V","BILLINGAGREEMENTACCEPTEDSTATUS":"0","CHECKOUTSTATUS":"PaymentActionCompleted","TIMESTAMP":"2016-06-08T14:43:13Z","CORRELATIONID":"3010f3f7f16ed","ACK":"Success","VERSION":"93","BUILD":"22708556","EMAIL":"rustom.chowna@gmail.com","PAYERID":"5ZCGDT2MUHJ3W","PAYERSTATUS":"verified","FIRSTNAME":"Rustom","LASTNAME":"Chowna","COUNTRYCODE":"GB","ADDRESSSTATUS":"Confirmed","CURRENCYCODE":"GBP","AMT":"55.00","SHIPPINGAMT":"0.00","HANDLINGAMT":"0.00","TAXAMT":"0.00","INVNUM":"256","INSURANCEAMT":"0.00","SHIPDISCAMT":"0.00","TRANSACTIONID":"O-2AH226195Y189433F","INSURANCEOPTIONOFFERED":"false","PAYMENTREQUEST_0_CURRENCYCODE":"GBP","PAYMENTREQUEST_0_AMT":"55.00","PAYMENTREQUEST_0_SHIPPINGAMT":"0.00","PAYMENTREQUEST_0_HANDLINGAMT":"0.00","PAYMENTREQUEST_0_TAXAMT":"0.00","PAYMENTREQUEST_0_INVNUM":"256","PAYMENTREQUEST_0_INSURANCEAMT":"0.00","PAYMENTREQUEST_0_SHIPDISCAMT":"0.00","PAYMENTREQUEST_0_TRANSACTIONID":"O-2AH226195Y189433F","PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED":"false","PAYMENTREQUEST_0_ADDRESSSTATUS":"Confirmed","PAYMENTREQUESTINFO_0_TRANSACTIONID":"O-2AH226195Y189433F","PAYMENTREQUESTINFO_0_ERRORCODE":"0","ec_status":true}}'),
(257, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-06-08 14:41:49', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', ''),
(258, 108, 'Mark', 'Trenowden', 'cricketcurios@aol.com', '', '447711306720', 'Sevenoaks', 'Kent', 'TN13 2LH', 'United Kingdom', 'Sevenoaks', '', '', 'United Kingdom', '447711306720', 'Kent', 'TN13 2LH', '', '', '', '1', '2016-06-08 16:51:03', 'Copley Dene', '8 Kippington Road', 'Kippington Road', 'Copley Dene', '8 Kippington Road', 'Kippington Road', '', '', '123', 88, 0, 35, 'GBP', '', '', ''),
(259, 108, 'Mark', 'Trenowden', 'cricketcurios@aol.com', '', '447711306720', 'Sevenoaks', 'Kent', 'TN13 2LH', 'United Kingdom', 'Sevenoaks', '', '', 'United Kingdom', '447711306720', 'Kent', 'TN13 2LH', '', '', '', '2', '2016-06-08 16:52:55', 'Copley Dene', '8 Kippington Road', 'Kippington Road', 'Copley Dene', '8 Kippington Road', 'Kippington Road', 'O-0CG18162NX1819827', '', '123', 88, 0, 35, 'GBP', 'cricketcurios@aol.com', 'Paypal', '{"get_ec":{"TOKEN":"EC-3YH68870PR640050J","BILLINGAGREEMENTACCEPTEDSTATUS":"0","CHECKOUTSTATUS":"PaymentActionNotInitiated","TIMESTAMP":"2016-06-08T16:52:46Z","CORRELATIONID":"de81e295ee347","ACK":"Success","VERSION":"93","BUILD":"22708556","EMAIL":"cricketcurios@aol.com","PAYERID":"Z9ATBQ92Q4VUG","PAYERSTATUS":"verified","FIRSTNAME":"Richard","LASTNAME":"Trenowden","COUNTRYCODE":"GB","SHIPTOPHONENUM":"447711306720","ADDRESSSTATUS":"Confirmed","CURRENCYCODE":"GBP","AMT":"123.00","ITEMAMT":"88.00","SHIPPINGAMT":"35.00","HANDLINGAMT":"0.00","TAXAMT":"0.00","INVNUM":"259","INSURANCEAMT":"0.00","SHIPDISCAMT":"0.00","INSURANCEOPTIONOFFERED":"false","L_NAME0":"Proton Club","L_NUMBER0":"175","L_QTY0":"1","L_TAXAMT0":"0.00","L_AMT0":"88.00","PAYMENTREQUEST_0_CURRENCYCODE":"GBP","PAYMENTREQUEST_0_AMT":"123.00","PAYMENTREQUEST_0_ITEMAMT":"88.00","PAYMENTREQUEST_0_SHIPPINGAMT":"35.00","PAYMENTREQUEST_0_HANDLINGAMT":"0.00","PAYMENTREQUEST_0_TAXAMT":"0.00","PAYMENTREQUEST_0_INVNUM":"259","PAYMENTREQUEST_0_INSURANCEAMT":"0.00","PAYMENTREQUEST_0_SHIPDISCAMT":"0.00","PAYMENTREQUEST_0_SELLERPAYPALACCOUNTID":"digvijay@osians.com","PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED":"false","PAYMENTREQUEST_0_SHIPTOPHONENUM":"447711306720","PAYMENTREQUEST_0_ADDRESSSTATUS":"Confirmed","L_PAYMENTREQUEST_0_NAME0":"Proton Club","L_PAYMENTREQUEST_0_NUMBER0":"175","L_PAYMENTREQUEST_0_QTY0":"1","L_PAYMENTREQUEST_0_TAXAMT0":"0.00","L_PAYMENTREQUEST_0_AMT0":"88.00","PAYMENTREQUESTINFO_0_ERRORCODE":"0","ec_status":true},"do_ec":{"TOKEN":"EC-3YH68870PR640050J","SUCCESSPAGEREDIRECTREQUESTED":"false","TIMESTAMP":"2016-06-08T16:52:47Z","CORRELATIONID":"ed1b07fe6366b","ACK":"Success","VERSION":"93","BUILD":"22708556","INSURANCEOPTIONSELECTED":"false","SHIPPINGOPTIONISDEFAULT":"false","PAYMENTINFO_0_TRANSACTIONID":"O-0CG18162NX1819827","PAYMENTINFO_0_TRANSACTIONTYPE":"expresscheckout","PAYMENTINFO_0_PAYMENTTYPE":"None","PAYMENTINFO_0_ORDERTIME":"2016-06-08T16:52:47Z","PAYMENTINFO_0_AMT":"123.00","PAYMENTINFO_0_TAXAMT":"0.00","PAYMENTINFO_0_CURRENCYCODE":"GBP","PAYMENTINFO_0_PAYMENTSTATUS":"Pending","PAYMENTINFO_0_PENDINGREASON":"order","PAYMENTINFO_0_REASONCODE":"None","PAYMENTINFO_0_PROTECTIONELIGIBILITY":"None","PAYMENTINFO_0_SECUREMERCHANTACCOUNTID":"5TDUU82LQFA7S","PAYMENTINFO_0_ERRORCODE":"0","PAYMENTINFO_0_ACK":"Success","ec_status":true},"do_auth":{"TRANSACTIONID":"22B6978479723872G","AMT":"123.00","CURRENCYCODE":"GBP","TIMESTAMP":"2016-06-08T16:52:50Z","CORRELATIONID":"8a60ce5767ee","ACK":"Success","VERSION":"93","BUILD":"22708556","PAYMENTSTATUS":"Pending","PENDINGREASON":"authorization","PROTECTIONELIGIBILITY":"Ineligible","PROTECTIONELIGIBILITYTYPE":"None","ec_status":true},"do_capture":{"AUTHORIZATIONID":"22B6978479723872G","TIMESTAMP":"2016-06-08T16:52:54Z","CORRELATIONID":"fae44593dc951","ACK":"Success","VERSION":"93","BUILD":"22708556","TRANSACTIONID":"5K547831MH501521H","PARENTTRANSACTIONID":"22B6978479723872G","TRANSACTIONTYPE":"expresscheckout","PAYMENTTYPE":"instant","ORDERTIME":"2016-06-08T16:52:53Z","AMT":"123.00","FEEAMT":"5.61","TAXAMT":"0.00","CURRENCYCODE":"GBP","PAYMENTSTATUS":"Completed","PENDINGREASON":"None","REASONCODE":"None","PROTECTIONELIGIBILITY":"Ineligible","PROTECTIONELIGIBILITYTYPE":"None","ec_status":true},"again_get_ec":{"TOKEN":"EC-3YH68870PR640050J","BILLINGAGREEMENTACCEPTEDSTATUS":"0","CHECKOUTSTATUS":"PaymentActionCompleted","TIMESTAMP":"2016-06-08T16:52:54Z","CORRELATIONID":"2d30d3fa94093","ACK":"Success","VERSION":"93","BUILD":"22708556","EMAIL":"cricketcurios@aol.com","PAYERID":"Z9ATBQ92Q4VUG","PAYERSTATUS":"verified","FIRSTNAME":"Richard","LASTNAME":"Trenowden","COUNTRYCODE":"GB","ADDRESSSTATUS":"Confirmed","CURRENCYCODE":"GBP","AMT":"123.00","SHIPPINGAMT":"0.00","HANDLINGAMT":"0.00","TAXAMT":"0.00","INVNUM":"259","INSURANCEAMT":"0.00","SHIPDISCAMT":"0.00","TRANSACTIONID":"O-0CG18162NX1819827","INSURANCEOPTIONOFFERED":"false","PAYMENTREQUEST_0_CURRENCYCODE":"GBP","PAYMENTREQUEST_0_AMT":"123.00","PAYMENTREQUEST_0_SHIPPINGAMT":"0.00","PAYMENTREQUEST_0_HANDLINGAMT":"0.00","PAYMENTREQUEST_0_TAXAMT":"0.00","PAYMENTREQUEST_0_INVNUM":"259","PAYMENTREQUEST_0_INSURANCEAMT":"0.00","PAYMENTREQUEST_0_SHIPDISCAMT":"0.00","PAYMENTREQUEST_0_TRANSACTIONID":"O-0CG18162NX1819827","PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED":"false","PAYMENTREQUEST_0_ADDRESSSTATUS":"Confirmed","PAYMENTREQUESTINFO_0_TRANSACTIONID":"O-0CG18162NX1819827","PAYMENTREQUESTINFO_0_ERRORCODE":"0","ec_status":true}}'),
(260, 98, 'Rohan', 'Gada', 'rohanwohlig@gmail.com', '', '97692254461', 'sdfg', 'Arunachal Pradesh', '474090', 'India', 'sdfg', '', '', 'India', '97692254461', 'Arunachal Pradesh', '474090', '', '', '', '1', '2016-08-04 09:42:48', 'wqwwq', 'wqwwq', 'Uttaranchal', 'wqwwq', 'wqwwq', 'Uttaranchal', '', '', '1025', 525, 0, 500, 'INR', '', '', ''),
(261, 98, 'Rohan', 'Gada', 'rohanwohlig@gmail.com', '', '9768254461', 'sdfg', 'Arunachal Pradesh', '474090', 'India', 'sdfg', '', '', 'India', '9768254461', 'Arunachal Pradesh', '474090', '', '', '', '1', '2016-08-04 09:43:49', 'wqwwq', 'wqwwq', 'Uttaranchal', 'wqwwq', 'wqwwq', 'Uttaranchal', '', '', '1025', 525, 0, 500, 'INR', '', '', ''),
(262, 98, 'Rohan', 'Gada', 'rohanwohlig@gmail.com', '', '9768254461', 'sdfg', 'Arunachal Pradesh', '474090', 'India', 'sdfg', '', '', 'India', '9768254461', 'Arunachal Pradesh', '474090', '', '', '', '1', '2016-08-04 09:45:25', 'wqwwq', 'wqwwq', 'Uttaranchal', 'wqwwq', 'wqwwq', 'Uttaranchal', '', '', '1025', 525, 0, 500, 'INR', '', '', ''),
(263, 98, 'Rohan', 'Gada', 'rohanwohlig@gmail.com', '', '9768254461', 'sdfg', 'Arunachal Pradesh', '474090', 'India', 'sdfg', '', '', 'India', '9768254461', 'Arunachal Pradesh', '474090', '', '', '', '1', '2016-08-04 09:47:27', 'wqwwq', 'wqwwq', 'Uttaranchal', 'wqwwq', 'wqwwq', 'Uttaranchal', '', '', '1025', 525, 0, 500, 'EUR', '', '', ''),
(264, 98, 'Rohan', 'Gada', 'rohanwohlig@gmail.com', '', '9768254461', 'sdfg', 'Arunachal Pradesh', '474090', 'India', 'sdfg', '', '', 'India', '9768254461', 'Arunachal Pradesh', '474090', '', '', '', '1', '2016-08-04 09:47:43', 'wqwwq', 'wqwwq', 'Uttaranchal', 'wqwwq', 'wqwwq', 'Uttaranchal', '', '', '514', 14, 0, 500, 'INR', '', '', ''),
(265, 0, 'imran', 'patel', 'imran@customcricketcompany.com', '', '9820579300', 'jkhkjh', 'fsdfg', 'hkjhkj', 'India', 'jkhkjh', '', '', 'India', '9820579300', 'fsdfg', 'hkjhkj', '', '', '', '1', '2016-08-08 09:34:05', 'safhsakkj', 'hkjhk', 'jhkj', 'safhsakkj', 'hkjhk', 'jhkj', '', '', '108', 48, 0, 60, 'USD', '', '', ''),
(266, 56, 'Digvijay', 'Kathiwada', 'dkathiwada@gmail.com', '', '9867671119', 'mumbai', 'mh', '400026', 'India', 'mumbai', '', '', 'India', '9867671119', 'mh', '400026', '', '', '', '1', '2017-01-10 06:22:49', 'melange', '33 altamount', 'bob', 'melange', '33 altamount', 'bob', '', '', '4200', 3700, 0, 500, 'INR', '', '', ''),
(267, 115, 'Harsh', 'Thakkar', 'harsh.thakkar@wohlig.com', '', '5662295', 'b', 'b', 'b', 'Australia', 'b', '', '', 'Australia', '5662295', 'b', 'b', '', '', '', '5', '2017-02-10 11:45:06', 'a', 'b', 'b', 'a', 'b', 'b', '1486727050516', '', '1900', 1400, 0, 500, 'INR', '', '', ''),
(268, 115, 'Harsh', 'Thakkar', 'harsh.thakkar@wohlig.com', '', '44', 'b', 'b', 'b', 'Australia', 'b', '', '', 'Australia', '44', 'b', 'b', '', '', '', '1', '2017-02-10 11:53:03', 'a', 'b', 'b', 'a', 'b', 'b', '', '', '1900', 1400, 0, 500, 'INR', '', '', ''),
(269, 116, 'Salman', 'Hashmi', 'forsal.hash@gmail.com', '', '9870791804', 'Mumbai', 'Maharashtra', '400095', 'India', 'Mumbai', '', '', 'India', '9870791804', 'Maharashtra', '400095', '', '', '', '1', '2017-03-07 16:21:43', '86', 'Mind Space', 'Goregaon Sporta Club', '86', 'Mind Space', 'Goregaon Sporta Club', '', '', '8500', 8500, 0, 0, 'INR', '', '', ''),
(270, 107, 'Imran', 'Patel', 'wohlig@wohlig.com', '', '654654654', 'uyg', 'fdsc', '78946132', 'Guadeloupe', 'uyg', '', '', 'Guadeloupe', '654654654', 'fdsc', '78946132', '', '', '', '1', '2017-03-21 05:54:10', 'daugvy', 'vyp', 'g', 'daugvy', 'vyp', 'g', '', '', '45850', 45850, 0, 0, 'INR', '', '', ''),
(271, 107, 'Imran', 'Patel', 'wohlig@wohlig.com', '', '564651251', 'uyg', 'fdsc', '78946132', 'Guadeloupe', 'uyg', '', '', 'Guadeloupe', '564651251', 'fdsc', '78946132', '', '', '', '1', '2017-03-21 05:59:23', 'daugvy', 'vyp', 'g', 'daugvy', 'vyp', 'g', '', '', '1350', 850, 0, 500, 'INR', '', '', ''),
(272, 125, 'harshad', 'sh', 'harshad.shirsat@wohlig.com', '', '9092674456', 'Mumbai', 'Maharashtra', '400101', 'India', 'Mumbai', '', '', 'India', '9092674456', 'Maharashtra', '400101', '', '', '', '5', '2017-05-09 10:55:53', 'a-101', 'Thakur Village', 'Ciname', 'a-101', 'Thakur Village', 'Ciname', '1494327286961', '', '1350', 850, 0, 500, 'INR', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `fynx_orderitem`
--

CREATE TABLE IF NOT EXISTS `fynx_orderitem` (
`id` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `finalprice` int(11) NOT NULL,
  `design` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=357 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fynx_orderitem`
--

INSERT INTO `fynx_orderitem` (`id`, `discount`, `order`, `product`, `quantity`, `price`, `finalprice`, `design`) VALUES
(25, 0, 20, 1, 1, 800, 800, 6),
(26, 0, 28, 4, 1, 850, 850, 6),
(27, 0, 29, 8, 1, 1025, 1025, 4),
(28, 0, 30, 8, 1, 1025, 1025, 4),
(29, 0, 31, 8, 1, 1025, 1025, 4),
(30, 0, 32, 8, 1, 1025, 1025, 4),
(31, 0, 33, 8, 1, 1025, 1025, 4),
(32, 0, 34, 8, 1, 1025, 1025, 4),
(33, 0, 35, 8, 1, 1025, 1025, 4),
(34, 0, 36, 8, 1, 1025, 1025, 4),
(35, 0, 37, 8, 1, 1025, 1025, 4),
(36, 0, 38, 8, 1, 1025, 1025, 4),
(37, 0, 39, 8, 1, 1025, 1025, 4),
(38, 0, 39, 4, 1, 850, 850, 0),
(39, 0, 41, 8, 1, 1025, 0, 4),
(40, 0, 41, 14, 4, 799, 0, 4),
(41, 0, 41, 5, 1, 485, 0, 4),
(42, 0, 41, 4, 1, 850, 0, 0),
(43, 0, 41, 16, 4, 799, 0, 4),
(44, 0, 41, 4, 1, 850, 0, 0),
(45, 0, 42, 8, 1, 1025, 1025, 4),
(46, 0, 42, 4, 1, 850, 850, 0),
(47, 0, 43, 8, 1, 1025, 1025, 4),
(48, 0, 43, 4, 1, 850, 850, 0),
(49, 0, 44, 8, 1, 1025, 1025, 4),
(50, 0, 44, 4, 1, 850, 850, 0),
(51, 0, 45, 8, 1, 1025, 1025, 4),
(52, 0, 45, 4, 1, 850, 850, 0),
(53, 0, 46, 8, 1, 1025, 1025, 4),
(54, 0, 46, 4, 1, 850, 850, 0),
(55, 0, 47, 8, 1, 1025, 1025, 4),
(56, 0, 48, 8, 1, 1025, 1025, 4),
(57, 0, 49, 8, 1, 1025, 1025, 4),
(58, 0, 50, 8, 1, 1025, 1025, 4),
(59, 0, 51, 8, 1, 1025, 1025, 4),
(60, 0, 53, 8, 1, 1025, 1025, 4),
(61, 0, 54, 8, 1, 1025, 1025, 4),
(62, 0, 56, 8, 1, 1025, 1025, 4),
(63, 0, 57, 8, 1, 1025, 1025, 4),
(64, 0, 58, 8, 1, 1025, 1025, 4),
(65, 0, 59, 8, 1, 1025, 1025, 4),
(66, 0, 60, 8, 1, 1025, 1025, 4),
(67, 0, 62, 4, 1, 850, 0, 0),
(68, 0, 62, 8, 2, 1025, 0, 4),
(69, 0, 64, 8, 1, 1025, 1025, 4),
(70, 0, 65, 8, 1, 1025, 1025, 4),
(71, 0, 66, 8, 1, 1025, 1025, 4),
(72, 0, 67, 8, 1, 1025, 1025, 4),
(73, 0, 69, 8, 1, 1025, 1025, 4),
(74, 0, 70, 8, 1, 1025, 1025, 4),
(75, 0, 71, 8, 1, 1025, 1025, 4),
(76, 0, 72, 8, 1, 1025, 0, 6),
(77, 0, 74, 4, 1, 850, 0, 0),
(78, 0, 74, 8, 8, 1025, 0, 4),
(79, 0, 75, 4, 1, 850, 0, 0),
(80, 0, 75, 8, 8, 1025, 0, 4),
(81, 0, 76, 8, 1, 1025, 1025, 4),
(82, 0, 77, 4, 1, 850, 0, 0),
(83, 0, 77, 8, 8, 1025, 0, 4),
(84, 0, 78, 8, 1, 1025, 1025, 4),
(85, 0, 79, 8, 1, 1025, 1025, 6),
(86, 0, 80, 8, 1, 1025, 1025, 4),
(87, 0, 81, 8, 1, 1025, 1025, 4),
(88, 0, 82, 8, 1, 1025, 1025, 4),
(89, 0, 83, 8, 1, 1025, 1025, 4),
(90, 0, 84, 8, 1, 1025, 1025, 4),
(91, 0, 85, 8, 1, 1025, 1025, 4),
(92, 0, 86, 8, 1, 1025, 1025, 4),
(93, 0, 87, 5, 10, 485, 4850, 4),
(94, 0, 87, 5, 10, 485, 4850, 4),
(95, 0, 88, 5, 10, 485, 4850, 4),
(96, 0, 88, 5, 10, 485, 4850, 4),
(97, 0, 89, 5, 10, 485, 4850, 4),
(98, 0, 89, 5, 10, 485, 4850, 4),
(99, 0, 90, 5, 10, 485, 4850, 4),
(100, 0, 90, 5, 10, 485, 4850, 4),
(101, 0, 91, 5, 1, 485, 485, 4),
(102, 0, 91, 5, 1, 485, 485, 4),
(103, 0, 92, 5, 1, 485, 485, 4),
(104, 0, 92, 5, 1, 485, 485, 4),
(105, 0, 93, 5, 1, 485, 485, 4),
(106, 0, 95, 5, 1, 485, 485, 4),
(107, 0, 96, 5, 1, 485, 485, 4),
(108, 0, 97, 5, 1, 485, 485, 4),
(109, 0, 98, 5, 1, 485, 485, 4),
(110, 0, 53, 6, 1, 1700, 1700, 0),
(111, 0, 59, 21, 1, 400, 400, 0),
(112, 0, 61, 21, 1, 400, 400, 0),
(113, 0, 63, 6, 2, 1700, 3400, 0),
(114, 0, 63, 48, 5, 500, 2500, 0),
(115, 0, 65, 6, 2, 1700, 3400, 0),
(116, 0, 65, 48, 5, 500, 2500, 0),
(117, 0, 65, 49, 6, 550, 3300, 0),
(118, 0, 66, 48, 5, 500, 2500, 0),
(119, 0, 67, 6, 2, 1700, 3400, 0),
(120, 0, 67, 48, 5, 500, 2500, 0),
(121, 0, 67, 49, 6, 550, 3300, 0),
(122, 0, 69, 6, 2, 1700, 3400, 0),
(123, 0, 69, 48, 5, 500, 2500, 0),
(124, 0, 69, 49, 6, 550, 3300, 0),
(125, 0, 71, 6, 2, 1700, 3400, 0),
(126, 0, 71, 48, 5, 500, 2500, 0),
(127, 0, 71, 49, 6, 550, 3300, 0),
(128, 0, 73, 6, 2, 1700, 3400, 0),
(129, 0, 73, 48, 5, 500, 2500, 0),
(130, 0, 73, 49, 6, 550, 3300, 0),
(131, 0, 74, 48, 11, 500, 5500, 0),
(132, 0, 75, 48, 11, 500, 5500, 0),
(133, 0, 77, 48, 11, 400, 4400, 0),
(134, 0, 77, 10, 6, 1000, 6000, 0),
(135, 0, 77, 33, 6, 1750, 10500, 0),
(136, 0, 78, 48, 11, 400, 4400, 0),
(137, 0, 78, 10, 6, 1000, 6000, 0),
(138, 0, 78, 33, 6, 1750, 10500, 0),
(139, 0, 79, 48, 11, 400, 4400, 0),
(140, 0, 79, 10, 6, 1000, 6000, 0),
(141, 0, 79, 33, 6, 1750, 10500, 0),
(142, 0, 81, 10, 6, 1000, 6000, 0),
(143, 0, 81, 33, 6, 1750, 10500, 0),
(144, 0, 82, 10, 6, 1000, 6000, 0),
(145, 0, 82, 33, 6, 1750, 10500, 0),
(146, 0, 84, 10, 6, 1000, 6000, 0),
(147, 0, 84, 33, 6, 1750, 10500, 0),
(148, 0, 85, 10, 6, 1000, 6000, 0),
(149, 0, 85, 33, 6, 1750, 10500, 0),
(150, 0, 86, 10, 6, 1000, 6000, 0),
(151, 0, 86, 33, 6, 1750, 10500, 0),
(152, 0, 87, 10, 1, 1000, 1000, 0),
(153, 0, 88, 10, 1, 1000, 1000, 0),
(154, 0, 89, 10, 5, 800, 4000, 0),
(155, 0, 90, 31, 6, 3000, 18000, 0),
(156, 0, 90, 52, 6, 850, 5100, 0),
(157, 0, 92, 11, 5, 500, 2500, 0),
(158, 0, 92, 33, 6, 1750, 10500, 0),
(159, 0, 94, 11, 5, 500, 2500, 0),
(160, 0, 94, 33, 6, 1750, 10500, 0),
(161, 0, 98, 11, 5, 500, 2500, 0),
(162, 0, 98, 33, 6, 1750, 10500, 0),
(163, 0, 99, 11, 5, 500, 2500, 0),
(164, 0, 99, 33, 6, 1750, 10500, 0),
(165, 0, 100, 11, 5, 500, 2500, 0),
(166, 0, 100, 33, 6, 1750, 10500, 0),
(167, 0, 101, 11, 5, 500, 2500, 0),
(168, 0, 101, 33, 6, 1750, 10500, 0),
(169, 0, 102, 11, 5, 500, 2500, 0),
(170, 0, 102, 33, 6, 1750, 10500, 0),
(171, 0, 103, 11, 5, 500, 2500, 0),
(172, 0, 103, 33, 6, 1750, 10500, 0),
(173, 0, 108, 48, 5, 400, 2000, 0),
(174, 0, 109, 6, 5, 1500, 7500, 0),
(175, 0, 109, 33, 6, 1750, 10500, 0),
(176, 0, 110, 48, 5, 400, 2000, 0),
(177, 0, 111, 48, 5, 400, 2000, 0),
(178, 0, 112, 49, 2, 500, 1000, 0),
(179, 0, 113, 10, 3, 800, 2400, 0),
(180, 0, 115, 48, 33, 400, 13200, 0),
(181, 0, 116, 6, 2, 1500, 3000, 0),
(182, 0, 116, 33, 6, 1750, 10500, 0),
(183, 0, 118, 7, 5, 660, 3300, 0),
(184, 0, 118, 118, 2, 3250, 6500, 0),
(185, 0, 120, 6, 5, 660, 3300, 0),
(186, 0, 121, 21, 4, 660, 2640, 0),
(187, 0, 122, 6, 5, 660, 3300, 0),
(188, 0, 124, 7, 5, 660, 3300, 0),
(189, 0, 124, 118, 2, 3250, 6500, 0),
(190, 0, 125, 6, 1, 660, 660, 0),
(191, 0, 127, 6, 1, 660, 660, 0),
(192, 0, 127, 122, 1, 1900, 1900, 0),
(193, 0, 129, 6, 1, 660, 660, 0),
(194, 0, 129, 122, 1, 1900, 1900, 0),
(195, 0, 131, 6, 1, 660, 660, 0),
(196, 0, 131, 122, 1, 1900, 1900, 0),
(197, 0, 132, 6, 1, 660, 660, 0),
(198, 0, 132, 122, 1, 1900, 1900, 0),
(199, 0, 133, 6, 1, 660, 660, 0),
(200, 0, 133, 122, 1, 1900, 1900, 0),
(201, 0, 134, 6, 1, 660, 660, 0),
(202, 0, 134, 122, 1, 1900, 1900, 0),
(203, 0, 134, 22, 5, 660, 3300, 0),
(204, 0, 136, 6, 1, 660, 660, 0),
(205, 0, 136, 122, 1, 1900, 1900, 0),
(206, 0, 136, 22, 4, 660, 2640, 0),
(207, 0, 137, 140, 2, 1150, 2300, 0),
(208, 0, 137, 128, 1, 6500, 6500, 0),
(209, 0, 138, 140, 2, 1150, 2300, 0),
(210, 0, 138, 128, 2, 6500, 13000, 0),
(211, 0, 138, 126, 1, 2500, 2500, 0),
(212, 0, 140, 6, 1, 660, 660, 0),
(213, 0, 141, 6, 4, 660, 2640, 0),
(214, 0, 141, 128, 5, 6500, 32500, 0),
(215, 0, 141, 6, 3, 660, 1980, 0),
(216, 0, 142, 33, 10, 650, 6500, 0),
(217, 0, 142, 46, 1, 950, 950, 0),
(218, 0, 144, 33, 10, 650, 6500, 0),
(219, 0, 146, 7, 3, 660, 1980, 0),
(220, 0, 146, 2, 2, 660, 1320, 0),
(221, 0, 147, 7, 2, 660, 1320, 0),
(222, 0, 147, 1, 3, 660, 1980, 0),
(223, 0, 149, 31, 6, 650, 3900, 0),
(224, 0, 149, 122, 1, 1900, 1900, 0),
(225, 0, 150, 7, 2, 660, 1320, 0),
(226, 0, 150, 1, 3, 660, 1980, 0),
(227, 0, 152, 9, 15, 660, 9900, 0),
(228, 0, 153, 93, 8, 800, 6400, 0),
(229, 0, 153, 118, 7, 3250, 22750, 0),
(230, 0, 154, 1, 2, 660, 1320, 0),
(231, 0, 155, 60, 1, 900, 900, 0),
(232, 0, 156, 118, 5, 3250, 16250, 0),
(233, 0, 157, 118, 5, 3250, 16250, 0),
(234, 0, 158, 118, 5, 3250, 16250, 0),
(235, 0, 159, 118, 5, 3250, 16250, 0),
(236, 0, 160, 118, 3, 3250, 9750, 0),
(237, 0, 161, 6, 2, 660, 1320, 0),
(238, 0, 163, 1, 1, 660, 660, 0),
(239, 0, 164, 7, 2, 660, 1320, 0),
(240, 0, 164, 1, 3, 660, 1980, 0),
(241, 0, 164, 3, 2, 660, 1320, 0),
(242, 0, 165, 6, 1, 660, 660, 0),
(243, 0, 166, 6, 2, 660, 1320, 0),
(244, 0, 167, 6, 1, 660, 660, 0),
(245, 0, 168, 1, 2, 660, 1320, 0),
(246, 0, 169, 1, 2, 660, 1320, 0),
(247, 0, 170, 1, 2, 660, 1320, 0),
(248, 0, 171, 140, 1, 1150, 1150, 0),
(249, 0, 172, 1, 2, 660, 1320, 0),
(250, 0, 173, 1, 2, 660, 1320, 0),
(251, 0, 174, 1, 5, 660, 3300, 0),
(252, 0, 175, 41, 1, 25, 25, 0),
(253, 0, 175, 127, 1, 68, 68, 0),
(254, 0, 175, 129, 1, 75, 75, 0),
(255, 0, 176, 130, 5, 1150, 5750, 0),
(256, 0, 177, 140, 2, 1150, 2300, 0),
(257, 0, 177, 128, 2, 6500, 13000, 0),
(258, 0, 177, 126, 1, 2500, 2500, 0),
(259, 0, 177, 112, 1, 425, 425, 0),
(260, 0, 178, 140, 2, 1150, 2300, 0),
(261, 0, 178, 128, 2, 6500, 13000, 0),
(262, 0, 178, 126, 1, 2500, 2500, 0),
(263, 0, 178, 112, 1, 425, 425, 0),
(264, 0, 180, 1, 2, 660, 1320, 0),
(265, 0, 181, 1, 2, 660, 1320, 0),
(266, 0, 183, 111, 5, 475, 2375, 0),
(267, 0, 184, 31, 1, 750, 750, 0),
(268, 0, 185, 130, 1, 1200, 1200, 0),
(269, 0, 186, 130, 1, 1200, 1200, 0),
(270, 0, 187, 130, 1, 1200, 1200, 0),
(271, 0, 188, 130, 1, 1200, 1200, 0),
(272, 0, 189, 192, 1, 1, 1, 0),
(273, 0, 190, 1, 2, 750, 1500, 0),
(274, 0, 191, 2, 7, 750, 5250, 0),
(275, 0, 192, 128, 1, 7000, 7000, 0),
(276, 0, 193, 6, 5, 750, 3750, 0),
(277, 0, 194, 2, 2, 750, 1500, 0),
(278, 0, 195, 11, 6, 750, 4500, 0),
(279, 0, 196, 1, 2, 750, 1500, 0),
(280, 0, 197, 1, 2, 750, 1500, 0),
(281, 0, 198, 176, 1, 25000, 25000, 0),
(282, 0, 199, 81, 1, 775, 775, 0),
(283, 0, 199, 56, 1, 750, 750, 0),
(284, 0, 200, 1, 1, 750, 750, 0),
(285, 0, 201, 1, 3, 750, 2250, 0),
(286, 0, 202, 36, 2, 750, 1500, 0),
(287, 0, 203, 2, 2, 18, 36, 0),
(288, 0, 204, 1, 1, 750, 750, 0),
(289, 0, 205, 1, 1, 750, 750, 0),
(290, 0, 207, 2, 2, 750, 1500, 0),
(291, 0, 208, 1, 2, 750, 1500, 0),
(292, 0, 210, 2, 2, 750, 1500, 0),
(293, 0, 211, 1, 2, 750, 1500, 0),
(294, 0, 212, 128, 2, 7000, 14000, 0),
(295, 0, 212, 126, 1, 2500, 2500, 0),
(296, 0, 212, 129, 2, 900, 1800, 0),
(297, 0, 213, 6, 1, 750, 750, 0),
(298, 0, 214, 2, 1, 750, 750, 0),
(299, 0, 215, 1, 2, 750, 1500, 0),
(300, 0, 216, 1, 2, 750, 1500, 0),
(301, 0, 220, 166, 1, 750, 750, 0),
(302, 0, 220, 120, 2, 3950, 7900, 0),
(303, 0, 221, 2, 2, 750, 1500, 0),
(304, 0, 222, 166, 1, 750, 750, 0),
(305, 0, 222, 120, 2, 3950, 7900, 0),
(306, 0, 223, 2, 1, 750, 750, 0),
(307, 0, 223, 181, 1, 22500, 22500, 0),
(308, 0, 225, 128, 2, 7000, 14000, 0),
(309, 0, 227, 86, 2, 950, 1900, 0),
(310, 0, 228, 178, 2, 18000, 36000, 0),
(311, 0, 229, 178, 2, 18000, 36000, 0),
(312, 0, 230, 178, 2, 18000, 36000, 0),
(313, 0, 231, 178, 2, 18000, 36000, 0),
(314, 0, 233, 178, 2, 18000, 36000, 0),
(315, 0, 234, 145, 3, 775, 2325, 0),
(316, 0, 235, 175, 1, 88, 88, 0),
(317, 0, 236, 175, 1, 88, 88, 0),
(318, 0, 237, 175, 1, 88, 88, 0),
(319, 0, 238, 178, 2, 300, 600, 0),
(320, 0, 239, 178, 2, 300, 600, 0),
(321, 0, 240, 176, 1, 25000, 25000, 0),
(322, 0, 241, 86, 2, 950, 1900, 0),
(323, 0, 241, 6, 2, 750, 1500, 0),
(324, 0, 242, 4, 1, 750, 750, 0),
(325, 0, 243, 4, 1, 18, 18, 0),
(326, 0, 244, 21, 1, 750, 750, 0),
(327, 0, 245, 176, 1, 25000, 25000, 0),
(328, 0, 246, 91, 2, 20, 40, 0),
(329, 0, 247, 6, 3, 750, 2250, 0),
(330, 0, 248, 86, 1, 950, 950, 0),
(331, 0, 249, 4, 1, 19, 19, 0),
(332, 0, 250, 120, 1, 3950, 3950, 0),
(333, 0, 251, 6, 2, 750, 1500, 0),
(334, 0, 252, 176, 1, 25000, 25000, 0),
(335, 0, 253, 176, 1, 25000, 25000, 0),
(336, 0, 254, 113, 2, 14, 28, 0),
(337, 0, 255, 113, 2, 14, 28, 0),
(338, 0, 255, 6, 2, 18, 36, 0),
(339, 0, 256, 81, 1, 20, 20, 0),
(340, 0, 258, 175, 1, 88, 88, 0),
(341, 0, 259, 175, 1, 88, 88, 0),
(342, 0, 260, 113, 1, 525, 525, 0),
(343, 0, 261, 113, 1, 525, 525, 0),
(344, 0, 262, 113, 1, 525, 525, 0),
(345, 0, 263, 113, 1, 525, 525, 0),
(346, 0, 264, 113, 1, 14, 14, 0),
(347, 0, 265, 7, 2, 24, 48, 0),
(348, 0, 266, 126, 1, 2500, 2500, 0),
(349, 0, 266, 170, 1, 1200, 1200, 0),
(350, 0, 267, 57, 2, 700, 1400, 0),
(351, 0, 268, 57, 2, 700, 1400, 0),
(352, 0, 269, 3, 10, 850, 8500, 0),
(353, 0, 270, 26, 3, 15000, 45000, 0),
(354, 0, 270, 276, 1, 850, 850, 0),
(355, 0, 271, 257, 1, 850, 850, 0),
(356, 0, 272, 237, 1, 850, 850, 0);

-- --------------------------------------------------------

--
-- Table structure for table `fynx_product`
--

CREATE TABLE IF NOT EXISTS `fynx_product` (
`id` int(11) NOT NULL,
  `subcategory` int(11) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `visibility` varchar(255) NOT NULL,
  `INR` varchar(255) NOT NULL,
  `USD` varchar(255) DEFAULT NULL,
  `GBP` varchar(255) DEFAULT NULL,
  `EUR` varchar(255) DEFAULT NULL,
  `ZAF` varchar(255) DEFAULT NULL,
  `AUD` varchar(255) DEFAULT NULL,
  `NZD` varchar(255) DEFAULT NULL,
  `relatedproduct` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `sizechart` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `image1` varchar(255) DEFAULT NULL,
  `image2` varchar(255) DEFAULT NULL,
  `image3` varchar(255) DEFAULT NULL,
  `image4` varchar(255) DEFAULT NULL,
  `image5` varchar(255) DEFAULT NULL,
  `baseproduct` varchar(255) NOT NULL,
  `discountINR` varchar(50) DEFAULT NULL,
  `discountUSD` varchar(255) DEFAULT NULL,
  `discountGBP` varchar(255) DEFAULT NULL,
  `discountEUR` varchar(255) DEFAULT NULL,
  `discountZAF` varchar(255) DEFAULT NULL,
  `discountAUD` varchar(255) DEFAULT NULL,
  `discountNZD` varchar(255) DEFAULT NULL,
  `care` text NOT NULL,
  `detail` text NOT NULL,
  `delivery` varchar(255) NOT NULL,
  `categorycare` text NOT NULL,
  `build` text NOT NULL,
  `features` text NOT NULL,
  `note` text NOT NULL,
  `minimumquantity` varchar(255) NOT NULL,
  `order` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=315 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fynx_product`
--

INSERT INTO `fynx_product` (`id`, `subcategory`, `quantity`, `name`, `type`, `description`, `visibility`, `INR`, `USD`, `GBP`, `EUR`, `ZAF`, `AUD`, `NZD`, `relatedproduct`, `category`, `color`, `size`, `sizechart`, `status`, `sku`, `image1`, `image2`, `image3`, `image4`, `image5`, `baseproduct`, `discountINR`, `discountUSD`, `discountGBP`, `discountEUR`, `discountZAF`, `discountAUD`, `discountNZD`, `care`, `detail`, `delivery`, `categorycare`, `build`, `features`, `note`, `minimumquantity`, `order`) VALUES
(1, 32, '10', 'Cherry', '', '<p style="text-align: justify;">We make excellent hand stitched 4-piece construction balls. Grade 1 alum tanned cover is perfectly suited for all playing conditions. A special focus has been kept for longevity and the hardiness of our balls are apt for mass production. The Cherry is suitbale in nets as well as longer format match conditions.</p>', '1', '900', '15', '9', '17', '210', '21', '24', '', '3', '9', '6', '', '2', '129', NULL, NULL, NULL, NULL, NULL, 'Balls', '', '', '', '', '', '', '', '<p style="text-align: justify;">It is advisable to keep cricket balls in a cool and dry place after use of nets / match. In order to re-use and make the most of your old ball, avoid keeping wet balls in kit-bags for a long period of time as balls tend to soak in the water and become extremely hard and heavy. This may be damaging for a players fingers during practice. Always use cricket balls as frequently as possible.</p>', '<ul>\n<li>Top grade four-piece construction alum tanned leather dyes for the red leather ball</li>\n<li>High quality center construction encased with 7 layers of top quality cork wound under tension with wool</li>\n<li>Fully natural seasoned inner core</li>\n<li>Wax finished</li>\n</ul>', '<p>In-stock balls are shipped immediately. Customisation - we deliver worldwide within 4 weeks from date of order.</p>', '', '', '', '', '', 1),
(2, 17, '5', 'Modena', '', '<p>The Modena cap is made from a brushed cotton fabric. It offers a comfortable fit with ventilated air holes across the outer shell, coupled with an adjustable buckle or velcro strap. It comes in various colours and is the most trendy and popular functional cap for cricketers across the globe.</p>', '1', '475', '10', '14', '14', '220', '20', '21', '', '4', '1', '9', '', '2', '111', NULL, NULL, NULL, NULL, NULL, 'Contemporary', '', '', '', '', '', '', '', '<ul>\n<li>These caps are ideally not meant to be washed but can be hand washed if required</li>\n<li>Or you may use a prewash spray and toss it in the washer along with other coloured clothing</li>\n<li>Cold water</li>\n<li>No bleach</li>\n</ul>', '<ul>\n<li>70% polyester 30% cotton</li>\n<li>This combination of fabric is usually tough, bright and usually colour fast</li>\n<li>Adjustable buckle rear strap</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 1),
(3, 17, '10', 'Trinidad', '', '<p>The Custom Cricket Company panama hats are made from a brushed cotton fabric. A typical test cricketers hat shielding the head and neck from long hours of direct sunlight.</p>', '1', '425', '11', '14', '12', '220', '19', '19', '', '4', '1', '9', '', '2', '112', NULL, NULL, NULL, NULL, NULL, 'Sun Hat', '', '', '', '', '', '', '', '<ul>\n<li>These caps are ideally not meant to be washed</li>\n<li>You may use a prewash spray and toss it in the washer with other clothes if necessary</li>\n<li>Cold water</li>\n<li>No bleach</li>\n</ul>', '<ul>\n<li>70% polyester 30% cotton</li>\n<li>Popularly available only in white with embroidery on the front but also available in other colours</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 2),
(4, 17, '1', 'The Baggy', '', '<p>The famous baggy green has been worn by the Austrialian cricketers since the start of the twentieth century. The CCC baggy caps are the traditional 8 panel design which is made in 100% wool.</p>', '1', '525', '12', '15', '15', '235', '22', '22', '', '4', '5', '1', '', '2', '113', NULL, NULL, NULL, NULL, NULL, 'Baggy', '', '', '', '', '', '', '', '<ul>\n<li>Hand wash in the sink with cool water and a mild laundry detergent meant for wool, like Woolite or Zero</li>\n<li>Be gentle with your wool cricket caps, if you scrub, rub or twist you''ll cause the natural wool fibers to matte together</li>\n<li>Rinse well in cool water, roll gently in a towel to remove most of the water then reshape and use</li>\n</ul>', '<ul>\n<li>Baggy caps come in 3 sizes S/M (55-57cm), L/XL (58-60cm) and XXL (60-63cm)</li>\n<li>Satin lined inner</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 3),
(5, 17, '10', 'The Baggy', '', '<p>The famous baggy green has been worn by the Austrialian cricketers since the start of the twentieth century. The CCC baggy caps are the traditional 8 panel design which is made in 100% wool.</p>', '1', '525', '12', '16', '15', '235', '22', '22', '', '4', '5', '2', '', '2', '114', NULL, NULL, NULL, NULL, NULL, 'Baggy', '', '', '', '', '', '', '', '<ul>\n<li>Hand wash in the sink with cool water and a mild laundry detergent meant for wool, like Woolite or Zero</li>\n<li>Be gentle with your wool cricket caps, if you scrub, rub or twist you''ll cause the natural wool fibers to matte together</li>\n<li>Rinse well in cool water, roll gently in a towel to remove most of the water then reshape and use</li>\n</ul>', '<ul>\n<li>Baggy caps come in 3 sizes S/M (55-57cm), L/XL (58-60cm) and XXL (60-63cm)</li>\n<li>Satin lined inner</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 3),
(6, 17, '10', 'The Baggy', '', '<p>The famous baggy green has been worn by the Austrialian cricketers since the start of the twentieth century. The CCC baggy caps are the traditional 8 panel design which is made in 100% wool.</p>', '1', '525', '12', '16', '15', '235', '22', '22', '', '4', '5', '3', '', '2', '115', NULL, NULL, NULL, NULL, NULL, 'Baggy', '', '', '', '', '', '', '', '<ul>\n<li>Hand wash in the sink with cool water and a mild laundry detergent meant for wool, like Woolite or Zero</li>\n<li>Be gentle with your wool cricket caps, if you scrub, rub or twist you''ll cause the natural wool fibers to matte together</li>\n<li>Rinse well in cool water, roll gently in a towel to remove most of the water then reshape and use</li>\n</ul>', '<ul>\n<li>Baggy caps come in 3 sizes S/M (55-57cm), L/XL (58-60cm) and XXL (60-63cm)</li>\n<li>Satin lined inner</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 3),
(7, 38, '0', 'Gladius Aero 1100', '', '<p style="text-align: justify;">Where bat-making meets cutting-edge technology. The Gladius bat incorporates the ground-breaking chamfered edge design. Approved by the MCC, cut-away edges drastically reduce slip and caught behind chances, and produce faster bat speed due to improved aerodynamics. Designed through in-depth scientific simulations and rigorous on-ground testing, Gladius Blade has been attested by international players and coaches.&nbsp;Classic bat profile suits all players with a will to innovate, and a grudge against slip fielders.</p>', '1', '25000', '400', '245', '350', '6000', '500', '575', '', '2', '10', '9', '', '2', '188', NULL, NULL, NULL, NULL, NULL, 'Gladuis Aero 1100', '', '', '', '', '', '', '', '<p><strong>The Dont''s</strong></p>\n<ul>\n<li>Don''t expose to extremes of temperature</li>\n<li>Avoid prolonged spells in car boots/trunks</li>\n<li>Don''t over-oil. Over-oiling adds weight and spoils driving power. Oiling is not a necessity in the modern age</li>\n<li>Don''t allow the bat to become damp</li>\n<li>Don''t use cheap hard balls</li>\n</ul>\n<p>&nbsp;<strong>The&nbsp;Do''s<br /></strong></p>\n<ul>\n<li>During off-season store in a cool atmosphere away from excessive heat or damp</li>\n<li>Prepare the bat carefully by knocking it in with a mallet</li>\n<li>Do inspect the bat regularly for damage in play and repair promptly</li>\n</ul>', '<h5 style="text-align: justify;">Safer at the Edges</h5>\n<ul style="text-align: justify;">\n<li>Due to the chamfered edges, the force applied on the ball when it hits the edge is projected in a safer direction as compared to standard bats</li>\n<li>The ball travels lower and further away from the slip fielders reducing the chances of a batsman getting caught</li>\n<li>The downward velocity of the ball increases by 34% decreasing the effective range of the ball by 26% behind the wicket</li>\n<li>If the fielder changes position his reaction time decreases by 30%</li>\n</ul>\n<p style="text-align: justify;"><strong>Faster Bat Speed</strong></p>\n<ul style="text-align: justify;">\n<li>The aerodynamically superior design decreases air resistance by 3-4%</li>\n<li>Lesser air resistance increases bat speed by 2-3%</li>\n</ul>\n<p style="text-align: justify;">&nbsp;<strong>Superior Balance</strong></p>\n<ul>\n<li style="text-align: justify;">Optimised redistribution of weight decreases the ''Moment of Inertia'' by 3.7%</li>\n<li style="text-align: justify;">A decrease in Moment of Inertia increases the dynamic balance of the bat</li>\n<li style="text-align: justify;">Any reduction above 1.5% is considered as significant and is detectable by most players</li>\n</ul>\n<p>&nbsp;</p>', 'In stock bats are despatched immediately. Delivery may take 10-14 days.', '', '', '', '', '', 1),
(8, 38, '0', 'Gladius Aero 1000', '', '<p style="text-align: justify;">Where bat-making meets cutting-edge technology. The Gladius bat incorporates the ground-breaking chamfered edge design. Approved by the MCC, cut-away edges drastically reduce slip and caught behind chances, and produce faster bat speed due to improved aerodynamics. Designed through in-depth scientific simulations and rigorous on-ground testing, Gladius Blade has been attested by international players and coaches.&nbsp;Classic bat profile suits all players with a will to innovate, and a grudge against slip fielders.</p>', '1', '22500', '350', '220', '300', '5400', '450', '525', '', '2', '10', '9', '', '2', '189', NULL, NULL, NULL, NULL, NULL, 'Gladuis Aero 1000', '', '', '', '', '', '', '', '<p><strong>The Dont''s</strong></p>\n<ul>\n<li>Don''t expose to extremes of temperature</li>\n<li>Avoid prolonged spells in car boots/trunks</li>\n<li>Don''t over-oil. Over-oiling adds weight and spoils driving power. Oiling is not a necessity in the modern age</li>\n<li>Don''t allow the bat to become damp</li>\n<li>Don''t use cheap hard balls</li>\n</ul>\n<p>&nbsp;<strong>The&nbsp;Do''s<br /></strong></p>\n<ul>\n<li>During off-season store in a cool atmosphere away from excessive heat or damp</li>\n<li>Prepare the bat carefully by knocking it in with a mallet</li>\n<li>Do inspect the bat regularly for damage in play and repair promptly</li>\n</ul>', '<h5 style="text-align: justify;">Safer at the Edges</h5>\n<ul style="text-align: justify;">\n<li>Due to the chamfered edges, the force applied on the ball when it hits the edge is projected in a safer direction as compared to standard bats</li>\n<li>The ball travels lower and further away from the slip fielders reducing the chances of a batsman getting caught</li>\n<li>The downward velocity of the ball increases by 34% decreasing the effective range of the ball by 26% behind the wicket</li>\n<li>If the fielder changes position his reaction time decreases by 30%</li>\n</ul>\n<p style="text-align: justify;"><strong>Faster Bat Speed</strong></p>\n<ul style="text-align: justify;">\n<li>The aerodynamically superior design decreases air resistance by 3-4%</li>\n<li>Lesser air resistance increases bat speed by 2-3%</li>\n</ul>\n<p style="text-align: justify;">&nbsp;<strong>Superior Balance</strong></p>\n<ul>\n<li style="text-align: justify;">Optimised redistribution of weight decreases the ''Moment of Inertia'' by 3.7%</li>\n<li style="text-align: justify;">A decrease in Moment of Inertia increases the dynamic balance of the bat</li>\n<li style="text-align: justify;">Any reduction above 1.5% is considered as significant and is detectable by most players</li>\n</ul>\n<p>&nbsp;</p>', 'In stock bats are despatched immediately. Delivery may take 10-14 days.', '', '', '', '', '', 2),
(9, 38, '3', 'Gladius Aero 909', '', '<p style="text-align: justify;">Where bat-making meets cutting-edge technology. The Gladius bat incorporates the ground-breaking chamfered edge design. Approved by the MCC, cut-away edges drastically reduce slip and caught behind chances, and produce faster bat speed due to improved aerodynamics. Designed through in-depth scientific simulations and rigorous on-ground testing, Gladius Blade has been attested by international players and coaches.&nbsp;Classic bat profile suits all players with a will to innovate, and a grudge against slip fielders.</p>', '1', '18000', '300', '195', '250', '5000', '400', '450', '', '2', '10', '9', '', '2', '190', NULL, NULL, NULL, NULL, NULL, 'Gladius Aero 909', '', '', '', '', '', '', '', '<p><strong>The Dont''s</strong></p>\n<ul>\n<li>Don''t expose to extremes of temperature</li>\n<li>Avoid prolonged spells in car boots/trunks</li>\n<li>Don''t over-oil. Over-oiling adds weight and spoils driving power. Oiling is not a necessity in the modern age</li>\n<li>Don''t allow the bat to become damp</li>\n<li>Don''t use cheap hard balls</li>\n</ul>\n<p>&nbsp;<strong>The&nbsp;Do''s<br /></strong></p>\n<ul>\n<li>During off-season store in a cool atmosphere away from excessive heat or damp</li>\n<li>Prepare the bat carefully by knocking it in with a mallet</li>\n<li>Do inspect the bat regularly for damage in play and repair promptly</li>\n</ul>', '<h5 style="text-align: justify;">Safer at the Edges</h5>\n<ul style="text-align: justify;">\n<li>Due to the chamfered edges, the force applied on the ball when it hits the edge is projected in a safer direction as compared to standard bats</li>\n<li>The ball travels lower and further away from the slip fielders reducing the chances of a batsman getting caught</li>\n<li>The downward velocity of the ball increases by 34% decreasing the effective range of the ball by 26% behind the wicket</li>\n<li>If the fielder changes position his reaction time decreases by 30%</li>\n</ul>\n<p style="text-align: justify;"><strong>Faster Bat Speed</strong></p>\n<ul style="text-align: justify;">\n<li>The aerodynamically superior design decreases air resistance by 3-4%</li>\n<li>Lesser air resistance increases bat speed by 2-3%</li>\n</ul>\n<p style="text-align: justify;">&nbsp;<strong>Superior Balance</strong></p>\n<ul>\n<li style="text-align: justify;">Optimised redistribution of weight decreases the ''Moment of Inertia'' by 3.7%</li>\n<li style="text-align: justify;">A decrease in Moment of Inertia increases the dynamic balance of the bat</li>\n<li style="text-align: justify;">Any reduction above 1.5% is considered as significant and is detectable by most players</li>\n</ul>\n<p>&nbsp;</p>', 'In stock bats are despatched immediately. Delivery may take 10-14 days.', '', '', '', '', '', 3),
(10, 38, '3', 'Gladius Aero 808', '', '<p style="text-align: justify;">Where bat-making meets cutting-edge technology. The Gladius bat incorporates the ground-breaking chamfered edge design. Approved by the MCC, cut-away edges drastically reduce slip and caught behind chances, and produce faster bat speed due to improved aerodynamics. Designed through in-depth scientific simulations and rigorous on-ground testing, Gladius Blade has been attested by international players and coaches.&nbsp;Classic bat profile suits all players with a will to innovate, and a grudge against slip fielders.</p>', '1', '15000', '285', '170', '200', '4500', '385', '400', '', '2', '10', '9', '', '2', '191', NULL, NULL, NULL, NULL, NULL, 'Gladius Aero 808', '', '', '', '', '', '', '', '<p><strong>The Dont''s</strong></p>\n<ul>\n<li>Don''t expose to extremes of temperature</li>\n<li>Avoid prolonged spells in car boots/trunks</li>\n<li>Don''t over-oil. Over-oiling adds weight and spoils driving power. Oiling is not a necessity in the modern age</li>\n<li>Don''t allow the bat to become damp</li>\n<li>Don''t use cheap hard balls</li>\n</ul>\n<p>&nbsp;<strong>The&nbsp;Do''s<br /></strong></p>\n<ul>\n<li>During off-season store in a cool atmosphere away from excessive heat or damp</li>\n<li>Prepare the bat carefully by knocking it in with a mallet</li>\n<li>Do inspect the bat regularly for damage in play and repair promptly</li>\n</ul>', '<h5 style="text-align: justify;">Safer at the Edges</h5>\n<ul style="text-align: justify;">\n<li>Due to the chamfered edges, the force applied on the ball when it hits the edge is projected in a safer direction as compared to standard bats</li>\n<li>The ball travels lower and further away from the slip fielders reducing the chances of a batsman getting caught</li>\n<li>The downward velocity of the ball increases by 34% decreasing the effective range of the ball by 26% behind the wicket</li>\n<li>If the fielder changes position his reaction time decreases by 30%</li>\n</ul>\n<p style="text-align: justify;"><strong>Faster Bat Speed</strong></p>\n<ul style="text-align: justify;">\n<li>The aerodynamically superior design decreases air resistance by 3-4%</li>\n<li>Lesser air resistance increases bat speed by 2-3%</li>\n</ul>\n<p style="text-align: justify;">&nbsp;<strong>Superior Balance</strong></p>\n<ul>\n<li style="text-align: justify;">Optimised redistribution of weight decreases the ''Moment of Inertia'' by 3.7%</li>\n<li style="text-align: justify;">A decrease in Moment of Inertia increases the dynamic balance of the bat</li>\n<li style="text-align: justify;">Any reduction above 1.5% is considered as significant and is detectable by most players</li>\n</ul>\n<p>&nbsp;</p>', 'In stock bats are despatched immediately. Delivery may take 10-14 days.', '', '', '', '', '', 4),
(11, 33, '7', 'Sweep 101', '', '<p style="text-align: justify;">The Sweep 101 Glove incorporates Custom&rsquo;s unique three-piece mini-roll design. Manufactured to provide the perfect combination of protection and flexibility for all conditions.</p>', '1', '1900', '38', '32', '38', '825', '45', '54', '', '5', '6', '7', '', '2', '122', NULL, NULL, NULL, NULL, NULL, 'Sweep Glove', '', '', '', '', '', '', '', '<p style="text-align: justify;">After a batting net session or match innings your leave gloves in a shaded area to dry or in mild sunlight. Avoid direct sunlight hitting your gloves which make the leather hard and brittle. Immediately placing the gloves in your kit bag after batting will leave gloves moist and create unpleasant odor. Do not wash your gloves, wipe with clean moist cloth for outer surface cleaning. It it not advisable to soak or completely wash your batting gloves.</p>', '<ul>\n<li>Miniroll style finger and thumb splits</li>\n<li>Lightweight high-density foam finger</li>\n<li>Split thumb and one-piece sidebar on lead hand</li>\n<li>Leather tabs on fingertips</li>\n<li>Leather tip on thumb of both hands</li>\n<li>Toweled wristband with embossed velcro for perfect fit</li>\n</ul>', '<p>In-stock gloves are available for immediate shipment. Customisation takes 4 weeks for worldwide delivery from date of order.</p>', '', '', '', '', '', 1),
(12, 33, '0', 'Sweep 101', '', '<p style="text-align: justify;">The Sweep 101 Glove incorporates Custom&rsquo;s unique three-piece mini-roll design. Manufactured to provide the perfect combination of protection and flexibility for all conditions.</p>', '1', '1900', '38', '32', '38', '825', '45', '54', '', '5', '6', '8', '', '2', '123', NULL, NULL, NULL, NULL, NULL, 'Sweep Glove', '', '', '', '', '', '', '', '<p style="text-align: justify;">After a batting net session or match innings your leave gloves in a shaded area to dry or in mild sunlight. Avoid direct sunlight hitting your gloves which make the leather hard and brittle. Immediately placing the gloves in your kit bag after batting will leave gloves moist and create unpleasant odor. Do not wash your gloves, wipe with clean moist cloth for outer surface cleaning. It it not advisable to soak or completely wash your batting gloves.</p>', '<ul>\n<li>Miniroll style finger and thumb splits</li>\n<li>Lightweight high-density foam finger</li>\n<li>Split thumb and one-piece sidebar on lead hand</li>\n<li>Leather tabs on fingertips</li>\n<li>Leather tip on thumb of both hands</li>\n<li>Toweled wristband with embossed velcro for perfect fit</li>\n</ul>', '<p>In-stock gloves are available for immediate shipment. Customisation takes 4 weeks for worldwide delivery from date of order.</p>', '', '', '', '', '', 1),
(13, 33, '6', 'Switch 202', '', '<p style="text-align: justify;">The Switch 202 is Custom&rsquo;s traditional &ldquo;sausage finger&rdquo; glove design. Offers the highest level of protection available, providing maximum safety for your hands with ultima-grip and low wear &amp; tear features.</p>', '1', '2200', '52', '37', '52', '950', '62', '73', '', '5', '7', '7', '', '2', '124', NULL, NULL, NULL, NULL, NULL, 'Switch Glove', '', '', '', '', '', '', '', '<p style="text-align: justify;">After a batting net session or match innings your leave gloves in a shaded area to dry or in mild sunlight. Avoid direct sunlight hitting your gloves which make the leather hard and brittle. Immediately placing the gloves in your kit bag after batting will leave gloves moist and create unpleasant odor. Do not wash your gloves, wipe with clean moist cloth for outer surface cleaning. It it not advisable to soak or completely wash your batting gloves.</p>', '<ul>\n<li>Polyurethane finger rolls</li>\n<li>Cotton filled finger rolls and split thumb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>\n<li>Three-piece sidebars on lead hand</li>\n<li>Extra leather layer on hard-wearing areas of the palm</li>\n<li>Leather tip on thumb of both hands</li>\n<li>Thumb with mesh lining and window for better ventilation</li>\n<li>Polyurethane embossed knuckles</li>\n<li>Toweled wristband with embossed velcro for perfect fit</li>\n<li>Nylon gusset for ventilation to keep your hands feeling fresh even on the hottest days</li>\n</ul>', '<p>In-stock gloves are available for immediate shipment. Customisation takes 4 weeks for worldwide delivery from date of order.</p>', '', '', '', '', '', 2),
(14, 33, '0', 'Switch 202', '', '<p style="text-align: justify;">The Switch 202 is Custom&rsquo;s traditional &ldquo;sausage finger&rdquo; glove design. Offers the highest level of protection available, providing maximum safety for your hands with ultima-grip and low wear &amp; tear features.</p>', '1', '2200', '52', '37', '52', '950', '62', '73', '', '5', '7', '8', '', '2', '125', NULL, NULL, NULL, NULL, NULL, 'Switch Glove', '', '', '', '', '', '', '', '<p style="text-align: justify;">After a batting net session or match innings your leave gloves in a shaded area to dry or in mild sunlight. Avoid direct sunlight hitting your gloves which make the leather hard and brittle. Immediately placing the gloves in your kit bag after batting will leave gloves moist and create unpleasant odor. Do not wash your gloves, wipe with clean moist cloth for outer surface cleaning. It it not advisable to soak or completely wash your batting gloves.</p>', '<ul>\n<li>Polyurethane finger rolls</li>\n<li>Cotton filled finger rolls and split thumb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>\n<li>Three-piece sidebars on lead hand</li>\n<li>Extra leather layer on hard-wearing areas of the palm</li>\n<li>Leather tip on thumb of both hands</li>\n<li>Thumb with mesh lining and window for better ventilation</li>\n<li>Polyurethane embossed knuckles</li>\n<li>Toweled wristband with embossed velcro for perfect fit</li>\n<li>Nylon gusset for ventilation to keep your hands feeling fresh even on the hottest days</li>\n</ul>', '<p>In-stock gloves are available for immediate shipment. Customisation takes 4 weeks for worldwide delivery from date of order.</p>', '', '', '', '', '', 2),
(15, 33, '1', 'Scoop 303', '', '<p style="text-align: justify;">The Scoop 303 is Custom&rsquo;s top-of-the-range glove and our most popular production. It offers extra protection and comfort to keep your hands safe and snug in all conditions. The 17-piece padding system allows your hands maximum flexibility with ultimate gripping control.</p>', '1', '2500', '68', '42', '68', '1100', '78', '89', '', '5', '8', '7', '', '2', '126', NULL, NULL, NULL, NULL, NULL, 'Scoop Glove ', '', '', '', '', '', '', '', '<p style="text-align: justify;">After a batting net session or match innings your leave gloves in a shaded area to dry or in mild sunlight. Avoid direct sunlight hitting your gloves which make the leather hard and brittle. Immediately placing the gloves in your kit bag after batting will leave gloves moist and create unpleasant odor. Do not wash your gloves, wipe with clean moist cloth for outer surface cleaning. It it not advisable to soak or completely wash your batting gloves.</p>', '<ul>\n<li>Lightweight high-density foam finger with thermoplastic polyurethane inserts</li>\n<li>Split thumb and three-piece sidebars on lead hand</li>\n<li>Leather tabs on fingertips, leather tip on thumb of both hands with extra leather patch on hard-wearing areas of the palm</li>\n<li>Polyurethane embossed knuckles</li>\n<li>Toweled wristband with embossed velcro for perfect fit</li>\n<li>Nylon gusset for ventilation to keep your hands feeling fresh even on the hottest days</li>\n<li>Perforation in palm fingers for maximum air flow</li>\n</ul>', '<p>In-stock gloves are available for immediate shipment. Customisation takes 4 weeks for worldwide delivery from date of order.</p>', '', '', '', '', '', 3),
(16, 33, '0', 'Scoop 303', '', '<p style="text-align: justify;">The Scoop 303 is Custom&rsquo;s top-of-the-range glove and our most popular production. It offers extra protection and comfort to keep your hands safe and snug in all conditions. The 17-piece padding system allows your hands maximum flexibility with ultimate gripping control.</p>', '1', '2500', '68', '42', '68', '1100', '78', '89', '', '5', '8', '8', '', '2', '127', NULL, NULL, NULL, NULL, NULL, 'Scoop Glove ', '', '', '', '', '', '', '', '<p style="text-align: justify;">After a batting net session or match innings your leave gloves in a shaded area to dry or in mild sunlight. Avoid direct sunlight hitting your gloves which make the leather hard and brittle. Immediately placing the gloves in your kit bag after batting will leave gloves moist and create unpleasant odor. Do not wash your gloves, wipe with clean moist cloth for outer surface cleaning. It it not advisable to soak or completely wash your batting gloves.&nbsp;</p>', '<ul>\n<li>Lightweight high-density foam finger with thermoplastic polyurethane inserts</li>\n<li>Split thumb and three-piece sidebars on lead hand</li>\n<li>Leather tabs on fingertips, leather tip on thumb of both hands with extra leather patch on hard-wearing areas of the palm</li>\n<li>Polyurethane embossed knuckles</li>\n<li>Toweled wristband with embossed velcro for perfect fit</li>\n<li>Nylon gusset for ventilation to keep your hands feeling fresh even on the hottest days</li>\n<li>Perforation in palm fingers for maximum air flow</li>\n</ul>', '<p>In-stock gloves are available for immediate shipment. Customisation takes 4 weeks for worldwide delivery from date of order.</p>', '', '', '', '', '', 3),
(17, 36, '5', 'Gunpowder 1100', '', '<p>Our Grade 1+ is our best looking blade.&nbsp;The grain on the face will be straight and there will be a minimum of 7 grains visible.&nbsp; There may be the odd small knot or speck in the edge or back but the playing area will be clean. For the professional who expects the best of out of his bat as he does himself.</p>', '1', '25000', '400', '245', '350', '6000', '500', '575', '', '2', '10', '9', '', '2', '180', NULL, NULL, NULL, NULL, NULL, 'Gunpowder 1100', '', '', '', '', '', '', '', '<p><strong>Don''ts:</strong></p>\n<ul>\n<li>Don''t expose to extremes of temperature</li>\n<li>Avoid prolonged spells in car boots/trunks.</li>\n<li>Don''t over-oil. It is more dangerous to over-oil than to under-oil. Over-oiling adds weight, spoils driving power and may cause rot.</li>\n<li>Don''t ever stand the bat in oil.</li>\n<li>Don''t allow the bat to become damp.</li>\n<li>Don''t misuse or treat carelessly off the pitch, for example at nets, or in changing rooms.</li>\n<li>Don''t use cheap hard balls. These will damage the bat.</li>\n<li>Don''t continue to play with a damaged bat; this will aggravate the damage to a point where the bat may be beyond repair&nbsp;</li>\n</ul>\n<p>&nbsp;<strong>Do''s:<br /><br /></strong></p>\n<ul>\n<li>Do store the bat in off-season in a cool dry atmosphere away from excessive heat or damp.</li>\n<li>Do store the bat in off-season in a cool dry atmosphere away from excessive heat or damp.</li>\n<li>Do prepare the bat carefully</li>\n<li>Do re-oil the bat after any prolonged period of non-use: it''s particularly important to remember to do this prior to using in pre-season indoor nets</li>\n<li>Do inspect the bat regularly for damage in play and repair promptly</li>\n</ul>', '<ul>\n<li>Grade 1 + English Willow</li>\n<li>7+ wide grains</li>\n<li>2Lb 9oz with an easy pick up</li>\n<li>Lower middle extended sweet spot</li>\n<li>Anti Shock Short Handle</li>\n<li>Huge 2.6 inch edge</li>\n<li>High pronounced bow</li>\n</ul>', '4 Weeks', '', '', '', '', '', 1),
(18, 36, '4', 'Gunpowder 1000', '', '<p>Our 1000 series is up there with the best. This is where&nbsp;tradition meets agression in this monster of a bat. Custom&rsquo;s biggest blade at 2lb12oz, our 1000 series&nbsp;suits the strong player who likes to dominate. Light pick-up allows tremendous bat speed, and massive edges combined with a huge sweetspot ensure that the power player will get extra value on all his shots</p>', '1', '22500', '350', '220', '300', '5400', '450', '525', '', '2', '10', '9', '', '2', '181', NULL, NULL, NULL, NULL, NULL, 'Gunpowder 1000', '', '', '', '', '', '', '', '<p><strong>Don''ts:</strong></p>\n<ul>\n<li>Don''t expose to extremes of temperature</li>\n<li>Avoid prolonged spells in car boots/trunks.</li>\n<li>Don''t over-oil. It is more dangerous to over-oil than to under-oil. Over-oiling adds weight, spoils driving power and may cause rot.</li>\n<li>Don''t ever stand the bat in oil.</li>\n<li>Don''t allow the bat to become damp.</li>\n<li>Don''t misuse or treat carelessly off the pitch, for example at nets, or in changing rooms.</li>\n<li>Don''t use cheap hard balls. These will damage the bat.</li>\n<li>Don''t continue to play with a damaged bat; this will aggravate the damage to a point where the bat may be beyond repair.</li>\n</ul>\n<p>&nbsp;<strong>Do''s:<br /><br /></strong></p>\n<ul>\n<li>Do store the bat in off-season in a cool dry atmosphere away from excessive heat or damp.</li>\n<li>Do store the bat in off-season in a cool dry atmosphere away from excessive heat or damp.</li>\n<li>Do prepare the bat carefully</li>\n<li>Do re-oil the bat after any prolonged period of non-use: it''s particularly important to remember to do this prior to using in pre-season indoor nets</li>\n<li>Do inspect the bat regularly for damage in play and repair promptly</li>\n</ul>', '<ul>\n<li>2lb12oz</li>\n<li>Traditional bowed face profile</li>\n<li>Massive 4.1 cm Edge</li>\n<li>Short, round Handle</li>\n<li>Strong, Bowed Spine</li>\n<li>Light Pick-up</li>\n<li>Mid to High sweetspot</li>\n</ul>', '4 Weeks', '', '', '', '', '', 2),
(19, 36, '5', 'Gunpowder 909', '', '<p>Our 909''s&nbsp;are made from high quality English willow. The grains are moderately tight (between 6 and 8) and straight. The wood may possess some superficial blemishes. This is where&nbsp;precision meets timing in this beautiful, bowed sword of willow. Custom&rsquo;s lightest bat, it nevertheless has a large, powerful sweetspot, giving full value to your shots. Perfect for the classical player and precise, crisp, shot-making. A fabulous blade for fabulous strokes.</p>', '1', '18000', '300', '195', '250', '5000', '400', '450', '', '2', '10', '9', '', '2', '182', NULL, NULL, NULL, NULL, NULL, 'Gunpowder 909', '', '', '', '', '', '', '', '<p><strong>Don''ts:</strong></p>\n<ul>\n<li>Don''t expose to extremes of temperature</li>\n<li>Avoid prolonged spells in car boots/trunks.</li>\n<li>Don''t over-oil. It is more dangerous to over-oil than to under-oil. Over-oiling adds weight, spoils driving power and may cause rot.</li>\n<li>Don''t ever stand the bat in oil.</li>\n<li>Don''t allow the bat to become damp.</li>\n<li>Don''t misuse or treat carelessly off the pitch, for example at nets, or in changing rooms.</li>\n<li>Don''t use cheap hard balls. These will damage the bat.</li>\n<li>Don''t continue to play with a damaged bat; this will aggravate the damage to a point where the bat may be beyond repair.</li>\n</ul>\n<p>&nbsp;<strong>Do''s:<br /><br /></strong></p>\n<ul>\n<li>Do store the bat in off-season in a cool dry atmosphere away from excessive heat or damp.</li>\n<li>Do store the bat in off-season in a cool dry atmosphere away from excessive heat or damp.</li>\n<li>Do prepare the bat carefully</li>\n<li>Do re-oil the bat after any prolonged period of non-use: it''s particularly important to remember to do this prior to using in pre-season indoor nets</li>\n<li>Do inspect the bat regularly for damage in play and repair promptly</li>\n</ul>', '<ul>\n<li>2lb8oz</li>\n<li>Traditional bowed face profile</li>\n<li>Big 3.8 cm Edge</li>\n<li>Huge middle</li>\n<li>Short, round Handle</li>\n<li>Strong, Bowed Spine</li>\n<li>Balanced Pick-up</li>\n<li>Mid to Low sweetspot</li>\n</ul>', '4 Weeks', '', '', '', '', '', 3),
(20, 36, '5', 'Gunpowder 808', '', '<p>CCC 808 series.&nbsp;Our&nbsp;Grade 2 blade is also very good quality and normally a larger amount of red wood can be seen on the edge of a blade, this has no effect on the playing ability of the bat it is purely cosmetic. Again there will be at least 6 straight grains on the face of the blade with maybe some blemishes, pin knots or &ldquo;speck&rdquo; visible, we also put the top 2% of the excellent quality butterfly blades that we get into Grade 2</p>', '1', '15000', '285', '170', '200', '4500', '385', '400', '', '2', '10', '9', '', '2', '183', NULL, NULL, NULL, NULL, NULL, 'Gunpowder 808', '', '', '', '', '', '', '', '<p><strong>Don''ts:</strong></p>\n<ul>\n<li>Don''t expose to extremes of temperature</li>\n<li>Avoid prolonged spells in car boots/trunks.</li>\n<li>Don''t over-oil. It is more dangerous to over-oil than to under-oil. Over-oiling adds weight, spoils driving power and may cause rot.</li>\n<li>Don''t ever stand the bat in oil.</li>\n<li>Don''t allow the bat to become damp.</li>\n<li>Don''t misuse or treat carelessly off the pitch, for example at nets, or in changing rooms.</li>\n<li>Don''t use cheap hard balls. These will damage the bat.</li>\n<li>Don''t continue to play with a damaged bat; this will aggravate the damage to a point where the bat may be beyond repair.</li>\n</ul>\n<p>&nbsp;<strong>Do''s:<br /><br /></strong></p>\n<ul>\n<li>Do store the bat in off-season in a cool dry atmosphere away from excessive heat or damp.</li>\n<li>Do store the bat in off-season in a cool dry atmosphere away from excessive heat or damp.</li>\n<li>Do prepare the bat carefully</li>\n<li>Do re-oil the bat after any prolonged period of non-use: it''s particularly important to remember to do this prior to using in pre-season indoor nets</li>\n<li>Do inspect the bat regularly for damage in play and repair promptly</li>\n</ul>', '<ul>\n<li>2lb10oz</li>\n<li>Traditional bowed face profile</li>\n<li>Massive 4.1 cm Edge</li>\n<li>Short, round Handle</li>\n<li>Strong, Bowed Spine</li>\n<li>Light Pick-up</li>\n<li>Mid range sweetspot</li>\n</ul>', '4 Weeks', '', '', '', '', '', 4),
(21, 31, '0', 'Proton Maxima', '', '<p style="text-align: justify;">Our flagship product - The Proton Maxima is the ultimate cricket kit bag. CCC has spent hours meticulously perfecting the ultimate cricket kit bag for the serious cricketer. The most bespoke and highly detailed cricket kit bag on the planet has been developed with the ultimate cricketers demands. Ideal for daily usage and perfect for long-distance tours.</p>', '1', '7500', '175', '120', '150', '2900', '220', '130', '', '7', '3', '6', '', '2', '128', NULL, NULL, NULL, NULL, NULL, 'Kit Bag', '', '', '', '', '', '', '', '<p style="text-align: justify;">Fully water resistant and washable. Water proof in light rain and durable for all modes of transportation. It is important to note that the longevity of the bag is dependent on a balanced packing effort. The crate and wheels are durable in high pressures but its important to not allow the bag to tilt on its side which may cause wear and tear to the coffin hold and other parts of the bag.</p>', '<ul>\n<li>Enormous soft coffin hold for complete protective gear storage with separate helmet compartment</li>\n<li>Bifurcated easy access shoe compartment good to hold 2 pairs</li>\n<li>Hidden compartment&nbsp;for valuables</li>\n<li>SilverMAX cool compartment for keeping water bottles cool in all weather conditions</li>\n<li>3 wheel base with pull out trolley for maximum stability. Concealed handle.</li>\n<li>Separate wet &amp; dry clothes sections with extra pull out pouch</li>\n<li>Bat Pro+ which are two designated cushioned bat compartments &amp; an umbrella slot</li>\n<li>Additional pockets for balls and other nick-knacks</li>\n<li>Dedicated first-aid compartment</li>\n</ul>', '<p>In-stock bags are shipped immediately, customisation worldwide takes 4 weeks from date of order.</p>', '', '', '', '', '', 1),
(22, 31, '0', 'Proton Club', '', '<p style="text-align: justify;">The Proton Club is a more compact version inspired from the Maxima. CCC has spent hours meticulously perfecting the ultimate cricket kit bag for the serious cricketer and here is one that is idea for bowlers and club cricketers for daily usage. Concise but still packs in a punch with bespoke detail and compartmentalisation.</p>', '1', '5500', '155', '95', '135', '1660', '195', '110', '', '7', '7', '9', '', '2', '175', NULL, NULL, NULL, NULL, NULL, 'Junior Wheelie', '', '', '', '', '', '', '', '<p style="text-align: justify;">Fully water resistant and washable. Water proof in light rain and durable for all modes of transportation. It is important to note that the longevity of the bag is dependent on a balanced packing effort. The crate and wheels are durable in high pressures but its important to not allow the bag to tilt over which may cause wear and tear to the soft coffin hold and other parts of the bag.</p>', '<ul>\n<li>Large soft coffin hold for complete protective gear storage&nbsp;</li>\n<li>Bifurcated easy access shoe compartment good to hold 2 pairs</li>\n<li>SilverMAX cool compartment for keeping water bottles cool in all weather conditions</li>\n<li>3 wheel base with pull out trolley for maximum stability. Concealed handle.</li>\n<li>Bat Pro designated&nbsp;slots for 2 bats on either side of the bag.</li>\n<li>Additional pockets for balls and other nick-knacks</li>\n<li>Dedicated first-aid compartment</li>\n</ul>', '<p>In-stock bags are shipped immediately, customisation worldwide takes 4 weeks from date of order.</p>', '', '', '', '', '', 2),
(23, 37, '5', 'Magnum 1100', '', '<p>Our Grade 1+ is our best looking blade.&nbsp;The grain on the face will be straight and there will be a minimum of 7 grains visible.&nbsp; There may be the odd small knot or speck in the edge or back but the playing area will be clean. For the professional who expects the best of out of his bat as he does himself.</p>', '1', '25000', '400', '245', '350', '6000', '500', '575', '', '2', '10', '9', '', '2', '184', NULL, NULL, NULL, NULL, NULL, 'Magnum 1100', '', '', '', '', '', '', '', '<p><strong>Don''ts:</strong></p>\n<ul>\n<li>Don''t expose to extremes of temperature</li>\n<li>Avoid prolonged spells in car boots/trunks.</li>\n<li>Don''t over-oil. It is more dangerous to over-oil than to under-oil. Over-oiling adds weight, spoils driving power and may cause rot.</li>\n<li>Don''t ever stand the bat in oil.</li>\n<li>Don''t allow the bat to become damp.</li>\n<li>Don''t misuse or treat carelessly off the pitch, for example at nets, or in changing rooms.</li>\n<li>Don''t use cheap hard balls. These will damage the bat.</li>\n<li>Don''t continue to play with a damaged bat; this will aggravate the damage to a point where the bat may be beyond repair&nbsp;</li>\n</ul>\n<p>&nbsp;<strong>Do''s:<br /><br /></strong></p>\n<ul>\n<li>Do store the bat in off-season in a cool dry atmosphere away from excessive heat or damp.</li>\n<li>Do store the bat in off-season in a cool dry atmosphere away from excessive heat or damp.</li>\n<li>Do prepare the bat carefully</li>\n<li>Do re-oil the bat after any prolonged period of non-use: it''s particularly important to remember to do this prior to using in pre-season indoor nets</li>\n<li>Do inspect the bat regularly for damage in play and repair promptly</li>\n</ul>', '<ul>\n<li>Grade 1 + English Willow</li>\n<li>7+ wide grains</li>\n<li>2Lb 9oz with an easy pick up</li>\n<li>Lower middle extended sweet spot</li>\n<li>Anti Shock Short Handle</li>\n<li>Huge 2.6 inch edge</li>\n<li>High pronounced bow</li>\n</ul>', '4 Weeks', '', '', '', '', '', 1),
(24, 37, '5', 'Magnum 1000', '', '<p>Our 1000 series is up there with the best. This is where&nbsp;tradition meets agression in this monster of a bat. Custom&rsquo;s biggest blade at 2lb12oz, our 1000 series&nbsp;suits the strong player who likes to dominate. Light pick-up allows tremendous bat speed, and massive edges combined with a huge sweetspot ensure that the power player will get extra value on all his shots</p>', '1', '22500', '350', '220', '300', '5400', '450', '525', '', '2', '10', '9', '', '2', '185', NULL, NULL, NULL, NULL, NULL, 'Magnum 1000', '', '', '', '', '', '', '', '<p><strong>Don''ts:</strong></p>\n<ul>\n<li>Don''t expose to extremes of temperature</li>\n<li>Avoid prolonged spells in car boots/trunks.</li>\n<li>Don''t over-oil. It is more dangerous to over-oil than to under-oil. Over-oiling adds weight, spoils driving power and may cause rot.</li>\n<li>Don''t ever stand the bat in oil.</li>\n<li>Don''t allow the bat to become damp.</li>\n<li>Don''t misuse or treat carelessly off the pitch, for example at nets, or in changing rooms.</li>\n<li>Don''t use cheap hard balls. These will damage the bat.</li>\n<li>Don''t continue to play with a damaged bat; this will aggravate the damage to a point where the bat may be beyond repair.</li>\n</ul>\n<p>&nbsp;<strong>Do''s:<br /><br /></strong></p>\n<ul>\n<li>Do store the bat in off-season in a cool dry atmosphere away from excessive heat or damp.</li>\n<li>Do store the bat in off-season in a cool dry atmosphere away from excessive heat or damp.</li>\n<li>Do prepare the bat carefully</li>\n<li>Do re-oil the bat after any prolonged period of non-use: it''s particularly important to remember to do this prior to using in pre-season indoor nets</li>\n<li>Do inspect the bat regularly for damage in play and repair promptly</li>\n</ul>', '<ul>\n<li>2lb12oz</li>\n<li>Traditional bowed face profile</li>\n<li>Massive 4.1 cm Edge</li>\n<li>Short, round Handle</li>\n<li>Strong, Bowed Spine</li>\n<li>Light Pick-up</li>\n<li>Mid to High sweetspot</li>\n</ul>', '4 Weeks', '', '', '', '', '', 2),
(25, 37, '5', 'Magnum 909', '', '<p>Our 909''s&nbsp;are made from high quality English willow. The grains are moderately tight (between 6 and 8) and straight. The wood may possess some superficial blemishes. This is where&nbsp;precision meets timing in this beautiful, bowed sword of willow. Custom&rsquo;s lightest bat, it nevertheless has a large, powerful sweetspot, giving full value to your shots. Perfect for the classical player and precise, crisp, shot-making. A fabulous blade for fabulous strokes.</p>', '1', '18000', '300', '195', '250', '5000', '400', '450', '', '2', '10', '9', '', '2', '186', NULL, NULL, NULL, NULL, NULL, 'Magnum 909', '', '', '', '', '', '', '', '<p><strong>Don''ts:</strong></p>\n<ul>\n<li>Don''t expose to extremes of temperature</li>\n<li>Avoid prolonged spells in car boots/trunks.</li>\n<li>Don''t over-oil. It is more dangerous to over-oil than to under-oil. Over-oiling adds weight, spoils driving power and may cause rot.</li>\n<li>Don''t ever stand the bat in oil.</li>\n<li>Don''t allow the bat to become damp.</li>\n<li>Don''t misuse or treat carelessly off the pitch, for example at nets, or in changing rooms.</li>\n<li>Don''t use cheap hard balls. These will damage the bat.</li>\n<li>Don''t continue to play with a damaged bat; this will aggravate the damage to a point where the bat may be beyond repair.</li>\n</ul>\n<p>&nbsp;<strong>Do''s:<br /><br /></strong></p>\n<ul>\n<li>Do store the bat in off-season in a cool dry atmosphere away from excessive heat or damp.</li>\n<li>Do store the bat in off-season in a cool dry atmosphere away from excessive heat or damp.</li>\n<li>Do prepare the bat carefully</li>\n<li>Do re-oil the bat after any prolonged period of non-use: it''s particularly important to remember to do this prior to using in pre-season indoor nets</li>\n<li>Do inspect the bat regularly for damage in play and repair promptly</li>\n</ul>', '<ul>\n<li>2lb8oz</li>\n<li>Traditional bowed face profile</li>\n<li>Big 3.8 cm Edge</li>\n<li>Huge middle</li>\n<li>Short, round Handle</li>\n<li>Strong, Bowed Spine</li>\n<li>Balanced Pick-up</li>\n<li>Mid to Low sweetspot</li>\n</ul>', '4 Weeks', '', '', '', '', '', 3),
(26, 37, '2', 'Magnum 808', '', '<p>CCC 808 series.&nbsp;Our&nbsp;Grade 2 blade is also very good quality and normally a larger amount of red wood can be seen on the edge of a blade, this has no effect on the playing ability of the bat it is purely cosmetic. Again there will be at least 6 straight grains on the face of the blade with maybe some blemishes, pin knots or &ldquo;speck&rdquo; visible, we also put the top 2% of the excellent quality butterfly blades that we get into Grade 2</p>', '1', '15000', '285', '170', '200', '4500', '385', '400', '', '2', '10', '9', '', '2', '187', NULL, NULL, NULL, NULL, NULL, 'Magnum 808', '', '', '', '', '', '', '', '<p><strong>Don''ts:</strong></p>\n<ul>\n<li>Don''t expose to extremes of temperature</li>\n<li>Avoid prolonged spells in car boots/trunks.</li>\n<li>Don''t over-oil. It is more dangerous to over-oil than to under-oil. Over-oiling adds weight, spoils driving power and may cause rot.</li>\n<li>Don''t ever stand the bat in oil.</li>\n<li>Don''t allow the bat to become damp.</li>\n<li>Don''t misuse or treat carelessly off the pitch, for example at nets, or in changing rooms.</li>\n<li>Don''t use cheap hard balls. These will damage the bat.</li>\n<li>Don''t continue to play with a damaged bat; this will aggravate the damage to a point where the bat may be beyond repair.</li>\n</ul>\n<p>&nbsp;<strong>Do''s:<br /><br /></strong></p>\n<ul>\n<li>Do store the bat in off-season in a cool dry atmosphere away from excessive heat or damp.</li>\n<li>Do store the bat in off-season in a cool dry atmosphere away from excessive heat or damp.</li>\n<li>Do prepare the bat carefully</li>\n<li>Do re-oil the bat after any prolonged period of non-use: it''s particularly important to remember to do this prior to using in pre-season indoor nets</li>\n<li>Do inspect the bat regularly for damage in play and repair promptly</li>\n</ul>', '<ul>\n<li>2lb10oz</li>\n<li>Traditional bowed face profile</li>\n<li>Massive 4.1 cm Edge</li>\n<li>Short, round Handle</li>\n<li>Strong, Bowed Spine</li>\n<li>Light Pick-up</li>\n<li>Mid range sweetspot</li>\n</ul>', '4 Weeks', '', '', '', '', '', 4),
(27, 7, '7', 'Leg Slip R&W', '', '<p>The Custom Cricket Company ODI playing trousers are made from premium quality polyester fabric. These durable and hardy pants are good for all conditions of play. Available in various cut &amp; sew patterns as well as full sublimation option. Embroidery and printing of logo are both available choices in our trousers.</p>', '1', '750', '22', '24', '24', '290', '26', '28', '', '4', '1', '1', '', '2', '145', NULL, NULL, NULL, NULL, NULL, 'ODI Mick P', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding of colour and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 4);
INSERT INTO `fynx_product` (`id`, `subcategory`, `quantity`, `name`, `type`, `description`, `visibility`, `INR`, `USD`, `GBP`, `EUR`, `ZAF`, `AUD`, `NZD`, `relatedproduct`, `category`, `color`, `size`, `sizechart`, `status`, `sku`, `image1`, `image2`, `image3`, `image4`, `image5`, `baseproduct`, `discountINR`, `discountUSD`, `discountGBP`, `discountEUR`, `discountZAF`, `discountAUD`, `discountNZD`, `care`, `detail`, `delivery`, `categorycare`, `build`, `features`, `note`, `minimumquantity`, `order`) VALUES
(28, 7, '10', 'Leg Slip R&W', '', '<p>The Custom Cricket Company ODI playing trousers are made from premium quality polyester fabric. These durable and hardy pants are good for all conditions of play. Available in various cut &amp; sew patterns as well as full sublimation option. Embroidery and printing of logo are both available choices in our trousers.</p>', '1', '750', '22', '24', '24', '290', '26', '28', '', '4', '1', '2', '', '2', '146', NULL, NULL, NULL, NULL, NULL, 'ODI Mick P', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding of colour and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 4),
(29, 7, '10', 'Leg Slip R&W', '', '<p>The Custom Cricket Company ODI playing trousers are made from premium quality polyester fabric. These durable and hardy pants are good for all conditions of play. Available in various cut &amp; sew patterns as well as full sublimation option. Embroidery and printing of logo are both available choices in our trousers.</p>', '1', '750', '22', '24', '24', '290', '26', '28', '', '4', '1', '3', '', '2', '147', NULL, NULL, NULL, NULL, NULL, 'ODI Mick P', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding of colour and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 4),
(30, 7, '10', 'Leg Slip R&W', '', '<p>The Custom Cricket Company ODI playing trousers are made from premium quality polyester fabric. These durable and hardy pants are good for all conditions of play. Available in various cut &amp; sew patterns as well as full sublimation option. Embroidery and printing of logo are both available choices in our trousers.</p>', '1', '750', '22', '24', '24', '290', '26', '28', '', '4', '1', '4', '', '2', '148', NULL, NULL, NULL, NULL, NULL, 'ODI Mick P', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding of colour and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 4),
(31, 7, '10', 'Leg Slip R&W', '', '<p>The Custom Cricket Company ODI playing trousers are made from premium quality polyester fabric. These durable and hardy pants are good for all conditions of play. Available in various cut &amp; sew patterns as well as full sublimation option. Embroidery and printing of logo are both available choices in our trousers.</p>', '1', '750', '22', '24', '24', '290', '26', '28', '', '4', '1', '13', '', '2', '149', NULL, NULL, NULL, NULL, NULL, 'ODI Mick P', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding of colour and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 4),
(32, 7, '10', 'Leg Slip R&Y', '', '<p>The Custom Cricket Company ODI playing trousers are made from premium quality polyester fabric. These durable and hardy pants are good for all conditions of play. Available in various cut &amp; sew patterns as well as full sublimation option. Embroidery and printing of logo are both available choices in our trousers.</p>', '1', '750', '22', '24', '24', '290', '26', '28', '', '4', '9', '1', '', '2', '150', NULL, NULL, NULL, NULL, NULL, 'ODI USC P', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding of colour and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 5),
(33, 7, '10', 'Leg Slip R&Y', '', '<p>The Custom Cricket Company ODI playing trousers are made from premium quality polyester fabric. These durable and hardy pants are good for all conditions of play. Available in various cut &amp; sew patterns as well as full sublimation option. Embroidery and printing of logo are both available choices in our trousers.</p>', '1', '750', '22', '24', '24', '290', '26', '28', '', '4', '9', '2', '', '2', '151', NULL, NULL, NULL, NULL, NULL, 'ODI USC P', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding of colour and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 5),
(34, 7, '10', 'Leg Slip R&Y', '', '<p>The Custom Cricket Company ODI playing trousers are made from premium quality polyester fabric. These durable and hardy pants are good for all conditions of play. Available in various cut &amp; sew patterns as well as full sublimation option. Embroidery and printing of logo are both available choices in our trousers.</p>', '1', '750', '22', '24', '24', '290', '26', '28', '', '4', '9', '3', '', '2', '152', NULL, NULL, NULL, NULL, NULL, 'ODI USC P', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding of colour and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 5),
(35, 7, '10', 'Leg Slip R&Y', '', '<p>The Custom Cricket Company ODI playing trousers are made from premium quality polyester fabric. These durable and hardy pants are good for all conditions of play. Available in various cut &amp; sew patterns as well as full sublimation option. Embroidery and printing of logo are both available choices in our trousers.</p>', '1', '750', '22', '24', '24', '290', '26', '28', '', '4', '9', '4', '', '2', '153', NULL, NULL, NULL, NULL, NULL, 'ODI USC P', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding of colour and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 5),
(36, 7, '10', 'Leg Slip R&Y', '', '<p>The Custom Cricket Company ODI playing trousers are made from premium quality polyester fabric. These durable and hardy pants are good for all conditions of play. Available in various cut &amp; sew patterns as well as full sublimation option. Embroidery and printing of logo are both available choices in our trousers.</p>', '1', '750', '22', '24', '24', '290', '26', '28', '', '4', '9', '13', '', '2', '154', NULL, NULL, NULL, NULL, NULL, 'ODI USC P', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding of colour and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 5),
(37, 7, '10', 'Leg Slip B&Y', '', '<p>The Custom Cricket Company ODI playing trousers are made from premium quality polyester fabric. These durable and hardy pants are good for all conditions of play. Available in various cut &amp; sew patterns as well as full sublimation option. Embroidery and printing of logo are both available choices in our trousers.</p>', '1', '750', '22', '24', '24', '290', '26', '28', '', '4', '7', '1', '', '2', '155', NULL, NULL, NULL, NULL, NULL, 'ODI OCC P', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding of colour and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 6),
(38, 7, '10', 'Leg Slip B&Y', '', '<p>The Custom Cricket Company ODI playing trousers are made from premium quality polyester fabric. These durable and hardy pants are good for all conditions of play. Available in various cut &amp; sew patterns as well as full sublimation option. Embroidery and printing of logo are both available choices in our trousers.</p>', '1', '750', '22', '24', '24', '290', '26', '28', '', '4', '7', '2', '', '2', '156', NULL, NULL, NULL, NULL, NULL, 'ODI OCC P', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding of colour and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 6),
(39, 7, '10', 'Leg Slip B&Y', '', '<p>The Custom Cricket Company ODI playing trousers are made from premium quality polyester fabric. These durable and hardy pants are good for all conditions of play. Available in various cut &amp; sew patterns as well as full sublimation option. Embroidery and printing of logo are both available choices in our trousers.</p>', '1', '750', '22', '24', '24', '290', '26', '28', '', '4', '7', '3', '', '2', '157', NULL, NULL, NULL, NULL, NULL, 'ODI OCC P', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding of colour and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 6),
(40, 7, '10', 'Leg Slip B&Y', '', '<p>The Custom Cricket Company ODI playing trousers are made from premium quality polyester fabric. These durable and hardy pants are good for all conditions of play. Available in various cut &amp; sew patterns as well as full sublimation option. Embroidery and printing of logo are both available choices in our trousers.</p>', '1', '750', '22', '24', '24', '290', '26', '28', '', '4', '7', '4', '', '2', '158', NULL, NULL, NULL, NULL, NULL, 'ODI OCC P', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding of colour and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 6),
(41, 7, '10', 'Leg Slip B&Y', '', '<p>The Custom Cricket Company ODI playing trousers are made from premium quality polyester fabric. These durable and hardy pants are good for all conditions of play. Available in various cut &amp; sew patterns as well as full sublimation option. Embroidery and printing of logo are both available choices in our trousers.</p>', '1', '750', '22', '24', '24', '290', '26', '28', '', '4', '7', '13', '', '2', '159', NULL, NULL, NULL, NULL, NULL, 'ODI OCC P', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding of colour and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 6),
(42, 7, '0', 'Googly', '', '<p>The Custom Cricket ODI/ T20 tees are made from light weight Dri-Fit fabric with the cut &amp; sew technique. Cut &amp; Sew is used a lot in sports garments with a combination of two colour fabric to create a cool and stylish pattern for cricketers to flaunt in. &nbsp;</p>', '1', '850', '24', '24', '24', '', '26', '', '', '4', '8', '1', '', '2', '192', NULL, NULL, NULL, NULL, NULL, 'Googly', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket company on the right chest</li>\n<li>100% polyester</li>\n<li>160 gsm</li>\n<li>Polo collar</li>\n<li>Cut &amp; Sew technique</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', 'In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.', '', '', '', '', '', 1),
(43, 7, '0', 'Googly', '', '<p>The Custom Cricket ODI/ T20 tees are made from light weight Dri-Fit fabric with the cut &amp; sew technique. Cut &amp; Sew is used a lot in sports garments with a combination of two colour fabric to create a cool and stylish pattern for cricketers to flaunt in. &nbsp;</p>', '1', '850', '24', '24', '24', '', '26', '', '', '4', '8', '2', '', '2', '193', NULL, NULL, NULL, NULL, NULL, 'Googly', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket company on the right chest</li>\n<li>100% polyester</li>\n<li>160 gsm</li>\n<li>Polo collar</li>\n<li>Cut &amp; Sew technique</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', 'In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.', '', '', '', '', '', 1),
(44, 7, '0', 'Google', '', '<p>The Custom Cricket ODI/ T20 tees are made from light weight Dri-Fit fabric with the cut &amp; sew technique. Cut &amp; Sew is used a lot in sports garments with a combination of two colour fabric to create a cool and stylish pattern for cricketers to flaunt in. &nbsp;</p>', '1', '850', '24', '24', '24', '', '26', '', '', '4', '8', '3', '', '2', '194', NULL, NULL, NULL, NULL, NULL, 'Googly', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket company on the right chest</li>\n<li>100% polyester</li>\n<li>160 gsm</li>\n<li>Polo collar</li>\n<li>Cut &amp; Sew technique</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', 'In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.', '', '', '', '', '', 1),
(45, 7, '0', 'Googly', '', '<p>The Custom Cricket ODI/ T20 tees are made from light weight Dri-Fit fabric with the cut &amp; sew technique. Cut &amp; Sew is used a lot in sports garments with a combination of two colour fabric to create a cool and stylish pattern for cricketers to flaunt in. &nbsp;</p>', '1', '850', '24', '24', '24', '', '26', '', '', '4', '8', '4', '', '2', '195', NULL, NULL, NULL, NULL, NULL, 'Googly', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket company on the right chest</li>\n<li>100% polyester</li>\n<li>160 gsm</li>\n<li>Polo collar</li>\n<li>Cut &amp; Sew technique</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', 'In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.', '', '', '', '', '', 1),
(46, 7, '0', 'Googly', '', '<p>The Custom Cricket ODI/ T20 tees are made from light weight Dri-Fit fabric with the cut &amp; sew technique. Cut &amp; Sew is used a lot in sports garments with a combination of two colour fabric to create a cool and stylish pattern for cricketers to flaunt in. &nbsp;</p>', '1', '850', '24', '24', '24', '', '26', '', '', '4', '8', '13', '', '2', '198', NULL, NULL, NULL, NULL, NULL, 'Googly', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket company on the right chest</li>\n<li>100% polyester</li>\n<li>160 gsm</li>\n<li>Polo collar</li>\n<li>Cut &amp; Sew technique</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', 'In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.', '', '', '', '', '', 1),
(47, 7, '0', 'Grubber', '', '<p>The Custom Cricket ODI/ T20 tees are made from light weight Dri-Fit fabric with the cut &amp; sew technique. Cut &amp; Sew is used a lot in sports garments with a combination of two colour fabric to create a cool and stylish pattern for cricketers to flaunt in. &nbsp;</p>', '1', '850', '24', '24', '24', '', '26', '', '', '4', '9', '1', '', '2', '196', NULL, NULL, NULL, NULL, NULL, 'Grubber Tee', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket company on the right chest</li>\n<li>100% polyester</li>\n<li>160 gsm</li>\n<li>Polo collar</li>\n<li>Cut &amp; Sew technique</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', 'In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.', '', '', '', '', '', 1),
(48, 7, '0', 'Grubber', '', '<p>The Custom Cricket ODI/ T20 tees are made from light weight Dri-Fit fabric with the cut &amp; sew technique. Cut &amp; Sew is used a lot in sports garments with a combination of two colour fabric to create a cool and stylish pattern for cricketers to flaunt in. &nbsp;</p>', '1', '850', '24', '24', '24', '', '26', '', '', '4', '9', '2', '', '2', '197', NULL, NULL, NULL, NULL, NULL, 'Grubber Tee', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket company on the right chest</li>\n<li>100% polyester</li>\n<li>160 gsm</li>\n<li>Polo collar</li>\n<li>Cut &amp; Sew technique</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', 'In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.', '', '', '', '', '', 1),
(49, 7, '0', 'Grubber', '', '<p>The Custom Cricket ODI/ T20 tees are made from light weight Dri-Fit fabric with the cut &amp; sew technique. Cut &amp; Sew is used a lot in sports garments with a combination of two colour fabric to create a cool and stylish pattern for cricketers to flaunt in. &nbsp;</p>', '1', '850', '24', '24', '24', '', '26', '', '', '4', '9', '3', '', '2', '198', NULL, NULL, NULL, NULL, NULL, 'Grubber Tee', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket company on the right chest</li>\n<li>100% polyester</li>\n<li>160 gsm</li>\n<li>Polo collar</li>\n<li>Cut &amp; Sew technique</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', 'In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.', '', '', '', '', '', 1),
(50, 7, '0', 'Grubber', '', '<p>The Custom Cricket ODI/ T20 tees are made from light weight Dri-Fit fabric with the cut &amp; sew technique. Cut &amp; Sew is used a lot in sports garments with a combination of two colour fabric to create a cool and stylish pattern for cricketers to flaunt in. &nbsp;</p>', '1', '850', '24', '24', '24', '', '26', '', '', '4', '9', '4', '', '2', '198', NULL, NULL, NULL, NULL, NULL, 'Grubber Tee', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket company on the right chest</li>\n<li>100% polyester</li>\n<li>160 gsm</li>\n<li>Polo collar</li>\n<li>Cut &amp; Sew technique</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', 'In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.', '', '', '', '', '', 1),
(51, 7, '0', 'Grubber', '', '<p>The Custom Cricket ODI/ T20 tees are made from light weight Dri-Fit fabric with the cut &amp; sew technique. Cut &amp; Sew is used a lot in sports garments with a combination of two colour fabric to create a cool and stylish pattern for cricketers to flaunt in. &nbsp;</p>', '1', '850', '24', '24', '24', '', '26', '', '', '4', '9', '13', '', '2', '199', NULL, NULL, NULL, NULL, NULL, 'Grubber Tee', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket company on the right chest</li>\n<li>100% polyester</li>\n<li>160 gsm</li>\n<li>Polo collar</li>\n<li>Cut &amp; Sew technique</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', 'In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.', '', '', '', '', '', 1),
(52, 7, '0', 'Plumb', '', '<p>The Custom Cricket ODI/ T20 tees are made from light weight Dri-Fit fabric with the cut &amp; sew technique. Cut &amp; Sew is used a lot in sports garments with a combination of two colour fabric to create a cool and stylish pattern for cricketers to flaunt in. &nbsp;</p>', '1', '850', '24', '24', '24', '', '26', '', '', '4', '6', '1', '', '2', '200', NULL, NULL, NULL, NULL, NULL, 'Plumb Tee', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket company on the right chest</li>\n<li>100% polyester</li>\n<li>160 gsm</li>\n<li>Polo collar</li>\n<li>Cut &amp; Sew technique</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', 'In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.', '', '', '', '', '', 1),
(53, 7, '0', 'Plumb', '', '<p>The Custom Cricket ODI/ T20 tees are made from light weight Dri-Fit fabric with the cut &amp; sew technique. Cut &amp; Sew is used a lot in sports garments with a combination of two colour fabric to create a cool and stylish pattern for cricketers to flaunt in. &nbsp;</p>', '1', '850', '24', '24', '24', '', '26', '', '', '4', '6', '2', '', '2', '203', NULL, NULL, NULL, NULL, NULL, 'Plumb Tee', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(54, 7, '0', 'Plumb', '', '<p>The Custom Cricket ODI/ T20 tees are made from light weight Dri-Fit fabric with the cut &amp; sew technique. Cut &amp; Sew is used a lot in sports garments with a combination of two colour fabric to create a cool and stylish pattern for cricketers to flaunt in. &nbsp;</p>', '1', '850', '24', '24', '24', '', '26', '', '', '4', '6', '3', '', '2', '204', NULL, NULL, NULL, NULL, NULL, 'Plumb Tee', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(55, 7, '0', 'Plumb', '', '<p>The Custom Cricket ODI/ T20 tees are made from light weight Dri-Fit fabric with the cut &amp; sew technique. Cut &amp; Sew is used a lot in sports garments with a combination of two colour fabric to create a cool and stylish pattern for cricketers to flaunt in. &nbsp;</p>', '1', '850', '24', '24', '24', '', '26', '', '', '4', '6', '4', '', '2', '205', NULL, NULL, NULL, NULL, NULL, 'Plumb Tee', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(56, 7, '0', 'Plumb', '', '<p>The Custom Cricket ODI/ T20 tees are made from light weight Dri-Fit fabric with the cut &amp; sew technique. Cut &amp; Sew is used a lot in sports garments with a combination of two colour fabric to create a cool and stylish pattern for cricketers to flaunt in. &nbsp;</p>', '1', '850', '24', '24', '24', '', '26', '', '', '4', '6', '13', '', '2', '206', NULL, NULL, NULL, NULL, NULL, 'Plumb Tee', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(57, 7, '0', 'Floater', '', '<p style="text-align: justify;">The Custom Cricket ODI/ T20 tees are made from light weight Dri-Fit fabric with the cut &amp; sew technique. Cut &amp; Sew is used a lot in sports garments with a combination of two colour fabric to create a cool and stylish pattern for cricketers to flaunt in. &nbsp;</p>', '1', '850', '24', '24', '24', '', '26', '', '', '4', '8', '1', '', '2', '217', NULL, NULL, NULL, NULL, NULL, 'Floater ODI', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket company on the right chest</li>\n<li>100% polyester</li>\n<li>160 gsm</li>\n<li>Polo collar</li>\n<li>Cut &amp; Sew technique</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', 'In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.', '', '', '', '', '', 0),
(58, 7, '0', 'Floater', '', '<p style="text-align: justify;">The Custom Cricket ODI/ T20 tees are made from light weight Dri-Fit fabric with the cut &amp; sew technique. Cut &amp; Sew is used a lot in sports garments with a combination of two colour fabric to create a cool and stylish pattern for cricketers to flaunt in. &nbsp;</p>', '1', '850', '24', '24', '24', '', '26', '', '', '4', '8', '2', '', '2', '218', NULL, NULL, NULL, NULL, NULL, 'Floater ODI', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket company on the right chest</li>\n<li>100% polyester</li>\n<li>160 gsm</li>\n<li>Polo collar</li>\n<li>Cut &amp; Sew technique</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', 'In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.', '', '', '', '', '', 0),
(59, 7, '0', 'Floater', '', '<p style="text-align: justify;">The Custom Cricket ODI/ T20 tees are made from light weight Dri-Fit fabric with the cut &amp; sew technique. Cut &amp; Sew is used a lot in sports garments with a combination of two colour fabric to create a cool and stylish pattern for cricketers to flaunt in. &nbsp;</p>', '1', '850', '24', '24', '24', '', '26', '', '', '4', '4', '3', '', '2', '219', NULL, NULL, NULL, NULL, NULL, 'Floater ODI', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket company on the right chest</li>\n<li>100% polyester</li>\n<li>160 gsm</li>\n<li>Polo collar</li>\n<li>Cut &amp; Sew technique</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', 'In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.', '', '', '', '', '', 0),
(60, 7, '0', 'Floater', '', '<p style="text-align: justify;">The Custom Cricket ODI/ T20 tees are made from light weight Dri-Fit fabric with the cut &amp; sew technique. Cut &amp; Sew is used a lot in sports garments with a combination of two colour fabric to create a cool and stylish pattern for cricketers to flaunt in. &nbsp;</p>', '1', '850', '24', '24', '24', '', '26', '', '', '4', '8', '4', '', '2', '220', NULL, NULL, NULL, NULL, NULL, 'Floater ODI', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket company on the right chest</li>\n<li>100% polyester</li>\n<li>160 gsm</li>\n<li>Polo collar</li>\n<li>Cut &amp; Sew technique</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', 'In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.', '', '', '', '', '', 0),
(61, 7, '0', 'Floater', '', '<p style="text-align: justify;">The Custom Cricket ODI/ T20 tees are made from light weight Dri-Fit fabric with the cut &amp; sew technique. Cut &amp; Sew is used a lot in sports garments with a combination of two colour fabric to create a cool and stylish pattern for cricketers to flaunt in. &nbsp;</p>', '1', '850', '24', '24', '24', '', '26', '', '', '4', '8', '13', '', '2', '221', NULL, NULL, NULL, NULL, NULL, 'Floater ODI', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket company on the right chest</li>\n<li>100% polyester</li>\n<li>160 gsm</li>\n<li>Polo collar</li>\n<li>Cut &amp; Sew technique</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', 'In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.', '', '', '', '', '', 0),
(62, 7, '0', 'Long Leg ODI', '', '<p>The Custom Cricket Company Long Leg playing pants are made from premium quality polyester fabric designed for everyday comfort. The fabric gives a twill look. The fabric is made of double yarn hence making it heavier in weight and more durable for hardy playing conditions.</p>', '1', '850', '22', '24', '24', '', '26', '', '', '4', '3', '1', '', '2', '222', NULL, NULL, NULL, NULL, NULL, 'Long Leg ODI', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions&nbsp;</li>\n</ul>', 'In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.', '', '', '', '', '', 8),
(63, 7, '0', 'Long Leg ODI', '', '<p>The Custom Cricket Company Long Leg playing pants are made from premium quality polyester fabric designed for everyday comfort. The fabric gives a twill look. The fabric is made of double yarn hence making it heavier in weight and more durable for hardy playing conditions.</p>', '1', '850', '22', '24', '24', '', '26', '', '', '4', '3', '2', '', '2', '223', NULL, NULL, NULL, NULL, NULL, 'Long Leg ODI', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions&nbsp;</li>\n</ul>', 'In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.', '', '', '', '', '', 8),
(64, 7, '0', 'Long Leg ODI', '', '<p>The Custom Cricket Company Long Leg playing pants are made from premium quality polyester fabric designed for everyday comfort. The fabric gives a twill look. The fabric is made of double yarn hence making it heavier in weight and more durable for hardy playing conditions.</p>', '1', '850', '22', '24', '24', '', '26', '', '', '4', '3', '3', '', '2', '224', NULL, NULL, NULL, NULL, NULL, 'Long Leg ODI', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions&nbsp;</li>\n</ul>', 'In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.', '', '', '', '', '', 8),
(65, 7, '0', 'Long Leg ODI', '', '<p>The Custom Cricket Company Long Leg playing pants are made from premium quality polyester fabric designed for everyday comfort. The fabric gives a twill look. The fabric is made of double yarn hence making it heavier in weight and more durable for hardy playing conditions.</p>', '1', '850', '22', '24', '24', '', '26', '', '', '4', '3', '4', '', '2', '225', NULL, NULL, NULL, NULL, NULL, 'Long Leg ODI', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions&nbsp;</li>\n</ul>', 'In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.', '', '', '', '', '', 8),
(66, 7, '0', 'Long Leg ODI', '', '<p>The Custom Cricket Company Long Leg playing pants are made from premium quality polyester fabric designed for everyday comfort. The fabric gives a twill look. The fabric is made of double yarn hence making it heavier in weight and more durable for hardy playing conditions.</p>', '1', '850', '22', '24', '24', '', '26', '', '', '4', '3', '13', '', '2', '226', NULL, NULL, NULL, NULL, NULL, 'Long Leg ODI', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions&nbsp;</li>\n</ul>', 'In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.', '', '', '', '', '', 8),
(67, 7, '0', 'Square Leg ODI', '', '<p>The Custom Cricket Company Square Leg is a modern playing pant which is made from premium quality polyester fabric designed for regular usage. They have strategically positioned mesh panel for increased cooling and comfort on the sides of the thigh.</p>', '1', '850', '22', '24', '24', '', '26', '', '', '4', '9', '1', '', '2', '227', NULL, NULL, NULL, NULL, NULL, 'Square Leg ODI', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions&nbsp;</li>\n</ul>', 'In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.', '', '', '', '', '', 9),
(68, 7, '0', 'Square Leg ODI', '', '<p>The Custom Cricket Company Square Leg is a modern playing pant which is made from premium quality polyester fabric designed for regular usage. They have strategically positioned mesh panel for increased cooling and comfort on the sides of the thigh.</p>', '1', '850', '22', '24', '24', '', '26', '', '', '4', '9', '2', '', '2', '228', NULL, NULL, NULL, NULL, NULL, 'Square Leg ODI', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions&nbsp;</li>\n</ul>', 'In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.', '', '', '', '', '', 9),
(69, 7, '0', 'Square Leg ODI', '', '<p>The Custom Cricket Company Square Leg is a modern playing pant which is made from premium quality polyester fabric designed for regular usage. They have strategically positioned mesh panel for increased cooling and comfort on the sides of the thigh.</p>', '1', '850', '22', '24', '24', '', '26', '', '', '4', '9', '3', '', '2', '229', NULL, NULL, NULL, NULL, NULL, 'Square Leg ODI', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions&nbsp;</li>\n</ul>', 'In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.', '', '', '', '', '', 9),
(70, 7, '0', 'Square Leg ODI', '', '<p>The Custom Cricket Company Square Leg is a modern playing pant which is made from premium quality polyester fabric designed for regular usage. They have strategically positioned mesh panel for increased cooling and comfort on the sides of the thigh.</p>', '1', '850', '22', '24', '24', '', '26', '', '', '4', '9', '4', '', '2', '230', NULL, NULL, NULL, NULL, NULL, 'Square Leg ODI', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions&nbsp;</li>\n</ul>', 'In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.', '', '', '', '', '', 9),
(71, 7, '0', 'Square Leg ODI', '', '<p>The Custom Cricket Company Square Leg is a modern playing pant which is made from premium quality polyester fabric designed for regular usage. They have strategically positioned mesh panel for increased cooling and comfort on the sides of the thigh.</p>', '1', '850', '22', '24', '24', '', '26', '', '', '4', '9', '13', '', '2', '231', NULL, NULL, NULL, NULL, NULL, 'Square Leg ODI', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions&nbsp;</li>\n</ul>', 'In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.', '', '', '', '', '', 9),
(72, 7, '0', 'Fine Leg ODI', '', '<p>The Custom Cricket Company Fine Leg playing pants are made from premium quality polyester fabric designed for regukar use. The black trim on the sides and at the back of the pant make it look stylish and sleek for the modern cricketer.</p>', '1', '850', '22', '24', '24', '', '26', '', '', '4', '7', '1', '', '2', '232', NULL, NULL, NULL, NULL, NULL, 'Fine Leg ODI', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions&nbsp;</li>\n</ul>', 'In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.', '', '', '', '', '', 7),
(73, 7, '0', 'Fine Leg ODI', '', '<p>The Custom Cricket Company Fine Leg playing pants are made from premium quality polyester fabric designed for regukar use. The black trim on the sides and at the back of the pant make it look stylish and sleek for the modern cricketer.</p>', '1', '850', '22', '24', '24', '', '26', '', '', '4', '7', '2', '', '2', '233', NULL, NULL, NULL, NULL, NULL, 'Fine Leg ODI', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions&nbsp;</li>\n</ul>', 'In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.', '', '', '', '', '', 7);
INSERT INTO `fynx_product` (`id`, `subcategory`, `quantity`, `name`, `type`, `description`, `visibility`, `INR`, `USD`, `GBP`, `EUR`, `ZAF`, `AUD`, `NZD`, `relatedproduct`, `category`, `color`, `size`, `sizechart`, `status`, `sku`, `image1`, `image2`, `image3`, `image4`, `image5`, `baseproduct`, `discountINR`, `discountUSD`, `discountGBP`, `discountEUR`, `discountZAF`, `discountAUD`, `discountNZD`, `care`, `detail`, `delivery`, `categorycare`, `build`, `features`, `note`, `minimumquantity`, `order`) VALUES
(74, 7, '0', 'Fine Leg ODI', '', '<p>The Custom Cricket Company Fine Leg playing pants are made from premium quality polyester fabric designed for regukar use. The black trim on the sides and at the back of the pant make it look stylish and sleek for the modern cricketer.</p>', '1', '850', '22', '24', '24', '', '26', '', '', '4', '7', '3', '', '2', '234', NULL, NULL, NULL, NULL, NULL, 'Fine Leg ODI', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions&nbsp;</li>\n</ul>', 'In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.', '', '', '', '', '', 7),
(75, 7, '0', 'Fine Leg ODI', '', '<p>The Custom Cricket Company Fine Leg playing pants are made from premium quality polyester fabric designed for regukar use. The black trim on the sides and at the back of the pant make it look stylish and sleek for the modern cricketer.</p>', '1', '850', '22', '24', '24', '', '26', '', '', '4', '7', '4', '', '2', '235', NULL, NULL, NULL, NULL, NULL, 'Fine Leg ODI', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions&nbsp;</li>\n</ul>', 'In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.', '', '', '', '', '', 7),
(76, 7, '0', 'Fine Leg ODI', '', '<p>The Custom Cricket Company Fine Leg playing pants are made from premium quality polyester fabric designed for regukar use. The black trim on the sides and at the back of the pant make it look stylish and sleek for the modern cricketer.</p>', '1', '850', '22', '24', '24', '', '26', '', '', '4', '7', '13', '', '2', '236', NULL, NULL, NULL, NULL, NULL, 'Fine Leg ODI', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions&nbsp;</li>\n</ul>', 'In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.', '', '', '', '', '', 7),
(77, 7, '0', 'Long On ODI', '', '<p>The Custom Cricket Company Long On&nbsp;playing pants are made from premium quality polyester fabric designed for regukar use. The black trim on the sides and at the back of the pant make it look stylish and sleek for the modern cricketer.</p>', '1', '850', '22', '24', '24', '', '26', '', '', '4', '2', '1', '', '2', '237', NULL, NULL, NULL, NULL, NULL, 'Long On Pants', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions&nbsp;</li>\n</ul>', 'In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.', '', '', '', '', '', 10),
(78, 7, '0', 'Long On ODI', '', '<p>The Custom Cricket Company Long On&nbsp;playing pants are made from premium quality polyester fabric designed for regukar use. The black trim on the sides and at the back of the pant make it look stylish and sleek for the modern cricketer.</p>', '1', '850', '22', '24', '24', '', '26', '', '', '4', '2', '2', '', '2', '238', NULL, NULL, NULL, NULL, NULL, 'Long On Pants', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions&nbsp;</li>\n</ul>', 'In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.', '', '', '', '', '', 10),
(79, 7, '0', 'Long On ODI', '', '<p>The Custom Cricket Company Long On&nbsp;playing pants are made from premium quality polyester fabric designed for regukar use. The black trim on the sides and at the back of the pant make it look stylish and sleek for the modern cricketer.</p>', '1', '850', '22', '24', '24', '', '26', '', '', '4', '2', '3', '', '2', '239', NULL, NULL, NULL, NULL, NULL, 'Long On Pants', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions&nbsp;</li>\n</ul>', 'In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.', '', '', '', '', '', 10),
(80, 7, '0', 'Long On ODI', '', '<p>The Custom Cricket Company Long On&nbsp;playing pants are made from premium quality polyester fabric designed for regukar use. The black trim on the sides and at the back of the pant make it look stylish and sleek for the modern cricketer.</p>', '1', '850', '22', '24', '24', '', '26', '', '', '4', '2', '4', '', '2', '240', NULL, NULL, NULL, NULL, NULL, 'Long On Pants', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions&nbsp;</li>\n</ul>', 'In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.', '', '', '', '', '', 10),
(81, 7, '0', 'Long On ODI', '', '<p>The Custom Cricket Company Long On&nbsp;playing pants are made from premium quality polyester fabric designed for regukar use. The black trim on the sides and at the back of the pant make it look stylish and sleek for the modern cricketer.</p>', '1', '850', '22', '24', '24', '', '26', '', '', '4', '2', '13', '', '2', '241', NULL, NULL, NULL, NULL, NULL, 'Long On Pants', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions&nbsp;</li>\n</ul>', 'In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.', '', '', '', '', '', 10),
(82, 7, '0', 'Googly', '', '<p>The Custom Cricket ODI/ T20 tees are made from light weight Dri-Fit fabric with the cut &amp; sew technique. Cut &amp; Sew is used a lot in sports garments with a combination of two colour fabric to create a cool and stylish pattern for cricketers to flaunt in. &nbsp;</p>', '1', '850', '24', '24', '24', '', '26', '', '', '4', '8', '14', '', '2', '301', NULL, NULL, NULL, NULL, NULL, 'Googly', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket company on the right chest</li>\n<li>100% polyester</li>\n<li>160 gsm</li>\n<li>Polo collar</li>\n<li>Cut &amp; Sew technique</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', 'In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.', '', '', '', '', '', 1),
(83, 7, '0', 'Googly', '', '<p>The Custom Cricket ODI/ T20 tees are made from light weight Dri-Fit fabric with the cut &amp; sew technique. Cut &amp; Sew is used a lot in sports garments with a combination of two colour fabric to create a cool and stylish pattern for cricketers to flaunt in. &nbsp;</p>', '1', '850', '24', '24', '24', '', '26', '', '', '4', '8', '15', '', '2', '302', NULL, NULL, NULL, NULL, NULL, 'Googly', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket company on the right chest</li>\n<li>100% polyester</li>\n<li>160 gsm</li>\n<li>Polo collar</li>\n<li>Cut &amp; Sew technique</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', 'In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.', '', '', '', '', '', 1),
(84, 7, '0', 'Grubber', '', '<p>The Custom Cricket ODI/ T20 tees are made from light weight Dri-Fit fabric with the cut &amp; sew technique. Cut &amp; Sew is used a lot in sports garments with a combination of two colour fabric to create a cool and stylish pattern for cricketers to flaunt in. &nbsp;</p>', '1', '850', '24', '24', '24', '', '26', '', '', '4', '9', '14', '', '2', '303', NULL, NULL, NULL, NULL, NULL, 'Grubber Tee', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket company on the right chest</li>\n<li>100% polyester</li>\n<li>160 gsm</li>\n<li>Polo collar</li>\n<li>Cut &amp; Sew technique</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', 'In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.', '', '', '', '', '', 1),
(85, 7, '0', 'Grubber', '', '<p>The Custom Cricket ODI/ T20 tees are made from light weight Dri-Fit fabric with the cut &amp; sew technique. Cut &amp; Sew is used a lot in sports garments with a combination of two colour fabric to create a cool and stylish pattern for cricketers to flaunt in. &nbsp;</p>', '1', '850', '24', '24', '24', '', '26', '', '', '4', '9', '15', '', '2', '304', NULL, NULL, NULL, NULL, NULL, 'Grubber Tee', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket company on the right chest</li>\n<li>100% polyester</li>\n<li>160 gsm</li>\n<li>Polo collar</li>\n<li>Cut &amp; Sew technique</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', 'In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.', '', '', '', '', '', 1),
(86, 7, '0', 'Plumb', '', '<p>The Custom Cricket ODI/ T20 tees are made from light weight Dri-Fit fabric with the cut &amp; sew technique. Cut &amp; Sew is used a lot in sports garments with a combination of two colour fabric to create a cool and stylish pattern for cricketers to flaunt in. &nbsp;</p>', '1', '850', '24', '24', '24', '', '26', '', '', '4', '6', '14', '', '2', '305', NULL, NULL, NULL, NULL, NULL, 'Plumb Tee', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(87, 7, '0', 'Plumb', '', '<p>The Custom Cricket ODI/ T20 tees are made from light weight Dri-Fit fabric with the cut &amp; sew technique. Cut &amp; Sew is used a lot in sports garments with a combination of two colour fabric to create a cool and stylish pattern for cricketers to flaunt in. &nbsp;</p>', '1', '850', '24', '24', '24', '', '26', '', '', '4', '6', '15', '', '2', '306', NULL, NULL, NULL, NULL, NULL, 'Plumb Tee', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(88, 7, '0', 'Floater', '', '<p style="text-align: justify;">The Custom Cricket ODI/ T20 tees are made from light weight Dri-Fit fabric with the cut &amp; sew technique. Cut &amp; Sew is used a lot in sports garments with a combination of two colour fabric to create a cool and stylish pattern for cricketers to flaunt in. &nbsp;</p>', '1', '850', '24', '24', '24', '', '26', '', '', '4', '8', '14', '', '2', '310', NULL, NULL, NULL, NULL, NULL, 'Floater ODI', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket company on the right chest</li>\n<li>100% polyester</li>\n<li>160 gsm</li>\n<li>Polo collar</li>\n<li>Cut &amp; Sew technique</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', 'In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.', '', '', '', '', '', 0),
(89, 7, '0', 'Floater', '', '<p style="text-align: justify;">The Custom Cricket ODI/ T20 tees are made from light weight Dri-Fit fabric with the cut &amp; sew technique. Cut &amp; Sew is used a lot in sports garments with a combination of two colour fabric to create a cool and stylish pattern for cricketers to flaunt in. &nbsp;</p>', '1', '850', '24', '24', '24', '', '26', '', '', '4', '8', '15', '', '2', '311', NULL, NULL, NULL, NULL, NULL, 'Floater ODI', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket company on the right chest</li>\n<li>100% polyester</li>\n<li>160 gsm</li>\n<li>Polo collar</li>\n<li>Cut &amp; Sew technique</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', 'In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.', '', '', '', '', '', 0),
(90, 7, '0', 'Long Leg ODI', '', '<p>The Custom Cricket Company Long Leg playing pants are made from premium quality polyester fabric designed for everyday comfort. The fabric gives a twill look. The fabric is made of double yarn hence making it heavier in weight and more durable for hardy playing conditions.</p>', '1', '850', '22', '24', '24', '', '26', '', '', '4', '3', '14', '', '2', '315', NULL, NULL, NULL, NULL, NULL, 'Long Leg ODI', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions&nbsp;</li>\n</ul>', 'In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.', '', '', '', '', '', 8),
(91, 7, '0', 'Long Leg ODI', '', '<p>The Custom Cricket Company Long Leg playing pants are made from premium quality polyester fabric designed for everyday comfort. The fabric gives a twill look. The fabric is made of double yarn hence making it heavier in weight and more durable for hardy playing conditions.</p>', '1', '850', '22', '24', '24', '', '26', '', '', '4', '3', '15', '', '2', '316', NULL, NULL, NULL, NULL, NULL, 'Long Leg ODI', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions&nbsp;</li>\n</ul>', 'In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.', '', '', '', '', '', 8),
(92, 7, '0', 'Long Leg ODI', '', '<p>The Custom Cricket Company Long Leg playing pants are made from premium quality polyester fabric designed for everyday comfort. The fabric gives a twill look. The fabric is made of double yarn hence making it heavier in weight and more durable for hardy playing conditions.</p>', '1', '850', '22', '24', '24', '', '26', '', '', '4', '3', '16', '', '2', '317', NULL, NULL, NULL, NULL, NULL, 'Long Leg ODI', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions&nbsp;</li>\n</ul>', 'In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.', '', '', '', '', '', 8),
(93, 7, '0', 'Square Leg ODI', '', '<p>The Custom Cricket Company Square Leg is a modern playing pant which is made from premium quality polyester fabric designed for regular usage. They have strategically positioned mesh panel for increased cooling and comfort on the sides of the thigh.</p>', '1', '850', '22', '24', '24', '', '26', '', '', '4', '9', '14', '', '2', '318', NULL, NULL, NULL, NULL, NULL, 'Square Leg ODI', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions&nbsp;</li>\n</ul>', 'In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.', '', '', '', '', '', 9),
(94, 7, '0', 'Square Leg ODI', '', '<p>The Custom Cricket Company Square Leg is a modern playing pant which is made from premium quality polyester fabric designed for regular usage. They have strategically positioned mesh panel for increased cooling and comfort on the sides of the thigh.</p>', '1', '850', '22', '24', '24', '', '26', '', '', '4', '9', '15', '', '2', '319', NULL, NULL, NULL, NULL, NULL, 'Square Leg ODI', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions&nbsp;</li>\n</ul>', 'In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.', '', '', '', '', '', 9),
(95, 7, '0', 'Square Leg ODI', '', '<p>The Custom Cricket Company Square Leg is a modern playing pant which is made from premium quality polyester fabric designed for regular usage. They have strategically positioned mesh panel for increased cooling and comfort on the sides of the thigh.</p>', '1', '850', '22', '24', '24', '', '26', '', '', '4', '9', '16', '', '2', '320', NULL, NULL, NULL, NULL, NULL, 'Square Leg ODI', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions&nbsp;</li>\n</ul>', 'In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.', '', '', '', '', '', 9),
(96, 7, '0', 'Fine Leg ODI', '', '<p>The Custom Cricket Company Fine Leg playing pants are made from premium quality polyester fabric designed for regukar use. The black trim on the sides and at the back of the pant make it look stylish and sleek for the modern cricketer.</p>', '1', '850', '22', '24', '24', '', '26', '', '', '4', '7', '14', '', '2', '321', NULL, NULL, NULL, NULL, NULL, 'Fine Leg ODI', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions&nbsp;</li>\n</ul>', 'In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.', '', '', '', '', '', 7),
(97, 7, '0', 'Fine Leg ODI', '', '<p>The Custom Cricket Company Fine Leg playing pants are made from premium quality polyester fabric designed for regukar use. The black trim on the sides and at the back of the pant make it look stylish and sleek for the modern cricketer.</p>', '1', '850', '22', '24', '24', '', '26', '', '', '4', '7', '15', '', '2', '322', NULL, NULL, NULL, NULL, NULL, 'Fine Leg ODI', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions&nbsp;</li>\n</ul>', 'In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.', '', '', '', '', '', 7),
(98, 7, '0', 'Fine Leg ODI', '', '<p>The Custom Cricket Company Fine Leg playing pants are made from premium quality polyester fabric designed for regukar use. The black trim on the sides and at the back of the pant make it look stylish and sleek for the modern cricketer.</p>', '1', '850', '22', '24', '24', '', '26', '', '', '4', '7', '16', '', '2', '323', NULL, NULL, NULL, NULL, NULL, 'Fine Leg ODI', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions&nbsp;</li>\n</ul>', 'In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.', '', '', '', '', '', 7),
(99, 7, '0', 'Long On ODI', '', '<p>The Custom Cricket Company Long On&nbsp;playing pants are made from premium quality polyester fabric designed for regukar use. The black trim on the sides and at the back of the pant make it look stylish and sleek for the modern cricketer.</p>', '1', '850', '22', '24', '24', '', '26', '', '', '4', '2', '14', '', '2', '324', NULL, NULL, NULL, NULL, NULL, 'Long On Pants', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions&nbsp;</li>\n</ul>', 'In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.', '', '', '', '', '', 10),
(100, 7, '0', 'Long On ODI', '', '<p>The Custom Cricket Company Long On&nbsp;playing pants are made from premium quality polyester fabric designed for regukar use. The black trim on the sides and at the back of the pant make it look stylish and sleek for the modern cricketer.</p>', '1', '850', '22', '24', '24', '', '26', '', '', '4', '2', '15', '', '2', '325', NULL, NULL, NULL, NULL, NULL, 'Long On Pants', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions&nbsp;</li>\n</ul>', 'In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.', '', '', '', '', '', 10),
(101, 7, '0', 'Long On ODI', '', '<p>The Custom Cricket Company Long On&nbsp;playing pants are made from premium quality polyester fabric designed for regukar use. The black trim on the sides and at the back of the pant make it look stylish and sleek for the modern cricketer.</p>', '1', '850', '22', '24', '24', '', '26', '', '', '4', '2', '16', '', '2', '326', NULL, NULL, NULL, NULL, NULL, 'Long On Pants', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions&nbsp;</li>\n</ul>', 'In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.', '', '', '', '', '', 10),
(102, 34, '7', 'Howzat 101', '', '<p style="text-align: justify;">Howzat 101 pads are our club grade&nbsp;cricket pads with traditional styling, cane rods and foam shine bolster with a outer wing design. Complete protection from impacts at club and league level. By far our most mass consumed cricket pad in-demand with organisations for large scale production.</p>', '1', '2750', '43', '39', '43', '1100', '65', '78', '', '6', '6', '7', '', '2', '116', NULL, NULL, NULL, NULL, NULL, 'Howzat Pad', '', '', '', '', '', '', '', '<p style="text-align: justify;">To prolong the life and effectiveness of your batting leg guards try to leave your pads in a shady area to dry with the straps open after a batting session. Never in the sun and never in your bag because the sun will cause the padding and foam to dry out and harden and in your bag it will keep the padded area moist which leads to wear and odour. Also,&nbsp;When you first buy your pads, leave them in your bag with the straps firmly tightened as if you were wearing them. This will get the pads shaped to fit your leg better. Happy batting!</p>', '<ul>\n<li>Traditional cane rods with HDF side wing protection</li>\n<li>Ergonomically shaped 3-piece shin bolster</li>\n<li>Lightweight design using tested and tried materials</li>\n<li>7 cane width, front and back pads to remove the bulkiness of modern pads keeping a lightweight structure in place while offering the best protection</li>\n<li>Shin bolster forms perfectly around the lower leg providing immense comfort and protection</li>\n</ul>', '<p>In-stock batting pads are available for immediate shipment. Customisation takes 4 weeks for worldwide delivery from date of order.</p>', '', '', '', '', '', 1),
(103, 34, '0', 'Howzat 101', '', '<p style="text-align: justify;">Howzat 101 pads are our club grade&nbsp;cricket pads with traditional styling, cane rods and foam shine bolster with a outer wing design. Complete protection from impacts at club and league level. By far our most mass consumed cricket pad in-demand with organisations for large scale production.</p>', '1', '2750', '43', '39', '43', '1100', '65', '78', '', '6', '6', '8', '', '2', '117', NULL, NULL, NULL, NULL, NULL, 'Howzat Pad', '', '', '', '', '', '', '', '<p>To prolong the life and effectiveness of your batting leg guards try to leave your pads in a shady area to dry with the straps open after a batting session. Never in the sun and never in your bag because the sun will cause the padding and foam to dry out and harden and in your bag it will keep the padded area moist which leads to wear and odour. Also,&nbsp;When you first buy your pads, leave them in your bag with the straps firmly tightened as if you were wearing them. This will get the pads shaped to fit your leg better. Happy batting!</p>', '<ul>\n<li>Traditional cane rods with HDF side wing protection</li>\n<li>Ergonomically shaped 3-piece shin bolster</li>\n<li>Lightweight design using tested and tried materials</li>\n<li>7 cane width, front and back pads to remove the bulkiness of modern pads keeping a lightweight structure in place while offering the best protection</li>\n<li>Shin bolster forms perfectly around the lower leg providing immense comfort and protection</li>\n</ul>', '<p>In-stock batting pads are available for immediate shipment. Customisation takes 4 weeks for worldwide delivery from date of order.</p>', '', '', '', '', '', 1),
(104, 34, '0', 'Inside Edge 202', '', '<p style="text-align: justify;">Inside Edge 202 is our traditionally styled leg guard with a touch of contemporary design elements and the most popular leg guard in our range. 202 is most suited and sought after for customisation by teams and organisations worldwide.</p>', '1', '3250', '65', '49', '65', '1250', '85', '96', '', '6', '7', '7', '', '2', '118', NULL, NULL, NULL, NULL, NULL, 'Inside Edge Pad', '', '', '', '', '', '', '', '<p style="text-align: justify;">To prolong the life and effectiveness of your batting leg guards try to leave your pads in a shady area to dry with the straps open after a batting session. Never in the sun and never in your bag because the sun will cause the padding and foam to dry out and harden and in your bag it will keep the padded area moist which leads to wear and odour. Also,&nbsp;When you first buy your pads, leave them in your bag with the straps firmly tightened as if you were wearing them. This will get the pads shaped to fit your leg better. Happy batting!</p>', '<ul>\n<li>Finest PU leather</li>\n<li>High density <em>plastazote</em> for absolute protection studded with large side wings</li>\n<li>Pre shaped for easy fit and light weighted traditional leg guard style</li>\n<li>Contour Knee uses a high impact plastic shield in the knee to allow greater comfort</li>\n<li>Knee Bolster - Produced using three separate components, our vertical bolsters generates critical protection and excellent shaping</li>\n<li>Shin Protection - shin bolster forms perfectly around the lower leg providing immense comfort and protection</li>\n<li>Extended side wing builds protection around the side of the leg using high density foam to shield against impacts</li>\n</ul>', '<p>In-stock batting pads are available for immediate shipment. Customisation takes 4 weeks for worldwide delivery from date of order.</p>', '', '', '', '', '', 2),
(105, 34, '1', 'Inside Edge 202', '', '<p style="text-align: justify;">Inside Edge 202 is our traditionally styled leg guard with a touch of contemporary design elements and the most popular leg guard in our range. 202 is most suited and sought after for customisation by teams and organisations worldwide.</p>', '1', '3250', '65', '49', '65', '1250', '85', '96', '', '6', '7', '8', '', '2', '119', NULL, NULL, NULL, NULL, NULL, 'Inside Edge Pad', '', '', '', '', '', '', '', '<p style="text-align: justify;">To prolong the life and effectiveness of your batting leg guards try to leave your pads in a shady area to dry with the straps open after a batting session. Never in the sun and never in your bag because the sun will cause the padding and foam to dry out and harden and in your bag it will keep the padded area moist which leads to wear and odour. Also,&nbsp;When you first buy your pads, leave them in your bag with the straps firmly tightened as if you were wearing them. This will get the pads shaped to fit your leg better. Happy batting!</p>', '<ul>\n<li>Finest PU leather</li>\n<li>High density <em>plastazote</em> for absolute protection studded with large side wings</li>\n<li>Pre shaped for easy fit and light weighted traditional leg guard style</li>\n<li>Contour Knee uses a high impact plastic shield in the knee to allow greater comfort</li>\n<li>Knee Bolster - Produced using three separate components, our vertical bolsters generates critical protection and excellent shaping</li>\n<li>Shin Protection - shin bolster forms perfectly around the lower leg providing immense comfort and protection</li>\n<li>Extended side wing builds protection around the side of the leg using high density foam to shield against impacts</li>\n</ul>', '<p>In-stock batting pads are available for immediate shipment. Customisation takes 4 weeks for worldwide delivery from date of order.</p>', '', '', '', '', '', 2),
(106, 34, '6', 'Not Out 303', '', '<p style="text-align: justify;">NOT OUT 303 is our top of the range batting pad crafted from a combination of traditional and modern materials that creates the ideal mix of playability and protection. This contemporary style pad is most popular with the modern cricketer.</p>', '1', '3950', '82', '59', '82', '1500', '109', '120', '', '6', '8', '7', '', '2', '120', NULL, NULL, NULL, NULL, NULL, 'Not Out Pad', '', '', '', '', '', '', '', '<p>To prolong the life and effectiveness of your batting leg guards try to leave your pads in a shady area to dry with the straps open after a batting session. Never in the sun and never in your bag because the sun will cause the padding and foam to dry out and harden and in your bag it will keep the padded area moist which leads to wear and odour. Also,&nbsp;When you first buy your pads, leave them in your bag with the straps firmly tightened as if you were wearing them. This will get the pads shaped to fit your leg better. Happy batting!</p>', '<ul>\n<li>Light weight PU facing front</li>\n<li>3D flexi fitting knee construction with a high impact plastic shield for greater protection</li>\n<li>HDF &amp; CANE - Our high density foam construction offers the ultimate protection from injury by instantly dissipating impacts</li>\n<li>Shin bolster forms perfectly around the lower leg providing immense comfort and protection</li>\n<li>Calf &amp; ankle straps come with cushioned lining</li>\n<li>Low rebound foam panels and monolithic side wings for the contemporary look</li>\n</ul>', '<p>In-stock batting pads are available for immediate shipment. Customisation takes 4 weeks for worldwide delivery from date of order.</p>', '', '', '', '', '', 3),
(107, 34, '0', 'Not Out 303', '', '<p style="text-align: justify;">NOT OUT 303 is our top of the range batting pad crafted from a combination of traditional and modern materials that creates the ideal mix of playability and protection. This contemporary style pad is most popular with the modern cricketer.</p>', '1', '3950', '82', '59', '82', '1500', '109', '120', '', '6', '8', '8', '', '2', '121', NULL, NULL, NULL, NULL, NULL, 'Not Out Pad', '', '', '', '', '', '', '', '<p>To prolong the life and effectiveness of your batting leg guards try to leave your pads in a shady area to dry with the straps open after a batting session. Never in the sun and never in your bag because the sun will cause the padding and foam to dry out and harden and in your bag it will keep the padded area moist which leads to wear and odour. Also,&nbsp;When you first buy your pads, leave them in your bag with the straps firmly tightened as if you were wearing them. This will get the pads shaped to fit your leg better. Happy batting!</p>', '<ul>\n<li>Light weight PU facing front</li>\n<li>3D flexi fitting knee construction with a high impact plastic shield for greater protection</li>\n<li>HDF &amp; CANE - Our high density foam construction offers the ultimate protection from injury by instantly dissipating impacts</li>\n<li>Shin bolster forms perfectly around the lower leg providing immense comfort and protection</li>\n<li>Calf &amp; ankle straps come with cushioned lining</li>\n<li>Low rebound foam panels and monolithic side wings for the contemporary look</li>\n</ul>', '<p>In-stock batting pads are available for immediate shipment. Customisation takes 4 weeks for worldwide delivery from date of order.</p>', '', '', '', '', '', 3),
(108, 8, '0', 'Pace', '', '<p style="text-align: justify;">The Custom Cricket Company training tees are made from light weight wicking / dri-fit fabric. This is a full sublimated jersey. Sublimation is by far the coolest and only way to fully customize every square inch of your jersey. The yellow, black and white gives is a fun graphical combination and one of our popular designs.</p>', '1', '700', '15', '16', '16', '395', '19', '33', '', '4', '2', '1', '', '2', '51', NULL, NULL, NULL, NULL, NULL, 'Pace', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>160 gsm</li>\n<li>Round neck</li>\n<li>Printing of logo</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 1),
(109, 8, '0', 'Pace', '', '<p style="text-align: justify;">The Custom Cricket Company training tees are made from light weight wicking / dri-fit fabric. This is a full sublimated jersey. Sublimation is by far the coolest and only way to fully customize every square inch of your jersey. The yellow, black and white gives is a fun graphical combination and one of our popular designs.</p>', '1', '700', '15', '16', '16', '395', '19', '33', '', '4', '2', '2', '', '2', '52', NULL, NULL, NULL, NULL, NULL, 'Pace', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>160 gsm</li>\n<li>Round neck</li>\n<li>Printing of logo</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 1),
(110, 8, '0', 'Pace', '', '<p style="text-align: justify;">The Custom Cricket Company training tees are made from light weight wicking / dri-fit fabric. This is a full sublimated jersey. Sublimation is by far the coolest and only way to fully customize every square inch of your jersey. The yellow, black and white gives is a fun graphical combination and one of our popular designs.</p>', '1', '700', '15', '16', '16', '395', '19', '33', '', '4', '2', '3', '', '2', '53', NULL, NULL, NULL, NULL, NULL, 'Pace', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>160 gsm</li>\n<li>Round neck</li>\n<li>Printing of logo</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 1),
(111, 8, '0', 'Pace', '', '<p style="text-align: justify;">The Custom Cricket Company training tees are made from light weight wicking / dri-fit fabric. This is a full sublimated jersey. Sublimation is by far the coolest and only way to fully customize every square inch of your jersey. The yellow, black and white gives is a fun graphical combination and one of our popular designs.</p>', '1', '700', '15', '16', '16', '395', '19', '33', '', '4', '2', '4', '', '2', '54', NULL, NULL, NULL, NULL, NULL, 'Pace', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>160 gsm</li>\n<li>Round neck</li>\n<li>Printing of logo</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 1),
(112, 8, '0', 'Pace', '', '<p style="text-align: justify;">The Custom Cricket Company training tees are made from light weight wicking / dri-fit fabric. This is a full sublimated jersey. Sublimation is by far the coolest and only way to fully customize every square inch of your jersey. The yellow, black and white gives is a fun graphical combination and one of our popular designs.</p>', '1', '700', '15', '16', '16', '395', '19', '33', '', '4', '2', '13', '', '2', '55', NULL, NULL, NULL, NULL, NULL, 'Pace', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>160 gsm</li>\n<li>Round neck</li>\n<li>Printing of logo</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 1),
(113, 8, '0', 'Drift', '', '<p style="text-align: justify;">The Drift training tee is made from light weight wicking fabric using the cut &amp; sew technique. The CCC logo on the right chest is printed but emboridery is an option for customisation along with many other choices.</p>', '1', '700', '15', '16', '16', '395', '19', '33', '', '4', '3', '1', '', '2', '56', NULL, NULL, NULL, NULL, NULL, 'Drift', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>180 GSM</li>\n<li>Round neck</li>\n<li>Printing of logo</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 2),
(114, 8, '0', 'Drift', '', '<p style="text-align: justify;">The Drift training tee is made from light weight wicking fabric using the cut &amp; sew technique. The CCC logo on the right chest is printed but emboridery is an option for customisation along with many other choices.</p>', '1', '700', '15', '16', '16', '395', '19', '33', '', '4', '3', '2', '', '2', '57', NULL, NULL, NULL, NULL, NULL, 'Drift', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>180 GSM</li>\n<li>Round neck</li>\n<li>Printing of logo</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 2),
(115, 8, '0', 'Drift', '', '<p style="text-align: justify;">The Drift training tee is made from light weight wicking fabric using the cut &amp; sew technique. The CCC logo on the right chest is printed but emboridery is an option for customisation along with many other choices.</p>', '1', '700', '15', '16', '16', '395', '19', '33', '', '4', '3', '3', '', '2', '58', NULL, NULL, NULL, NULL, NULL, 'Drift', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>180 GSM</li>\n<li>Round neck</li>\n<li>Printing of logo</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 2);
INSERT INTO `fynx_product` (`id`, `subcategory`, `quantity`, `name`, `type`, `description`, `visibility`, `INR`, `USD`, `GBP`, `EUR`, `ZAF`, `AUD`, `NZD`, `relatedproduct`, `category`, `color`, `size`, `sizechart`, `status`, `sku`, `image1`, `image2`, `image3`, `image4`, `image5`, `baseproduct`, `discountINR`, `discountUSD`, `discountGBP`, `discountEUR`, `discountZAF`, `discountAUD`, `discountNZD`, `care`, `detail`, `delivery`, `categorycare`, `build`, `features`, `note`, `minimumquantity`, `order`) VALUES
(116, 8, '0', 'Drift', '', '<p style="text-align: justify;">The Drift training tee is made from light weight wicking fabric using the cut &amp; sew technique. The CCC logo on the right chest is printed but emboridery is an option for customisation along with many other choices.</p>', '1', '700', '15', '16', '16', '395', '19', '33', '', '4', '3', '4', '', '2', '59', NULL, NULL, NULL, NULL, NULL, 'Drift', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>180 GSM</li>\n<li>Round neck</li>\n<li>Printing of logo</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 2),
(117, 8, '0', 'Drift', '', '<p style="text-align: justify;">The Drift training tee is made from light weight wicking fabric using the cut &amp; sew technique. The CCC logo on the right chest is printed but emboridery is an option for customisation along with many other choices.</p>', '1', '700', '15', '16', '16', '395', '19', '33', '', '4', '3', '13', '', '2', '60', NULL, NULL, NULL, NULL, NULL, 'Drift', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>180 GSM</li>\n<li>Round neck</li>\n<li>Printing of logo</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 2),
(118, 8, '0', 'Sprint', '', '<p style="text-align: justify;">The Sprint training shorts are designed for everyday comfort. These shorts have a great fit and its light weight fabric is engineered to be least intrusive. Neon trimmings adds just the right amount of style to our shorts which are ideal for warm-ups and post-match wear. Zipper pockets are useful to keep belongings safe during movement.</p>', '1', '650', '15', '14', '16', '250', '18', '20', '', '4', '3', '1', '', '2', '61', NULL, NULL, NULL, NULL, NULL, 'Sprint Shorts', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron if needed</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband</li>\n<li>160 GSM weight of fabric</li>\n<li>Inner mesh briefs</li>\n<li>Side zipper pockets to keep valubles safe</li>\n<li>Tested and fitted for optimum performance</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 6),
(119, 8, '0', 'Sprint', '', '<p style="text-align: justify;">The Sprint training shorts are designed for everyday comfort. These shorts have a great fit and its light weight fabric is engineered to be least intrusive. Neon trimmings adds just the right amount of style to our shorts which are ideal for warm-ups and post-match wear. Zipper pockets are useful to keep belongings safe during movement.</p>', '1', '650', '15', '14', '16', '250', '18', '20', '', '4', '3', '2', '', '2', '62', NULL, NULL, NULL, NULL, NULL, 'Sprint Shorts', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron if needed</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband</li>\n<li>160 GSM weight of fabric</li>\n<li>Inner mesh briefs</li>\n<li>Side zipper pockets to keep valubles safe</li>\n<li>Tested and fitted for optimum performance</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 6),
(120, 8, '0', 'Sprint', '', '<p style="text-align: justify;">The Sprint training shorts are designed for everyday comfort. These shorts have a great fit and its light weight fabric is engineered to be least intrusive. Neon trimmings adds just the right amount of style to our shorts which are ideal for warm-ups and post-match wear. Zipper pockets are useful to keep belongings safe during movement.</p>', '1', '650', '15', '14', '16', '250', '18', '20', '', '4', '3', '3', '', '2', '63', NULL, NULL, NULL, NULL, NULL, 'Sprint Shorts', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron if needed</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband</li>\n<li>160 GSM weight of fabric</li>\n<li>Inner mesh briefs</li>\n<li>Side zipper pockets to keep valubles safe</li>\n<li>Tested and fitted for optimum performance</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 6),
(121, 8, '0', 'Sprint', '', '<p style="text-align: justify;">The Sprint training shorts are designed for everyday comfort. These shorts have a great fit and its light weight fabric is engineered to be least intrusive. Neon trimmings adds just the right amount of style to our shorts which are ideal for warm-ups and post-match wear. Zipper pockets are useful to keep belongings safe during movement.</p>', '1', '650', '15', '14', '16', '250', '18', '20', '', '4', '3', '4', '', '2', '64', NULL, NULL, NULL, NULL, NULL, 'Sprint Shorts', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron if needed</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband</li>\n<li>160 GSM weight of fabric</li>\n<li>Inner mesh briefs</li>\n<li>Side zipper pockets to keep valubles safe</li>\n<li>Tested and fitted for optimum performance</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 6),
(122, 8, '0', 'Sprint', '', '<p style="text-align: justify;">The Sprint training shorts are designed for everyday comfort. These shorts have a great fit and its light weight fabric is engineered to be least intrusive. Neon trimmings adds just the right amount of style to our shorts which are ideal for warm-ups and post-match wear. Zipper pockets are useful to keep belongings safe during movement.</p>', '1', '650', '15', '14', '16', '250', '18', '20', '', '4', '3', '13', '', '2', '65', NULL, NULL, NULL, NULL, NULL, 'Sprint Shorts', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron if needed</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband</li>\n<li>160 GSM weight of fabric</li>\n<li>Inner mesh briefs</li>\n<li>Side zipper pockets to keep valubles safe</li>\n<li>Tested and fitted for optimum performance</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 6),
(123, 8, '0', 'Stride', '', '<p style="text-align: justify;">The Stride training shorts are comfortbale no-frills training shorts. They have an additional mesh feature for increased cooling and comfort. Specific fit and light weight fabric engineered unburdening the sportsperson. Perfect for the unfussed cricketer. Ideal for pre and post match wear.</p>', '1', '650', '15', '14', '16', '250', '18', '20', '', '4', '6', '1', '', '2', '66', NULL, NULL, NULL, NULL, NULL, 'Stride Shorts', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron if needed</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband</li>\n<li>180 GSM weight of fabric</li>\n<li>Inner mesh briefs</li>\n<li>Concealed zipper pockets for valuables</li>\n<li>Tested and fitted for optimum performance</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 7),
(124, 8, '0', 'Stride', '', '<p>The Stride training shorts are comfortbale no-frills training shorts. They have an additional mesh feature for increased cooling and comfort. Specific fit and light weight fabric engineered unburdening the sportsperson. Perfect for the unfussed cricketer. Ideal for pre and post match wear.</p>', '1', '650', '15', '14', '16', '250', '18', '20', '', '4', '6', '2', '', '2', '67', NULL, NULL, NULL, NULL, NULL, 'Stride Shorts', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron if needed</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband</li>\n<li>180 GSM weight of fabric</li>\n<li>Inner mesh briefs</li>\n<li>Concealed zipper pockets for valuables</li>\n<li>Tested and fitted for optimum performance</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 7),
(125, 8, '0', 'Stride', '', '<p>The Stride training shorts are comfortbale no-frills training shorts. They have an additional mesh feature for increased cooling and comfort. Specific fit and light weight fabric engineered unburdening the sportsperson. Perfect for the unfussed cricketer. Ideal for pre and post match wear.</p>', '1', '650', '15', '14', '16', '250', '18', '20', '', '4', '6', '3', '', '2', '68', NULL, NULL, NULL, NULL, NULL, 'Stride Shorts', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron if needed</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband</li>\n<li>180 GSM weight of fabric</li>\n<li>Inner mesh briefs</li>\n<li>Concealed zipper pockets for valuables</li>\n<li>Tested and fitted for optimum performance</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 7),
(126, 8, '0', 'Stride', '', '<p>The Stride training shorts are comfortbale no-frills training shorts. They have an additional mesh feature for increased cooling and comfort. Specific fit and light weight fabric engineered unburdening the sportsperson. Perfect for the unfussed cricketer. Ideal for pre and post match wear.</p>', '1', '650', '15', '14', '16', '250', '18', '20', '', '4', '6', '4', '', '2', '69', NULL, NULL, NULL, NULL, NULL, 'Stride Shorts', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron if needed</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband</li>\n<li>180 GSM weight of fabric</li>\n<li>Inner mesh briefs</li>\n<li>Concealed zipper pockets for valuables</li>\n<li>Tested and fitted for optimum performance</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 7),
(127, 8, '0', 'Stride', '', '<p>The Stride training shorts are comfortbale no-frills training shorts. They have an additional mesh feature for increased cooling and comfort. Specific fit and light weight fabric engineered unburdening the sportsperson. Perfect for the unfussed cricketer. Ideal for pre and post match wear.</p>', '1', '650', '15', '14', '16', '250', '18', '20', '', '4', '6', '13', '', '2', '70', NULL, NULL, NULL, NULL, NULL, 'Stride Shorts', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron if needed</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband</li>\n<li>180 GSM weight of fabric</li>\n<li>Inner mesh briefs</li>\n<li>Concealed zipper pockets for valuables</li>\n<li>Tested and fitted for optimum performance</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 7),
(128, 8, '0', 'Scamper', '', '<p style="text-align: justify;">The Custom Cricket Company Scamper training shorts are designed in windcheater fabric. Perfect to soak in the extra hours of effort. Comfortable fit and engineered to allow better sweat absorption.</p>', '1', '650', '15', '14', '16', '250', '18', '20', '', '4', '7', '1', '', '2', '71', NULL, NULL, NULL, NULL, NULL, 'Scamper Shorts', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron if needed</li>\n</ul>', '<ul>\n<li>Windcheater material</li>\n<li>Drawstring elastic waistband</li>\n<li>180 GSM weight of fabric</li>\n<li>Inner mesh briefs</li>\n<li>Tested and fitted for optimum performance</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 8),
(129, 8, '0', 'Scamper', '', '<p style="text-align: justify;">The Custom Cricket Company Scamper training shorts are designed in windcheater fabric. Perfect to soak in the extra hours of effort. Comfortable fit and engineered to allow better sweat absorption.</p>', '1', '650', '15', '14', '16', '250', '18', '20', '', '4', '7', '2', '', '2', '72', NULL, NULL, NULL, NULL, NULL, 'Scamper Shorts', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron if needed</li>\n</ul>', '<ul>\n<li>Windcheater material</li>\n<li>Drawstring elastic waistband</li>\n<li>180 GSM weight of fabric</li>\n<li>Inner mesh briefs</li>\n<li>Tested and fitted for optimum performance</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 8),
(130, 8, '0', 'Scamper', '', '<p style="text-align: justify;">The Custom Cricket Company Scamper training shorts are designed in windcheater fabric. Perfect to soak in the extra hours of effort. Comfortable fit and engineered to allow better sweat absorption.</p>', '1', '650', '15', '14', '16', '250', '18', '20', '', '4', '7', '3', '', '2', '73', NULL, NULL, NULL, NULL, NULL, 'Scamper Shorts', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron if needed</li>\n</ul>', '<ul>\n<li>Windcheater material</li>\n<li>Drawstring elastic waistband</li>\n<li>180 GSM weight of fabric</li>\n<li>Inner mesh briefs</li>\n<li>Tested and fitted for optimum performance</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 8),
(131, 8, '0', 'Scamper', '', '<p style="text-align: justify;">The Custom Cricket Company Scamper training shorts are designed in windcheater fabric. Perfect to soak in the extra hours of effort. Comfortable fit and engineered to allow better sweat absorption.</p>', '1', '650', '15', '14', '16', '250', '18', '20', '', '4', '7', '4', '', '2', '74', NULL, NULL, NULL, NULL, NULL, 'Scamper Shorts', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron if needed</li>\n</ul>', '<ul>\n<li>Windcheater material</li>\n<li>Drawstring elastic waistband</li>\n<li>180 GSM weight of fabric</li>\n<li>Inner mesh briefs</li>\n<li>Tested and fitted for optimum performance</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 8),
(132, 8, '0', 'Scamper', '', '<p style="text-align: justify;">The Custom Cricket Company Scamper training shorts are designed in windcheater fabric. Perfect to soak in the extra hours of effort. Comfortable fit and engineered to allow better sweat absorption.</p>', '1', '650', '15', '14', '16', '250', '18', '20', '', '4', '7', '13', '', '2', '75', NULL, NULL, NULL, NULL, NULL, 'Scamper Shorts', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron if needed</li>\n</ul>', '<ul>\n<li>Windcheater material</li>\n<li>Drawstring elastic waistband</li>\n<li>180 GSM weight of fabric</li>\n<li>Inner mesh briefs</li>\n<li>Tested and fitted for optimum performance</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 8),
(133, 8, '0', 'Flipper', '', '<p>The Flipper training tee is made from light weight wicking fabric using only front&nbsp;sublimated printing. This simple and trendy design is one of many possibilities at CCC.</p>', '1', '700', '15', '16', '16', '395', '19', '33', '', '4', '1', '1', '', '2', '160', NULL, NULL, NULL, NULL, NULL, 'Flipper Tee', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>180 GSM</li>\n<li>Round neck</li>\n<li>Printing of logo and entire design</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 3),
(134, 8, '0', 'Flipper', '', '<p>The Flipper training tee is made from light weight wicking fabric using only front&nbsp;sublimated printing. This simple and trendy design is one of many possibilities at CCC.</p>', '1', '700', '15', '16', '16', '395', '19', '33', '', '4', '1', '2', '', '2', '161', NULL, NULL, NULL, NULL, NULL, 'Flipper Tee', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>100% high quality polyester finely woven</li>\n<li>180 GSM</li>\n<li>Round neck</li>\n<li>Printing of logo and entire design</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 3),
(135, 8, '0', 'Flipper', '', '<p>The Flipper training tee is made from light weight wicking fabric using only front&nbsp;sublimated printing. This simple and trendy design is one of many possibilities at CCC.</p>', '1', '700', '15', '16', '16', '395', '19', '33', '', '4', '1', '3', '', '2', '162', NULL, NULL, NULL, NULL, NULL, 'Flipper Tee', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>100% high quality polyester finely woven</li>\n<li>180 GSM</li>\n<li>Round neck</li>\n<li>Printing of logo and entire design</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 3),
(136, 8, '0', 'Flipper', '', '<p>The Flipper training tee is made from light weight wicking fabric using only front&nbsp;sublimated printing. This simple and trendy design is one of many possibilities at CCC.</p>', '1', '700', '15', '16', '16', '395', '19', '33', '', '4', '1', '4', '', '2', '163', NULL, NULL, NULL, NULL, NULL, 'Flipper Tee', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>100% high quality polyester finely woven</li>\n<li>180 GSM</li>\n<li>Round neck</li>\n<li>Printing of logo and entire design</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 3),
(137, 8, '0', 'Flipper', '', '<p>The Flipper training tee is made from light weight wicking fabric using only front&nbsp;sublimated printing. This simple and trendy design is one of many possibilities at CCC.</p>', '1', '700', '15', '16', '16', '395', '19', '33', '', '4', '1', '13', '', '2', '164', NULL, NULL, NULL, NULL, NULL, 'Flipper Tee', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>100% high quality polyester finely woven</li>\n<li>180 GSM</li>\n<li>Round neck</li>\n<li>Printing of logo and entire design</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 3),
(138, 8, '0', 'Seam', '', '<p>The CCC Seam tee is made from light weight wicking fabric. They have ventilation channels to allow the body&nbsp; to breathe easily. The extremely well craftted and detailed design with piping and hem is very trendy but also highly functional. It can be worn as an inner or by itself.&nbsp;</p>', '1', '700', '15', '16', '16', '395', '19', '33', '', '4', '1', '1', '', '2', '165', NULL, NULL, NULL, NULL, NULL, 'Seam Tee', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>160 GSM</li>\n<li>Round neck</li>\n<li>Screen or sublimation printing of logo</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 3),
(139, 8, '0', 'Seam', '', '<p>The CCC Seam tee is made from light weight wicking fabric. They have ventilation channels to allow the body&nbsp; to breathe easily. The extremely well craftted and detailed design with piping and hem is very trendy but also highly functional. It can be worn as an inner or by itself.&nbsp;</p>', '1', '700', '15', '16', '16', '395', '19', '33', '', '4', '1', '2', '', '2', '166', NULL, NULL, NULL, NULL, NULL, 'Seam Tee', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>160 GSM</li>\n<li>Round neck</li>\n<li>Screen or sublimation printing of logo</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 3),
(140, 8, '0', 'Seam', '', '<p>The CCC Seam tee is made from light weight wicking fabric. They have ventilation channels to allow the body&nbsp; to breathe easily. The extremely well craftted and detailed design with piping and hem is very trendy but also highly functional. It can be worn as an inner or by itself.&nbsp;</p>', '1', '700', '15', '16', '16', '395', '19', '33', '', '4', '1', '3', '', '2', '167', NULL, NULL, NULL, NULL, NULL, 'Seam Tee', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>160 GSM</li>\n<li>Round neck</li>\n<li>Screen or sublimation printing of logo</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 3),
(141, 8, '0', 'Seam', '', '<p>The CCC Seam tee is made from light weight wicking fabric. They have ventilation channels to allow the body&nbsp; to breathe easily. The extremely well craftted and detailed design with piping and hem is very trendy but also highly functional. It can be worn as an inner or by itself.&nbsp;</p>', '1', '700', '15', '16', '16', '395', '19', '33', '', '4', '1', '4', '', '2', '168', NULL, NULL, NULL, NULL, NULL, 'Seam Tee', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>160 GSM</li>\n<li>Round neck</li>\n<li>Screen or sublimation printing of logo</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 3),
(142, 8, '0', 'Seam', '', '<p>The CCC Seam tee is made from light weight wicking fabric. They have ventilation channels to allow the body&nbsp; to breathe easily. The extremely well craftted and detailed design with piping and hem is very trendy but also highly functional. It can be worn as an inner or by itself.&nbsp;</p>', '1', '700', '15', '16', '16', '395', '19', '33', '', '4', '1', '13', '', '2', '169', NULL, NULL, NULL, NULL, NULL, 'Seam Tee', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>160 GSM</li>\n<li>Round neck</li>\n<li>Screen or sublimation printing of logo</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 3),
(143, 8, '0', 'Dipper', '', '<p>The Dipper training tee is made from light weight wicking fabric using full sublimated printing. This simple and trendy design is one of many possibilities at CCC.</p>', '1', '700', '15', '16', '16', '395', '19', '33', '', '4', '2', '1', '', '2', '170', NULL, NULL, NULL, NULL, NULL, 'Dipper Tee', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>100% high quality polyester finely woven</li>\n<li>180 GSM</li>\n<li>V-neck</li>\n<li>Printing of logo and entire design</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 4),
(144, 8, '0', 'Dipper', '', '<p>The Dipper training tee is made from light weight wicking fabric using full sublimated printing. This simple and trendy design is one of many possibilities at CCC.</p>', '1', '700', '15', '16', '16', '395', '19', '33', '', '4', '2', '2', '', '2', '171', NULL, NULL, NULL, NULL, NULL, 'Dipper Tee', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>100% high quality polyester finely woven</li>\n<li>180 GSM</li>\n<li>V-neck</li>\n<li>Printing of logo and entire design</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 4),
(145, 8, '0', 'Dipper', '', '<p>The Dipper training tee is made from light weight wicking fabric using full sublimated printing. This simple and trendy design is one of many possibilities at CCC.</p>', '1', '700', '15', '16', '16', '395', '19', '33', '', '4', '2', '3', '', '2', '172', NULL, NULL, NULL, NULL, NULL, 'Dipper Tee', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>100% high quality polyester finely woven</li>\n<li>180 GSM</li>\n<li>V-neck</li>\n<li>Printing of logo and entire design</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 4),
(146, 8, '0', 'Dipper', '', '<p>The Dipper training tee is made from light weight wicking fabric using full sublimated printing. This simple and trendy design is one of many possibilities at CCC.</p>', '1', '700', '15', '16', '16', '395', '19', '33', '', '4', '2', '4', '', '2', '173', NULL, NULL, NULL, NULL, NULL, 'Dipper Tee', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>100% high quality polyester finely woven</li>\n<li>180 GSM</li>\n<li>V-neck</li>\n<li>Printing of logo and entire design</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 4),
(147, 8, '0', 'Dipper', '', '<p>The Dipper training tee is made from light weight wicking fabric using full sublimated printing. This simple and trendy design is one of many possibilities at CCC.</p>', '1', '700', '15', '16', '16', '395', '19', '33', '', '4', '2', '13', '', '2', '174', NULL, NULL, NULL, NULL, NULL, 'Dipper Tee', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>100% high quality polyester finely woven</li>\n<li>180 GSM</li>\n<li>V-neck</li>\n<li>Printing of logo and entire design</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 4),
(148, 8, '0', 'Runner', '', '<p style="text-align: justify;">The Runner training shorts are designed for everyday comfort. These shorts have a great fit and its light weight fabric is engineered to be least intrusive. Neon trimmings adds just the right amount of style to our shorts which are ideal for warm-ups and post-match wear. Zipper pockets are useful to keep belongings safe during movement.</p>', '1', '650', '15', '14', '16', '250', '18', '', '', '4', '8', '1', '', '2', '212', NULL, NULL, NULL, NULL, NULL, 'Runner Shorts', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron if needed</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband</li>\n<li>160 GSM weight of fabric</li>\n<li>Inner mesh briefs</li>\n<li>Side zipper pockets to keep valubles safe</li>\n<li>Tested and fitted for optimum performance</li>\n</ul>', 'In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.', '', '', '', '', '', 8),
(149, 8, '0', 'Runner', '', '<p style="text-align: justify;">The Runner training shorts are designed for everyday comfort. These shorts have a great fit and its light weight fabric is engineered to be least intrusive. Neon trimmings adds just the right amount of style to our shorts which are ideal for warm-ups and post-match wear. Zipper pockets are useful to keep belongings safe during movement.</p>', '1', '650', '15', '14', '16', '250', '18', '', '', '4', '8', '2', '', '2', '213', NULL, NULL, NULL, NULL, NULL, 'Runner Shorts', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron if needed</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband</li>\n<li>160 GSM weight of fabric</li>\n<li>Inner mesh briefs</li>\n<li>Side zipper pockets to keep valubles safe</li>\n<li>Tested and fitted for optimum performance</li>\n</ul>', 'In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.', '', '', '', '', '', 8),
(150, 8, '0', 'Runner', '', '<p style="text-align: justify;">The Runner training shorts are designed for everyday comfort. These shorts have a great fit and its light weight fabric is engineered to be least intrusive. Neon trimmings adds just the right amount of style to our shorts which are ideal for warm-ups and post-match wear. Zipper pockets are useful to keep belongings safe during movement.</p>', '1', '650', '15', '14', '16', '250', '18', '', '', '4', '8', '3', '', '2', '214', NULL, NULL, NULL, NULL, NULL, 'Runner Shorts', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron if needed</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband</li>\n<li>160 GSM weight of fabric</li>\n<li>Inner mesh briefs</li>\n<li>Side zipper pockets to keep valubles safe</li>\n<li>Tested and fitted for optimum performance</li>\n</ul>', 'In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.', '', '', '', '', '', 8),
(151, 8, '0', 'Runner', '', '<p style="text-align: justify;">The Sprint training shorts are designed for everyday comfort. These shorts have a great fit and its light weight fabric is engineered to be least intrusive. Neon trimmings adds just the right amount of style to our shorts which are ideal for warm-ups and post-match wear. Zipper pockets are useful to keep belongings safe during movement.</p>', '1', '650', '15', '14', '16', '250', '18', '', '', '4', '8', '4', '', '2', '215', NULL, NULL, NULL, NULL, NULL, 'Runner Shorts', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0),
(152, 8, '0', 'Runner', '', '<p style="text-align: justify;">The Runner &nbsp;training shorts are designed for everyday comfort. These shorts have a great fit and its light weight fabric is engineered to be least intrusive. Neon trimmings adds just the right amount of style to our shorts which are ideal for warm-ups and post-match wear. Zipper pockets are useful to keep belongings safe during movement.</p>', '1', '650', '15', '14', '16', '250', '18', '', '', '4', '8', '13', '', '2', '216', NULL, NULL, NULL, NULL, NULL, 'Runner Shorts', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron if needed</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband</li>\n<li>160 GSM weight of fabric</li>\n<li>Inner mesh briefs</li>\n<li>Side zipper pockets to keep valubles safe</li>\n<li>Tested and fitted for optimum performance</li>\n</ul>', 'In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.', '', '', '', '', '', 8),
(153, 8, '0', 'Slogger', '', '<p style="text-align: justify;">The Slogger&nbsp;training shorts are designed for everyday comfort. These shorts have a great fit and its light weight fabric is engineered to be least intrusive. Neon trimmings adds just the right amount of style to our shorts which are ideal for warm-ups and post-match wear. Zipper pockets are useful to keep belongings safe during movement.</p>', '1', '650', '15', '14', '16', '250', '18', '', '', '4', '4', '1', '', '2', '217', NULL, NULL, NULL, NULL, NULL, 'Slogger Shorts', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>160 gsm</li>\n<li>Round neck</li>\n<li>Printing of logo</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 9),
(154, 8, '0', 'Slogger', '', '<p style="text-align: justify;">The Slogger training shorts are designed for everyday comfort. These shorts have a great fit and its light weight fabric is engineered to be least intrusive. Neon trimmings adds just the right amount of style to our shorts which are ideal for warm-ups and post-match wear. Zipper pockets are useful to keep belongings safe during movement.</p>', '1', '650', '15', '14', '16', '250', '18', '', '', '4', '4', '2', '', '2', '218', NULL, NULL, NULL, NULL, NULL, 'Slogger Shorts', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>160 gsm</li>\n<li>Round neck</li>\n<li>Printing of logo</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 9),
(155, 8, '0', 'Slogger', '', '<p style="text-align: justify;">The Slogger training shorts are designed for everyday comfort. These shorts have a great fit and its light weight fabric is engineered to be least intrusive. Neon trimmings adds just the right amount of style to our shorts which are ideal for warm-ups and post-match wear. Zipper pockets are useful to keep belongings safe during movement.</p>', '1', '650', '15', '14', '16', '250', '18', '', '', '4', '4', '3', '', '2', '219', NULL, NULL, NULL, NULL, NULL, 'Slogger Shorts', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>160 gsm</li>\n<li>Round neck</li>\n<li>Printing of logo</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 9),
(156, 8, '0', 'Slogger', '', '<p style="text-align: justify;">The Slogger training shorts are designed for everyday comfort. These shorts have a great fit and its light weight fabric is engineered to be least intrusive. Neon trimmings adds just the right amount of style to our shorts which are ideal for warm-ups and post-match wear. Zipper pockets are useful to keep belongings safe during movement.</p>', '1', '650', '15', '14', '16', '250', '18', '', '', '4', '4', '4', '', '2', '220', NULL, NULL, NULL, NULL, NULL, 'Slogger Shorts', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>160 gsm</li>\n<li>Round neck</li>\n<li>Printing of logo</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 9),
(157, 8, '0', 'Slogger', '', '<p style="text-align: justify;">The Slogger training shorts are designed for everyday comfort. These shorts have a great fit and its light weight fabric is engineered to be least intrusive. Neon trimmings adds just the right amount of style to our shorts which are ideal for warm-ups and post-match wear. Zipper pockets are useful to keep belongings safe during movement.</p>', '1', '650', '15', '14', '16', '250', '18', '', '', '4', '4', '13', '', '2', '221', NULL, NULL, NULL, NULL, NULL, 'Slogger Shorts', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>160 gsm</li>\n<li>Round neck</li>\n<li>Printing of logo</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 9),
(158, 8, '0', 'Pace', '', '<p style="text-align: justify;">The Custom Cricket Company training tees are made from light weight wicking / dri-fit fabric. This is a full sublimated jersey. Sublimation is by far the coolest and only way to fully customize every square inch of your jersey. The yellow, black and white gives is a fun graphical combination and one of our popular designs.</p>', '1', '1200', '15', '16', '16', '395', '19', '33', '', '4', '2', '14', '', '2', '267', NULL, NULL, NULL, NULL, NULL, 'Pace', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>160 gsm</li>\n<li>Round neck</li>\n<li>Printing of logo</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 1),
(159, 8, '0', 'Pace', '', '<p style="text-align: justify;">The Custom Cricket Company training tees are made from light weight wicking / dri-fit fabric. This is a full sublimated jersey. Sublimation is by far the coolest and only way to fully customize every square inch of your jersey. The yellow, black and white gives is a fun graphical combination and one of our popular designs.</p>', '1', '1200', '15', '16', '16', '395', '19', '33', '', '4', '2', '15', '', '2', '268', NULL, NULL, NULL, NULL, NULL, 'Pace', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>160 gsm</li>\n<li>Round neck</li>\n<li>Printing of logo</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 1),
(160, 8, '0', 'Drift', '', '<p style="text-align: justify;">The Drift training tee is made from light weight wicking fabric using the cut &amp; sew technique. The CCC logo on the right chest is printed but emboridery is an option for customisation along with many other choices.</p>', '1', '700', '15', '16', '16', '395', '19', '33', '', '4', '3', '14', '', '2', '269', NULL, NULL, NULL, NULL, NULL, 'Drift', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>180 GSM</li>\n<li>Round neck</li>\n<li>Printing of logo</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 2),
(161, 8, '0', 'Drift', '', '<p style="text-align: justify;">The Drift training tee is made from light weight wicking fabric using the cut &amp; sew technique. The CCC logo on the right chest is printed but emboridery is an option for customisation along with many other choices.</p>', '1', '700', '15', '16', '16', '395', '19', '33', '', '4', '3', '15', '', '2', '270', NULL, NULL, NULL, NULL, NULL, 'Drift', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>180 GSM</li>\n<li>Round neck</li>\n<li>Printing of logo</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 2),
(162, 8, '0', 'Sprint', '', '<p style="text-align: justify;">The Sprint training shorts are designed for everyday comfort. These shorts have a great fit and its light weight fabric is engineered to be least intrusive. Neon trimmings adds just the right amount of style to our shorts which are ideal for warm-ups and post-match wear. Zipper pockets are useful to keep belongings safe during movement.</p>', '1', '650', '15', '14', '16', '250', '18', '20', '', '4', '3', '14', '', '2', '271', NULL, NULL, NULL, NULL, NULL, 'Sprint Shorts', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron if needed</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband</li>\n<li>160 GSM weight of fabric</li>\n<li>Inner mesh briefs</li>\n<li>Side zipper pockets to keep valubles safe</li>\n<li>Tested and fitted for optimum performance</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 6);
INSERT INTO `fynx_product` (`id`, `subcategory`, `quantity`, `name`, `type`, `description`, `visibility`, `INR`, `USD`, `GBP`, `EUR`, `ZAF`, `AUD`, `NZD`, `relatedproduct`, `category`, `color`, `size`, `sizechart`, `status`, `sku`, `image1`, `image2`, `image3`, `image4`, `image5`, `baseproduct`, `discountINR`, `discountUSD`, `discountGBP`, `discountEUR`, `discountZAF`, `discountAUD`, `discountNZD`, `care`, `detail`, `delivery`, `categorycare`, `build`, `features`, `note`, `minimumquantity`, `order`) VALUES
(163, 8, '0', 'Sprint', '', '<p style="text-align: justify;">The Sprint training shorts are designed for everyday comfort. These shorts have a great fit and its light weight fabric is engineered to be least intrusive. Neon trimmings adds just the right amount of style to our shorts which are ideal for warm-ups and post-match wear. Zipper pockets are useful to keep belongings safe during movement.</p>', '1', '650', '15', '14', '16', '250', '18', '20', '', '4', '3', '15', '', '2', '272', NULL, NULL, NULL, NULL, NULL, 'Sprint Shorts', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron if needed</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband</li>\n<li>160 GSM weight of fabric</li>\n<li>Inner mesh briefs</li>\n<li>Side zipper pockets to keep valubles safe</li>\n<li>Tested and fitted for optimum performance</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 6),
(164, 8, '0', 'Sprint', '', '<p style="text-align: justify;">The Sprint training shorts are designed for everyday comfort. These shorts have a great fit and its light weight fabric is engineered to be least intrusive. Neon trimmings adds just the right amount of style to our shorts which are ideal for warm-ups and post-match wear. Zipper pockets are useful to keep belongings safe during movement.</p>', '1', '650', '15', '14', '16', '250', '18', '20', '', '4', '3', '16', '', '2', '273', NULL, NULL, NULL, NULL, NULL, 'Sprint Shorts', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron if needed</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband</li>\n<li>160 GSM weight of fabric</li>\n<li>Inner mesh briefs</li>\n<li>Side zipper pockets to keep valubles safe</li>\n<li>Tested and fitted for optimum performance</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 6),
(165, 8, '0', 'Stride', '', '<p>The Stride training shorts are comfortbale no-frills training shorts. They have an additional mesh feature for increased cooling and comfort. Specific fit and light weight fabric engineered unburdening the sportsperson. Perfect for the unfussed cricketer. Ideal for pre and post match wear.</p>', '1', '650', '15', '14', '16', '250', '18', '20', '', '4', '6', '14', '', '2', '274', NULL, NULL, NULL, NULL, NULL, 'Stride Shorts', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron if needed</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband</li>\n<li>180 GSM weight of fabric</li>\n<li>Inner mesh briefs</li>\n<li>Concealed zipper pockets for valuables</li>\n<li>Tested and fitted for optimum performance</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 7),
(166, 8, '0', 'Stride', '', '<p>The Stride training shorts are comfortbale no-frills training shorts. They have an additional mesh feature for increased cooling and comfort. Specific fit and light weight fabric engineered unburdening the sportsperson. Perfect for the unfussed cricketer. Ideal for pre and post match wear.</p>', '1', '650', '15', '14', '16', '250', '18', '20', '', '4', '6', '15', '', '2', '275', NULL, NULL, NULL, NULL, NULL, 'Stride Shorts', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron if needed</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband</li>\n<li>180 GSM weight of fabric</li>\n<li>Inner mesh briefs</li>\n<li>Concealed zipper pockets for valuables</li>\n<li>Tested and fitted for optimum performance</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 7),
(167, 8, '0', 'Stride', '', '<p>The Stride training shorts are comfortbale no-frills training shorts. They have an additional mesh feature for increased cooling and comfort. Specific fit and light weight fabric engineered unburdening the sportsperson. Perfect for the unfussed cricketer. Ideal for pre and post match wear.</p>', '1', '650', '15', '14', '16', '250', '18', '20', '', '4', '6', '16', '', '2', '276', NULL, NULL, NULL, NULL, NULL, 'Stride Shorts', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron if needed</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband</li>\n<li>180 GSM weight of fabric</li>\n<li>Inner mesh briefs</li>\n<li>Concealed zipper pockets for valuables</li>\n<li>Tested and fitted for optimum performance</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 7),
(168, 8, '0', 'Scamper', '', '<p style="text-align: justify;">The Custom Cricket Company Scamper training shorts are designed in windcheater fabric. Perfect to soak in the extra hours of effort. Comfortable fit and engineered to allow better sweat absorption.</p>', '1', '650', '15', '14', '16', '250', '18', '20', '', '4', '7', '14', '', '2', '277', NULL, NULL, NULL, NULL, NULL, 'Scamper Shorts', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron if needed</li>\n</ul>', '<ul>\n<li>Windcheater material</li>\n<li>Drawstring elastic waistband</li>\n<li>180 GSM weight of fabric</li>\n<li>Inner mesh briefs</li>\n<li>Tested and fitted for optimum performance</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 8),
(169, 8, '0', 'Scamper', '', '<p style="text-align: justify;">The Custom Cricket Company Scamper training shorts are designed in windcheater fabric. Perfect to soak in the extra hours of effort. Comfortable fit and engineered to allow better sweat absorption.</p>', '1', '650', '15', '14', '16', '250', '18', '20', '', '4', '7', '15', '', '2', '278', NULL, NULL, NULL, NULL, NULL, 'Scamper Shorts', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron if needed</li>\n</ul>', '<ul>\n<li>Windcheater material</li>\n<li>Drawstring elastic waistband</li>\n<li>180 GSM weight of fabric</li>\n<li>Inner mesh briefs</li>\n<li>Tested and fitted for optimum performance</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 8),
(170, 8, '0', 'Scamper', '', '<p style="text-align: justify;">The Custom Cricket Company Scamper training shorts are designed in windcheater fabric. Perfect to soak in the extra hours of effort. Comfortable fit and engineered to allow better sweat absorption.</p>', '1', '650', '15', '14', '16', '250', '18', '20', '', '4', '7', '16', '', '2', '279', NULL, NULL, NULL, NULL, NULL, 'Scamper Shorts', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron if needed</li>\n</ul>', '<ul>\n<li>Windcheater material</li>\n<li>Drawstring elastic waistband</li>\n<li>180 GSM weight of fabric</li>\n<li>Inner mesh briefs</li>\n<li>Tested and fitted for optimum performance</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 8),
(171, 8, '0', 'Flipper', '', '<p>The Flipper training tee is made from light weight wicking fabric using only front&nbsp;sublimated printing. This simple and trendy design is one of many possibilities at CCC.</p>', '1', '700', '15', '16', '16', '395', '19', '33', '', '4', '1', '14', '', '2', '295', NULL, NULL, NULL, NULL, NULL, 'Flipper Tee', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>100% high quality polyester finely woven</li>\n<li>180 GSM</li>\n<li>Round neck</li>\n<li>Printing of logo and entire design</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 3),
(172, 8, '0', 'Flipper', '', '<p>The Flipper training tee is made from light weight wicking fabric using only front&nbsp;sublimated printing. This simple and trendy design is one of many possibilities at CCC.</p>', '1', '700', '15', '16', '16', '395', '19', '33', '', '4', '1', '15', '', '2', '296', NULL, NULL, NULL, NULL, NULL, 'Flipper Tee', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>100% high quality polyester finely woven</li>\n<li>180 GSM</li>\n<li>Round neck</li>\n<li>Printing of logo and entire design</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 3),
(173, 8, '0', 'Seam', '', '<p>The CCC Seam tee is made from light weight wicking fabric. They have ventilation channels to allow the body&nbsp; to breathe easily. The extremely well craftted and detailed design with piping and hem is very trendy but also highly functional. It can be worn as an inner or by itself.&nbsp;</p>', '1', '700', '15', '16', '16', '395', '19', '33', '', '4', '1', '14', '', '2', '297', NULL, NULL, NULL, NULL, NULL, 'Seam Tee', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>160 GSM</li>\n<li>Round neck</li>\n<li>Screen or sublimation printing of logo</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 3),
(174, 8, '0', 'Seam', '', '<p>The CCC Seam tee is made from light weight wicking fabric. They have ventilation channels to allow the body&nbsp; to breathe easily. The extremely well craftted and detailed design with piping and hem is very trendy but also highly functional. It can be worn as an inner or by itself.&nbsp;</p>', '1', '700', '15', '16', '16', '395', '19', '33', '', '4', '1', '15', '', '2', '298', NULL, NULL, NULL, NULL, NULL, 'Seam Tee', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>160 GSM</li>\n<li>Round neck</li>\n<li>Screen or sublimation printing of logo</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 3),
(175, 8, '0', 'Dipper', '', '<p>The Dipper training tee is made from light weight wicking fabric using full sublimated printing. This simple and trendy design is one of many possibilities at CCC.</p>', '1', '700', '15', '16', '16', '395', '19', '33', '', '4', '2', '14', '', '2', '299', NULL, NULL, NULL, NULL, NULL, 'Dipper Tee', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>100% high quality polyester finely woven</li>\n<li>180 GSM</li>\n<li>V-neck</li>\n<li>Printing of logo and entire design</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 4),
(176, 8, '0', 'Dipper', '', '<p>The Dipper training tee is made from light weight wicking fabric using full sublimated printing. This simple and trendy design is one of many possibilities at CCC.</p>', '1', '700', '15', '16', '16', '395', '19', '33', '', '4', '2', '15', '', '2', '300', NULL, NULL, NULL, NULL, NULL, 'Dipper Tee', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>100% high quality polyester finely woven</li>\n<li>180 GSM</li>\n<li>V-neck</li>\n<li>Printing of logo and entire design</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 4),
(177, 8, '0', 'Runner', '', '<p style="text-align: justify;">The Runner &nbsp;training shorts are designed for everyday comfort. These shorts have a great fit and its light weight fabric is engineered to be least intrusive. Neon trimmings adds just the right amount of style to our shorts which are ideal for warm-ups and post-match wear. Zipper pockets are useful to keep belongings safe during movement.</p>', '1', '650', '15', '14', '16', '250', '18', '', '', '4', '8', '14', '', '2', '307', NULL, NULL, NULL, NULL, NULL, 'Runner Shorts', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron if needed</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband</li>\n<li>160 GSM weight of fabric</li>\n<li>Inner mesh briefs</li>\n<li>Side zipper pockets to keep valubles safe</li>\n<li>Tested and fitted for optimum performance</li>\n</ul>', 'In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.', '', '', '', '', '', 8),
(178, 8, '0', 'Runner', '', '<p style="text-align: justify;">The Runner &nbsp;training shorts are designed for everyday comfort. These shorts have a great fit and its light weight fabric is engineered to be least intrusive. Neon trimmings adds just the right amount of style to our shorts which are ideal for warm-ups and post-match wear. Zipper pockets are useful to keep belongings safe during movement.</p>', '1', '650', '15', '14', '16', '250', '18', '', '', '4', '8', '15', '', '2', '308', NULL, NULL, NULL, NULL, NULL, 'Runner Shorts', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron if needed</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband</li>\n<li>160 GSM weight of fabric</li>\n<li>Inner mesh briefs</li>\n<li>Side zipper pockets to keep valubles safe</li>\n<li>Tested and fitted for optimum performance</li>\n</ul>', 'In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.', '', '', '', '', '', 8),
(179, 8, '0', 'Runner', '', '<p style="text-align: justify;">The Runner &nbsp;training shorts are designed for everyday comfort. These shorts have a great fit and its light weight fabric is engineered to be least intrusive. Neon trimmings adds just the right amount of style to our shorts which are ideal for warm-ups and post-match wear. Zipper pockets are useful to keep belongings safe during movement.</p>', '1', '650', '15', '14', '16', '250', '18', '', '', '4', '8', '16', '', '2', '309', NULL, NULL, NULL, NULL, NULL, 'Runner Shorts', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron if needed</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband</li>\n<li>160 GSM weight of fabric</li>\n<li>Inner mesh briefs</li>\n<li>Side zipper pockets to keep valubles safe</li>\n<li>Tested and fitted for optimum performance</li>\n</ul>', 'In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.', '', '', '', '', '', 8),
(180, 8, '0', 'Slogger', '', '<p style="text-align: justify;">The Slogger training shorts are designed for everyday comfort. These shorts have a great fit and its light weight fabric is engineered to be least intrusive. Neon trimmings adds just the right amount of style to our shorts which are ideal for warm-ups and post-match wear. Zipper pockets are useful to keep belongings safe during movement.</p>', '1', '650', '15', '14', '16', '250', '18', '', '', '4', '4', '14', '', '2', '312', NULL, NULL, NULL, NULL, NULL, 'Slogger Shorts', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>160 gsm</li>\n<li>Round neck</li>\n<li>Printing of logo</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 9),
(181, 8, '0', 'Slogger', '', '<p style="text-align: justify;">The Slogger training shorts are designed for everyday comfort. These shorts have a great fit and its light weight fabric is engineered to be least intrusive. Neon trimmings adds just the right amount of style to our shorts which are ideal for warm-ups and post-match wear. Zipper pockets are useful to keep belongings safe during movement.</p>', '1', '650', '15', '14', '16', '250', '18', '', '', '4', '4', '15', '', '2', '313', NULL, NULL, NULL, NULL, NULL, 'Slogger Shorts', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>160 gsm</li>\n<li>Round neck</li>\n<li>Printing of logo</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 9),
(182, 8, '0', 'Slogger', '', '<p style="text-align: justify;">The Slogger training shorts are designed for everyday comfort. These shorts have a great fit and its light weight fabric is engineered to be least intrusive. Neon trimmings adds just the right amount of style to our shorts which are ideal for warm-ups and post-match wear. Zipper pockets are useful to keep belongings safe during movement.</p>', '1', '650', '15', '14', '16', '250', '18', '', '', '4', '4', '16', '', '2', '314', NULL, NULL, NULL, NULL, NULL, 'Slogger Shorts', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>160 gsm</li>\n<li>Round neck</li>\n<li>Printing of logo</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 9),
(183, 9, '0', 'Steel', '', '<p style="text-align: justify;">The Custom Cricket Company performance training jackets are ideal for colder conditions on the training ground. The training jackets are constructed with dot knit wicking fabric for high performance even during cricket training.</p>', '1', '1350', '32', '28', '25', '395', '35', '33', '', '4', '4', '1', '', '2', '76', NULL, NULL, NULL, NULL, NULL, 'Steel Windcheater', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Elasticated cuffs and waitband</li>\n<li>Full zipper</li>\n<li>2 kangaroo pockets on the front</li>\n</ul>', '<p>In-stock jackets are shipped immediately. Customisation worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 9),
(184, 9, '0', 'Steel', '', '<p style="text-align: justify;">The Custom Cricket Company performance training jackets are ideal for colder conditions on the training ground. The training jackets are constructed with dot knit wicking fabric for high performance even during cricket training.</p>', '1', '1350', '32', '28', '25', '395', '35', '33', '', '4', '4', '2', '', '2', '77', NULL, NULL, NULL, NULL, NULL, 'Steel Windcheater', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Elasticated cuffs and waitband</li>\n<li>Full zipper</li>\n<li>2 kangaroo pockets on the front</li>\n</ul>', '<p>In-stock jackets are shipped immediately. Customisation worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 9),
(185, 9, '0', 'Steel', '', '<p style="text-align: justify;">The Custom Cricket Company performance training jackets are ideal for colder conditions on the training ground. The training jackets are constructed with dot knit wicking fabric for high performance even during cricket training.</p>', '1', '1350', '32', '28', '25', '395', '35', '33', '', '4', '4', '3', '', '2', '78', NULL, NULL, NULL, NULL, NULL, 'Steel Windcheater', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Elasticated cuffs and waitband</li>\n<li>Full zipper</li>\n<li>2 kangaroo pockets on the front</li>\n</ul>', '<p>In-stock jackets are shipped immediately. Customisation worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 9),
(186, 9, '0', 'Steel', '', '<p style="text-align: justify;">The Custom Cricket Company performance training jackets are ideal for colder conditions on the training ground. The training jackets are constructed with dot knit wicking fabric for high performance even during cricket training.</p>', '1', '1350', '32', '28', '25', '395', '35', '33', '', '4', '4', '4', '', '2', '79', NULL, NULL, NULL, NULL, NULL, 'Steel Windcheater', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Elasticated cuffs and waitband</li>\n<li>Full zipper</li>\n<li>2 kangaroo pockets on the front</li>\n</ul>', '<p>In-stock jackets are shipped immediately. Customisation worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 9),
(187, 9, '0', 'Steel', '', '<p style="text-align: justify;">The Custom Cricket Company performance training jackets are ideal for colder conditions on the training ground. The training jackets are constructed with dot knit wicking fabric for high performance even during cricket training.</p>', '1', '1350', '32', '28', '25', '395', '35', '33', '', '4', '4', '13', '', '2', '80', NULL, NULL, NULL, NULL, NULL, 'Steel Windcheater', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Elasticated cuffs and waitband</li>\n<li>Full zipper</li>\n<li>2 kangaroo pockets on the front</li>\n</ul>', '<p>In-stock jackets are shipped immediately. Customisation worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 9),
(188, 9, '0', 'Crossfit', '', '<p style="text-align: justify;">Crossfit training pants are sleek and versatile. Designed to be used during traininng and travel. They have an additional mesh feature running along the inside to keep the body cool whilst playing. Two zipper pockets for valuables and zipper slits at the ankle for the bowling boot expansion are functional features that make this product very handy.</p>', '1', '750', '22', '24', '24', '290', '26', '29', '', '4', '3', '1', '', '2', '81', NULL, NULL, NULL, NULL, NULL, 'Crossfit Pants', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>Soft waterproof windcheater fabric</li>\n<li>Drawstring elastic waistband</li>\n<li>180 GSM weight of fabric</li>\n<li>Inner mesh running along length</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 10),
(189, 9, '1', 'Crossfit', '', '<p style="text-align: justify;">Crossfit training pants are sleek and versatile. Designed to be used during traininng and travel. They have an additional mesh feature running along the inside to keep the body cool whilst playing. Two zipper pockets for valuables and zipper slits at the ankle for the bowling boot expansion are functional features that make this product very handy.</p>', '1', '750', '22', '24', '24', '290', '26', '29', '', '4', '3', '2', '', '2', '82', NULL, NULL, NULL, NULL, NULL, 'Crossfit Pants', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>Soft waterproof windcheater fabric</li>\n<li>Drawstring elastic waistband</li>\n<li>180 GSM weight of fabric</li>\n<li>Inner mesh running along length</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 10),
(190, 9, '2', 'Crossfit', '', '<p style="text-align: justify;">Crossfit training pants are sleek and versatile. Designed to be used during traininng and travel. They have an additional mesh feature running along the inside to keep the body cool whilst playing. Two zipper pockets for valuables and zipper slits at the ankle for the bowling boot expansion are functional features that make this product very handy.</p>', '1', '750', '22', '24', '24', '290', '26', '29', '', '4', '3', '3', '', '2', '83', NULL, NULL, NULL, NULL, NULL, 'Crossfit Pants', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>Soft waterproof windcheater fabric</li>\n<li>Drawstring elastic waistband</li>\n<li>180 GSM weight of fabric</li>\n<li>Inner mesh running along length</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 10),
(191, 9, '1', 'Crossfit', '', '<p style="text-align: justify;">Crossfit training pants are sleek and versatile. Designed to be used during traininng and travel. They have an additional mesh feature running along the inside to keep the body cool whilst playing. Two zipper pockets for valuables and zipper slits at the ankle for the bowling boot expansion are functional features that make this product very handy.</p>', '1', '750', '22', '24', '24', '290', '26', '29', '', '4', '3', '4', '', '2', '84', NULL, NULL, NULL, NULL, NULL, 'Crossfit Pants', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>Soft waterproof windcheater fabric</li>\n<li>Drawstring elastic waistband</li>\n<li>180 GSM weight of fabric</li>\n<li>Inner mesh running along length</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 10),
(192, 9, '2', 'Crossfit', '', '<p style="text-align: justify;">Crossfit training pants are sleek and versatile. Designed to be used during traininng and travel. They have an additional mesh feature running along the inside to keep the body cool whilst playing. Two zipper pockets for valuables and zipper slits at the ankle for the bowling boot expansion are functional features that make this product very handy.</p>', '1', '750', '22', '24', '24', '290', '26', '29', '', '4', '3', '13', '', '2', '85', NULL, NULL, NULL, NULL, NULL, 'Crossfit Pants', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>Soft waterproof windcheater fabric</li>\n<li>Drawstring elastic waistband</li>\n<li>180 GSM weight of fabric</li>\n<li>Inner mesh running along length</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 10),
(193, 9, '5', 'Lounge', '', '<p>The CCC Lounge polo is made from polycotton fabric. These smart casual lounge polos are extremely comfortable and can be worn on and off the field. Create your own team identity with your logos embroidered on the left chest. Our polos are tailored for a slim, modern silhouette. Combine your polos with just about anything from a crisp chino to rugged jeans.</p>', '1', '950', '18', '19', '22', '290', '23', '29', '', '4', '4', '1', '', '2', '86', NULL, NULL, NULL, NULL, NULL, 'Lounge Button', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron if needed</li>\n</ul>', '<ul>\n<li>20% polyester 80% cotton</li>\n<li>Stylish four button placket</li>\n<li>Also available in snap button option</li>\n<li>180 GSM in weight</li>\n<li>Ribbed polo collar</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 1),
(194, 9, '10', 'Lounge', '', '<p>The CCC Lounge polo is made from polycotton fabric. These smart casual lounge polos are extremely comfortable and can be worn on and off the field. Create your own team identity with your logos embroidered on the left chest. Our polos are tailored for a slim, modern silhouette. Combine your polos with just about anything from a crisp chino to rugged jeans.</p>', '1', '950', '18', '19', '22', '290', '23', '29', '', '4', '4', '2', '', '2', '87', NULL, NULL, NULL, NULL, NULL, 'Lounge Button', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron if needed</li>\n</ul>', '<ul>\n<li>20% polyester 80% cotton</li>\n<li>Stylish four button placket</li>\n<li>Also available in snap button option</li>\n<li>180 GSM in weight</li>\n<li>Ribbed polo collar</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 1),
(195, 9, '10', 'Lounge', '', '<p>The CCC Lounge polo is made from polycotton fabric. These smart casual lounge polos are extremely comfortable and can be worn on and off the field. Create your own team identity with your logos embroidered on the left chest. Our polos are tailored for a slim, modern silhouette. Combine your polos with just about anything from a crisp chino to rugged jeans.</p>', '1', '950', '18', '19', '22', '290', '23', '29', '', '4', '4', '3', '', '2', '88', NULL, NULL, NULL, NULL, NULL, 'Lounge Button', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron if needed</li>\n</ul>', '<ul>\n<li>20% polyester 80% cotton</li>\n<li>Stylish four button placket</li>\n<li>Also available in snap button option</li>\n<li>180 GSM in weight</li>\n<li>Ribbed polo collar</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 1),
(196, 9, '10', 'Lounge', '', '<p style="text-align: left;">The CCC Lounge polo is made from polycotton fabric. These smart casual lounge polos are extremely comfortable and can be worn on and off the field. Create your own team identity with your logos embroidered on the left chest. Our polos are tailored for a slim, modern silhouette. Combine your polos with just about anything from a crisp chino to rugged jeans.</p>', '1', '950', '18', '19', '22', '290', '23', '29', '', '4', '4', '4', '', '2', '89', NULL, NULL, NULL, NULL, NULL, 'Lounge Button', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron if needed</li>\n</ul>', '<ul>\n<li>20% polyester 80% cotton</li>\n<li>Stylish four button placket</li>\n<li>Also available in snap button option</li>\n<li>180 GSM in weight</li>\n<li>Ribbed polo collar</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 1),
(197, 9, '10', 'Lounge', '', '<p style="text-align: left;">The CCC Lounge polo is made from polycotton fabric. These smart casual lounge polos are extremely comfortable and can be worn on and off the field. Create your own team identity with your logos embroidered on the left chest. Our polos are tailored for a slim, modern silhouette. Combine your polos with just about anything from a crisp chino to rugged jeans.</p>', '1', '950', '18', '19', '22', '290', '23', '29', '', '4', '4', '13', '', '2', '90', NULL, NULL, NULL, NULL, NULL, 'Lounge Button', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron if needed</li>\n</ul>', '<ul>\n<li>20% polyester 80% cotton</li>\n<li>Stylish four button placket</li>\n<li>Also available in snap button option</li>\n<li>180 GSM in weight</li>\n<li>Ribbed polo collar</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 1),
(198, 9, '0', 'Tour', '', '<p>Our Touring polos are made from polycotton fabric. These touring polos are just perfect for a flaunt factor to wear as a unit. It is detailed with a zipper on the placket and tailored to fit all size men. Team your polos with just about anything, from a crisp chino to rugged jeans.</p>', '1', '950', '18', '19', '22', '290', '23', '29', '', '4', '3', '1', '', '2', '91', NULL, NULL, NULL, NULL, NULL, 'Tour Zip', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron if needed</li>\n</ul>', '<ul>\n<li>20% polyester 80% cotton</li>\n<li>Polo collar half zip</li>\n<li>180 GSM in weight</li>\n<li>Ribbed polo collar</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 2),
(199, 9, '1', 'Tour', '', '<p>Our Touring polos are made from polycotton fabric. These touring polos are just perfect for a flaunt factor to wear as a unit. It is detailed with a zipper on the placket and tailored to fit all size men. Team your polos with just about anything, from a crisp chino to rugged jeans.</p>', '1', '950', '18', '19', '22', '290', '23', '29', '', '4', '3', '2', '', '2', '92', NULL, NULL, NULL, NULL, NULL, 'Tour Zip', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron if needed</li>\n</ul>', '<ul>\n<li>20% polyester 80% cotton</li>\n<li>Polo collar half zip</li>\n<li>180 GSM in weight</li>\n<li>Ribbed polo collar</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 2),
(200, 9, '1', 'Tour', '', '<p>Our Touring polos are made from polycotton fabric. These touring polos are just perfect for a flaunt factor to wear as a unit. It is detailed with a zipper on the placket and tailored to fit all size men. Team your polos with just about anything, from a crisp chino to rugged jeans.</p>', '1', '950', '18', '19', '22', '290', '23', '29', '', '4', '3', '3', '', '2', '93', NULL, NULL, NULL, NULL, NULL, 'Tour Zip', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron if needed</li>\n</ul>', '<ul>\n<li>20% polyester 80% cotton</li>\n<li>Polo collar half zip</li>\n<li>180 GSM in weight</li>\n<li>Ribbed polo collar</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 2),
(201, 9, '0', 'Tour', '', '<p>Our Touring polos are made from polycotton fabric. These touring polos are just perfect for a flaunt factor to wear as a unit. It is detailed with a zipper on the placket and tailored to fit all size men. Team your polos with just about anything, from a crisp chino to rugged jeans.</p>', '1', '950', '18', '19', '22', '290', '23', '29', '', '4', '3', '4', '', '2', '94', NULL, NULL, NULL, NULL, NULL, 'Tour Zip', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron if needed</li>\n</ul>', '<ul>\n<li>20% polyester 80% cotton</li>\n<li>Polo collar half zip</li>\n<li>180 GSM in weight</li>\n<li>Ribbed polo collar</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 2),
(202, 9, '0', 'Tour', '', '<p>Our Touring polos are made from polycotton fabric. These touring polos are just perfect for a flaunt factor to wear as a unit. It is detailed with a zipper on the placket and tailored to fit all size men. Team your polos with just about anything, from a crisp chino to rugged jeans.</p>', '1', '950', '18', '19', '22', '290', '23', '29', '', '4', '3', '13', '', '2', '95', NULL, NULL, NULL, NULL, NULL, 'Tour Zip', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron if needed</li>\n</ul>', '<ul>\n<li>20% polyester 80% cotton</li>\n<li>Polo collar half zip</li>\n<li>180 GSM in weight</li>\n<li>Ribbed polo collar</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 2),
(203, 9, '0', 'Nation', '', '<p>The CCC Nation polo is made from polycotton fabric. A perfect belnd of pride and spirit. Represent your club and your nation. Just about all national flags can be emroidered onto your polo on the left chest or back. It is tailored to fit all size men. Team your polos with just about anything, from a crisp chino to rugged jeans.</p>', '1', '950', '18', '19', '22', '290', '23', '29', '', '4', '3', '1', '', '2', '96', NULL, NULL, NULL, NULL, NULL, 'Nation Flag', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>20% polyester 80% cotton</li>\n<li>3 button placket with nation stripes</li>\n<li>Also available in snap button placket</li>\n<li>180 GSM in weight</li>\n<li>Ribbed polo collar</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 3),
(204, 9, '0', 'Nation', '', '<p>The CCC Nation polo is made from polycotton fabric. A perfect belnd of pride and spirit. Represent your club and your nation. Just about all national flags can be emroidered onto your polo on the left chest or back. It is tailored to fit all size men. Team your polos with just about anything, from a crisp chino to rugged jeans.</p>', '1', '950', '18', '19', '22', '290', '23', '29', '', '4', '3', '2', '', '2', '97', NULL, NULL, NULL, NULL, NULL, 'Nation Flag', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>20% polyester 80% cotton</li>\n<li>3 button placket with nation stripes</li>\n<li>Also available in snap button placket</li>\n<li>180 GSM in weight</li>\n<li>Ribbed polo collar</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 3),
(205, 9, '0', 'Nation', '', '<p>The CCC Nation polo is made from polycotton fabric. A perfect belnd of pride and spirit. Represent your club and your nation. Just about all national flags can be emroidered onto your polo on the left chest or back. It is tailored to fit all size men. Team your polos with just about anything, from a crisp chino to rugged jeans.</p>', '1', '950', '18', '19', '22', '290', '23', '29', '', '4', '3', '3', '', '2', '98', NULL, NULL, NULL, NULL, NULL, 'Nation Flag', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>20% polyester 80% cotton</li>\n<li>3 button placket with nation stripes</li>\n<li>Also available in snap button placket</li>\n<li>180 GSM in weight</li>\n<li>Ribbed polo collar</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 3),
(206, 9, '0', 'Nation', '', '<p>The CCC Nation polo is made from polycotton fabric. A perfect belnd of pride and spirit. Represent your club and your nation. Just about all national flags can be emroidered onto your polo on the left chest or back. It is tailored to fit all size men. Team your polos with just about anything, from a crisp chino to rugged jeans.</p>', '1', '950', '18', '19', '22', '290', '23', '29', '', '4', '3', '4', '', '2', '99', NULL, NULL, NULL, NULL, NULL, 'Nation Flag', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>20% polyester 80% cotton</li>\n<li>3 button placket with nation stripes</li>\n<li>Also available in snap button placket</li>\n<li>180 GSM in weight</li>\n<li>Ribbed polo collar</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 3),
(207, 9, '0', 'Nation', '', '<p>The CCC Nation polo is made from polycotton fabric. A perfect belnd of pride and spirit. Represent your club and your nation. Just about all national flags can be emroidered onto your polo on the left chest or back. It is tailored to fit all size men. Team your polos with just about anything, from a crisp chino to rugged jeans.</p>', '1', '950', '18', '19', '22', '290', '23', '29', '', '4', '3', '13', '', '2', '100', NULL, NULL, NULL, NULL, NULL, 'Nation Flag', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>20% polyester 80% cotton</li>\n<li>3 button placket with nation stripes</li>\n<li>Also available in snap button placket</li>\n<li>180 GSM in weight</li>\n<li>Ribbed polo collar</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 3),
(208, 9, '0', 'Hoodie  Half Zip', '', '<p>The Custom Cricket Company half-zip Hoody is extremely comfortable and is ideal for everyday wear. This hoody comes with a half-zip front fastening, two front pockets and Custom Cricket Company logo to the left chest.</p>', '1', '1100', '28', '29', '37', '380', '34', '34', '', '4', '3', '1', '', '2', '101', NULL, NULL, NULL, NULL, NULL, 'Hoodie HZ', '', '', '', '', '', '', '', '<ul>\n<li>Wash sweatshirt inside out on the gentle cycle using warm wash and rinse</li>\n<li>Do not use fabric softeners and bleach</li>\n<li>Dry fleece in dryer</li>\n<li>Fold or press iron</li>\n</ul>', '<ul>\n<li>65% polyester 35% cotton</li>\n<li>Fleeced inner lining to keep you warm and snug</li>\n<li>Drawstring hood, half front bronze zip fastening</li>\n<li>Split kangroo pockets</li>\n<li>Ribbed sides, ribbed hem</li>\n<li>Long sleevs with ribbed cuffs</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 4),
(209, 9, '0', 'Hoodie  Half Zip', '', '<p>The Custom Cricket Company half-zip Hoody is extremely comfortable and is ideal for everyday wear. This hoody comes with a half-zip front fastening, two front pockets and Custom Cricket Company logo to the left chest.</p>', '1', '1100', '28', '29', '37', '380', '34', '34', '', '4', '3', '2', '', '2', '102', NULL, NULL, NULL, NULL, NULL, 'Hoodie HZ', '', '', '', '', '', '', '', '<ul>\n<li>Wash sweatshirt inside out on the gentle cycle using warm wash and rinse</li>\n<li>Do not use fabric softeners and bleach</li>\n<li>Dry fleece in dryer</li>\n<li>Fold or press iron</li>\n</ul>', '<ul>\n<li>65% polyester 35% cotton</li>\n<li>Fleeced inner lining to keep you warm and snug</li>\n<li>Drawstring hood, half front bronze zip fastening</li>\n<li>Split kangroo pockets</li>\n<li>Ribbed sides, ribbed hem</li>\n<li>Long sleevs with ribbed cuffs</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 4);
INSERT INTO `fynx_product` (`id`, `subcategory`, `quantity`, `name`, `type`, `description`, `visibility`, `INR`, `USD`, `GBP`, `EUR`, `ZAF`, `AUD`, `NZD`, `relatedproduct`, `category`, `color`, `size`, `sizechart`, `status`, `sku`, `image1`, `image2`, `image3`, `image4`, `image5`, `baseproduct`, `discountINR`, `discountUSD`, `discountGBP`, `discountEUR`, `discountZAF`, `discountAUD`, `discountNZD`, `care`, `detail`, `delivery`, `categorycare`, `build`, `features`, `note`, `minimumquantity`, `order`) VALUES
(210, 9, '0', 'Hoodie  Half Zip', '', '<p>The Custom Cricket Company half-zip Hoody is extremely comfortable and is ideal for everyday wear. This hoody comes with a half-zip front fastening, two front pockets and Custom Cricket Company logo to the left chest.</p>', '1', '1100', '28', '29', '37', '380', '34', '34', '', '4', '3', '3', '', '2', '103', NULL, NULL, NULL, NULL, NULL, 'Hoodie HZ', '', '', '', '', '', '', '', '<ul>\n<li>Wash sweatshirt inside out on the gentle cycle using warm wash and rinse</li>\n<li>Do not use fabric softeners and bleach</li>\n<li>Dry fleece in dryer</li>\n<li>Fold or press iron</li>\n</ul>', '<ul>\n<li>65% polyester 35% cotton</li>\n<li>Fleeced inner lining to keep you warm and snug</li>\n<li>Drawstring hood, half front bronze zip fastening</li>\n<li>Split kangroo pockets</li>\n<li>Ribbed sides, ribbed hem</li>\n<li>Long sleevs with ribbed cuffs</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 4),
(211, 9, '0', 'Hoodie  Half Zip', '', '<p>The Custom Cricket Company half-zip Hoody is extremely comfortable and is ideal for everyday wear. This hoody comes with a half-zip front fastening, two front pockets and Custom Cricket Company logo to the left chest.</p>', '1', '1100', '28', '29', '37', '380', '34', '34', '', '4', '3', '4', '', '2', '104', NULL, NULL, NULL, NULL, NULL, 'Hoodie HZ', '', '', '', '', '', '', '', '<ul>\n<li>Wash sweatshirt inside out on the gentle cycle using warm wash and rinse</li>\n<li>Do not use fabric softeners and bleach</li>\n<li>Dry fleece in dryer</li>\n<li>Fold or press iron</li>\n</ul>', '<ul>\n<li>65% polyester 35% cotton</li>\n<li>Fleeced inner lining to keep you warm and snug</li>\n<li>Drawstring hood, half front bronze zip fastening</li>\n<li>Split kangroo pockets</li>\n<li>Ribbed sides, ribbed hem</li>\n<li>Long sleevs with ribbed cuffs</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 4),
(212, 9, '0', 'Hoodie  Half Zip', '', '<p>The Custom Cricket Company half-zip Hoody is extremely comfortable and is ideal for everyday wear. This hoody comes with a half-zip front fastening, two front pockets and Custom Cricket Company logo to the left chest.</p>', '1', '1100', '28', '29', '37', '380', '34', '34', '', '4', '3', '13', '', '2', '105', NULL, NULL, NULL, NULL, NULL, 'Hoodie HZ', '', '', '', '', '', '', '', '<ul>\n<li>Wash sweatshirt inside out on the gentle cycle using warm wash and rinse</li>\n<li>Do not use fabric softeners and bleach</li>\n<li>Dry fleece in dryer</li>\n<li>Fold or press iron</li>\n</ul>', '<ul>\n<li>65% polyester 35% cotton</li>\n<li>Fleeced inner lining to keep you warm and snug</li>\n<li>Drawstring hood, half front bronze zip fastening</li>\n<li>Split kangroo pockets</li>\n<li>Ribbed sides, ribbed hem</li>\n<li>Long sleevs with ribbed cuffs</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 4),
(213, 9, '0', 'Hoodie Full Zip', '', '<p>The Custom Cricket Company Full Zip Hoody has a comfortable fit and is ideal for everyday use. Perfect for post-match wear in nippy conditions. This hoody comes with a full front zip fastening, two concealed zipper pockets and CCC logo on the left chest.</p>', '1', '1100', '28', '29', '37', '380', '34', '34', '', '4', '4', '1', '', '2', '106', NULL, NULL, NULL, NULL, NULL, 'Hoodie FZ', '', '', '', '', '', '', '', '<ul>\n<li>Wash sweatshirt inside out on the gentle cycle using warm wash and rinse</li>\n<li>Do not use fabric softeners and bleach</li>\n<li>Dry fleece in dryer</li>\n<li>Fold or press iron</li>\n</ul>', '<ul>\n<li>65% polyester 35% cotton</li>\n<li>Fleeced inner lining</li>\n<li>Drawstring hood, full front bronze zip fastening</li>\n<li>Zipper pockets</li>\n<li>Ribbed sides, ribbed hem</li>\n<li>Long sleevs with ribbed cuffs</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 5),
(214, 9, '0', 'Hoodie Full Zip', '', '<p>The Custom Cricket Company Full Zip Hoody has a comfortable fit and is ideal for everyday use. Perfect for post-match wear in nippy conditions. This hoody comes with a full front zip fastening, two concealed zipper pockets and CCC logo on the left chest.</p>', '1', '1100', '28', '29', '37', '380', '34', '34', '', '4', '4', '2', '', '2', '107', NULL, NULL, NULL, NULL, NULL, 'Hoodie FZ', '', '', '', '', '', '', '', '<ul>\n<li>Wash sweatshirt inside out on the gentle cycle using warm wash and rinse</li>\n<li>Do not use fabric softeners and bleach</li>\n<li>Dry fleece in dryer</li>\n<li>Fold or press iron</li>\n</ul>', '<ul>\n<li>65% polyester 35% cotton</li>\n<li>Fleeced inner lining</li>\n<li>Drawstring hood, full front bronze zip fastening</li>\n<li>Zipper pockets</li>\n<li>Ribbed sides, ribbed hem</li>\n<li>Long sleevs with ribbed cuffs</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 5),
(215, 9, '2', 'Hoodie Full Zip', '', '<p>The Custom Cricket Company Full Zip Hoody has a comfortable fit and is ideal for everyday use. Perfect for post-match wear in nippy conditions. This hoody comes with a full front zip fastening, two concealed zipper pockets and CCC logo on the left chest.</p>', '1', '1100', '28', '29', '37', '380', '34', '34', '', '4', '4', '3', '', '2', '108', NULL, NULL, NULL, NULL, NULL, 'Hoodie FZ', '', '', '', '', '', '', '', '<ul>\n<li>Wash sweatshirt inside out on the gentle cycle using warm wash and rinse</li>\n<li>Do not use fabric softeners and bleach</li>\n<li>Dry fleece in dryer</li>\n<li>Fold or press iron</li>\n</ul>', '<ul>\n<li>65% polyester 35% cotton</li>\n<li>Fleeced inner lining</li>\n<li>Drawstring hood, full front bronze zip fastening</li>\n<li>Zipper pockets</li>\n<li>Ribbed sides, ribbed hem</li>\n<li>Long sleevs with ribbed cuffs</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 5),
(216, 9, '0', 'Hoodie Full Zip', '', '<p>The Custom Cricket Company Full Zip Hoody has a comfortable fit and is ideal for everyday use. Perfect for post-match wear in nippy conditions. This hoody comes with a full front zip fastening, two concealed zipper pockets and CCC logo on the left chest.</p>', '1', '1100', '28', '29', '37', '380', '34', '34', '', '4', '4', '4', '', '2', '109', NULL, NULL, NULL, NULL, NULL, 'Hoodie FZ', '', '', '', '', '', '', '', '<ul>\n<li>Wash sweatshirt inside out on the gentle cycle using warm wash and rinse</li>\n<li>Do not use fabric softeners and bleach</li>\n<li>Dry fleece in dryer</li>\n<li>Fold or press iron</li>\n</ul>', '<ul>\n<li>65% polyester 35% cotton</li>\n<li>Fleeced inner lining</li>\n<li>Drawstring hood, full front bronze zip fastening</li>\n<li>Zipper pockets</li>\n<li>Ribbed sides, ribbed hem</li>\n<li>Long sleevs with ribbed cuffs</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 5),
(217, 9, '0', 'Hoodie Full Zip', '', '<p>The Custom Cricket Company Full Zip Hoody has a comfortable fit and is ideal for everyday use. Perfect for post-match wear in nippy conditions. This hoody comes with a full front zip fastening, two concealed zipper pockets and CCC logo on the left chest.</p>', '1', '1100', '28', '29', '37', '380', '34', '34', '', '4', '4', '13', '', '2', '110', NULL, NULL, NULL, NULL, NULL, 'Hoodie FZ', '', '', '', '', '', '', '', '<ul>\n<li>Wash sweatshirt inside out on the gentle cycle using warm wash and rinse</li>\n<li>Do not use fabric softeners and bleach</li>\n<li>Dry fleece in dryer</li>\n<li>Fold or press iron</li>\n</ul>', '<ul>\n<li>65% polyester 35% cotton</li>\n<li>Fleeced inner lining</li>\n<li>Drawstring hood, full front bronze zip fastening</li>\n<li>Zipper pockets</li>\n<li>Ribbed sides, ribbed hem</li>\n<li>Long sleevs with ribbed cuffs</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 5),
(218, 9, '0', 'Steel', '', '<p style="text-align: justify;">The Custom Cricket Company performance training jackets are ideal for colder conditions on the training ground. The training jackets are constructed with dot knit wicking fabric for high performance even during cricket training.</p>', '1', '1350', '32', '28', '25', '395', '35', '33', '', '4', '4', '14', '', '2', '280', NULL, NULL, NULL, NULL, NULL, 'Steel Windcheater', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Elasticated cuffs and waitband</li>\n<li>Full zipper</li>\n<li>2 kangaroo pockets on the front</li>\n</ul>', '<p>In-stock jackets are shipped immediately. Customisation worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 9),
(219, 9, '0', 'Steel', '', '<p style="text-align: justify;">The Custom Cricket Company performance training jackets are ideal for colder conditions on the training ground. The training jackets are constructed with dot knit wicking fabric for high performance even during cricket training.</p>', '1', '1350', '32', '28', '25', '395', '35', '33', '', '4', '4', '15', '', '2', '281', NULL, NULL, NULL, NULL, NULL, 'Steel Windcheater', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Elasticated cuffs and waitband</li>\n<li>Full zipper</li>\n<li>2 kangaroo pockets on the front</li>\n</ul>', '<p>In-stock jackets are shipped immediately. Customisation worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 9),
(220, 9, '2', 'Crossfit', '', '<p style="text-align: justify;">Crossfit training pants are sleek and versatile. Designed to be used during traininng and travel. They have an additional mesh feature running along the inside to keep the body cool whilst playing. Two zipper pockets for valuables and zipper slits at the ankle for the bowling boot expansion are functional features that make this product very handy.</p>', '1', '750', '22', '24', '24', '290', '26', '29', '', '4', '3', '14', '', '2', '282', NULL, NULL, NULL, NULL, NULL, 'Crossfit Pants', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>Soft waterproof windcheater fabric</li>\n<li>Drawstring elastic waistband</li>\n<li>180 GSM weight of fabric</li>\n<li>Inner mesh running along length</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 10),
(221, 9, '2', 'Crossfit', '', '<p style="text-align: justify;">Crossfit training pants are sleek and versatile. Designed to be used during traininng and travel. They have an additional mesh feature running along the inside to keep the body cool whilst playing. Two zipper pockets for valuables and zipper slits at the ankle for the bowling boot expansion are functional features that make this product very handy.</p>', '1', '750', '22', '24', '24', '290', '26', '29', '', '4', '3', '15', '', '2', '283', NULL, NULL, NULL, NULL, NULL, 'Crossfit Pants', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>Soft waterproof windcheater fabric</li>\n<li>Drawstring elastic waistband</li>\n<li>180 GSM weight of fabric</li>\n<li>Inner mesh running along length</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 10),
(222, 9, '2', 'Crossfit', '', '<p style="text-align: justify;">Crossfit training pants are sleek and versatile. Designed to be used during traininng and travel. They have an additional mesh feature running along the inside to keep the body cool whilst playing. Two zipper pockets for valuables and zipper slits at the ankle for the bowling boot expansion are functional features that make this product very handy.</p>', '1', '750', '20', '19', '22', '290', '23', '29', '', '4', '3', '16', '', '2', '284', NULL, NULL, NULL, NULL, NULL, 'Crossfit Pants', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>Soft waterproof windcheater fabric</li>\n<li>Drawstring elastic waistband</li>\n<li>180 GSM weight of fabric</li>\n<li>Inner mesh running along length</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 10),
(223, 9, '10', 'Lounge', '', '<p style="text-align: left;">The CCC Lounge polo is made from polycotton fabric. These smart casual lounge polos are extremely comfortable and can be worn on and off the field. Create your own team identity with your logos embroidered on the left chest. Our polos are tailored for a slim, modern silhouette. Combine your polos with just about anything from a crisp chino to rugged jeans.</p>', '1', '950', '18', '19', '22', '290', '23', '29', '', '4', '4', '14', '', '2', '285', NULL, NULL, NULL, NULL, NULL, 'Lounge Button', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron if needed</li>\n</ul>', '<ul>\n<li>20% polyester 80% cotton</li>\n<li>Stylish four button placket</li>\n<li>Also available in snap button option</li>\n<li>180 GSM in weight</li>\n<li>Ribbed polo collar</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 1),
(224, 9, '10', 'Lounge', '', '<p style="text-align: left;">The CCC Lounge polo is made from polycotton fabric. These smart casual lounge polos are extremely comfortable and can be worn on and off the field. Create your own team identity with your logos embroidered on the left chest. Our polos are tailored for a slim, modern silhouette. Combine your polos with just about anything from a crisp chino to rugged jeans.</p>', '1', '950', '18', '19', '22', '290', '23', '29', '', '4', '4', '15', '', '2', '286', NULL, NULL, NULL, NULL, NULL, 'Lounge Button', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron if needed</li>\n</ul>', '<ul>\n<li>20% polyester 80% cotton</li>\n<li>Stylish four button placket</li>\n<li>Also available in snap button option</li>\n<li>180 GSM in weight</li>\n<li>Ribbed polo collar</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 1),
(225, 9, '0', 'Tour', '', '<p>Our Touring polos are made from polycotton fabric. These touring polos are just perfect for a flaunt factor to wear as a unit. It is detailed with a zipper on the placket and tailored to fit all size men. Team your polos with just about anything, from a crisp chino to rugged jeans.</p>', '1', '950', '18', '19', '22', '290', '23', '29', '', '4', '3', '14', '', '2', '287', NULL, NULL, NULL, NULL, NULL, 'Tour Zip', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron if needed</li>\n</ul>', '<ul>\n<li>20% polyester 80% cotton</li>\n<li>Polo collar half zip</li>\n<li>180 GSM in weight</li>\n<li>Ribbed polo collar</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 2),
(226, 9, '0', 'Tour', '', '<p>Our Touring polos are made from polycotton fabric. These touring polos are just perfect for a flaunt factor to wear as a unit. It is detailed with a zipper on the placket and tailored to fit all size men. Team your polos with just about anything, from a crisp chino to rugged jeans.</p>', '1', '950', '18', '19', '22', '290', '23', '29', '', '4', '3', '15', '', '2', '288', NULL, NULL, NULL, NULL, NULL, 'Tour Zip', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron if needed</li>\n</ul>', '<ul>\n<li>20% polyester 80% cotton</li>\n<li>Polo collar half zip</li>\n<li>180 GSM in weight</li>\n<li>Ribbed polo collar</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 2),
(227, 9, '0', 'Nation', '', '<p>The CCC Nation polo is made from polycotton fabric. A perfect belnd of pride and spirit. Represent your club and your nation. Just about all national flags can be emroidered onto your polo on the left chest or back. It is tailored to fit all size men. Team your polos with just about anything, from a crisp chino to rugged jeans.</p>', '1', '950', '18', '19', '22', '290', '23', '29', '', '4', '3', '14', '', '2', '289', NULL, NULL, NULL, NULL, NULL, 'Nation Flag', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>20% polyester 80% cotton</li>\n<li>3 button placket with nation stripes</li>\n<li>Also available in snap button placket</li>\n<li>180 GSM in weight</li>\n<li>Ribbed polo collar</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 3),
(228, 9, '0', 'Nation', '', '<p>The CCC Nation polo is made from polycotton fabric. A perfect belnd of pride and spirit. Represent your club and your nation. Just about all national flags can be emroidered onto your polo on the left chest or back. It is tailored to fit all size men. Team your polos with just about anything, from a crisp chino to rugged jeans.</p>', '1', '950', '18', '19', '22', '290', '23', '29', '', '4', '3', '15', '', '2', '290', NULL, NULL, NULL, NULL, NULL, 'Nation Flag', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Tumble dry</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>20% polyester 80% cotton</li>\n<li>3 button placket with nation stripes</li>\n<li>Also available in snap button placket</li>\n<li>180 GSM in weight</li>\n<li>Ribbed polo collar</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 3),
(229, 9, '0', 'Hoodie  Half Zip', '', '<p>The Custom Cricket Company half-zip Hoody is extremely comfortable and is ideal for everyday wear. This hoody comes with a half-zip front fastening, two front pockets and Custom Cricket Company logo to the left chest.</p>', '1', '1100', '28', '29', '37', '380', '34', '34', '', '4', '3', '14', '', '2', '291', NULL, NULL, NULL, NULL, NULL, 'Hoodie HZ', '', '', '', '', '', '', '', '<ul>\n<li>Wash sweatshirt inside out on the gentle cycle using warm wash and rinse</li>\n<li>Do not use fabric softeners and bleach</li>\n<li>Dry fleece in dryer</li>\n<li>Fold or press iron</li>\n</ul>', '<ul>\n<li>65% polyester 35% cotton</li>\n<li>Fleeced inner lining to keep you warm and snug</li>\n<li>Drawstring hood, half front bronze zip fastening</li>\n<li>Split kangroo pockets</li>\n<li>Ribbed sides, ribbed hem</li>\n<li>Long sleevs with ribbed cuffs</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 4),
(230, 9, '0', 'Hoodie  Half Zip', '', '<p>The Custom Cricket Company half-zip Hoody is extremely comfortable and is ideal for everyday wear. This hoody comes with a half-zip front fastening, two front pockets and Custom Cricket Company logo to the left chest.</p>', '1', '1100', '28', '29', '37', '380', '34', '34', '', '4', '3', '15', '', '2', '292', NULL, NULL, NULL, NULL, NULL, 'Hoodie HZ', '', '', '', '', '', '', '', '<ul>\n<li>Wash sweatshirt inside out on the gentle cycle using warm wash and rinse</li>\n<li>Do not use fabric softeners and bleach</li>\n<li>Dry fleece in dryer</li>\n<li>Fold or press iron</li>\n</ul>', '<ul>\n<li>65% polyester 35% cotton</li>\n<li>Fleeced inner lining to keep you warm and snug</li>\n<li>Drawstring hood, half front bronze zip fastening</li>\n<li>Split kangroo pockets</li>\n<li>Ribbed sides, ribbed hem</li>\n<li>Long sleevs with ribbed cuffs</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 4),
(231, 9, '0', 'Hoodie Full Zip', '', '<p>The Custom Cricket Company Full Zip Hoody has a comfortable fit and is ideal for everyday use. Perfect for post-match wear in nippy conditions. This hoody comes with a full front zip fastening, two concealed zipper pockets and CCC logo on the left chest.</p>', '1', '1100', '28', '29', '37', '380', '34', '34', '', '4', '4', '14', '', '2', '293', NULL, NULL, NULL, NULL, NULL, 'Hoodie FZ', '', '', '', '', '', '', '', '<ul>\n<li>Wash sweatshirt inside out on the gentle cycle using warm wash and rinse</li>\n<li>Do not use fabric softeners and bleach</li>\n<li>Dry fleece in dryer</li>\n<li>Fold or press iron</li>\n</ul>', '<ul>\n<li>65% polyester 35% cotton</li>\n<li>Fleeced inner lining</li>\n<li>Drawstring hood, full front bronze zip fastening</li>\n<li>Zipper pockets</li>\n<li>Ribbed sides, ribbed hem</li>\n<li>Long sleevs with ribbed cuffs</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 5),
(232, 9, '0', 'Hoodie Full Zip', '', '<p>The Custom Cricket Company Full Zip Hoody has a comfortable fit and is ideal for everyday use. Perfect for post-match wear in nippy conditions. This hoody comes with a full front zip fastening, two concealed zipper pockets and CCC logo on the left chest.</p>', '1', '1100', '28', '29', '37', '380', '34', '34', '', '4', '4', '15', '', '2', '294', NULL, NULL, NULL, NULL, NULL, 'Hoodie FZ', '', '', '', '', '', '', '', '<ul>\n<li>Wash sweatshirt inside out on the gentle cycle using warm wash and rinse</li>\n<li>Do not use fabric softeners and bleach</li>\n<li>Dry fleece in dryer</li>\n<li>Fold or press iron</li>\n</ul>', '<ul>\n<li>65% polyester 35% cotton</li>\n<li>Fleeced inner lining</li>\n<li>Drawstring hood, full front bronze zip fastening</li>\n<li>Zipper pockets</li>\n<li>Ribbed sides, ribbed hem</li>\n<li>Long sleevs with ribbed cuffs</li>\n</ul>', '<p>In-stock designs are available for immediate shipment. Customisation takes 3-4 weeks for worldwide delivery.</p>', '', '', '', '', '', 5),
(233, 35, '0', 'Viking 1100', '', '<p style="text-align: justify;">Our Viking range of bats is our best performing blade. For the professional who expects the most out of his bat as he does himself. The Viking is swift and sword like. It is by far our lightest range of bats with a an impeccable balance whilst giving you a good profile on the hill and the edges. The Viking range is our most tested and reliable bat built to suit all conditions favouring fast bowling.</p>\n<p style="text-align: justify;">The 1100 series is right up there with the world''s best craftsmanship and wood qulity.</p>', '1', '25000', '400', '245', '350', '6000', '500', '575', '', '2', '1', '9', '', '2', '176', NULL, NULL, NULL, NULL, NULL, 'Viking 1100', '', '', '', '', '', '', '', '<p><strong>The Dont''s</strong></p>\n<ul>\n<li>Don''t expose to extremes of temperature</li>\n<li>Avoid prolonged spells in car boots/trunks</li>\n<li>Don''t over-oil. Over-oiling adds weight and spoils driving power. Oiling is not a necessity in the modern age</li>\n<li>Don''t allow the bat to become damp</li>\n<li>Don''t use cheap hard balls</li>\n</ul>\n<p>&nbsp;<strong>The&nbsp;Do''s<br /></strong></p>\n<ul>\n<li>During off-season store in a cool atmosphere away from excessive heat or damp</li>\n<li>Prepare the bat carefully by knocking it in with a mallet</li>\n<li>Do inspect the bat regularly for damage in play and repair promptly</li>\n</ul>', '<ul>\n<li>Grade 1 + English Willow</li>\n<li>8 to 9+ wide grains</li>\n<li>2lb 8oz to 2lb 9oz approximate weight</li>\n<li>Middle to lower extended sweet spot</li>\n<li>3.85 to 3.95 cm edge profile</li>\n<li>High pronounced bow</li>\n<li>Bat Index: 2</li>\n</ul>', 'In stock bats are despatched immediately. Delivery may take 10-14 days.', '', '', '', '', '', 1),
(234, 35, '5', 'Viking 1000', '', '<p style="text-align: justify;">Our Viking range of bats is our best performing blade. For the professional who expects the most out of his bat as he does himself. The Viking is swift and sword like. It is by far our lightest range of bats with a an impeccable balance whilst giving you a good profile on the hill and the edges. The Viking range is our most tested and reliable bat built to suit all conditions favouring fast bowling.</p>\n<p style="text-align: justify;">The 1000 series is up there with the best withn high quality materials in play. Light pick-up allows tremendous bat speed combined with a huge sweetspot to ensure that the power player will get a litle extra value on all his strokes.</p>', '1', '22500', '350', '220', '300', '5400', '450', '525', '', '2', '10', '9', '', '2', '177', NULL, NULL, NULL, NULL, NULL, 'Viking 1000', '', '', '', '', '', '', '', '<p><strong>The Dont''s</strong></p>\n<ul>\n<li>Don''t expose to extremes of temperature</li>\n<li>Avoid prolonged spells in car boots/trunks</li>\n<li>Don''t over-oil. Over-oiling adds weight and spoils driving power. Oiling is not a necessity in the modern age</li>\n<li>Don''t allow the bat to become damp</li>\n<li>Don''t use cheap hard balls</li>\n</ul>\n<p>&nbsp;<strong>The&nbsp;Do''s<br /></strong></p>\n<ul>\n<li>During off-season store in a cool atmosphere away from excessive heat or damp</li>\n<li>Prepare the bat carefully by knocking it in with a mallet</li>\n<li>Do inspect the bat regularly for damage in play and repair promptly</li>\n</ul>', '<ul>\n<li>Grade 1 English Willow</li>\n<li>6 to 7+ wide grains</li>\n<li>2lb 8oz to 2lb 9oz approximate weight</li>\n<li>Middle to lower extended sweet spot</li>\n<li>3.85 to 3.95 cm edge profile</li>\n<li>High pronounced bow</li>\n<li>Bat Index: 2</li>\n</ul>', 'In stock bats are despatched immediately. Delivery may take 10-14 days.', '', '', '', '', '', 2),
(235, 35, '5', 'Viking 909', '', '<p style="text-align: justify;">Our Viking range of bats is our best performing blade. For the professional who expects the most out of his bat as he does himself. The Viking is swift and sword like. It is by far our lightest range of bats with a an impeccable balance whilst giving you a good profile on the hill and the edges. The Viking range is our most tested and reliable bat built to suit all conditions favouring fast bowling.</p>\n<p style="text-align: justify;">Our 909''s&nbsp;are made from high quality english willow. The grains are moderately tight (between 6 and 8) and straight. The wood may possess some superficial blemishes. This is where&nbsp;precision meets timing in this beautiful, bowed sword of a willow. A value for money product.</p>', '1', '18000', '300', '195', '250', '5000', '400', '450', '', '2', '10', '9', '', '2', '178', NULL, NULL, NULL, NULL, NULL, 'Viking 909', '', '', '', '', '', '', '', '<p><strong>The Dont''s</strong></p>\n<ul>\n<li>Don''t expose to extremes of temperature</li>\n<li>Avoid prolonged spells in car boots/trunks</li>\n<li>Don''t over-oil. Over-oiling adds weight and spoils driving power. Oiling is not a necessity in the modern age</li>\n<li>Don''t allow the bat to become damp</li>\n<li>Don''t use cheap hard balls</li>\n</ul>\n<p>&nbsp;<strong>The&nbsp;Do''s<br /></strong></p>\n<ul>\n<li>During off-season store in a cool atmosphere away from excessive heat or damp</li>\n<li>Prepare the bat carefully by knocking it in with a mallet</li>\n<li>Do inspect the bat regularly for damage in play and repair promptly</li>\n</ul>', '<ul>\n<li>Grade 2/2+ English Willow</li>\n<li>6 to 7+ wide grains</li>\n<li>2lb 8oz to 2lb 9oz approximate weight</li>\n<li>Middle to lower extended sweet spot</li>\n<li>3.85 to 3.95 cm edge profile</li>\n<li>High pronounced bow</li>\n<li>Bat Index: 2</li>\n</ul>', 'In stock bats are despatched immediately. Delivery may take 10-14 days.', '', '', '', '', '', 3),
(236, 35, '5', 'Viking 808', '', '<p style="text-align: justify;">CCC 808 series is a Grade 2 blade which is also of very good quality and normally a larger amount of red wood can be seen on the edge of a blade, this has no effect on the playing ability of the bat it is purely cosmetic. We also put the top 5% of the excellent quality butterfly blades that we get into Grade 2.&nbsp;</p>\n<p style="text-align: justify;">The Viking range of bats is our best performing blade. For the professional who expects the most out of his bat as he does himself. The Viking is swift and sword like. It is by far our lightest range of bats with a an impeccable balance whilst giving you a good profile on the hill and the edges. The Viking range is our most tested and reliable bat built to suit all conditions favouring fast bowling.</p>\n<p style="text-align: justify;">&nbsp;</p>', '1', '15000', '285', '170', '200', '4500', '385', '400', '', '2', '10', '9', '', '2', '179', NULL, NULL, NULL, NULL, NULL, 'Viking 808', '', '', '', '', '', '', '', '<p><strong>The Dont''s</strong></p>\n<ul>\n<li>Don''t expose to extremes of temperature</li>\n<li>Avoid prolonged spells in car boots/trunks</li>\n<li>Don''t over-oil. Over-oiling adds weight and spoils driving power. Oiling is not a necessity in the modern age</li>\n<li>Don''t allow the bat to become damp</li>\n<li>Don''t use cheap hard balls</li>\n</ul>\n<p>&nbsp;<strong>The&nbsp;Do''s<br /></strong></p>\n<ul>\n<li>During off-season store in a cool atmosphere away from excessive heat or damp</li>\n<li>Prepare the bat carefully by knocking it in with a mallet</li>\n<li>Do inspect the bat regularly for damage in play and repair promptly</li>\n</ul>', '<ul>\n<li>Grade 2/2+ English Willow</li>\n<li>6 to 7+ wide grains</li>\n<li>2lb 8oz to 2lb 9oz approximate weight</li>\n<li>Middle to lower extended sweet spot</li>\n<li>3.85 to 3.95 cm edge profile</li>\n<li>High pronounced bow</li>\n<li>Bat Index: 2</li>\n</ul>', 'In stock bats are despatched immediately. Delivery may take 10-14 days.', '', '', '', '', '', 4),
(237, 5, '1', 'Point', '', '<p style="text-align: justify;">The Custom Cricket Company Point tee is a traditional style and made from wicking fabric that lifts moisture from your body. Tested and built to perform in warm and cold climate conditions. The trim on the verticle shoulder sides gives it a stylish and sporty look for cricketers of all ages.</p>', '1', '850', '22', '18', '20', '280', '22', '28', '', '4', '1', '1', '', '2', '1', NULL, NULL, NULL, NULL, NULL, 'Traditional HS', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket Company logo on the right chest</li>\n<li>100% soft polyester</li>\n<li>160 GSM in weight</li>\n<li>Polo ribbed collar with 3-button placket</li>\n<li>Tested and fitted for optimum performance for all playing conditions</li>\n</ul>', '<p>In-stock tees are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 1),
(238, 5, '1', 'Point', '', '<p style="text-align: justify;">The Custom Cricket Company Point tee is a traditional style and made from wicking fabric that lifts moisture from your body. Tested and built to perform in warm and cold climate conditions. The trim on the verticle shoulder sides gives it a stylish and sporty look for cricketers of all ages.</p>', '1', '850', '22', '18', '20', '280', '22', '28', '', '4', '1', '2', '', '2', '2', NULL, NULL, NULL, NULL, NULL, 'Traditional HS', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket Company logo on the right chest</li>\n<li>100% soft polyester</li>\n<li>160 GSM in weight</li>\n<li>Polo ribbed collar with 3-button placket</li>\n<li>Tested and fitted for optimum performance for all playing conditions</li>\n</ul>', '<p>In-stock tees are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 1),
(239, 5, '1', 'Point', '', '<p style="text-align: justify;">The Custom Cricket Company Point tee is a traditional style and made from wicking fabric that lifts moisture from your body. Tested and built to perform in warm and cold climate conditions. The trim on the verticle shoulder sides gives it a stylish and sporty look for cricketers of all ages.</p>', '1', '850', '22', '18', '20', '280', '22', '28', '', '4', '1', '3', '', '2', '3', NULL, NULL, NULL, NULL, NULL, 'Traditional HS', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket Company logo on the right chest</li>\n<li>100% soft polyester</li>\n<li>160 GSM in weight</li>\n<li>Polo ribbed collar with 3-button placket</li>\n<li>Tested and fitted for optimum performance for all playing conditions</li>\n</ul>', '<p>In-stock tees are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 1),
(240, 5, '2', 'Point', '', '<p style="text-align: justify;">The Custom Cricket Company Point tee is a traditional style and made from wicking fabric that lifts moisture from your body. Tested and built to perform in warm and cold climate conditions. The trim on the verticle shoulder sides gives it a stylish and sporty look for cricketers of all ages.</p>', '1', '850', '22', '18', '20', '280', '22', '28', '', '4', '1', '4', '', '2', '4', NULL, NULL, NULL, NULL, NULL, 'Traditional HS', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket Company logo on the right chest</li>\n<li>100% soft polyester</li>\n<li>160 GSM in weight</li>\n<li>Polo ribbed collar with 3-button placket</li>\n<li>Tested and fitted for optimum performance for all playing conditions</li>\n</ul>', '<p>In-stock tees are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 1),
(241, 5, '2', 'Point', '', '<p style="text-align: justify;">The Custom Cricket Company Point tee is a traditional style and made from wicking fabric that lifts moisture from your body. Tested and built to perform in warm and cold climate conditions. The trim on the verticle shoulder sides gives it a stylish and sporty look for cricketers of all ages.</p>', '1', '850', '22', '18', '20', '280', '22', '28', '', '4', '1', '13', '', '2', '5', NULL, NULL, NULL, NULL, NULL, 'Traditional HS', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket Company logo on the right chest</li>\n<li>100% soft polyester</li>\n<li>160 GSM in weight</li>\n<li>Polo ribbed collar with 3-button placket</li>\n<li>Tested and fitted for optimum performance for all playing conditions</li>\n</ul>', '<p>In-stock tees are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 1),
(242, 5, '1', 'Cover', '', '<p style="text-align: justify;">The Custom Cricket Company Cover tee is made from wicking dri-fit fabric. The trim at the front and back of the jersey is a trendy and stylish look. One of our more popular tees in the range.</p>', '1', '850', '22', '18', '20', '280', '22', '28', '', '4', '1', '1', '', '2', '6', NULL, NULL, NULL, NULL, NULL, 'Armour ', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color.</li>\n<li>Avoid drying machines, which can weaken the fabric''s effectiveness.</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket Company on the right chest</li>\n<li>100% polyester / dri-fit</li>\n<li>180 GSM in weight</li>\n<li>Ribbed polo collar with&nbsp;3-button placket</li>\n<li>Tested and fitted for optimum performance in all playing conditions</li>\n</ul>', '<p>In-stock tees are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 2),
(243, 5, '1', 'Cover', '', '<p style="text-align: justify;">The Custom Cricket Company Cover tee is made from wicking dri-fit fabric. The trim at the front and back of the jersey is a trendy and stylish look. One of our more popular tees in the range.</p>', '1', '850', '22', '18', '20', '280', '22', '28', '', '4', '1', '2', '', '2', '7', NULL, NULL, NULL, NULL, NULL, 'Armour ', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color.</li>\n<li>Avoid drying machines, which can weaken the fabric''s effectiveness.</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket Company on the right chest</li>\n<li>100% polyester / dri-fit</li>\n<li>180 GSM in weight</li>\n<li>Ribbed polo collar with&nbsp;3-button placket</li>\n<li>Tested and fitted for optimum performance in all playing conditions</li>\n</ul>', '<p>In-stock tees are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 2),
(244, 5, '0', 'Cover', '', '<p style="text-align: justify;">The Custom Cricket Company Cover tee is made from wicking dri-fit fabric. The trim at the front and back of the jersey is a trendy and stylish look. One of our more popular tees in the range.</p>', '1', '850', '22', '18', '20', '280', '22', '28', '', '4', '1', '3', '', '2', '8', NULL, NULL, NULL, NULL, NULL, 'Armour ', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color.</li>\n<li>Avoid drying machines, which can weaken the fabric''s effectiveness.</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket Company on the right chest</li>\n<li>100% polyester / dri-fit</li>\n<li>180 GSM in weight</li>\n<li>Ribbed polo collar with&nbsp;3-button placket</li>\n<li>Tested and fitted for optimum performance in all playing conditions</li>\n</ul>', '<p>In-stock tees are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 2),
(245, 5, '0', 'Cover', '', '<p style="text-align: justify;">The Custom Cricket Company Cover tee is made from wicking dri-fit fabric. The trim at the front and back of the jersey is a trendy and stylish look. One of our more popular tees in the range.</p>', '1', '850', '22', '18', '20', '280', '22', '28', '', '4', '1', '4', '', '2', '9', NULL, NULL, NULL, NULL, NULL, 'Armour ', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color.</li>\n<li>Avoid drying machines, which can weaken the fabric''s effectiveness.</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket Company on the right chest</li>\n<li>100% polyester / dri-fit</li>\n<li>180 GSM in weight</li>\n<li>Ribbed polo collar with&nbsp;3-button placket</li>\n<li>Tested and fitted for optimum performance in all playing conditions</li>\n</ul>', '<p>In-stock tees are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 2),
(246, 5, '2', 'Cover', '', '<p style="text-align: justify;">The Custom Cricket Company Cover tee is made from wicking dri-fit fabric. The trim at the front and back of the jersey is a trendy and stylish look. One of our more popular tees in the range.</p>', '1', '850', '22', '18', '20', '280', '22', '28', '', '4', '1', '13', '', '2', '10', NULL, NULL, NULL, NULL, NULL, 'Armour ', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color.</li>\n<li>Avoid drying machines, which can weaken the fabric''s effectiveness.</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket Company on the right chest</li>\n<li>100% polyester / dri-fit</li>\n<li>180 GSM in weight</li>\n<li>Ribbed polo collar with&nbsp;3-button placket</li>\n<li>Tested and fitted for optimum performance in all playing conditions</li>\n</ul>', '<p>In-stock tees are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 2),
(247, 5, '1', 'Gully', '', '<p style="text-align: justify;">The Custom Cricket Company Gully playing tee is made from plain wicking dri-fit fabric. This contemporary style is designed to give players more ventilation with the mesh fabric under the armhole and at the back allowing body heay to escape more easily. The subtle piping on the placket and on the sides adds to the syle quotient.</p>', '1', '850', '22', '18', '20', '280', '22', '28', '', '4', '1', '1', '', '2', '11', NULL, NULL, NULL, NULL, NULL, 'Modern HS', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket Company logo on the right chest</li>\n<li>100% polyester dri-fit</li>\n<li>180 GSM in weight</li>\n<li>Ribbed polo collar with&nbsp;3-button placket</li>\n<li>Tested and fitted for optimum performance for all playing conditions</li>\n</ul>', '<p>In-stock tees are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 3),
(248, 5, '0', 'Gully', '', '<p style="text-align: justify;">The Custom Cricket Company Gully playing tee is made from plain wicking dri-fit fabric. This contemporary style is designed to give players more ventilation with the mesh fabric under the armhole and at the back allowing body heat to escape more easily. The subtle piping on the placket and on the sides adds to the syle quotient.</p>', '1', '850', '22', '18', '20', '280', '22', '28', '', '4', '1', '2', '', '2', '12', NULL, NULL, NULL, NULL, NULL, 'Modern HS', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket Company logo on the right chest</li>\n<li>100% polyester dri-fit</li>\n<li>180 GSM in weight</li>\n<li>Ribbed polo collar with&nbsp;3-button placket</li>\n<li>Tested and fitted for optimum performance for all playing conditions</li>\n</ul>', '<p>In-stock tees are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 3),
(249, 5, '1', 'Gully', '', '<p style="text-align: justify;">The Custom Cricket Company Gully playing tee is made from plain wicking dri-fit fabric. This contemporary style is designed to give players more ventilation with the mesh fabric under the armhole and at the back allowing body heat to escape more easily. The subtle piping on the placket and on the sides adds to the syle quotient.</p>', '1', '850', '22', '18', '20', '280', '22', '28', '', '4', '1', '3', '', '2', '13', NULL, NULL, NULL, NULL, NULL, 'Modern HS', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket Company logo on the right chest</li>\n<li>100% polyester dri-fit</li>\n<li>180 GSM in weight</li>\n<li>Ribbed polo collar with&nbsp;3-button placket</li>\n<li>Tested and fitted for optimum performance for all playing conditions</li>\n</ul>', '<p>In-stock tees are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 3),
(250, 5, '1', 'Gully', '', '<p style="text-align: justify;">The Custom Cricket Company Gully playing tee is made from plain wicking dri-fit fabric. This contemporary style is designed to give players more ventilation with the mesh fabric under the armhole and at the back allowing body heat to escape more easily. The subtle piping on the placket and on the sides adds to the syle quotient.</p>', '1', '850', '22', '18', '20', '280', '22', '28', '', '4', '1', '4', '', '2', '14', NULL, NULL, NULL, NULL, NULL, 'Modern HS', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket Company logo on the right chest</li>\n<li>100% polyester dri-fit</li>\n<li>180 GSM in weight</li>\n<li>Ribbed polo collar with&nbsp;3-button placket</li>\n<li>Tested and fitted for optimum performance for all playing conditions</li>\n</ul>', '<p>In-stock tees are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 3);
INSERT INTO `fynx_product` (`id`, `subcategory`, `quantity`, `name`, `type`, `description`, `visibility`, `INR`, `USD`, `GBP`, `EUR`, `ZAF`, `AUD`, `NZD`, `relatedproduct`, `category`, `color`, `size`, `sizechart`, `status`, `sku`, `image1`, `image2`, `image3`, `image4`, `image5`, `baseproduct`, `discountINR`, `discountUSD`, `discountGBP`, `discountEUR`, `discountZAF`, `discountAUD`, `discountNZD`, `care`, `detail`, `delivery`, `categorycare`, `build`, `features`, `note`, `minimumquantity`, `order`) VALUES
(251, 5, '1', 'Gully', '', '<p style="text-align: justify;">The Custom Cricket Company Gully playing tee is made from plain wicking dri-fit fabric. This contemporary style is designed to give players more ventilation with the mesh fabric under the armhole and at the back allowing body heat to escape more easily. The subtle piping on the placket and on the sides adds to the syle quotient.</p>', '1', '850', '22', '18', '20', '280', '22', '28', '', '4', '1', '13', '', '2', '15', NULL, NULL, NULL, NULL, NULL, 'Modern HS', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket Company logo on the right chest</li>\n<li>100% polyester dri-fit</li>\n<li>180 GSM in weight</li>\n<li>Ribbed polo collar with&nbsp;3-button placket</li>\n<li>Tested and fitted for optimum performance for all playing conditions</li>\n</ul>', '<p>In-stock tees are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 3),
(252, 5, '0', 'First Slip', '', '<p style="text-align: justify;">The First Slip full sleeve traditional playing white tee is made from a comfortable polyester-cotton (PC) combination. PC now with better technology is a machine made fabric with wicking fabric weaved into base material. PC is slightly higher in weight, however is more durable than a pure cotton tee and this blend allows the fabric to stay soft and comfortable.</p>', '1', '850', '22', '18', '20', '280', '22', '28', '', '4', '1', '1', '', '2', '16', NULL, NULL, NULL, NULL, NULL, 'Tradional FS', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket Company logo on the right chest</li>\n<li>Long sleeves with ribbed cuffs</li>\n<li>40% polyester, 60% cotton</li>\n<li>180 GSM in weight</li>\n<li>Polo collar with a longer&nbsp;4-button placket</li>\n<li>30&rsquo;s thread count thickness</li>\n</ul>', '<p>In-stock tees are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 4),
(253, 5, '2', 'First Slip', '', '<p style="text-align: justify;">The First Slip full sleeve traditional playing white tee is made from a comfortable polyester-cotton (PC) combination. PC now with better technology is a machine made fabric with wicking fabric weaved into base material. PC is slightly higher in weight, however is more durable than a pure cotton tee and this blend allows the fabric to stay soft and comfortable.</p>', '1', '850', '22', '18', '20', '280', '22', '28', '', '4', '1', '2', '', '2', '17', NULL, NULL, NULL, NULL, NULL, 'Tradional FS', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket Company logo on the right chest</li>\n<li>Long sleeves with ribbed cuffs</li>\n<li>40% polyester, 60% cotton</li>\n<li>180 GSM in weight</li>\n<li>Polo collar with a longer&nbsp;4-button placket</li>\n<li>30&rsquo;s thread count thickness</li>\n</ul>', '<p>In-stock tees are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 4),
(254, 5, '2', 'First Slip', '', '<p style="text-align: justify;">The First Slip full sleeve traditional playing white tee is made from a comfortable polyester-cotton (PC) combination. PC now with better technology is a machine made fabric with wicking fabric weaved into base material. PC is slightly higher in weight, however is more durable than a pure cotton tee and this blend allows the fabric to stay soft and comfortable.</p>', '1', '850', '22', '18', '20', '280', '22', '28', '', '4', '1', '3', '', '2', '18', NULL, NULL, NULL, NULL, NULL, 'Tradional FS', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket Company logo on the right chest</li>\n<li>Long sleeves with ribbed cuffs</li>\n<li>40% polyester, 60% cotton</li>\n<li>180 GSM in weight</li>\n<li>Polo collar with a longer&nbsp;4-button placket</li>\n<li>30&rsquo;s thread count thickness</li>\n</ul>', '<p>In-stock tees are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 4),
(255, 5, '2', 'First Slip', '', '<p style="text-align: justify;">The First Slip full sleeve traditional playing white tee is made from a comfortable polyester-cotton (PC) combination. PC now with better technology is a machine made fabric with wicking fabric weaved into base material. PC is slightly higher in weight, however is more durable than a pure cotton tee and this blend allows the fabric to stay soft and comfortable.</p>', '1', '850', '22', '18', '20', '280', '22', '28', '', '4', '1', '4', '', '2', '19', NULL, NULL, NULL, NULL, NULL, 'Tradional FS', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket Company logo on the right chest</li>\n<li>Long sleeves with ribbed cuffs</li>\n<li>40% polyester, 60% cotton</li>\n<li>180 GSM in weight</li>\n<li>Polo collar with a longer&nbsp;4-button placket</li>\n<li>30&rsquo;s thread count thickness</li>\n</ul>', '<p>In-stock tees are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 4),
(256, 5, '2', 'First Slip', '', '<p style="text-align: justify;">The First Slip full sleeve traditional playing white tee is made from a comfortable polyester-cotton (PC) combination. PC now with better technology is a machine made fabric with wicking fabric weaved into base material. PC is slightly higher in weight, however is more durable than a pure cotton tee and this blend allows the fabric to stay soft and comfortable.</p>', '1', '850', '22', '18', '20', '280', '22', '28', '', '4', '1', '13', '', '2', '20', NULL, NULL, NULL, NULL, NULL, 'Tradional FS', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket Company logo on the right chest</li>\n<li>Long sleeves with ribbed cuffs</li>\n<li>40% polyester, 60% cotton</li>\n<li>180 GSM in weight</li>\n<li>Polo collar with a longer&nbsp;4-button placket</li>\n<li>30&rsquo;s thread count thickness</li>\n</ul>', '<p>In-stock tees are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 4),
(257, 5, '0', 'Second Slip', '', '<p style="text-align: justify;">The Second Slip full sleeve modern playing white tee is made from wicking dri-fit fabric. This contemporary style is designed to give players more ventilation with the mesh fabric under the armhole and at the back which allows the heat to pass more eaily. The long sleeves are a preference by many to shield against strong heat and aides diving fielders.</p>', '1', '850', '22', '18', '20', '280', '22', '28', '', '4', '1', '1', '', '2', '21', NULL, NULL, NULL, NULL, NULL, 'Modern FS', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket Company logo on the right chest</li>\n<li>Long sleeve with ribbed cuffs</li>\n<li>180 GSM in weight</li>\n<li>Ribbed polo collar with&nbsp;3-button placket</li>\n<li>Tested and fitted for optimum performance for all playing conditions</li>\n</ul>', '<p>In-stock tees are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 5),
(258, 5, '2', 'Second Slip', '', '<p style="text-align: justify;">The Second Slip full sleeve modern playing white tee is made from wicking dri-fit fabric. This contemporary style is designed to give players more ventilation with the mesh fabric under the armhole and at the back which allows the heat to pass more eaily. The long sleeves are a preference by many to shield against strong heat and aides diving fielders.</p>', '1', '850', '22', '18', '20', '280', '22', '28', '', '4', '1', '2', '', '2', '22', NULL, NULL, NULL, NULL, NULL, 'Modern FS', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket Company logo on the right chest</li>\n<li>Long sleeve with ribbed cuffs</li>\n<li>180 GSM in weight</li>\n<li>Ribbed polo collar with&nbsp;3-button placket</li>\n<li>Tested and fitted for optimum performance for all playing conditions</li>\n</ul>', '<p>In-stock tees are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 5),
(259, 5, '1', 'Second Slip', '', '<p style="text-align: justify;">The Second Slip full sleeve modern playing white tee is made from wicking dri-fit fabric. This contemporary style is designed to give players more ventilation with the mesh fabric under the armhole and at the back which allows the heat to pass more eaily. The long sleeves are a preference by many to shield against strong heat and aides diving fielders.</p>', '1', '850', '22', '18', '20', '280', '22', '28', '', '4', '1', '3', '', '2', '23', NULL, NULL, NULL, NULL, NULL, 'Modern FS', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket Company logo on the right chest</li>\n<li>Long sleeve with ribbed cuffs</li>\n<li>180 GSM in weight</li>\n<li>Ribbed polo collar with&nbsp;3-button placket</li>\n<li>Tested and fitted for optimum performance for all playing conditions</li>\n</ul>', '<p>In-stock tees are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 5),
(260, 5, '0', 'Second Slip', '', '<p style="text-align: justify;">The Second Slip full sleeve modern playing white tee is made from wicking dri-fit fabric. This contemporary style is designed to give players more ventilation with the mesh fabric under the armhole and at the back which allows the heat to pass more eaily. The long sleeves are a preference by many to shield against strong heat and aides diving fielders.</p>', '1', '850', '22', '18', '20', '280', '22', '28', '', '4', '1', '4', '', '2', '24', NULL, NULL, NULL, NULL, NULL, 'Modern FS', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket Company logo on the right chest</li>\n<li>Long sleeve with ribbed cuffs</li>\n<li>180 GSM in weight</li>\n<li>Ribbed polo collar with&nbsp;3-button placket</li>\n<li>Tested and fitted for optimum performance for all playing conditions</li>\n</ul>', '<p>In-stock tees are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 5),
(261, 5, '1', 'Second Slip', '', '<p style="text-align: justify;">The Second Slip full sleeve modern playing white tee is made from wicking dri-fit fabric. This contemporary style is designed to give players more ventilation with the mesh fabric under the armhole and at the back which allows the heat to pass more eaily. The long sleeves are a preference by many to shield against strong heat and aides diving fielders.</p>', '1', '850', '22', '18', '20', '280', '22', '28', '', '4', '1', '13', '', '2', '25', NULL, NULL, NULL, NULL, NULL, 'Modern FS', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket Company logo on the right chest</li>\n<li>Long sleeve with ribbed cuffs</li>\n<li>180 GSM in weight</li>\n<li>Ribbed polo collar with&nbsp;3-button placket</li>\n<li>Tested and fitted for optimum performance for all playing conditions</li>\n</ul>', '<p>In-stock tees are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 5),
(262, 5, '0', 'Long Leg', '', '<p style="text-align: justify;">The Custom Cricket Company Long Leg playing pants are made from premium quality polyester fabric designed for everyday comfort. The fabric gives a twill look. The fabric is made of double yarn hence making it heavier in weight and more durable for hardy playing conditions.</p>', '1', '850', '22', '19', '20', '280', '22', '28', '', '4', '1', '1', '', '2', '26', NULL, NULL, NULL, NULL, NULL, 'Tradtional P', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions&nbsp;</li>\n</ul>', '<p>In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 6),
(263, 5, '1', 'Long Leg', '', '<p style="text-align: justify;">The Custom Cricket Company Long Leg playing pants are made from premium quality polyester fabric designed for everyday comfort. The fabric gives a twill look. The fabric is made of double yarn hence making it heavier in weight and more durable for hardy playing conditions.</p>', '1', '850', '22', '19', '20', '280', '22', '28', '', '4', '1', '2', '', '2', '27', NULL, NULL, NULL, NULL, NULL, 'Tradtional P', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions&nbsp;</li>\n</ul>', '<p>In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 6),
(264, 5, '2', 'Long Leg', '', '<p style="text-align: justify;">The Custom Cricket Company Long Leg playing pants are made from premium quality polyester fabric designed for everyday comfort. The fabric gives a twill look. The fabric is made of double yarn hence making it heavier in weight and more durable for hardy playing conditions.</p>', '1', '850', '22', '19', '20', '280', '22', '28', '', '4', '1', '3', '', '2', '28', NULL, NULL, NULL, NULL, NULL, 'Tradtional P', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions&nbsp;</li>\n</ul>', '<p>In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 6),
(265, 5, '1', 'Long Leg', '', '<p style="text-align: justify;">The Custom Cricket Company Long Leg playing pants are made from premium quality polyester fabric designed for everyday comfort. The fabric gives a twill look. The fabric is made of double yarn hence making it heavier in weight and more durable for hardy playing conditions.</p>', '1', '850', '22', '19', '20', '280', '22', '28', '', '4', '1', '4', '', '2', '29', NULL, NULL, NULL, NULL, NULL, 'Tradtional P', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions&nbsp;</li>\n</ul>', '<p>In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 6),
(266, 5, '2', 'Long Leg', '', '<p style="text-align: justify;">The Custom Cricket Company Long Leg playing pants are made from premium quality polyester fabric designed for everyday comfort. The fabric gives a twill look. The fabric is made of double yarn hence making it heavier in weight and more durable for hardy playing conditions.</p>', '1', '850', '22', '19', '20', '280', '22', '28', '', '4', '1', '13', '', '2', '30', NULL, NULL, NULL, NULL, NULL, 'Tradtional P', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions&nbsp;</li>\n</ul>', '<p>In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 6),
(267, 5, '0', 'Square Leg', '', '<p style="text-align: justify;">The Custom Cricket Company Square Leg is a modern playing pant which is made from premium quality polyester fabric designed for regular usage. They have strategically positioned mesh panel for increased cooling and comfort on the sides of the thigh.</p>', '1', '850', '22', '19', '20', '280', '22', '28', '', '4', '1', '1', '', '2', '31', NULL, NULL, NULL, NULL, NULL, 'Modern P', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>190 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 7),
(268, 5, '0', 'Square Leg', '', '<p style="text-align: justify;">The Custom Cricket Company Square Leg is a modern playing pant which is made from premium quality polyester fabric designed for regular usage. They have strategically positioned mesh panel for increased cooling and comfort on the sides of the thigh.</p>', '1', '850', '22', '19', '20', '280', '22', '28', '', '4', '1', '2', '', '2', '32', NULL, NULL, NULL, NULL, NULL, 'Modern P', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>190 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 7),
(269, 5, '0', 'Square Leg', '', '<p style="text-align: justify;">The Custom Cricket Company Square Leg is a modern playing pant which is made from premium quality polyester fabric designed for regular usage. They have strategically positioned mesh panel for increased cooling and comfort on the sides of the thigh.</p>', '1', '850', '22', '19', '20', '280', '22', '28', '', '4', '1', '3', '', '2', '33', NULL, NULL, NULL, NULL, NULL, 'Modern P', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>190 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 7),
(270, 5, '0', 'Square Leg', '', '<p style="text-align: justify;">The Custom Cricket Company Square Leg is a modern playing pant which is made from premium quality polyester fabric designed for regular usage. They have strategically positioned mesh panel for increased cooling and comfort on the sides of the thigh.</p>', '1', '850', '22', '19', '20', '280', '22', '28', '', '4', '1', '4', '', '2', '34', NULL, NULL, NULL, NULL, NULL, 'Modern P', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>190 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 7),
(271, 5, '0', 'Square Leg', '', '<p style="text-align: justify;">The Custom Cricket Company Square Leg is a modern playing pant which is made from premium quality polyester fabric designed for regular usage. They have strategically positioned mesh panel for increased cooling and comfort on the sides of the thigh.</p>', '1', '850', '22', '19', '20', '280', '22', '28', '', '4', '1', '13', '', '2', '35', NULL, NULL, NULL, NULL, NULL, 'Modern P', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>190 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 7),
(272, 5, '0', 'Fine Leg', '', '<p style="text-align: justify;">The Custom Cricket Company Fine Leg playing pants are made from premium quality polyester fabric designed for regukar use. The black trim on the sides and at the back of the pant make it look stylish and sleek for the modern cricketer.</p>', '1', '850', '22', '19', '20', '280', '22', '28', '', '4', '1', '1', '', '2', '36', NULL, NULL, NULL, NULL, NULL, 'Shield', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>220 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 8),
(273, 5, '1', 'Fine Leg', '', '<p style="text-align: justify;">The Custom Cricket Company Fine Leg playing pants are made from premium quality polyester fabric designed for regukar use. The black trim on the sides and at the back of the pant make it look stylish and sleek for the modern cricketer.</p>', '1', '850', '22', '19', '20', '280', '22', '28', '', '4', '1', '2', '', '2', '37', NULL, NULL, NULL, NULL, NULL, 'Shield', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>220 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 8),
(274, 5, '2', 'Fine Leg', '', '<p style="text-align: justify;">The Custom Cricket Company Fine Leg playing pants are made from premium quality polyester fabric designed for regukar use. The black trim on the sides and at the back of the pant make it look stylish and sleek for the modern cricketer.</p>', '1', '850', '22', '19', '20', '280', '22', '28', '', '4', '1', '3', '', '2', '38', NULL, NULL, NULL, NULL, NULL, 'Shield', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>220 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 8),
(275, 5, '2', 'Fine Leg', '', '<p style="text-align: justify;">The Custom Cricket Company Fine Leg playing pants are made from premium quality polyester fabric designed for regukar use. The black trim on the sides and at the back of the pant make it look stylish and sleek for the modern cricketer.</p>', '1', '850', '22', '19', '20', '280', '22', '28', '', '4', '1', '4', '', '2', '39', NULL, NULL, NULL, NULL, NULL, 'Shield', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>220 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 8),
(276, 5, '1', 'Fine Leg', '', '<p style="text-align: justify;">The Custom Cricket Company Fine Leg playing pants are made from premium quality polyester fabric designed for regukar use. The black trim on the sides and at the back of the pant make it look stylish and sleek for the modern cricketer.</p>', '1', '850', '22', '19', '20', '280', '22', '28', '', '4', '1', '13', '', '2', '40', NULL, NULL, NULL, NULL, NULL, 'Shield', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>220 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 8),
(277, 5, '0', 'Sweater  Sleeveless', '', '<p style="text-align: justify;">The Custom Cricket Company traditional sweaters are made on 3 &frac12; guage knitting machines, hand cabled and hand finished with 100% acrylic. Acrylic is a light weight, soft and warm fabric with a wool like feel.</p>', '1', '1050', '25', '23', '32', '395', '32', '33', '', '4', '1', '1', '', '2', '41', NULL, NULL, NULL, NULL, NULL, 'Sweater SS', '', '', '', '', '', '', '', '<ul>\n<li>Wash in cool temperature range and with a short spin</li>\n<li>Do not bleach</li>\n<li>Do not iron, lay it flat to dry.</li>\n<li>Direct heat on acrylic makes the fabric brittle reducing the wear of the sweater</li>\n</ul>', '<ul>\n<li>100% acrylic</li>\n<li>Classic heavy cable knit</li>\n<li>Generously sized</li>\n<li>Trims come in various colours such a yellow, navy and maroon</li>\n</ul>', '<p>In-stock sweaters are shipped immediately. Customised orders are delivered 3-4 weeks from date of order.</p>', '', '', '', '', '', 9),
(278, 5, '0', 'Sweater  Sleeveless', '', '<p style="text-align: justify;">The Custom Cricket Company traditional sweaters are made on 3 &frac12; guage knitting machines, hand cabled and hand finished with 100% acrylic. Acrylic is a light weight, soft and warm fabric with a wool like feel.</p>', '1', '1050', '25', '23', '32', '395', '32', '33', '', '4', '1', '2', '', '2', '42', NULL, NULL, NULL, NULL, NULL, 'Sweater SS', '', '', '', '', '', '', '', '<ul>\n<li>Wash in cool temperature range and with a short spin</li>\n<li>Do not bleach</li>\n<li>Do not iron, lay it flat to dry.</li>\n<li>Direct heat on acrylic makes the fabric brittle reducing the wear of the sweater</li>\n</ul>', '<ul>\n<li>100% acrylic</li>\n<li>Classic heavy cable knit</li>\n<li>Generously sized</li>\n<li>Trims come in various colours such a yellow, navy and maroon</li>\n</ul>', '<p>In-stock sweaters are shipped immediately. Customised orders are delivered 3-4 weeks from date of order.</p>', '', '', '', '', '', 9),
(279, 5, '0', 'Sweater  Sleeveless', '', '<p style="text-align: justify;">The Custom Cricket Company traditional sweaters are made on 3 &frac12; guage knitting machines, hand cabled and hand finished with 100% acrylic. Acrylic is a light weight, soft and warm fabric with a wool like feel.</p>', '1', '1050', '25', '23', '32', '395', '32', '33', '', '4', '1', '3', '', '2', '43', NULL, NULL, NULL, NULL, NULL, 'Sweater SS', '', '', '', '', '', '', '', '<ul>\n<li>Wash in cool temperature range and with a short spin</li>\n<li>Do not bleach</li>\n<li>Do not iron, lay it flat to dry.</li>\n<li>Direct heat on acrylic makes the fabric brittle reducing the wear of the sweater</li>\n</ul>', '<ul>\n<li>100% acrylic</li>\n<li>Classic heavy cable knit</li>\n<li>Generously sized</li>\n<li>Trims come in various colours such a yellow, navy and maroon</li>\n</ul>', '<p>In-stock sweaters are shipped immediately. Customised orders are delivered 3-4 weeks from date of order.</p>', '', '', '', '', '', 9),
(280, 5, '0', 'Sweater  Sleeveless', '', '<p style="text-align: justify;">The Custom Cricket Company traditional sweaters are made on 3 &frac12; guage knitting machines, hand cabled and hand finished with 100% acrylic. Acrylic is a light weight, soft and warm fabric with a wool like feel.</p>', '1', '1050', '25', '23', '32', '395', '32', '33', '', '4', '1', '4', '', '2', '44', NULL, NULL, NULL, NULL, NULL, 'Sweater SS', '', '', '', '', '', '', '', '<ul>\n<li>Wash in cool temperature range and with a short spin</li>\n<li>Do not bleach</li>\n<li>Do not iron, lay it flat to dry.</li>\n<li>Direct heat on acrylic makes the fabric brittle reducing the wear of the sweater</li>\n</ul>', '<ul>\n<li>100% acrylic</li>\n<li>Classic heavy cable knit</li>\n<li>Generously sized</li>\n<li>Trims come in various colours such a yellow, navy and maroon</li>\n</ul>', '<p>In-stock sweaters are shipped immediately. Customised orders are delivered 3-4 weeks from date of order.</p>', '', '', '', '', '', 9),
(281, 5, '0', 'Sweater  Sleeveless', '', '<p style="text-align: justify;">The Custom Cricket Company traditional sweaters are made on 3 &frac12; guage knitting machines, hand cabled and hand finished with 100% acrylic. Acrylic is a light weight, soft and warm fabric with a wool like feel.</p>', '1', '1050', '25', '23', '32', '395', '32', '33', '', '4', '1', '13', '', '2', '45', NULL, NULL, NULL, NULL, NULL, 'Sweater SS', '', '', '', '', '', '', '', '<ul>\n<li>Wash in cool temperature range and with a short spin</li>\n<li>Do not bleach</li>\n<li>Do not iron, lay it flat to dry.</li>\n<li>Direct heat on acrylic makes the fabric brittle reducing the wear of the sweater</li>\n</ul>', '<ul>\n<li>100% acrylic</li>\n<li>Classic heavy cable knit</li>\n<li>Generously sized</li>\n<li>Trims come in various colours such a yellow, navy and maroon</li>\n</ul>', '<p>In-stock sweaters are shipped immediately. Customised orders are delivered 3-4 weeks from date of order.</p>', '', '', '', '', '', 9),
(282, 5, '0', 'Sweater Full Sleeve', '', '<p style="text-align: justify;">The Custom Cricket Company traditional sweaters are made on 3 &frac12; guage knitting machines, hand cabled and hand finished with 100% acrylic. Acrylic is a light weight, soft and warm fabric with a wool like feel.</p>', '1', '1050', '26', '25', '35', '395', '35', '33', '', '4', '1', '1', '', '2', '46', NULL, NULL, NULL, NULL, NULL, 'Sweater FS', '', '', '', '', '', '', '', '<ul>\n<li>Wash in cool temperature range and with a short spin</li>\n<li>Do not bleach</li>\n<li>Do not iron, lay it flat to dry.</li>\n<li>Direct heat on acrylic makes the fabric brittle reducing the wear of the sweater</li>\n</ul>', '<ul>\n<li>100% acrylic</li>\n<li>Classic heavy cable knit</li>\n<li>Generously sized</li>\n<li>Trims come in various colours such a yellow, navy and maroon</li>\n</ul>', '<p>In-stock sweaters are shipped immediately. Customised orders are delivered 3-4 weeks from date of order.</p>', '', '', '', '', '', 10),
(283, 5, '0', 'Sweater Full Sleeve', '', '<p style="text-align: justify;">The Custom Cricket Company traditional sweaters are made on 3 &frac12; guage knitting machines, hand cabled and hand finished with 100% acrylic. Acrylic is a light weight, soft and warm fabric with a wool like feel.</p>', '1', '1050', '26', '25', '35', '395', '35', '33', '', '4', '1', '2', '', '2', '47', NULL, NULL, NULL, NULL, NULL, 'Sweater FS', '', '', '', '', '', '', '', '<ul>\n<li>Wash in cool temperature range and with a short spin</li>\n<li>Do not bleach</li>\n<li>Do not iron, lay it flat to dry.</li>\n<li>Direct heat on acrylic makes the fabric brittle reducing the wear of the sweater</li>\n</ul>', '<ul>\n<li>100% acrylic</li>\n<li>Classic heavy cable knit</li>\n<li>Generously sized</li>\n<li>Trims come in various colours such a yellow, navy and maroon</li>\n</ul>', '<p>In-stock sweaters are shipped immediately. Customised orders are delivered 3-4 weeks from date of order.</p>', '', '', '', '', '', 10),
(284, 5, '0', 'Sweater Full Sleeve', '', '<p style="text-align: justify;">The Custom Cricket Company traditional sweaters are made on 3 &frac12; guage knitting machines, hand cabled and hand finished with 100% acrylic. Acrylic is a light weight, soft and warm fabric with a wool like feel.</p>', '1', '1050', '26', '25', '35', '395', '35', '33', '', '4', '1', '3', '', '2', '48', NULL, NULL, NULL, NULL, NULL, 'Sweater FS', '', '', '', '', '', '', '', '<ul>\n<li>Wash in cool temperature range and with a short spin</li>\n<li>Do not bleach</li>\n<li>Do not iron, lay it flat to dry.</li>\n<li>Direct heat on acrylic makes the fabric brittle reducing the wear of the sweater</li>\n</ul>', '<ul>\n<li>100% acrylic</li>\n<li>Classic heavy cable knit</li>\n<li>Generously sized</li>\n<li>Trims come in various colours such a yellow, navy and maroon</li>\n</ul>', '<p>In-stock sweaters are shipped immediately. Customised orders are delivered 3-4 weeks from date of order.</p>', '', '', '', '', '', 10),
(285, 5, '0', 'Sweater Full Sleeve', '', '<p style="text-align: justify;">The Custom Cricket Company traditional sweaters are made on 3 &frac12; guage knitting machines, hand cabled and hand finished with 100% acrylic. Acrylic is a light weight, soft and warm fabric with a wool like feel.</p>', '1', '1050', '26', '25', '35', '395', '35', '33', '', '4', '1', '4', '', '2', '49', NULL, NULL, NULL, NULL, NULL, 'Sweater FS', '', '', '', '', '', '', '', '<ul>\n<li>Wash in cool temperature range and with a short spin</li>\n<li>Do not bleach</li>\n<li>Do not iron, lay it flat to dry.</li>\n<li>Direct heat on acrylic makes the fabric brittle reducing the wear of the sweater</li>\n</ul>', '<ul>\n<li>100% acrylic</li>\n<li>Classic heavy cable knit</li>\n<li>Generously sized</li>\n<li>Trims come in various colours such a yellow, navy and maroon</li>\n</ul>', '<p>In-stock sweaters are shipped immediately. Customised orders are delivered 3-4 weeks from date of order.</p>', '', '', '', '', '', 10),
(286, 5, '0', 'Sweater Full Sleeve', '', '<p style="text-align: justify;">The Custom Cricket Company traditional sweaters are made on 3 &frac12; guage knitting machines, hand cabled and hand finished with 100% acrylic. Acrylic is a light weight, soft and warm fabric with a wool like feel.</p>', '1', '1050', '26', '25', '35', '395', '35', '33', '', '4', '1', '13', '', '2', '50', NULL, NULL, NULL, NULL, NULL, 'Sweater FS', '', '', '', '', '', '', '', '<ul>\n<li>Wash in cool temperature range and with a short spin</li>\n<li>Do not bleach</li>\n<li>Do not iron, lay it flat to dry.</li>\n<li>Direct heat on acrylic makes the fabric brittle reducing the wear of the sweater</li>\n</ul>', '<ul>\n<li>100% acrylic</li>\n<li>Classic heavy cable knit</li>\n<li>Generously sized</li>\n<li>Trims come in various colours such a yellow, navy and maroon</li>\n</ul>', '<p>In-stock sweaters are shipped immediately. Customised orders are delivered 3-4 weeks from date of order.</p>', '', '', '', '', '', 10),
(287, 5, '0', 'Point', '', '<p style="text-align: justify;">The Custom Cricket Company Point tee is a traditional style and made from wicking fabric that lifts moisture from your body. Tested and built to perform in warm and cold climate conditions. The trim on the verticle shoulder sides gives it a stylish and sporty look for cricketers of all ages.</p>', '1', '850', '22', '18', '20', '280', '22', '28', '', '4', '1', '14', '', '2', '242', NULL, NULL, NULL, NULL, NULL, 'Traditional HS', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket Company logo on the right chest</li>\n<li>100% soft polyester</li>\n<li>160 GSM in weight</li>\n<li>Polo ribbed collar with 3-button placket</li>\n<li>Tested and fitted for optimum performance for all playing conditions</li>\n</ul>', '<p>In-stock tees are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 1),
(288, 5, '0', 'Point', '', '<p style="text-align: justify;">The Custom Cricket Company Point tee is a traditional style and made from wicking fabric that lifts moisture from your body. Tested and built to perform in warm and cold climate conditions. The trim on the verticle shoulder sides gives it a stylish and sporty look for cricketers of all ages.</p>', '1', '850', '22', '18', '20', '280', '22', '28', '', '4', '1', '15', '', '2', '243', NULL, NULL, NULL, NULL, NULL, 'Traditional HS', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket Company logo on the right chest</li>\n<li>100% soft polyester</li>\n<li>160 GSM in weight</li>\n<li>Polo ribbed collar with 3-button placket</li>\n<li>Tested and fitted for optimum performance for all playing conditions</li>\n</ul>', '<p>In-stock tees are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 1),
(289, 5, '0', 'Cover', '', '<p style="text-align: justify;">The Custom Cricket Company Cover tee is made from wicking dri-fit fabric. The trim at the front and back of the jersey is a trendy and stylish look. One of our more popular tees in the range.</p>', '1', '850', '22', '18', '20', '280', '22', '28', '', '4', '1', '14', '', '2', '244', NULL, NULL, NULL, NULL, NULL, 'Armour ', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color.</li>\n<li>Avoid drying machines, which can weaken the fabric''s effectiveness.</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket Company on the right chest</li>\n<li>100% polyester / dri-fit</li>\n<li>180 GSM in weight</li>\n<li>Ribbed polo collar with&nbsp;3-button placket</li>\n<li>Tested and fitted for optimum performance in all playing conditions</li>\n</ul>', '<p>In-stock tees are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 2),
(290, 5, '0', 'Cover', '', '<p style="text-align: justify;">The Custom Cricket Company Cover tee is made from wicking dri-fit fabric. The trim at the front and back of the jersey is a trendy and stylish look. One of our more popular tees in the range.</p>', '1', '850', '22', '18', '20', '280', '22', '28', '', '4', '1', '15', '', '2', '245', NULL, NULL, NULL, NULL, NULL, 'Armour ', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other colored clothes to avoid bleeding of color.</li>\n<li>Avoid drying machines, which can weaken the fabric''s effectiveness.</li>\n<li>Steam iron</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket Company on the right chest</li>\n<li>100% polyester / dri-fit</li>\n<li>180 GSM in weight</li>\n<li>Ribbed polo collar with&nbsp;3-button placket</li>\n<li>Tested and fitted for optimum performance in all playing conditions</li>\n</ul>', '<p>In-stock tees are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 2),
(291, 5, '1', 'Gully', '', '<p style="text-align: justify;">The Custom Cricket Company Gully playing tee is made from plain wicking dri-fit fabric. This contemporary style is designed to give players more ventilation with the mesh fabric under the armhole and at the back allowing body heat to escape more easily. The subtle piping on the placket and on the sides adds to the syle quotient.</p>', '1', '850', '22', '18', '20', '280', '22', '28', '', '4', '1', '14', '', '2', '246', NULL, NULL, NULL, NULL, NULL, 'Modern HS', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket Company logo on the right chest</li>\n<li>100% polyester dri-fit</li>\n<li>180 GSM in weight</li>\n<li>Ribbed polo collar with&nbsp;3-button placket</li>\n<li>Tested and fitted for optimum performance for all playing conditions</li>\n</ul>', '<p>In-stock tees are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 3),
(292, 5, '1', 'Gully', '', '<p style="text-align: justify;">The Custom Cricket Company Gully playing tee is made from plain wicking dri-fit fabric. This contemporary style is designed to give players more ventilation with the mesh fabric under the armhole and at the back allowing body heat to escape more easily. The subtle piping on the placket and on the sides adds to the syle quotient.</p>', '1', '850', '22', '18', '20', '280', '22', '28', '', '4', '1', '15', '', '2', '247', NULL, NULL, NULL, NULL, NULL, 'Modern HS', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket Company logo on the right chest</li>\n<li>100% polyester dri-fit</li>\n<li>180 GSM in weight</li>\n<li>Ribbed polo collar with&nbsp;3-button placket</li>\n<li>Tested and fitted for optimum performance for all playing conditions</li>\n</ul>', '<p>In-stock tees are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 3),
(293, 5, '2', 'First Slip', '', '<p style="text-align: justify;">The First Slip full sleeve traditional playing white tee is made from a comfortable polyester-cotton (PC) combination. PC now with better technology is a machine made fabric with wicking fabric weaved into base material. PC is slightly higher in weight, however is more durable than a pure cotton tee and this blend allows the fabric to stay soft and comfortable.</p>', '1', '850', '22', '18', '20', '280', '22', '28', '', '4', '1', '14', '', '2', '248', NULL, NULL, NULL, NULL, NULL, 'Tradional FS', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket Company logo on the right chest</li>\n<li>Long sleeves with ribbed cuffs</li>\n<li>40% polyester, 60% cotton</li>\n<li>180 GSM in weight</li>\n<li>Polo collar with a longer&nbsp;4-button placket</li>\n<li>30&rsquo;s thread count thickness</li>\n</ul>', '<p>In-stock tees are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 4);
INSERT INTO `fynx_product` (`id`, `subcategory`, `quantity`, `name`, `type`, `description`, `visibility`, `INR`, `USD`, `GBP`, `EUR`, `ZAF`, `AUD`, `NZD`, `relatedproduct`, `category`, `color`, `size`, `sizechart`, `status`, `sku`, `image1`, `image2`, `image3`, `image4`, `image5`, `baseproduct`, `discountINR`, `discountUSD`, `discountGBP`, `discountEUR`, `discountZAF`, `discountAUD`, `discountNZD`, `care`, `detail`, `delivery`, `categorycare`, `build`, `features`, `note`, `minimumquantity`, `order`) VALUES
(294, 5, '2', 'First Slip', '', '<p style="text-align: justify;">The First Slip full sleeve traditional playing white tee is made from a comfortable polyester-cotton (PC) combination. PC now with better technology is a machine made fabric with wicking fabric weaved into base material. PC is slightly higher in weight, however is more durable than a pure cotton tee and this blend allows the fabric to stay soft and comfortable.</p>', '1', '850', '22', '18', '20', '280', '22', '28', '', '4', '1', '15', '', '2', '249', NULL, NULL, NULL, NULL, NULL, 'Tradional FS', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket Company logo on the right chest</li>\n<li>Long sleeves with ribbed cuffs</li>\n<li>40% polyester, 60% cotton</li>\n<li>180 GSM in weight</li>\n<li>Polo collar with a longer&nbsp;4-button placket</li>\n<li>30&rsquo;s thread count thickness</li>\n</ul>', '<p>In-stock tees are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 4),
(295, 5, '1', 'Second Slip', '', '<p style="text-align: justify;">The Second Slip full sleeve modern playing white tee is made from wicking dri-fit fabric. This contemporary style is designed to give players more ventilation with the mesh fabric under the armhole and at the back which allows the heat to pass more eaily. The long sleeves are a preference by many to shield against strong heat and aides diving fielders.</p>', '1', '850', '22', '18', '20', '280', '22', '28', '', '4', '1', '14', '', '2', '250', NULL, NULL, NULL, NULL, NULL, 'Modern FS', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket Company logo on the right chest</li>\n<li>Long sleeve with ribbed cuffs</li>\n<li>180 GSM in weight</li>\n<li>Ribbed polo collar with&nbsp;3-button placket</li>\n<li>Tested and fitted for optimum performance for all playing conditions</li>\n</ul>', '<p>In-stock tees are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 5),
(296, 5, '1', 'Second Slip', '', '<p style="text-align: justify;">The Second Slip full sleeve modern playing white tee is made from wicking dri-fit fabric. This contemporary style is designed to give players more ventilation with the mesh fabric under the armhole and at the back which allows the heat to pass more eaily. The long sleeves are a preference by many to shield against strong heat and aides diving fielders.</p>', '1', '850', '22', '18', '20', '280', '22', '28', '', '4', '1', '15', '', '2', '251', NULL, NULL, NULL, NULL, NULL, 'Modern FS', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket Company logo on the right chest</li>\n<li>Long sleeve with ribbed cuffs</li>\n<li>180 GSM in weight</li>\n<li>Ribbed polo collar with&nbsp;3-button placket</li>\n<li>Tested and fitted for optimum performance for all playing conditions</li>\n</ul>', '<p>In-stock tees are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 5),
(297, 5, '2', 'Long Leg', '', '<p style="text-align: justify;">The Custom Cricket Company Long Leg playing pants are made from premium quality polyester fabric designed for everyday comfort. The fabric gives a twill look. The fabric is made of double yarn hence making it heavier in weight and more durable for hardy playing conditions.</p>', '1', '850', '22', '19', '20', '280', '22', '28', '', '4', '1', '14', '', '2', '252', NULL, NULL, NULL, NULL, NULL, 'Tradtional P', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions&nbsp;</li>\n</ul>', '<p>In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 6),
(298, 5, '2', 'Long Leg', '', '<p style="text-align: justify;">The Custom Cricket Company Long Leg playing pants are made from premium quality polyester fabric designed for everyday comfort. The fabric gives a twill look. The fabric is made of double yarn hence making it heavier in weight and more durable for hardy playing conditions.</p>', '1', '850', '22', '19', '20', '280', '22', '28', '', '4', '1', '15', '', '2', '253', NULL, NULL, NULL, NULL, NULL, 'Tradtional P', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions&nbsp;</li>\n</ul>', '<p>In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 6),
(299, 5, '2', 'Long Leg', '', '<p style="text-align: justify;">The Custom Cricket Company Long Leg playing pants are made from premium quality polyester fabric designed for everyday comfort. The fabric gives a twill look. The fabric is made of double yarn hence making it heavier in weight and more durable for hardy playing conditions.</p>', '1', '850', '22', '19', '20', '280', '22', '28', '', '4', '1', '16', '', '2', '254', NULL, NULL, NULL, NULL, NULL, 'Tradtional P', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>200 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions&nbsp;</li>\n</ul>', '<p>In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 6),
(300, 5, '0', 'Square Leg', '', '<p style="text-align: justify;">The Custom Cricket Company Square Leg is a modern playing pant which is made from premium quality polyester fabric designed for regular usage. They have strategically positioned mesh panel for increased cooling and comfort on the sides of the thigh.</p>', '1', '850', '22', '19', '20', '280', '22', '28', '', '4', '1', '14', '', '2', '255', NULL, NULL, NULL, NULL, NULL, 'Modern P', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>190 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 7),
(301, 5, '0', 'Square Leg', '', '<p style="text-align: justify;">The Custom Cricket Company Square Leg is a modern playing pant which is made from premium quality polyester fabric designed for regular usage. They have strategically positioned mesh panel for increased cooling and comfort on the sides of the thigh.</p>', '1', '850', '22', '19', '20', '280', '22', '28', '', '4', '1', '15', '', '2', '256', NULL, NULL, NULL, NULL, NULL, 'Modern P', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>190 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 7),
(302, 5, '0', 'Square Leg', '', '<p style="text-align: justify;">The Custom Cricket Company Square Leg is a modern playing pant which is made from premium quality polyester fabric designed for regular usage. They have strategically positioned mesh panel for increased cooling and comfort on the sides of the thigh.</p>', '1', '850', '22', '19', '20', '280', '22', '28', '', '4', '1', '16', '', '2', '257', NULL, NULL, NULL, NULL, NULL, 'Modern P', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>190 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 7),
(303, 5, '1', 'Second Slip', '', '<p style="text-align: justify;">The Second Slip full sleeve modern playing white tee is made from wicking dri-fit fabric. This contemporary style is designed to give players more ventilation with the mesh fabric under the armhole and at the back which allows the heat to pass more eaily. The long sleeves are a preference by many to shield against strong heat and aides diving fielders.</p>', '1', '850', '22', '18', '20', '280', '22', '28', '', '4', '1', '14', '', '2', '258', NULL, NULL, NULL, NULL, NULL, 'Modern FS', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket Company logo on the right chest</li>\n<li>Long sleeve with ribbed cuffs</li>\n<li>180 GSM in weight</li>\n<li>Ribbed polo collar with&nbsp;3-button placket</li>\n<li>Tested and fitted for optimum performance for all playing conditions</li>\n</ul>', '<p>In-stock tees are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 5),
(304, 5, '1', 'Second Slip', '', '<p style="text-align: justify;">The Second Slip full sleeve modern playing white tee is made from wicking dri-fit fabric. This contemporary style is designed to give players more ventilation with the mesh fabric under the armhole and at the back which allows the heat to pass more eaily. The long sleeves are a preference by many to shield against strong heat and aides diving fielders.</p>', '1', '850', '22', '18', '20', '280', '22', '28', '', '4', '1', '15', '', '2', '259', NULL, NULL, NULL, NULL, NULL, 'Modern FS', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket Company logo on the right chest</li>\n<li>Long sleeve with ribbed cuffs</li>\n<li>180 GSM in weight</li>\n<li>Ribbed polo collar with&nbsp;3-button placket</li>\n<li>Tested and fitted for optimum performance for all playing conditions</li>\n</ul>', '<p>In-stock tees are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 5),
(305, 5, '1', 'Second Slip', '', '<p style="text-align: justify;">The Second Slip full sleeve modern playing white tee is made from wicking dri-fit fabric. This contemporary style is designed to give players more ventilation with the mesh fabric under the armhole and at the back which allows the heat to pass more eaily. The long sleeves are a preference by many to shield against strong heat and aides diving fielders.</p>', '1', '850', '22', '18', '20', '280', '22', '28', '', '4', '1', '16', '', '2', '260', NULL, NULL, NULL, NULL, NULL, 'Modern FS', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>It features the Custom Cricket Company logo on the right chest</li>\n<li>Long sleeve with ribbed cuffs</li>\n<li>180 GSM in weight</li>\n<li>Ribbed polo collar with&nbsp;3-button placket</li>\n<li>Tested and fitted for optimum performance for all playing conditions</li>\n</ul>', '<p>In-stock tees are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 5),
(306, 5, '0', 'Sweater  Sleeveless', '', '<p style="text-align: justify;">The Custom Cricket Company traditional sweaters are made on 3 &frac12; guage knitting machines, hand cabled and hand finished with 100% acrylic. Acrylic is a light weight, soft and warm fabric with a wool like feel.</p>', '1', '1050', '25', '23', '32', '395', '32', '33', '', '4', '1', '14', '', '2', '261', NULL, NULL, NULL, NULL, NULL, 'Sweater SS', '', '', '', '', '', '', '', '<ul>\n<li>Wash in cool temperature range and with a short spin</li>\n<li>Do not bleach</li>\n<li>Do not iron, lay it flat to dry.</li>\n<li>Direct heat on acrylic makes the fabric brittle reducing the wear of the sweater</li>\n</ul>', '<ul>\n<li>100% acrylic</li>\n<li>Classic heavy cable knit</li>\n<li>Generously sized</li>\n<li>Trims come in various colours such a yellow, navy and maroon</li>\n</ul>', '<p>In-stock sweaters are shipped immediately. Customised orders are delivered 3-4 weeks from date of order.</p>', '', '', '', '', '', 9),
(307, 5, '0', 'Sweater  Sleeveless', '', '<p style="text-align: justify;">The Custom Cricket Company traditional sweaters are made on 3 &frac12; guage knitting machines, hand cabled and hand finished with 100% acrylic. Acrylic is a light weight, soft and warm fabric with a wool like feel.</p>', '1', '1050', '25', '23', '32', '395', '32', '33', '', '4', '1', '15', '', '2', '262', NULL, NULL, NULL, NULL, NULL, 'Sweater SS', '', '', '', '', '', '', '', '<ul>\n<li>Wash in cool temperature range and with a short spin</li>\n<li>Do not bleach</li>\n<li>Do not iron, lay it flat to dry.</li>\n<li>Direct heat on acrylic makes the fabric brittle reducing the wear of the sweater</li>\n</ul>', '<ul>\n<li>100% acrylic</li>\n<li>Classic heavy cable knit</li>\n<li>Generously sized</li>\n<li>Trims come in various colours such a yellow, navy and maroon</li>\n</ul>', '<p>In-stock sweaters are shipped immediately. Customised orders are delivered 3-4 weeks from date of order.</p>', '', '', '', '', '', 9),
(308, 5, '0', 'Sweater  Sleeveless', '', '<p style="text-align: justify;">The Custom Cricket Company traditional sweaters are made on 3 &frac12; guage knitting machines, hand cabled and hand finished with 100% acrylic. Acrylic is a light weight, soft and warm fabric with a wool like feel.</p>', '1', '1050', '25', '23', '32', '395', '32', '33', '', '4', '1', '16', '', '2', '263', NULL, NULL, NULL, NULL, NULL, 'Sweater SS', '', '', '', '', '', '', '', '<ul>\n<li>Wash in cool temperature range and with a short spin</li>\n<li>Do not bleach</li>\n<li>Do not iron, lay it flat to dry.</li>\n<li>Direct heat on acrylic makes the fabric brittle reducing the wear of the sweater</li>\n</ul>', '<ul>\n<li>100% acrylic</li>\n<li>Classic heavy cable knit</li>\n<li>Generously sized</li>\n<li>Trims come in various colours such a yellow, navy and maroon</li>\n</ul>', '<p>In-stock sweaters are shipped immediately. Customised orders are delivered 3-4 weeks from date of order.</p>', '', '', '', '', '', 9),
(309, 5, '0', 'Sweater Full Sleeve', '', '<p style="text-align: justify;">The Custom Cricket Company traditional sweaters are made on 3 &frac12; guage knitting machines, hand cabled and hand finished with 100% acrylic. Acrylic is a light weight, soft and warm fabric with a wool like feel.</p>', '1', '1050', '26', '25', '35', '395', '35', '33', '', '4', '1', '14', '', '2', '264', NULL, NULL, NULL, NULL, NULL, 'Sweater FS', '', '', '', '', '', '', '', '<ul>\n<li>Wash in cool temperature range and with a short spin</li>\n<li>Do not bleach</li>\n<li>Do not iron, lay it flat to dry.</li>\n<li>Direct heat on acrylic makes the fabric brittle reducing the wear of the sweater</li>\n</ul>', '<ul>\n<li>100% acrylic</li>\n<li>Classic heavy cable knit</li>\n<li>Generously sized</li>\n<li>Trims come in various colours such a yellow, navy and maroon</li>\n</ul>', '<p>In-stock sweaters are shipped immediately. Customised orders are delivered 3-4 weeks from date of order.</p>', '', '', '', '', '', 10),
(310, 5, '0', 'Sweater Full Sleeve', '', '<p style="text-align: justify;">The Custom Cricket Company traditional sweaters are made on 3 &frac12; guage knitting machines, hand cabled and hand finished with 100% acrylic. Acrylic is a light weight, soft and warm fabric with a wool like feel.</p>', '1', '1050', '26', '25', '35', '395', '35', '33', '', '4', '1', '15', '', '2', '265', NULL, NULL, NULL, NULL, NULL, 'Sweater FS', '', '', '', '', '', '', '', '<ul>\n<li>Wash in cool temperature range and with a short spin</li>\n<li>Do not bleach</li>\n<li>Do not iron, lay it flat to dry.</li>\n<li>Direct heat on acrylic makes the fabric brittle reducing the wear of the sweater</li>\n</ul>', '<ul>\n<li>100% acrylic</li>\n<li>Classic heavy cable knit</li>\n<li>Generously sized</li>\n<li>Trims come in various colours such a yellow, navy and maroon</li>\n</ul>', '<p>In-stock sweaters are shipped immediately. Customised orders are delivered 3-4 weeks from date of order.</p>', '', '', '', '', '', 10),
(311, 5, '0', 'Sweater Full Sleeve', '', '<p style="text-align: justify;">The Custom Cricket Company traditional sweaters are made on 3 &frac12; guage knitting machines, hand cabled and hand finished with 100% acrylic. Acrylic is a light weight, soft and warm fabric with a wool like feel.</p>', '1', '1050', '26', '25', '35', '395', '35', '33', '', '4', '1', '16', '', '2', '266', NULL, NULL, NULL, NULL, NULL, 'Sweater FS', '', '', '', '', '', '', '', '<ul>\n<li>Wash in cool temperature range and with a short spin</li>\n<li>Do not bleach</li>\n<li>Do not iron, lay it flat to dry.</li>\n<li>Direct heat on acrylic makes the fabric brittle reducing the wear of the sweater</li>\n</ul>', '<ul>\n<li>100% acrylic</li>\n<li>Classic heavy cable knit</li>\n<li>Generously sized</li>\n<li>Trims come in various colours such a yellow, navy and maroon</li>\n</ul>', '<p>In-stock sweaters are shipped immediately. Customised orders are delivered 3-4 weeks from date of order.</p>', '', '', '', '', '', 10),
(312, 5, '2', 'Fine Leg', '', '<p style="text-align: justify;">The Custom Cricket Company Fine Leg playing pants are made from premium quality polyester fabric designed for regukar use. The black trim on the sides and at the back of the pant make it look stylish and sleek for the modern cricketer.</p>', '1', '850', '22', '19', '20', '280', '22', '28', '', '4', '1', '14', '', '2', '327', NULL, NULL, NULL, NULL, NULL, 'Shield', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>220 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 8),
(313, 5, '2', 'Fine Leg', '', '<p style="text-align: justify;">The Custom Cricket Company Fine Leg playing pants are made from premium quality polyester fabric designed for regukar use. The black trim on the sides and at the back of the pant make it look stylish and sleek for the modern cricketer.</p>', '1', '850', '22', '19', '20', '280', '22', '28', '', '4', '1', '15', '', '2', '328', NULL, NULL, NULL, NULL, NULL, 'Shield', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>220 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 8),
(314, 5, '2', 'Fine Leg', '', '<p style="text-align: justify;">The Custom Cricket Company Fine Leg playing pants are made from premium quality polyester fabric designed for regukar use. The black trim on the sides and at the back of the pant make it look stylish and sleek for the modern cricketer.</p>', '1', '850', '22', '19', '20', '280', '22', '28', '', '4', '1', '16', '', '2', '329', NULL, NULL, NULL, NULL, NULL, 'Shield', '', '', '', '', '', '', '', '<ul>\n<li>We recommend washing in cold water with powder detergent</li>\n<li>Do not wash with other coloured clothes to avoid bleeding and run-off</li>\n<li>Avoid drying machines which can weaken the fabric''s effectiveness</li>\n<li>Steam iron preferably</li>\n</ul>', '<ul>\n<li>100% polyester</li>\n<li>Drawstring elastic waistband with fly finished front</li>\n<li>220 GSM weight of fabric</li>\n<li>Tested and fitted for optimum performance in warm and cold conditions</li>\n</ul>', '<p>In-stock pants are shipped immediately. Customisation delivery worldwide takes 3-4 weeks from date of order.</p>', '', '', '', '', '', 8);

-- --------------------------------------------------------

--
-- Table structure for table `fynx_productimage`
--

CREATE TABLE IF NOT EXISTS `fynx_productimage` (
`id` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=995 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fynx_productimage`
--

INSERT INTO `fynx_productimage` (`id`, `product`, `order`, `image`, `status`) VALUES
(1, 1, 0, '134.jpg', '2'),
(2, 1, 0, '135.jpg', '2'),
(3, 1, 0, '136.jpg', '2'),
(4, 1, 0, '137.jpg', '2'),
(5, 2, 0, '87.jpg', '2'),
(6, 2, 0, '88.jpg', '2'),
(7, 2, 0, '89.jpg', '2'),
(8, 2, 0, '90.jpg', '2'),
(9, 3, 0, '91.jpg', '2'),
(10, 3, 0, '92.jpg', '2'),
(11, 4, 0, '93.jpg', '2'),
(12, 4, 0, '94.jpg', '2'),
(13, 4, 0, '95.jpg', '2'),
(14, 4, 0, '96.jpg', '2'),
(15, 5, 0, '93.jpg', '2'),
(16, 5, 0, '94.jpg', '2'),
(17, 5, 0, '95.jpg', '2'),
(18, 5, 0, '96.jpg', '2'),
(19, 6, 0, '93.jpg', '2'),
(20, 6, 0, '94.jpg', '2'),
(21, 6, 0, '95.jpg', '2'),
(22, 6, 0, '96.jpg', '2'),
(23, 7, 0, '233.jpg', '2'),
(24, 7, 0, '234.jpg', '2'),
(25, 7, 0, '235.jpg', '2'),
(26, 7, 0, '236.jpg', '2'),
(27, 8, 0, '237.jpg', '2'),
(28, 8, 0, '238.jpg', '2'),
(29, 8, 0, '239.jpg', '2'),
(30, 8, 0, '240.jpg', '2'),
(31, 9, 0, '241.jpg', '2'),
(32, 9, 0, '242.jpg', '2'),
(33, 9, 0, '243.jpg', '2'),
(34, 9, 0, '244.jpg', '2'),
(35, 10, 0, '245.jpg', '2'),
(36, 10, 0, '246.jpg', '2'),
(37, 10, 0, '247.jpg', '2'),
(38, 10, 0, '248.jpg', '2'),
(39, 11, 0, '112.jpg', '2'),
(40, 11, 0, '113.jpg', '2'),
(41, 11, 0, '114.jpg', '2'),
(42, 11, 0, '115.jpg', '2'),
(43, 12, 0, '112.jpg', '2'),
(44, 12, 0, '113.jpg', '2'),
(45, 12, 0, '114.jpg', '2'),
(46, 12, 0, '115.jpg', '2'),
(47, 13, 0, '116.jpg', '2'),
(48, 13, 0, '118.jpg', '2'),
(49, 13, 0, '119.jpg', '2'),
(50, 14, 0, '117.jpg', '2'),
(51, 14, 0, '118.jpg', '2'),
(52, 14, 0, '119.jpg', '2'),
(53, 15, 0, '120.jpg', '2'),
(54, 15, 0, '121.jpg', '2'),
(55, 15, 0, '122.jpg', '2'),
(56, 15, 0, '123.jpg', '2'),
(57, 16, 0, '120.jpg', '2'),
(58, 16, 0, '121.jpg', '2'),
(59, 16, 0, '122.jpg', '2'),
(60, 16, 0, '123.jpg', '2'),
(61, 17, 0, '201.jpg', '2'),
(62, 17, 0, '202.jpg', '2'),
(63, 17, 0, 'Bat_4.jpg', '2'),
(64, 17, 0, '204.jpg', '2'),
(65, 18, 0, '205.jpg', '2'),
(66, 18, 0, '206.jpg', '2'),
(67, 18, 0, 'Bat_31.jpg', '2'),
(68, 18, 0, '208.jpg', '2'),
(69, 19, 0, '209.jpg', '2'),
(70, 19, 0, '210.jpg', '2'),
(71, 19, 0, 'Bat_1.jpg', '2'),
(72, 19, 0, '212.jpg', '2'),
(73, 20, 0, '213.jpg', '2'),
(74, 20, 0, '214.jpg', '2'),
(75, 20, 0, 'Bat_3.jpg', '2'),
(76, 20, 0, '216.jpg', '2'),
(77, 21, 0, '124.jpg', '2'),
(78, 21, 0, '125.jpg', '2'),
(79, 21, 0, '126.jpg', '2'),
(80, 21, 0, '127.jpg', '2'),
(81, 21, 0, '128.jpg', '2'),
(82, 21, 0, '129.jpg', '2'),
(83, 21, 0, '130.jpg', '2'),
(84, 21, 0, '131.jpg', '2'),
(85, 21, 0, '132.jpg', '2'),
(86, 21, 0, '133.jpg', '2'),
(87, 22, 0, '177.jpg', '2'),
(88, 22, 0, '178.jpg', '2'),
(89, 22, 0, '179.jpg', '2'),
(90, 22, 0, '180.jpg', '2'),
(91, 22, 0, '181.jpg', '2'),
(92, 22, 0, '182.jpg', '2'),
(93, 22, 0, '183.jpg', '2'),
(94, 22, 0, '184.jpg', '2'),
(95, 23, 0, '217.jpg', '2'),
(96, 23, 0, '218.jpg', '2'),
(97, 23, 0, '219.jpg', '2'),
(98, 23, 0, '220.jpg', '2'),
(99, 24, 0, '221.jpg', '2'),
(100, 24, 0, '222.jpg', '2'),
(101, 24, 0, '223.jpg', '2'),
(102, 24, 0, '224.jpg', '2'),
(103, 25, 0, '225.jpg', '2'),
(104, 25, 0, '226.jpg', '2'),
(105, 25, 0, '227.jpg', '2'),
(106, 25, 0, '228.jpg', '2'),
(107, 26, 0, '229.jpg', '2'),
(108, 26, 0, '230.jpg', '2'),
(109, 26, 0, '231.jpg', '2'),
(110, 26, 0, '232.jpg', '2'),
(111, 27, 0, '151.jpg', '2'),
(112, 27, 0, '152.jpg', '2'),
(113, 27, 0, '153.jpg', '2'),
(114, 27, 0, '154.jpg', '2'),
(115, 28, 0, '151.jpg', '2'),
(116, 28, 0, '152.jpg', '2'),
(117, 28, 0, '153.jpg', '2'),
(118, 28, 0, '154.jpg', '2'),
(119, 29, 0, '151.jpg', '2'),
(120, 29, 0, '152.jpg', '2'),
(121, 29, 0, '153.jpg', '2'),
(122, 29, 0, '154.jpg', '2'),
(123, 30, 0, '151.jpg', '2'),
(124, 30, 0, '152.jpg', '2'),
(125, 30, 0, '153.jpg', '2'),
(126, 30, 0, '154.jpg', '2'),
(127, 31, 0, '151.jpg', '2'),
(128, 31, 0, '152.jpg', '2'),
(129, 31, 0, '153.jpg', '2'),
(130, 31, 0, '154.jpg', '2'),
(131, 32, 0, '155.jpg', '2'),
(132, 32, 0, '156.jpg', '2'),
(133, 32, 0, '157.jpg', '2'),
(134, 32, 0, '158.jpg', '2'),
(135, 33, 0, '155.jpg', '2'),
(136, 33, 0, '156.jpg', '2'),
(137, 33, 0, '157.jpg', '2'),
(138, 33, 0, '158.jpg', '2'),
(139, 34, 0, '155.jpg', '2'),
(140, 34, 0, '156.jpg', '2'),
(141, 34, 0, '157.jpg', '2'),
(142, 34, 0, '158.jpg', '2'),
(143, 35, 0, '155.jpg', '2'),
(144, 35, 0, '156.jpg', '2'),
(145, 35, 0, '157.jpg', '2'),
(146, 35, 0, '158.jpg', '2'),
(147, 36, 0, '155.jpg', '2'),
(148, 36, 0, '156.jpg', '2'),
(149, 36, 0, '157.jpg', '2'),
(150, 36, 0, '158.jpg', '2'),
(151, 37, 0, '159.jpg', '2'),
(152, 37, 0, '160.jpg', '2'),
(153, 37, 0, '161.jpg', '2'),
(154, 37, 0, '162.jpg', '2'),
(155, 38, 0, '159.jpg', '2'),
(156, 38, 0, '160.jpg', '2'),
(157, 38, 0, '161.jpg', '2'),
(158, 38, 0, '162.jpg', '2'),
(159, 39, 0, '159.jpg', '2'),
(160, 39, 0, '160.jpg', '2'),
(161, 39, 0, '161.jpg', '2'),
(162, 39, 0, '162.jpg', '2'),
(163, 40, 0, '159.jpg', '2'),
(164, 40, 0, '160.jpg', '2'),
(165, 40, 0, '161.jpg', '2'),
(166, 40, 0, '162.jpg', '2'),
(167, 41, 0, '159.jpg', '2'),
(168, 41, 0, '160.jpg', '2'),
(169, 41, 0, '161.jpg', '2'),
(170, 41, 0, '162.jpg', '2'),
(171, 42, 0, 'ODI1Front.jpg', '2'),
(172, 42, 0, 'ODI1Back.jpg', '2'),
(173, 43, 0, 'ODI1Front1.jpg', '2'),
(174, 43, 0, 'ODI1Back1.jpg', '2'),
(175, 44, 0, 'ODI1Front2.jpg', '2'),
(176, 44, 0, 'ODI1Back2.jpg', '2'),
(177, 45, 0, 'ODI1Front3.jpg', '2'),
(178, 45, 0, 'ODI1Back3.jpg', '2'),
(179, 46, 0, 'ODI1Front4.jpg', '2'),
(180, 46, 0, 'ODI1Back4.jpg', '2'),
(181, 47, 0, 'ODI2Front.jpg', '2'),
(182, 47, 0, 'ODI2Back.jpg', '2'),
(183, 48, 0, 'ODI2Front1.jpg', '2'),
(184, 48, 0, 'ODI2Back1.jpg', '2'),
(185, 49, 0, 'ODI2Front2.jpg', '2'),
(186, 49, 0, 'ODI2Back2.jpg', '2'),
(187, 50, 0, 'ODI2Front3.jpg', '2'),
(188, 50, 0, 'ODI2Back3.jpg', '2'),
(189, 51, 0, 'ODI2Front3.jpg', '2'),
(190, 51, 0, 'ODI2Back3.jpg', '2'),
(191, 52, 0, 'ODI3Front.jpg', '2'),
(192, 52, 0, 'ODI3Back.jpg', '2'),
(193, 53, 0, 'ODI3Front.jpg', '2'),
(194, 53, 0, 'ODI3Back.jpg', '2'),
(195, 54, 0, 'ODI3Front.jpg', '2'),
(196, 54, 0, 'ODI3Back.jpg', '2'),
(197, 55, 0, 'ODI3Front.jpg', '2'),
(198, 55, 0, 'ODI3Back.jpg', '2'),
(199, 56, 0, 'ODI3Front.jpg', '2'),
(200, 56, 0, 'ODI3Back.jpg', '2'),
(201, 57, 0, 'Floater_Front.jpg', '2'),
(202, 57, 0, 'Floater_Back.jpg', '2'),
(203, 58, 0, 'Floater_Front1.jpg', '2'),
(204, 58, 0, 'Floater_Back1.jpg', '2'),
(205, 59, 0, 'Floater_Front2.jpg', '2'),
(206, 59, 0, 'Floater_Back2.jpg', '2'),
(207, 60, 0, 'Floater_Front3.jpg', '2'),
(208, 60, 0, 'Floater_Back3.jpg', '2'),
(209, 61, 0, 'Floater_Front4.jpg', '2'),
(210, 61, 0, 'Floater_Back4.jpg', '2'),
(211, 62, 0, 'BR2.jpg', '2'),
(212, 62, 0, 'BR1.jpg', '2'),
(213, 62, 0, 'BR3.jpg', '2'),
(214, 63, 0, 'BR2.jpg', '2'),
(215, 63, 0, 'BR1.jpg', '2'),
(216, 63, 0, 'BR3.jpg', '2'),
(217, 64, 0, 'BR2.jpg', '2'),
(218, 64, 0, 'BR1.jpg', '2'),
(219, 64, 0, 'BR3.jpg', '2'),
(220, 65, 0, 'BR2.jpg', '2'),
(221, 65, 0, 'BR1.jpg', '2'),
(222, 65, 0, 'BR3.jpg', '2'),
(223, 66, 0, 'BR2.jpg', '2'),
(224, 66, 0, 'BR1.jpg', '2'),
(225, 66, 0, 'BR3.jpg', '2'),
(226, 67, 0, 'RY2-1.jpg', '2'),
(227, 67, 0, 'RY1.jpg', '2'),
(228, 67, 0, 'RY3-1.jpg', '2'),
(229, 68, 0, 'RY2-11.jpg', '2'),
(230, 68, 0, 'RY11.jpg', '2'),
(231, 68, 0, 'RY3-11.jpg', '2'),
(232, 69, 0, 'RY2-12.jpg', '2'),
(233, 69, 0, 'RY12.jpg', '2'),
(234, 69, 0, 'RY3-12.jpg', '2'),
(235, 70, 0, 'RY2-13.jpg', '2'),
(236, 70, 0, 'RY13.jpg', '2'),
(237, 70, 0, 'RY3-13.jpg', '2'),
(238, 71, 0, 'RY2-14.jpg', '2'),
(239, 71, 0, 'RY14.jpg', '2'),
(240, 71, 0, 'RY3-14.jpg', '2'),
(241, 72, 0, 'BG24.jpg', '2'),
(242, 72, 0, 'BG14.jpg', '2'),
(243, 72, 0, 'BG34.jpg', '2'),
(244, 73, 0, 'BG21.jpg', '2'),
(245, 73, 0, 'BG11.jpg', '2'),
(246, 73, 0, 'BG31.jpg', '2'),
(247, 74, 0, 'BG22.jpg', '2'),
(248, 74, 0, 'BG12.jpg', '2'),
(249, 74, 0, 'BG32.jpg', '2'),
(250, 75, 0, 'BG23.jpg', '2'),
(251, 75, 0, 'BG13.jpg', '2'),
(252, 75, 0, 'BG33.jpg', '2'),
(253, 76, 0, 'BG2.jpg', '2'),
(254, 76, 0, 'BG1.jpg', '2'),
(255, 76, 0, 'BG3.jpg', '2'),
(256, 77, 0, 'YG2.jpg', '2'),
(257, 77, 0, 'YG1.jpg', '2'),
(258, 77, 0, 'YG3.jpg', '2'),
(259, 78, 0, 'YG2.jpg', '2'),
(260, 78, 0, 'YG1.jpg', '2'),
(261, 78, 0, 'YG3.jpg', '2'),
(262, 79, 0, 'YG2.jpg', '2'),
(263, 79, 0, 'YG1.jpg', '2'),
(264, 79, 0, 'YG3.jpg', '2'),
(265, 80, 0, 'YG2.jpg', '2'),
(266, 80, 0, 'YG1.jpg', '2'),
(267, 80, 0, 'YG3.jpg', '2'),
(268, 81, 0, 'YG2.jpg', '2'),
(269, 81, 0, 'YG1.jpg', '2'),
(270, 81, 0, 'YG3.jpg', '2'),
(271, 82, 0, 'ODI1Front4.jpg', '2'),
(272, 82, 0, 'ODI1Back4.jpg', '2'),
(273, 83, 0, 'ODI1Front4.jpg', '2'),
(274, 83, 0, 'ODI1Back4.jpg', '2'),
(275, 84, 0, 'ODI2Front3.jpg', '2'),
(276, 84, 0, 'ODI2Back3.jpg', '2'),
(277, 85, 0, 'ODI2Front3.jpg', '2'),
(278, 85, 0, 'ODI2Back3.jpg', '2'),
(279, 86, 0, 'ODI3Front.jpg', '2'),
(280, 86, 0, 'ODI3Back.jpg', '2'),
(281, 87, 0, 'ODI3Front.jpg', '2'),
(282, 87, 0, 'ODI3Back.jpg', '2'),
(283, 88, 0, 'Floater_Front4.jpg', '2'),
(284, 88, 0, 'Floater_Back4.jpg', '2'),
(285, 89, 0, 'Floater_Front4.jpg', '2'),
(286, 89, 0, 'Floater_Back4.jpg', '2'),
(287, 90, 0, 'BR2.jpg', '2'),
(288, 90, 0, 'BR1.jpg', '2'),
(289, 90, 0, 'BR3.jpg', '2'),
(290, 91, 0, 'BR2.jpg', '2'),
(291, 91, 0, 'BR1.jpg', '2'),
(292, 91, 0, 'BR3.jpg', '2'),
(293, 92, 0, 'BR2.jpg', '2'),
(294, 92, 0, 'BR1.jpg', '2'),
(295, 92, 0, 'BR3.jpg', '2'),
(296, 93, 0, 'RY2-14.jpg', '2'),
(297, 93, 0, 'RY14.jpg', '2'),
(298, 93, 0, 'RY3-14.jpg', '2'),
(299, 94, 0, 'RY2-14.jpg', '2'),
(300, 94, 0, 'RY14.jpg', '2'),
(301, 94, 0, 'RY3-14.jpg', '2'),
(302, 95, 0, 'RY2-14.jpg', '2'),
(303, 95, 0, 'RY14.jpg', '2'),
(304, 95, 0, 'RY3-14.jpg', '2'),
(305, 96, 0, 'BG2.jpg', '2'),
(306, 96, 0, 'BG1.jpg', '2'),
(307, 96, 0, 'BG3.jpg', '2'),
(308, 97, 0, 'BG2.jpg', '2'),
(309, 97, 0, 'BG1.jpg', '2'),
(310, 97, 0, 'BG3.jpg', '2'),
(311, 98, 0, 'BG2.jpg', '2'),
(312, 98, 0, 'BG1.jpg', '2'),
(313, 98, 0, 'BG3.jpg', '2'),
(314, 99, 0, 'YG2.jpg', '2'),
(315, 99, 0, 'YG1.jpg', '2'),
(316, 99, 0, 'YG3.jpg', '2'),
(317, 100, 0, 'YG2.jpg', '2'),
(318, 100, 0, 'YG1.jpg', '2'),
(319, 100, 0, 'YG3.jpg', '2'),
(320, 101, 0, 'YG2.jpg', '2'),
(321, 101, 0, 'YG1.jpg', '2'),
(322, 101, 0, 'YG3.jpg', '2'),
(323, 102, 0, '1218.jpg', '2'),
(324, 102, 0, '1017.jpg', '2'),
(325, 102, 0, '918.jpg', '2'),
(326, 102, 0, 'criket-pad.jpg', '2'),
(327, 102, 0, '1118.jpg', '2'),
(328, 103, 0, '1219.jpg', '2'),
(329, 103, 0, '1018.jpg', '2'),
(330, 103, 0, '919.jpg', '2'),
(331, 103, 0, 'criket-pad1.jpg', '2'),
(332, 103, 0, '1119.jpg', '2'),
(333, 104, 0, '259.jpg', '2'),
(334, 104, 0, '620.jpg', '2'),
(335, 104, 0, 'criket-pad11.jpg', '2'),
(336, 104, 0, '105.jpg', '2'),
(337, 104, 0, '420.jpg', '2'),
(338, 105, 0, '260.jpg', '2'),
(339, 105, 0, '621.jpg', '2'),
(340, 105, 0, 'criket-pad12.jpg', '2'),
(341, 105, 0, '105.jpg', '2'),
(342, 105, 0, '421.jpg', '2'),
(343, 106, 0, '820.jpg', '2'),
(344, 106, 0, '622.jpg', '2'),
(345, 106, 0, 'criket-pad13.jpg', '2'),
(346, 106, 0, '520.jpg', '2'),
(347, 106, 0, '720.jpg', '2'),
(348, 107, 0, '821.jpg', '2'),
(349, 107, 0, '1019.jpg', '2'),
(350, 107, 0, 'criket-pad2.jpg', '2'),
(351, 107, 0, '521.jpg', '2'),
(352, 107, 0, '721.jpg', '2'),
(353, 108, 0, 'Pace-1-Front.jpg', '2'),
(354, 108, 0, 'Pace_1_Back.jpg', '2'),
(355, 109, 0, 'Pace-1-Front1.jpg', '2'),
(356, 109, 0, 'Pace_1_Back1.jpg', '2'),
(357, 110, 0, 'Pace-1-Front2.jpg', '2'),
(358, 110, 0, 'Pace_1_Back2.jpg', '2'),
(359, 111, 0, 'Pace-1-Front3.jpg', '2'),
(360, 111, 0, 'Pace_1_Back3.jpg', '2'),
(361, 112, 0, 'Pace-1-Front4.jpg', '2'),
(362, 112, 0, 'Pace_1_Back4.jpg', '2'),
(363, 113, 0, 'Pace-2-Front.jpg', '2'),
(364, 113, 0, 'Pace-2-Back.jpg', '2'),
(365, 114, 0, 'Pace-2-Front1.jpg', '2'),
(366, 114, 0, 'Pace-2-Back1.jpg', '2'),
(367, 115, 0, 'Pace-2-Front2.jpg', '2'),
(368, 115, 0, 'Pace-2-Back2.jpg', '2'),
(369, 116, 0, 'Pace-2-Front3.jpg', '2'),
(370, 116, 0, 'Pace-2-Back3.jpg', '2'),
(371, 117, 0, 'Pace-2-Front4.jpg', '2'),
(372, 117, 0, 'Pace-2-Back4.jpg', '2'),
(373, 118, 0, 'Shorts-Black2-25.jpg', '2'),
(374, 118, 0, 'Shorts-Black8.jpg', '2'),
(375, 118, 0, 'Shorts-Black3-2.jpg', '2'),
(376, 119, 0, 'Shorts-Black2-21.jpg', '2'),
(377, 119, 0, 'Shorts-Black4.jpg', '2'),
(378, 119, 0, 'Shorts-Black3-21.jpg', '2'),
(379, 120, 0, 'Shorts-Black2-22.jpg', '2'),
(380, 120, 0, 'Shorts-Black7.jpg', '2'),
(381, 120, 0, 'Shorts-Black3-22.jpg', '2'),
(382, 121, 0, 'Shorts-Black2-23.jpg', '2'),
(383, 121, 0, 'Shorts-Black5.jpg', '2'),
(384, 121, 0, 'Shorts-Black3-23.jpg', '2'),
(385, 122, 0, 'Shorts-Black2-24.jpg', '2'),
(386, 122, 0, 'Shorts-Black6.jpg', '2'),
(387, 122, 0, 'Shorts-Black3-24.jpg', '2'),
(388, 123, 0, 'Shorts-Orange2-25.jpg', '2'),
(389, 123, 0, 'Shorts-Orange21.jpg', '2'),
(390, 123, 0, 'Shorts-Orange3-24.jpg', '2'),
(391, 124, 0, 'Shorts-Orange2-24.jpg', '2'),
(392, 124, 0, 'Shorts-Orange.jpg', '2'),
(393, 124, 0, 'Shorts-Orange3-23.jpg', '2'),
(394, 125, 0, 'Shorts-Orange2-23.jpg', '2'),
(395, 125, 0, 'Shorts-Orange1.jpg', '2'),
(396, 125, 0, 'Shorts-Orange3-22.jpg', '2'),
(397, 126, 0, 'Shorts-Orange2-21.jpg', '2'),
(398, 126, 0, 'Shorts-Orange4.jpg', '2'),
(399, 126, 0, 'Shorts-Orange3-21.jpg', '2'),
(400, 127, 0, 'Shorts-Orange2-2.jpg', '2'),
(401, 127, 0, 'Shorts-Orange5.jpg', '2'),
(402, 127, 0, 'Shorts-Orange3-2.jpg', '2'),
(403, 128, 0, 'Shorts-Blue2-2.jpg', '2'),
(404, 128, 0, 'Shorts-Blue2.jpg', '2'),
(405, 128, 0, 'Shorts-Blue3-2.jpg', '2'),
(406, 129, 0, 'Shorts-Blue2-21.jpg', '2'),
(407, 129, 0, 'Shorts-Blue22.jpg', '2'),
(408, 129, 0, 'Shorts-Blue3-21.jpg', '2'),
(409, 130, 0, 'Shorts-Blue2-22.jpg', '2'),
(410, 130, 0, 'Shorts-Blue23.jpg', '2'),
(411, 130, 0, 'Shorts-Blue3-22.jpg', '2'),
(412, 131, 0, 'Shorts-Blue2-23.jpg', '2'),
(413, 131, 0, 'Shorts-Blue24.jpg', '2'),
(414, 131, 0, 'Shorts-Blue3-23.jpg', '2'),
(415, 132, 0, 'Shorts-Blue2-24.jpg', '2'),
(416, 132, 0, 'Shorts-Blue25.jpg', '2'),
(417, 132, 0, 'Shorts-Blue3-24.jpg', '2'),
(418, 133, 0, 'Pace-3-Front.jpg', '2'),
(419, 133, 0, 'Pace-3-Back.jpg', '2'),
(420, 134, 0, 'Pace-3-Front1.jpg', '2'),
(421, 134, 0, 'Pace-3-Back1.jpg', '2'),
(422, 135, 0, 'Pace-3-Front2.jpg', '2'),
(423, 135, 0, 'Pace-3-Back2.jpg', '2'),
(424, 136, 0, 'Pace-3-Front3.jpg', '2'),
(425, 136, 0, 'Pace-3-Back3.jpg', '2'),
(426, 137, 0, 'Pace-3-Front4.jpg', '2'),
(427, 137, 0, 'Pace-3-Back4.jpg', '2'),
(428, 138, 0, 'Pace-4-Front.jpg', '2'),
(429, 138, 0, 'Pace-4-Back.jpg', '2'),
(430, 139, 0, 'Pace-4-Front1.jpg', '2'),
(431, 139, 0, 'Pace-4-Back1.jpg', '2'),
(432, 140, 0, 'Pace-4-Front2.jpg', '2'),
(433, 140, 0, 'Pace-4-Back2.jpg', '2'),
(434, 141, 0, 'Pace-4-Front3.jpg', '2'),
(435, 141, 0, 'Pace-4-Back3.jpg', '2'),
(436, 142, 0, 'Pace-4-Front4.jpg', '2'),
(437, 142, 0, 'Pace-4-Back4.jpg', '2'),
(438, 143, 0, 'Pace-5-Front.jpg', '2'),
(439, 143, 0, 'Pace-5-Back.jpg', '2'),
(440, 144, 0, 'Pace-5-Front1.jpg', '2'),
(441, 144, 0, 'Pace-5-Back1.jpg', '2'),
(442, 145, 0, 'Pace-5-Front2.jpg', '2'),
(443, 145, 0, 'Pace-5-Back2.jpg', '2'),
(444, 146, 0, 'Pace-5-Front3.jpg', '2'),
(445, 146, 0, 'Pace-5-Back3.jpg', '2'),
(446, 147, 0, 'Pace-5-Front4.jpg', '2'),
(447, 147, 0, 'Pace-5-Back4.jpg', '2'),
(448, 148, 0, 'Runner_3.jpg', '2'),
(449, 148, 0, 'Runner_1.jpg', '2'),
(450, 148, 0, 'Runner_6.jpg', '2'),
(451, 149, 0, 'Runner_31.jpg', '2'),
(452, 149, 0, 'Runner_11.jpg', '2'),
(453, 149, 0, 'Runner_61.jpg', '2'),
(454, 150, 0, 'Runner_32.jpg', '2'),
(455, 150, 0, 'Runner_12.jpg', '2'),
(456, 150, 0, 'Runner_62.jpg', '2'),
(457, 151, 0, 'Runner_33.jpg', '2'),
(458, 151, 0, 'Runner_13.jpg', '2'),
(459, 151, 0, 'Runner_63.jpg', '2'),
(460, 152, 0, 'Runner_34.jpg', '2'),
(461, 152, 0, 'Runner_14.jpg', '2'),
(462, 152, 0, 'Runner_64.jpg', '2'),
(463, 153, 0, 'Slogger_3.jpg', '2'),
(464, 153, 0, 'Slogger_5.jpg', '2'),
(465, 153, 0, 'Slogger_1.jpg', '2'),
(466, 154, 0, 'Slogger_31.jpg', '2'),
(467, 154, 0, 'Slogger_51.jpg', '2'),
(468, 154, 0, 'Slogger_11.jpg', '2'),
(469, 155, 0, 'Slogger_32.jpg', '2'),
(470, 155, 0, 'Slogger_52.jpg', '2'),
(471, 155, 0, 'Slogger_12.jpg', '2'),
(472, 156, 0, 'Slogger_33.jpg', '2'),
(473, 156, 0, 'Slogger_53.jpg', '2'),
(474, 156, 0, 'Slogger_13.jpg', '2'),
(475, 157, 0, 'Slogger_34.jpg', '2'),
(476, 157, 0, 'Slogger_54.jpg', '2'),
(477, 157, 0, 'Slogger_14.jpg', '2'),
(478, 158, 0, 'Pace-1-Front4.jpg', '2'),
(479, 158, 0, 'Pace_1_Back4.jpg', '2'),
(480, 159, 0, 'Pace-1-Front4.jpg', '2'),
(481, 159, 0, 'Pace_1_Back4.jpg', '2'),
(482, 160, 0, 'Pace-2-Front4.jpg', '2'),
(483, 160, 0, 'Pace-2-Back4.jpg', '2'),
(484, 161, 0, 'Pace-2-Front4.jpg', '2'),
(485, 161, 0, 'Pace-2-Back4.jpg', '2'),
(486, 162, 0, 'Shorts-Black2-24.jpg', '2'),
(487, 162, 0, 'Shorts-Black6.jpg', '2'),
(488, 162, 0, 'Shorts-Black3-24.jpg', '2'),
(489, 163, 0, 'Shorts-Black2-24.jpg', '2'),
(490, 163, 0, 'Shorts-Black6.jpg', '2'),
(491, 163, 0, 'Shorts-Black3-24.jpg', '2'),
(492, 164, 0, 'Shorts-Black2-24.jpg', '2'),
(493, 164, 0, 'Shorts-Black6.jpg', '2'),
(494, 164, 0, 'Shorts-Black3-24.jpg', '2'),
(495, 165, 0, 'Shorts-Orange2-2.jpg', '2'),
(496, 165, 0, 'Shorts-Orange5.jpg', '2'),
(497, 165, 0, 'Shorts-Orange3-2.jpg', '2'),
(498, 166, 0, 'Shorts-Orange2-2.jpg', '2'),
(499, 166, 0, 'Shorts-Orange5.jpg', '2'),
(500, 166, 0, 'Shorts-Orange3-2.jpg', '2'),
(501, 167, 0, 'Shorts-Orange2-2.jpg', '2'),
(502, 167, 0, 'Shorts-Orange5.jpg', '2'),
(503, 167, 0, 'Shorts-Orange3-2.jpg', '2'),
(504, 168, 0, 'Shorts-Blue2-24.jpg', '2'),
(505, 168, 0, 'Shorts-Blue25.jpg', '2'),
(506, 168, 0, 'Shorts-Blue3-24.jpg', '2'),
(507, 169, 0, 'Shorts-Blue2-24.jpg', '2'),
(508, 169, 0, 'Shorts-Blue25.jpg', '2'),
(509, 169, 0, 'Shorts-Blue3-24.jpg', '2'),
(510, 170, 0, 'Shorts-Blue2-24.jpg', '2'),
(511, 170, 0, 'Shorts-Blue25.jpg', '2'),
(512, 170, 0, 'Shorts-Blue3-24.jpg', '2'),
(513, 171, 0, 'Pace-3-Front4.jpg', '2'),
(514, 171, 0, 'Pace-3-Back4.jpg', '2'),
(515, 172, 0, 'Pace-3-Front4.jpg', '2'),
(516, 172, 0, 'Pace-3-Back4.jpg', '2'),
(517, 173, 0, 'Pace-4-Front4.jpg', '2'),
(518, 173, 0, 'Pace-4-Back4.jpg', '2'),
(519, 174, 0, 'Pace-4-Front4.jpg', '2'),
(520, 174, 0, 'Pace-4-Back4.jpg', '2'),
(521, 175, 0, 'Pace-5-Front4.jpg', '2'),
(522, 175, 0, 'Pace-5-Back4.jpg', '2'),
(523, 176, 0, 'Pace-5-Front4.jpg', '2'),
(524, 176, 0, 'Pace-5-Back4.jpg', '2'),
(525, 177, 0, 'Runner_34.jpg', '2'),
(526, 177, 0, 'Runner_14.jpg', '2'),
(527, 177, 0, 'Runner_64.jpg', '2'),
(528, 178, 0, 'Runner_34.jpg', '2'),
(529, 178, 0, 'Runner_14.jpg', '2'),
(530, 178, 0, 'Runner_64.jpg', '2'),
(531, 179, 0, 'Runner_34.jpg', '2'),
(532, 179, 0, 'Runner_14.jpg', '2'),
(533, 179, 0, 'Runner_64.jpg', '2'),
(534, 180, 0, 'Slogger_34.jpg', '2'),
(535, 180, 0, 'Slogger_54.jpg', '2'),
(536, 180, 0, 'Slogger_14.jpg', '2'),
(537, 181, 0, 'Slogger_34.jpg', '2'),
(538, 181, 0, 'Slogger_54.jpg', '2'),
(539, 181, 0, 'Slogger_14.jpg', '2'),
(540, 182, 0, 'Slogger_34.jpg', '2'),
(541, 182, 0, 'Slogger_54.jpg', '2'),
(542, 182, 0, 'Slogger_14.jpg', '2'),
(543, 183, 0, '143.jpg', '2'),
(544, 183, 0, '415.jpg', '2'),
(545, 183, 0, '254.jpg', '2'),
(546, 183, 0, '315.jpg', '2'),
(547, 184, 0, '144.jpg', '2'),
(548, 184, 0, '416.jpg', '2'),
(549, 184, 0, '255.jpg', '2'),
(550, 184, 0, '316.jpg', '2'),
(551, 185, 0, '145.jpg', '2'),
(552, 185, 0, '417.jpg', '2'),
(553, 185, 0, '256.jpg', '2'),
(554, 185, 0, '317.jpg', '2'),
(555, 186, 0, '146.jpg', '2'),
(556, 186, 0, '418.jpg', '2'),
(557, 186, 0, '257.jpg', '2'),
(558, 186, 0, '318.jpg', '2'),
(559, 187, 0, '59.jpg', '2'),
(560, 187, 0, '419.jpg', '2'),
(561, 187, 0, '258.jpg', '2'),
(562, 187, 0, '319.jpg', '2'),
(563, 188, 0, '265.jpg', '2'),
(564, 188, 0, '425.jpg', '2'),
(565, 188, 0, '324.jpg', '2'),
(566, 188, 0, '1_(1).jpg', '2'),
(567, 189, 0, '266.jpg', '2'),
(568, 189, 0, '64.jpg', '2'),
(569, 189, 0, '426.jpg', '2'),
(570, 189, 0, '325.jpg', '2'),
(571, 190, 0, '268.jpg', '2'),
(572, 190, 0, '64.jpg', '2'),
(573, 190, 0, '428.jpg', '2'),
(574, 190, 0, '327.jpg', '2'),
(575, 191, 0, '63.jpg', '2'),
(576, 191, 0, '64.jpg', '2'),
(577, 191, 0, '65.jpg', '2'),
(578, 191, 0, '66.jpg', '2'),
(579, 192, 0, '269.jpg', '2'),
(580, 192, 0, '64.jpg', '2'),
(581, 192, 0, '429.jpg', '2'),
(582, 192, 0, '328.jpg', '2'),
(583, 193, 0, '67.jpg', '2'),
(584, 193, 0, '68.jpg', '2'),
(585, 193, 0, '69.jpg', '2'),
(586, 193, 0, '70.jpg', '2'),
(587, 194, 0, '67.jpg', '2'),
(588, 194, 0, '68.jpg', '2'),
(589, 194, 0, '69.jpg', '2'),
(590, 194, 0, '70.jpg', '2'),
(591, 195, 0, '67.jpg', '2'),
(592, 195, 0, '68.jpg', '2'),
(593, 195, 0, '69.jpg', '2'),
(594, 195, 0, '70.jpg', '2'),
(595, 196, 0, '67.jpg', '2'),
(596, 196, 0, '68.jpg', '2'),
(597, 196, 0, '69.jpg', '2'),
(598, 196, 0, '70.jpg', '2'),
(599, 197, 0, '67.jpg', '2'),
(600, 197, 0, '68.jpg', '2'),
(601, 197, 0, '69.jpg', '2'),
(602, 197, 0, '70.jpg', '2'),
(603, 198, 0, '71.jpg', '2'),
(604, 198, 0, '72.jpg', '2'),
(605, 198, 0, '73.jpg', '2'),
(606, 198, 0, '74.jpg', '2'),
(607, 199, 0, '71.jpg', '2'),
(608, 199, 0, '72.jpg', '2'),
(609, 199, 0, '73.jpg', '2'),
(610, 199, 0, '74.jpg', '2'),
(611, 200, 0, '71.jpg', '2'),
(612, 200, 0, '72.jpg', '2'),
(613, 200, 0, '73.jpg', '2'),
(614, 200, 0, '74.jpg', '2'),
(615, 201, 0, '71.jpg', '2'),
(616, 201, 0, '72.jpg', '2'),
(617, 201, 0, '73.jpg', '2'),
(618, 201, 0, '74.jpg', '2'),
(619, 202, 0, '71.jpg', '2'),
(620, 202, 0, '72.jpg', '2'),
(621, 202, 0, '73.jpg', '2'),
(622, 202, 0, '74.jpg', '2'),
(623, 203, 0, '75.jpg', '2'),
(624, 203, 0, '76.jpg', '2'),
(625, 203, 0, '77.jpg', '2'),
(626, 203, 0, '78.jpg', '2'),
(627, 204, 0, '75.jpg', '2'),
(628, 204, 0, '76.jpg', '2'),
(629, 204, 0, '77.jpg', '2'),
(630, 204, 0, '78.jpg', '2'),
(631, 205, 0, '75.jpg', '2'),
(632, 205, 0, '76.jpg', '2'),
(633, 205, 0, '77.jpg', '2'),
(634, 205, 0, '78.jpg', '2'),
(635, 206, 0, '75.jpg', '2'),
(636, 206, 0, '76.jpg', '2'),
(637, 206, 0, '77.jpg', '2'),
(638, 206, 0, '78.jpg', '2'),
(639, 207, 0, '75.jpg', '2'),
(640, 207, 0, '76.jpg', '2'),
(641, 207, 0, '77.jpg', '2'),
(642, 207, 0, '78.jpg', '2'),
(643, 208, 0, '914.jpg', '2'),
(644, 208, 0, '1214.jpg', '2'),
(645, 208, 0, '1013.jpg', '2'),
(646, 208, 0, '1114.jpg', '2'),
(647, 209, 0, '915.jpg', '2'),
(648, 209, 0, '1215.jpg', '2'),
(649, 209, 0, '1014.jpg', '2'),
(650, 209, 0, '1115.jpg', '2'),
(651, 210, 0, '916.jpg', '2'),
(652, 210, 0, '1216.jpg', '2'),
(653, 210, 0, '1015.jpg', '2'),
(654, 210, 0, '1116.jpg', '2'),
(655, 211, 0, '917.jpg', '2'),
(656, 211, 0, '1217.jpg', '2'),
(657, 211, 0, '1016.jpg', '2'),
(658, 211, 0, '1117.jpg', '2'),
(659, 212, 0, '79.jpg', '2'),
(660, 212, 0, '80.jpg', '2'),
(661, 212, 0, '81.jpg', '2'),
(662, 212, 0, '82.jpg', '2'),
(663, 213, 0, '515.jpg', '2'),
(664, 213, 0, '815.jpg', '2'),
(665, 213, 0, '615.jpg', '2'),
(666, 213, 0, '715.jpg', '2'),
(667, 214, 0, '516.jpg', '2'),
(668, 214, 0, '816.jpg', '2'),
(669, 214, 0, '616.jpg', '2'),
(670, 214, 0, '716.jpg', '2'),
(671, 215, 0, '517.jpg', '2'),
(672, 215, 0, '817.jpg', '2'),
(673, 215, 0, '617.jpg', '2'),
(674, 215, 0, '717.jpg', '2'),
(675, 216, 0, '518.jpg', '2'),
(676, 216, 0, '818.jpg', '2'),
(677, 216, 0, '618.jpg', '2'),
(678, 216, 0, '718.jpg', '2'),
(679, 217, 0, '519.jpg', '2'),
(680, 217, 0, '819.jpg', '2'),
(681, 217, 0, '619.jpg', '2'),
(682, 217, 0, '719.jpg', '2'),
(683, 218, 0, '59.jpg', '2'),
(684, 218, 0, '419.jpg', '2'),
(685, 218, 0, '258.jpg', '2'),
(686, 218, 0, '319.jpg', '2'),
(687, 219, 0, '59.jpg', '2'),
(688, 219, 0, '419.jpg', '2'),
(689, 219, 0, '258.jpg', '2'),
(690, 219, 0, '319.jpg', '2'),
(691, 220, 0, '269.jpg', '2'),
(692, 220, 0, '64.jpg', '2'),
(693, 220, 0, '429.jpg', '2'),
(694, 220, 0, '328.jpg', '2'),
(695, 221, 0, '269.jpg', '2'),
(696, 221, 0, '64.jpg', '2'),
(697, 221, 0, '429.jpg', '2'),
(698, 221, 0, '328.jpg', '2'),
(699, 222, 0, '269.jpg', '2'),
(700, 222, 0, '64.jpg', '2'),
(701, 222, 0, '429.jpg', '2'),
(702, 222, 0, '328.jpg', '2'),
(703, 223, 0, '67.jpg', '2'),
(704, 223, 0, '68.jpg', '2'),
(705, 223, 0, '69.jpg', '2'),
(706, 223, 0, '70.jpg', '2'),
(707, 224, 0, '67.jpg', '2'),
(708, 224, 0, '68.jpg', '2'),
(709, 224, 0, '69.jpg', '2'),
(710, 224, 0, '70.jpg', '2'),
(711, 225, 0, '71.jpg', '2'),
(712, 225, 0, '72.jpg', '2'),
(713, 225, 0, '73.jpg', '2'),
(714, 225, 0, '74.jpg', '2'),
(715, 226, 0, '71.jpg', '2'),
(716, 226, 0, '72.jpg', '2'),
(717, 226, 0, '73.jpg', '2'),
(718, 226, 0, '74.jpg', '2'),
(719, 227, 0, '75.jpg', '2'),
(720, 227, 0, '76.jpg', '2'),
(721, 227, 0, '77.jpg', '2'),
(722, 227, 0, '78.jpg', '2'),
(723, 228, 0, '75.jpg', '2'),
(724, 228, 0, '76.jpg', '2'),
(725, 228, 0, '77.jpg', '2'),
(726, 228, 0, '78.jpg', '2'),
(727, 229, 0, '79.jpg', '2'),
(728, 229, 0, '80.jpg', '2'),
(729, 229, 0, '81.jpg', '2'),
(730, 229, 0, '82.jpg', '2'),
(731, 230, 0, '79.jpg', '2'),
(732, 230, 0, '80.jpg', '2'),
(733, 230, 0, '81.jpg', '2'),
(734, 230, 0, '82.jpg', '2'),
(735, 231, 0, '519.jpg', '2'),
(736, 231, 0, '819.jpg', '2'),
(737, 231, 0, '619.jpg', '2'),
(738, 231, 0, '719.jpg', '2'),
(739, 232, 0, '519.jpg', '2'),
(740, 232, 0, '819.jpg', '2'),
(741, 232, 0, '619.jpg', '2'),
(742, 232, 0, '719.jpg', '2'),
(743, 233, 0, '185.jpg', '2'),
(744, 233, 0, '186.jpg', '2'),
(745, 233, 0, '187.jpg', '2'),
(746, 233, 0, '188.jpg', '2'),
(747, 234, 0, '189.jpg', '2'),
(748, 234, 0, '190.jpg', '2'),
(749, 234, 0, '191.jpg', '2'),
(750, 234, 0, '192.jpg', '2'),
(751, 235, 0, '193.jpg', '2'),
(752, 235, 0, '194.jpg', '2'),
(753, 235, 0, '195.jpg', '2'),
(754, 235, 0, '196.jpg', '2'),
(755, 236, 0, '197.jpg', '2'),
(756, 236, 0, '198.jpg', '2'),
(757, 236, 0, '199.jpg', '2'),
(758, 236, 0, '200.jpg', '2'),
(759, 237, 0, 'Point_F.jpg', '2'),
(760, 237, 0, 'Point_B.jpg', '2'),
(761, 238, 0, 'Point_F1.jpg', '2'),
(762, 238, 0, 'Point_B1.jpg', '2'),
(763, 239, 0, 'Point_F2.jpg', '2'),
(764, 239, 0, 'Point_B2.jpg', '2'),
(765, 240, 0, 'Point_F3.jpg', '2'),
(766, 240, 0, 'Point_B3.jpg', '2'),
(767, 241, 0, 'Point_F4.jpg', '2'),
(768, 241, 0, 'Point_B4.jpg', '2'),
(769, 242, 0, 'Cover_F.jpg', '2'),
(770, 242, 0, 'Cover_B.jpg', '2'),
(771, 243, 0, 'Cover_F1.jpg', '2'),
(772, 243, 0, 'Cover_B1.jpg', '2'),
(773, 244, 0, 'Cover_F2.jpg', '2'),
(774, 244, 0, 'Cover_B2.jpg', '2'),
(775, 245, 0, 'Cover_F3.jpg', '2'),
(776, 245, 0, '6.jpg', '2'),
(777, 246, 0, 'Cover_F4.jpg', '2'),
(778, 246, 0, 'Cover_B3.jpg', '2'),
(779, 247, 0, 'Gully_F.jpg', '2'),
(780, 247, 0, 'Gully_B.jpg', '2'),
(781, 248, 0, 'Gully_F1.jpg', '2'),
(782, 248, 0, 'Gully_B1.jpg', '2'),
(783, 249, 0, 'Gully_F2.jpg', '2'),
(784, 249, 0, 'Gully_B2.jpg', '2'),
(785, 250, 0, 'Gully_F3.jpg', '2'),
(786, 250, 0, 'Gully_B3.jpg', '2'),
(787, 251, 0, 'Gully_F4.jpg', '2'),
(788, 251, 0, 'Gully_B4.jpg', '2'),
(789, 252, 0, 'White-Front-12.jpg', '2'),
(790, 252, 0, 'White-Back-1.jpg', '2'),
(791, 253, 0, 'First_Slip_F.jpg', '2'),
(792, 253, 0, 'First_Slip_B.jpg', '2'),
(793, 254, 0, 'First_Slip_F1.jpg', '2'),
(794, 254, 0, 'First_Slip_B1.jpg', '2'),
(795, 255, 0, 'First_Slip_F2.jpg', '2'),
(796, 255, 0, 'First_Slip_B2.jpg', '2'),
(797, 256, 0, 'First_Slip_F3.jpg', '2'),
(798, 256, 0, 'First_Slip_B3.jpg', '2'),
(799, 257, 0, 'Second_Slip_F4.jpg', '2'),
(800, 257, 0, 'Second_Slip_B5.jpg', '2'),
(801, 258, 0, 'Second_Slip_F1.jpg', '2'),
(802, 258, 0, 'Second_Slip_B1.jpg', '2'),
(803, 259, 0, 'Second_Slip_F2.jpg', '2'),
(804, 259, 0, 'Second_Slip_B2.jpg', '2'),
(805, 260, 0, 'Second_Slip_F3.jpg', '2'),
(806, 260, 0, 'Second_Slip_B4.jpg', '2'),
(807, 261, 0, 'Second_Slip_F.jpg', '2'),
(808, 261, 0, 'Second_Slip_B3.jpg', '2'),
(809, 262, 0, '810.jpg', '2'),
(810, 262, 0, '510.jpg', '2'),
(811, 262, 0, '710.jpg', '2'),
(812, 262, 0, '610.jpg', '2'),
(813, 263, 0, '811.jpg', '2'),
(814, 263, 0, '511.jpg', '2'),
(815, 263, 0, '711.jpg', '2'),
(816, 263, 0, '611.jpg', '2'),
(817, 264, 0, '812.jpg', '2'),
(818, 264, 0, '512.jpg', '2'),
(819, 264, 0, '712.jpg', '2'),
(820, 264, 0, '612.jpg', '2'),
(821, 265, 0, '813.jpg', '2'),
(822, 265, 0, '513.jpg', '2'),
(823, 265, 0, '713.jpg', '2'),
(824, 265, 0, '613.jpg', '2'),
(825, 266, 0, '814.jpg', '2'),
(826, 266, 0, '514.jpg', '2'),
(827, 266, 0, '714.jpg', '2'),
(828, 266, 0, '614.jpg', '2'),
(829, 267, 0, '410.jpg', '2'),
(830, 267, 0, '138.jpg', '2'),
(831, 267, 0, '310.jpg', '2'),
(832, 267, 0, '249.jpg', '2'),
(833, 268, 0, '411.jpg', '2'),
(834, 268, 0, '139.jpg', '2'),
(835, 268, 0, '311.jpg', '2'),
(836, 268, 0, '250.jpg', '2'),
(837, 269, 0, '412.jpg', '2'),
(838, 269, 0, '140.jpg', '2'),
(839, 269, 0, '312.jpg', '2'),
(840, 269, 0, '251.jpg', '2'),
(841, 270, 0, '413.jpg', '2'),
(842, 270, 0, '141.jpg', '2'),
(843, 270, 0, '313.jpg', '2'),
(844, 270, 0, '252.jpg', '2'),
(845, 271, 0, '414.jpg', '2'),
(846, 271, 0, '142.jpg', '2'),
(847, 271, 0, '314.jpg', '2'),
(848, 271, 0, '253.jpg', '2'),
(849, 272, 0, '1210.jpg', '2'),
(850, 272, 0, '910.jpg', '2'),
(851, 272, 0, '1110.jpg', '2'),
(852, 272, 0, '10.jpg', '2'),
(853, 273, 0, '1211.jpg', '2'),
(854, 273, 0, '911.jpg', '2'),
(855, 273, 0, '1111.jpg', '2'),
(856, 273, 0, '1010.jpg', '2'),
(857, 274, 0, '1212.jpg', '2'),
(858, 274, 0, '912.jpg', '2'),
(859, 274, 0, '1112.jpg', '2'),
(860, 274, 0, '1011.jpg', '2'),
(861, 275, 0, '1213.jpg', '2'),
(862, 275, 0, '913.jpg', '2'),
(863, 275, 0, '1113.jpg', '2'),
(864, 275, 0, '1012.jpg', '2'),
(865, 276, 0, '29.jpg', '2'),
(866, 276, 0, '30.jpg', '2'),
(867, 276, 0, '31.jpg', '2'),
(868, 276, 0, '32.jpg', '2'),
(869, 277, 0, '33.jpg', '2'),
(870, 277, 0, '34.jpg', '2'),
(871, 277, 0, '35.jpg', '2'),
(872, 277, 0, '36.jpg', '2'),
(873, 278, 0, '33.jpg', '2'),
(874, 278, 0, '34.jpg', '2'),
(875, 278, 0, '35.jpg', '2'),
(876, 278, 0, '36.jpg', '2'),
(877, 279, 0, '33.jpg', '2'),
(878, 279, 0, '34.jpg', '2'),
(879, 279, 0, '35.jpg', '2'),
(880, 279, 0, '36.jpg', '2'),
(881, 280, 0, '33.jpg', '2'),
(882, 280, 0, '34.jpg', '2'),
(883, 280, 0, '35.jpg', '2'),
(884, 280, 0, '36.jpg', '2'),
(885, 281, 0, '33.jpg', '2'),
(886, 281, 0, '34.jpg', '2'),
(887, 281, 0, '35.jpg', '2'),
(888, 281, 0, '36.jpg', '2'),
(889, 282, 0, '37.jpg', '2'),
(890, 282, 0, '38.jpg', '2'),
(891, 282, 0, '39.jpg', '2'),
(892, 282, 0, '40.jpg', '2'),
(893, 283, 0, '37.jpg', '2'),
(894, 283, 0, '38.jpg', '2'),
(895, 283, 0, '39.jpg', '2'),
(896, 283, 0, '40.jpg', '2'),
(897, 284, 0, '37.jpg', '2'),
(898, 284, 0, '38.jpg', '2'),
(899, 284, 0, '39.jpg', '2'),
(900, 284, 0, '40.jpg', '2'),
(901, 285, 0, '37.jpg', '2'),
(902, 285, 0, '38.jpg', '2'),
(903, 285, 0, '39.jpg', '2'),
(904, 285, 0, '40.jpg', '2'),
(905, 286, 0, '37.jpg', '2'),
(906, 286, 0, '38.jpg', '2'),
(907, 286, 0, '39.jpg', '2'),
(908, 286, 0, '40.jpg', '2'),
(909, 287, 0, 'Point_F.jpg', '2'),
(910, 287, 0, 'Point_B.jpg', '2'),
(911, 288, 0, 'Point_F.jpg', '2'),
(912, 288, 0, 'Point_B.jpg', '2'),
(913, 289, 0, 'Cover_F4.jpg', '2'),
(914, 289, 0, 'Cover_B3.jpg', '2'),
(915, 290, 0, 'Cover_F4.jpg', '2'),
(916, 290, 0, 'Cover_B3.jpg', '2'),
(917, 291, 0, 'Gully_F4.jpg', '2'),
(918, 291, 0, 'Gully_B4.jpg', '2'),
(919, 292, 0, 'Gully_F4.jpg', '2'),
(920, 292, 0, 'Gully_B4.jpg', '2'),
(921, 293, 0, 'First_Slip_F3.jpg', '2'),
(922, 293, 0, 'First_Slip_B3.jpg', '2'),
(923, 294, 0, 'First_Slip_F3.jpg', '2'),
(924, 294, 0, 'First_Slip_B3.jpg', '2'),
(925, 295, 0, 'Second_Slip_F.jpg', '2'),
(926, 295, 0, 'Second_Slip_B3.jpg', '2'),
(927, 296, 0, 'Second_Slip_F.jpg', '2'),
(928, 296, 0, 'Second_Slip_B3.jpg', '2'),
(929, 297, 0, '814.jpg', '2'),
(930, 297, 0, '514.jpg', '2'),
(931, 297, 0, '714.jpg', '2'),
(932, 297, 0, '614.jpg', '2'),
(933, 298, 0, '814.jpg', '2'),
(934, 298, 0, '514.jpg', '2'),
(935, 298, 0, '714.jpg', '2'),
(936, 298, 0, '614.jpg', '2'),
(937, 299, 0, '814.jpg', '2'),
(938, 299, 0, '514.jpg', '2'),
(939, 299, 0, '714.jpg', '2'),
(940, 299, 0, '614.jpg', '2'),
(941, 300, 0, '414.jpg', '2'),
(942, 300, 0, '142.jpg', '2'),
(943, 300, 0, '314.jpg', '2'),
(944, 300, 0, '253.jpg', '2'),
(945, 301, 0, '414.jpg', '2'),
(946, 301, 0, '142.jpg', '2'),
(947, 301, 0, '314.jpg', '2'),
(948, 301, 0, '253.jpg', '2'),
(949, 302, 0, '414.jpg', '2'),
(950, 302, 0, '142.jpg', '2'),
(951, 302, 0, '314.jpg', '2'),
(952, 302, 0, '253.jpg', '2'),
(953, 303, 0, 'Second_Slip_F.jpg', '2'),
(954, 303, 0, 'Second_Slip_B3.jpg', '2'),
(955, 304, 0, 'Second_Slip_F.jpg', '2'),
(956, 304, 0, 'Second_Slip_B3.jpg', '2'),
(957, 305, 0, 'Second_Slip_F.jpg', '2'),
(958, 305, 0, 'Second_Slip_B3.jpg', '2'),
(959, 306, 0, '33.jpg', '2'),
(960, 306, 0, '34.jpg', '2'),
(961, 306, 0, '35.jpg', '2'),
(962, 306, 0, '36.jpg', '2'),
(963, 307, 0, '33.jpg', '2'),
(964, 307, 0, '34.jpg', '2'),
(965, 307, 0, '35.jpg', '2'),
(966, 307, 0, '36.jpg', '2'),
(967, 308, 0, '33.jpg', '2'),
(968, 308, 0, '34.jpg', '2'),
(969, 308, 0, '35.jpg', '2'),
(970, 308, 0, '36.jpg', '2'),
(971, 309, 0, '37.jpg', '2'),
(972, 309, 0, '38.jpg', '2'),
(973, 309, 0, '39.jpg', '2'),
(974, 309, 0, '40.jpg', '2'),
(975, 310, 0, '37.jpg', '2'),
(976, 310, 0, '38.jpg', '2'),
(977, 310, 0, '39.jpg', '2'),
(978, 310, 0, '40.jpg', '2'),
(979, 311, 0, '37.jpg', '2'),
(980, 311, 0, '38.jpg', '2'),
(981, 311, 0, '39.jpg', '2'),
(982, 311, 0, '40.jpg', '2'),
(983, 312, 0, '29.jpg', '2'),
(984, 312, 0, '30.jpg', '2'),
(985, 312, 0, '31.jpg', '2'),
(986, 312, 0, '32.jpg', '2'),
(987, 313, 0, '29.jpg', '2'),
(988, 313, 0, '30.jpg', '2'),
(989, 313, 0, '31.jpg', '2'),
(990, 313, 0, '32.jpg', '2'),
(991, 314, 0, '29.jpg', '2'),
(992, 314, 0, '30.jpg', '2'),
(993, 314, 0, '31.jpg', '2'),
(994, 314, 0, '32.jpg', '2');

-- --------------------------------------------------------

--
-- Table structure for table `fynx_relatedproduct`
--

CREATE TABLE IF NOT EXISTS `fynx_relatedproduct` (
`id` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  `relatedproduct` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1235 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fynx_relatedproduct`
--

INSERT INTO `fynx_relatedproduct` (`id`, `product`, `relatedproduct`) VALUES
(1, 1, 1),
(2, 1, 6),
(3, 1, 11),
(4, 1, 20),
(5, 2, 112),
(6, 2, 113),
(7, 3, 2),
(8, 3, 114),
(9, 4, 2),
(10, 4, 3),
(11, 5, 2),
(12, 5, 3),
(13, 6, 2),
(14, 6, 3),
(15, 7, 130),
(16, 7, 135),
(17, 7, 51),
(18, 7, 56),
(19, 8, 130),
(20, 8, 135),
(21, 8, 51),
(22, 8, 56),
(23, 9, 130),
(24, 9, 135),
(25, 9, 51),
(26, 9, 56),
(27, 10, 130),
(28, 10, 135),
(29, 10, 51),
(30, 10, 56),
(31, 11, 124),
(32, 11, 126),
(33, 11, 116),
(34, 12, 124),
(35, 12, 126),
(36, 12, 116),
(37, 13, 11),
(38, 13, 126),
(39, 13, 118),
(40, 14, 11),
(41, 14, 126),
(42, 14, 118),
(43, 15, 11),
(44, 15, 13),
(45, 15, 120),
(46, 16, 11),
(47, 16, 13),
(48, 16, 120),
(49, 17, 130),
(50, 17, 135),
(51, 17, 51),
(52, 17, 56),
(53, 18, 130),
(54, 18, 135),
(55, 18, 51),
(56, 18, 56),
(57, 19, 130),
(58, 19, 135),
(59, 19, 51),
(60, 19, 56),
(61, 20, 130),
(62, 20, 135),
(63, 20, 51),
(64, 20, 56),
(65, 21, 1),
(66, 21, 6),
(67, 21, 11),
(68, 21, 20),
(69, 22, 130),
(70, 22, 135),
(71, 22, 51),
(72, 22, 56),
(73, 23, 130),
(74, 23, 135),
(75, 23, 51),
(76, 23, 56),
(77, 24, 130),
(78, 24, 135),
(79, 24, 51),
(80, 24, 56),
(81, 25, 130),
(82, 25, 135),
(83, 25, 51),
(84, 25, 56),
(85, 26, 130),
(86, 26, 135),
(87, 26, 51),
(88, 26, 56),
(89, 27, 130),
(90, 27, 135),
(91, 27, 140),
(92, 27, 150),
(93, 28, 130),
(94, 28, 135),
(95, 28, 140),
(96, 28, 150),
(97, 29, 130),
(98, 29, 135),
(99, 29, 140),
(100, 29, 150),
(101, 30, 130),
(102, 30, 135),
(103, 30, 140),
(104, 30, 150),
(105, 31, 130),
(106, 31, 135),
(107, 31, 140),
(108, 31, 150),
(109, 32, 130),
(110, 32, 135),
(111, 32, 140),
(112, 33, 130),
(113, 33, 135),
(114, 33, 140),
(115, 34, 130),
(116, 34, 135),
(117, 34, 140),
(118, 35, 130),
(119, 35, 135),
(120, 35, 140),
(121, 36, 130),
(122, 36, 135),
(123, 36, 140),
(124, 37, 130),
(125, 37, 135),
(126, 37, 140),
(127, 38, 130),
(128, 38, 135),
(129, 38, 140),
(130, 39, 130),
(131, 39, 135),
(132, 39, 140),
(133, 40, 130),
(134, 40, 135),
(135, 40, 140),
(136, 41, 130),
(137, 41, 135),
(138, 41, 140),
(139, 42, 130),
(140, 42, 135),
(141, 42, 51),
(142, 42, 56),
(143, 43, 130),
(144, 43, 135),
(145, 43, 51),
(146, 43, 56),
(147, 44, 130),
(148, 44, 135),
(149, 44, 51),
(150, 44, 56),
(151, 45, 130),
(152, 45, 135),
(153, 45, 51),
(154, 45, 56),
(155, 46, 130),
(156, 46, 135),
(157, 46, 51),
(158, 46, 56),
(159, 47, 130),
(160, 47, 135),
(161, 47, 51),
(162, 47, 56),
(163, 48, 130),
(164, 48, 135),
(165, 48, 51),
(166, 48, 56),
(167, 49, 130),
(168, 49, 135),
(169, 49, 51),
(170, 49, 56),
(171, 50, 130),
(172, 50, 135),
(173, 50, 51),
(174, 50, 56),
(175, 51, 130),
(176, 51, 135),
(177, 51, 51),
(178, 51, 56),
(179, 52, 130),
(180, 52, 135),
(181, 52, 51),
(182, 52, 56),
(183, 53, 130),
(184, 53, 135),
(185, 53, 51),
(186, 53, 56),
(187, 54, 130),
(188, 54, 135),
(189, 54, 51),
(190, 54, 56),
(191, 55, 130),
(192, 55, 135),
(193, 55, 51),
(194, 55, 56),
(195, 56, 130),
(196, 56, 135),
(197, 56, 51),
(198, 56, 56),
(199, 57, 130),
(200, 57, 135),
(201, 57, 51),
(202, 57, 56),
(203, 58, 130),
(204, 58, 135),
(205, 58, 51),
(206, 58, 56),
(207, 59, 130),
(208, 59, 135),
(209, 59, 51),
(210, 59, 56),
(211, 60, 130),
(212, 60, 135),
(213, 60, 51),
(214, 60, 56),
(215, 61, 130),
(216, 61, 135),
(217, 61, 51),
(218, 61, 56),
(219, 62, 130),
(220, 62, 135),
(221, 62, 51),
(222, 62, 56),
(223, 63, 130),
(224, 63, 135),
(225, 63, 51),
(226, 63, 56),
(227, 64, 130),
(228, 64, 135),
(229, 64, 51),
(230, 64, 56),
(231, 65, 130),
(232, 65, 135),
(233, 65, 51),
(234, 65, 56),
(235, 66, 130),
(236, 66, 135),
(237, 66, 51),
(238, 66, 56),
(239, 67, 130),
(240, 67, 135),
(241, 67, 51),
(242, 67, 56),
(243, 68, 130),
(244, 68, 135),
(245, 68, 51),
(246, 68, 56),
(247, 69, 130),
(248, 69, 135),
(249, 69, 51),
(250, 69, 56),
(251, 70, 130),
(252, 70, 135),
(253, 70, 51),
(254, 70, 56),
(255, 71, 130),
(256, 71, 135),
(257, 71, 51),
(258, 71, 56),
(259, 72, 130),
(260, 72, 135),
(261, 72, 51),
(262, 72, 56),
(263, 73, 130),
(264, 73, 135),
(265, 73, 51),
(266, 73, 56),
(267, 74, 130),
(268, 74, 135),
(269, 74, 51),
(270, 74, 56),
(271, 75, 130),
(272, 75, 135),
(273, 75, 51),
(274, 75, 56),
(275, 76, 130),
(276, 76, 135),
(277, 76, 51),
(278, 76, 56),
(279, 77, 130),
(280, 77, 135),
(281, 77, 51),
(282, 77, 56),
(283, 78, 130),
(284, 78, 135),
(285, 78, 51),
(286, 78, 56),
(287, 79, 130),
(288, 79, 135),
(289, 79, 51),
(290, 79, 56),
(291, 80, 130),
(292, 80, 135),
(293, 80, 51),
(294, 80, 56),
(295, 81, 130),
(296, 81, 135),
(297, 81, 51),
(298, 81, 56),
(299, 82, 130),
(300, 82, 135),
(301, 82, 51),
(302, 82, 56),
(303, 83, 130),
(304, 83, 135),
(305, 83, 51),
(306, 83, 56),
(307, 84, 130),
(308, 84, 135),
(309, 84, 51),
(310, 84, 56),
(311, 85, 130),
(312, 85, 135),
(313, 85, 51),
(314, 85, 56),
(315, 86, 130),
(316, 86, 135),
(317, 86, 51),
(318, 86, 56),
(319, 87, 130),
(320, 87, 135),
(321, 87, 51),
(322, 87, 56),
(323, 88, 130),
(324, 88, 135),
(325, 88, 51),
(326, 88, 56),
(327, 89, 130),
(328, 89, 135),
(329, 89, 51),
(330, 89, 56),
(331, 90, 130),
(332, 90, 135),
(333, 90, 51),
(334, 90, 56),
(335, 91, 130),
(336, 91, 135),
(337, 91, 51),
(338, 91, 56),
(339, 92, 130),
(340, 92, 135),
(341, 92, 51),
(342, 92, 56),
(343, 93, 130),
(344, 93, 135),
(345, 93, 51),
(346, 93, 56),
(347, 94, 130),
(348, 94, 135),
(349, 94, 51),
(350, 94, 56),
(351, 95, 130),
(352, 95, 135),
(353, 95, 51),
(354, 95, 56),
(355, 96, 130),
(356, 96, 135),
(357, 96, 51),
(358, 96, 56),
(359, 97, 130),
(360, 97, 135),
(361, 97, 51),
(362, 97, 56),
(363, 98, 130),
(364, 98, 135),
(365, 98, 51),
(366, 98, 56),
(367, 99, 130),
(368, 99, 135),
(369, 99, 51),
(370, 99, 56),
(371, 100, 130),
(372, 100, 135),
(373, 100, 51),
(374, 100, 56),
(375, 101, 130),
(376, 101, 135),
(377, 101, 51),
(378, 101, 56),
(379, 102, 118),
(380, 102, 120),
(381, 102, 11),
(382, 103, 118),
(383, 103, 120),
(384, 103, 11),
(385, 104, 102),
(386, 104, 120),
(387, 104, 13),
(388, 105, 102),
(389, 105, 120),
(390, 105, 13),
(391, 106, 103),
(392, 106, 105),
(393, 106, 15),
(394, 107, 103),
(395, 107, 105),
(396, 107, 15),
(397, 108, 56),
(398, 108, 61),
(399, 108, 66),
(400, 108, 71),
(401, 109, 56),
(402, 109, 61),
(403, 109, 66),
(404, 109, 71),
(405, 110, 56),
(406, 110, 61),
(407, 110, 66),
(408, 110, 71),
(409, 111, 56),
(410, 111, 61),
(411, 111, 66),
(412, 111, 71),
(413, 112, 56),
(414, 112, 61),
(415, 112, 66),
(416, 112, 71),
(417, 113, 108),
(418, 113, 61),
(419, 113, 66),
(420, 113, 71),
(421, 114, 108),
(422, 114, 61),
(423, 114, 66),
(424, 114, 71),
(425, 115, 108),
(426, 115, 61),
(427, 115, 66),
(428, 115, 71),
(429, 116, 108),
(430, 116, 61),
(431, 116, 66),
(432, 116, 71),
(433, 117, 108),
(434, 117, 61),
(435, 117, 66),
(436, 117, 71),
(437, 118, 108),
(438, 118, 4),
(439, 118, 66),
(440, 118, 71),
(441, 119, 108),
(442, 119, 4),
(443, 119, 66),
(444, 119, 71),
(445, 120, 108),
(446, 120, 4),
(447, 120, 66),
(448, 120, 71),
(449, 121, 108),
(450, 121, 4),
(451, 121, 66),
(452, 121, 71),
(453, 122, 108),
(454, 122, 4),
(455, 122, 66),
(456, 122, 71),
(457, 123, 108),
(458, 123, 4),
(459, 123, 104),
(460, 123, 71),
(461, 124, 108),
(462, 124, 4),
(463, 124, 104),
(464, 124, 71),
(465, 125, 108),
(466, 125, 4),
(467, 125, 104),
(468, 125, 71),
(469, 126, 108),
(470, 126, 4),
(471, 126, 104),
(472, 126, 71),
(473, 127, 108),
(474, 127, 4),
(475, 127, 104),
(476, 127, 71),
(477, 128, 108),
(478, 128, 4),
(479, 128, 104),
(480, 128, 12),
(481, 129, 108),
(482, 129, 4),
(483, 129, 104),
(484, 129, 12),
(485, 130, 108),
(486, 130, 4),
(487, 130, 104),
(488, 130, 12),
(489, 131, 108),
(490, 131, 4),
(491, 131, 104),
(492, 131, 12),
(493, 132, 108),
(494, 132, 4),
(495, 132, 104),
(496, 132, 12),
(497, 133, 165),
(498, 133, 170),
(499, 133, 108),
(500, 133, 4),
(501, 134, 165),
(502, 134, 170),
(503, 134, 108),
(504, 134, 4),
(505, 135, 165),
(506, 135, 170),
(507, 135, 108),
(508, 135, 4),
(509, 136, 165),
(510, 136, 170),
(511, 136, 108),
(512, 136, 4),
(513, 137, 165),
(514, 137, 170),
(515, 137, 108),
(516, 137, 4),
(517, 138, 130),
(518, 138, 170),
(519, 138, 108),
(520, 138, 4),
(521, 139, 130),
(522, 139, 170),
(523, 139, 108),
(524, 139, 4),
(525, 140, 130),
(526, 140, 170),
(527, 140, 108),
(528, 140, 4),
(529, 141, 130),
(530, 141, 170),
(531, 141, 108),
(532, 141, 4),
(533, 142, 130),
(534, 142, 170),
(535, 142, 108),
(536, 142, 4),
(537, 143, 130),
(538, 143, 135),
(539, 143, 108),
(540, 143, 4),
(541, 144, 130),
(542, 144, 135),
(543, 144, 108),
(544, 144, 4),
(545, 145, 130),
(546, 145, 135),
(547, 145, 108),
(548, 145, 4),
(549, 146, 130),
(550, 146, 135),
(551, 146, 108),
(552, 146, 4),
(553, 147, 130),
(554, 147, 135),
(555, 147, 108),
(556, 147, 4),
(557, 148, 130),
(558, 148, 135),
(559, 148, 108),
(560, 148, 4),
(561, 149, 130),
(562, 149, 135),
(563, 149, 108),
(564, 149, 4),
(565, 150, 130),
(566, 150, 135),
(567, 150, 108),
(568, 150, 4),
(569, 151, 130),
(570, 151, 135),
(571, 151, 108),
(572, 151, 4),
(573, 152, 130),
(574, 152, 135),
(575, 152, 108),
(576, 152, 4),
(577, 153, 130),
(578, 153, 135),
(579, 153, 108),
(580, 153, 4),
(581, 154, 130),
(582, 154, 135),
(583, 154, 108),
(584, 154, 4),
(585, 155, 130),
(586, 155, 135),
(587, 155, 108),
(588, 155, 4),
(589, 156, 130),
(590, 156, 135),
(591, 156, 108),
(592, 156, 4),
(593, 157, 130),
(594, 157, 135),
(595, 157, 108),
(596, 157, 4),
(597, 158, 4),
(598, 158, 104),
(599, 158, 12),
(600, 158, 21),
(601, 159, 4),
(602, 159, 104),
(603, 159, 12),
(604, 159, 21),
(605, 160, 108),
(606, 160, 104),
(607, 160, 12),
(608, 160, 21),
(609, 161, 108),
(610, 161, 104),
(611, 161, 12),
(612, 161, 21),
(613, 162, 108),
(614, 162, 4),
(615, 162, 12),
(616, 162, 21),
(617, 163, 108),
(618, 163, 4),
(619, 163, 12),
(620, 163, 21),
(621, 164, 108),
(622, 164, 4),
(623, 164, 12),
(624, 164, 21),
(625, 165, 108),
(626, 165, 4),
(627, 165, 104),
(628, 165, 21),
(629, 166, 108),
(630, 166, 4),
(631, 166, 104),
(632, 166, 21),
(633, 167, 108),
(634, 167, 4),
(635, 167, 104),
(636, 167, 21),
(637, 168, 108),
(638, 168, 4),
(639, 168, 104),
(640, 168, 12),
(641, 169, 108),
(642, 169, 4),
(643, 169, 104),
(644, 169, 12),
(645, 170, 108),
(646, 170, 4),
(647, 170, 104),
(648, 170, 12),
(649, 171, 135),
(650, 171, 140),
(651, 171, 108),
(652, 171, 4),
(653, 172, 135),
(654, 172, 140),
(655, 172, 108),
(656, 172, 4),
(657, 173, 130),
(658, 173, 140),
(659, 173, 108),
(660, 173, 4),
(661, 174, 130),
(662, 174, 140),
(663, 174, 108),
(664, 174, 4),
(665, 175, 130),
(666, 175, 135),
(667, 175, 108),
(668, 175, 4),
(669, 176, 130),
(670, 176, 135),
(671, 176, 108),
(672, 176, 4),
(673, 177, 130),
(674, 177, 135),
(675, 177, 108),
(676, 177, 4),
(677, 178, 130),
(678, 178, 135),
(679, 178, 108),
(680, 178, 4),
(681, 179, 130),
(682, 179, 135),
(683, 179, 108),
(684, 179, 4),
(685, 180, 130),
(686, 180, 135),
(687, 180, 108),
(688, 180, 4),
(689, 181, 130),
(690, 181, 135),
(691, 181, 108),
(692, 181, 4),
(693, 182, 130),
(694, 182, 135),
(695, 182, 108),
(696, 182, 4),
(697, 183, 101),
(698, 183, 106),
(699, 184, 101),
(700, 184, 106),
(701, 185, 101),
(702, 185, 106),
(703, 186, 101),
(704, 186, 106),
(705, 187, 101),
(706, 187, 106),
(707, 188, 108),
(708, 188, 4),
(709, 188, 104),
(710, 189, 108),
(711, 189, 4),
(712, 189, 104),
(713, 190, 108),
(714, 190, 4),
(715, 190, 104),
(716, 191, 108),
(717, 191, 4),
(718, 191, 104),
(719, 192, 108),
(720, 192, 4),
(721, 192, 104),
(722, 193, 91),
(723, 193, 96),
(724, 194, 91),
(725, 194, 96),
(726, 195, 91),
(727, 195, 96),
(728, 196, 91),
(729, 196, 96),
(730, 197, 91),
(731, 197, 96),
(732, 198, 43),
(733, 198, 96),
(734, 199, 43),
(735, 199, 96),
(736, 200, 43),
(737, 200, 96),
(738, 201, 43),
(739, 201, 96),
(740, 202, 43),
(741, 202, 96),
(742, 203, 43),
(743, 203, 46),
(744, 204, 43),
(745, 204, 46),
(746, 205, 43),
(747, 205, 46),
(748, 206, 43),
(749, 206, 46),
(750, 207, 43),
(751, 207, 46),
(752, 208, 107),
(753, 209, 107),
(754, 210, 107),
(755, 211, 107),
(756, 212, 107),
(757, 213, 208),
(758, 214, 208),
(759, 215, 208),
(760, 216, 208),
(761, 217, 208),
(762, 218, 208),
(763, 218, 149),
(764, 219, 208),
(765, 219, 149),
(766, 220, 215),
(767, 220, 4),
(768, 220, 104),
(769, 221, 215),
(770, 221, 4),
(771, 221, 104),
(772, 222, 215),
(773, 222, 4),
(774, 222, 104),
(775, 223, 46),
(776, 223, 53),
(777, 224, 46),
(778, 224, 53),
(779, 225, 43),
(780, 225, 53),
(781, 226, 43),
(782, 226, 53),
(783, 227, 43),
(784, 227, 46),
(785, 228, 43),
(786, 228, 46),
(787, 229, 150),
(788, 230, 150),
(789, 231, 208),
(790, 232, 208),
(791, 233, 130),
(792, 233, 135),
(793, 233, 215),
(794, 233, 4),
(795, 234, 130),
(796, 234, 135),
(797, 234, 215),
(798, 234, 4),
(799, 235, 130),
(800, 235, 135),
(801, 235, 215),
(802, 235, 4),
(803, 236, 130),
(804, 236, 135),
(805, 236, 215),
(806, 236, 4),
(807, 237, 6),
(808, 237, 11),
(809, 237, 16),
(810, 237, 21),
(811, 237, 26),
(812, 237, 31),
(813, 238, 6),
(814, 238, 11),
(815, 238, 16),
(816, 238, 21),
(817, 238, 26),
(818, 238, 31),
(819, 239, 6),
(820, 239, 11),
(821, 239, 16),
(822, 239, 21),
(823, 239, 26),
(824, 239, 31),
(825, 240, 6),
(826, 240, 11),
(827, 240, 16),
(828, 240, 21),
(829, 240, 26),
(830, 240, 31),
(831, 241, 6),
(832, 241, 11),
(833, 241, 16),
(834, 241, 21),
(835, 241, 26),
(836, 241, 31),
(837, 242, 77),
(838, 242, 11),
(839, 242, 16),
(840, 242, 21),
(841, 242, 26),
(842, 242, 31),
(843, 243, 77),
(844, 243, 11),
(845, 243, 16),
(846, 243, 21),
(847, 243, 26),
(848, 243, 31),
(849, 244, 77),
(850, 244, 11),
(851, 244, 16),
(852, 244, 21),
(853, 244, 26),
(854, 244, 31),
(855, 245, 77),
(856, 245, 11),
(857, 245, 16),
(858, 245, 21),
(859, 245, 26),
(860, 245, 31),
(861, 246, 77),
(862, 246, 11),
(863, 246, 16),
(864, 246, 21),
(865, 246, 26),
(866, 246, 31),
(867, 247, 77),
(868, 247, 242),
(869, 247, 16),
(870, 247, 21),
(871, 247, 26),
(872, 247, 31),
(873, 248, 77),
(874, 248, 242),
(875, 248, 16),
(876, 248, 21),
(877, 248, 26),
(878, 248, 31),
(879, 249, 77),
(880, 249, 242),
(881, 249, 16),
(882, 249, 21),
(883, 249, 26),
(884, 249, 31),
(885, 250, 77),
(886, 250, 242),
(887, 250, 16),
(888, 250, 21),
(889, 250, 26),
(890, 250, 31),
(891, 251, 77),
(892, 251, 242),
(893, 251, 16),
(894, 251, 21),
(895, 251, 26),
(896, 251, 31),
(897, 252, 77),
(898, 252, 242),
(899, 252, 247),
(900, 252, 21),
(901, 252, 26),
(902, 252, 31),
(903, 253, 77),
(904, 253, 242),
(905, 253, 247),
(906, 253, 21),
(907, 253, 26),
(908, 253, 31),
(909, 254, 77),
(910, 254, 242),
(911, 254, 247),
(912, 254, 21),
(913, 254, 26),
(914, 254, 31),
(915, 255, 77),
(916, 255, 242),
(917, 255, 247),
(918, 255, 21),
(919, 255, 26),
(920, 255, 31),
(921, 256, 77),
(922, 256, 242),
(923, 256, 247),
(924, 256, 21),
(925, 256, 26),
(926, 256, 31),
(927, 257, 77),
(928, 257, 242),
(929, 257, 247),
(930, 257, 252),
(931, 257, 26),
(932, 257, 31),
(933, 258, 77),
(934, 258, 242),
(935, 258, 247),
(936, 258, 252),
(937, 258, 26),
(938, 258, 31),
(939, 259, 77),
(940, 259, 242),
(941, 259, 247),
(942, 259, 252),
(943, 259, 26),
(944, 259, 31),
(945, 260, 77),
(946, 260, 242),
(947, 260, 247),
(948, 260, 252),
(949, 260, 26),
(950, 260, 31),
(951, 261, 77),
(952, 261, 242),
(953, 261, 247),
(954, 261, 252),
(955, 261, 26),
(956, 261, 31),
(957, 262, 77),
(958, 262, 242),
(959, 262, 247),
(960, 262, 252),
(961, 262, 257),
(962, 262, 31),
(963, 263, 77),
(964, 263, 242),
(965, 263, 247),
(966, 263, 252),
(967, 263, 257),
(968, 263, 31),
(969, 264, 77),
(970, 264, 242),
(971, 264, 247),
(972, 264, 252),
(973, 264, 257),
(974, 264, 31),
(975, 265, 77),
(976, 265, 242),
(977, 265, 247),
(978, 265, 252),
(979, 265, 257),
(980, 265, 31),
(981, 266, 77),
(982, 266, 242),
(983, 266, 247),
(984, 266, 252),
(985, 266, 257),
(986, 266, 31),
(987, 267, 77),
(988, 267, 242),
(989, 267, 247),
(990, 267, 252),
(991, 267, 257),
(992, 267, 0),
(993, 268, 77),
(994, 268, 242),
(995, 268, 247),
(996, 268, 252),
(997, 268, 257),
(998, 268, 0),
(999, 269, 77),
(1000, 269, 242),
(1001, 269, 247),
(1002, 269, 252),
(1003, 269, 257),
(1004, 269, 0),
(1005, 270, 77),
(1006, 270, 242),
(1007, 270, 247),
(1008, 270, 252),
(1009, 270, 257),
(1010, 270, 0),
(1011, 271, 77),
(1012, 271, 242),
(1013, 271, 247),
(1014, 271, 252),
(1015, 271, 257),
(1016, 271, 0),
(1017, 272, 262),
(1018, 272, 158),
(1019, 272, 77),
(1020, 272, 242),
(1021, 272, 247),
(1022, 273, 262),
(1023, 273, 158),
(1024, 273, 77),
(1025, 273, 242),
(1026, 273, 247),
(1027, 274, 262),
(1028, 274, 158),
(1029, 274, 77),
(1030, 274, 242),
(1031, 274, 247),
(1032, 275, 262),
(1033, 275, 158),
(1034, 275, 77),
(1035, 275, 242),
(1036, 275, 247),
(1037, 276, 262),
(1038, 276, 158),
(1039, 276, 77),
(1040, 276, 242),
(1041, 276, 247),
(1042, 277, 46),
(1043, 277, 77),
(1044, 277, 242),
(1045, 277, 247),
(1046, 278, 46),
(1047, 278, 77),
(1048, 278, 242),
(1049, 278, 247),
(1050, 279, 46),
(1051, 279, 77),
(1052, 279, 242),
(1053, 279, 247),
(1054, 280, 46),
(1055, 280, 77),
(1056, 280, 242),
(1057, 280, 247),
(1058, 281, 46),
(1059, 281, 77),
(1060, 281, 242),
(1061, 281, 247),
(1062, 282, 168),
(1063, 282, 77),
(1064, 282, 242),
(1065, 282, 247),
(1066, 283, 168),
(1067, 283, 77),
(1068, 283, 242),
(1069, 283, 247),
(1070, 284, 168),
(1071, 284, 77),
(1072, 284, 242),
(1073, 284, 247),
(1074, 285, 168),
(1075, 285, 77),
(1076, 285, 242),
(1077, 285, 247),
(1078, 286, 168),
(1079, 286, 77),
(1080, 286, 242),
(1081, 286, 247),
(1082, 287, 287),
(1083, 287, 247),
(1084, 287, 252),
(1085, 287, 257),
(1086, 287, 262),
(1087, 287, 0),
(1088, 288, 287),
(1089, 288, 247),
(1090, 288, 252),
(1091, 288, 257),
(1092, 288, 262),
(1093, 288, 0),
(1094, 289, 77),
(1095, 289, 247),
(1096, 289, 252),
(1097, 289, 257),
(1098, 289, 262),
(1099, 289, 0),
(1100, 290, 77),
(1101, 290, 247),
(1102, 290, 252),
(1103, 290, 257),
(1104, 290, 262),
(1105, 290, 0),
(1106, 291, 77),
(1107, 291, 287),
(1108, 291, 252),
(1109, 291, 257),
(1110, 291, 262),
(1111, 291, 0),
(1112, 292, 77),
(1113, 292, 287),
(1114, 292, 252),
(1115, 292, 257),
(1116, 292, 262),
(1117, 292, 0),
(1118, 293, 77),
(1119, 293, 287),
(1120, 293, 292),
(1121, 293, 257),
(1122, 293, 262),
(1123, 293, 0),
(1124, 294, 77),
(1125, 294, 287),
(1126, 294, 292),
(1127, 294, 257),
(1128, 294, 262),
(1129, 294, 0),
(1130, 295, 77),
(1131, 295, 287),
(1132, 295, 292),
(1133, 295, 252),
(1134, 295, 262),
(1135, 295, 0),
(1136, 296, 77),
(1137, 296, 287),
(1138, 296, 292),
(1139, 296, 252),
(1140, 296, 262),
(1141, 296, 0),
(1142, 297, 77),
(1143, 297, 287),
(1144, 297, 292),
(1145, 297, 297),
(1146, 297, 257),
(1147, 297, 0),
(1148, 298, 77),
(1149, 298, 287),
(1150, 298, 292),
(1151, 298, 297),
(1152, 298, 257),
(1153, 298, 0),
(1154, 299, 77),
(1155, 299, 287),
(1156, 299, 292),
(1157, 299, 297),
(1158, 299, 257),
(1159, 299, 0),
(1160, 300, 77),
(1161, 300, 287),
(1162, 300, 292),
(1163, 300, 297),
(1164, 300, 257),
(1165, 300, 0),
(1166, 301, 77),
(1167, 301, 287),
(1168, 301, 292),
(1169, 301, 297),
(1170, 301, 257),
(1171, 301, 0),
(1172, 302, 77),
(1173, 302, 287),
(1174, 302, 292),
(1175, 302, 297),
(1176, 302, 302),
(1177, 302, 0),
(1178, 303, 77),
(1179, 303, 287),
(1180, 303, 292),
(1181, 303, 297),
(1182, 303, 262),
(1183, 303, 0),
(1184, 304, 77),
(1185, 304, 287),
(1186, 304, 292),
(1187, 304, 297),
(1188, 304, 262),
(1189, 304, 0),
(1190, 305, 77),
(1191, 305, 287),
(1192, 305, 292),
(1193, 305, 297),
(1194, 305, 262),
(1195, 305, 0),
(1196, 306, 220),
(1197, 306, 77),
(1198, 306, 287),
(1199, 306, 292),
(1200, 307, 220),
(1201, 307, 77),
(1202, 307, 287),
(1203, 307, 292),
(1204, 308, 220),
(1205, 308, 77),
(1206, 308, 287),
(1207, 308, 292),
(1208, 309, 168),
(1209, 309, 77),
(1210, 309, 287),
(1211, 309, 292),
(1212, 310, 168),
(1213, 310, 77),
(1214, 310, 287),
(1215, 310, 292),
(1216, 311, 168),
(1217, 311, 77),
(1218, 311, 287),
(1219, 311, 292),
(1220, 312, 307),
(1221, 312, 158),
(1222, 312, 77),
(1223, 312, 287),
(1224, 312, 292),
(1225, 313, 307),
(1226, 313, 158),
(1227, 313, 77),
(1228, 313, 287),
(1229, 313, 292),
(1230, 314, 307),
(1231, 314, 158),
(1232, 314, 77),
(1233, 314, 287),
(1234, 314, 292);

-- --------------------------------------------------------

--
-- Table structure for table `fynx_size`
--

CREATE TABLE IF NOT EXISTS `fynx_size` (
`id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fynx_size`
--

INSERT INTO `fynx_size` (`id`, `status`, `name`) VALUES
(1, 1, 'S'),
(2, 1, 'M'),
(3, 1, 'L'),
(4, 1, 'XL'),
(5, 1, 'XXL'),
(6, 0, 'XXXL'),
(7, 1, 'RH'),
(8, 1, 'LH'),
(9, 0, 'Standard'),
(10, 0, 'test size'),
(11, 1, 'XXXXL'),
(12, 1, 'XXXXXL'),
(13, 1, '2XL'),
(14, 1, '3XL'),
(15, 1, '4XL'),
(16, 1, '5XL');

-- --------------------------------------------------------

--
-- Table structure for table `fynx_sizechart`
--

CREATE TABLE IF NOT EXISTS `fynx_sizechart` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fynx_sizechart`
--

INSERT INTO `fynx_sizechart` (`id`, `name`, `image`) VALUES
(1, 'Shirt', 'T-shert.jpg'),
(2, 'For Graphics', ''),
(3, 'For Hoodies', 'Size_Chart_-_Tees1.jpg'),
(4, 'Pants', 'Pant-and-Shorts.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `fynx_subcategory`
--

CREATE TABLE IF NOT EXISTS `fynx_subcategory` (
`id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `order` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `image1` varchar(255) NOT NULL,
  `image2` varchar(255) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fynx_subcategory`
--

INSERT INTO `fynx_subcategory` (`id`, `category`, `name`, `order`, `status`, `image1`, `image2`, `type`) VALUES
(5, 4, 'WHITES', '1', '2', '01.png', '', 1),
(7, 4, 'ODI/T20', '2', '2', '', 'JODI-Final1.jpg', 2),
(8, 4, 'Training', '3', '2', '', 'JTraining-Final.jpg', 2),
(9, 4, 'Travel', '4', '2', '', 'JTravel-Final.jpg', 2),
(17, 4, 'Caps/hats', '5', '2', '', '411.png', 2),
(22, 6, 'Inside Edge 202', '', '2', '012.jpg', '', 1),
(23, 6, 'Not Out 303', '2', '2', '', '033.jpg', 2),
(24, 5, 'Sweep 101', '1', '2', '013.jpg', '', 1),
(25, 5, 'Switch 202', '3', '2', '', '024.jpg', 2),
(26, 5, 'Scoop 303', '4', '2', '', '034.jpg', 2),
(27, 5, 'Sweep 202', '2', '1', 'Hand_Gloves_sweep_2022.jpg', '', 1),
(28, 6, 'Howzat 101', '', '2', '', 'Howzat_101.jpg', 2),
(30, 5, 'Switch 202', '', '2', '', '', 0),
(31, 7, 'Kit Bags', '', '2', '', 'BLACK.png', 2),
(32, 3, 'Balls', '', '2', '700x500_-_12.png', '700x500_-_121.png', 2),
(33, 5, 'Gloves', '', '2', '', '', 0),
(34, 6, 'Pads', '', '2', '', '', 0),
(35, 2, 'Viking', '', '2', '', 'Viking.png', 2),
(36, 2, 'Gun Powder', '', '2', '', 'Gunpowder.png', 2),
(37, 2, 'Magnum', '', '2', '', 'Magnum.png', 2),
(38, 2, 'Gladius Aero', '', '2', '', 'BAT_BANNERS1.jpg', 2);

-- --------------------------------------------------------

--
-- Table structure for table `fynx_type`
--

CREATE TABLE IF NOT EXISTS `fynx_type` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `subcategory` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fynx_type`
--

INSERT INTO `fynx_type` (`id`, `name`, `status`, `timestamp`, `subcategory`) VALUES
(1, 'Polo Shirts', '1', '2015-12-14 07:17:07', 1),
(2, 'Graphic T-Shirts', '1', '2015-12-14 07:17:09', 1),
(3, 'Tanks', '1', '2015-12-14 07:17:10', 1);

-- --------------------------------------------------------

--
-- Table structure for table `fynx_useraddress`
--

CREATE TABLE IF NOT EXISTS `fynx_useraddress` (
`id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `billingcity` varchar(255) NOT NULL,
  `billingstate` varchar(255) NOT NULL,
  `billingcountry` varchar(255) NOT NULL,
  `shippingcity` varchar(255) NOT NULL,
  `shippingstate` varchar(255) NOT NULL,
  `shippingcountry` varchar(255) NOT NULL,
  `shippingpincode` varchar(255) NOT NULL,
  `billingaddress` text NOT NULL,
  `shippingaddress` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fynx_wishlist`
--

CREATE TABLE IF NOT EXISTS `fynx_wishlist` (
`id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `product` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `design` varchar(50) NOT NULL,
  `quantity` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fynx_wishlist`
--

INSERT INTO `fynx_wishlist` (`id`, `user`, `product`, `timestamp`, `design`, `quantity`) VALUES
(4, 9, '6', '2016-01-19 13:27:14', '', ''),
(11, 19, '9', '2016-01-20 05:00:44', '', ''),
(14, 20, '6', '2016-01-20 05:31:01', '', '1'),
(15, 20, '7', '2016-01-20 05:33:34', '', '1'),
(16, 20, '8', '2016-01-20 05:33:49', '', '1'),
(17, 20, '9', '2016-01-20 05:34:01', '', '1'),
(21, 13, '', '2016-01-20 06:30:50', '', '1'),
(29, 21, '8', '2016-01-20 06:56:06', '', '1'),
(30, 21, '9', '2016-01-20 06:57:02', '', '1'),
(32, 21, '6', '2016-01-20 09:20:53', '', '1'),
(36, 27, '21', '2016-02-24 06:00:08', '', '1'),
(41, 34, '10', '2016-03-12 05:18:56', '', '1'),
(42, 34, '49', '2016-03-12 05:38:53', '', '1'),
(43, 34, '21', '2016-03-12 05:55:12', '', '1'),
(44, 34, '34', '2016-03-12 08:46:39', '', '6'),
(51, 50, '6', '2016-03-17 12:15:51', '', '1'),
(53, 57, '38', '2016-03-23 13:44:20', '', '1'),
(59, 63, '21', '2016-03-23 15:09:13', '', '1'),
(60, 63, '22', '2016-03-23 15:09:23', '', '1'),
(61, 63, '23', '2016-03-23 15:09:27', '', '1'),
(62, 63, '24', '2016-03-23 15:09:31', '', '1'),
(71, 89, '6', '2016-04-08 08:37:22', '', '1'),
(73, 56, '188', '2016-04-19 13:41:45', '', '1'),
(74, 30, '1', '2016-04-27 12:34:16', '', '1'),
(75, 105, '130', '2016-04-27 17:46:15', '', '1'),
(77, 109, '128', '2016-07-27 09:21:06', '', '1');

-- --------------------------------------------------------

--
-- Table structure for table `logintype`
--

CREATE TABLE IF NOT EXISTS `logintype` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logintype`
--

INSERT INTO `logintype` (`id`, `name`) VALUES
(1, 'Facebook'),
(2, 'Twitter'),
(3, 'Email'),
(4, 'Google');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `url` text NOT NULL,
  `linktype` int(11) NOT NULL,
  `parent` int(11) NOT NULL,
  `isactive` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `icon` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `name`, `description`, `keyword`, `url`, `linktype`, `parent`, `isactive`, `order`, `icon`) VALUES
(1, 'Users', '', '', 'site/viewusers', 1, 0, 1, 4, ''),
(2, 'Dashboard', '', '', 'site/index', 1, 0, 1, 0, ''),
(3, 'Product', '', '', 'site/viewproduct', 1, 0, 1, 1, ''),
(4, 'Designer\n', '', '', 'site/viewdesigner\n', 1, 0, 1, 3, ''),
(5, 'Homeslide\n\n', '', '', 'site/viewhomeslide\n', 1, 0, 1, 2, ''),
(6, 'Sub Category\r\n\r\n', '', '', 'site/viewsubcategory\r\n\r\n\r\n', 1, 0, 1, 5, ''),
(7, 'Type\n', '', '', 'site/viewtype\r\n', 1, 0, 1, 5, ''),
(8, 'Category\n', '', '', 'site/viewcategory \r\n\r\n', 1, 0, 1, 5, ''),
(9, 'Color\n', '', '', 'site/viewcolor\r\n\r\n', 1, 0, 1, 5, ''),
(10, 'Offer\n', '', '', 'site/viewoffer\r\n\r\n', 1, 0, 1, 5, ''),
(11, 'Order\n', '', '', 'site/vieworder\r\n\r\n', 1, 0, 1, 3, ''),
(12, 'Newsletter', '', '', 'site/viewnewsletter\r\n\r\n\r\n', 1, 0, 1, 5, ''),
(14, 'Size\r\n', '', '', 'site/viewsize\r\n\r\n\r\n', 1, 0, 1, 5, ''),
(15, 'Size Chart\r\n\r\n', '', '', 'site/viewsizechart\r\n\r\n\r\n', 1, 0, 1, 5, ''),
(16, 'Testimonials\n\n', '', '', 'site/viewtestimonial\n\n\n', 1, 0, 1, 5, ''),
(17, 'Contact us\n\n', '', '', 'site/viewcontact\r\n\r\n', 1, 0, 1, 5, ''),
(18, 'Currency\r\n\r\n', '', '', 'site/viewcurrency\r\n\r\n', 1, 0, 1, 5, ''),
(19, 'Admins', '', '', 'site/viewuseradmin', 1, 0, 1, 4, ''),
(20, 'Customize', '', '', 'site/viewcustomize', 1, 0, 1, 4, ''),
(21, 'Coupon', '', '', 'site/viewcoupon', 1, 0, 1, 4, '');

-- --------------------------------------------------------

--
-- Table structure for table `menuaccess`
--

CREATE TABLE IF NOT EXISTS `menuaccess` (
  `menu` int(11) NOT NULL,
  `access` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menuaccess`
--

INSERT INTO `menuaccess` (`menu`, `access`) VALUES
(1, 1),
(4, 0),
(2, 1),
(3, 1),
(5, 1),
(6, 1),
(8, 1),
(9, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orderstatus`
--

CREATE TABLE IF NOT EXISTS `orderstatus` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderstatus`
--

INSERT INTO `orderstatus` (`id`, `name`) VALUES
(1, 'Pending'),
(2, 'Processing'),
(3, 'Shipping'),
(4, 'Delivered'),
(5, 'Cancel');

-- --------------------------------------------------------

--
-- Table structure for table `paymentgateway`
--

CREATE TABLE IF NOT EXISTS `paymentgateway` (
`id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  `type` varchar(555) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `relatedproduct`
--

CREATE TABLE IF NOT EXISTS `relatedproduct` (
`id` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  `relatedproduct` int(11) NOT NULL,
  `design` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `relatedproduct`
--

INSERT INTO `relatedproduct` (`id`, `product`, `relatedproduct`, `design`) VALUES
(2, 3, 1, '6'),
(3, 3, 2, ''),
(4, 2, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `savedesigns`
--

CREATE TABLE IF NOT EXISTS `savedesigns` (
`id` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `user` varchar(555) NOT NULL,
  `type` varchar(555) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `savedesigns`
--

INSERT INTO `savedesigns` (`id`, `description`, `user`, `type`, `date`) VALUES
(6, '{"trimTshirt":{"highlightOne":{"flag":true,"tcolor":"australian_green","disable":"unnoable","hcolor":"#0080000","image":"img/odi-tshirts/trims/training/design1/front/trim1/australian_green.png"},"highlightTwo":{"flag":true,"tcolor":"black","disable":"noable","hcolor":false,"image":"img/odi-tshirts/trims/training/design1/front/trim2/black.png"},"highlightBase":{"flag":true,"tcolor":"maroon","disable":"unnoable","image":"img/odi-tshirts/trims/training/base/front/maroon.png","hcolor":"#800000"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":25},"divattributes":[]},"isTeamLogo":true,"printType":"embroidered","front":true,"back":false,"cloth":"img/odi-tshirts/trims/trainingbase/front/maroon.png","backdrop":"img/odi-tshirts/backdrop/training/front.png"},"jerseyBackArr":[{"name":"harsh","no":"00","font":"arial","color":"white","quantity":1,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}}],"allLogos":{"rightchest":"img/logo_black.png"},"designName":"design1","designType":"training","totalAmount":1000,"totalQuan":1,"name":"Pace Front"}', 'harsh.thakkar@wohlig.com', 'odishirt', '2017-02-11 11:33:11'),
(7, '{"trimTshirt":{"highlightOne":{"flag":true,"tcolor":"india_blue","disable":"unnoable","hcolor":"#2175d9","image":"img/odi-tshirts/trims/training/design2/front/trim1/india_blue.png"},"highlightTwo":{"flag":true,"tcolor":"white","disable":"noable","hcolor":false,"image":"img/odi-tshirts/trims/training/design2/front/trim2/white.png"},"highlightBase":{"flag":true,"tcolor":"orange","disable":"unnoable","image":"img/odi-tshirts/trims/training/base/front/orange.png","hcolor":"#ffa500"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":25},"divattributes":[]},"isTeamLogo":true,"printType":"embroidered","front":true,"back":false,"cloth":"img/odi-tshirts/trims/trainingbase/front/orange.png","backdrop":"img/odi-tshirts/backdrop/training/front.png"},"jerseyBackArr":[{"name":"harsh","no":"07","font":"arial","color":"white","quantity":1,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":38,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}}],"allLogos":{"rightchest":"img/logo_black.png"},"designName":"design2","designType":"training","totalAmount":1000,"totalQuan":1,"name":"Seam Front"}', 'harsh.thakkar@wohlig.com', 'odishirt', '2017-02-11 11:34:12'),
(8, '{"trimTshirt":{"highlightOne":{"flag":true,"tcolor":"australian_green","disable":"unnoable","hcolor":"#008000","image":"img/odi-tshirts/trims/odi/design5/front/trim1/australian_green.png"},"highlightTwo":{"flag":true,"tcolor":"orange","disable":"unnoable","hcolor":"#ffa500","image":"img/odi-tshirts/trims/odi/design5/front/trim2/orange.png"},"highlightBase":{"flag":true,"tcolor":"red","disable":"unnoable","image":"img/odi-tshirts/trims/odi/base/front/red.png","hcolor":"#bf0000"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":25},"divattributes":[]},"isTeamLogo":false,"printType":"embroidered","front":true,"back":false,"cloth":"img/odi-tshirts/trims/odibase/front/red.png","backdrop":"img/odi-tshirts/backdrop/odi/front.png","teamlogo":{"attributes":{"width":39},"divattributes":{"border":"none"},"image":"image-265401486822052.png","name":"Team Logo"},"mainlogo":{"attributes":{"width":25},"divattributes":[]},"leftsleeve":{"attributes":{"width":25},"divattributes":[],"image":"image-277981486822149.jpg","name":"Left Sleeve"}},"jerseyBackArr":[{"name":"","no":"","font":"arial","color":"white","quantity":1,"size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}}],"allLogos":{"rightchest":"img/logo_black.png","leftsleeve":"image-277981486822149.jpg","teamlogo":"image-265401486822052.png"},"designName":"design5","designType":"odi","totalAmount":1000,"totalQuan":1,"name":"Floater Front"}', 'imran@kathiwadagroup.com', 'odishirt', '2017-02-11 14:21:08'),
(23, '{"trimTshirt":{"highlightOne":{"flag":true,"tcolor":"royal_blue","disable":"unnoable","hcolor":"#00308f","image":"img/odi-tshirts/trims/odi/design1/front/trim1/royal_blue.png"},"highlightTwo":{"flag":true,"tcolor":"grey","disable":"unnoable","hcolor":"#666","image":"img/odi-tshirts/trims/odi/design1/front/trim2/grey.png"},"highlightBase":{"flag":true,"tcolor":"red","disable":"unnoable","image":"img/odi-tshirts/trims/odi/base/front/red.png","hcolor":"#bf0000"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":25},"divattributes":[]},"isTeamLogo":false,"printType":"embroidered","front":true,"back":false,"cloth":"img/odi-tshirts/trims/odibase/front/red.png","backdrop":"img/odi-tshirts/backdrop/odi/front3.png","teamlogo":{"attributes":{"width":25},"divattributes":[],"image":"image-814261488435002.png","name":"Team Logo"},"mainlogo":{"attributes":{"width":55},"divattributes":{"border":"none"},"image":"image-113251488031116.jpg","name":"Main Sponsor"},"leftsleeve":{"attributes":{"width":36},"divattributes":{"border":"none"},"image":"image-926531488435033.png","name":"Left Sleeve"}},"jerseyBackArr":[{"name":"HARSH","no":20,"font":"arial","color":"white","quantity":"","size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}},{"name":"","no":"","font":"arial","color":"white","quantity":"","size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}}],"allLogos":{"mainlogo":"image-113251488031116.jpg","rightchest":"img/logo_black.png","leftsleeve":"image-926531488435033.png","teamlogo":"image-814261488435002.png"},"designName":"design1","designType":"odi","totalAmount":0,"totalQuan":"0","name":"Googly Back"}', '', 'odishirt', '2017-02-25 13:59:26'),
(24, '{"trimTshirt":{"highlightOne":{"flag":true,"tcolor":"white","disable":"unnoable","hcolor":"#fff","image":"img/odi-tshirts/trims/odi/design4/front/trim1/white.png"},"highlightTwo":{"flag":true,"tcolor":"dark_green","disable":"unnoable","hcolor":"#1a472a","image":"img/odi-tshirts/trims/odi/design4/front/trim2/dark_green.png"},"highlightBase":{"flag":true,"tcolor":"neon_green","disable":"unnoable","image":"img/odi-tshirts/trims/odi/base/front/neon_green.png","hcolor":"#ccff00"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":25},"divattributes":[]},"isTeamLogo":true,"printType":"embroidered","front":true,"back":false,"cloth":"img/odi-tshirts/trims/odibase/front/neon_green.png","backdrop":"img/odi-tshirts/backdrop/odi/front.png","leftsleeve":{"attributes":{"width":25},"divattributes":[],"image":"image-447551488031729.jpg","name":"Left Sleeve"}},"jerseyBackArr":[{"name":"","no":"","font":"arial","color":"white","quantity":"","size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}}],"allLogos":{"rightchest":"img/logo_black.png","leftsleeve":"image-447551488031729.jpg"},"designName":"design4","designType":"odi","totalAmount":0,"totalQuan":"0","name":"Plumb SUB"}', '', 'odishirt', '2017-02-25 14:09:32'),
(57, '{"trimTshirt":{"highlightOne":{"flag":true,"tcolor":"white","disable":"unnoable","hcolor":"#fff","image":"img/odi-tshirts/trims/odi/design4/front/trim1/white.png"},"highlightTwo":{"flag":true,"tcolor":"dark_green","disable":"unnoable","hcolor":"#1a472a","image":"img/odi-tshirts/trims/odi/design4/front/trim2/dark_green.png"},"highlightBase":{"flag":true,"tcolor":"neon_green","disable":"unnoable","image":"img/odi-tshirts/trims/odi/base/front/neon_green.png","hcolor":"#ccff00"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":25},"divattributes":[]},"isTeamLogo":false,"printType":"embroidered","front":true,"back":false,"cloth":"img/odi-tshirts/trims/odibase/front/neon_green.png","backdrop":"img/odi-tshirts/backdrop/odi/front3.png","rightsleeve":{"attributes":{"width":25},"divattributes":[],"image":"image-625421488435362.png","name":"Right Sleeve"}},"jerseyBackArr":[{"name":"","no":"","font":"arial","color":"white","quantity":"","size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}}],"allLogos":{"rightchest":"img/logo_black.png","rightsleeve":"image-625421488435362.png"},"designName":"design4","designType":"odi","totalAmount":0,"totalQuan":"0","name":"Googly Back"}', '', 'odishirt', '2017-03-02 06:05:44'),
(59, '{"trimTshirt":{"highlightOne":{"flag":true,"tcolor":"royal_blue","disable":"unnoable","hcolor":"#00308f","image":"img/odi-tshirts/trims/odi/design3/front/trim1/royal_blue.png"},"highlightTwo":{"flag":true,"tcolor":"white","disable":"unnoable","hcolor":"#fff","image":"img/odi-tshirts/trims/odi/design3/front/trim2/white.png"},"highlightBase":{"flag":true,"tcolor":"maroon","disable":"unnoable","image":"img/odi-tshirts/trims/odi/base/front/maroon.png","hcolor":"#800000"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":25},"divattributes":[]},"isTeamLogo":false,"printType":"embroidered","front":true,"back":false,"cloth":"img/odi-tshirts/trims/odibase/front/maroon.png","backdrop":"img/odi-tshirts/backdrop/odi/front3.png","leftsleeve":{"attributes":{"width":25},"divattributes":[],"image":"image-291451488439065.jpg","name":"Left Sleeve"},"rightsleeve":{"attributes":{"width":25},"divattributes":[],"image":"image-292461488439116.jpg","name":"Right Sleeve"}},"jerseyBackArr":[{"name":"","no":"","font":"arial","color":"white","quantity":"","size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}}],"allLogos":{"rightchest":"img/logo_black.png","leftsleeve":"image-291451488439065.jpg","rightsleeve":"image-292461488439116.jpg"},"designName":"design3","designType":"odi","totalAmount":0,"totalQuan":"0","name":"Grubber SUB"}', '', 'odishirt', '2017-03-02 07:19:11'),
(61, '{"trimTshirt":{"highlightOne":{"flag":true,"tcolor":"grey","disable":"unnoable","hcolor":"#666","image":"img/odi-tshirts/trims/odi/design1/front/trim1/grey.png"},"highlightTwo":{"flag":true,"tcolor":"grey","disable":"unnoable","hcolor":"#666","image":"img/odi-tshirts/trims/odi/design1/front/trim2/grey.png"},"highlightBase":{"flag":true,"tcolor":"india_blue","disable":"unnoable","image":"img/odi-tshirts/trims/odi/base/front/india_blue.png","hcolor":"#2175d9"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":25},"divattributes":[]},"isTeamLogo":false,"printType":"embroidered","front":true,"back":false,"cloth":"img/odi-tshirts/trims/odibase/front/india_blue.png","backdrop":"img/odi-tshirts/backdrop/odi/front3.png","leftsleeve":{"attributes":{"width":25},"divattributes":[],"image":"image-252471488442115.jpg","name":"Left Sleeve"}},"jerseyBackArr":[{"name":"","no":"","font":"arial","color":"white","quantity":"","size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}}],"allLogos":{"rightchest":"img/logo_black.png","leftsleeve":"image-252471488442115.jpg"},"designName":"design1","designType":"odi","totalAmount":0,"totalQuan":"0","name":"Googly SUB"}', '', 'odishirt', '2017-03-02 08:08:53'),
(62, '{"trimTshirt":{"highlightOne":{"flag":true,"tcolor":"grey","disable":"unnoable","hcolor":"#666","image":"img/odi-tshirts/trims/odi/design1/front/trim1/grey.png"},"highlightTwo":{"flag":true,"tcolor":"grey","disable":"unnoable","hcolor":"#666","image":"img/odi-tshirts/trims/odi/design1/front/trim2/grey.png"},"highlightBase":{"flag":true,"tcolor":"india_blue","disable":"unnoable","image":"img/odi-tshirts/trims/odi/base/front/india_blue.png","hcolor":"#2175d9"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":25},"divattributes":[]},"isTeamLogo":false,"printType":"embroidered","front":true,"back":false,"cloth":"img/odi-tshirts/trims/odibase/front/india_blue.png","backdrop":"img/odi-tshirts/backdrop/odi/front3.png","leftsleeve":{"attributes":{"width":25},"divattributes":[],"image":"image-280581488443538.jpg","name":"Left Sleeve"}},"jerseyBackArr":[{"name":"","no":"","font":"arial","color":"white","quantity":"","size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}}],"allLogos":{"rightchest":"img/logo_black.png","leftsleeve":"image-280581488443538.jpg"},"designName":"design1","designType":"odi","totalAmount":0,"totalQuan":"0","name":"Googly SUB"}', '', 'odishirt', '2017-03-02 08:32:25'),
(63, '{"trimTshirt":{"highlightOne":{"flag":true,"tcolor":"grey","disable":"unnoable","hcolor":"#666","image":"img/odi-tshirts/trims/odi/design1/front/trim1/grey.png"},"highlightTwo":{"flag":true,"tcolor":"grey","disable":"unnoable","hcolor":"#666","image":"img/odi-tshirts/trims/odi/design1/front/trim2/grey.png"},"highlightBase":{"flag":true,"tcolor":"india_blue","disable":"unnoable","image":"img/odi-tshirts/trims/odi/base/front/india_blue.png","hcolor":"#2175d9"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":25},"divattributes":[]},"isTeamLogo":false,"printType":"embroidered","front":true,"back":false,"cloth":"img/odi-tshirts/trims/odibase/front/india_blue.png","backdrop":"img/odi-tshirts/backdrop/odi/front3.png"},"jerseyBackArr":[{"name":"","no":"","font":"arial","color":"white","quantity":"","size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}}],"allLogos":{"rightchest":"img/logo_black.png"},"designName":"design1","designType":"odi","totalAmount":1000,"totalQuan":1,"name":"Googly (SUB)"}', '', 'odishirt', '2017-03-02 09:38:23'),
(90, '{"trimTshirt":{"highlightOne":{"flag":true,"tcolor":"india_blue","disable":"unnoable","hcolor":"#2175d9","image":"img/odi-tshirts/trims/training/design1/front/trim1/india_blue.png"},"highlightTwo":{"flag":true,"tcolor":"black","disable":"noable","hcolor":false,"image":"img/odi-tshirts/trims/training/design1/front/trim2/black.png"},"highlightBase":{"flag":true,"tcolor":"white","disable":"unnoable","image":"img/odi-tshirts/trims/training/base/front/white.png","hcolor":"#ffffff"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":25},"divattributes":[]},"isTeamLogo":true,"printType":"embroidered","front":true,"back":false,"cloth":"img/odi-tshirts/trims/trainingbase/front/white.png","backdrop":"img/odi-tshirts/backdrop/training/front3.png"},"jerseyBackArr":[{"name":"","no":"","font":"arial","color":"white","quantity":"","size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}}],"allLogos":{"rightchest":"img/logo_black.png"},"designName":"design1","designType":"training","totalAmount":1000,"totalQuan":1,"name":"Pace (C&S)"}', '', 'odishirt', '2017-03-07 14:12:18'),
(101, '{"pantType":"trousers","rightLogo":{"image":"img/logo_black.png","size":25},"color":{"base":"white","trim1":"orange","trim2":""},"design":{"base":"img/trousers/base/front/white.png","name":"Long Off","highlightOne":"img/trousers/design3/front/trim1/orange.png","highlightTwo":"img/trousers/design3/front/trim2/.png"},"type":"trousers","leftLogo":{"size":25},"quantity":[{"size":"L","quantity":""}],"totalAmount":850,"totalQuan":1,"sendTeamLogoLater":false}', 'wohlig@wohlig.com', 'trouser', '2017-03-15 11:13:31'),
(103, '{"design":{"base":"img/padscolor/updated/pink/2.png","name":"pad Images2"},"color":{"base":"pink"}}', 'wohlig@wohlig.com', 'pads', '2017-03-15 12:31:53'),
(104, '{"design":{"base":"img/padscolor/updated/yellow/2.png","name":"pad Images2"},"color":{"base":"yellow"}}', 'wohlig@wohlig.com', 'pads', '2017-03-15 12:33:11'),
(105, '{"design":{"base":"img/padscolor/updated/ngreen/1.png","name":"pad Images1"},"color":{"base":"#82e716"},"teamLogo":{"image":null,"size":""},"quantity":[{"quantity":null,"size":"Left"},{"quantity":null,"size":"Right"}],"type":"pads"}', 'wohlig@wohlig.com', 'pads', '2017-03-15 14:23:25'),
(107, '{"pantType":"trousers","rightLogo":{"image":"img/logo_black.png","size":25},"color":{"base":"navy_blue","trim1":"australian_green","trim2":""},"design":{"base":"img/trousers/base/front/navy_blue.png","name":"Long On","highlightOne":"img/trousers/design5/front/trim1/australian_green.png","highlightTwo":"img/trousers/design5/front/trim2/.png"},"type":"trousers","leftLogo":{"size":25},"quantity":[{"size":"L","quantity":""}],"totalAmount":850,"totalQuan":1,"sendTeamLogoLater":false}', 'wohlig@wohlig.com', 'trouser', '2017-03-16 05:36:23'),
(111, '{"design":{"base":"img/padscolor/dblue/dblue.png","name":"pad Images1"},"color":{"base":"#48d2dc"},"teamLogo":{"image":null,"size":100},"quantity":[{"quantity":null,"size":"Left"},{"quantity":null,"size":"Right"}],"type":"pads"}', 'wohlig@wohlig.com', 'pads', '2017-03-16 08:13:26'),
(112, '{"design":{"base":"img/padscolor/dblue/dblue.png","name":"pad Images1"},"color":{"base":"#48d2dc"},"teamLogo":{"image":"image-329931489656623.png","size":92},"quantity":[{"quantity":22,"size":"Left"},{"quantity":22,"size":"Right"}],"type":"pads","totalAmount":126000}', 'wohlig@wohlig.com', 'pads', '2017-03-16 09:32:09'),
(113, '{"design":{"base":"img/padscolor/dblue/dblue.png","name":"pad Images1"},"color":{"base":"#48d2dc"},"teamLogo":{"image":"image-329931489656623.png","size":92},"quantity":[{"quantity":22,"size":"Left"},{"quantity":22,"size":"Right"}],"type":"pads","totalAmount":126000}', 'wohlig@wohlig.com', 'pads', '2017-03-16 09:32:09'),
(114, '{"design":{"base":"img/padscolor/dblue/dblue.png","name":"pad Images1"},"color":{"base":"#48d2dc"},"teamLogo":{"image":"image-329931489656623.png","size":92},"quantity":[{"quantity":22,"size":"Left"},{"quantity":22,"size":"Right"}],"type":"pads","totalAmount":126000}', 'wohlig@wohlig.com', 'pads', '2017-03-16 09:32:09'),
(115, '{"design":{"base":"img/padscolor/dblue/dblue.png","name":"pad Images1"},"color":{"base":"#48d2dc"},"teamLogo":{"image":"image-329931489656623.png","size":92},"quantity":[{"quantity":22,"size":"Left"},{"quantity":22,"size":"Right"}],"type":"pads","totalAmount":126000}', 'wohlig@wohlig.com', 'pads', '2017-03-16 09:32:09'),
(116, '{"design":{"base":"img/padscolor/dblue/dblue.png","name":"pad Images1"},"color":{"base":"#48d2dc"},"teamLogo":{"image":"image-329931489656623.png","size":92},"quantity":[{"quantity":22,"size":"Left"},{"quantity":22,"size":"Right"}],"type":"pads","totalAmount":126000}', 'wohlig@wohlig.com', 'pads', '2017-03-16 09:33:11'),
(117, '{"design":{"base":"img/padscolor/dblue/dblue.png","name":"pad Images1"},"color":{"base":"#48d2dc"},"teamLogo":{"image":null,"size":100},"quantity":[{"quantity":null,"size":"Left"},{"quantity":null,"size":"Right"}],"type":"pads"}', 'wohlig@wohlig.com', 'pads', '2017-03-16 10:35:10'),
(119, '{"design":{"base":"img/padscolor/dblue/dblue.png","name":"HOWZAT 101"},"color":{"base":"#48d2dc"},"teamLogo":{"image":null,"size":100},"quantity":[{"quantity":null,"size":"Left"},{"quantity":null,"size":"Right"}],"type":"pads"}', 'wohlig@wohlig.com', 'pads', '2017-03-16 12:02:29'),
(120, '{"design":{"base":"img/padscolor/dblue/dblue.png","name":"HOWZAT 101"},"color":{"base":"#48d2dc"},"teamLogo":{"image":null,"size":100},"quantity":[{"quantity":null,"size":"Left"},{"quantity":null,"size":"Right"}],"type":"pads"}', 'wohlig@wohlig.com', 'pads', '2017-03-16 12:04:18'),
(121, '{"design":{"base":"img/padscolor/dblue/dblue.png","name":"HOWZAT 101"},"color":{"base":"#48d2dc"},"teamLogo":{"image":null,"size":100},"quantity":[{"quantity":null,"size":"Left"},{"quantity":null,"size":"Right"}],"type":"pads"}', 'wohlig@wohlig.com', 'pads', '2017-03-16 12:04:18'),
(123, '{"pantType":"trousers","rightLogo":{"image":"img/logo_black.png","size":25},"color":{"base":"#2175d9","trim1":"#ffff00","trim2":"","baseColorName":"white","trim1ColorName":"lemon_yellow","trim2ColorName":""},"design":{"base":"img/trousers/base/front/india_blue.png","name":"Square Leg","highlightOne":"img/trousers/design4/front/trim1/lemon_yellow.png","highlightTwo":"img/trousers/design4/front/trim2/.png"},"type":"trousers","leftLogo":{"size":25,"image":"image-751671489665866.jpg"},"quantity":[{"size":"L","quantity":5},{"quantity":54}],"totalAmount":50150,"totalQuan":59,"sendTeamLogoLater":false,"variable":{"width":25}}', 'wohlig@wohlig.com', 'trouser', '2017-03-16 12:04:35'),
(124, '{"design":{"base":"img/padscolor/dblue/dblue.png","name":"HOWZAT 101"},"color":{"base":"#48d2dc"},"teamLogo":{"image":"image-661391489666091.jpg","size":76},"quantity":[{"quantity":null,"size":"Left"},{"quantity":null,"size":"Right"}],"type":"pads"}', 'wohlig@wohlig.com', 'pads', '2017-03-16 12:08:27'),
(125, '{"pantType":"trousers","rightLogo":{"image":"img/logo_black.png","size":25},"color":{"base":"#666666","trim1":"#2175d9","trim2":"","baseColorName":"white","trim1ColorName":"lemon_yellow","trim2ColorName":""},"design":{"base":"img/trousers/base/front/grey.png","name":"Square Leg","designName":"design4","highlightOne":"img/trousers/design4/front/trim1/india_blue.png","highlightTwo":"img/trousers/design4/front/trim2/.png"},"type":"trousers","leftLogo":{"size":25,"image":"image-103301489668151.jpg"},"quantity":[{"size":"L","quantity":5},{"size":"XXL","quantity":20}],"totalAmount":21250,"totalQuan":25,"sendTeamLogoLater":false,"variable":{"width":25}}', 'wohlig@wohlig.com', 'trouser', '2017-03-16 12:43:08'),
(126, '{"pantType":"trousers","rightLogo":{"image":"img/logo_black.png","size":25},"color":{"base":"#800000","trim1":"#ffff00","trim2":"","baseColorName":"maroon","trim1ColorName":"lemon_yellow","trim2ColorName":""},"design":{"base":"img/trousers/base/front/maroon.png","name":"Square Leg","designName":"design4","highlightOne":"img/trousers/design4/front/trim1/lemon_yellow.png","highlightTwo":"img/trousers/design4/front/trim2/.png"},"type":"trousers","leftLogo":{"size":25,"image":"image-629921489668903.jpg"},"quantity":[{"size":"L","quantity":20}],"totalAmount":17000,"totalQuan":20,"sendTeamLogoLater":false,"variable":{"width":25}}', 'wohlig@wohlig.com', 'trouser', '2017-03-16 12:55:44'),
(127, '{"pantType":"trousers","rightLogo":{"image":"img/logo_black.png","size":25},"color":{"base":"#800000","trim1":"#ffff00","trim2":"","baseColorName":"maroon","trim1ColorName":"lemon_yellow","trim2ColorName":""},"design":{"base":"img/trousers/base/front/maroon.png","name":"Square Leg","designName":"design4","highlightOne":"img/trousers/design4/front/trim1/lemon_yellow.png","highlightTwo":"img/trousers/design4/front/trim2/.png"},"type":"trousers","leftLogo":{"size":25,"image":"image-629921489668903.jpg"},"quantity":[{"size":"L","quantity":20}],"totalAmount":17000,"totalQuan":20,"sendTeamLogoLater":false,"variable":{"width":25}}', 'wohlig@wohlig.com', 'trouser', '2017-03-16 12:55:44'),
(128, '{"design":{"base":"img/padscolor/updated/ngreen/1.png","name":"HOWZAT 101"},"color":{"base":"#82e716"},"teamLogo":[],"quantity":[{"quantity":12,"size":"Left"},{"quantity":155,"size":"Right"}],"type":"pads","sendTeamLogoLater":true,"totalAmount":464250}', 'wohlig@wohlig.com', 'pads', '2017-03-16 13:15:25'),
(129, '{"pantType":"trousers","rightLogo":{"image":"img/logo_black.png","size":25},"color":{"base":"#ffffff","trim1":"#008000","trim2":"","baseColorName":"white","trim1ColorName":"australian_green","trim2ColorName":""},"design":{"base":"img/shorts/base/front/white.png","name":"Sprint","designName":"design2","highlightOne":"img/shorts/design2/front/trim1/australian_green.png","highlightTwo":"img/shorts/design2/front/trim2/.png"},"type":"shorts","leftLogo":{"size":25},"quantity":[{"size":"L","quantity":""}],"totalAmount":850,"totalQuan":1,"sendTeamLogoLater":false}', '', 'trouser', '2017-03-16 13:15:47'),
(131, '{"design":{"base":"img/padscolor/dblue/dblue.png","name":"HOWZAT 101"},"color":{"base":"#48d2dc"},"teamLogo":{"image":null,"size":100},"quantity":[{"quantity":null,"size":"Left"},{"quantity":null,"size":"Right"}],"type":"pads","sendTeamLogoLater":false}', 'wohlig@wohlig.com', 'pads', '2017-03-16 13:40:40'),
(132, '{"design":{"base":"img/padscolor/updated/pink/1.png","name":"HOWZAT 101"},"color":{"base":"#ff5588"},"teamLogo":{"image":"image-61751489671655.png","size":100},"quantity":[{"quantity":null,"size":"Left"},{"quantity":null,"size":"Right"}],"type":"pads","sendTeamLogoLater":false}', 'wohlig@wohlig.com', 'pads', '2017-03-16 13:40:59'),
(133, '{"pantType":"trousers","rightLogo":{"image":"img/logo_black.png","size":25},"color":{"base":"#ffffff","trim1":"#ffff00","trim2":"","baseColorName":"white","trim1ColorName":"lemon_yellow","trim2ColorName":""},"design":{"base":"img/trousers/base/front/white.png","name":"Square Leg","designName":"design4","highlightOne":"img/trousers/design4/front/trim1/lemon_yellow.png","highlightTwo":"img/trousers/design4/front/trim2/.png"},"type":"trousers","leftLogo":{"size":25},"quantity":[{"size":"L","quantity":""}],"totalAmount":850,"totalQuan":1,"sendTeamLogoLater":true}', 'wohlig@wohlig.com', 'trouser', '2017-03-16 13:41:41'),
(134, '{"quantity":[{"quantity":null,"size":"Left"},{"quantity":15,"size":"Right"}],"design":{"base":"img/glovescolor/lblue/2.png"},"type":"gloves","color":{"base":"#63b8ff"},"teamLogo":{"size":25,"image":"image-544051489746722.gif"},"sendTeamLogoLater":false,"totalAmount":32000}', 'wohlig@wohlig.com', 'gloves', '2017-03-17 10:32:35'),
(135, '{"quantity":[{"quantity":null,"size":"Left"},{"quantity":15,"size":"Right"}],"design":{"base":"img/glovescolor/lblue/2.png"},"type":"gloves","color":{"base":"#63b8ff"},"teamLogo":{"size":25,"image":"image-544051489746722.gif"},"sendTeamLogoLater":false,"totalAmount":32000}', 'wohlig@wohlig.com', 'gloves', '2017-03-17 11:01:07'),
(136, '{"quantity":[{"quantity":null,"size":"Left"},{"quantity":12,"size":"Right"}],"design":{"base":"img/glovescolor/red/3.png"},"type":"gloves","color":{"base":"#FF0000"},"teamLogo":{"size":25},"sendTeamLogoLater":true,"totalAmount":26600}', 'wohlig@wohlig.com', 'gloves', '2017-03-17 11:56:05'),
(137, '{"quantity":[{"quantity":null,"size":"Left"},{"quantity":555,"size":"Right"}],"design":{"designName":"SWITCH 202","base":"img/glovescolor/lorange/2.png"},"type":"gloves","color":{"base":"#ff8247"},"teamLogo":{"size":25},"sendTeamLogoLater":true,"totalAmount":1004000}', 'wohlig@wohlig.com', 'gloves', '2017-03-17 11:58:01'),
(138, '{"design":{"base":"img/padscolor/updated/pink/2.png","name":"NOT OUT 303"},"color":{"base":"#ff5588"},"teamLogo":{"image":null,"size":100},"quantity":[{"quantity":50,"size":"Left"},{"quantity":null,"size":"Right"}],"type":"pads","sendTeamLogoLater":true,"tab":"quantity","tabNo":5,"totalAmount":142500}', 'wohlig@wohlig.com', 'pads', '2017-03-17 12:51:06'),
(139, '{"design":{"base":"img/padscolor/updated/yellow/1.png","name":"HOWZAT 101"},"color":{"base":"#ffd700"},"teamLogo":{"image":null,"size":100},"quantity":[{"quantity":null,"size":"Left"},{"quantity":null,"size":"Right"}],"type":"pads","sendTeamLogoLater":false}', 'wohlig@wohlig.com', 'pads', '2017-03-17 13:31:18'),
(140, '{"quantity":[{"quantity":null,"size":"Left"},{"quantity":null,"size":"Right"}],"design":{"designName":"SCOOP 303","base":"img/glovescolor/red/3.png"},"type":"gloves","color":{"base":"#FF0000"},"teamLogo":{"size":73,"image":"image-353261489761009.jpg","border":"none"},"sendTeamLogoLater":false,"tab":"team","tabNo":3}', '', 'gloves', '2017-03-17 14:30:38'),
(141, '{"quantity":[{"quantity":null,"size":"Left"},{"quantity":null,"size":"Right"}],"design":{"designName":"SCOOP 303","base":"img/glovescolor/dgreen/3.png"},"type":"gloves","color":{"base":"#66cd00"},"teamLogo":{"size":25},"sendTeamLogoLater":false,"tab":"trim","tabNo":2}', 'wohlig@wohlig.com', 'gloves', '2017-03-17 16:15:50'),
(142, '{"quantity":[{"quantity":null,"size":"Left"},{"quantity":null,"size":"Right"}],"design":{"name":"SWEEP 101","base":"img/glovescolor/gold/1.png"},"type":"gloves","color":{"base":"#d2b48c"},"teamLogo":{"size":25},"sendTeamLogoLater":false,"tab":"trim","tabNo":2}', 'wohlig@wohlig.com', 'gloves', '2017-03-18 05:39:18'),
(143, '{"quantity":[{"quantity":null,"size":"Left"},{"quantity":null,"size":"Right"}],"design":{"name":"SWITCH 202","base":"img/glovescolor/red/2.png"},"type":"gloves","color":{"base":"#db2123"},"teamLogo":{"size":25},"sendTeamLogoLater":false,"tab":"trim","tabNo":2}', 'wohlig@wohlig.com', 'gloves', '2017-03-18 06:19:05'),
(144, '{"pantType":"trousers","rightLogo":{"image":"img/logo_black.png","size":60,"border":false},"color":{"base":"#ffffff","trim1":"#ffff00","trim2":"","baseColorName":"white","trim1ColorName":"lemon_yellow","trim2ColorName":""},"design":{"base":"img/trousers/base/front/white.png","name":"Square Leg","designName":"design4","highlightOne":"img/trousers/design4/front/trim1/lemon_yellow.png","highlightTwo":"img/trousers/design4/front/trim2/.png"},"type":"trousers","leftLogo":{"size":-21,"border":false},"quantity":[{"size":"L","quantity":50}],"totalAmount":42500,"totalQuan":50,"sendTeamLogoLater":true,"tab":"quantity","tabNo":5}', 'wohlig@wohlig.com', 'trouser', '2017-03-18 06:54:05'),
(145, '{"design":{"base":"img/padscolor/updated/ngreen/1.png","name":"HOWZAT 101"},"color":{"base":"#82e716"},"teamLogo":{"image":"image-800481489823875.jpg","size":40},"quantity":[{"quantity":20,"size":"Left"},{"quantity":12,"size":"Right"}],"type":"pads","sendTeamLogoLater":false,"tab":"quantity","tabNo":4,"totalAmount":93000}', 'wohlig@wohlig.com', 'pads', '2017-03-18 07:58:37'),
(146, '{"design":{"base":"img/padscolor/updated/pink/1.png","name":"HOWZAT 101"},"color":{"base":"#ff5588"},"teamLogo":{"image":"image-945191489823957.jpg","size":64},"quantity":[{"quantity":900,"size":"Left"},{"quantity":null,"size":"Right"}],"type":"pads","sendTeamLogoLater":true,"tab":"quantity","tabNo":4,"totalAmount":2480000}', 'wohlig@wohlig.com', 'pads', '2017-03-18 07:59:35'),
(147, '{"pantType":"trousers","rightLogo":{"image":"img/logo_black.png","size":25},"color":{"base":"#00308f","trim1":"#bf0000","trim2":"#ccff00","baseColorName":"royal_blue","trim1ColorName":"red","trim2ColorName":"neon_green"},"design":{"base":"img/shorts/base/front/royal_blue.png","name":"Scamper","designName":"design5","highlightOne":"img/shorts/design5/front/trim1/red.png","highlightTwo":"img/shorts/design5/front/trim2/neon_green.png"},"type":"shorts","leftLogo":{"size":25},"quantity":[{"size":"L","quantity":""}],"totalAmount":850,"totalQuan":1,"sendTeamLogoLater":false,"tab":"light2","tabNo":2}', 'wohlig@wohlig.com', 'trouser', '2017-03-18 08:03:31'),
(148, '{"pantType":"trousers","rightLogo":{"image":"img/logo_black.png","size":25},"color":{"base":"#00308f","trim1":"#ffffff","trim2":"","baseColorName":"royal_blue","trim1ColorName":"white","trim2ColorName":""},"design":{"base":"img/shorts/base/front/royal_blue.png","name":"Stirde","designName":"design4","highlightOne":"img/shorts/design4/front/trim1/white.png","highlightTwo":"img/shorts/design4/front/trim2/.png"},"type":"shorts","leftLogo":{"size":25},"quantity":[{"size":"L","quantity":""}],"totalAmount":850,"totalQuan":1,"sendTeamLogoLater":false,"tab":"trim","tabNo":2}', 'wohlig@wohlig.com', 'trouser', '2017-03-18 08:22:26'),
(149, '{"quantity":[{"quantity":15,"size":"Left"},{"quantity":null,"size":"Right"}],"design":{"name":"SCOOP 303","base":"img/glovescolor/lorange/3.png"},"type":"gloves","color":{"base":"#ff8247"},"teamLogo":{"size":25,"image":"image-793401489995005.png"},"sendTeamLogoLater":false,"tab":"quantity","tabNo":4,"totalAmount":32000}', 'wohlig@wohlig.com', 'gloves', '2017-03-20 07:30:40'),
(150, '{"quantity":[{"quantity":null,"size":"Left"},{"quantity":55,"size":"Right"}],"design":{"name":"SWITCH 202","base":"img/glovescolor/dgreen/2.png"},"type":"gloves","color":{"base":"#66cd00"},"teamLogo":{"size":25},"sendTeamLogoLater":true,"tab":"quantity","tabNo":4,"totalAmount":104000}', 'wohlig@wohlig.com', 'gloves', '2017-03-20 07:46:37'),
(151, '{"quantity":[{"quantity":6,"size":"Left"},{"quantity":6,"size":"Right"}],"design":{"name":"SWITCH 202","base":"img/glovescolor/dorange/2.png"},"type":"gloves","color":{"base":"#ee3301"},"teamLogo":{"size":60,"image":"image-919931489996115.PNG"},"sendTeamLogoLater":false,"tab":"quantity","tabNo":4,"totalAmount":26600}', 'wohlig@wohlig.com', 'gloves', '2017-03-20 07:49:18'),
(152, '{"pantType":"trousers","rightLogo":{"image":"image-594111489998363.jpg","border":false,"size":45},"color":{"base":"#bf0000","trim1":"#2175d9","trim2":"#ffff00","baseColorName":"red","trim1ColorName":"india_blue","trim2ColorName":"lemon_yellow"},"design":{"base":"img/shorts/base/front/red.png","name":"Scamper","designName":"design5","highlightOne":"img/shorts/design5/front/trim1/india_blue.png","highlightTwo":"img/shorts/design5/front/trim2/lemon_yellow.png"},"type":"shorts","leftLogo":{"size":29,"border":false},"quantity":[{"size":"L","quantity":""}],"totalAmount":850,"totalQuan":1,"sendTeamLogoLater":true,"tab":"team","tabNo":3,"variable":{"width":25}}', 'dkathiwada@gmail.com', 'trouser', '2017-03-20 08:26:12'),
(153, '{"pantType":"trousers","rightLogo":{"image":"image-594111489998363.jpg","border":false,"size":45},"color":{"trim1":"#00308f","baseColorName":"lemon_yellow","trim1ColorName":"royal_blue","trim2ColorName":""},"design":{"base":"img/trousers/base/front/lemon_yellow.png","name":"Long On","designName":"design5","highlightOne":"img/trousers/design5/front/trim1/royal_blue.png","highlightTwo":"img/trousers/design5/front/trim2/.png"},"type":"trousers","leftLogo":{"size":29,"border":false},"quantity":[{"size":"L","quantity":20},{"size":"S"}],"totalAmount":17000,"totalQuan":20,"sendTeamLogoLater":true,"tab":"trim","tabNo":2,"variable":{"width":25}}', 'dkathiwada@gmail.com', 'trouser', '2017-03-20 08:27:48'),
(154, '{"pantType":"trousers","rightLogo":{"image":"image-594111489998363.jpg","border":false,"size":45},"color":{"trim1":"#00308f","baseColorName":"maroon","trim1ColorName":"royal_blue","trim2ColorName":"","base":"#800000"},"design":{"base":"img/trousers/base/front/maroon.png","name":"Long On","designName":"design5","highlightOne":"img/trousers/design5/front/trim1/royal_blue.png","highlightTwo":"img/trousers/design5/front/trim2/.png"},"type":"trousers","leftLogo":{"size":29,"border":false},"quantity":[{"size":"S","quantity":20},{"size":"S","quantity":1}],"totalAmount":17000,"totalQuan":20,"sendTeamLogoLater":true,"tab":"quantity","tabNo":4,"variable":{"width":25}}', 'dkathiwada@gmail.com', 'trouser', '2017-03-20 08:31:44'),
(155, '{"quantity":[{"quantity":null,"size":"Left"},{"quantity":null,"size":"Right"}],"design":{"name":"SWITCH 202","base":"img/glovescolor/dgreen/2.png"},"type":"gloves","color":{"base":"#66cd00"},"teamLogo":{"size":51,"image":"image-495841489998817.jpg"},"sendTeamLogoLater":true,"tab":"team","tabNo":3}', 'dkathiwada@gmail.com', 'gloves', '2017-03-20 08:33:47'),
(156, '{"quantity":[{"quantity":null,"size":"Left"},{"quantity":null,"size":"Right"}],"design":{"name":"SWITCH 202","base":"img/glovescolor/dgreen/2.png"},"type":"gloves","color":{"base":"#66cd00"},"teamLogo":{"size":51,"image":"image-495841489998817.jpg"},"sendTeamLogoLater":true,"tab":"team","tabNo":3}', 'dkathiwada@gmail.com', 'gloves', '2017-03-20 08:33:56'),
(157, '{"quantity":[{"quantity":null,"size":"Left"},{"quantity":null,"size":"Right"}],"design":{"name":"SWITCH 202","base":"img/glovescolor/dgreen/2.png"},"type":"gloves","color":{"base":"#66cd00"},"teamLogo":{"size":51,"image":"image-495841489998817.jpg"},"sendTeamLogoLater":true,"tab":"trim","tabNo":2}', 'dkathiwada@gmail.com', 'gloves', '2017-03-20 08:34:10'),
(158, '{"quantity":[{"quantity":6,"size":"Left"},{"quantity":6,"size":"Right"}],"design":{"name":"SWITCH 202","base":"img/glovescolor/dorange/2.png"},"type":"gloves","color":{"base":"#ee3301"},"teamLogo":{"size":60,"image":"image-919931489996115.PNG"},"sendTeamLogoLater":false,"tab":"quantity","tabNo":4,"totalAmount":26600}', 'wohlig@wohlig.com', 'gloves', '2017-03-20 09:53:22'),
(159, '{"quantity":[{"quantity":null,"size":"Left"},{"quantity":null,"size":"Right"}],"design":{"name":"SWITCH 202","base":"img/glovescolor/lgreen/2.png"},"type":"gloves","color":{"base":"#bcee68"},"teamLogo":{"size":25},"sendTeamLogoLater":false,"tab":"trim","tabNo":2}', '', 'gloves', '2017-03-20 11:34:49'),
(160, '{"quantity":[{"quantity":null,"size":"Left"},{"quantity":null,"size":"Right"}],"design":{"name":"SWEEP 101","base":"img/glovescolor/dblue/1.png"},"type":"gloves","color":{"base":"#00008b"},"teamLogo":{"size":25,"image":"image-247201490009772.jpg"},"sendTeamLogoLater":false,"tab":"team","tabNo":3}', '', 'gloves', '2017-03-20 11:37:00'),
(161, '{"pantType":"trousers","rightLogo":{"image":"img/logo_black.png","size":16,"border":false},"color":{"base":"#666666","trim1":"#008000","trim2":"","baseColorName":"grey","trim1ColorName":"australian_green","trim2ColorName":""},"design":{"base":"img/trousers/base/front/grey.png","name":"Square Leg","designName":"design4","highlightOne":"img/trousers/design4/front/trim1/australian_green.png","highlightTwo":"img/trousers/design4/front/trim2/.png"},"type":"trousers","leftLogo":{"size":25},"quantity":[{"size":"L","quantity":""}],"totalAmount":850,"totalQuan":1,"sendTeamLogoLater":false,"tab":"team","tabNo":3}', 'wohlig@wohlig.com', 'trouser', '2017-03-20 12:30:17'),
(167, '{"design":{"base":"img/odi-tshirts/trims/training/base/front/black.png","designName":"design5","designType":"training","highlightOne":"img/odi-tshirts/trims/training/design5/front/trim1/lemon_yellow.png","highlightTwo":"img/odi-tshirts/trims/training/design5/front/trim2/white.png","name":"Drift (C&S)"},"color":{"baseColorName":"black","trim1ColorName":"lemon_yellow","trim2ColorName":"white"},"teamLogo":{"image":"image-803431490271053.jpg","size":100},"rightChestLogo":{"image":"img/logo_black.png","size":25},"mainSponsorLogo":{"image":"image-579521490271069.png","size":100},"leftSleeveLogo":{"image":"image-65441490271077.png","size":100},"rightSleeveLogo":{"image":"image-688581490271083.png","size":100},"backSponsorLogo":{"image":"image-958141490271092.png","size":100},"quantity":[{"quantity":null,"size":"Left"},{"quantity":null,"size":"Right"}],"type":"odi","sendTeamLogoLater":false}', 'wohlig@wohlig.com', 'odi', '2017-03-23 12:11:38'),
(168, '{"design":{"base":"img/odi-tshirts/trims/odi/base/front/australian_green.png","designName":"design5","designType":"odi","highlightOne":"img/odi-tshirts/trims/odi/design5/front/trim1/royal_blue.png","highlightTwo":"img/odi-tshirts/trims/odi/design5/front/trim2/lemon_yellow.png","name":"Floater (SUB)"},"color":{"baseColorName":"australian_green","trim1ColorName":"royal_blue","trim2ColorName":"lemon_yellow"},"teamLogo":{"image":"image-803431490271053.jpg","size":100},"rightChestLogo":{"image":"img/logo_black.png","size":25},"mainSponsorLogo":{"image":"image-579521490271069.png","size":100},"leftSleeveLogo":{"image":"image-65441490271077.png","size":100},"rightSleeveLogo":{"image":"image-688581490271083.png","size":100},"backSponsorLogo":{"image":"image-958141490271092.png","size":100},"quantity":[{"quantity":null,"size":"Left"},{"quantity":null,"size":"Right"}],"type":"odi","sendTeamLogoLater":false,"tab":"team","tabNo":3}', 'wohlig@wohlig.com', 'odi', '2017-03-23 12:43:16'),
(169, '{"quantity":[{"quantity":null,"size":"Left"},{"quantity":null,"size":"Right"}],"design":{"name":"SWEEP 101","base":"img/glovescolor/dblue/1.png"},"type":"gloves","color":{"base":"#00008b"},"teamLogo":{"size":25},"sendTeamLogoLater":true,"tab":"quantity","tabNo":4}', 'wohlig@wohlig.com', 'gloves', '2017-03-24 06:37:06'),
(170, '{"design":{"base":"img/padscolor/dblue/dblue.png","name":"HOWZAT 101"},"color":{"base":"#48d2dc"},"teamLogo":{"image":null,"size":100},"quantity":[{"quantity":2,"size":"Left"},{"quantity":22,"size":"Right"}],"type":"pads","sendTeamLogoLater":true,"tab":"team","tabNo":3,"totalAmount":71000}', 'wohlig@wohlig.com', 'pads', '2017-03-24 07:02:39'),
(171, '{"quantity":[{"quantity":null,"size":"Left"},{"quantity":null,"size":"Right"}],"design":{"name":"SWITCH 202","base":"img/glovescolor/lblue/2.png"},"type":"gloves","color":{"base":"#63b8ff"},"teamLogo":{"size":25},"sendTeamLogoLater":false,"tab":"trim","tabNo":2}', '', 'gloves', '2017-03-24 07:03:05'),
(172, '{"quantity":[{"quantity":12,"size":"Left"},{"quantity":null,"size":"Right"}],"design":{"name":"SWEEP 101","base":"img/glovescolor/dblue/1.png"},"type":"gloves","color":{"base":"#00008b"},"teamLogo":{"size":25},"sendTeamLogoLater":true,"tab":"quantity","tabNo":4,"totalAmount":26600}', 'wohlig@wohlig.com', 'gloves', '2017-03-24 07:04:34'),
(173, '{"design":{"base":"img/padscolor/dblue/dblue.png","name":"HOWZAT 101"},"color":{"base":"#48d2dc"},"teamLogo":{"image":null,"size":100},"quantity":[{"quantity":null,"size":"Left"},{"quantity":null,"size":"Right"}],"type":"pads","sendTeamLogoLater":false,"tab":"trim","tabNo":2}', 'wohlig@wohlig.com', 'pads', '2017-03-24 07:21:25'),
(175, '{"design":{"base":"img/padscolor/dblue/dblue.png","name":"HOWZAT 101"},"color":{"base":"#48d2dc"},"teamLogo":{"image":null,"size":100},"quantity":[{"quantity":null,"size":"Left"},{"quantity":null,"size":"Right"}],"type":"pads","sendTeamLogoLater":false,"tab":"trim","tabNo":2}', 'wohlig@wohlig.com', 'pads', '2017-03-27 06:18:26'),
(177, '{"design":{"base":"img/odi-tshirts/trims/odi/base/front/australian_green.png","designName":"design5","designType":"odi","highlightOne":"img/odi-tshirts/trims/odi/design5/front/trim1/royal_blue.png","highlightTwo":"img/odi-tshirts/trims/odi/design5/front/trim2/lemon_yellow.png","name":"Floater (SUB)"},"color":{"base":"#008000","baseColorName":"australian_green","trim1":"#00308f","trim1ColorName":"royal_blue","trim2":"#ffff00","trim2ColorName":"lemon_yellow"},"teamLogo":{"image":"image-937061490612270.png","size":100},"rightChestLogo":{"image":"img/logo_black.png","size":25},"mainSponsorLogo":{"image":"image-66371490612282.png","size":100},"leftSleeveLogo":{"image":"image-62251490612286.png","size":100},"rightSleeveLogo":{"image":"image-512501490612301.jpg","size":100},"backSponsorLogo":{"image":"image-68621490612278.png","size":100},"font":{"fontStyle":"arial","fontColor":"white","nameSize":18,"nameSpacing":1,"numberSize":60,"numberSpacing":1},"type":"odi","sendTeamLogoLater":false,"quantity":[{"size":"L","quantity":10,"name":"aaa","no":"1","sleeve":"short"},{"size":"S","quantity":10,"name":"ccc","no":"2","sleeve":"long"}],"totalAmount":20000,"totalQuan":20,"tab":"quantity","tabNo":4}', 'wohlig@wohlig.com', 'odi', '2017-03-27 10:59:13'),
(178, '{"trimTshirt":{"highlightOne":{"flag":false,"tcolor":"grey","disable":"unnoable","hcolor":"#666","image":"img/odi-tshirts/trims/odi/design1/back/trim1/grey.png"},"highlightTwo":{"flag":false,"tcolor":"grey","disable":"unnoable","hcolor":"#666","image":"img/odi-tshirts/trims/odi/design1/back/trim2/grey.png"},"highlightBase":{"flag":false,"tcolor":"india_blue","disable":"unnoable","image":"img/odi-tshirts/trims/odi/base/back/india_blue.png","hcolor":"#2175d9"}},"customizedShirt":{"rightchest":{"name":"Right Chest","image":"img/logo_black.png","attributes":{"width":38},"divattributes":{"border":"none"}},"isTeamLogo":true,"printType":"embroidered","front":false,"back":false,"cloth":"img/odi-tshirts/trims/odibase/front/india_blue.png","backdrop":"img/odi-tshirts/backdrop/odi/back3.png"},"jerseyBackArr":[{"name":"","no":"","font":"arial","color":"white","quantity":"","size":"L","sleeve":"short","attributes":{"name":{"fontSize":18,"border":"none","rotate":0,"letterSpacing":1},"number":{"fontSize":60,"border":"none","rotate":0,"letterSpacing":1}}}],"allLogos":{"rightchest":"img/logo_black.png"},"designName":"design1","designType":"odi","totalAmount":1000,"totalQuan":1,"name":"Googly (SUB)"}', 'wohlig@wohlig.com', 'odishirt', '2017-03-28 07:30:56'),
(179, '{"design":{"base":"img/padscolor/dblue/dblue.png","name":"HOWZAT 101"},"color":{"base":"#48d2dc"},"teamLogo":{"image":null,"size":100},"quantity":[{"quantity":12,"size":"Left"},{"quantity":6,"size":"Right"}],"type":"pads","sendTeamLogoLater":true,"tab":"quantity","tabNo":4,"totalAmount":54500}', 'wohlig@wohlig.com', 'pads', '2017-03-28 09:33:19'),
(180, '{"design":{"base":"img/padscolor/dblue/dblue.png","name":"HOWZAT 101"},"color":{"base":"#48d2dc"},"teamLogo":{"image":null,"size":100},"quantity":[{"quantity":12,"size":"Left"},{"quantity":12,"size":"Right"}],"type":"pads","sendTeamLogoLater":true,"tab":"quantity","tabNo":4,"totalAmount":71000}', 'wohlig@wohlig.com', 'pads', '2017-03-28 09:35:14'),
(181, '{"design":{"base":"img/padscolor/dblue/dorange.png","name":"INSIDE EDGE 202"},"color":{"base":"#ee3301"},"teamLogo":{"image":null,"size":100},"quantity":[{"quantity":null,"size":"Left"},{"quantity":null,"size":"Right"}],"type":"pads","sendTeamLogoLater":true,"tab":"team","tabNo":3}', 'wohlig@wohlig.com', 'pads', '2017-03-28 13:03:50'),
(182, '{"design":{"base":"img/padscolor/updated/yellow/1.png","name":"HOWZAT 101"},"color":{"base":"#ffd700"},"teamLogo":{"image":null,"size":100},"quantity":[{"quantity":null,"size":"Left"},{"quantity":null,"size":"Right"}],"type":"pads","sendTeamLogoLater":false,"tab":"trim","tabNo":2}', 'wohlig@wohlig.com', 'pads', '2017-03-28 14:28:58'),
(183, '{"design":{"base":"img/padscolor/dblue/dgreen.png","name":"NOT OUT 303"},"color":{"base":"#82e716"},"teamLogo":{"image":"image-510091490770778.jpg","size":100},"quantity":[{"quantity":12,"size":"Left"},{"quantity":null,"size":"Right"}],"type":"pads","sendTeamLogoLater":false,"tab":"team","tabNo":3,"totalAmount":44000}', 'wohlig@wohlig.com', 'pads', '2017-03-29 07:01:12'),
(184, '{"pantType":"trousers","rightLogo":{"image":"img/logo_black.png","size":25},"color":{"base":"#ffff00","trim1":"#008000","trim2":"","baseColorName":"lemon_yellow","trim1ColorName":"australian_green","trim2ColorName":""},"design":{"base":"img/trousers/base/front/lemon_yellow.png","name":"Long On","designName":"design5","highlightOne":"img/trousers/design5/front/trim1/australian_green.png","highlightTwo":"img/trousers/design5/front/trim2/.png"},"type":"trousers","leftLogo":{"size":25},"quantity":[{"size":"L","quantity":""}],"totalAmount":850,"totalQuan":1,"sendTeamLogoLater":false,"tab":"trim","tabNo":2}', 'wohlig@wohlig.com', 'trouser', '2017-03-29 07:25:20'),
(185, '{"design":{"base":"img/padscolor/dblue/dblue.png","name":"HOWZAT 101"},"color":{"base":"#48d2dc"},"teamLogo":{"image":"image-972071490772368.png","size":122},"quantity":[{"quantity":null,"size":"Left"},{"quantity":null,"size":"Right"}],"type":"pads","sendTeamLogoLater":false,"totalAmount":0,"tab":"quantity","tabNo":4}', 'wohlig@wohlig.com', 'pads', '2017-03-29 07:26:34'),
(186, '{"design":{"base":"img/padscolor/dblue/dblue.png","name":"HOWZAT 101"},"color":{"base":"#48d2dc"},"teamLogo":[],"quantity":[{"quantity":null,"size":"Left"},{"quantity":null,"size":"Right"}],"type":"pads","sendTeamLogoLater":true,"totalAmount":0,"tab":"quantity","tabNo":4}', 'wohlig@wohlig.com', 'pads', '2017-03-29 12:35:27'),
(187, '{"design":{"base":"img/padscolor/dblue/dorange.png","name":"INSIDE EDGE 202"},"color":{"base":"#ee3301"},"teamLogo":{"image":null,"size":100},"quantity":[{"quantity":null,"size":"Left"},{"quantity":15,"size":"Right"}],"type":"pads","sendTeamLogoLater":true,"totalAmount":45000,"tab":"quantity","tabNo":4}', 'wohlig@wohlig.com', 'pads', '2017-03-29 13:00:34'),
(188, '{"design":{"base":"img/glovescolor/dblue/1.png","name":"SWEEP 101"},"type":"gloves","quantity":[{"quantity":null,"size":"Left"},{"quantity":null,"size":"Right"}],"color":{"base":"#00008b"},"teamLogo":{"size":25},"sendTeamLogoLater":true,"totalAmount":0,"tab":"quantity","tabNo":4}', 'wohlig@wohlig.com', 'gloves', '2017-03-29 13:01:58'),
(189, '{"design":{"base":"img/odi-tshirts/trims/odi/base/front/india_blue.png","designName":"design1","designType":"odi","highlightOne":"img/odi-tshirts/trims/odi/design1/front/trim1/grey.png","highlightTwo":"img/odi-tshirts/trims/odi/design1/front/trim2/grey.png","name":"Googly (SUB)"},"color":{"base":"#2175d9","baseColorName":"india_blue","trim1":"#666666","trim1ColorName":"grey","trim2":"#666666","trim2ColorName":"grey"},"teamLogo":{"image":null,"size":25},"rightChestLogo":{"image":"img/logo_black.png","size":25},"mainSponsorLogo":{"image":null,"size":25},"leftSleeveLogo":{"image":null,"size":25},"rightSleeveLogo":{"image":null,"size":25},"backSponsorLogo":{"image":null,"size":25},"font":{"fontStyle":"arial","fontColor":"white","nameSize":18,"nameSpacing":1,"numberSize":60,"numberSpacing":1},"type":"odi","sendTeamLogoLater":true,"quantity":[{"size":"L","quantity":"","name":"","no":"","sleeve":""}],"totalAmount":1000,"totalQuan":1,"tab":"quantity","tabNo":4}', 'wohlig@wohlig.com', 'odi', '2017-03-29 13:06:56'),
(190, '{"design":{"base":"img/padscolor/dblue/dblue.png","name":"HOWZAT 101"},"color":{"base":"#48d2dc"},"teamLogo":{"image":null,"size":100},"quantity":[{"quantity":15,"size":"Left"},{"quantity":null,"size":"Right"}],"type":"pads","sendTeamLogoLater":true,"totalAmount":41250,"tab":"quantity","tabNo":4}', 'wohlig@wohlig.com', 'pads', '2017-03-30 06:32:21');
INSERT INTO `savedesigns` (`id`, `description`, `user`, `type`, `date`) VALUES
(191, '{"design":{"base":"img/padscolor/dblue/dgreen.png","name":"NOT OUT 303"},"color":{"base":"#82e716"},"teamLogo":{"image":null,"size":100},"quantity":[{"quantity":15,"size":"Left"},{"quantity":null,"size":"Right"}],"type":"pads","sendTeamLogoLater":true,"totalAmount":48750,"tab":"trim","tabNo":2}', 'wohlig@wohlig.com', 'pads', '2017-03-30 06:36:46'),
(192, '{"design":{"base":"img/padscolor/dblue/dgreen.png","name":"NOT OUT 303"},"color":{"base":"#82e716"},"teamLogo":{"image":"image-139391490855840.jpg","size":72},"quantity":[{"quantity":15,"size":"Left"},{"quantity":null,"size":"Right"}],"type":"pads","sendTeamLogoLater":true,"totalAmount":48750,"tab":"team","tabNo":3}', 'wohlig@wohlig.com', 'pads', '2017-03-30 06:37:33'),
(193, '{"design":{"base":"img/glovescolor/dgreen/2.png","name":"SWITCH 202"},"type":"gloves","quantity":[{"quantity":null,"size":"Left"},{"quantity":null,"size":"Right"}],"color":{"base":"#66cd00"},"teamLogo":{"size":25},"sendTeamLogoLater":false,"totalAmount":0,"tab":"trim","tabNo":2}', 'wohlig@wohlig.com', 'gloves', '2017-03-30 07:02:40'),
(195, '{"design":{"base":"img/glovescolor/red/3.png","name":"SCOOP 303"},"type":"gloves","quantity":[{"quantity":null,"size":"Left"},{"quantity":null,"size":"Right"}],"color":{"base":"#FF0000"},"teamLogo":{"size":25},"sendTeamLogoLater":false,"totalAmount":0,"tab":"trim","tabNo":2}', 'wohlig@wohlig.com', 'gloves', '2017-03-30 07:22:04'),
(196, '{"design":{"base":"img/glovescolor/dblue/1.png","name":"SWEEP 101"},"type":"gloves","quantity":[{"quantity":null,"size":"Left"},{"quantity":null,"size":"Right"}],"color":{"base":"#00008b"},"teamLogo":{"size":25},"sendTeamLogoLater":false,"totalAmount":0,"tab":"trim","tabNo":2}', 'wohlig@wohlig.com', 'gloves', '2017-03-30 07:22:20'),
(197, '{"pantType":"trousers","rightLogo":{"image":"img/logo_black.png","size":25},"color":{"base":"#bf0000","trim1":"#008000","trim2":"","baseColorName":"red","trim1ColorName":"australian_green","trim2ColorName":""},"design":{"base":"img/trousers/base/front/red.png","name":"Square Leg","designName":"design4","highlightOne":"img/trousers/design4/front/trim1/australian_green.png","highlightTwo":"img/trousers/design4/front/trim2/.png"},"type":"trousers","leftLogo":{"size":25},"quantity":[{"size":"L","quantity":""}],"totalAmount":0,"sendTeamLogoLater":false,"tab":"trim","tabNo":2}', 'wohlig@wohlig.com', 'trouser', '2017-03-30 07:30:14'),
(198, '{"pantType":"trousers","rightLogo":{"image":"img/logo_black.png","size":25},"color":{"base":"#ffffff","trim1":"#ffff00","trim2":"","baseColorName":"white","trim1ColorName":"lemon_yellow","trim2ColorName":""},"design":{"base":"img/trousers/base/front/white.png","name":"Fine Leg","designName":"design2","highlightOne":"img/trousers/design2/front/trim1/lemon_yellow.png","highlightTwo":"img/trousers/design2/front/trim2/.png"},"type":"trousers","leftLogo":{"size":25},"quantity":[{"size":"L","quantity":""}],"totalAmount":0,"sendTeamLogoLater":false,"tab":"trim","tabNo":2}', 'wohlig@wohlig.com', 'trouser', '2017-03-30 07:36:52'),
(199, '{"pantType":"trousers","rightLogo":{"image":"img/logo_black.png","size":25},"color":{"baseColorName":"white","trim1ColorName":"lemon_yellow","trim2ColorName":""},"design":{"base":"img/trousers/base/front/white.png","name":"Square Leg","designName":"design4","highlightOne":"img/trousers/design4/front/trim1/lemon_yellow.png","highlightTwo":"img/trousers/design4/front/trim2/.png"},"type":"trousers","leftLogo":{"size":25},"quantity":[{"size":"L","quantity":""}],"totalAmount":0,"sendTeamLogoLater":false,"tab":"trim","tabNo":2}', 'wohlig@wohlig.com', 'trouser', '2017-03-30 07:45:19'),
(200, '{"design":{"base":"img/padscolor/dblue/dblue.png","name":"HOWZAT 101"},"color":{"base":"#48d2dc"},"teamLogo":{"image":null,"size":100},"quantity":[{"quantity":null,"size":"Left"},{"quantity":null,"size":"Right"}],"type":"pads","sendTeamLogoLater":false,"totalAmount":0,"tab":"trim","tabNo":2}', 'wohlig@wohlig.com', 'pads', '2017-03-30 08:19:25'),
(201, '{"design":{"base":"img/glovescolor/red/3.png","name":"SCOOP 303"},"type":"gloves","quantity":[{"quantity":null,"size":"Left"},{"quantity":null,"size":"Right"}],"color":{"base":"#db2123"},"teamLogo":{"size":25},"sendTeamLogoLater":false,"totalAmount":0,"tab":"trim","tabNo":2}', 'wohlig@wohlig.com', 'gloves', '2017-03-30 08:21:02'),
(202, '{"pantType":"trousers","rightLogo":{"image":"img/logo_black.png","size":25},"color":{"base":"#666666","baseColorName":"grey","trim1":"#ffff00","trim2":"","trim1ColorName":"lemon_yellow","trim2ColorName":""},"design":{"base":"img/shorts/base/front/grey.png","name":"Slogger","designName":"design3","highlightOne":"img/shorts/design3/front/trim1/lemon_yellow.png","highlightTwo":"img/shorts/design3/front/trim2/.png"},"type":"shorts","leftLogo":{"size":25},"quantity":[{"size":"L","quantity":""}],"totalAmount":0,"sendTeamLogoLater":false,"tab":"trim","tabNo":2}', 'wohlig@wohlig.com', 'trouser', '2017-03-30 09:57:05'),
(203, '{"pantType":"trousers","rightLogo":{"image":"img/logo_black.png","size":25},"color":{"base":"#666666","baseColorName":"grey","trim1":"#ffff00","trim2":"","trim1ColorName":"lemon_yellow","trim2ColorName":""},"design":{"base":"img/shorts/base/front/grey.png","name":"Slogger","designName":"design3","highlightOne":"img/shorts/design3/front/trim1/lemon_yellow.png","highlightTwo":"img/shorts/design3/front/trim2/.png"},"type":"shorts","leftLogo":[],"quantity":[{"size":"L","quantity":20}],"totalAmount":13000,"sendTeamLogoLater":true,"tab":"quantity","tabNo":4,"variable":{"width":25}}', 'wohlig@wohlig.com', 'trouser', '2017-03-30 09:57:49'),
(204, '{"design":{"base":"img/odi-tshirts/trims/odi/base/front/india_blue.png","designName":"design1","designType":"odi","highlightOne":"img/odi-tshirts/trims/odi/design1/front/trim1/grey.png","highlightTwo":"img/odi-tshirts/trims/odi/design1/front/trim2/grey.png","name":"Googly (SUB)"},"color":{"base":"#2175d9","baseColorName":"india_blue","trim1":"#666666","trim1ColorName":"grey","trim2":"#666666","trim2ColorName":"grey"},"teamLogo":{"image":null,"size":25},"rightChestLogo":{"image":"img/logo_black.png","size":25},"mainSponsorLogo":{"image":"","size":25},"leftSleeveLogo":{"image":"","size":25},"rightSleeveLogo":{"image":null,"size":25},"backSponsorLogo":{"image":null,"size":25},"font":{"fontStyle":"arial","fontColor":"white","nameSize":18,"nameSpacing":1,"numberSize":60,"numberSpacing":1},"type":"odi","sendTeamLogoLater":false,"quantity":[{"size":"L","quantity":"","name":"","no":"","sleeve":""}],"totalAmount":0,"totalQuan":0,"tab":"team","tabNo":3}', 'wohlig@wohlig.com', 'odi', '2017-03-30 10:58:53'),
(205, '{"design":{"base":"img/odi-tshirts/trims/odi/base/front/red.png","designName":"design3","designType":"odi","highlightOne":"img/odi-tshirts/trims/odi/design3/front/trim1/royal_blue.png","highlightTwo":"img/odi-tshirts/trims/odi/design3/front/trim2/white.png","name":"Grubber (SUB)"},"color":{"base":"#bf0000","baseColorName":"red","trim1":"#00308f","trim1ColorName":"royal_blue","trim2":"#fff","trim2ColorName":"white"},"teamLogo":{"image":null,"size":25},"rightChestLogo":{"image":"img/logo_black.png","size":25},"mainSponsorLogo":{"image":null,"size":25},"leftSleeveLogo":{"image":null,"size":25},"rightSleeveLogo":{"image":null,"size":25},"backSponsorLogo":{"image":null,"size":25},"font":{"fontStyle":"arial","fontColor":"white","nameSize":18,"nameSpacing":1,"numberSize":60,"numberSpacing":1},"type":"odi","sendTeamLogoLater":false,"quantity":[{"size":"L","quantity":"","name":"","no":"","sleeve":""}],"totalAmount":0,"totalQuan":0,"tab":"team","tabNo":3}', 'wohlig@wohlig.com', 'odi', '2017-03-30 11:03:38'),
(206, '{"design":{"base":"img/odi-tshirts/trims/training/base/front/lemon_yellow.png","designName":"design1","designType":"training","highlightOne":"img/odi-tshirts/trims/training/design1/front/trim1/australian_green.png","highlightTwo":"img/odi-tshirts/trims/training/design1/front/trim2/black.png","name":"Pace (C&S)"},"color":{"base":"#ffff00","baseColorName":"lemon_yellow","trim1":"#008000","trim1ColorName":"australian_green","trim2":"#000000","trim2ColorName":"black"},"teamLogo":{"image":null,"size":25},"rightChestLogo":{"image":"img/logo_black.png","size":25},"mainSponsorLogo":{"image":null,"size":25},"leftSleeveLogo":{"image":null,"size":25},"rightSleeveLogo":{"image":null,"size":25},"backSponsorLogo":{"image":null,"size":25},"font":{"fontStyle":"arial","fontColor":"white","nameSize":18,"nameSpacing":1,"numberSize":50,"numberSpacing":1},"type":"odi","sendTeamLogoLater":false,"quantity":[{"size":"L","quantity":"","name":"","no":"","sleeve":"short"}],"totalAmount":0,"totalQuan":0,"leftSleeveLogoBack":{"image":null,"size":25},"rightSleeveLogoBack":{"image":null,"size":25},"isBase":true,"isTrim1":true,"isTrim2":false,"tab":"team","tabNo":3}', 'imran@kathiwadagroup.com', 'odi', '2017-04-21 07:29:46');

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE IF NOT EXISTS `statuses` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `name`) VALUES
(1, 'Disable'),
(2, 'Enable');

-- --------------------------------------------------------

--
-- Table structure for table `testimonial`
--

CREATE TABLE IF NOT EXISTS `testimonial` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `testimonial`
--

INSERT INTO `testimonial` (`id`, `name`, `location`, `image`, `description`) VALUES
(5, 'manan vora', 'Mumbai,Maharashtra', 'manan.png', '                            Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.        '),
(6, 'Manan', 'Mumbai', 'manan.png', '                            Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s        ');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `accesslevel` int(11) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `socialid` varchar(255) NOT NULL,
  `logintype` varchar(255) NOT NULL,
  `json` text NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `billingaddress` text NOT NULL,
  `billingcity` varchar(255) NOT NULL,
  `billingstate` varchar(255) NOT NULL,
  `billingcountry` varchar(255) NOT NULL,
  `billingcontact` varchar(255) NOT NULL,
  `billingpincode` varchar(255) NOT NULL,
  `shippingaddress` text NOT NULL,
  `shippingcity` varchar(255) NOT NULL,
  `shippingcountry` varchar(255) NOT NULL,
  `shippingstate` varchar(255) NOT NULL,
  `shippingpincode` varchar(255) NOT NULL,
  `shippingname` varchar(255) NOT NULL,
  `shippingcontact` varchar(255) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `credit` varchar(255) NOT NULL,
  `companyname` varchar(255) NOT NULL,
  `registrationno` varchar(255) NOT NULL,
  `vatnumber` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `fax` varchar(255) NOT NULL,
  `gender` int(11) NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `google` varchar(255) NOT NULL,
  `twitter` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `pincode` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `city` varchar(255) NOT NULL,
  `billingline1` varchar(255) NOT NULL,
  `billingline2` varchar(255) NOT NULL,
  `billingline3` varchar(255) NOT NULL,
  `shippingline1` varchar(255) NOT NULL,
  `shippingline2` varchar(255) NOT NULL,
  `shippingline3` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `password`, `email`, `accesslevel`, `timestamp`, `status`, `image`, `username`, `socialid`, `logintype`, `json`, `firstname`, `lastname`, `phone`, `billingaddress`, `billingcity`, `billingstate`, `billingcountry`, `billingcontact`, `billingpincode`, `shippingaddress`, `shippingcity`, `shippingcountry`, `shippingstate`, `shippingpincode`, `shippingname`, `shippingcontact`, `currency`, `credit`, `companyname`, `registrationno`, `vatnumber`, `country`, `fax`, `gender`, `facebook`, `google`, `twitter`, `street`, `address`, `pincode`, `state`, `dob`, `city`, `billingline1`, `billingline2`, `billingline3`, `shippingline1`, `shippingline2`, `shippingline3`) VALUES
(1, 'Imran Patel', 'a63526467438df9566c508027d9cb06b', 'imran@customcricketcompany.com', 1, '0000-00-00 00:00:00', 1, 'images_(2)1.jpg', '', '', 'Facebook', '0', 'Imran', 'Patel', '9820579300', '', 'uyg', 'fdsc', 'Guadeloupe', '', '78946132', '', 'uyg', 'Guadeloupe', 'fdsc', '78946132', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', 'daugvy', 'vyp', 'g', 'daugvy', 'vyp', 'g'),
(14, NULL, 'd41d8cd98f00b204e9800998ecf8427e', '', 3, '2016-01-19 14:19:49', 2, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(15, NULL, 'c916d142f0dc7f9389653a164f1d4e9d', 'rtyui@gmail.com', 3, '2016-01-19 14:19:49', 2, NULL, '', '', '', '', 'ROhan', 'Gada', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(16, NULL, 'c916d142f0dc7f9389653a164f1d4e9d', 'rg@gmail.com', 3, '2016-01-19 14:48:23', 2, NULL, '', '', '', '', 'Rohan', 'G', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(17, NULL, 'c916d142f0dc7f9389653a164f1d4e9d', 'r12@gmail.com', 3, '2016-01-19 14:57:21', 2, NULL, '', '', '', '', 'Rohan', 'Gada', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(18, NULL, 'e3a214873911a417fe414006f0be1bb6', 'chirag.9966@gmail.com', 3, '2016-01-19 17:56:02', 2, NULL, '', '', '', '', 'chirag', 'shah', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(19, NULL, 'c4ca4238a0b923820dcc509a6f75849b', 'test@test.com', 3, '2016-01-20 04:24:48', 2, NULL, '', '', '', '', 'Demo', 'Test', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(20, NULL, '70052e57d06ab95e4a0cc75fb28df5ac', 'rohan111@gmail.com', 3, '2016-01-20 05:30:34', 2, NULL, '', '', '', '', 'etyuio', 'sdfghjk', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(21, NULL, '70052e57d06ab95e4a0cc75fb28df5ac', 'gadarohan17@gmail.com', 3, '2016-01-20 06:47:00', 2, NULL, '', '', '', '', 'Rohan', 'Gada', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(22, NULL, 'c916d142f0dc7f9389653a164f1d4e9d', 'gadarohan18@gmail.com', 3, '2016-01-20 09:53:23', 2, NULL, '', '', '', '', 'Rohan', 'Gada', '', '', 'xcvb410', 'cvbndfg', 'American Samoa', '', '410', '', 'xcvb410', 'American Samoa', 'cvbndfg', '410', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', 'qwertyui', 'sdfghj', 'zxcvbn', 'qwertyui', 'sdfghj', 'zxcvbn'),
(23, NULL, 'f0703d43a2e6a199630fe2b7fd1c4f7e', 'chirag@wohlig.com', 3, '2016-01-21 09:35:34', 2, NULL, '', '', '', '', 'chirag', 'shah', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(24, NULL, 'c916d142f0dc7f9389653a164f1d4e9d', 'iamsodum@insane.com', 3, '2016-01-27 11:39:00', 2, NULL, '', '', '', '', 'Dummy', 'User', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(25, NULL, '202cb962ac59075b964b07152d234b70', 't@c.com', 3, '2016-01-28 07:48:04', 2, NULL, '', '', '', '', 'tushar', 'sachde', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(27, NULL, 'a63526467438df9566c508027d9cb06b', 'gadarohan19@gmail.com', 3, '2016-02-24 05:22:16', 2, NULL, '', '', '', '', 'Rohan', 'Gada', '', '', 'dasdas', 'sasdas', 'Australia', '', '741852963', '', 'dasdas', 'Australia', 'sasdas', '741852963', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', 'sacdsa', 'dasdsa', 'sadsa', 'sacdsa', 'dasdsa', 'sadsa'),
(28, NULL, '21ab923fa748c1d2d9a6e92c108b243b', 'gadarohan27@gmail.com', 3, '2016-02-24 08:44:14', 2, NULL, '', '', '', '', 'Rohan', 'Gada', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(29, NULL, '3677b23baa08f74c28aba07f0cb6554e', 'jagruti@wohlig.com', 3, '2016-03-03 11:14:07', 2, NULL, '', '', '', '', 'jagruti', 'patil', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(30, 'Harshit', '00a1f187721c63501356bf791e69382c', 'hshah248@gmail.com', 3, '2016-03-04 09:02:50', 2, NULL, '', '', '', '', 'Amit', 'Verma', '9920021248', '', 'rhjmkvh', 'Maharashtra', 'India', '', '400070', '', 'rhjmkvh', 'India', 'Maharashtra', '400070', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '2345ty', 'qdfn', '111', '2345ty', 'qdfn', 'hvb'),
(31, NULL, 'd37702cedc289aa9ed772bad8c1180c9', 'amit@gmail.com', 3, '2016-03-04 12:08:17', 2, NULL, '', '', '', '', 'duxctronn', 'Dsouza', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(32, NULL, '847ab179219ddc7027780c679227e21e', 'daljitkaur@gmail.com', 3, '2016-03-04 12:18:58', 2, NULL, '', '', '', '', 'dhaljit', 'kaur', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(33, NULL, '28c43838d7662b860146d7fa7c296603', 'gkjhlk#=@gmail.com', 3, '2016-03-04 12:36:11', 2, NULL, '', '', '', '', 'qwergdf', '12qwerf', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(39, 'Manan Vora', '', 'customcricketcompany@gmail.com', 3, '2016-03-12 10:46:43', 1, 'https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg', '', '107397298016966586993', 'Google', '', 'w', 'khjkJKHJKHK', '4789', '', '4', '65', 'Albania', '', '64', '', '4', 'Albania', '65', '64', '', '', '', '', '', '', '', '', '', 0, '', '107397298016966586993', '', '', ',', '', '', '0000-00-00', '', 'DASDAS', '646', 'SDA', 'DASDAS', '646', 'SDA'),
(41, 'Jay Visariya', '', 'Jay@wohlig.com', 3, '2016-03-12 13:16:26', 1, 'https://lh4.googleusercontent.com/-SwF8Bwq0u1I/AAAAAAAAAAI/AAAAAAAAAI0/rSvRNBq2-A4/photo.jpg', '', '118313183524893739637', 'Google', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '118313183524893739637', '', '', ',', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(42, 'wohligtest', '', '', 3, '2016-03-12 13:22:13', 1, 'http://pbs.twimg.com/profile_images/643380248814358528/lcpfIQqB_normal.jpg', '', '3559530614', 'Twitter', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '3559530614', '', ',Mumbai, Maharashtra', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(43, 'jayvisariya93', '', '', 3, '2016-03-12 13:24:06', 1, 'http://pbs.twimg.com/profile_images/378800000832845718/4e27a11c9d717e578be1923224ec933e_normal.jpeg', '', '143455919', 'Twitter', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '143455919', '', ',Mumbai', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(44, 'RohanGada', '', '', 3, '2016-03-12 13:24:45', 1, 'http://pbs.twimg.com/profile_images/430757675907825664/QoyUx4vO_normal.jpeg', '', '86664070', 'Twitter', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '86664070', '', ',Mumbai,India', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(45, 'Wohlig Bot', '', '', 3, '2016-03-12 13:28:09', 1, 'https://graph.facebook.com/229114400772872/picture?width=150&height=150', '', '229114400772872', 'Facebook', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '229114400772872', '', '', '', ',', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(46, 'Jay Visariya', '', '', 3, '2016-03-12 13:28:19', 1, 'https://graph.facebook.com/10207068474442628/picture?width=150&height=150', '', '10207068474442628', 'Facebook', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '10207068474442628', '', '', '', ',', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(48, 'chirag shah', 'e3a214873911a417fe414006f0be1bb6', 'chintan@gmail.com', 3, '2016-03-12 13:31:21', 2, NULL, '', '', '', '', 'chirag', 'shah', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(51, 'Rohan Gada', '', '', 3, '2016-03-12 13:40:32', 1, 'https://graph.facebook.com/10204540436630070/picture?width=150&height=150', '', '10204540436630070', 'Facebook', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '10204540436630070', '', '', '', ',', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(52, 'Chirag Shah', '', 'chirag@wohlig.com', 3, '2016-03-12 14:13:02', 1, 'https://lh3.googleusercontent.com/-iqMWRJt9NgI/AAAAAAAAAAI/AAAAAAAAAAA/9syO-O-6kf4/photo.jpg', '', '102528309404797835540', 'Google', '', 'slknln', 'jkbjb', '', '', 'dfghjkl', 'Maharashtra', 'India', '', '400022', '', 'dfghjkl', 'India', 'Maharashtra', '400022', '', '', '', '', '', '', '', '', '', 0, '', '102528309404797835540', '', '', ',', '', '', '0000-00-00', '', 'dfghjkl', 'dfghjkl', 'dfghjkl', 'dfghjkl', 'dfghjkl', 'dfghjkl'),
(53, 'Digvijay Kathiwada', '', 'digvijay@osians.com', 3, '2016-03-14 05:54:14', 1, 'https://lh4.googleusercontent.com/-1gYduHvtCVs/AAAAAAAAAAI/AAAAAAAABNs/hYe0WYtAxAA/photo.jpg', '', '114077298123857958513', 'Google', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '114077298123857958513', '', '', ',', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(54, 'Harshit Shah', '', 'hshah248@gmail.com', 3, '2016-03-14 05:54:26', 1, 'https://lh6.googleusercontent.com/-kiTfI5vPEoc/AAAAAAAAAAI/AAAAAAAAAVk/UOZ8PfxFU0M/photo.jpg', '', '115945220063492981848', 'Google', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '115945220063492981848', '', '', ',', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(55, 'Swati Agarwal', '', 'swati@kathiwada.com', 3, '2016-03-14 05:54:47', 1, 'https://graph.facebook.com/10156609788515244/picture?width=150&height=150', '', '10156609788515244', 'Facebook', '', 'Swati', 'Kathiwada', '', '', 'Mumbai', 'Maharashtra', 'India', '', '4000036', '', 'Mumbai', 'India', 'Maharashtra', '4000036', '', '', '', '', '', '', '', '', '', 0, '10156609788515244', '', '', '', ',', '', '', '0000-00-00', '', '1 Symphony', 'Nepeansea Road', 'Near Dariya Mahal', '1 Symphony', 'Nepeansea Road', 'Near Dariya Mahal'),
(56, 'Digvijay Kathiwada', '2c27e44d455b50d167176d93e30359c5', 'dkathiwada@gmail.com', 3, '2016-03-14 06:07:03', 2, NULL, '', '', '', '', 'Digvijay', 'Kathiwada', '9867671119', '', 'mumbai', 'mh', 'India', '', '400026', '', 'mumbai', 'India', 'mh', '400026', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', 'melange', '33 altamount', 'bob', 'melange', '33 altamount', 'bob'),
(57, 'vinod beloshe', '29c42773cb16bffe8cc141d8065cd24f', 'vinodwohlig@gmail.com', 3, '2016-03-17 10:11:41', 2, NULL, '', '', '', '', 'vinod', 'beloshe', '1323', '', 'city', 'mah', 'India', '', '400080', '', 'city', 'India', 'mah', '400080', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', 'bldng', 'street', 'city', 'bldng', 'street', 'city'),
(58, 'Harshit Shah', '00a1f187721c63501356bf791e69382c', 'harshit@tingmail.in', 3, '2016-03-21 06:03:47', 2, NULL, '', '', '', '', 'Harshit', 'Shah', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(59, 'Sohan Honakeri', '', 'sohan@wohlig.com', 3, '2016-03-22 10:07:41', 1, 'https://lh4.googleusercontent.com/-adainYC2piI/AAAAAAAAAAI/AAAAAAAAADk/3R0fmXABpW0/photo.jpg', '', '112265044460450750371', 'Google', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '112265044460450750371', '', '', ',', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(60, 'Rohan Gada', 'd3fc58f23dc2b1620a81f167a218ee2b', 'ro@gmail.com', 3, '2016-03-23 05:36:30', 2, NULL, '', '', '', '', 'Rohan', 'Gada', '', '', '1', '', '', '', '415', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '741', '', '4', '', '', ''),
(61, 'Rohan Gada', '21ab923fa748c1d2d9a6e92c108b243b', 'ro1@gmail.com', 3, '2016-03-23 14:58:40', 2, NULL, '', '', '', '', 'Rohan', 'Gada', '', '', 'gu', 'ug', 'Uganda', '', '741822', '', 'gu', 'Uganda', 'ug', '741822', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', 'gytg', 'yu', 'gbguygu', 'gytg', 'yu', 'gbguygu'),
(62, 'Harshit SHAH', '00a1f187721c63501356bf791e69382c', 'rohan@tingmail.in', 3, '2016-03-23 14:59:17', 2, NULL, '', '', '', '', 'Harshit', 'SHAH', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(63, 'Harshit Shah', '00a1f187721c63501356bf791e69382c', 'chintan@wohlig.com', 3, '2016-03-23 15:00:18', 2, NULL, '', '', '', '', 'Harshit', 'Shah', '', '', '11', '1111', 'Albania', '', '111111', '', '11', 'Albania', '1111', '111111', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '11', '11', '11', '11', '11', '11'),
(64, 'Harshit Shah', '', 'harshit@tingmail.in', 3, '2016-03-24 21:39:04', 1, 'https://lh6.googleusercontent.com/-LiItQspe2F0/AAAAAAAAAAI/AAAAAAAAAB4/JpqJ-l4sUvY/photo.jpg', '', '100272726897504930614', 'Google', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '100272726897504930614', '', '', ',', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(65, 'Imran Patel', '', '', 3, '2016-03-28 06:49:05', 1, 'https://graph.facebook.com/10154132238044797/picture?width=150&height=150', '', '10154132238044797', 'Facebook', '', '', '', '', '', 'Mumbai', 'Maharastra', 'India', '', '400018', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '10154132238044797', '', '', '', ',', '', '', '0000-00-00', '', '6 Merryland,', 'Dr R G Thadani Road Worli Mumbai 18', 'Flora Restaurant', '', '', ''),
(66, 'Digvijay Kathiwada', '', '', 3, '2016-03-28 10:22:47', 1, 'https://graph.facebook.com/10103963985697715/picture?width=150&height=150', '', '10103963985697715', 'Facebook', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '10103963985697715', '', '', '', ',', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(67, 'Imran Patel', '2c27e44d455b50d167176d93e30359c5', 'connect@kathiwada.com', 3, '2016-03-28 11:14:48', 2, NULL, '', '', '', '', 'Imran', 'Patel', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(68, 'Rohan Gada', '00a1f187721c63501356bf791e69382c', 'gadarohan786@gmail.com', 3, '2016-03-30 10:11:06', 2, NULL, '', '', '', '', 'Rohan', 'Gada', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(69, 'Rohan Gada', '362a8a3c4bd89fa62ce5f18cc03087b5', 'rohangada17@gmail.com', 3, '2016-03-30 14:03:21', 2, NULL, '', '', '', '', 'Rohan', 'Gada', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(70, 'harshit shah', '00a1f187721c63501356bf791e69382c', 'tushar@wohlig.com', 3, '2016-03-30 15:43:12', 2, NULL, '', '', '', '', 'harshit', 'shah', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(71, 'Rohan Gada', 'd3fc58f23dc2b1620a81f167a218ee2b', 'rohan.wohlig@gmail.com', 3, '2016-04-04 06:13:19', 2, NULL, '', '', '', '', 'Rohan', 'Gada', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(72, 'Rahul Lapasiya', '2c27e44d455b50d167176d93e30359c5', 'occ@osians.com', 3, '2016-04-04 08:09:17', 2, NULL, '', '', '', '', 'Rahul', 'Lapasiya', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(78, 'Harsh Thakkar', '', '', 3, '2016-04-05 13:10:28', 1, 'https://graph.facebook.com/1180840628614598/picture?width=150&height=150', '', '1180840628614598', 'Facebook', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '1180840628614598', '', '', '', ',', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(79, 'I P', 'e83d30b78c7fe6009874ace8eb9a7d3c', 'umpire@customcricketcompany.com', 3, '2016-04-06 10:22:56', 2, NULL, '', '', '', '', 'I', 'P', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(80, 'Chintan Shah', '', '', 3, '2016-04-07 05:46:19', 1, 'https://graph.facebook.com/1173630275981496/picture?width=150&height=150', '', '1173630275981496', 'Facebook', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '1173630275981496', '', '', '', ',', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(81, 'Chintan Shah', '', 'chintan@wohlig.com', 3, '2016-04-07 05:47:16', 1, 'https://lh3.googleusercontent.com/-NkSY2F99cBk/AAAAAAAAAAI/AAAAAAAAAAA/c7_N3Fuu-4w/photo.jpg', '', '117156151809059322067', 'Google', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '117156151809059322067', '', '', ',', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(82, 'chintanhappines', '', '', 3, '2016-04-07 05:48:13', 1, 'http://pbs.twimg.com/profile_images/465790248304115712/s0WXS5Si_normal.png', '', '121427044', 'Twitter', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '121427044', '', ',India', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(83, 'chintan shah', 'f3abbf3960a3c7683c1a14eb176d1a28', 'chintanhappiness@gmail.com', 3, '2016-04-07 05:50:46', 2, NULL, '', '', '', '', 'chintan', 'shah', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(84, 'Rohan Gada', '', 'gadarohan17@gmail.com', 3, '2016-04-07 09:24:59', 1, 'https://lh5.googleusercontent.com/-Xbp4pIeDSZA/AAAAAAAAAAI/AAAAAAAAAfY/2evoT0bgGTQ/photo.jpg', '', '112655669474418967154', 'Google', '', 'Rohan', 'Gada', '', '', 'xfchgvjh', 'hgvjhbkj', 'Guinea', '', '1456789', '', 'xfchgvjh', 'Guinea', 'hgvjhbkj', '1456789', '', '', '', '', '', '', '', '', '', 0, '', '112655669474418967154', '', '', ',', '', '', '0000-00-00', '', 'erstrdfuygi', 'hx', 'fchgvjbk', 'erstrdfuygi', 'hx', 'fchgvjbk'),
(85, 'chintan shah', '', 'chintanhappiness@gmail.com', 3, '2016-04-07 09:48:09', 1, 'https://lh3.googleusercontent.com/-8gzsrm6Jr5U/AAAAAAAAAAI/AAAAAAAAAYk/Jk4xGAc7PGs/photo.jpg', '', '106909055181757599118', 'Google', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '106909055181757599118', '', '', ',', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(86, 'mahesh maurya', 'e10adc3949ba59abbe56e057f20f883e', 'mahesh@wohlig.co', 3, '2016-04-07 14:13:07', 2, NULL, '', '', '', '', 'mahesh', 'maurya', '', '', 'Mumbai', 'Maharashtra', 'India', '', '400022', '', 'Mumbai', 'India', 'Maharashtra', '400022', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '90', 'killih kamal', 'Okay', '90', 'killih kamal', 'Okay'),
(88, 'Manan Vora', '6d0dfc99d66476ab4d0a2d52c2ec2a8f', 'manan@sfanow.in', 3, '2016-04-08 08:32:20', 2, NULL, '', '', '', '', 'Manan', 'Vora', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(89, 'Sai Vemula', '00a1f187721c63501356bf791e69382c', 'sai@tingmail.in', 3, '2016-04-08 08:32:30', 2, NULL, '', '', '', '', 'Sai', 'Vemula', '', '', '11', '1111', 'Azerbaijan', '', '1111111', '', '11', 'Azerbaijan', '1111', '1111111', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '11', '1', '11', '11', '1', '11'),
(90, 'Chirag Shah', '', 'chirag.9966@gmail.com', 3, '2016-04-08 08:53:41', 1, 'https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg', '', '103948995510194166724', 'Google', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '103948995510194166724', '', '', ',', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(91, 'Chirag Shah', 'e3a214873911a417fe414006f0be1bb6', 'chirag@shah.com', 3, '2016-04-08 09:03:30', 2, NULL, '', '', '', '', 'Chirag', 'Shah', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(92, 'Harshit Shah', '', 'hshah248@gmail.com', 3, '2016-04-08 16:25:15', 1, 'https://graph.facebook.com/10204499711771334/picture?width=150&height=150', '', '10204499711771334', 'Facebook', '', 'Harshit', 'Shah', '9920021248', '', '11', '11', 'India', '', '111111', '', '11', 'India', '11', '111111', '', '', '', '', '', '', '', '', '', 0, '10204499711771334', '', '', '', ',', '', '', '0000-00-00', '', '11', '11', '11', '11', '11', '11'),
(93, 'Imran Patel', '', 'imran@customcricketcompany.com', 3, '2016-04-13 08:20:08', 1, 'https://lh3.googleusercontent.com/-6kM46F4AvSc/AAAAAAAAAAI/AAAAAAAAAAA/1i7Eb_M98J8/photo.jpg', '', '110443341378004559158', 'Google', '', 'Imran', 'Patel', '', '', 'f', 'f', 'Falkland Islands', '', 'f', '', 'f', 'Falkland Islands', 'f', 'f', '', '', '', '', '', '', '', '', '', 0, '', '110443341378004559158', '', '', ',', '', '', '0000-00-00', '', 'f', 'f', 'f', 'f', 'f', 'f'),
(94, 'Wohlig Technology', 'a63526467438df9566c508027d9cb06b', 'wohligbot@gmail.com', 3, '2016-04-13 11:19:31', 2, NULL, '', '', '', '', 'Wohlig', 'Technology', '+917045440213', '', 'Mumbai', 'Maharashtra', 'India', '', '400022', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', 'A/30, Laxmi Niwas', 'Plot No. 3', 'Opp. Axis Bank', '', '', ''),
(95, 'Arthur Beard', '4f3064557af9dbb27f95df0a31b0bcd6', 'beard.arthur@gmail.com', 3, '2016-04-13 15:29:30', 2, NULL, '', '', '', '', 'Arthur', 'Beard', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(96, 'Rohan Gada', '21ab923fa748c1d2d9a6e92c108b243b', 'rohanwohlig@gmail.com', 3, '2016-04-19 12:54:01', 2, NULL, '', '', '', '', 'Rohan', 'Gada', '785817811', '', 'hjb', 'hgu', 'Guadeloupe', '', '400029', '', 'hjb', 'Guadeloupe', 'hgu', '400029', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', 'ut', 'jgcuy', 'jhgjhbjhg', 'ut', 'jgcuy', 'jhgjhbjhg'),
(97, 'Rohan Gada', '148e57564c779f29aab4c9094a6757bf', 'rohanwohlig999@gmail.com', 3, '2016-04-20 05:52:12', 2, NULL, '', '', '', '', 'Rohan', 'Gada', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(98, 'Rohan Gada', '', 'rohanwohlig@gmail.com', 3, '2016-04-20 06:30:06', 1, 'https://lh4.googleusercontent.com/-4yuQdB29xH8/AAAAAAAAAAI/AAAAAAAAACU/iaq9pMcnVLY/photo.jpg', '', '111988408576022251944', 'Google', '', 'Rohan', 'Gada', '9768254461', '', 'sdfg', 'Arunachal Pradesh', 'India', '', '474090', '', 'sdfg', 'India', 'Arunachal Pradesh', '474090', '', '', '', '', '', '', '', '', '', 0, '', '111988408576022251944', '', '', ',', '', '', '0000-00-00', '', 'wqwwq', 'wqwwq', 'Uttaranchal', 'wqwwq', 'wqwwq', 'Uttaranchal'),
(99, 'Midhet Sulemani', '0d5cbbfaae77a78cd949cf4ac6d5b2a1', 'midhet.wohlig@gmail.com', 3, '2016-04-20 12:57:06', 2, NULL, '', '', '', '', 'Midhet', 'Sulemani', '', '', 'jkefhkwjfhh', 'dsjkfghdjksfhdjksh', 'Kazakhstan', '', '3546546547587', '', 'jkefhkwjfhh', 'Kazakhstan', 'dsjkfghdjksfhdjksh', '3546546547587', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', 'dr,bfgnkjrbghjkh', 'kjhefhefh', '1kjfhkwfh', 'dr,bfgnkjrbghjkh', 'kjhefhefh', '1kjfhkwfh'),
(100, 'Rustom C', 'bc142afc1fdc8092463d37af277c2b53', 'rustom.chowna@gmail.com', 3, '2016-04-20 21:02:05', 2, NULL, '', '', '', '', 'Rustom', 'Chowna', '7726638468', '', 'London', 'London', 'United Kingdom', '', 'E14 3WE', '', 'London', 'United Kingdom', 'London', 'E14 3WE', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '215', 'St. Davids Square', 'Island gardens', '215', 'St. Davids Square', 'Island gardens'),
(101, 'Ankit Garg', '', 'dj.ankit@gmail.com', 3, '2016-04-21 04:06:15', 1, 'https://lh6.googleusercontent.com/-yR7BpgTIQi4/AAAAAAAAAAI/AAAAAAAAA_E/LypXo8osjdQ/photo.jpg', '', '114976649068252765116', 'Google', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '114976649068252765116', '', '', ',', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(102, 'Ankit Zaveri', 'bbbdff7ba49a18ec35c0b0673c5b7432', 'zaveriankit@gmail.com', 3, '2016-04-21 10:39:42', 2, NULL, '', '', '', '', 'Ankit', 'Zaveri', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(103, 'Akhil Chopra', '7f4109292ac1aaf86120f7d5917b1006', 'akhilchopra33@gmail.com', 3, '2016-04-23 07:17:48', 2, NULL, '', '', '', '', 'Akhil', 'Chopra', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(104, 'Niraj Mittal', '90461cad0959eefbd16c5034be4a8d68', 'nirajmittalblr@gmail.com', 3, '2016-04-27 09:27:37', 2, NULL, '', '', '', '', 'Niraj', 'Mittal', '', '', 'Bangalore', 'Karnataka', 'India', '', '560001', '', 'Bangalore', 'India', 'Karnataka', '560001', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '109B, Mittal Tower', 'MG Road', 'MG Road', '109B, Mittal Tower', 'MG Road', 'MG Road'),
(105, 'Alok Pandya', '', '', 3, '2016-04-27 17:45:53', 1, 'https://graph.facebook.com/10104015558769913/picture?width=150&height=150', '', '10104015558769913', 'Facebook', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '10104015558769913', '', '', '', ',', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(106, 'Bhavnik Kapadia', '57d3fc024e9c48bc1ab0f29940d20c74', 'bhanakapadia@hotmail.com', 3, '2016-04-30 13:52:54', 2, NULL, '', '', '', '', 'Bhavnik', 'Kapadia', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(107, 'wohlig', 'a63526467438df9566c508027d9cb06b', 'wohlig@wohlig.com', 1, '0000-00-00 00:00:00', 1, 'images_(2)1.jpg', '', '', 'Facebook', '0', 'Imran', 'Patel', '564651251', '', 'uyg', 'fdsc', 'Guadeloupe', '', '78946132', '', 'uyg', 'Guadeloupe', 'fdsc', '78946132', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', 'daugvy', 'vyp', 'g', 'daugvy', 'vyp', 'g'),
(108, 'Mark Trenowden', 'b47bc9c3971a24ddbbfd211d7b692227', 'cricketcurios@aol.com', 3, '2016-05-25 10:15:44', 2, NULL, '', '', '', '', 'Mark', 'Trenowden', '447711306720', '', 'Sevenoaks', 'Kent', 'United Kingdom', '', 'TN13 2LH', '', 'Sevenoaks', 'United Kingdom', 'Kent', 'TN13 2LH', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', 'Copley Dene', '8 Kippington Road', 'Kippington Road', 'Copley Dene', '8 Kippington Road', 'Kippington Road'),
(109, 'Dhruv Mehra', 'c68c110c8c27f5c5c7938be7e93bc350', 'dhruvmehra88@gmail.com', 3, '2016-07-27 09:20:51', 2, NULL, '', '', '', '', 'Dhruv', 'Mehra', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(110, 'Siddharth Bafna', '', 's.s.bafna@gmail.com', 3, '2016-08-09 11:27:40', 1, 'https://lh5.googleusercontent.com/-sD8UnP9Rg6g/AAAAAAAAAAI/AAAAAAAAAXM/HvbmwTPiaJ0/photo.jpg', '', '107118941623632827060', 'Google', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '107118941623632827060', '', '', ',', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(111, 'Ak AnTu', '', '', 3, '2016-10-19 11:16:24', 1, 'https://graph.facebook.com/927855267321247/picture?width=150&height=150', '', '927855267321247', 'Facebook', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '927855267321247', '', '', '', ',', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(112, 'Manjit Bawa', 'e10adc3949ba59abbe56e057f20f883e', 'manjit.bawa@gmail.com', 3, '2016-10-26 11:11:11', 2, NULL, '', '', '', '', 'Manjit', 'Bawa', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(113, 'shaun steele', '2087147e4b6de47a4c63c99fe4e9161e', 'mr.pink.shaun@email.com', 3, '2017-01-02 19:47:42', 2, NULL, '', '', '', '', 'shaun', 'steele', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(114, 'Sajid Khan', '59fa8dac588c074a63c4e27a5dc25633', 'sajidkhanislam@gmail.com', 3, '2017-02-05 21:51:56', 2, NULL, '', '', '', '', 'Sajid', 'Khan', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(115, 'Harsh Thakkar', 'a63526467438df9566c508027d9cb06b', 'harsh.thakkar@wohlig.com', 3, '2017-02-10 11:39:26', 2, NULL, '', '', '', '', 'Harsh', 'Thakkar', '44', '', 'b', 'b', 'Australia', '', 'b', '', 'b', 'Australia', 'b', 'b', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', 'a', 'b', 'b', 'a', 'b', 'b'),
(116, 'CR Salman', '', '', 3, '2017-03-07 16:15:56', 1, 'https://graph.facebook.com/1419852228059847/picture?width=150&height=150', '', '1419852228059847', 'Facebook', '', 'Salman', 'Hashmi', '9870791804', '', 'Mumbai', 'Maharashtra', 'India', '', '400095', '', 'Mumbai', 'India', 'Maharashtra', '400095', '', '', '', '', '', '', '', '', '', 0, '1419852228059847', '', '', '', ',', '', '', '0000-00-00', '', '86', 'Mind Space', 'Goregaon Sporta Club', '86', 'Mind Space', 'Goregaon Sporta Club'),
(117, 'Sana Ullah', '31fd9f7788866b15887debe53a17f518', 'lexac@vps911.net', 3, '2017-03-07 16:24:28', 2, NULL, '', '', '', '', 'Sana', 'Ullah', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(118, 'Sana Ullah', '31fd9f7788866b15887debe53a17f518', 'bajimeh@gamgling.com', 3, '2017-03-07 16:24:56', 2, NULL, '', '', '', '', 'Sana', 'Ullah', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(119, 'Kieran Corbett', 'ff9f6e51d089443978bdb3244f6b27b3', 'corbett2@sky.com', 3, '2017-03-27 10:40:05', 2, NULL, '', '', '', '', 'Kieran', 'Corbett', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(120, 'Kieran Corbett', 'ff9f6e51d089443978bdb3244f6b27b3', 'kc00265@surrey.ac.uk', 3, '2017-03-27 10:42:09', 2, NULL, '', '', '', '', 'Kieran', 'Corbett', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(121, 'Kieran Corbett', 'ff9f6e51d089443978bdb3244f6b27b3', 'kcorbettebay@gmail.com', 3, '2017-03-27 10:42:17', 2, NULL, '', '', 'Email', '0', 'Kieran', 'Corbett', '', '0', '', '', '', '', '', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(122, 'Jason Krejza', '39e9168d778d130a7fa03fc9479ed486', 'jason@elitecricket.com.au', 3, '2017-04-21 03:28:24', 2, NULL, '', '', '', '', 'Jason', 'Krejza', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(123, 'Pradeep Varakantham', '10467e6fb7874a8d371c070ae11887c8', 'pradeep.varakantham@gmail.com', 3, '2017-04-27 06:17:05', 2, NULL, '', '', '', '', 'Pradeep', 'Varakantham', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(124, 'harshad sh', '6609ff57b26ac81c292be239e90bdc46', 'harshad.shirsat@wohlig.com', 3, '2017-05-09 10:52:32', 2, NULL, '', '', '', '', 'harshad', 'sh', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(125, 'harshad sh', '6609ff57b26ac81c292be239e90bdc46', 'harshad.shirsat1@wohlig.com', 3, '2017-05-09 10:52:57', 2, NULL, '', '', '', '', 'harshad', 'sh', '9092674456', '', 'Mumbai', 'Maharashtra', 'India', '', '400101', '', 'Mumbai', 'India', 'Maharashtra', '400101', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', 'a-101', 'Thakur Village', 'Ciname', 'a-101', 'Thakur Village', 'Ciname');

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE IF NOT EXISTS `userlog` (
`id` int(11) NOT NULL,
  `onuser` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `onuser`, `status`, `description`, `timestamp`) VALUES
(1, 1, 1, 'User Address Edited', '2014-05-12 06:50:21'),
(2, 1, 1, 'User Details Edited', '2014-05-12 06:51:43'),
(3, 1, 1, 'User Details Edited', '2014-05-12 06:51:53'),
(4, 4, 1, 'User Created', '2014-05-12 06:52:44'),
(5, 4, 1, 'User Address Edited', '2014-05-12 12:31:48'),
(6, 23, 2, 'User Created', '2014-10-07 06:46:55'),
(7, 24, 2, 'User Created', '2014-10-07 06:48:25'),
(8, 25, 2, 'User Created', '2014-10-07 06:49:04'),
(9, 26, 2, 'User Created', '2014-10-07 06:49:16'),
(10, 27, 2, 'User Created', '2014-10-07 06:52:18'),
(11, 28, 2, 'User Created', '2014-10-07 06:52:45'),
(12, 29, 2, 'User Created', '2014-10-07 06:53:10'),
(13, 30, 2, 'User Created', '2014-10-07 06:53:33'),
(14, 31, 2, 'User Created', '2014-10-07 06:55:03'),
(15, 32, 2, 'User Created', '2014-10-07 06:55:33'),
(16, 33, 2, 'User Created', '2014-10-07 06:59:32'),
(17, 34, 2, 'User Created', '2014-10-07 07:01:18'),
(18, 35, 2, 'User Created', '2014-10-07 07:01:50'),
(19, 34, 2, 'User Details Edited', '2014-10-07 07:04:34'),
(20, 18, 2, 'User Details Edited', '2014-10-07 07:05:11'),
(21, 18, 2, 'User Details Edited', '2014-10-07 07:05:45'),
(22, 18, 2, 'User Details Edited', '2014-10-07 07:06:03'),
(23, 7, 6, 'User Created', '2014-10-17 06:22:29'),
(24, 7, 6, 'User Details Edited', '2014-10-17 06:32:22'),
(25, 7, 6, 'User Details Edited', '2014-10-17 06:32:37'),
(26, 8, 6, 'User Created', '2014-11-15 12:05:52'),
(27, 9, 6, 'User Created', '2014-12-02 10:46:36'),
(28, 9, 6, 'User Details Edited', '2014-12-02 10:47:34'),
(29, 4, 6, 'User Details Edited', '2014-12-03 10:34:49'),
(30, 4, 6, 'User Details Edited', '2014-12-03 10:36:34'),
(31, 4, 6, 'User Details Edited', '2014-12-03 10:36:49'),
(32, 8, 6, 'User Details Edited', '2014-12-03 10:47:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accesslevel`
--
ALTER TABLE `accesslevel`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customize`
--
ALTER TABLE `customize`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customizeorder`
--
ALTER TABLE `customizeorder`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customorder`
--
ALTER TABLE `customorder`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emailer`
--
ALTER TABLE `emailer`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fynx_cart`
--
ALTER TABLE `fynx_cart`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fynx_category`
--
ALTER TABLE `fynx_category`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fynx_color`
--
ALTER TABLE `fynx_color`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fynx_config`
--
ALTER TABLE `fynx_config`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fynx_coupon`
--
ALTER TABLE `fynx_coupon`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fynx_credit`
--
ALTER TABLE `fynx_credit`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fynx_customorderenquiry`
--
ALTER TABLE `fynx_customorderenquiry`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fynx_designer`
--
ALTER TABLE `fynx_designer`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fynx_designs`
--
ALTER TABLE `fynx_designs`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fynx_homeslide`
--
ALTER TABLE `fynx_homeslide`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fynx_newsletter`
--
ALTER TABLE `fynx_newsletter`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fynx_offer`
--
ALTER TABLE `fynx_offer`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fynx_offerproduct`
--
ALTER TABLE `fynx_offerproduct`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fynx_order`
--
ALTER TABLE `fynx_order`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fynx_orderitem`
--
ALTER TABLE `fynx_orderitem`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fynx_product`
--
ALTER TABLE `fynx_product`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fynx_productimage`
--
ALTER TABLE `fynx_productimage`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fynx_relatedproduct`
--
ALTER TABLE `fynx_relatedproduct`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fynx_size`
--
ALTER TABLE `fynx_size`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fynx_sizechart`
--
ALTER TABLE `fynx_sizechart`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fynx_subcategory`
--
ALTER TABLE `fynx_subcategory`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fynx_type`
--
ALTER TABLE `fynx_type`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fynx_useraddress`
--
ALTER TABLE `fynx_useraddress`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fynx_wishlist`
--
ALTER TABLE `fynx_wishlist`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logintype`
--
ALTER TABLE `logintype`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orderstatus`
--
ALTER TABLE `orderstatus`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paymentgateway`
--
ALTER TABLE `paymentgateway`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `relatedproduct`
--
ALTER TABLE `relatedproduct`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `savedesigns`
--
ALTER TABLE `savedesigns`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonial`
--
ALTER TABLE `testimonial`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accesslevel`
--
ALTER TABLE `accesslevel`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=240;
--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `customize`
--
ALTER TABLE `customize`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `customizeorder`
--
ALTER TABLE `customizeorder`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=420;
--
-- AUTO_INCREMENT for table `customorder`
--
ALTER TABLE `customorder`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `emailer`
--
ALTER TABLE `emailer`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `fynx_cart`
--
ALTER TABLE `fynx_cart`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=413;
--
-- AUTO_INCREMENT for table `fynx_category`
--
ALTER TABLE `fynx_category`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `fynx_color`
--
ALTER TABLE `fynx_color`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `fynx_config`
--
ALTER TABLE `fynx_config`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `fynx_coupon`
--
ALTER TABLE `fynx_coupon`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `fynx_credit`
--
ALTER TABLE `fynx_credit`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fynx_customorderenquiry`
--
ALTER TABLE `fynx_customorderenquiry`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `fynx_designer`
--
ALTER TABLE `fynx_designer`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `fynx_designs`
--
ALTER TABLE `fynx_designs`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `fynx_homeslide`
--
ALTER TABLE `fynx_homeslide`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `fynx_newsletter`
--
ALTER TABLE `fynx_newsletter`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `fynx_offer`
--
ALTER TABLE `fynx_offer`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fynx_offerproduct`
--
ALTER TABLE `fynx_offerproduct`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fynx_order`
--
ALTER TABLE `fynx_order`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=273;
--
-- AUTO_INCREMENT for table `fynx_orderitem`
--
ALTER TABLE `fynx_orderitem`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=357;
--
-- AUTO_INCREMENT for table `fynx_product`
--
ALTER TABLE `fynx_product`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=315;
--
-- AUTO_INCREMENT for table `fynx_productimage`
--
ALTER TABLE `fynx_productimage`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=995;
--
-- AUTO_INCREMENT for table `fynx_relatedproduct`
--
ALTER TABLE `fynx_relatedproduct`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1235;
--
-- AUTO_INCREMENT for table `fynx_size`
--
ALTER TABLE `fynx_size`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `fynx_sizechart`
--
ALTER TABLE `fynx_sizechart`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `fynx_subcategory`
--
ALTER TABLE `fynx_subcategory`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `fynx_type`
--
ALTER TABLE `fynx_type`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `fynx_useraddress`
--
ALTER TABLE `fynx_useraddress`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fynx_wishlist`
--
ALTER TABLE `fynx_wishlist`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=78;
--
-- AUTO_INCREMENT for table `logintype`
--
ALTER TABLE `logintype`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `paymentgateway`
--
ALTER TABLE `paymentgateway`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `relatedproduct`
--
ALTER TABLE `relatedproduct`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `savedesigns`
--
ALTER TABLE `savedesigns`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=207;
--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `testimonial`
--
ALTER TABLE `testimonial`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=126;
--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
