-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 31, 2017 at 04:42 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `opentracker`
--

-- --------------------------------------------------------

--
-- Table structure for table `ot_tokens`
--

CREATE TABLE `ot_tokens` (
  `id` bigint(20) NOT NULL,
  `token` varchar(255) CHARACTER SET utf8 NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Contains the list of tokens.';

--
-- Dumping data for table `ot_tokens`
--

INSERT INTO `ot_tokens` (`id`, `token`, `timestamp`) VALUES
(1, '597f3b835d1447.77514346', '2017-07-31 19:45:31'),
(2, '597f3b9d5bfa33.82847053', '2017-07-31 19:45:57'),
(3, '597f3bb201b075.90451030', '2017-07-31 19:46:18'),
(4, '597f3c9561a351.68913767', '2017-07-31 19:50:05');

-- --------------------------------------------------------

--
-- Table structure for table `ot_tokentracks`
--

CREATE TABLE `ot_tokentracks` (
  `id` bigint(20) NOT NULL,
  `tokenId` int(11) NOT NULL,
  `userIP` varchar(20) NOT NULL,
  `userAgent` text NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `requestHeader` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='User Tacks for token';

--
-- Dumping data for table `ot_tokentracks`
--

INSERT INTO `ot_tokentracks` (`id`, `tokenId`, `userIP`, `userAgent`, `timestamp`, `requestHeader`) VALUES
(1, 2, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36', '2017-07-31 19:46:40', '{\"Host\":\"localhost\",\"Connection\":\"keep-alive\",\"Upgrade-Insecure-Requests\":\"1\",\"User-Agent\":\"Mozilla\\/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/59.0.3071.115 Safari\\/537.36\",\"Accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/webp,image\\/apng,*\\/*;q=0.8\",\"Accept-Encoding\":\"gzip, deflate, br\",\"Accept-Language\":\"en-US,en;q=0.8\",\"Cookie\":\"_ga=GA1.1.2002272731.1499062080; TawkConnectionTime=0; __tawkuuid=e::localhost::n6VNYtBXIBFmsPUgqwLZiugUCoUKmrCmWRpNFxuqvClhpxXd4WnDQWVhRmpOf0SH::2; Tawk_588ef4efac3ff41d998e7319=vs24.tawk.to::0; io=1Uygx6zDC1i_5xNiAAAQ; ci_session=a%3A5%3A%7Bs%3A10%3A%22session_id%22%3Bs%3A32%3A%228d8de87a8bdc38b10b7493a7205c42b8%22%3Bs%3A10%3A%22ip_address%22%3Bs%3A3%3A%22%3A%3A1%22%3Bs%3A10%3A%22user_agent%22%3Bs%3A114%3A%22Mozilla%2F5.0+%28Windows+NT+6.1%3B+Win64%3B+x64%29+AppleWebKit%2F537.36+%28KHTML%2C+like+Gecko%29+Chrome%2F59.0.3071.115+Safari%2F537.36%22%3Bs%3A13%3A%22last_activity%22%3Bi%3A1501510531%3Bs%3A9%3A%22user_data%22%3Bs%3A0%3A%22%22%3B%7D733107a1e0e784f9f17be860aa955561591324a9\"}'),
(2, 3, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36', '2017-07-31 19:46:58', '{\"Host\":\"localhost\",\"Connection\":\"keep-alive\",\"Upgrade-Insecure-Requests\":\"1\",\"User-Agent\":\"Mozilla\\/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/59.0.3071.115 Safari\\/537.36\",\"Accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/webp,image\\/apng,*\\/*;q=0.8\",\"Accept-Encoding\":\"gzip, deflate, br\",\"Accept-Language\":\"en-US,en;q=0.8\",\"Cookie\":\"_ga=GA1.1.2002272731.1499062080; TawkConnectionTime=0; __tawkuuid=e::localhost::n6VNYtBXIBFmsPUgqwLZiugUCoUKmrCmWRpNFxuqvClhpxXd4WnDQWVhRmpOf0SH::2; Tawk_588ef4efac3ff41d998e7319=vs24.tawk.to::0; io=1Uygx6zDC1i_5xNiAAAQ; ci_session=a%3A5%3A%7Bs%3A10%3A%22session_id%22%3Bs%3A32%3A%228d8de87a8bdc38b10b7493a7205c42b8%22%3Bs%3A10%3A%22ip_address%22%3Bs%3A3%3A%22%3A%3A1%22%3Bs%3A10%3A%22user_agent%22%3Bs%3A114%3A%22Mozilla%2F5.0+%28Windows+NT+6.1%3B+Win64%3B+x64%29+AppleWebKit%2F537.36+%28KHTML%2C+like+Gecko%29+Chrome%2F59.0.3071.115+Safari%2F537.36%22%3Bs%3A13%3A%22last_activity%22%3Bi%3A1501510531%3Bs%3A9%3A%22user_data%22%3Bs%3A0%3A%22%22%3B%7D733107a1e0e784f9f17be860aa955561591324a9\"}'),
(3, 4, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36', '2017-07-31 19:50:25', '{\"Host\":\"localhost\",\"Connection\":\"keep-alive\",\"Upgrade-Insecure-Requests\":\"1\",\"User-Agent\":\"Mozilla\\/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/59.0.3071.115 Safari\\/537.36\",\"Accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/webp,image\\/apng,*\\/*;q=0.8\",\"Accept-Encoding\":\"gzip, deflate, br\",\"Accept-Language\":\"en-US,en;q=0.8\",\"Cookie\":\"_ga=GA1.1.2002272731.1499062080; TawkConnectionTime=0; __tawkuuid=e::localhost::n6VNYtBXIBFmsPUgqwLZiugUCoUKmrCmWRpNFxuqvClhpxXd4WnDQWVhRmpOf0SH::2; Tawk_588ef4efac3ff41d998e7319=vs24.tawk.to::0; io=1Uygx6zDC1i_5xNiAAAQ; ci_session=a%3A5%3A%7Bs%3A10%3A%22session_id%22%3Bs%3A32%3A%228d8de87a8bdc38b10b7493a7205c42b8%22%3Bs%3A10%3A%22ip_address%22%3Bs%3A3%3A%22%3A%3A1%22%3Bs%3A10%3A%22user_agent%22%3Bs%3A114%3A%22Mozilla%2F5.0+%28Windows+NT+6.1%3B+Win64%3B+x64%29+AppleWebKit%2F537.36+%28KHTML%2C+like+Gecko%29+Chrome%2F59.0.3071.115+Safari%2F537.36%22%3Bs%3A13%3A%22last_activity%22%3Bi%3A1501510531%3Bs%3A9%3A%22user_data%22%3Bs%3A0%3A%22%22%3B%7D733107a1e0e784f9f17be860aa955561591324a9\"}');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ot_tokens`
--
ALTER TABLE `ot_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`);

--
-- Indexes for table `ot_tokentracks`
--
ALTER TABLE `ot_tokentracks`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ot_tokens`
--
ALTER TABLE `ot_tokens`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `ot_tokentracks`
--
ALTER TABLE `ot_tokentracks`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
