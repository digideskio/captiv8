-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 11, 2015 at 06:05 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `captiv8`
--
CREATE DATABASE IF NOT EXISTS `captiv8` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `captiv8`;

-- --------------------------------------------------------

--
-- Table structure for table `education`
--

CREATE TABLE IF NOT EXISTS `education` (
  `e_id` int(11) NOT NULL AUTO_INCREMENT,
  `school_name` text NOT NULL,
  `degree` text,
  `started` text,
  `finished` text,
  `is_current` text NOT NULL,
  `forwhom` varchar(25) NOT NULL,
  PRIMARY KEY (`e_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `education`
--

INSERT INTO `education` (`e_id`, `school_name`, `degree`, `started`, `finished`, `is_current`, `forwhom`) VALUES
(1, 'Nettleton High School (Arkansas)', NULL, '2012', '2014', 'true', 'nolvorite');

-- --------------------------------------------------------

--
-- Table structure for table `friend_limbo`
--

CREATE TABLE IF NOT EXISTS `friend_limbo` (
  `user1` int(11) NOT NULL,
  `user2` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `fl_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`fl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE IF NOT EXISTS `images` (
  `img_id` int(11) NOT NULL AUTO_INCREMENT,
  `img_name` varchar(30) NOT NULL,
  `url_hash` varchar(25) NOT NULL,
  `image_blob` longblob NOT NULL,
  PRIMARY KEY (`img_id`),
  UNIQUE KEY `url_hash` (`url_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
  `n_id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(100) NOT NULL,
  `url` varchar(110) NOT NULL,
  `towhom` varchar(25) DEFAULT NULL,
  `stamptime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`n_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=72 ;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`n_id`, `content`, `url`, `towhom`, `stamptime`, `status`) VALUES
(1, '<a href=''index.php?profile=nerd''>nerd</a> replied to your thread: Test post', 'index.php?thread_view=_2852f12123', 'nolvorite', '2014-12-17 22:06:46', 1),
(2, '<a href=''index.php?profile=nerd''>nerd</a> replied to your comment: Test post', 'index.php?comment=c4fd398dd2', 'nolvorite', '2014-12-17 22:15:46', 1),
(3, '<a href=''index.php?profile=nolvorite''>nolvorite</a> replied to your thread: ', 'index.php?comment=4b60367874', 'nerd', '2014-12-28 15:47:55', 1),
(4, '<a href=''index.php?profile=nolvorite''>nolvorite</a> replied to your comment: Okay this should be the', 'index.php?comment=e1ba3e6d1b', 'nerd', '2014-12-28 16:03:14', 1),
(5, '<a href=''index.php?profile=nolvorite''>nolvorite</a> replied to your thread: ', 'index.php?comment=3f8dbdee7a', 'nerd', '2014-12-28 16:06:11', 1),
(6, '<a href=''index.php?profile=nolvorite''>nolvorite</a> replied to your comment: ', 'index.php?comment=bb106a0ebc', 'nerd', '2014-12-28 16:07:07', 1),
(7, '<a href=''index.php?profile=nerd''>nerd</a> replied to your comment: ', 'index.php?comment=354fd07a14', 'nerd', '2014-12-28 16:08:33', 1),
(8, '<a href=''index.php?profile=nolvorite''>nolvorite</a> replied to your comment: ', 'index.php?comment=be805506ae', 'nerd', '2014-12-28 16:09:26', 1),
(9, '<a href=''index.php?profile=nerd''>nerd</a> replied to your comment: Okay this should be the charm', 'index.php?comment=237aba4b41', 'nerd', '2014-12-28 16:10:32', 1),
(10, '<a href=''index.php?profile=nolvorite''>nolvorite</a> replied to your comment: Okay this should be the', 'index.php?comment=d04238e820', 'nerd', '2014-12-28 16:12:13', 1),
(11, '<a href=''index.php?profile=nolvorite''>nolvorite</a> replied to your comment: And for legitimacy...', 'index.php?comment=0809dfc8da', 'nolvorite', '2014-12-28 16:57:12', 1),
(12, '<a href=''index.php?profile=nolvorite''>nolvorite</a> replied to your comment: And for legitimacy...', 'index.php?comment=19a06a3c85', 'nolvorite', '2014-12-28 16:57:42', 1),
(13, '<a href=''index.php?profile=nolvorite''>nolvorite</a> replied to your comment: And for legitimacy...', 'index.php?comment=5da50d3f9f', 'nolvorite', '2014-12-28 16:59:11', 1),
(14, '<a href=''index.php?profile=nolvorite''>nolvorite</a> replied to your comment: And for legitimacy...', 'index.php?comment=a56328b3b9', 'nolvorite', '2014-12-28 17:00:51', 1),
(15, '<a href=''index.php?profile=nolvorite''>nolvorite</a> replied to your comment: Again.', 'index.php?comment=6292754060', 'nolvorite', '2014-12-28 18:27:20', 1),
(16, '<span>nerd</span> replied to your comment: And for legitimacy...', 'index.php?comment=6a05952fa0', 'nolvorite', '2015-01-03 12:49:08', 1),
(17, '<span>nerd</span> replied to your comment: And for legitimacy...', 'index.php?comment=6a05952fa0', 'nolvorite', '2015-01-13 16:39:57', 1),
(18, '<span>nerd</span> replied to your comment: And for legitimacy...', 'index.php?comment=6a05952fa0', 'nolvorite', '2015-01-13 16:40:44', 1),
(19, '<span>nolvorite</span> replied to your thread: ', 'index.php?thread_view=ayy_lmao_195cebf849', 'nolvorite', '2015-01-14 16:44:52', 1),
(20, '<span>nerd</span> replied to your thread: ', 'index.php?thread_view=Try_posting_maybe__5848a6eca2', 'nerd', '2015-01-14 16:50:00', 1),
(21, '<span>nolvorite</span> replied to your thread: ', 'index.php?comment=780864e2e5', 'nerd', '2015-01-14 22:17:03', 1),
(22, '<span>nerd</span> replied to your thread: ', 'index.php?comment=4a08768802', 'nolvorite', '2015-01-14 22:40:25', 1),
(23, '<span>nolvorite</span> replied to your thread: ', 'index.php?comment=f4f3a6275f', 'nerd', '2015-01-14 22:49:44', 1),
(24, '<span>nolvorite</span> replied to your thread: ', 'index.php?comment=817d6531cc', 'nerd', '2015-01-14 22:50:55', 1),
(25, '<span>nolvorite</span> replied to your thread: ', 'index.php?comment=c1a46e0b82', 'nerd', '2015-01-14 22:51:32', 1),
(26, '<span>nolvorite</span> replied to your thread: ', 'index.php?comment=c1a46e0b82', 'nerd', '2015-01-14 22:54:24', 1),
(27, '<span>nolvorite</span> replied to your thread: ', 'index.php?comment=f8405d7ed0', 'nerd', '2015-01-14 22:59:18', 1),
(28, '<span>nolvorite</span> replied to your thread: ', 'index.php?comment=060517c759', 'nerd', '2015-01-14 23:09:32', 1),
(29, '<span>nolvorite</span> replied to your thread: ', 'index.php?comment=ddc7ee2624', 'nerd', '2015-01-14 23:09:57', 1),
(30, '<span>nolvorite</span> replied to your thread: Testing for roots', 'index.php?comment=449c7e90d8', 'nerd', '2015-01-14 23:15:22', 1),
(31, '<span>nolvorite</span> replied to your thread: Testing for roots', 'index.php?comment=b9d4c32cf2', 'nerd', '2015-01-14 23:16:54', 1),
(32, '<span>nolvorite</span> replied to your thread: Testing for roots', 'index.php?comment=bd09eb3222', 'nerd', '2015-01-14 23:17:56', 1),
(33, '<span>nolvorite</span> replied to your thread: Testing for roots', 'index.php?comment=bd09eb3222', 'nerd', '2015-01-15 01:00:45', 1),
(34, '<span>nolvorite</span> replied to your thread: Testing for roots', 'index.php?comment=bd09eb3222', 'nerd', '2015-01-15 01:01:27', 1),
(35, '<span>nolvorite</span> replied to your thread: Testing for roots', 'index.php?comment=bd09eb3222', 'nerd', '2015-01-15 01:02:02', 1),
(36, '<span>nolvorite</span> replied to your thread: Testing for roots', 'index.php?comment=bd09eb3222', 'nerd', '2015-01-15 01:03:22', 1),
(37, '<span>nolvorite</span> replied to your thread: This is an oddity.', 'index.php?comment=2bf8e7b8dc', 'nerd', '2015-01-16 19:52:23', 1),
(38, '<span>nolvorite</span> replied to your thread: This is an oddity.', 'index.php?comment=f71c8ee8b2', 'nerd', '2015-01-16 20:17:07', 1),
(39, '<span>nolvorite</span> replied to your thread: This is an oddity.', 'index.php?comment=f165cf5fbd', 'nerd', '2015-01-16 20:43:34', 1),
(40, '<span>nolvorite</span> replied to your thread: This is an oddity.', 'index.php?comment=c6b9fce8dd', 'nerd', '2015-01-16 20:46:21', 1),
(41, '<span>nerd</span> replied to your thread: Test comments', 'index.php?comment=ee8ef680fd', 'nolvorite', '2015-01-16 22:00:27', 1),
(42, '<span>nerd</span> replied to your thread: Test comments', 'index.php?comment=5fe700ab5d', 'nolvorite', '2015-01-16 22:05:08', 1),
(43, '<span>nerd</span> replied to your thread: Test comments', 'index.php?comment=b89293fc95', 'nolvorite', '2015-01-16 22:08:02', 1),
(44, '<span>nolvorite</span> replied to your thread: Testing', 'index.php?comment=7c7058d976', 'nerd', '2015-01-16 23:12:15', 1),
(45, '<span>nolvorite</span> replied to your thread: Testing', 'index.php?comment=25a311e103', 'nerd', '2015-01-16 23:12:58', 1),
(46, '<span>nolvorite</span> replied to your thread: Testing', 'index.php?comment=257132d8d0', 'nerd', '2015-01-16 23:21:27', 1),
(47, '<span>nolvorite</span> replied to your thread: Testing', 'index.php?comment=ada8c3b239', 'nerd', '2015-01-16 23:23:15', 1),
(48, '<span>nolvorite</span> replied to your thread: Testing', 'index.php?comment=0285d324b6', 'nerd', '2015-01-16 23:34:04', 1),
(49, '<span>nolvorite</span> replied to your thread: Testing', 'index.php?comment=f10e239aa9', 'nerd', '2015-01-16 23:37:24', 1),
(50, '<span>nolvorite</span> replied to your thread: Testing', 'index.php?comment=a7d014d820', 'nerd', '2015-01-16 23:38:11', 1),
(51, '<span>nolvorite</span> replied to your thread: Testing', 'index.php?comment=943e87d80c', 'nerd', '2015-01-16 23:38:38', 1),
(52, '<span>nolvorite</span> replied to your thread: So, topics work, but not repli', 'index.php?comment=a44ed9c807', 'nerd', '2015-01-17 21:11:42', 1),
(53, '<span>nolvorite</span> replied to your thread: So, topics work, but not repli', 'index.php?comment=a44ed9c807', 'nerd', '2015-01-17 21:31:43', 1),
(54, '<span>nolvorite</span> replied to your thread: So, topics work, but not repli', 'index.php?comment=6105b381e8', 'nerd', '2015-01-17 21:33:22', 1),
(55, '<span>nolvorite</span> replied to your thread: So, topics work, but not repli', 'index.php?comment=6105b381e8', 'nerd', '2015-01-17 21:34:57', 1),
(56, '<span>nolvorite</span> replied to your thread: So, topics work, but not repli', 'index.php?comment=6105b381e8', 'nerd', '2015-01-17 21:35:42', 1),
(57, '<span>nolvorite</span> replied to your thread: So, topics work, but not repli', 'index.php?comment=c411fad9f7', 'nerd', '2015-01-17 21:37:39', 1),
(58, '<span>nerd</span> replied to your thread: Get it right the first time', 'index.php?comment=f8453f2156', 'nolvorite', '2015-01-18 15:53:45', 1),
(59, '<span>nolvorite</span> replied to your thread: So, topics work, but not repli', 'index.php?comment=c411fad9f7', 'nerd', '2015-01-20 14:05:23', 1),
(60, '<span>nolvorite</span> replied to your thread: So, topics work, but not repli', 'index.php?comment=556d33057d', 'nerd', '2015-01-20 14:07:03', 1),
(61, '<span>nolvorite</span> replied to your thread: So, topics work, but not repli', 'index.php?comment=c88006f125', 'nerd', '2015-01-20 14:08:03', 1),
(62, '<span>nolvorite</span> replied to your thread: GAH! Man seriously', 'index.php?comment=fccff8fa5c', 'nerd', '2015-01-20 14:27:46', 1),
(63, '<span>nolvorite</span> replied to your thread: GAH! Man seriously', 'index.php?comment=6f6bb8f808', 'nerd', '2015-01-20 14:28:39', 1),
(64, '<span>nolvorite</span> replied to your thread: GAH! Man seriously', 'index.php?comment=8ad9ee1e2c', 'nerd', '2015-01-20 14:29:40', 1),
(65, '<span>nolvorite</span> replied to your thread: GAH! Man seriously', 'index.php?comment=8ad9ee1e2c', 'nerd', '2015-01-20 14:32:41', 1),
(66, '<span>nolvorite</span> replied to your thread: GAH! Man seriously', 'index.php?comment=8ad9ee1e2c', 'nerd', '2015-01-20 14:33:25', 1),
(67, '<span>nolvorite</span> replied to your thread: GAH! Man seriously', 'index.php?comment=6be69388e9', 'nerd', '2015-01-20 14:35:16', 1),
(68, '<span>nolvorite</span> replied to your thread: GAH! Man seriously', 'index.php?comment=6ff4c2d0d6', 'nerd', '2015-01-20 14:36:29', 1),
(69, '<span>nolvorite</span> replied to your thread: GAH! Man seriously', 'index.php?comment=4a3989a1de', 'nerd', '2015-01-20 14:42:17', 1),
(70, '<span>nerd</span> replied to your comment: Zing', 'index.php?comment=e71dbf868d', 'nolvorite', '2015-01-20 14:44:50', 1),
(71, '<span>nolvorite</span> replied to your comment: mhm', 'index.php?comment=d58bf47356', 'nerd', '2015-01-27 17:43:57', 1);

-- --------------------------------------------------------

--
-- Table structure for table `polls`
--

CREATE TABLE IF NOT EXISTS `polls` (
  `post_id_root` int(11) NOT NULL,
  `value` varchar(100) NOT NULL,
  `data_id` int(11) NOT NULL AUTO_INCREMENT,
  `define_set` varchar(20) NOT NULL,
  `votes` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`data_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=89 ;

--
-- Dumping data for table `polls`
--

INSERT INTO `polls` (`post_id_root`, `value`, `data_id`, `define_set`, `votes`) VALUES
(84, 'To be or not to be...', 59, 'question', 0),
(84, 'true', 60, 'choice_selection', 0),
(84, 'false', 61, 'choice_addition', 0),
(84, 'Or is it?', 62, 'poll_choice', 0),
(84, 'Is the question.', 63, 'poll_choice', 0),
(85, 'To be or not to be...', 64, 'question', 0),
(85, 'true', 65, 'choice_selection', 0),
(85, 'false', 66, 'choice_addition', 0),
(85, '...Or is it?', 67, 'poll_choice', 0),
(85, 'Is the question.', 68, 'poll_choice', 0),
(88, 'To be or not to be...', 69, 'question', 0),
(88, 'true', 70, 'choice_selection', 0),
(88, 'false', 71, 'choice_addition', 0),
(88, '...Or is it?', 72, 'poll_choice', 1),
(88, 'Is the question.', 73, 'poll_choice', 1),
(89, 'Test poll question', 74, 'question', 0),
(89, 'true', 75, 'choice_selection', 0),
(89, 'true', 76, 'choice_addition', 0),
(89, '3 and 4', 77, 'poll_choice', 0),
(89, '1 and 2', 78, 'poll_choice', 2),
(138, 'Do animals have legs?', 79, 'question', 0),
(138, 'true', 80, 'choice_selection', 0),
(138, 'false', 81, 'choice_addition', 0),
(138, 'Are they more like, limbs?', 82, 'poll_choice', 2),
(138, 'Depends.', 83, 'poll_choice', 0),
(164, 'Humina humina humina', 84, 'question', 0),
(164, 'true', 85, 'choice_selection', 0),
(164, 'false', 86, 'choice_addition', 0),
(164, 'POW! Right in the kisser!', 87, 'poll_choice', 1),
(164, 'POW!', 88, 'poll_choice', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pollvotes_q`
--

CREATE TABLE IF NOT EXISTS `pollvotes_q` (
  `bywhom` varchar(25) NOT NULL,
  `timeof` datetime NOT NULL,
  `choice_id` int(11) NOT NULL,
  `which_poll` int(11) NOT NULL,
  `vote_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`vote_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `pollvotes_q`
--

INSERT INTO `pollvotes_q` (`bywhom`, `timeof`, `choice_id`, `which_poll`, `vote_id`) VALUES
('nolvorite', '2014-12-14 15:03:32', 78, 89, 5),
('nolvorite', '2014-12-14 16:10:10', 72, 88, 6),
('nolvorite', '2014-12-14 15:03:32', 78, 89, 8),
('nerd', '2014-12-17 15:46:35', 78, 89, 9),
('nerd', '2014-12-17 15:46:41', 73, 88, 10),
('nolvorite', '2014-12-19 11:09:49', 82, 138, 11),
('nerd', '2015-01-03 13:19:52', 82, 138, 12),
('nolvorite', '2015-01-14 22:47:39', 87, 164, 13),
('nerd', '2015-01-14 23:57:15', 88, 164, 14);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `content` varchar(15000) DEFAULT NULL,
  `cnttype` int(11) NOT NULL,
  `forwhom` text NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `postid` int(11) NOT NULL AUTO_INCREMENT,
  `stamptime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bywhom` text NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `thread_nick` varchar(50) DEFAULT NULL,
  `topic_hash` varchar(10) DEFAULT NULL,
  `settings` int(11) NOT NULL DEFAULT '1',
  `thread_id` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `upvotes` int(11) DEFAULT '1',
  `downvotes` int(11) DEFAULT '0',
  `is_read` int(11) DEFAULT NULL,
  PRIMARY KEY (`postid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=341 ;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`content`, `cnttype`, `forwhom`, `parent`, `postid`, `stamptime`, `bywhom`, `title`, `thread_nick`, `topic_hash`, `settings`, `thread_id`, `level`, `upvotes`, `downvotes`, `is_read`) VALUES
('...Even explain it in detail, if you like!', 1, 'self', 0, 5, '2014-11-24 00:58:31', 'nolvorite', 'Thoughts you might have right now, post it here!', 'Thoughts_you_might_have_right_now__post_it_here_', '276e6b7e1e', 1, NULL, NULL, 1, 0, NULL),
('...Even explain it in detail, if you like!', 1, 'self', 0, 6, '2014-11-24 03:06:39', 'nolvorite', 'Thoughts you might have right now, post it here!', 'Thoughts_you_might_have_right_now__post_it_here_', 'b5a74135ed', 1, NULL, NULL, 1, 0, NULL),
('...Even explain it in detail, if you like!', 1, 'self', 0, 7, '2014-11-24 03:08:43', 'nolvorite', 'Thoughts you might have right now, post it here!', 'Thoughts_you_might_have_right_now__post_it_here_', 'bf67b81029', 1, NULL, NULL, 1, 0, NULL),
('...Even explain it in detail, if you like!', 1, 'self', 0, 8, '2014-11-24 03:09:40', 'nolvorite', 'Thoughts you might have right now, post it here!', 'Thoughts_you_might_have_right_now__post_it_here_', '8edaae084a', 1, NULL, NULL, 1, 0, NULL),
('...Even explain it in detail, if you like!', 1, 'self', 0, 9, '2014-11-24 03:11:58', 'nolvorite', 'Thoughts you might have right now, post it here!', 'Thoughts_you_might_have_right_now__post_it_here_', 'f3cf520162', 1, NULL, NULL, 1, 0, NULL),
('...Even explain it in detail, if you like!', 1, 'self', 0, 10, '2014-11-24 03:24:44', 'nolvorite', 'Thoughts you might have right now, post it here!', 'Thoughts_you_might_have_right_now__post_it_here_', '7aa3b7e43d', 1, NULL, NULL, 1, 0, NULL),
('...Checkmate, Kierkegaard!', 1, 'self', 0, 11, '2014-11-24 05:33:06', 'nolvorite', 'Morality don''t real without STEM', 'Morality_don__t_real_without_STEM', '0eeef9e370', 1, NULL, NULL, 1, 0, NULL),
('something for breakfast', 1, 'self', 0, 12, '2014-11-24 05:35:35', 'nolvorite', 'I ate', 'I_ate', 'd8b7e25aab', 1, NULL, NULL, 1, 0, NULL),
('''; SELECT FROM', 1, 'self', 0, 13, '2014-11-24 05:39:57', 'nolvorite', 'Hmm....', 'Hmm____', '52335748c5', 1, NULL, NULL, 1, 0, NULL),
('Nope', 1, 'self', 0, 14, '2014-11-24 05:42:18', 'nolvorite', 'I...asda', 'I___asda', '827dfd66eb', 1, NULL, NULL, 1, 0, NULL),
('nope', 1, 'self', 0, 15, '2014-11-24 05:42:30', 'nolvorite', 'I....', 'I____', '9e340cf9a9', 1, NULL, NULL, 1, 0, NULL),
('Last spam!', 1, 'self', 0, 16, '2014-11-24 05:43:13', 'nolvorite', 'Last spam', 'Last_spam', 'f7e4ec6ec5', 1, NULL, NULL, 1, 0, NULL),
('Hmm...', 1, 'self', 0, 17, '2014-11-25 01:32:44', 'nolvorite', 'Hmm', 'Hmm', '52aa06291f', 1, NULL, NULL, 1, 0, NULL),
('...Even explain it in detail, if you like!', 1, 'self', 0, 18, '2014-11-25 01:33:55', 'nolvorite', 'Thoughts you might have right now, post it here!', 'Thoughts_you_might_have_right_now__post_it_here_', 'e14c192c90', 1, NULL, NULL, 1, 0, NULL),
('And again', 1, 'self', 0, 19, '2014-11-25 01:48:31', 'nolvorite', 'Test again&gt;', 'Test_again_gt_', 'dd52dd2c10', 1, NULL, NULL, 1, 0, NULL),
('this time, test a comment.', 2, 'n-a', 19, 21, '2014-11-25 01:59:34', 'nolvorite', '', '', '5ee3311f2f', 1, 19, NULL, 1, 0, NULL),
('...Even explain it in detail, if you like!', 1, 'self', 0, 22, '2014-11-27 04:46:32', 'nolvorite', '////xdsd', '____xdsd', '7c42424563', 1, NULL, NULL, 1, 0, NULL),
('tttt', 1, 'self', 0, 23, '2014-11-27 05:10:53', 'nolvorite', 'ttt', 'ttt', '98738252a4', 1, NULL, NULL, 1, 0, NULL),
('Reply to this comment... Ergo, comment on this comment.', 2, 'n-a', 21, 24, '2014-11-27 05:21:53', 'nolvorite', 'Comments', 'Comments', '5db884b51d', 1, 19, NULL, 1, 0, NULL),
('Reply to this comment... Ergo, comment on this comment.', 2, 'n-a', 21, 25, '2014-11-27 14:59:35', 'nolvorite', 'Comments', 'Comments', '9fe4de9981', 1, 19, NULL, 1, 0, NULL),
('test', 2, 'n-a', 21, 26, '2014-11-27 15:13:53', 'nolvorite', 'Comments', 'Comments', 'ec1d24a3f1', 1, NULL, NULL, 1, 0, NULL),
('whyyyyyyy', 2, 'n-a', 21, 27, '2014-11-27 15:52:55', 'nolvorite', 'Comments', 'Comments', 'ef5abae8b2', 1, 19, NULL, 1, 0, NULL),
('nooooooooooo try this', 2, 'n-a', 21, 28, '2014-11-27 15:54:38', 'nolvorite', 'Comments', 'Comments', 'e93bbb26e9', 1, 19, NULL, 1, 0, NULL),
('...Even explain it in detail, if you like!', 1, 'self', 0, 29, '2014-11-27 17:25:44', 'nolvorite', 'asdasda', 'asdasda', 'c25120cea5', 1, NULL, NULL, 1, 0, NULL),
('Test', 2, 'n-a', 28, 30, '2014-11-27 21:52:33', 'nolvorite', 'Comments', 'Comments', '61e12ccd6e', 1, 19, NULL, 1, 0, NULL),
('Level 2', 2, 'n-a', 27, 31, '2014-11-27 21:56:08', 'nolvorite', 'Comments', 'Comments', '40ad952f57', 1, 19, NULL, 1, 0, NULL),
('Level 3', 2, 'n-a', 31, 32, '2014-11-27 21:56:25', 'nolvorite', 'Comments', 'Comments', 'd112d60de6', 1, 19, NULL, 1, 0, NULL),
('Testing for comment-generations', 2, 'n-a', 30, 33, '2014-11-28 19:06:56', 'nolvorite', 'Comments', 'Comments', 'b49694ad68', 1, 19, NULL, 1, 0, NULL),
('test', 2, 'n-a', 19, 34, '2014-11-28 19:45:43', 'nolvorite', '', '', '494a456d05', 1, 19, NULL, 1, 0, NULL),
('Reply to this comment... Ergo, comment on this comment.', 2, 'n-a', 28, 35, '2014-11-28 21:19:01', 'nolvorite', 'Comments', 'Comments', 'acf8ac4cf4', 1, 19, NULL, 1, 0, NULL),
('another one', 2, 'n-a', 33, 36, '2014-11-30 00:51:41', 'nolvorite', 'Comments', 'Comments', '383780840c', 1, 19, NULL, 1, 0, NULL),
('last comment generation to boot?', 2, 'n-a', 36, 37, '2014-11-30 04:50:18', 'nolvorite', 'Comments', 'Comments', '1974971f18', 1, 19, NULL, 1, 0, NULL),
('test last comment generation?', 2, 'n-a', 36, 38, '2014-11-30 04:51:19', 'nolvorite', 'Comments', 'Comments', '0aadae2602', 1, 19, NULL, 1, 0, NULL),
('test once and never again', 2, 'n-a', 36, 39, '2014-11-30 08:33:37', 'nolvorite', 'Comments', 'Comments', '6a334ce691', 1, 19, NULL, 1, 0, NULL),
('#2', 2, 'n-a', 28, 40, '2014-12-01 04:13:42', 'nolvorite', 'Comments', 'Comments', '2480d5875c', 1, 19, NULL, 1, 0, NULL),
('oh dear God pleaaaaaaase', 2, 'n-a', 39, 41, '2014-12-01 07:52:53', 'nolvorite', 'Comments', 'Comments', '482cd668fa', 1, 19, NULL, 1, 0, NULL),
('I am actually essentially done with the posting system\r\nMy god there''s just been too much wasted time man', 1, 'self', 0, 42, '2014-12-01 08:50:53', 'nolvorite', 'Hallelujah', 'Hallelujah', '67b5de8682', 1, NULL, NULL, 1, 0, NULL),
('Test for line breaks....', 2, 'n-a', 42, 43, '2014-12-01 09:02:23', 'nolvorite', '', '', '77ecd433bf', 1, 42, NULL, 1, 0, NULL),
('Whoops\r\nNow test for em''', 2, 'n-a', 42, 44, '2014-12-01 09:02:36', 'nolvorite', '', '', 'c8b644d746', 1, 42, NULL, 1, 0, NULL),
('Test\r\nfor\r\nline breaks', 2, 'n-a', 43, 45, '2014-12-01 09:04:34', 'nolvorite', 'Comments', 'Comments', '778d2a3089', 1, 42, NULL, 1, 0, NULL),
('Test now\r\n...? omg', 2, 'n-a', 45, 46, '2014-12-01 09:06:20', 'nolvorite', 'Comments', 'Comments', 'ada1f15197', 1, 42, NULL, 1, 0, NULL),
('Test\r\nline breaks\r\n\r\nnow!', 2, 'n-a', 42, 47, '2014-12-01 23:35:23', 'nolvorite', '', '', 'ae0e475f7d', 1, 42, NULL, 1, 0, NULL),
('Test line breaks\r<br>\r<br>gr\r<br>gr', 2, 'n-a', 42, 48, '2014-12-01 23:36:48', 'nolvorite', '', '', '503bf27d09', 1, 42, NULL, 1, 0, NULL),
('Check for the new safe string comparison...?', 2, 'n-a', 42, 49, '2014-12-01 23:55:09', 'nolvorite', '', '', '323ac6e5e8', 1, 42, NULL, 1, 0, NULL),
('noobs', 1, 'self', 0, 50, '2014-12-02 08:47:46', 'nolvorite', 'Noobs', 'Noobs', 'da582833ad', 1, NULL, NULL, 1, 0, NULL),
('Test!!!!\r<br>Yes', 1, 'self', 0, 51, '2014-12-02 19:35:08', 'nolvorite', 'Test', 'Test', '4a6d4eacbc', 1, NULL, NULL, 1, 0, NULL),
(' ', 1, 'self', 0, 52, '2014-12-02 20:22:46', 'nolvorite', 'Hmm', 'Hmm', '69775851ce', 1, NULL, NULL, 1, 0, NULL),
('...Even explain it in detail, if you like!', 1, 'self', 0, 53, '2014-12-02 21:39:35', 'nolvorite', 'Thoughts you might have right now, post it here!', 'Thoughts_you_might_have_right_now__post_it_here_', '9299c3b5ef', 1, NULL, NULL, 1, 0, NULL),
('...Even explain it in detail, if you like!', 1, 'self', 0, 54, '2014-12-02 21:47:31', 'nolvorite', 'Testing em'' now', 'Testing_em___now', '8a5723ec91', 1, NULL, NULL, 1, 0, NULL),
(' ', 1, 'self', 0, 55, '2014-12-02 21:48:04', 'nolvorite', 'And again', 'And_again', 'fdf02221ab', 1, NULL, NULL, 1, 0, NULL),
('Hmm', 1, 'self', 0, 56, '2014-12-03 02:25:29', 'nolvorite', 'Hmm', 'Hmm', '09a0f5e1fc', 1, NULL, NULL, 1, 0, NULL),
('Now?', 1, 'self', 0, 57, '2014-12-03 02:42:34', 'nolvorite', 'Try this?', 'Try_this_', '04def5aa86', 1, NULL, NULL, 1, 0, NULL),
('hmm hmm hmm', 1, 'self', 0, 58, '2014-12-03 03:07:15', 'nolvorite', 'Test for timezone adjustment', 'Test_for_timezone_adjustment', '25b8e1f905', 1, NULL, NULL, 1, 0, NULL),
('hmm', 1, 'self', 0, 59, '2014-12-04 01:25:26', 'nolvorite', 'New post btw', 'New_post_btw', '22498c2aff', 1, NULL, NULL, 1, 0, NULL),
('repluuuuu', 1, 'self', 0, 60, '2014-12-04 01:37:30', 'nolvorite', 'test ', 'test_', '120ffce301', 1, NULL, NULL, 1, 0, NULL),
('One flips out, and then they both do. (yu-gi-oh joke--ikr)', 1, 'self', 0, 61, '2014-12-04 01:43:05', 'nolvorite', '(One-liner) [Two Penguin Soldiers meet in a bar.]', '_One-liner___Two_Penguin_Soldiers_meet_in_a_bar__', '1ff77ba424', 1, NULL, NULL, 1, 1, NULL),
('Muchacha!', 1, 'self', 0, 62, '2014-12-05 01:55:01', 'nolvorite', 'Muchacho', 'Muchacho', 'e6c64e50b1', 1, NULL, NULL, 1, 1, NULL),
('Sigh... with a poll. again. soz', 1, 'self', 0, 88, '2014-12-08 01:22:44', 'nolvorite', 'Test question', 'Test_question', '6845525f04', 1, NULL, NULL, 2, 0, NULL),
('I swear right', 1, 'self', 0, 89, '2014-12-08 01:24:52', 'nolvorite', 'Soz....', 'Soz____', 'a1f4d23957', 1, NULL, NULL, 1, 1, NULL),
('Test post', 1, 'self', 0, 90, '2014-12-12 19:46:39', 'nolvorite', 'Test post', 'Test_post', '19adda3671', 1, NULL, NULL, 1, 0, NULL),
('Replyyyy', 2, 'n-a', 90, 91, '2014-12-15 03:16:15', 'nolvorite', '', '', 'bba3a58208', 1, 90, NULL, 1, 0, NULL),
('And again', 2, 'n-a', 91, 92, '2014-12-15 03:16:23', 'nolvorite', 'Comments', 'Comments', 'bb3e86f54d', 1, 90, NULL, 1, 0, NULL),
('Test', 1, 'self', 0, 94, '2014-12-15 04:19:23', 'nerd', 'Test reply', 'Test_reply', 'ff834e9252', 1, NULL, NULL, 1, 0, NULL),
('Idiot', 2, 'n-a', 90, 95, '2014-12-15 04:30:22', 'nerd', '', '', '2780b57e60', 1, 90, NULL, 1, 0, NULL),
('Test again?', 2, 'n-a', 90, 96, '2014-12-15 04:33:12', 'nerd', '', '', '1fe92b7e54', 1, 90, NULL, 1, 0, NULL),
('Yes', 2, 'n-a', 96, 97, '2014-12-15 04:42:30', 'nerd', 'Comments', 'Comments', 'e8fc7cd6ad', 1, 90, NULL, 1, 0, NULL),
('Jmmm', 2, 'n-a', 97, 98, '2014-12-15 04:45:17', 'nolvorite', 'Comments', 'Comments', '76dd0f2cdb', 1, 90, NULL, 1, 0, NULL),
('Test', 2, 'n-a', 90, 99, '2014-12-15 04:50:28', 'nerd', '', '', 'd2ee2bb9ca', 1, 90, NULL, 1, 0, NULL),
('Hmmm....', 2, 'n-a', 90, 100, '2014-12-15 04:53:20', 'nerd', '', '', 'eff7fb6aa9', 1, 90, NULL, 1, 0, NULL),
('Text', 1, 'self', 0, 101, '2014-12-15 04:56:11', 'nerd', 'Text', 'Text', 'a81b31bbcd', 1, NULL, NULL, 1, 0, NULL),
('Text', 2, 'n-a', 101, 102, '2014-12-15 04:56:18', 'nerd', '', '', 'bd4603950f', 1, 101, NULL, 1, 0, NULL),
('Test', 2, 'n-a', 90, 103, '2014-12-15 04:56:41', 'nerd', '', '', '58d1e6cbcd', 1, 90, NULL, 1, 0, NULL),
('Hmm....', 2, 'n-a', 101, 104, '2014-12-15 05:06:18', 'nolvorite', '', '', 'fa79cf8b24', 1, 101, NULL, 1, 0, NULL),
('Test', 2, 'n-a', 90, 105, '2014-12-15 05:11:14', 'nolvorite', '', '', '705e00bf5d', 1, 90, NULL, 1, 0, NULL),
('TO BE OR NOT TO BE', 2, 'n-a', 90, 106, '2014-12-15 05:17:57', 'nolvorite', '', '', 'e87c71dd12', 1, 90, NULL, 1, 0, NULL),
('Tesssdsdsrdx', 2, 'n-a', 101, 107, '2014-12-15 05:19:34', 'nolvorite', '', '', 'b5e9ec5dd0', 1, 101, NULL, 1, 0, NULL),
('No', 2, 'n-a', 107, 108, '2014-12-15 05:21:54', 'nerd', 'Comments', 'Comments', '39cb8196e1', 1, 101, NULL, 1, 0, NULL),
('ugh', 2, 'n-a', 90, 109, '2014-12-15 05:22:19', 'nerd', '', '', '66d8b94944', 1, 90, NULL, 1, 0, NULL),
('axiom', 2, 'n-a', 90, 110, '2014-12-15 05:27:31', 'nerd', '', '', 'c887985a54', 1, 90, NULL, 1, 0, NULL),
('axiom', 2, 'n-a', 90, 111, '2014-12-15 05:27:56', 'nerd', '', '', '45ecf3cde1', 1, 90, NULL, 1, 0, NULL),
('If you feel the urge to freak do the jitterbug', 2, 'n-a', 90, 112, '2014-12-15 05:30:21', 'nerd', '', '', '2a93c41df0', 1, 90, NULL, 1, 0, NULL),
('If you feel the urge to freak do the jitterbug', 2, 'n-a', 90, 113, '2014-12-15 05:30:48', 'nerd', '', '', '77c0d547d4', 1, 90, NULL, 1, 0, NULL),
('If you feel the urge to freak do the jitterbug', 2, 'n-a', 90, 114, '2014-12-15 05:31:17', 'nerd', '', '', '131f77271a', 1, 90, NULL, 1, 0, NULL),
('If you feel the urge to freak do the jitterbug', 2, 'n-a', 90, 115, '2014-12-15 05:37:19', 'nerd', '', '', 'c6f6d3f4fb', 1, 90, NULL, 1, 0, NULL),
('If you feel the urge to freak do the jitterbug', 2, 'n-a', 90, 116, '2014-12-15 05:38:11', 'nerd', '', '', 'd5da65c5d9', 1, 90, NULL, 1, 0, NULL),
('If you feel the urge to freak do the jitterbug', 2, 'n-a', 90, 117, '2014-12-15 05:44:15', 'nerd', '', '', 'bb5393f08f', 1, 90, NULL, 1, 0, NULL),
('Reply', 2, 'n-a', 94, 118, '2014-12-17 19:40:03', 'nolvorite', '', '', 'be23c99542', 1, 94, NULL, 1, 0, NULL),
(NULL, 0, '', 0, 119, '2014-12-17 22:11:33', '', NULL, NULL, NULL, 1, NULL, NULL, 1, 0, NULL),
('make a notification!', 2, 'n-a', 90, 120, '2014-12-18 03:27:07', 'nerd', '', '', 'f5653750e8', 1, 90, NULL, 1, 0, NULL),
('okay, my bad, forgot the other columns. Try another notification!', 2, 'n-a', 90, 121, '2014-12-18 03:33:50', 'nerd', '', '', '52613cbd64', 1, 90, NULL, 1, 0, NULL),
('dang it', 2, 'n-a', 90, 122, '2014-12-18 03:35:02', 'nerd', '', '', '79128f024a', 1, 90, NULL, 1, 0, NULL),
('one sec...', 2, 'n-a', 90, 123, '2014-12-18 03:36:09', 'nerd', '', '', '976543eda8', 1, 90, NULL, 1, 0, NULL),
('hmmmm', 2, 'n-a', 90, 124, '2014-12-18 03:36:30', 'nerd', '', '', '22b70358be', 1, 90, NULL, 1, 0, NULL),
('ewwwwww', 2, 'n-a', 90, 125, '2014-12-18 03:36:54', 'nerd', '', '', 'c61422f14b', 1, 90, NULL, 1, 0, NULL),
('test.....', 2, 'n-a', 90, 126, '2014-12-18 03:37:26', 'nerd', '', '', 'f6e15a0f93', 1, 90, NULL, 1, 0, NULL),
('This is annoying.', 2, 'n-a', 90, 127, '2014-12-18 03:42:05', 'nerd', '', '', 'f6ad018d5c', 1, 90, NULL, 1, 0, NULL),
('I mean seriously.', 2, 'n-a', 90, 128, '2014-12-18 03:45:45', 'nerd', '', '', 'bfca954d5f', 1, 90, NULL, 1, 0, NULL),
('Hmm.....', 2, 'n-a', 90, 129, '2014-12-18 03:49:26', 'nerd', '', '', '755552445c', 1, 90, NULL, 1, 0, NULL),
('Tesm', 2, 'n-a', 90, 130, '2014-12-18 03:54:24', 'nerd', '', '', '3893981dc6', 1, 90, NULL, 1, 0, NULL),
('somebody gag me', 2, 'n-a', 90, 131, '2014-12-18 03:56:26', 'nerd', '', '', 'de53769b21', 1, 90, NULL, 1, 0, NULL),
('I mean it', 2, 'n-a', 90, 132, '2014-12-18 03:59:00', 'nerd', '', '', 'ea8f74f1bf', 1, 90, NULL, 1, 0, NULL),
('eugh', 2, 'n-a', 90, 133, '2014-12-18 04:01:39', 'nerd', '', '', '24c1496955', 1, 90, NULL, 1, 0, NULL),
('Test for SQL errors', 2, 'n-a', 90, 134, '2014-12-18 04:03:50', 'nerd', '', '', '182e910e0a', 1, 90, NULL, 1, 0, NULL),
('or other errors :/', 2, 'n-a', 90, 135, '2014-12-18 04:05:40', 'nerd', '', '', '922347a11c', 1, 90, NULL, 1, 0, NULL),
('This sucks', 2, 'n-a', 90, 136, '2014-12-18 04:06:45', 'nerd', '', '', '2852f12123', 1, 90, NULL, 1, 0, NULL),
('Okay this should be the charm', 2, 'n-a', 90, 137, '2014-12-18 04:15:45', 'nerd', '', '', 'c4fd398dd2', 1, 90, NULL, 1, 0, NULL),
('Again', 1, 'self', 0, 138, '2014-12-19 16:24:12', 'nolvorite', 'Test poll question', 'Test_poll_question', 'ee4bb77fed', 1, NULL, NULL, 1, 1, NULL),
('Test', 1, 'self', 0, 139, '2014-12-26 06:25:53', 'nolvorite', 'Hmmmmmmmmm', 'Hmmmmmmmmm', 'b3a9334ded', 1, NULL, NULL, 2, 0, NULL),
('stfu noob', 2, 'n-a', 137, 140, '2014-12-28 21:47:54', 'nolvorite', 'Comments', 'Comments', '4b60367874', 1, 90, NULL, 1, 0, NULL),
('ur my bitch now', 2, 'n-a', 137, 141, '2014-12-28 22:03:13', 'nolvorite', 'Comments', 'Comments', 'e1ba3e6d1b', 1, 90, NULL, 1, 0, NULL),
('Yup', 2, 'n-a', 137, 142, '2014-12-28 22:06:10', 'nolvorite', 'Comments', 'Comments', '3f8dbdee7a', 1, 90, NULL, 1, 0, NULL),
('Again', 2, 'n-a', 137, 143, '2014-12-28 22:07:06', 'nolvorite', 'Comments', 'Comments', 'bb106a0ebc', 1, 90, NULL, 1, 0, NULL),
('And again', 2, 'n-a', 137, 144, '2014-12-28 22:08:32', 'nerd', 'Comments', 'Comments', '354fd07a14', 1, 90, NULL, 1, 0, NULL),
('Eugh', 2, 'n-a', 137, 145, '2014-12-28 22:09:25', 'nolvorite', 'Comments', 'Comments', 'be805506ae', 1, 90, NULL, 1, 0, NULL),
('oh right.', 2, 'n-a', 137, 146, '2014-12-28 22:10:31', 'nerd', 'Comments', 'Comments', '237aba4b41', 1, 90, NULL, 1, 0, NULL),
('And for legitimacy...', 2, 'n-a', 137, 147, '2014-12-28 22:12:12', 'nolvorite', 'Comments', 'Comments', 'd04238e820', 1, 90, NULL, 1, 0, NULL),
('Test for replying to your own post.', 2, 'n-a', 147, 148, '2014-12-28 22:57:11', 'nolvorite', 'Comments', 'Comments', '0809dfc8da', 1, 90, NULL, 1, 0, NULL),
('Again?', 2, 'n-a', 147, 149, '2014-12-28 22:57:41', 'nolvorite', 'Comments', 'Comments', '19a06a3c85', 1, 90, NULL, 1, 0, NULL),
('Nao', 2, 'n-a', 147, 150, '2014-12-28 22:59:10', 'nolvorite', 'Comments', 'Comments', '5da50d3f9f', 1, 90, NULL, 1, 0, NULL),
('Hmmm', 2, 'n-a', 147, 151, '2014-12-28 23:00:50', 'nolvorite', 'Comments', 'Comments', 'a56328b3b9', 1, 90, NULL, 1, 0, NULL),
('Again.', 2, 'n-a', 146, 152, '2014-12-29 00:26:53', 'nolvorite', 'Comments', 'Comments', '76bd3af5eb', 1, 90, NULL, 1, 0, NULL),
('Testing levels.', 2, 'n-a', 152, 153, '2014-12-29 00:27:19', 'nolvorite', 'Comments', 'Comments', '6292754060', 1, 90, NULL, 1, 0, NULL),
('Again.', 2, 'n-a', 148, 154, '2014-12-29 00:33:10', 'nolvorite', 'Comments', 'Comments', 'dc7a020920', 1, 90, NULL, 1, 0, NULL),
('Now?', 2, 'n-a', 154, 155, '2014-12-29 00:34:25', 'nolvorite', 'Comments', 'Comments', '6966e97fe9', 1, 90, NULL, 1, 0, NULL),
('Hmmm', 2, 'n-a', 147, 156, '2014-12-29 00:34:47', 'nolvorite', 'Comments', 'Comments', 'bf2aa304a2', 1, 90, NULL, 1, 0, NULL),
('eugh', 2, 'n-a', 156, 157, '2014-12-30 02:25:10', 'nolvorite', 'Comments', 'Comments', '1028a261a2', 1, 90, NULL, 1, 0, NULL),
('Ayyyyyyy', 2, 'n-a', 147, 158, '2015-01-03 18:49:06', 'nerd', 'Comments', 'Comments', '6a05952fa0', 1, 90, NULL, 1, 0, NULL),
(' ', 1, 'self', 0, 159, '2015-01-14 22:44:51', 'nolvorite', 'ayy lmao', 'ayy_lmao', '195cebf849', 1, NULL, NULL, 1, 0, NULL),
(' ', 1, 'self', 0, 160, '2015-01-14 22:49:58', 'nerd', 'Try posting maybe>', 'Try_posting_maybe_', '5848a6eca2', 1, NULL, NULL, 1, 0, NULL),
('noob', 2, 'n-a', 160, 161, '2015-01-15 04:17:03', 'nolvorite', '', '', '780864e2e5', 1, 160, NULL, 1, 0, NULL),
('testing response', 2, 'n-a', 159, 162, '2015-01-15 04:40:24', 'nerd', '', '', '4a08768802', 1, 159, NULL, 1, 0, NULL),
('to my own', 2, 'n-a', 162, 163, '2015-01-15 04:41:42', 'nerd', 'Comments', 'Comments', 'b612d0ac8b', 1, 159, NULL, 1, 0, NULL),
(' ', 1, 'self', 0, 164, '2015-01-15 04:42:30', 'nerd', 'Testing for roots', 'Testing_for_roots', '9a2670d4db', 1, NULL, NULL, 1, 0, NULL),
('Test reply.', 2, 'n-a', 164, 165, '2015-01-15 04:49:42', 'nolvorite', '', '', 'f4f3a6275f', 1, 164, NULL, 1, 0, NULL),
('Try again', 2, 'n-a', 164, 166, '2015-01-15 04:50:53', 'nolvorite', '', '', '817d6531cc', 1, 164, NULL, 1, 0, NULL),
('Hmmm.....', 2, 'n-a', 164, 167, '2015-01-15 04:51:28', 'nolvorite', '', '', 'c1a46e0b82', 1, 164, NULL, 1, 0, NULL),
(' ', 1, 'self', 0, 168, '2015-01-15 04:55:56', 'nolvorite', 'This is bizarre.', 'This_is_bizarre_', '9b6877d04e', 1, NULL, NULL, 2, 0, NULL),
('Test', 2, 'n-a', 164, 169, '2015-01-15 04:59:17', 'nolvorite', '', '', 'f8405d7ed0', 1, 164, NULL, 1, 0, NULL),
(' ', 1, 'self', 0, 170, '2015-01-15 04:59:56', 'nolvorite', 'wtf', 'wtf', '9665ebe07e', 1, NULL, NULL, 2, 0, NULL),
('Sigh.', 2, 'n-a', 164, 171, '2015-01-15 05:03:12', 'nolvorite', '', '', '5ceafbe8db', 1, 164, NULL, 1, 0, NULL),
('Why is this so buggy, eugh', 2, 'n-a', 164, 172, '2015-01-15 05:09:31', 'nolvorite', '', '', '060517c759', 1, 164, NULL, 1, 0, NULL),
('eugh', 2, 'n-a', 164, 173, '2015-01-15 05:09:56', 'nolvorite', '', '', 'ddc7ee2624', 1, 164, NULL, 1, 0, NULL),
('Good grief', 2, 'n-a', 164, 174, '2015-01-15 05:15:20', 'nolvorite', '', '', '449c7e90d8', 1, 164, NULL, 1, 0, NULL),
('Sorry.', 2, 'n-a', 164, 175, '2015-01-15 05:16:53', 'nolvorite', '', '', 'b9d4c32cf2', 1, 164, NULL, 1, 0, NULL),
('Okay this should be everything.', 2, 'n-a', 164, 176, '2015-01-15 05:17:55', 'nolvorite', '', '', 'bd09eb3222', 1, 164, NULL, 1, 0, NULL),
(' ', 1, 'self', 0, 177, '2015-01-16 00:08:07', 'nolvorite', 'Try again', 'Try_again', '8f4234e06b', 1, NULL, NULL, 1, 0, NULL),
('For science!', 1, 'self', 0, 178, '2015-01-16 00:15:11', 'nolvorite', 'Moar spam!', 'Moar_spam_', 'cc4d87a03b', 1, NULL, NULL, 1, 0, NULL),
('huh', 1, 'self', 0, 179, '2015-01-16 00:16:18', 'nolvorite', 'Testing here', 'Testing_here', '9dcdf987b5', 1, NULL, NULL, 1, 0, NULL),
(' ', 1, 'self', 0, 180, '2015-01-16 04:06:26', 'nerd', 'Test', 'Test', 'c6c8bd2f3d', 1, NULL, NULL, 1, 0, NULL),
(' ', 1, 'self', 0, 181, '2015-01-16 04:07:25', 'nerd', 'Test again?', 'Test_again_', '4c2155e2ca', 1, NULL, NULL, 1, 0, NULL),
(' ', 1, 'self', 0, 182, '2015-01-16 04:08:05', 'nolvorite', 'This is bizarre.', 'This_is_bizarre_', 'ffd16ca47f', 1, NULL, NULL, 1, 0, NULL),
('Test post', 1, 'self', 0, 183, '2015-01-16 04:08:20', 'nerd', 'Test post', 'Test_post', '17d6fb126e', 1, NULL, NULL, 1, 0, NULL),
(' ', 1, 'self', 0, 184, '2015-01-16 04:25:41', 'nolvorite', 'Try again?', 'Try_again_', 'b8b7861fbd', 1, NULL, NULL, 1, 0, NULL),
(' ', 1, 'self', 0, 185, '2015-01-16 04:25:58', 'nerd', 'This is an oddity.', 'This_is_an_oddity_', '2e59f4ca63', 1, NULL, NULL, 1, 0, NULL),
(' ', 1, 'self', 0, 186, '2015-01-16 05:41:34', 'nolvorite', 'Spam testing to no end.', 'Spam_testing_to_no_end_', 'c2bf46c552', 1, NULL, NULL, 1, 0, NULL),
(' ', 1, 'self', 0, 187, '2015-01-17 00:03:48', 'nolvorite', 'Get rekt', 'Get_rekt', 'ee968ac84b', 1, NULL, NULL, 1, 0, NULL),
('Reply', 2, 'n-a', 185, 188, '2015-01-17 01:52:22', 'nolvorite', '', '', '2bf8e7b8dc', 1, 185, NULL, 1, 0, NULL),
('Test', 2, 'n-a', 185, 189, '2015-01-17 02:07:39', 'nolvorite', '', '', '1002e4fd03', 1, 185, NULL, 1, 0, NULL),
('Test', 2, 'n-a', 185, 190, '2015-01-17 02:09:16', 'nolvorite', '', '', '6e66ae8c84', 1, 185, NULL, 1, 0, NULL),
('Test', 2, 'n-a', 185, 191, '2015-01-17 02:17:06', 'nolvorite', '', '', 'f71c8ee8b2', 1, 185, NULL, 1, 0, NULL),
(' ', 1, 'self', 0, 192, '2015-01-17 02:18:07', 'nolvorite', 'Test', 'Test', '62345be3a6', 1, NULL, NULL, 1, 0, NULL),
(' ', 1, 'self', 0, 193, '2015-01-17 02:20:49', 'nolvorite', 'Test', 'Test', '9410d991da', 1, NULL, NULL, 1, 0, NULL),
(' ', 1, 'self', 0, 194, '2015-01-17 02:22:36', 'nolvorite', 'Test', 'Test', '5dade8abf7', 1, NULL, NULL, 1, 0, NULL),
(' ', 1, 'self', 0, 195, '2015-01-17 02:31:36', 'nolvorite', 'Test again', 'Test_again', '37873eed96', 1, NULL, NULL, 1, 0, NULL),
('Lorem ipsum dolor sit amet, nec tibique consectetuer ei, vix nihil malorum persecuti ad. Ut eam atqui simul, ut sumo case appellantur mea. An ius aliquip accusam ponderum. Ex ius quem voluptatibus, eam cu epicuri intellegam. Per vituperata definitionem in, ne error laboramus definiebas sea.\r<br>\r<br>Diam autem id eum, dicam bonorum philosophia ex quo. Mea utroque disputando cu. Mutat labitur sed at, sit ea ullum quando. Esse accusamus consequuntur qui et. Et iuvaret sanctus vis, usu ut euismod conceptam. Id eam veniam denique inciderint, ei eam purto natum.\r<br>\r<br>Pri no probatus intellegebat, an wisi inciderint efficiantur vis. An nemore viderer salutandi his, id verear inermis efficiantur sea. Ad civibus delicata efficiantur nec, an quod habeo praesent vim, an sed unum habeo. Illum periculis necessitatibus te pri, et pro elaboraret eloquentiam, purto graece et eos. Ei mei officiis elaboraret, vix te soleat voluptatum. No diam civibus qui.\r<br>\r<br>Eum id odio minim tractatos, his commodo eleifend at. Ius scripta incorrupte et. Hinc consul salutatus te vel, in has invidunt inciderint complectitur, his repudiare voluptatibus at. Vis diam dolorem eu. Ius ut laudem similique concludaturque, legendos aliquando ne duo.\r<br>\r<br>Quo id wisi deserunt, an dicta dolorem admodum quo. Nisl purto utamur eam in, explicari voluptatum ea duo. Duo facilis recusabo sapientem in, cu eum facer complectitur. Qui ea oporteat assueverit, hinc eruditi nominati an vim. Ius movet tacimates ei. Porro malis no vix. Pro possit audiam ei, odio consul splendide qui ei.', 1, 'self', 0, 196, '2015-01-17 02:34:51', 'nolvorite', 'Spam all day!', 'Spam_all_day_', '44b39decf8', 1, NULL, NULL, 1, 0, NULL),
(' ', 1, 'self', 0, 197, '2015-01-17 02:35:48', 'nolvorite', 'Testing the process again....', 'Testing_the_process_again____', '1fafe362c5', 1, NULL, NULL, 1, 0, NULL),
(' ', 1, 'self', 0, 198, '2015-01-17 02:40:41', 'nolvorite', 'This is retarded.', 'This_is_retarded_', 'd58eaede95', 1, NULL, NULL, 1, 0, NULL),
('Disgusting as always.', 2, 'n-a', 185, 199, '2015-01-17 02:43:34', 'nolvorite', '', '', 'f165cf5fbd', 1, 185, NULL, 1, 0, NULL),
('Pricks.', 2, 'n-a', 185, 200, '2015-01-17 02:46:20', 'nolvorite', '', '', 'c6b9fce8dd', 1, 185, NULL, 1, 0, NULL),
('Lorem ipsum dolor sit amet, nec tibique consectetuer ei, vix nihil malorum persecuti ad. Ut eam atqui simul, ut sumo case appellantur mea. An ius aliquip accusam ponderum. Ex ius quem voluptatibus, eam cu epicuri intellegam. Per vituperata definitionem in, ne error laboramus definiebas sea. ', 1, 'self', 0, 201, '2015-01-17 03:37:23', 'nolvorite', 'Spam again.', 'Spam_again_', '2358416737', 1, NULL, NULL, 1, 0, NULL),
(' ', 1, 'self', 0, 202, '2015-01-17 03:39:27', 'nolvorite', 'Test? ew', 'Test__ew', '57435114a1', 1, NULL, NULL, 1, 0, NULL),
(' ', 1, 'self', 0, 203, '2015-01-17 03:40:39', 'nolvorite', 'Spamming to no end, always fun.', 'Spamming_to_no_end__always_fun_', '9d37398509', 1, NULL, NULL, 1, 0, NULL),
('Seriously, fuck this shit.', 1, 'self', 0, 204, '2015-01-17 03:41:40', 'nolvorite', 'For science!', 'For_science_', '3f7f6e645d', 1, NULL, NULL, 1, 0, NULL),
(' ', 1, 'self', 0, 205, '2015-01-17 03:43:22', 'nerd', 'Eughsssdahsdajsjne3j', 'Eughsssdahsdajsjne3j', 'b69f12c128', 1, NULL, NULL, 1, 0, NULL),
(' ', 1, 'self', 0, 206, '2015-01-17 03:47:07', 'nerd', 'Gay', 'Gay', 'ce26aa72e1', 1, NULL, NULL, 1, 0, NULL),
(' ', 1, 'self', 0, 207, '2015-01-17 03:51:46', 'nerd', 'This shit aint right', 'This_shit_aint_right', '0aafaba924', 1, NULL, NULL, 1, 0, NULL),
(' ', 1, 'self', 0, 208, '2015-01-17 03:52:08', 'nolvorite', 'Ewwwww', 'Ewwwww', '7e965c1a4b', 1, NULL, NULL, 1, 0, NULL),
(' ', 1, 'self', 0, 209, '2015-01-17 03:57:12', 'nerd', 'Verruhfyyyy', 'Verruhfyyyy', 'ca445eddf9', 1, NULL, NULL, 1, 0, NULL),
(' ', 1, 'self', 0, 210, '2015-01-17 03:58:03', 'nolvorite', 'Test comments', 'Test_comments', '7a0ab0e630', 1, NULL, NULL, 1, 0, NULL),
('Reply bitch', 2, 'n-a', 210, 211, '2015-01-17 04:00:26', 'nerd', '', '', 'ee8ef680fd', 1, 210, NULL, 1, 0, NULL),
('Test', 2, 'n-a', 210, 212, '2015-01-17 04:05:07', 'nerd', '', '', '5fe700ab5d', 1, 210, NULL, 1, 0, NULL),
('Test reply!', 2, 'n-a', 210, 213, '2015-01-17 04:08:01', 'nerd', '', '', 'b89293fc95', 1, 210, NULL, 1, 0, NULL),
(' ', 1, 'self', 0, 214, '2015-01-17 04:13:10', 'nerd', 'Testing', 'Testing', '538af04b59', 1, NULL, NULL, 1, 0, NULL),
(' ', 1, 'self', 0, 215, '2015-01-17 04:21:27', 'nolvorite', 'Gahh', 'Gahh', 'ec22e3f2aa', 1, NULL, NULL, 1, 0, NULL),
(' ', 1, 'self', 0, 216, '2015-01-17 04:22:35', 'nolvorite', 'srsly', 'srsly', 'd5052402d6', 1, NULL, NULL, 1, 0, NULL),
(' ', 1, 'self', 0, 217, '2015-01-17 04:29:12', 'nolvorite', 'Well this is truly awkward.', 'Well_this_is_truly_awkward_', '78ba1fe768', 1, NULL, NULL, 1, 0, NULL),
(' ', 1, 'self', 0, 218, '2015-01-17 05:10:49', 'nolvorite', 'I thought I had fixed it but apparently not', 'I_thought_I_had_fixed_it_but_apparently_not', '64db185f17', 1, NULL, NULL, 1, 0, NULL),
('Test reply.', 2, 'n-a', 214, 219, '2015-01-17 05:12:14', 'nolvorite', '', '', '7c7058d976', 1, 214, NULL, 1, 0, NULL),
('And again.', 2, 'n-a', 214, 220, '2015-01-17 05:12:57', 'nolvorite', '', '', '25a311e103', 1, 214, NULL, 1, 0, NULL),
('This is getting kinda tiring', 2, 'n-a', 214, 221, '2015-01-17 05:14:55', 'nolvorite', '', '', 'e8f7d653e7', 1, 214, NULL, 1, 0, NULL),
('This should truly do the trick.', 2, 'n-a', 214, 222, '2015-01-17 05:21:25', 'nolvorite', '', '', '257132d8d0', 1, 214, NULL, 1, 0, NULL),
('This should do the trick.', 2, 'n-a', 214, 223, '2015-01-17 05:23:14', 'nolvorite', '', '', 'ada8c3b239', 1, 214, NULL, 1, 0, NULL),
('Nope.', 2, 'n-a', 214, 224, '2015-01-17 05:24:14', 'nolvorite', '', '', '33ccff85cd', 1, 214, NULL, 1, 0, NULL),
(' ', 1, 'self', 0, 225, '2015-01-17 05:33:08', 'nolvorite', 'I now know what being a crappy mechanic feels like.', 'I_now_know_what_being_a_crappy_mechanic_feels_like', '2934faf2af', 1, NULL, NULL, 1, 0, NULL),
('Yes.', 2, 'n-a', 214, 226, '2015-01-17 05:34:00', 'nolvorite', '', '', '0285d324b6', 1, 214, NULL, 1, 0, NULL),
('This sucks.', 2, 'n-a', 214, 227, '2015-01-17 05:37:21', 'nolvorite', '', '', 'f10e239aa9', 1, 214, NULL, 1, 0, NULL),
('Gah', 2, 'n-a', 214, 228, '2015-01-17 05:38:10', 'nolvorite', '', '', 'a7d014d820', 1, 214, NULL, 1, 0, NULL),
('This is so dumb.', 2, 'n-a', 214, 229, '2015-01-17 05:38:38', 'nolvorite', '', '', '943e87d80c', 1, 214, NULL, 1, 0, NULL),
(' ', 1, 'self', 0, 230, '2015-01-17 05:38:59', 'nerd', 'Post new topic', 'Post_new_topic', 'ed5554d664', 1, NULL, NULL, 1, 0, NULL),
(' ', 1, 'self', 0, 231, '2015-01-18 02:50:29', 'nolvorite', 'Get it right the first time', 'Get_it_right_the_first_time', '4e4c514a8c', 1, NULL, NULL, 1, 0, NULL),
(' ', 1, 'self', 0, 232, '2015-01-18 02:51:51', 'nerd', 'Another prompt.', 'Another_prompt_', '6a262b475b', 1, NULL, NULL, 1, 0, NULL),
('Reply to own', 2, 'n-a', 232, 233, '2015-01-18 02:51:59', 'nerd', '', '', '59064d19e2', 1, 232, NULL, 1, 0, NULL),
('Nope. Not yet', 2, 'n-a', 232, 234, '2015-01-18 02:53:10', 'nerd', '', '', '4e8df571e2', 1, 232, NULL, 1, 0, NULL),
('Try again.... :((((', 2, 'n-a', 232, 235, '2015-01-18 03:02:46', 'nerd', '', '', '4a9ab811e5', 1, 232, NULL, 1, 0, NULL),
(' ', 1, 'self', 0, 236, '2015-01-18 03:08:17', 'nerd', 'So, topics work, but not replies.', 'So__topics_work__but_not_replies_', '711b1c5656', 1, NULL, NULL, 1, 0, NULL),
('Indeed.', 2, 'n-a', 236, 237, '2015-01-18 03:11:42', 'nolvorite', '', '', 'a44ed9c807', 1, 236, NULL, 1, 0, NULL),
('Nooooope', 2, 'n-a', 232, 238, '2015-01-18 03:16:03', 'nerd', '', '', '6a123aac43', 1, 232, NULL, 1, 0, NULL),
('Ew grosssss', 2, 'n-a', 236, 239, '2015-01-18 03:33:21', 'nolvorite', '', '', '6105b381e8', 1, 236, NULL, 1, 0, NULL),
('Okay. This should finally do the trick. Ew', 2, 'n-a', 236, 240, '2015-01-18 03:37:38', 'nolvorite', '', '', 'c411fad9f7', 1, 236, NULL, 1, 0, NULL),
('Swell.', 2, 'n-a', 231, 241, '2015-01-18 21:53:45', 'nerd', '', '', 'f8453f2156', 1, 231, NULL, 1, 0, NULL),
('Swell.', 2, 'n-a', 231, 242, '2015-01-18 21:53:45', 'nerd', '', '', '16e420ba8e', 1, 231, NULL, 1, 0, NULL),
('Fail.', 2, 'n-a', 236, 243, '2015-01-20 20:07:02', 'nolvorite', '', '', '556d33057d', 1, 236, NULL, 1, 0, NULL),
('Try again', 2, 'n-a', 236, 244, '2015-01-20 20:08:02', 'nolvorite', '', '', 'c88006f125', 1, 236, NULL, 1, 0, NULL),
('fuck this shit.', 1, 'self', 0, 245, '2015-01-20 20:08:24', 'nerd', 'GAH! Man seriously', 'GAH__Man_seriously', 'cf066f9a73', 1, NULL, NULL, 1, 0, NULL),
('im sorry hun.\r<br>\r<br>/foreveralone', 2, 'n-a', 245, 246, '2015-01-20 20:27:45', 'nolvorite', '', '', 'fccff8fa5c', 1, 245, NULL, 1, 0, NULL),
('Whoops let me try this again', 2, 'n-a', 245, 247, '2015-01-20 20:28:39', 'nolvorite', '', '', '6f6bb8f808', 1, 245, NULL, 1, 0, NULL),
('This is retarded', 2, 'n-a', 245, 248, '2015-01-20 20:29:39', 'nolvorite', '', '', '8ad9ee1e2c', 1, 245, NULL, 1, 0, NULL),
('Hmmmmmmm', 2, 'n-a', 245, 249, '2015-01-20 20:35:15', 'nolvorite', '', '', '6be69388e9', 1, 245, NULL, 1, 0, NULL),
('Ayyyyy', 2, 'n-a', 245, 250, '2015-01-20 20:36:29', 'nolvorite', '', '', '6ff4c2d0d6', 1, 245, NULL, 1, 0, NULL),
('Zing', 2, 'n-a', 245, 251, '2015-01-20 20:42:16', 'nolvorite', '', '', '4a3989a1de', 1, 245, NULL, 1, 0, NULL),
('Thank u', 2, 'n-a', 251, 252, '2015-01-20 20:44:50', 'nerd', 'Comments', 'Comments', 'e71dbf868d', 1, 245, NULL, 1, 0, NULL),
('mhm', 2, 'n-a', 252, 253, '2015-01-20 20:45:23', 'nerd', 'Comments', 'Comments', '9252e7c83b', 1, 245, NULL, 1, 0, NULL),
('Svelte', 2, 'n-a', 251, 254, '2015-01-20 21:07:55', 'nolvorite', 'Comments', 'Comments', 'a13d6230e3', 1, 245, NULL, 1, 0, NULL),
(' ', 1, 'self', 0, 255, '2015-01-24 04:19:42', 'nolvorite', 'Ayyyy', 'Ayyyy', '56f5732ae7', 1, NULL, NULL, 1, 0, NULL),
('Peace', 2, 'n-a', 253, 256, '2015-01-27 23:43:56', 'nolvorite', 'Comments', 'Comments', 'd58bf47356', 1, 245, NULL, 1, 0, NULL),
('Ayyy', 3, 'nerd', NULL, 257, '2015-01-29 02:28:06', 'nolvorite', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('Submission', 3, 'nerd', NULL, 258, '2015-01-29 03:02:48', 'nolvorite', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('zoom', 3, 'nerd', NULL, 259, '2015-01-29 05:09:36', 'nolvorite', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('Check em', 3, 'nolvorite', NULL, 260, '2015-01-29 05:27:09', 'nerd', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('Try try try', 3, 'nolvorite', NULL, 261, '2015-01-29 05:34:26', 'nerd', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('Suck it', 3, 'nolvorite', NULL, 262, '2015-01-29 05:42:25', 'nerd', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('no cherry picky', 3, 'nolvorite', NULL, 263, '2015-01-29 05:47:42', 'nerd', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('no cherry picky&#39;', 3, 'nolvorite', NULL, 264, '2015-01-29 05:48:06', 'nerd', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('What buffoonery is this?', 3, 'nolvorite', NULL, 265, '2015-01-29 06:35:45', 'nerd', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('Sup', 3, 'nerd', NULL, 266, '2015-01-29 06:44:11', 'nolvorite', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('Test', 3, 'nerd', NULL, 267, '2015-01-29 06:46:47', 'nolvorite', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('Last', 3, 'nerd', NULL, 268, '2015-01-29 06:48:03', 'nolvorite', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('Reply again', 3, 'nerd', NULL, 269, '2015-01-29 07:05:10', 'nolvorite', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('Le post', 3, 'nerd', NULL, 270, '2015-01-29 07:05:50', 'nolvorite', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('Try again', 3, 'nerd', NULL, 271, '2015-01-29 07:09:16', 'nolvorite', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('Bazinga!', 3, 'nerd', NULL, 272, '2015-01-29 07:18:11', 'nolvorite', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('JjJ', 3, 'nerd', NULL, 273, '2015-01-29 07:21:04', 'nolvorite', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('im desperate', 3, 'nerd', NULL, 274, '2015-01-29 20:39:41', 'nolvorite', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('im desperate', 3, 'nerd', NULL, 275, '2015-01-29 20:40:26', 'nolvorite', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('im desperate', 3, 'nerd', NULL, 276, '2015-01-29 20:40:48', 'nolvorite', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('im desperate', 3, 'nerd', NULL, 277, '2015-01-29 20:40:58', 'nolvorite', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('deleagition1!!!11', 3, 'nerd', NULL, 278, '2015-02-04 01:32:52', 'nolvorite', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('Sweeeeet', 3, 'nolvorite', NULL, 279, '2015-02-04 02:38:07', 'nerd', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('&lt;3', 3, 'nerd', NULL, 280, '2015-02-04 02:40:03', 'nolvorite', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('no', 3, 'nerd', NULL, 281, '2015-02-04 22:37:00', 'nolvorite', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('gross', 3, 'nerd', NULL, 282, '2015-02-04 23:50:16', 'nolvorite', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('asdasd', 3, 'nerd', NULL, 283, '2015-02-04 23:50:30', 'nolvorite', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('Snipe', 3, 'nerd', NULL, 284, '2015-02-04 23:51:54', 'nolvorite', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('Snipe', 3, 'nerd', NULL, 285, '2015-02-04 23:51:56', 'nolvorite', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('du hast', 3, 'nolvorite', NULL, 286, '2015-02-04 23:56:22', 'nerd', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('du hast', 3, 'nolvorite', NULL, 287, '2015-02-04 23:56:31', 'nerd', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('crops', 3, 'nerd', NULL, 288, '2015-02-04 23:57:29', 'nolvorite', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('SIEGE!', 3, 'nolvorite', NULL, 289, '2015-02-05 01:02:03', 'nerd', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('we&#39;re in!', 3, 'nerd', NULL, 290, '2015-02-05 04:16:08', 'nolvorite', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('test it!', 1, 'self', 0, 291, '2015-02-05 05:29:20', 'nolvorite', '/a/sd/as/asda&#39;&#39;symbols!', '_a_sd_as_asda__39___39_symbols_', '255378f4f6', 1, NULL, NULL, 1, 0, NULL),
('ayyy', 3, 'nerd', NULL, 292, '2015-02-05 23:05:52', 'nolvorite', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('???=', 3, 'nolvorite', NULL, 293, '2015-02-05 23:06:14', 'nerd', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('We&#39;ll have to save the tabbed users into a sessionnnAlso show a separate panel for all the messages', 3, 'nolvorite', NULL, 294, '2015-02-05 23:07:02', 'nerd', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('Someone forgot to account for break lines', 3, 'nolvorite', NULL, 295, '2015-02-05 23:07:20', 'nerd', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('TestrnrnLine breaks', 1, 'self', 0, 296, '2015-02-05 23:11:59', 'nolvorite', 'Uhh...', '', '44455b6910', 1, NULL, NULL, 1, 0, NULL),
('Stupidrnsdkaskdaksdkarnrnrngah', 1, 'self', 0, 297, '2015-02-05 23:12:51', 'nolvorite', 'Test line breaks...', '', '6a87fbf1f6', 1, NULL, NULL, 1, 0, NULL),
('This is so dumb.\r\n\r\n\r\nForreal', 1, 'self', 0, 298, '2015-02-05 23:13:57', 'nolvorite', 'Oh my god.', '', 'f8edd4644b', 1, NULL, NULL, 1, 0, NULL),
('oh my god seriously', 1, 'self', 0, 299, '2015-02-05 23:15:15', 'nolvorite', 'Eugh...', '', 'a5a7f2418a', 1, NULL, NULL, 1, 0, NULL),
('Unbelievable<br><br>tsk tsk', 3, 'nerd', NULL, 300, '2015-02-05 23:15:49', 'nolvorite', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('Unbelievablenntsk tsk', 3, 'nerd', NULL, 301, '2015-02-05 23:16:09', 'nolvorite', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('Let&#39;s see shall we', 3, 'nolvorite', NULL, 302, '2015-02-05 23:18:43', 'nerd', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('Let&#39;s see shall we\n\nbreak!', 3, 'nolvorite', NULL, 303, '2015-02-05 23:18:50', 'nerd', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('Let&#39;s see shall we<br><br>break!', 3, 'nolvorite', NULL, 304, '2015-02-05 23:19:45', 'nerd', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('<b>ooooooh</b>', 3, 'nolvorite', NULL, 305, '2015-02-05 23:19:57', 'nerd', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('&lt;b&gt;Try it now&lt;/b&gt;', 3, 'nerd', NULL, 306, '2015-02-05 23:20:38', 'nolvorite', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('get in here', 1, 'self', 0, 307, '2015-02-05 23:21:36', 'nolvorite', 'Pssssst', 'b', '9a339abd99', 1, NULL, NULL, 1, 0, NULL),
('eugh', 1, 'self', 0, 308, '2015-02-05 23:22:19', 'nolvorite', 'wtf', 'a', 'a2fd023125', 1, NULL, NULL, 1, 0, NULL),
('Ewwwwwww', 1, 'self', 0, 309, '2015-02-05 23:28:36', 'nolvorite', 'Okay this should be good now.', 'okay_this_should_be_good_now', '50e5db96d8', 1, NULL, NULL, 1, 0, NULL),
('testing replies where the other user has it closed', 3, 'nolvorite', NULL, 310, '2015-02-06 02:38:40', 'nerd', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('testing replies where the other user has it closed', 3, 'nolvorite', NULL, 311, '2015-02-06 02:38:49', 'nerd', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('test reply', 3, 'nerd', NULL, 312, '2015-02-06 02:51:28', 'nolvorite', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('again?', 3, 'nerd', NULL, 313, '2015-02-06 02:51:57', 'nolvorite', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('umm', 3, 'nerd', NULL, 314, '2015-02-06 02:52:16', 'nolvorite', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('umm', 3, 'nerd', NULL, 315, '2015-02-06 02:57:50', 'nolvorite', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('maybe it&#39;s a browser thing?', 3, 'nolvorite', NULL, 316, '2015-02-06 02:58:16', 'nerd', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('umm', 3, 'nerd', NULL, 317, '2015-02-06 03:17:08', 'nolvorite', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('maybe it&#39;s a browser thing?', 3, 'nolvorite', NULL, 318, '2015-02-06 03:17:11', 'nerd', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('shhh', 3, 'nolvorite', NULL, 319, '2015-02-06 03:18:06', 'nerd', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('hmmmm', 3, 'nolvorite', NULL, 320, '2015-02-06 05:23:41', 'nerd', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('hmmmm', 3, 'nolvorite', NULL, 321, '2015-02-06 05:25:06', 'nerd', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('hmmmm', 3, 'nolvorite', NULL, 322, '2015-02-06 05:25:21', 'nerd', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('hmmmm', 3, 'nolvorite', NULL, 323, '2015-02-06 05:25:22', 'nerd', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('??', 3, 'nerd', NULL, 324, '2015-02-06 05:30:50', 'nolvorite', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('eugh', 3, 'nolvorite', NULL, 325, '2015-02-06 05:31:00', 'nerd', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('zoink', 3, 'nolvorite', NULL, 326, '2015-02-06 05:33:42', 'nerd', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('sdasd', 3, 'nerd', NULL, 327, '2015-02-06 05:34:00', 'nolvorite', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('post', 3, 'nerd', NULL, 328, '2015-02-06 05:43:36', 'nolvorite', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('post', 3, 'nerd', NULL, 329, '2015-02-06 05:43:45', 'nolvorite', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('ayy', 3, 'nolvorite', NULL, 330, '2015-02-06 05:48:41', 'nerd', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('LOL', 3, 'nerd', NULL, 331, '2015-02-06 05:57:17', 'nolvorite', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('....', 3, 'nerd', NULL, 332, '2015-02-06 06:18:53', 'nolvorite', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('sigh', 3, 'nolvorite', NULL, 333, '2015-02-06 06:27:21', 'nerd', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('every dog has its day.', 3, 'nerd', NULL, 334, '2015-02-06 06:27:33', 'nolvorite', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('indeed.', 3, 'nolvorite', NULL, 335, '2015-02-06 06:27:43', 'nerd', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('every dog has its day.', 3, 'nerd', NULL, 336, '2015-02-06 23:37:29', 'nolvorite', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('okayyyyyy', 3, 'nolvorite', NULL, 337, '2015-02-06 23:37:44', 'nerd', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('&#39;&#39;/&#39;//&#39;/&#39;&#39;/dsd', 3, 'nerd', NULL, 338, '2015-02-06 23:38:36', 'nolvorite', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('??', 3, 'nerd', NULL, 339, '2015-02-06 23:48:25', 'nolvorite', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1),
('bam', 3, 'nerd', NULL, 340, '2015-02-07 00:08:17', 'nolvorite', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `school`
--

CREATE TABLE IF NOT EXISTS `school` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `coordinates` varchar(50) DEFAULT NULL,
  `motto` varchar(50) DEFAULT NULL,
  `religiousaffiliations` varchar(50) DEFAULT NULL,
  `established` varchar(50) DEFAULT NULL,
  `principal` varchar(50) DEFAULT NULL,
  `headmaster` varchar(50) DEFAULT NULL,
  `chaplain` varchar(50) DEFAULT NULL,
  `faculty` varchar(50) DEFAULT NULL,
  `grades` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `numberofstudents` varchar(50) DEFAULT NULL,
  `campussize` varchar(50) DEFAULT NULL,
  `campustype` varchar(50) DEFAULT NULL,
  `colors` varchar(50) DEFAULT NULL,
  `athletics` varchar(50) DEFAULT NULL,
  `mascot` varchar(50) DEFAULT NULL,
  `rival` varchar(50) DEFAULT NULL,
  `accreditation` varchar(50) DEFAULT NULL,
  `averagesatscores` varchar(50) DEFAULT NULL,
  `averageactscores` varchar(50) DEFAULT NULL,
  `publication` varchar(50) DEFAULT NULL,
  `newspaper` varchar(50) DEFAULT NULL,
  `yearbook` varchar(50) DEFAULT NULL,
  `tuition` varchar(50) DEFAULT NULL,
  `website` varchar(50) DEFAULT NULL,
  `link` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `schoolboard` varchar(50) DEFAULT NULL,
  `schooldistrict` varchar(50) DEFAULT NULL,
  `ncesdistrictid` varchar(50) DEFAULT NULL,
  `oversight` varchar(50) DEFAULT NULL,
  `ceebcode` varchar(50) DEFAULT NULL,
  `ncesschoolid` varchar(50) DEFAULT NULL,
  `enrollment` varchar(50) DEFAULT NULL,
  `studenttoteacherratio` varchar(50) DEFAULT NULL,
  `educationsystem` varchar(50) DEFAULT NULL,
  `classesoffered` varchar(50) DEFAULT NULL,
  `schoolcolors` varchar(50) DEFAULT NULL,
  `athleticsconference` varchar(50) DEFAULT NULL,
  `teamname` varchar(50) DEFAULT NULL,
  `usnwrranking` varchar(50) DEFAULT NULL,
  `feederschools` varchar(50) DEFAULT NULL,
  `affiliation` varchar(50) DEFAULT NULL,
  `ed_level` varchar(25) DEFAULT NULL,
  `schooltype` varchar(50) DEFAULT NULL,
  `founded` varchar(50) DEFAULT NULL,
  `assistantprincipals` varchar(50) DEFAULT NULL,
  `staff` varchar(50) DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  `campus` varchar(50) DEFAULT NULL,
  `rivals` varchar(50) DEFAULT NULL,
  `communitiesserved` varchar(50) DEFAULT NULL,
  `formernames` varchar(50) DEFAULT NULL,
  `endowment` varchar(50) DEFAULT NULL,
  `president` varchar(50) DEFAULT NULL,
  `provost` varchar(50) DEFAULT NULL,
  `academicstaff` varchar(50) DEFAULT NULL,
  `students` varchar(50) DEFAULT NULL,
  `undergraduates` varchar(50) DEFAULT NULL,
  `postgraduates` varchar(50) DEFAULT NULL,
  `doctoralstudents` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `sports` varchar(50) DEFAULT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `affiliations` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`s_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `school`
--

INSERT INTO `school` (`s_id`, `name`, `type`, `coordinates`, `motto`, `religiousaffiliations`, `established`, `principal`, `headmaster`, `chaplain`, `faculty`, `grades`, `gender`, `numberofstudents`, `campussize`, `campustype`, `colors`, `athletics`, `mascot`, `rival`, `accreditation`, `averagesatscores`, `averageactscores`, `publication`, `newspaper`, `yearbook`, `tuition`, `website`, `link`, `status`, `schoolboard`, `schooldistrict`, `ncesdistrictid`, `oversight`, `ceebcode`, `ncesschoolid`, `enrollment`, `studenttoteacherratio`, `educationsystem`, `classesoffered`, `schoolcolors`, `athleticsconference`, `teamname`, `usnwrranking`, `feederschools`, `affiliation`, `ed_level`, `schooltype`, `founded`, `assistantprincipals`, `staff`, `language`, `campus`, `rivals`, `communitiesserved`, `formernames`, `endowment`, `president`, `provost`, `academicstaff`, `students`, `undergraduates`, `postgraduates`, `doctoralstudents`, `location`, `sports`, `nickname`, `affiliations`) VALUES
(1, 'Nettleton High School (Arkansas)', '', '35Â°48â€²45â€³N  90Â°38â€²58â€³W    /  35.81250Â°N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '9-12', NULL, '', NULL, 'City; small', NULL, NULL, 'Raider', NULL, 'AdvancED (1965-)', NULL, NULL, NULL, NULL, NULL, NULL, 'nettleton.ar.schoolwebpages.com.', 'http://en.wikipedia.org/wiki/Nettleton_High_School', 'Open', 'Nettleton School Board', 'Nettleton School District', '0510440', 'Arkansas Department of Education (ADE)', '041815', '051044000762', '877Â (2010-11[ 2] )', '13.27', 'ADE Smart Core curriculum', 'Regular, Advanced Placement', 'Â Â Â Â   Black\r\n Â Â Â Â   Gold', '5A East (2012-14)', 'Nettleton Raiders', 'Unranked (2012)', 'Nettleton Junior High School (6-8)', 'Arkansas Activities Association (AAA)', 'High School', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Jonesboro High School (Arkansas)', '', NULL, NULL, NULL, NULL, 'David Clark', NULL, NULL, NULL, '10â€“12', NULL, '', NULL, NULL, 'Â Â Â Â   Black Â Â Â Â   Gold Â Â Â Â   White', NULL, 'Golden Hurricane', NULL, 'North Central Association (NCA) Commission on Accr', NULL, NULL, NULL, NULL, NULL, NULL, 'www.jps.k12.ar.us', 'http://en.wikipedia.org/wiki/Jonesboro_High_School', NULL, NULL, 'Jonesboro Public Schools', NULL, NULL, NULL, NULL, '1,066Â (2013-14)', NULL, NULL, NULL, NULL, '7A/6A East (2012-14)', NULL, NULL, 'Annie Camp Junior High School\r\n Douglas MacArthur ', NULL, 'High School', 'Public, secondary school', '1899Â (1899 )', 'Shannon Lewis\r\n Brett Brown', '118', 'English', 'Suburban', 'West Memphis High School\r\n Nettleton High School\r\n', 'Jonesboro, tnÂ°', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Texas A&amp;amp;M University', 'Flagship state university\r\n Land-grant university\r\n Sea-grant university\r\n Space-grant university', NULL, NULL, NULL, '1876', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 'Â   Â Maroon and white', 'NCAA Division I â€“ SEC', 'Reveille VIII', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'www.tamu.edu', 'http://en.wikipedia.org/wiki/Texas_A%26M_Universit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'College', NULL, NULL, NULL, NULL, NULL, 'College town/Suburban, 5,500 acres (20Â km2)', NULL, NULL, 'The Agricultural and Mechanical College of Texas (', '$ 7.6 billion(2012)', 'Mark Hussey', 'Karan Watson', '2,700', '62,185 (Fall 2014)', '47,567 (Fall 2014)', '14,618 (Fall 2014)', '4,804 (Fall 2014)', 'College Station , Texas , US', '20 varsity teams', 'Aggies', 'Texas A&amp;M University System AAU CONAHEC ORAU U');

-- --------------------------------------------------------

--
-- Table structure for table `sg_permissions`
--

CREATE TABLE IF NOT EXISTS `sg_permissions` (
  `access_type` varchar(30) NOT NULL,
  `towhom` varchar(30) NOT NULL,
  `date_g` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `granted_by` varchar(35) NOT NULL,
  `sgp_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sgp_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `sg_permissions`
--

INSERT INTO `sg_permissions` (`access_type`, `towhom`, `date_g`, `granted_by`, `sgp_id`) VALUES
('friend snowglobe', 'nolvorite', '2014-12-16 00:00:00', 'nerd', 1),
('friend snowglobe', 'nerd', '2014-12-17 00:00:00', 'nolvorite', 2),
('friend snowglobe', 'nolvorite', '0000-00-00 00:00:00', 'nolvorite', 3),
('friend snowglobe', 'test_user4aaaasd', '0000-00-00 00:00:00', 'test_user4aaaasd', 4),
('friend snowglobe', 'test_9', '0000-00-00 00:00:00', 'test_9', 5),
('friend snowglobe', 'asdasdas', '0000-00-00 00:00:00', 'asdasdas', 6),
('friend snowglobe', 'nerd', '0000-00-00 00:00:00', 'nerd', 7);

-- --------------------------------------------------------

--
-- Table structure for table `sg_settings`
--

CREATE TABLE IF NOT EXISTS `sg_settings` (
  `id` varchar(36) NOT NULL,
  `a1_check` varchar(30) DEFAULT NULL,
  `a2_check` varchar(30) DEFAULT NULL,
  `a3_check` varchar(30) DEFAULT NULL,
  `a4_check` varchar(30) DEFAULT NULL,
  `a5_check` varchar(30) DEFAULT NULL,
  `real_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`real_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `sg_settings`
--

INSERT INTO `sg_settings` (`id`, `a1_check`, `a2_check`, `a3_check`, `a4_check`, `a5_check`, `real_id`) VALUES
('user_1', 'all', 'all', 'all', 'self', 'self', 1),
('user_27', 'all', 'all', 'all', 'self', 'self', 2),
('user_31', 'all', 'all', 'all', 'self', 'self', 3),
('user_32', 'all', 'all', 'all', 'self', 'self', 4),
('user_36', 'all', 'all', 'all', 'self', 'self', 5);

-- --------------------------------------------------------

--
-- Table structure for table `snowglobes`
--

CREATE TABLE IF NOT EXISTS `snowglobes` (
  `sg_id` int(11) NOT NULL AUTO_INCREMENT,
  `sg_name` varchar(80) NOT NULL,
  `description` varchar(250) NOT NULL,
  `root_admin_id` int(11) NOT NULL,
  `sg_url` varchar(30) NOT NULL,
  `sg_privacy` varchar(15) NOT NULL,
  `is_finished_being_modified` varchar(15) NOT NULL DEFAULT '0',
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sg_id`),
  UNIQUE KEY `sg_url` (`sg_url`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `snowglobes`
--

INSERT INTO `snowglobes` (`sg_id`, `sg_name`, `description`, `root_admin_id`, `sg_url`, `sg_privacy`, `is_finished_being_modified`, `creation_date`) VALUES
(1, 'Anything at all', '', 1, 'anything_at_all', 'private', '0', '2015-02-10 00:08:03');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `username` char(25) DEFAULT NULL,
  `password` char(50) DEFAULT NULL,
  `isvalidated` int(11) DEFAULT NULL,
  `email` char(50) DEFAULT NULL,
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `joindate` datetime DEFAULT NULL,
  `fullname` char(30) DEFAULT NULL,
  `admin_notifs` varchar(6) DEFAULT NULL,
  `root_admin_status` varchar(6) DEFAULT NULL,
  `month2` int(5) DEFAULT NULL,
  `day2` int(5) DEFAULT NULL,
  `year2` int(4) DEFAULT NULL,
  `salt` varchar(60) DEFAULT NULL,
  `login_attempts` varchar(1) DEFAULT NULL,
  `login_att_last` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_active_at` datetime DEFAULT '0000-00-00 00:00:00',
  `last_activity` varchar(30) DEFAULT NULL,
  `tabbed_users` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `root_admin_status` (`root_admin_status`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `isvalidated`, `email`, `userid`, `joindate`, `fullname`, `admin_notifs`, `root_admin_status`, `month2`, `day2`, `year2`, `salt`, `login_attempts`, `login_att_last`, `last_active_at`, `last_activity`, `tabbed_users`) VALUES
('nolvorite', 'd83ab46b4325d8bcd1102188c38d8a098b23a168', 1, 'hns_marcon@hotmail.com', 1, '2014-11-14 23:52:34', 'Hans Marcon', 'on', '1', 4, 9, 1996, '6c478c525f517a7ab838', '0', '2015-02-06 22:18:40', '2015-02-10 23:47:51', NULL, '["nerd"]'),
('test_user4aaaasd', 'c08c7f680792684058eafc92e8e1e85e07617eff', NULL, 'asdasdas@asda.asdas', 27, '2014-11-13 21:16:30', 'asdas asdas', 'on', NULL, 12, 16, 1994, 'aad763cbecdacccb1f63', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL),
('test_9', '6e1d3ee1ec90c3617dc4aff58fe39bba75a8b68e', NULL, 'laskdla@alsdkalsd.asdjas', 31, '2014-11-14 23:21:41', 'asdajsdjaks asdjaks', 'on', NULL, 4, 19, 1996, '3aab2407326f6ada6661', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL),
('asdasdas', 'ef659ade9df94a0bc3e792ec9e2f81095d375a48', NULL, 'hns_marcon@hotmail.coma', 32, '2014-11-13 21:16:30', 'asdasd asd asdas', 'on', NULL, 11, 15, 1999, 'e64ec838d0dba46ea10a', '0', '2014-12-02 00:06:50', '0000-00-00 00:00:00', NULL, NULL),
('nerd', '0989807af1ccfc712499519ebcb0e742b0597918', NULL, 'nerd@nerd.nerd', 36, '2014-12-14 22:10:24', 'John Hammercock', 'on', NULL, 6, 5, 1976, '9f5106ab7ebfe0e42b9a', '0', '2014-12-17 21:26:35', '2015-02-06 19:15:46', NULL, '["nolvorite"]');

-- --------------------------------------------------------

--
-- Table structure for table `votes_q`
--

CREATE TABLE IF NOT EXISTS `votes_q` (
  `bywhom` varchar(25) NOT NULL,
  `timeof` datetime DEFAULT NULL,
  `which_post` int(11) NOT NULL,
  `vote` int(1) NOT NULL DEFAULT '1',
  `v_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`v_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=301 ;

--
-- Dumping data for table `votes_q`
--

INSERT INTO `votes_q` (`bywhom`, `timeof`, `which_post`, `vote`, `v_id`) VALUES
('nolvorite', '2014-12-02 18:57:30', 54, 1, 4),
('nolvorite', '2014-12-02 20:47:30', 55, 1, 11),
('nolvorite', '2014-12-02 21:04:23', 56, 1, 12),
('nolvorite', '2014-12-02 21:04:25', 57, 1, 13),
('nolvorite', '2014-12-02 21:27:30', 5, 1, 15),
('nolvorite', '2014-12-02 21:27:30', 6, 1, 16),
('nolvorite', '2014-12-02 21:27:31', 7, 1, 17),
('nolvorite', '2014-12-02 21:27:31', 8, 1, 18),
('nolvorite', '2014-12-02 21:27:31', 9, 1, 19),
('nolvorite', '2014-12-02 21:27:31', 10, 1, 20),
('nolvorite', '2014-12-02 21:27:32', 11, 1, 21),
('nolvorite', '2014-12-02 21:27:32', 12, 1, 22),
('nolvorite', '2014-12-02 21:27:32', 13, 1, 23),
('nolvorite', '2014-12-02 21:27:32', 14, 1, 24),
('nolvorite', '2014-12-02 21:27:32', 15, 1, 25),
('nolvorite', '2014-12-02 21:27:32', 16, 1, 26),
('nolvorite', '2014-12-02 21:27:32', 17, 1, 27),
('nolvorite', '2014-12-02 21:27:32', 18, 1, 28),
('nolvorite', '2014-12-02 21:27:32', 19, 1, 29),
('nolvorite', '2014-12-02 21:27:33', 21, 1, 30),
('nolvorite', '2014-12-02 21:27:33', 22, 1, 31),
('nolvorite', '2014-12-02 21:27:33', 23, 1, 32),
('nolvorite', '2014-12-02 21:27:33', 24, 1, 33),
('nolvorite', '2014-12-02 21:27:33', 25, 1, 34),
('nolvorite', '2014-12-02 21:27:33', 26, 1, 35),
('nolvorite', '2014-12-02 21:27:33', 27, 1, 36),
('nolvorite', '2014-12-02 21:27:33', 28, 1, 37),
('nolvorite', '2014-12-02 21:27:34', 29, 1, 38),
('nolvorite', '2014-12-02 21:27:34', 30, 1, 39),
('nolvorite', '2014-12-02 21:27:34', 31, 1, 40),
('nolvorite', '2014-12-02 21:27:34', 32, 1, 41),
('nolvorite', '2014-12-02 21:27:34', 33, 1, 42),
('nolvorite', '2014-12-02 21:27:35', 34, 1, 43),
('nolvorite', '2014-12-02 21:27:35', 35, 1, 44),
('nolvorite', '2014-12-02 21:27:35', 36, 1, 45),
('nolvorite', '2014-12-02 21:27:35', 37, 1, 46),
('nolvorite', '2014-12-02 21:27:35', 38, 1, 47),
('nolvorite', '2014-12-02 21:27:35', 39, 1, 48),
('nolvorite', '2014-12-02 21:27:35', 40, 1, 49),
('nolvorite', '2014-12-02 21:27:36', 41, 1, 50),
('nolvorite', '2014-12-02 21:27:36', 42, 1, 51),
('nolvorite', '2014-12-02 21:27:36', 43, 1, 52),
('nolvorite', '2014-12-02 21:27:36', 44, 1, 53),
('nolvorite', '2014-12-02 21:27:36', 45, 1, 54),
('nolvorite', '2014-12-02 21:27:36', 46, 1, 55),
('nolvorite', '2014-12-02 21:27:36', 47, 1, 56),
('nolvorite', '2014-12-02 21:27:37', 48, 1, 57),
('nolvorite', '2014-12-02 21:27:37', 49, 1, 58),
('nolvorite', '2014-12-02 21:27:37', 50, 1, 59),
('nolvorite', '2014-12-02 21:27:37', 51, 1, 60),
('nolvorite', '2014-12-02 21:27:37', 52, 1, 61),
('nolvorite', '2014-12-02 21:27:37', 53, 1, 62),
('nolvorite', '2014-12-02 21:29:22', 58, 1, 64),
('nolvorite', '2014-12-03 19:29:43', 59, 1, 65),
('nolvorite', '2014-12-04 19:49:30', 60, 1, 66),
('nolvorite', '2014-12-05 18:03:59', 61, 1, 69),
('nolvorite', '2014-12-07 19:37:09', 62, 1, 70),
('nolvorite', '2014-12-06 23:07:11', 63, 1, 71),
('nolvorite', '2014-12-06 23:13:55', 64, 1, 72),
('nolvorite', '2014-12-07 19:22:45', 88, 1, 75),
('', '2014-12-12 13:32:06', 58, 0, 78),
('nolvorite', '2014-12-22 10:20:23', 89, 0, 83),
('nolvorite', '2014-12-17 15:42:44', 90, 1, 84),
('nolvorite', '2014-12-14 21:16:15', 0, 1, 85),
('nolvorite', '2014-12-14 21:16:16', 91, 1, 86),
('nolvorite', '2014-12-14 21:16:23', 0, 1, 87),
('nolvorite', '2014-12-14 21:16:24', 92, 1, 88),
('nerd', '2014-12-14 22:19:24', 94, 1, 89),
('nerd', '2014-12-14 22:30:23', 0, 1, 90),
('nerd', '2014-12-14 22:30:23', 95, 1, 91),
('nerd', '2014-12-14 22:33:12', 0, 1, 92),
('nerd', '2014-12-14 22:33:12', 96, 1, 93),
('nerd', '2014-12-14 22:42:30', 0, 1, 94),
('nerd', '2014-12-14 22:42:30', 97, 1, 95),
('nolvorite', '2014-12-14 22:45:17', 0, 1, 96),
('nolvorite', '2014-12-14 22:45:17', 98, 1, 97),
('nerd', '2014-12-14 22:50:28', 0, 1, 98),
('nerd', '2014-12-14 22:50:29', 99, 1, 99),
('nerd', '2014-12-14 22:53:20', 0, 1, 100),
('nerd', '2014-12-14 22:53:20', 100, 1, 101),
('nerd', '2014-12-14 23:32:41', 101, 1, 102),
('nerd', '2014-12-14 22:56:18', 0, 1, 103),
('nerd', '2014-12-14 22:56:19', 102, 1, 104),
('nerd', '2014-12-14 22:56:42', 0, 1, 105),
('nerd', '2014-12-14 22:56:42', 103, 1, 106),
('nolvorite', '2014-12-14 23:06:18', 0, 1, 107),
('nolvorite', '2014-12-14 23:06:18', 104, 1, 108),
('nolvorite', '2014-12-14 23:11:14', 0, 1, 109),
('nolvorite', '2014-12-14 23:11:14', 105, 1, 110),
('nolvorite', '2014-12-14 23:17:57', 0, 1, 111),
('nolvorite', '2014-12-14 23:17:57', 106, 1, 112),
('nolvorite', '2014-12-14 23:19:34', 0, 1, 113),
('nolvorite', '2014-12-14 23:19:35', 107, 1, 114),
('nerd', '2014-12-14 23:21:55', 0, 1, 115),
('nerd', '2014-12-14 23:21:55', 108, 1, 116),
('nerd', '2014-12-14 23:22:19', 0, 1, 117),
('nerd', '2014-12-14 23:22:20', 109, 1, 118),
('nerd', '2014-12-14 23:27:31', 0, 1, 119),
('nerd', '2014-12-14 23:27:31', 110, 1, 120),
('nerd', '2014-12-14 23:27:56', 0, 1, 121),
('nerd', '2014-12-14 23:27:57', 111, 1, 122),
('nerd', '2014-12-14 23:30:21', 0, 1, 123),
('nerd', '2014-12-14 23:30:22', 112, 1, 124),
('nerd', '2014-12-14 23:30:48', 0, 1, 125),
('nerd', '2014-12-14 23:30:48', 113, 1, 126),
('nerd', '2014-12-14 23:31:17', 0, 1, 127),
('nerd', '2014-12-14 23:31:18', 114, 1, 128),
('nerd', '2014-12-14 23:37:19', 0, 1, 129),
('nerd', '2014-12-14 23:37:20', 115, 1, 130),
('nerd', '2014-12-14 23:38:11', 0, 1, 131),
('nerd', '2014-12-14 23:38:11', 116, 1, 132),
('nerd', '2014-12-14 23:44:16', 0, 1, 133),
('nerd', '2014-12-14 23:44:16', 117, 1, 134),
('nolvorite', '2014-12-17 13:40:03', 0, 1, 135),
('nolvorite', '2014-12-17 13:40:04', 118, 1, 136),
('nolvorite', '2014-12-17 14:20:55', 94, 1, 137),
('nolvorite', '2014-12-17 14:20:58', 101, 1, 138),
('nerd', '2014-12-17 15:42:44', 90, 1, 139),
('nerd', '2014-12-17 15:44:38', 87, 1, 140),
('nerd', '2014-12-22 10:20:23', 89, 0, 142),
('nerd', '2014-12-17 16:13:28', 88, 1, 143),
('nerd', '2014-12-17 21:27:07', 120, 1, 144),
('nerd', '2014-12-17 21:33:50', 121, 1, 145),
('nerd', '2014-12-17 21:35:03', 122, 1, 146),
('nerd', '2014-12-17 21:36:10', 123, 1, 147),
('nerd', '2014-12-17 21:36:30', 124, 1, 148),
('nerd', '2014-12-17 21:36:54', 125, 1, 149),
('nerd', '2014-12-17 21:37:26', 126, 1, 150),
('nerd', '2014-12-17 21:42:06', 127, 1, 151),
('nerd', '2014-12-17 21:45:46', 128, 1, 152),
('nerd', '2014-12-17 21:49:27', 129, 1, 153),
('nerd', '2014-12-17 21:54:24', 130, 1, 154),
('nerd', '2014-12-17 21:56:27', 131, 1, 155),
('nerd', '2014-12-17 21:59:01', 132, 1, 156),
('nerd', '2014-12-17 22:01:39', 133, 1, 157),
('nerd', '2014-12-17 22:03:51', 134, 1, 158),
('nerd', '2014-12-17 22:05:41', 135, 1, 159),
('nerd', '2014-12-17 22:06:46', 136, 1, 160),
('nerd', '2014-12-17 22:15:46', 137, 1, 161),
('nolvorite', '2014-12-19 10:24:14', 138, 1, 162),
('nolvorite', '2015-01-03 13:20:30', 139, 1, 163),
('nerd', '2014-12-28 15:34:24', 138, 0, 164),
('nerd', '2015-01-03 13:20:30', 139, 1, 165),
('nerd', '2014-12-28 15:42:42', 62, 0, 166),
('nerd', '2014-12-28 15:46:25', 61, 0, 167),
('nolvorite', '2014-12-28 15:47:56', 140, 1, 168),
('nolvorite', '2014-12-28 16:03:14', 141, 1, 169),
('nolvorite', '2014-12-28 16:06:11', 142, 1, 170),
('nolvorite', '2014-12-28 16:07:07', 143, 1, 171),
('nerd', '2014-12-28 16:08:33', 144, 1, 172),
('nolvorite', '2014-12-28 16:09:26', 145, 1, 173),
('nerd', '2014-12-28 16:10:32', 146, 1, 174),
('nolvorite', '2014-12-28 16:12:13', 147, 1, 175),
('nolvorite', '2014-12-28 16:57:13', 148, 1, 176),
('nolvorite', '2014-12-28 16:57:42', 149, 1, 177),
('nolvorite', '2014-12-28 16:59:11', 150, 1, 178),
('nolvorite', '2014-12-28 17:00:51', 151, 1, 179),
('nolvorite', '2014-12-28 18:26:54', 152, 1, 180),
('nolvorite', '2014-12-28 18:27:20', 153, 1, 181),
('nolvorite', '2014-12-28 18:34:26', 155, 1, 182),
('nolvorite', '2014-12-28 18:34:49', 156, 1, 183),
('nolvorite', '2014-12-29 20:25:12', 157, 1, 184),
('nerd', '2015-01-03 12:49:08', 158, 1, 185),
('nerd', '2015-01-13 16:39:57', 158, 1, 186),
('nerd', '2015-01-13 16:40:44', 158, 1, 187),
('nolvorite', '2015-01-14 16:44:52', 159, 1, 188),
('nerd', '2015-01-14 16:50:00', 160, 1, 189),
('nolvorite', '2015-01-14 22:17:03', 161, 1, 190),
('nerd', '2015-01-14 22:40:25', 162, 1, 191),
('nerd', '2015-01-14 22:41:43', 163, 1, 192),
('nerd', '2015-01-14 22:42:34', 164, 1, 193),
('nolvorite', '2015-01-14 22:49:44', 165, 1, 194),
('nolvorite', '2015-01-14 22:50:55', 166, 1, 195),
('nolvorite', '2015-01-14 22:51:32', 167, 1, 196),
('nolvorite', '2015-01-14 22:54:24', 167, 1, 197),
('nolvorite', '2015-01-14 22:55:57', 168, 1, 198),
('nolvorite', '2015-01-14 22:59:18', 169, 1, 199),
('nolvorite', '2015-01-14 22:59:57', 170, 1, 200),
('nolvorite', '2015-01-14 23:09:32', 172, 1, 201),
('nolvorite', '2015-01-14 23:09:58', 173, 1, 202),
('nolvorite', '2015-01-14 23:15:22', 174, 1, 203),
('nolvorite', '2015-01-14 23:16:54', 175, 1, 204),
('nerd', '2015-01-14 23:17:10', 170, 1, 205),
('nerd', '2015-01-14 23:17:11', 168, 1, 206),
('nolvorite', '2015-01-14 23:17:56', 176, 1, 207),
('nolvorite', '2015-01-15 01:00:45', 176, 1, 208),
('nolvorite', '2015-01-15 01:01:27', 176, 1, 209),
('nolvorite', '2015-01-15 01:02:02', 176, 1, 210),
('nolvorite', '2015-01-15 01:03:22', 176, 1, 211),
('nolvorite', '2015-01-15 18:08:07', 177, 1, 212),
('nolvorite', '2015-01-15 18:15:11', 178, 1, 213),
('nolvorite', '2015-01-15 18:16:18', 179, 1, 214),
('nerd', '2015-01-15 22:06:27', 180, 1, 215),
('nerd', '2015-01-15 22:07:26', 181, 1, 216),
('nolvorite', '2015-01-15 22:08:06', 182, 1, 217),
('nerd', '2015-01-15 22:08:21', 183, 1, 218),
('nolvorite', '2015-01-15 22:25:43', 184, 1, 219),
('nerd', '2015-01-15 22:25:59', 185, 1, 220),
('nolvorite', '2015-01-15 23:41:35', 186, 1, 221),
('nolvorite', '2015-01-16 17:40:08', 186, 1, 222),
('nolvorite', '2015-01-16 18:03:49', 187, 1, 223),
('nolvorite', '2015-01-16 19:52:23', 188, 1, 224),
('nolvorite', '2015-01-16 20:17:07', 191, 1, 225),
('nolvorite', '2015-01-16 20:31:36', 195, 1, 226),
('nolvorite', '2015-01-16 20:34:53', 196, 1, 227),
('nolvorite', '2015-01-16 20:35:49', 197, 1, 228),
('nolvorite', '2015-01-16 20:40:42', 198, 1, 229),
('nolvorite', '2015-01-16 20:43:35', 199, 1, 230),
('nolvorite', '2015-01-16 20:46:21', 200, 1, 231),
('nolvorite', '2015-01-16 21:37:24', 201, 1, 232),
('nolvorite', '2015-01-16 21:39:28', 202, 1, 233),
('nolvorite', '2015-01-16 21:40:40', 203, 1, 234),
('nolvorite', '2015-01-16 21:41:42', 204, 1, 235),
('nerd', '2015-01-16 21:43:23', 205, 1, 236),
('nerd', '2015-01-16 21:47:08', 206, 1, 237),
('nerd', '2015-01-16 21:50:57', 206, 1, 238),
('nerd', '2015-01-16 21:51:46', 207, 1, 239),
('nolvorite', '2015-01-16 21:52:09', 208, 1, 240),
('nerd', '2015-01-16 21:57:13', 209, 1, 241),
('nolvorite', '2015-01-16 21:58:04', 210, 1, 242),
('nerd', '2015-01-16 22:00:27', 211, 1, 243),
('nerd', '2015-01-16 22:05:09', 212, 1, 244),
('nerd', '2015-01-16 22:08:02', 213, 1, 245),
('nerd', '2015-01-16 22:13:11', 214, 1, 246),
('nerd', '2015-01-16 22:15:10', 214, 1, 247),
('nolvorite', '2015-01-16 22:22:37', 216, 1, 248),
('nolvorite', '2015-01-16 22:29:13', 217, 1, 249),
('nolvorite', '2015-01-16 23:10:49', 218, 1, 250),
('nolvorite', '2015-01-16 23:12:15', 219, 1, 251),
('nolvorite', '2015-01-16 23:12:58', 220, 1, 252),
('nolvorite', '2015-01-16 23:21:27', 222, 1, 253),
('nolvorite', '2015-01-16 23:23:15', 223, 1, 254),
('nolvorite', '2015-01-16 23:34:04', 226, 1, 256),
('nolvorite', '2015-01-16 23:37:24', 227, 1, 257),
('nolvorite', '2015-01-16 23:38:11', 228, 1, 258),
('nolvorite', '2015-01-16 23:38:38', 229, 1, 259),
('nerd', '2015-01-16 23:39:00', 230, 1, 260),
('nolvorite', '2015-01-17 20:50:30', 231, 1, 261),
('nerd', '2015-01-17 20:51:52', 232, 1, 262),
('nerd', '2015-01-17 20:52:00', 233, 1, 263),
('nerd', '2015-01-17 20:53:11', 234, 1, 264),
('nerd', '2015-01-17 21:02:47', 235, 1, 265),
('nerd', '2015-01-17 21:03:09', 235, 1, 266),
('nerd', '2015-01-17 21:08:18', 236, 1, 267),
('nolvorite', '2015-01-17 21:11:42', 237, 1, 268),
('nerd', '2015-01-17 21:16:04', 238, 1, 269),
('nolvorite', '2015-01-17 21:31:43', 237, 1, 270),
('nolvorite', '2015-01-17 21:33:22', 239, 1, 271),
('nolvorite', '2015-01-17 21:34:57', 239, 1, 272),
('nolvorite', '2015-01-17 21:35:42', 239, 1, 273),
('nolvorite', '2015-01-17 21:37:39', 240, 1, 274),
('nerd', '2015-01-18 15:53:46', 241, 1, 275),
('nolvorite', '2015-01-20 14:05:23', 240, 1, 276),
('nolvorite', '2015-01-20 14:07:03', 243, 1, 277),
('nolvorite', '2015-01-20 14:08:03', 244, 1, 278),
('nerd', '2015-01-20 14:08:25', 245, 1, 279),
('nolvorite', '2015-01-20 14:27:46', 246, 1, 280),
('nolvorite', '2015-01-20 14:28:39', 247, 1, 281),
('nolvorite', '2015-01-20 14:29:40', 248, 1, 282),
('nolvorite', '2015-01-20 14:32:41', 248, 1, 283),
('nolvorite', '2015-01-20 14:33:25', 248, 1, 284),
('nolvorite', '2015-01-20 14:35:16', 249, 1, 285),
('nolvorite', '2015-01-20 14:36:29', 250, 1, 286),
('nolvorite', '2015-01-20 14:42:17', 251, 1, 287),
('nerd', '2015-01-20 14:44:51', 252, 1, 288),
('nerd', '2015-01-20 14:45:24', 253, 1, 289),
('nolvorite', '2015-01-20 15:07:55', 254, 1, 290),
('nolvorite', '2015-01-23 22:19:44', 255, 1, 291),
('nolvorite', '2015-01-27 17:43:57', 256, 1, 292),
('nolvorite', '2015-02-04 23:29:21', 291, 1, 293),
('nolvorite', '2015-02-05 17:12:00', 296, 1, 294),
('nolvorite', '2015-02-05 17:12:52', 297, 1, 295),
('nolvorite', '2015-02-05 17:13:57', 298, 1, 296),
('nolvorite', '2015-02-05 17:15:17', 299, 1, 297),
('nolvorite', '2015-02-05 17:21:38', 307, 1, 298),
('nolvorite', '2015-02-05 17:22:20', 308, 1, 299),
('nolvorite', '2015-02-10 22:19:48', 309, 1, 300);
--
-- Database: `framework`
--
CREATE DATABASE IF NOT EXISTS `framework` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `framework`;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` char(65) NOT NULL,
  `password` char(35) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;
--
-- Database: `inkling`
--
CREATE DATABASE IF NOT EXISTS `inkling` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `inkling`;

-- --------------------------------------------------------

--
-- Table structure for table `auth_log`
--

CREATE TABLE IF NOT EXISTS `auth_log` (
  `auth_id` int(11) NOT NULL AUTO_INCREMENT,
  `time_s` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_auth` int(11) NOT NULL,
  `permission` char(25) NOT NULL,
  PRIMARY KEY (`auth_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `auth_log`
--

INSERT INTO `auth_log` (`auth_id`, `time_s`, `id_auth`, `permission`) VALUES
(1, '2014-05-21 01:31:28', 1, 't_adm_testpage'),
(2, '2014-05-21 01:31:28', 1, 't_adm_politics'),
(3, '2014-05-21 01:31:28', 1, 't_adm_official');

-- --------------------------------------------------------

--
-- Table structure for table `internal_config`
--

CREATE TABLE IF NOT EXISTS `internal_config` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `date_f` char(20) NOT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `internal_config`
--

INSERT INTO `internal_config` (`s_id`, `date_f`) VALUES
(1, 'F j, Y, g:i A');

-- --------------------------------------------------------

--
-- Table structure for table `msgs`
--

CREATE TABLE IF NOT EXISTS `msgs` (
  `sender` int(11) NOT NULL,
  `recipient` int(11) NOT NULL,
  `datesend` datetime NOT NULL,
  `title` char(75) NOT NULL,
  `status` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `p_cat`
--

CREATE TABLE IF NOT EXISTS `p_cat` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_name` char(35) DEFAULT NULL,
  `description` mediumtext NOT NULL,
  `cr_by_id` int(11) NOT NULL,
  `cr_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `url_id` char(20) NOT NULL,
  `rules` mediumtext,
  `is_private` int(11) DEFAULT NULL,
  `topic_rights` int(11) NOT NULL,
  PRIMARY KEY (`c_id`),
  UNIQUE KEY `url_id` (`url_id`),
  UNIQUE KEY `c_name` (`c_name`),
  KEY `p_cat_index` (`cr_by_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `p_cat`
--

INSERT INTO `p_cat` (`c_id`, `c_name`, `description`, `cr_by_id`, `cr_date`, `url_id`, `rules`, `is_private`, `topic_rights`) VALUES
(1, 'Official News', 'All official news from Abstract - define your world.', 1, '2014-05-05 15:13:40', 'official', NULL, NULL, 0),
(4, 'Politics', 'All political news, and political discussion.', 1, '2014-05-07 00:31:19', 'politics', NULL, NULL, 0),
(8, 'Test Page', 'Bug fixes, essentially.', 1, '2014-05-21 01:08:22', 'testpage', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `p_format`
--

CREATE TABLE IF NOT EXISTS `p_format` (
  `z_name` char(20) DEFAULT NULL,
  `param_start` longtext NOT NULL,
  `param_end` longtext NOT NULL,
  `param_2` longtext,
  `param_3` longtext,
  `is_special` int(11) NOT NULL,
  `conv_start` longtext NOT NULL,
  `conv_end` longtext NOT NULL,
  `pf_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`pf_id`),
  UNIQUE KEY `z_name` (`z_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `p_format`
--

INSERT INTO `p_format` (`z_name`, `param_start`, `param_end`, `param_2`, `param_3`, `is_special`, `conv_start`, `conv_end`, `pf_id`) VALUES
('', '', '', NULL, NULL, 0, '', '', 7);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `poster_id` int(11) NOT NULL,
  `content` mediumtext NOT NULL,
  `Postdate` datetime DEFAULT NULL,
  `category` varchar(123) DEFAULT NULL,
  `t_name` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`t_id`, `poster_id`, `content`, `Postdate`, `category`, `t_name`) VALUES
(4, 1, 'I hope Rand Paul is just acting more conservative for the national election... he seems nothing like his dad', '2014-05-12 12:21:36', 'politics', '2016...'),
(5, 1, 'Seriously, third parties rarely have a say.', '2014-05-19 18:15:46', 'politics', 'The two-party system is bad for America.');

-- --------------------------------------------------------

--
-- Table structure for table `site_init`
--

CREATE TABLE IF NOT EXISTS `site_init` (
  `site_started` datetime DEFAULT NULL,
  `admin_log` int(11) NOT NULL,
  `visit_by` datetime DEFAULT NULL,
  `date_f` char(20) NOT NULL,
  `settings_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `PID` int(11) NOT NULL AUTO_INCREMENT,
  `Email` char(65) NOT NULL,
  `Password` char(35) NOT NULL,
  `Joindate` datetime DEFAULT NULL,
  `u_group` int(11) NOT NULL,
  `last_visit` datetime DEFAULT NULL,
  `post_int` int(11) DEFAULT NULL,
  `username` char(30) DEFAULT NULL,
  PRIMARY KEY (`PID`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `Email_2` (`Email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`PID`, `Email`, `Password`, `Joindate`, `u_group`, `last_visit`, `post_int`, `username`) VALUES
(1, 'hns_marcon@hotmail.com', '16521625', NULL, 79, '2014-10-16 08:56:36', NULL, NULL),
(2, 'account2@gm.c', 'asdjak', '2014-05-15 20:37:15', 0, NULL, NULL, NULL);
--
-- Database: `logs`
--
CREATE DATABASE IF NOT EXISTS `logs` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `logs`;
--
-- Database: `newswire`
--
CREATE DATABASE IF NOT EXISTS `newswire` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `newswire`;

-- --------------------------------------------------------

--
-- Table structure for table `fetus`
--

CREATE TABLE IF NOT EXISTS `fetus` (
  `ID` char(25) DEFAULT NULL,
  `Validation_Key` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE IF NOT EXISTS `logs` (
  `ip_address` varchar(15) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `time_yr` int(11) DEFAULT NULL,
  `time_mo` int(11) DEFAULT NULL,
  `time_da` int(11) DEFAULT NULL,
  `time_hr` int(11) DEFAULT NULL,
  `time_mi` int(11) DEFAULT NULL,
  `time_s` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`ip_address`, `user_id`, `time_yr`, `time_mo`, `time_da`, `time_hr`, `time_mi`, `time_s`) VALUES
('::1', 1, NULL, NULL, NULL, NULL, NULL, NULL),
('::1', 1, NULL, NULL, NULL, NULL, NULL, NULL),
('::1', 1, NULL, NULL, NULL, NULL, NULL, NULL),
('::1', 1, NULL, NULL, NULL, NULL, NULL, NULL),
('::1', 1, NULL, NULL, NULL, NULL, NULL, NULL),
('::1', 1, NULL, NULL, NULL, NULL, NULL, NULL),
('::1', 1, NULL, NULL, NULL, NULL, NULL, NULL),
('::1', 1, NULL, NULL, NULL, NULL, NULL, NULL),
('::1', 1, NULL, NULL, NULL, NULL, NULL, NULL),
('::1', 1, NULL, NULL, NULL, NULL, NULL, NULL),
('::1', 1, NULL, NULL, NULL, NULL, NULL, NULL),
('::1', 1, NULL, NULL, NULL, NULL, NULL, NULL),
('::1', 1, NULL, NULL, NULL, NULL, NULL, NULL),
('::1', 1, NULL, NULL, NULL, NULL, NULL, NULL),
('::1', 1, NULL, NULL, NULL, NULL, NULL, NULL),
('::1', 1, 0, 0, 0, 0, 0, 0),
('::1', 1, 0, 0, 0, 0, 0, 0),
('::1', 1, 0, 0, 0, 0, 0, 0),
('::1', 1, 0, 0, 0, 0, 0, 0),
('::1', 1, 0, 0, 0, 0, 0, 0),
('::1', 1, 0, 0, 0, 0, 0, 0),
('::1', 1, 0, 0, 0, 0, 0, 0),
('::1', 1, 2014, 4, 10, 0, 33, 23),
('::1', 1, 2014, 4, 10, 0, 34, 22),
('::1', 1, 2014, 4, 10, 0, 35, 41),
('::1', 1, 2014, 4, 10, 0, 40, 39),
('::1', 1, 2014, 4, 10, 0, 41, 1),
('::1', 1, 2014, 4, 9, 20, 42, 2),
('::1', 1, 2014, 4, 9, 20, 42, 56),
('::1', 1, 2014, 4, 9, 18, 43, 34),
('::1', 1, 2014, 4, 9, 20, 44, 21),
('::1', 1, 2014, 4, 10, 0, 45, 17),
('::1', 1, 2014, 4, 9, 18, 45, 42),
('::1', 1, 2014, 4, 9, 19, 46, 10),
('::1', 1, 2014, 4, 9, 19, 46, 22),
('::1', 1, 2014, 4, 9, 20, 3, 48),
('::1', 1, 2014, 4, 9, 20, 3, 50),
('::1', 1, 2014, 4, 9, 20, 4, 0),
('::1', 1, 2014, 4, 10, 16, 9, 49),
('::1', 1, 2014, 4, 10, 16, 13, 3),
('::1', 1, 2014, 4, 10, 16, 13, 12),
('::1', 1, 2014, 4, 10, 16, 13, 15),
('::1', 1, 2014, 4, 10, 16, 13, 27),
('::1', 1, 2014, 4, 10, 16, 13, 29),
('::1', 1, 2014, 4, 10, 16, 14, 22),
('::1', 1, 2014, 4, 10, 16, 14, 27),
('::1', 1, 2014, 4, 10, 16, 14, 48),
('::1', 1, 2014, 4, 10, 16, 15, 1),
('::1', 1, 2014, 4, 10, 16, 15, 4),
('::1', 1, 2014, 4, 10, 16, 15, 7),
('::1', 1, 2014, 4, 10, 16, 17, 10),
('::1', 1, 2014, 4, 10, 16, 17, 14),
('::1', 1, 2014, 4, 10, 16, 17, 16),
('::1', 1, 2014, 4, 10, 16, 20, 1),
('::1', 1, 2014, 4, 10, 16, 20, 49),
('::1', 1, 2014, 4, 10, 16, 21, 7),
('::1', 1, 2014, 4, 10, 16, 21, 54),
('::1', 1, 2014, 4, 10, 16, 22, 56),
('::1', 1, 2014, 4, 10, 16, 23, 58),
('::1', 1, 2014, 4, 10, 16, 24, 10),
('::1', 1, 2014, 4, 10, 16, 24, 11),
('::1', 1, 2014, 4, 10, 16, 25, 6),
('::1', 1, 2014, 4, 10, 16, 25, 8),
('::1', 1, 2014, 4, 10, 16, 25, 31),
('::1', 1, 2014, 4, 10, 16, 25, 36),
('::1', 1, 2014, 4, 10, 16, 29, 37),
('::1', 1, 2014, 4, 10, 16, 29, 52),
('::1', 1, 2014, 4, 10, 16, 29, 56),
('::1', 1, 2014, 4, 10, 16, 32, 12),
('::1', 1, 2014, 4, 10, 16, 32, 18),
('::1', 1, 2014, 4, 10, 16, 32, 23),
('::1', 1, 2014, 4, 10, 16, 32, 43),
('::1', 1, 2014, 4, 10, 16, 35, 0),
('::1', 1, 2014, 4, 10, 16, 37, 31),
('::1', 1, 2014, 4, 10, 16, 37, 36),
('::1', 1, 2014, 4, 10, 16, 37, 40),
('::1', 1, 2014, 4, 10, 16, 37, 54),
('::1', 1, 2014, 4, 10, 16, 38, 5),
('::1', 1, 2014, 4, 10, 16, 38, 14),
('::1', 1, 2014, 4, 10, 16, 38, 17),
('::1', 1, 2014, 4, 10, 16, 38, 26),
('::1', 1, 2014, 4, 10, 16, 38, 30),
('::1', 1, 2014, 4, 10, 16, 38, 36),
('::1', 1, 2014, 4, 10, 16, 38, 40),
('::1', 1, 2014, 4, 10, 16, 39, 15),
('::1', 1, 2014, 4, 10, 16, 42, 10),
('::1', 1, 2014, 4, 10, 16, 42, 15),
('::1', 1, 2014, 4, 10, 16, 45, 53),
('::1', 1, 2014, 4, 10, 16, 48, 59),
('::1', 1, 2014, 4, 10, 16, 49, 19),
('::1', 1, 2014, 4, 10, 16, 55, 16),
('::1', 1, 2014, 4, 10, 16, 59, 48),
('::1', 1, 2014, 4, 10, 17, 0, 16),
('::1', 1, 2014, 4, 10, 17, 0, 23),
('::1', 1, 2014, 4, 10, 17, 0, 53),
('::1', 1, 2014, 4, 10, 17, 0, 59),
('::1', 1, 2014, 4, 10, 17, 1, 8),
('::1', 1, 2014, 4, 10, 17, 1, 21),
('::1', 1, 2014, 4, 10, 17, 1, 27),
('::1', 1, 2014, 4, 10, 17, 2, 33),
('::1', 1, 2014, 4, 10, 17, 2, 56),
('::1', 1, 2014, 4, 10, 17, 3, 16),
('::1', 1, 2014, 4, 10, 17, 3, 29),
('::1', 1, 2014, 4, 10, 17, 11, 34),
('::1', 1, 2014, 4, 10, 17, 11, 58),
('::1', 1, 2014, 4, 10, 17, 12, 43),
('::1', 1, 2014, 4, 10, 17, 13, 5),
('::1', 1, 2014, 4, 10, 17, 13, 36),
('::1', 1, 2014, 4, 10, 17, 15, 10),
('::1', 1, 2014, 4, 10, 17, 26, 20),
('::1', 1, 2014, 4, 10, 17, 27, 24),
('::1', 1, 2014, 4, 10, 17, 27, 29),
('::1', 1, 2014, 4, 10, 17, 27, 35),
('::1', 1, 2014, 4, 10, 17, 27, 40),
('::1', 1, 2014, 4, 10, 17, 27, 45),
('::1', 1, 2014, 4, 10, 17, 27, 51),
('::1', 1, 2014, 4, 10, 17, 27, 56),
('::1', 1, 2014, 4, 10, 17, 28, 2),
('::1', 1, 2014, 4, 10, 17, 28, 5),
('::1', 1, 2014, 4, 10, 17, 28, 10),
('::1', 1, 2014, 4, 10, 17, 28, 16),
('::1', 1, 2014, 4, 10, 17, 28, 21),
('::1', 1, 2014, 4, 10, 17, 28, 27),
('::1', 1, 2014, 4, 10, 17, 28, 32),
('::1', 1, 2014, 4, 10, 17, 28, 38),
('::1', 1, 2014, 4, 10, 17, 28, 43),
('::1', 1, 2014, 4, 10, 17, 28, 48),
('::1', 1, 2014, 4, 10, 17, 28, 54),
('::1', 1, 2014, 4, 10, 17, 28, 59),
('::1', 1, 2014, 4, 10, 17, 29, 5),
('::1', 1, 2014, 4, 10, 17, 29, 10),
('::1', 1, 2014, 4, 10, 17, 29, 16),
('::1', 1, 2014, 4, 10, 17, 29, 21),
('::1', 1, 2014, 4, 10, 17, 29, 27),
('::1', 1, 2014, 4, 10, 17, 29, 33),
('::1', 1, 2014, 4, 10, 17, 29, 38),
('::1', 1, 2014, 4, 10, 17, 29, 44),
('::1', 1, 2014, 4, 10, 17, 29, 49),
('::1', 1, 2014, 4, 10, 17, 29, 55),
('::1', 1, 2014, 4, 10, 17, 30, 1),
('::1', 1, 2014, 4, 10, 17, 30, 5),
('::1', 1, 2014, 4, 10, 17, 30, 35),
('::1', 1, 2014, 4, 10, 17, 30, 54),
('::1', 1, 2014, 4, 10, 17, 30, 55),
('::1', 1, 2014, 4, 10, 17, 32, 25),
('::1', 1, 2014, 4, 10, 17, 33, 18),
('::1', 1, 2014, 4, 10, 17, 34, 59),
('::1', 1, 2014, 4, 10, 17, 37, 37),
('::1', 1, 2014, 4, 10, 17, 42, 6),
('::1', 1, 2014, 4, 10, 17, 42, 26),
('::1', 1, 2014, 4, 10, 17, 42, 31),
('::1', 1, 2014, 4, 10, 17, 42, 47),
('::1', 1, 2014, 4, 10, 17, 42, 50),
('::1', 1, 2014, 4, 10, 17, 42, 56),
('::1', 1, 2014, 4, 10, 17, 43, 22),
('::1', 1, 2014, 4, 10, 17, 43, 25),
('::1', 1, 2014, 4, 10, 17, 45, 36),
('::1', 1, 2014, 4, 10, 17, 46, 11),
('::1', 1, 2014, 4, 10, 17, 46, 26),
('::1', 1, 2014, 4, 10, 17, 47, 7),
('::1', 1, 2014, 4, 10, 17, 47, 19),
('::1', 1, 2014, 4, 10, 17, 47, 59),
('::1', 1, 2014, 4, 10, 17, 48, 2),
('::1', 1, 2014, 4, 10, 17, 48, 13),
('::1', 1, 2014, 4, 10, 17, 48, 19),
('::1', 1, 2014, 4, 10, 17, 50, 11),
('::1', 1, 2014, 4, 10, 17, 54, 8),
('::1', 1, 2014, 4, 10, 17, 54, 29),
('::1', 1, 2014, 4, 10, 17, 55, 39),
('::1', 1, 2014, 4, 10, 17, 57, 40),
('::1', 1, 2014, 4, 10, 17, 58, 12),
('::1', 1, 2014, 4, 10, 18, 2, 46),
('::1', 1, 2014, 4, 10, 18, 2, 50),
('::1', 1, 2014, 4, 10, 18, 2, 55),
('::1', 1, 2014, 4, 10, 18, 4, 57),
('::1', 1, 2014, 4, 10, 18, 5, 49),
('::1', 1, 2014, 4, 10, 18, 16, 30),
('::1', 1, 2014, 4, 10, 18, 16, 36),
('::1', 1, 2014, 4, 11, 21, 21, 19),
('::1', 1, 2014, 4, 11, 21, 24, 41),
('::1', 1, 2014, 4, 12, 8, 28, 39),
('::1', 1, 2014, 4, 12, 8, 31, 15),
('::1', 1, 2014, 4, 12, 8, 31, 21),
('::1', 1, 2014, 4, 12, 8, 33, 36),
('::1', 1, 2014, 4, 12, 8, 33, 43),
('::1', 1, 2014, 4, 12, 8, 33, 48),
('::1', 1, 2014, 4, 12, 8, 44, 49),
('::1', 1, 2014, 4, 12, 8, 44, 57),
('::1', 1, 2014, 4, 12, 8, 45, 6),
('::1', 1, 2014, 4, 12, 8, 45, 39),
('::1', 1, 2014, 4, 12, 8, 45, 40),
('::1', 1, 2014, 4, 12, 8, 45, 46),
('::1', 1, 2014, 4, 12, 8, 45, 52),
('::1', 1, 2014, 4, 12, 8, 46, 22),
('::1', 1, 2014, 4, 12, 8, 46, 25),
('::1', 1, 2014, 4, 12, 8, 46, 30),
('::1', 1, 2014, 4, 12, 8, 46, 47),
('::1', 1, 2014, 4, 12, 8, 46, 50),
('::1', 1, 2014, 4, 12, 8, 46, 56),
('::1', 1, 2014, 4, 12, 8, 50, 5),
('::1', 1, 2014, 4, 12, 8, 50, 8),
('::1', 1, 2014, 4, 12, 8, 50, 14),
('::1', 1, 2014, 4, 12, 8, 50, 37),
('::1', 1, 2014, 4, 12, 8, 53, 21),
('::1', 1, 2014, 4, 12, 8, 54, 36),
('::1', 1, 2014, 4, 12, 8, 55, 6),
('::1', 1, 2014, 4, 12, 8, 55, 19),
('::1', 1, 2014, 4, 12, 8, 55, 40),
('::1', 1, 2014, 4, 12, 8, 55, 43),
('::1', 1, 2014, 4, 12, 8, 55, 49),
('::1', 1, 2014, 4, 12, 8, 55, 52),
('::1', 1, 2014, 4, 12, 8, 55, 58),
('::1', 1, 2014, 4, 12, 8, 56, 2),
('::1', 1, 2014, 4, 12, 8, 58, 50),
('::1', 1, 2014, 4, 12, 9, 15, 15),
('::1', 1, 2014, 4, 12, 9, 15, 17),
('::1', 1, 2014, 4, 12, 9, 58, 25),
('::1', 1, 2014, 4, 12, 9, 58, 39),
('::1', 1, 2014, 4, 12, 9, 58, 45),
('::1', 1, 2014, 4, 12, 9, 59, 39),
('::1', 1, 2014, 4, 12, 10, 0, 10),
('::1', 1, 2014, 4, 12, 10, 0, 25),
('::1', 1, 2014, 4, 12, 10, 0, 30),
('::1', 1, 2014, 4, 12, 10, 0, 44),
('::1', 1, 2014, 4, 12, 10, 0, 49),
('::1', 1, 2014, 4, 12, 10, 1, 9),
('::1', 1, 2014, 4, 12, 10, 1, 13),
('::1', 1, 2014, 4, 12, 10, 1, 19),
('::1', 1, 2014, 4, 12, 10, 1, 30),
('::1', 1, 2014, 4, 12, 10, 1, 35),
('::1', 1, 2014, 4, 12, 10, 2, 38),
('::1', 1, 2014, 4, 12, 10, 2, 42),
('::1', 1, 2014, 4, 12, 10, 2, 47),
('::1', 1, 2014, 4, 12, 10, 3, 51),
('::1', 1, 2014, 4, 12, 10, 3, 56),
('::1', 1, 2014, 4, 12, 10, 4, 3),
('::1', 1, 2014, 4, 12, 10, 4, 8),
('::1', 1, 2014, 4, 13, 14, 21, 25),
('::1', 1, 2014, 4, 13, 14, 21, 43),
('::1', 1, 2014, 4, 13, 14, 22, 57),
('::1', 1, 2014, 4, 13, 14, 44, 3),
('::1', 1, 2014, 4, 13, 14, 44, 11),
('::1', 1, 2014, 4, 13, 14, 44, 16),
('::1', 1, 2014, 4, 13, 14, 44, 53),
('::1', 1, 2014, 4, 13, 14, 44, 56),
('::1', 1, 2014, 4, 13, 14, 45, 2),
('::1', 1, 2014, 4, 13, 14, 46, 4),
('::1', 1, 2014, 4, 13, 14, 46, 7),
('::1', 1, 2014, 4, 13, 14, 46, 13),
('::1', 1, 2014, 4, 13, 14, 46, 39),
('::1', 1, 2014, 4, 13, 14, 46, 45),
('::1', 1, 2014, 4, 13, 14, 47, 53),
('::1', 1, 2014, 4, 13, 14, 50, 29),
('::1', 1, 2014, 4, 13, 14, 50, 31),
('::1', 1, 2014, 4, 13, 14, 52, 8),
('::1', 1, 2014, 4, 13, 14, 52, 11),
('::1', 1, 2014, 4, 13, 14, 52, 14),
('::1', 1, 2014, 4, 13, 14, 52, 35),
('::1', 1, 2014, 4, 13, 14, 52, 47),
('::1', 1, 2014, 4, 13, 14, 56, 47),
('::1', 1, 2014, 4, 13, 14, 56, 53),
('::1', 1, 2014, 4, 13, 14, 57, 12),
('::1', 1, 2014, 4, 13, 14, 57, 15),
('::1', 1, 2014, 4, 13, 15, 0, 59),
('::1', 1, 2014, 4, 13, 15, 1, 2),
('::1', 1, 2014, 4, 13, 15, 1, 52),
('::1', 1, 2014, 4, 13, 15, 1, 56),
('::1', 1, 2014, 4, 13, 15, 4, 52),
('::1', 1, 2014, 4, 13, 15, 4, 52),
('::1', 1, 2014, 4, 13, 15, 5, 6),
('::1', 1, 2014, 4, 13, 15, 5, 28),
('::1', 1, 2014, 4, 13, 15, 5, 32),
('::1', 1, 2014, 4, 13, 15, 6, 21),
('::1', 1, 2014, 4, 13, 15, 6, 25),
('::1', 1, 2014, 4, 13, 15, 6, 28),
('::1', 1, 2014, 4, 13, 15, 6, 54),
('::1', 1, 2014, 4, 13, 15, 6, 56),
('::1', 1, 2014, 4, 13, 15, 16, 35),
('::1', 1, 2014, 4, 13, 15, 16, 39),
('::1', 1, 2014, 4, 13, 15, 18, 17),
('::1', 1, 2014, 4, 13, 15, 18, 21),
('::1', 1, 2014, 4, 13, 15, 21, 11),
('::1', 1, 2014, 4, 13, 15, 21, 15),
('::1', 1, 2014, 4, 13, 15, 23, 39),
('::1', 1, 2014, 4, 13, 15, 23, 46),
('::1', 1, 2014, 4, 13, 15, 24, 9),
('::1', 1, 2014, 4, 13, 15, 24, 12),
('::1', 1, 2014, 4, 13, 15, 24, 16),
('::1', 1, 2014, 4, 13, 15, 25, 11),
('::1', 1, 2014, 4, 13, 15, 25, 13),
('::1', 1, 2014, 4, 13, 15, 25, 19),
('::1', 1, 2014, 4, 13, 15, 25, 37),
('::1', 1, 2014, 4, 13, 15, 28, 11),
('::1', 1, 2014, 4, 13, 15, 28, 15),
('::1', 1, 2014, 4, 13, 15, 28, 21),
('::1', 1, 2014, 4, 13, 15, 29, 4),
('::1', 1, 2014, 4, 13, 15, 29, 9),
('::1', 1, 2014, 4, 13, 15, 29, 15),
('::1', 1, 2014, 4, 13, 15, 30, 7),
('::1', 1, 2014, 4, 13, 15, 30, 9),
('::1', 1, 2014, 4, 13, 15, 30, 15),
('::1', 1, 2014, 4, 13, 15, 31, 24),
('::1', 1, 2014, 4, 13, 15, 31, 29),
('::1', 1, 2014, 4, 13, 15, 31, 34),
('::1', 1, 2014, 4, 13, 15, 32, 10),
('::1', 1, 2014, 4, 13, 15, 36, 29),
('::1', 1, 2014, 4, 13, 15, 38, 39),
('::1', 1, 2014, 4, 13, 15, 38, 41),
('::1', 1, 2014, 4, 13, 15, 38, 43),
('::1', 1, 2014, 4, 13, 15, 38, 52),
('::1', 1, 2014, 4, 13, 15, 38, 57),
('::1', 1, 2014, 4, 13, 15, 40, 28),
('::1', 1, 2014, 4, 13, 15, 40, 33),
('::1', 1, 2014, 4, 13, 15, 40, 50),
('::1', 1, 2014, 4, 13, 15, 41, 11),
('::1', 1, 2014, 4, 13, 15, 41, 20),
('::1', 1, 2014, 4, 13, 15, 41, 22),
('::1', 1, 2014, 4, 13, 15, 41, 43),
('::1', 1, 2014, 4, 13, 15, 41, 52),
('::1', 1, 2014, 4, 13, 15, 42, 0),
('::1', 1, 2014, 4, 13, 15, 42, 22),
('::1', 1, 2014, 4, 13, 19, 31, 42),
('::1', 1, 2014, 4, 13, 19, 31, 58),
('::1', 1, 2014, 4, 13, 19, 32, 14),
('::1', 1, 2014, 4, 13, 19, 32, 18),
('::1', 1, 2014, 4, 13, 19, 32, 24),
('::1', 1, 2014, 4, 13, 19, 36, 22),
('::1', 1, 2014, 4, 13, 19, 37, 53),
('::1', 1, 2014, 4, 13, 19, 37, 56),
('::1', 1, 2014, 4, 13, 19, 38, 1),
('::1', 1, 2014, 4, 13, 19, 41, 9),
('::1', 1, 2014, 4, 13, 19, 41, 14),
('::1', 1, 2014, 4, 13, 19, 41, 19),
('::1', 1, 2014, 4, 13, 19, 41, 40),
('::1', 1, 2014, 4, 13, 19, 41, 45),
('::1', 1, 2014, 4, 13, 19, 41, 50),
('::1', 1, 2014, 4, 13, 19, 42, 17),
('::1', 1, 2014, 4, 13, 19, 42, 19),
('::1', 1, 2014, 4, 13, 19, 42, 24),
('::1', 1, 2014, 4, 13, 19, 46, 20),
('::1', 1, 2014, 4, 13, 19, 46, 29),
('::1', 1, 2014, 4, 13, 19, 46, 43),
('::1', 1, 2014, 4, 13, 19, 50, 13),
('::1', 1, 2014, 4, 13, 19, 50, 35),
('::1', 1, 2014, 4, 13, 19, 50, 38),
('::1', 1, 2014, 4, 13, 19, 50, 44),
('::1', 1, 2014, 4, 13, 19, 51, 6),
('::1', 1, 2014, 4, 13, 19, 51, 19),
('::1', 1, 2014, 4, 13, 19, 51, 22),
('::1', 1, 2014, 4, 13, 19, 51, 27),
('::1', 1, 2014, 4, 13, 19, 51, 32),
('::1', 1, 2014, 4, 13, 19, 51, 35),
('::1', 1, 2014, 4, 13, 19, 51, 41),
('::1', 1, 2014, 4, 13, 19, 53, 4),
('::1', 1, 2014, 4, 13, 19, 53, 55),
('::1', 1, 2014, 4, 13, 19, 54, 7),
('::1', 1, 2014, 4, 13, 19, 54, 42),
('::1', 1, 2014, 4, 13, 19, 54, 42),
('::1', 1, 2014, 4, 13, 19, 54, 47),
('::1', 1, 2014, 4, 13, 19, 54, 49),
('::1', 1, 2014, 4, 13, 19, 54, 57),
('::1', 1, 2014, 4, 13, 19, 55, 5),
('::1', 1, 2014, 4, 13, 19, 55, 10),
('::1', 1, 2014, 4, 13, 19, 56, 40),
('::1', 1, 2014, 4, 13, 19, 56, 42),
('::1', 1, 2014, 4, 13, 19, 56, 42),
('::1', 1, 2014, 4, 13, 19, 57, 54),
('::1', 1, 2014, 4, 13, 19, 57, 57),
('::1', 1, 2014, 4, 13, 19, 57, 57),
('::1', 1, 2014, 4, 13, 19, 58, 52),
('::1', 1, 2014, 4, 13, 19, 58, 54),
('::1', 1, 2014, 4, 13, 19, 59, 18),
('::1', 1, 2014, 4, 13, 19, 59, 20),
('::1', 1, 2014, 4, 13, 19, 59, 21),
('::1', 1, 2014, 4, 13, 19, 59, 21),
('::1', 1, 2014, 4, 13, 19, 59, 22),
('::1', 1, 2014, 4, 13, 19, 59, 47),
('::1', 1, 2014, 4, 13, 19, 59, 55),
('::1', 1, 2014, 4, 13, 19, 59, 56),
('::1', 1, 2014, 4, 13, 20, 1, 5),
('::1', 1, 2014, 4, 13, 20, 1, 25),
('::1', 1, 2014, 4, 13, 20, 1, 36),
('::1', 1, 2014, 4, 13, 20, 1, 39),
('::1', 1, 2014, 4, 13, 20, 1, 39),
('::1', 1, 2014, 4, 13, 20, 1, 55),
('::1', 1, 2014, 4, 13, 20, 1, 58),
('::1', 1, 2014, 4, 13, 20, 1, 58),
('::1', 1, 2014, 4, 13, 20, 2, 23),
('::1', 1, 2014, 4, 13, 20, 2, 23),
('::1', 1, 2014, 4, 13, 20, 2, 45),
('::1', 1, 2014, 4, 13, 20, 2, 47),
('::1', 1, 2014, 4, 13, 20, 2, 59),
('::1', 1, 2014, 4, 13, 20, 3, 3),
('::1', 1, 2014, 4, 13, 20, 3, 4),
('::1', 1, 2014, 4, 13, 20, 3, 17),
('::1', 1, 2014, 4, 13, 20, 3, 19),
('::1', 1, 2014, 4, 13, 20, 3, 33),
('::1', 1, 2014, 4, 24, 19, 0, 53),
('::1', 1, 2014, 4, 27, 8, 49, 25),
('::1', 1, 2014, 4, 29, 6, 26, 37);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `PID` int(11) NOT NULL AUTO_INCREMENT,
  `Email` char(60) DEFAULT NULL,
  `Password` char(35) DEFAULT NULL,
  PRIMARY KEY (`PID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=42 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`PID`, `Email`, `Password`) VALUES
(41, 'hns_marcon@hotmail.com', '16521625');
--
-- Database: `pacer_api_module`
--
CREATE DATABASE IF NOT EXISTS `pacer_api_module` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `pacer_api_module`;

-- --------------------------------------------------------

--
-- Table structure for table `field_names`
--

CREATE TABLE IF NOT EXISTS `field_names` (
  `fn_id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(25) NOT NULL,
  `reference` varchar(35) NOT NULL,
  `term` varchar(40) NOT NULL,
  PRIMARY KEY (`fn_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `field_names`
--

INSERT INTO `field_names` (`fn_id`, `field_name`, `reference`, `term`) VALUES
(1, 'all', 'Case type', 'All Courts\r'),
(2, 'ap', 'Case type', 'Applellate\r'),
(3, 'bk', 'Case type', 'Bankruptcy\r'),
(4, 'cv', 'Case type', 'Civil\r'),
(5, 'cr', 'Case type', 'Criminal\r'),
(6, 'mdl', 'Case type', 'Multi-District Litigation');

-- --------------------------------------------------------

--
-- Table structure for table `query_params`
--

CREATE TABLE IF NOT EXISTS `query_params` (
  `q_id` int(11) NOT NULL AUTO_INCREMENT,
  `query_name` varchar(50) NOT NULL,
  `is_enabled` varchar(5) NOT NULL,
  PRIMARY KEY (`q_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `query_params`
--

INSERT INTO `query_params` (`q_id`, `query_name`, `is_enabled`) VALUES
(1, 'Party name\r', '1'),
(2, 'Party role\r', '1'),
(3, 'Court ID\r', '1'),
(4, 'Case year\r', '1'),
(5, 'Case number\r', '1'),
(6, 'Case Office\r', '1'),
(7, 'Case Type\r', '1'),
(8, 'Case Chapter\r', '1'),
(9, 'Nature of suit\r', '1'),
(10, 'Date filed\r', '1'),
(11, 'Date terminated\r', '1'),
(12, 'Date dismissed\r', '1'),
(13, 'Date discharged\r', '1'),
(14, 'Disposition and date\r', '1'),
(15, 'Case ID\r', '1'),
(16, 'Case link (URL)\r', '1'),
(17, 'Case Title', '1');
--
-- Database: `pro_gadget`
--
CREATE DATABASE IF NOT EXISTS `pro_gadget` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `pro_gadget`;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `content` varchar(10000) NOT NULL,
  `stamp_d` int(11) DEFAULT NULL,
  `stamp_m` int(11) DEFAULT NULL,
  `stamp_y` int(11) DEFAULT NULL,
  `stamp_h` int(11) DEFAULT NULL,
  `stamp_60` int(11) DEFAULT NULL,
  `stamp_s` int(11) DEFAULT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `reg_users`
--

CREATE TABLE IF NOT EXISTS `reg_users` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` char(65) NOT NULL,
  `password` char(30) NOT NULL,
  `signup_d` int(11) DEFAULT NULL,
  `signup_m` int(11) DEFAULT NULL,
  `signup_y` int(11) DEFAULT NULL,
  `signup_h` int(11) DEFAULT NULL,
  `signup_60` int(11) DEFAULT NULL,
  `signup_s` int(11) DEFAULT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;
--
-- Database: `smf`
--
CREATE DATABASE IF NOT EXISTS `smf` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `smf`;

-- --------------------------------------------------------

--
-- Table structure for table `smf_admin_info_files`
--

CREATE TABLE IF NOT EXISTS `smf_admin_info_files` (
  `id_file` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(255) NOT NULL DEFAULT '',
  `parameters` varchar(255) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  `filetype` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_file`),
  KEY `filename` (`filename`(30))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `smf_admin_info_files`
--

INSERT INTO `smf_admin_info_files` (`id_file`, `filename`, `path`, `parameters`, `data`, `filetype`) VALUES
(1, 'current-version.js', '/smf/', 'version=%3$s', 'window.smfVersion = "SMF 2.0.7";', 'text/javascript'),
(2, 'detailed-version.js', '/smf/', 'language=%1$s&version=%3$s', 'window.smfVersions = {\n	''SMF'': ''SMF 2.0.7'',\n	''SourcesAdmin.php'': ''2.0'',\n	''SourcesBoardIndex.php'': ''2.0'',\n	''SourcesCalendar.php'': ''2.0'',\n	''SourcesClass-Graphics.php'': ''2.0'',\n	''SourcesClass-Package.php'': ''2.0.7'',\n	''SourcesDbExtra-mysql.php'': ''2.0'',\n	''SourcesDbExtra-postgresql.php'': ''2.0'',\n	''SourcesDbExtra-sqlite.php'': ''2.0'',\n	''SourcesDbPackages-mysql.php'': ''2.0'',\n	''SourcesDbPackages-postgresql.php'': ''2.0'',\n	''SourcesDbPackages-sqlite.php'': ''2.0'',\n	''SourcesDbSearch-mysql.php'': ''2.0'',\n	''SourcesDbSearch-postgresql.php'': ''2.0.7'',\n	''SourcesDbSearch-sqlite.php'': ''2.0.7'',\n	''SourcesDisplay.php'': ''2.0.7'',\n	''SourcesDumpDatabase.php'': ''2.0'',\n	''SourcesErrors.php'': ''2.0.4'',\n	''SourcesGroups.php'': ''2.0'',\n	''SourcesHelp.php'': ''2.0'',\n	''SourcesKarma.php'': ''2.0'',\n	''SourcesLoad.php'': ''2.0.7'',\n	''SourcesLockTopic.php'': ''2.0'',\n	''SourcesLogInOut.php'': ''2.0.7'',\n	''SourcesManageAttachments.php'': ''2.0'',\n	''SourcesManageBans.php'': ''2.0'',\n	''SourcesManageBoards.php'': ''2.0'',\n	''SourcesManageCalendar.php'': ''2.0'',\n	''SourcesManageErrors.php'': ''2.0.4'',\n	''SourcesManageMail.php'': ''2.0'',\n	''SourcesManageMaintenance.php'': ''2.0.7'',\n	''SourcesManageMembergroups.php'': ''2.0.7'',\n	''SourcesManageMembers.php'': ''2.0'',\n	''SourcesManageNews.php'': ''2.0.5'',\n	''SourcesManagePaid.php'': ''2.0.3'',\n	''SourcesManagePermissions.php'': ''2.0'',\n	''SourcesManagePosts.php'': ''2.0'',\n	''SourcesManageRegistration.php'': ''2.0'',\n	''SourcesManageScheduledTasks.php'': ''2.0'',\n	''SourcesManageSearch.php'': ''2.0'',\n	''SourcesManageSearchEngines.php'': ''2.0'',\n	''SourcesManageServer.php'': ''2.0.5'',\n	''SourcesManageSettings.php'': ''2.0.6'',\n	''SourcesManageSmileys.php'': ''2.0'',\n	''SourcesMemberlist.php'': ''2.0.2'',\n	''SourcesMessageIndex.php'': ''2.0.2'',\n	''SourcesModerationCenter.php'': ''2.0.1'',\n	''SourcesModlog.php'': ''2.0.7'',\n	''SourcesMoveTopic.php'': ''2.0'',\n	''SourcesNews.php'': ''2.0.7'',\n	''SourcesNotify.php'': ''2.0'',\n	''SourcesPackageGet.php'': ''2.0'',\n	''SourcesPackages.php'': ''2.0.2'',\n	''SourcesPersonalMessage.php'': ''2.0.5'',\n	''SourcesPoll.php'': ''2.0'',\n	''SourcesPost.php'': ''2.0.7'',\n	''SourcesPostModeration.php'': ''2.0'',\n	''SourcesPrintpage.php'': ''2.0'',\n	''SourcesProfile.php'': ''2.0.6'',\n	''SourcesProfile-Actions.php'': ''2.0.6'',\n	''SourcesProfile-Modify.php'': ''2.0.7'',\n	''SourcesProfile-View.php'': ''2.0.5'',\n	''SourcesQueryString.php'': ''2.0.7'',\n	''SourcesRecent.php'': ''2.0'',\n	''SourcesRegister.php'': ''2.0.7'',\n	''SourcesReminder.php'': ''2.0.4'',\n	''SourcesRemoveTopic.php'': ''2.0'',\n	''SourcesRepairBoards.php'': ''2.0'',\n	''SourcesReports.php'': ''2.0'',\n	''SourcesSSI.php'': ''2.0.7'',\n	''SourcesScheduledTasks.php'': ''2.0.7'',\n	''SourcesSearch.php'': ''2.0.7'',\n	''SourcesSearchAPI-Custom.php'': ''2.0'',\n	''SourcesSearchAPI-Fulltext.php'': ''2.0'',\n	''SourcesSearchAPI-Standard.php'': ''2.0'',\n	''SourcesSecurity.php'': ''2.0.3'',\n	''SourcesSendTopic.php'': ''2.0'',\n	''SourcesSplitTopics.php'': ''2.0'',\n	''SourcesStats.php'': ''2.0'',\n	''SourcesSubs.php'': ''2.0.7'',\n	''SourcesSubs-Admin.php'': ''2.0'',\n	''SourcesSubs-Auth.php'': ''2.0.7'',\n	''SourcesSubs-BoardIndex.php'': ''2.0'',\n	''SourcesSubs-Boards.php'': ''2.0'',\n	''SourcesSubs-Calendar.php'': ''2.0'',\n	''SourcesSubs-Categories.php'' : ''2.0'',\n	''SourcesSubs-Charset.php'' : ''2.0'',\n	''SourcesSubs-Compat.php'': ''2.0'',\n	''SourcesSubs-Db-mysql.php'': ''2.0.4'',\n	''SourcesSubs-Db-postgresql.php'': ''2.0.4'',\n	''SourcesSubs-Db-sqlite.php'': ''2.0'',\n	''SourcesSubs-Editor.php'': ''2.0.7'',\n	''SourcesSubs-Graphics.php'': ''2.0'',\n	''SourcesSubs-List.php'': ''2.0'',\n	''SourcesSubs-Membergroups.php'': ''2.0'',\n	''SourcesSubs-Members.php'': ''2.0.7'',\n	''SourcesSubs-MembersOnline.php'': ''2.0'',\n	''SourcesSubs-Menu.php'': ''2.0.1'',\n	''SourcesSubs-MessageIndex.php'': ''2.0'',\n	''SourcesSubs-OpenID.php'': ''2.0'',\n	''SourcesSubs-Package.php'': ''2.0.1'',\n	''SourcesSubs-Post.php'': ''2.0.7'',\n	''SourcesSubs-Recent.php'': ''2.0'',\n	''SourcesSubscriptions-PayPal.php'': ''2.0.3'',\n	''Sourcessubscriptions.php'': ''2.0.2'',\n	''SourcesSubs-Sound.php'': ''2.0'',\n	''SourcesThemes.php'': ''2.0.4'',\n	''SourcesViewQuery.php'': ''2.0'',\n	''SourcesWho.php'': ''2.0.2'',\n	''SourcesXml.php'': ''2.0'',\n	''DefaultAdmin.template.php'': ''2.0'',\n	''DefaultBoardIndex.template.php'': ''2.0'',\n	''DefaultCalendar.template.php'': ''2.0'',\n	''DefaultCompat.template.php'': ''2.0'',\n	''DefaultDisplay.template.php'': ''2.0'',\n	''DefaultErrors.template.php'': ''2.0'',\n	''DefaultGenericControls.template.php'': ''2.0'',\n	''DefaultGenericList.template.php'': ''2.0'',\n	''DefaultGenericMenu.template.php'': ''2.0'',\n	''DefaultHelp.template.php'': ''2.0.6'',\n	''DefaultLogin.template.php'': ''2.0'',\n	''DefaultManageAttachments.template.php'': ''2.0'',\n	''DefaultManageBans.template.php'': ''2.0'',\n	''DefaultManageBoards.template.php'': ''2.0'',\n	''DefaultManageCalendar.template.php'': ''2.0'',\n	''DefaultManageMail.template.php'': ''2.0'',\n	''DefaultManageMaintenance.template.php'': ''2.0'',\n	''DefaultManageMembergroups.template.php'': ''2.0'',\n	''DefaultManageMembers.template.php'': ''2.0'',\n	''DefaultManageNews.template.php'': ''2.0'',\n	''DefaultManagePaid.template.php'': ''2.0'',\n	''DefaultManagePermissions.template.php'': ''2.0'',\n	''DefaultManageScheduledTasks.template.php'': ''2.0'',\n	''DefaultManageSearch.template.php'': ''2.0'',\n	''DefaultManageSmileys.template.php'': ''2.0'',\n	''DefaultMemberlist.template.php'': ''2.0'',\n	''DefaultMessageIndex.template.php'': ''2.0'',\n	''DefaultModerationCenter.template.php'': ''2.0'',\n	''DefaultMoveTopic.template.php'': ''2.0'',\n	''DefaultNotify.template.php'': ''2.0'',\n	''DefaultPackages.template.php'': ''2.0'',\n	''DefaultPersonalMessage.template.php'': ''2.0'',\n	''DefaultPoll.template.php'': ''2.0'',\n	''DefaultPost.template.php'': ''2.0'',\n	''DefaultPrintpage.template.php'': ''2.0'',\n	''DefaultProfile.template.php'': ''2.0'',\n	''DefaultRecent.template.php'': ''2.0'',\n	''DefaultRegister.template.php'': ''2.0'',\n	''DefaultReminder.template.php'': ''2.0'',\n	''DefaultReports.template.php'': ''2.0'',\n	''DefaultSearch.template.php'': ''2.0'',\n	''DefaultSendTopic.template.php'': ''2.0'',\n	''DefaultSettings.template.php'': ''2.0'',\n	''DefaultSplitTopics.template.php'': ''2.0'',\n	''DefaultStats.template.php'': ''2.0'',\n	''DefaultThemes.template.php'': ''2.0.7'',\n	''DefaultWho.template.php'': ''2.0'',\n	''DefaultWireless.template.php'': ''2.0'',\n	''DefaultXml.template.php'': ''2.0'',\n	''Defaultindex.template.php'': ''2.0'',\n	''TemplatesAdmin.template.php'': ''2.0'',\n	''TemplatesBoardIndex.template.php'': ''2.0'',\n	''TemplatesCalendar.template.php'': ''2.0'',\n	''TemplatesDisplay.template.php'': ''2.0'',\n	''TemplatesErrors.template.php'': ''2.0'',\n	''TemplatesGenericControls.template.php'': ''2.0'',\n	''TemplatesGenericList.template.php'': ''2.0'',\n	''TemplatesGenericMenu.template.php'': ''2.0'',\n	''TemplatesHelp.template.php'': ''2.0'',\n	''TemplatesLogin.template.php'': ''2.0'',\n	''TemplatesManageAttachments.template.php'': ''2.0'',\n	''TemplatesManageBans.template.php'': ''2.0'',\n	''TemplatesManageBoards.template.php'': ''2.0'',\n	''TemplatesManageCalendar.template.php'': ''2.0'',\n	''TemplatesManageMail.template.php'': ''2.0'',\n	''TemplatesManageMaintenance.template.php'': ''2.0'',\n	''TemplatesManageMembergroups.template.php'': ''2.0'',\n	''TemplatesManageMembers.template.php'': ''2.0'',\n	''TemplatesManageNews.template.php'': ''2.0'',\n	''TemplatesManagePaid.template.php'': ''2.0'',\n	''TemplatesManagePermissions.template.php'': ''2.0'',\n	''TemplatesManageSearch.template.php'': ''2.0'',\n	''TemplatesManageSmileys.template.php'': ''2.0'',\n	''TemplatesMemberlist.template.php'': ''2.0'',\n	''TemplatesMessageIndex.template.php'': ''2.0'',\n	''TemplatesModerationCenter.template.php'': ''2.0'',\n	''TemplatesModlog.template.php'': ''2.0'',\n	''TemplatesMoveTopic.template.php'': ''2.0'',\n	''TemplatesNotify.template.php'': ''2.0'',\n	''TemplatesPackages.template.php'': ''2.0'',\n	''TemplatesPersonalMessage.template.php'': ''2.0'',\n	''TemplatesPoll.template.php'': ''2.0'',\n	''TemplatesPost.template.php'': ''2.0'',\n	''TemplatesPrintpage.template.php'': ''2.0'',\n	''TemplatesProfile.template.php'': ''2.0'',\n	''TemplatesRecent.template.php'': ''2.0'',\n	''TemplatesRegister.template.php'': ''2.0'',\n	''TemplatesReminder.template.php'': ''2.0'',\n	''TemplatesReports.template.php'': ''2.0'',\n	''TemplatesSearch.template.php'': ''2.0'',\n	''TemplatesSendTopic.template.php'': ''2.0'',\n	''TemplatesSettings.template.php'': ''2.0'',\n	''TemplatesSplitTopics.template.php'': ''2.0'',\n	''TemplatesStats.template.php'': ''2.0'',\n	''TemplatesThemes.template.php'': ''2.0'',\n	''TemplatesWho.template.php'': ''2.0'',\n	''TemplatesWireless.template.php'': ''2.0'',\n	''TemplatesXml.template.php'': ''2.0'',\n	''Templatesindex.template.php'': ''2.0''\n};\n\nwindow.smfLanguageVersions = {\n	''Admin'': ''2.0'',\n	''EmailTemplates'': ''2.0'',\n	''Errors'': ''2.0'',\n	''Help'': ''2.0'',\n	''index'': ''2.0.4'',\n	''Install'': ''2.0'',\n	''Login'': ''2.0'',\n	''ManageBoards'': ''2.0'',\n	''ManageCalendar'': ''2.0'',\n	''ManageMail'': ''2.0'',\n	''ManageMaintenance'': ''2.0'',\n	''ManageMembers'': ''2.0'',\n	''ManagePaid'': ''2.0'',\n	''ManagePermissions'': ''2.0'',\n	''ManageScheduledTasks'': ''2.0'',\n	''ManageSettings'': ''2.0'',\n	''ManageSmileys'': ''2.0'',\n	''Manual'': ''2.0'',\n	''ModerationCenter'': ''2.0'',\n	''Modifications'': ''2.0'',\n	''Modlog'': ''2.0'',\n	''Packages'': ''2.0'',\n	''PersonalMessage'': ''2.0'',\n	''Post'': ''2.0'',\n	''Profile'': ''2.0'',\n	''Reports'': ''2.0'',\n	''Search'': ''2.0'',\n	''Settings'': ''2.0'',\n	''Stats'': ''2.0'',\n	''Themes'': ''2.0'',\n	''Who'': ''2.0'',\n	''Wireless'': ''2.0''\n};\n', 'text/javascript'),
(3, 'latest-news.js', '/smf/', 'language=%1$s&format=%2$s', '\nwindow.smfAnnouncements = [\n	{\n		subject: ''SMF 2.0.7 released.'',\n		href: ''http://www.simplemachines.org/community/index.php?topic=517205.0'',\n		time: ''January 20, 2014, 09:48:07 PM'',\n		author: ''Oldiesmann'',\n		message: ''A patch has been released, addressing several bugs, including PHP 5.5 compatibility.  We urge all forum administrators to upgrade to SMF 2.0.7&mdash;simply visit the package manager to install the patch.''\n	},\n	{\n		subject: ''SMF 2.0.6 and 1.1.19 security patches have been released.'',\n		href: ''http://www.simplemachines.org/community/index.php?topic=512964.0'',\n		time: ''October 22, 2013, 09:00:00 AM'',\n		author: ''Illori'',\n		message: ''Critical security patches have been released, addressing few vulnerabilities in SMF 2.0.x and SMF 1.1.x. We urge all administrators to upgrade as soon as possible. Just visit the package manager to install the patch.''\n	},\n	{\n		subject: ''SMF 2.0.5 security patches has been released.'',\n		href: ''http://www.simplemachines.org/community/index.php?topic=509417.0'',\n		time: ''August 12, 2013, 08:34:06 PM'',\n		author: ''Oldiesmann'',\n		message: ''A critical security patch has been released, addressing a few vulnerabilities in SMF 2.0.x. We urge all administrators to upgrade as soon as possible. Just visit the package manager to install the patch.''\n	},\n	{\n		subject: ''SMF 2.0.4 and 1.1.18 security patches have been released.'',\n		href: ''http://www.simplemachines.org/community/index.php?topic=496403.0'',\n		time: ''February 01, 2013, 05:27:00 PM'',\n		author: ''emanuele'',\n		message: ''Critical security patches have been released, addressing few vulnerabilities in SMF 2.0.x and SMF 1.1.x. We urge all administrators to upgrade as soon as possible. Just visit the package manager to install the patch.''\n	},\n	{\n		subject: ''SMF 2.0.3, 1.1.17 and 1.0.23 security patches have been released.'',\n		href: ''http://www.simplemachines.org/community/index.php?topic=492786.0'',\n		time: ''December 16, 2012, 11:41:05 PM'',\n		author: ''emanuele'',\n		message: ''Security patches have been released, addressing a vulnerability in SMF 2.0.x, SMF 1.1.x and SMF 1.0.x. We urge all administrators to upgrade as soon as possible. Just visit the package manager to install the patch.''\n	},\n	{\n		subject: ''SMF 2.0.2 and 1.1.16 security patches have been released.'',\n		href: ''http://www.simplemachines.org/community/index.php?topic=463103.0'',\n		time: ''December 23, 2011, 12:41:31 AM'',\n		author: ''Norv'',\n		message: ''Critical security patches have been released, addressing vulnerabilities in SMF 2.0.x and SMF 1.1.x. We urge all administrators to upgrade as soon as possible. Just visit the package manager to install the patch.''\n	},\n	{\n		subject: ''SMF 2.0.1 and 1.1.15 security patches have been released.'',\n		href: ''http://www.simplemachines.org/community/index.php?topic=452888.0'',\n		time: ''September 18, 2011, 04:48:18 PM'',\n		author: ''Norv'',\n		message: ''Critical security patches have been released, addressing vulnerabilities in SMF 2.0 and SMF 1.1.x. We urge all administrators to upgrade as soon as possible. Just visit the package manager to install the patch.''\n	},\n	{\n		subject: ''SMF 2.0 Gold'',\n		href: ''http://www.simplemachines.org/community/index.php?topic=421547.0'',\n		time: ''June 04, 2011, 05:00:00 PM'',\n		author: ''Norv'',\n		message: ''SMF 2.0 has gone Gold! Please upgrade your forum from older versions, as 2.0 is now the stable version, and mods and themes will be built on it.''\n	},\n	{\n		subject: ''SMF 1.1.13, 2.0 RC4 security patch and SMF 2.0 RC5 released'',\n		href: ''http://www.simplemachines.org/community/index.php?topic=421547.0'',\n		time: ''February 11, 2011, 03:16:35 PM'',\n		author: ''Norv'',\n		message: ''Simple Machines announces the release of important security patches for SMF 1.1.x and SMF 2.0 RC4, along with the fifth Release Candidate of SMF 2.0. Please visit the Simple Machines site for more information on how you can help test this new release.''\n	},\n	{\n		subject: ''SMF 2.0 RC4 and SMF 1.1.12 released'',\n		href: ''http://www.simplemachines.org/community/index.php?topic=407256.0'',\n		time: ''November 01, 2010, 12:14:21 PM'',\n		author: ''Norv'',\n		message: ''Simple Machines is pleased to announce the release of the fourth Release Candidate of SMF 2.0, along with an important security patch for SMF 1.1.x. Please visit the Simple Machines site for more information on how you can help test this new release.''\n	},\n	{\n		subject: ''SMF 2.0 RC3 Public released'',\n		href: ''http://www.simplemachines.org/community/index.php?topic=369616.0'',\n		time: ''March 08, 2010, 06:03:11 PM'',\n		author: ''Aaron'',\n		message: ''Simple Machines is pleased to announce the release of the third Release Candidate of SMF 2.0. Please visit the Simple Machines site for more information on how you can help test this new release.''\n	},\n	{\n		subject: ''SMF 1.1.11 released'',\n		href: ''http://www.simplemachines.org/community/index.php?topic=351341.0'',\n		time: ''December 01, 2009, 05:59:19 PM'',\n		author: ''SleePy'',\n		message: ''A patch has been released, addressing multiple vulnerabilites.  We urge all forum administrators to upgrade to 1.1.11. Simply visit the package manager to install the patch. Also for those still using the 1.0 branch, version 1.0.19 has been released.''\n	},\n	{\n		subject: ''SMF 2.0 RC2 Public released'',\n		href: ''http://www.simplemachines.org/community/index.php?topic=346813.0'',\n		time: ''November 08, 2009, 07:10:03 PM'',\n		author: ''Aaron'',\n		message: ''Simple Machines is very pleased to announce the release of the second Release Candidate of SMF 2.0. Please visit the Simple Machines site for more information on how you can help test this new release.''\n	},\n	{\n		subject: ''SMF 1.1.10 and 2.0 RC1.2 released'',\n		href: ''http://www.simplemachines.org/community/index.php?topic=324169.0'',\n		time: ''July 14, 2009, 07:05:19 PM'',\n		author: ''Compuart'',\n		message: ''A patch has been released, addressing a few security vulnerabilites.  We urge all forum administrators to upgrade to either 1.1.10 or 2.0 RC1.2, depending on the current version. Simply visit the package manager to install the patch.''\n	},\n	{\n		subject: ''SMF 1.1.9 and 2.0 RC1-1 released'',\n		href: ''http://www.simplemachines.org/community/index.php?topic=311899.0'',\n		time: ''May 20, 2009, 08:40:41 PM'',\n		author: ''Compuart'',\n		message: ''A patch has been released, addressing multiple security vulnerabilites.  We urge all forum administrators to upgrade to either 1.1.9 or 2.0 RC1-1, depending on the current version. Simply visit the package manager to install the patch.''\n	},\n	{\n		subject: ''SMF 2.0 RC1 Public Released'',\n		href: ''http://www.simplemachines.org/community/index.php?topic=290609.0'',\n		time: ''February 04, 2009, 11:10:01 PM'',\n		author: ''Compuart'',\n		message: ''Simple Machines are very pleased to announce the release of the first Release Candidate of SMF 2.0. Please visit the Simple Machines site for more information on how you can help test this new release.''\n	},\n	{\n		subject: ''SMF 1.1.8'',\n		href: ''http://www.simplemachines.org/community/index.php?topic=290608.0'',\n		time: ''February 04, 2009, 11:08:44 PM'',\n		author: ''Compuart'',\n		message: ''A patch has been released, addressing multiple security vulnerabilites.  We urge all forum administrators to upgrade to SMF 1.1.8&mdash;simply visit the package manager to install the patch.''\n	},\n	{\n		subject: ''SMF 1.1.7'',\n		href: ''http://www.simplemachines.org/community/index.php?topic=272861.0'',\n		time: ''November 07, 2008, 02:15:36 PM'',\n		author: ''Compuart'',\n		message: ''A patch has been released, addressing multiple security vulnerabilites.  We urge all forum administrators to upgrade to SMF 1.1.7&mdash;simply visit the package manager to install the patch.''\n	},\n	{\n		subject: ''SMF 1.1.6'',\n		href: ''http://www.simplemachines.org/community/index.php?topic=260145.0'',\n		time: ''September 07, 2008, 04:38:05 AM'',\n		author: ''Compuart'',\n		message: ''A patch has been released fixing a few bugs and addressing a security vulnerability.  We urge all forum administrators to upgrade to SMF 1.1.6&mdash;simply visit the package manager to install the patch.''\n	},\n	{\n		subject: ''SMF 1.1.5'',\n		href: ''http://www.simplemachines.org/community/index.php?topic=236816.0'',\n		time: ''April 20, 2008, 09:56:14 PM'',\n		author: ''Compuart'',\n		message: ''A patch has been released fixing a few bugs and addressing some security vulnerabilities.  We urge all forum administrators to upgrade to SMF 1.1.5&mdash;simply visit the package manager to install the patch.''\n	},\n	{\n		subject: ''SMF 2.0 Beta 3 Public Released'',\n		href: ''http://www.simplemachines.org/community/index.php?topic=228921.0'',\n		time: ''March 17, 2008, 03:20:21 PM'',\n		author: ''Grudge'',\n		message: ''Simple Machines are very pleased to announce the release of the first public beta of SMF 2.0. Please visit the Simple Machines site for more information on how you can help test this new release.''\n	},\n	{\n		subject: ''SMF 1.1.4'',\n		href: ''http://www.simplemachines.org/community/index.php?topic=196380.0'',\n		time: ''September 24, 2007, 09:07:36 PM'',\n		author: ''Compuart'',\n		message: ''A patch has been released to address some security vulnerabilities discovered in SMF 1.1.3.  We urge all forum administrators to upgrade to SMF 1.1.4&mdash;simply visit the package manager to install the patch.''\n	},\n	{\n		subject: ''SMF 2.0 Beta 1 Released to Charter Members'',\n		href: ''http://www.simplemachines.org/community/index.php?topic=190812.0'',\n		time: ''August 25, 2007, 07:29:25 AM'',\n		author: ''Grudge'',\n		message: ''Simple Machines are pleased to announce the first beta of SMF 2.0 has been released to our Charter Members. Visit the Simple Machines site for information on what\\''s new''\n	},\n	{\n		subject: ''SMF 1.1.3'',\n		href: ''http://www.simplemachines.org/community/index.php?topic=178757.0'',\n		time: ''June 24, 2007, 09:52:40 PM'',\n		author: ''Thantos'',\n		message: ''A number of small bugs and a potential security issue have been discovered in SMF 1.1.2.  We urge all forum administrators to upgrade to SMF 1.1.3&mdash;simply visit the package manager to install the patch.''\n	},\n	{\n		subject: ''SMF 1.1.2'',\n		href: ''http://www.simplemachines.org/community/index.php?topic=149553.0'',\n		time: ''February 11, 2007, 08:35:45 AM'',\n		author: ''Grudge'',\n		message: ''A patch has been released to address a number of outstanding bugs in SMF 1.1.1, including several around UTF-8 language support. In addition this patch offers improved image verification support and fixes a couple of low risk security related bugs. If you need any help upgrading please visit our forum.''\n	},\n	{\n		subject: ''SMF 1.1.1'',\n		href: ''http://www.simplemachines.org/community/index.php?topic=134971.0'',\n		time: ''December 17, 2006, 09:33:41 AM'',\n		author: ''Grudge'',\n		message: ''A number of small bugs and a potential security issue have been discovered in SMF 1.1. We urge all forum administrators to upgrade to SMF 1.1.1 - simply visit the package manager to install the patch.''\n	},\n	{\n		subject: ''SMF 1.1'',\n		href: ''http://www.simplemachines.org/community/index.php?topic=131008.0'',\n		time: ''December 02, 2006, 02:53:16 PM'',\n		author: ''Grudge'',\n		message: ''SMF 1.1 has gone gold!  If you are using an older version, please upgrade as soon as possible - many things have been changed and fixed, and mods and packages will expect you to be using 1.1.  If you need any help upgrading custom modifications to the new version, please feel free to ask us at our forum.''\n	},\n	{\n		subject: ''SMF 1.0.9 and patch for SMF 1.1 RC3'',\n		href: ''http://www.simplemachines.org/community/index.php?topic=123285.0'',\n		time: ''October 29, 2006, 05:57:14 AM'',\n		author: ''Compuart'',\n		message: ''A security issue has been discovered in both SMF 1.0 and SMF 1.1. Therefore a patch has been released that will upgrade SMF 1.0.8 to 1.0.9 and update SMF 1.1 RC3. You are encouraged to update immediately, using the package manager or otherwise.''\n	},\n	{\n		subject: ''SMF 1.1 RC3'',\n		href: ''http://www.simplemachines.org/community/index.php?topic=107112.0'',\n		time: ''August 21, 2006, 07:32:19 PM'',\n		author: ''Grudge'',\n		message: ''Release Candidate 3 of SMF 1.1 has been released! This is the final update to SMF 1.1 before it goes final - and includes UTF support as well as numerous bug fixes. Please read the announcement for details - and only upgrade if you are comfortable running software yet to go gold.''\n	},\n	{\n		subject: ''SMF 1.0.8'',\n		href: ''http://www.simplemachines.org/community/index.php?topic=107135.0'',\n		time: ''August 21, 2006, 07:32:19 PM'',\n		author: ''Compuart'',\n		message: ''A security issue has been reported in PHP causing a vulnerability in SMF. A patch has been released to upgrade Simple Machines Forum from 1.0.7 to 1.0.8. You are encouraged to update immediately, using the package manager or otherwise.''\n	},\n	{\n		subject: ''SMF 1.0.7 and patch for SMF 1.1 RC2'',\n		href: ''http://www.simplemachines.org/community/index.php?topic=78841.0'',\n		time: ''March 29, 2006, 05:32:12 PM'',\n		author: ''Compuart'',\n		message: ''A security issue has been discovered in both SMF 1.0 and SMF 1.1. Therefor a patch has been released that will upgrade SMF 1.0.6 to 1.0.7 and update SMF 1.1 RC2. You are encouraged to update immediately, using the package manager or otherwise.''\n	},\n	{\n		subject: ''SMF 1.0.6'',\n		href: ''http://www.simplemachines.org/community/index.php?topic=68110.0'',\n		time: ''January 28, 2006, 06:36:25 AM'',\n		author: ''Grudge'',\n		message: ''SMF 1.0.6 has been released.  This release addresses a potential security issue as well as a few minor bugs found since the 1.0.5 release. You are encouraged to update immediately, using the package manager or otherwise. This update does not apply to the 1.1 line!''\n	},\n	{\n		subject: ''Bug in Firefox 1.5'',\n		href: ''http://www.simplemachines.org/community/index.php?topic=66862.0'',\n		time: ''January 24, 2006, 08:09:45 AM'',\n		author: ''Grudge'',\n		message: ''There is a bug in Firefox 1.5 which can cause server issues for forums running SMF 1.1 (RC1/RC2). There is a simple fix which can be downloaded from the Simple Machines forum.''\n	},\n	{\n		subject: ''SMF 1.1 RC2'',\n		href: ''http://www.simplemachines.org/community/index.php?topic=62731.0'',\n		time: ''December 31, 2005, 02:58:20 PM'',\n		author: ''Grudge'',\n		message: ''The second (and final) Release Candidate of SMF 1.1 has been released! Please read the announcement for details - and please update only if you are certain you are comfortable with software that hasn\\''t gone gold yet. There is no package manager style update for this version.''\n	}\n];\nif (window.smfVersion < "SMF 1.1")\n{\n	window.smfUpdateNotice = ''SMF 1.1 Final has now been released. To take advantage of the improvements available in SMF 1.1 we recommend upgrading as soon as is practical.'';\n	window.smfUpdateCritical = false;\n}\n\nif (document.getElementById("yourVersion"))\n{\n	var yourVersion = getInnerHTML(document.getElementById("yourVersion"));\n	if (yourVersion == "SMF 1.0.4")\n		window.smfUpdatePackage = "http://custom.simplemachines.org/mods/downloads/smf_1-0-5_package.tar.gz";\n	else if (yourVersion == "SMF 1.0.5" || yourVersion == "SMF 1.0.6")\n	{\n		window.smfUpdatePackage = "http://custom.simplemachines.org/mods/downloads/smf_patch_1.0.7_1.1-RC2-1.tar.gz";\n		window.smfUpdateCritical = false;\n	}\n	else if (yourVersion == "SMF 1.0.7")\n		window.smfUpdatePackage = "http://custom.simplemachines.org/mods/downloads/smf_1-0-8_package.tar.gz";\n	else if (yourVersion == "SMF 1.0.8")\n		window.smfUpdatePackage = "http://custom.simplemachines.org/mods/downloads/smf_patch_1-0-9_1-1-rc3-1.tar.gz";\n	else if (yourVersion == "SMF 1.0.9")\n		window.smfUpdatePackage = "http://custom.simplemachines.org/mods/downloads/smf_1-0-10_patch.tar.gz";\n	else if (yourVersion == "SMF 1.0.10" || yourVersion == "SMF 1.1.2")\n		window.smfUpdatePackage = "http://custom.simplemachines.org/mods/downloads/smf_patch_1.1.3_1.0.11.tar.gz";\n	else if (yourVersion == "SMF 1.0.11" || yourVersion == "SMF 1.1.3" || yourVersion == "SMF 2.0 beta 1")\n	{\n		window.smfUpdatePackage = "http://custom.simplemachines.org/mods/downloads/smf_patch_1.0.12_1.1.4_2.0.b1.1.tar.gz";\n		window.smfUpdateCritical = true;\n	}\n	else if (yourVersion == "SMF 1.0.12" || yourVersion == "SMF 1.1.4" || yourVersion == "SMF 2.0 beta 3 Public")\n		window.smfUpdatePackage = "http://custom.simplemachines.org/mods/downloads/smf_patch_1.0.13_1.1.5_2.0-b3.1.zip";\n	else if (yourVersion == "SMF 1.0.13" || yourVersion == "SMF 1.1.5")\n	{\n		window.smfUpdatePackage = "http://custom.simplemachines.org/mods/downloads/smf_patch_1.0.14_1.1.6.zip";\n		window.smfUpdateCritical = true;\n	}\n	else if (yourVersion == "SMF 1.0.14" || yourVersion == "SMF 1.1.6")\n	{\n		window.smfUpdatePackage = "http://custom.simplemachines.org/mods/downloads/smf_patch_1.0.15_1.1.7.zip";\n		window.smfUpdateCritical = true;\n	}\n	else if (yourVersion == "SMF 1.0.15" || yourVersion == "SMF 1.1.7")\n	{\n		window.smfUpdatePackage = "http://custom.simplemachines.org/mods/downloads/smf_patch_1.0.16_1.1.8.zip";\n		window.smfUpdateCritical = false;\n	}\n	else if (yourVersion == "SMF 1.0.16" || yourVersion == "SMF 1.1.8" || yourVersion == "SMF 2.0 RC1")\n		window.smfUpdatePackage = "http://custom.simplemachines.org/mods/downloads/smf_patch_1.0.17_1.1.9_2.0-RC1-1.zip";\n	else if (yourVersion == "SMF 1.0.17" || yourVersion == "SMF 1.1.9" || yourVersion == "SMF 2.0 RC1-1")\n		window.smfUpdatePackage = "http://custom.simplemachines.org/mods/downloads/smf_patch_1.0.18_1.1.10-2.0-RC1.2.zip";\n	else if (yourVersion == "SMF 1.0.18" || yourVersion == "SMF 1.1.10")\n	{\n		window.smfUpdatePackage = "http://custom.simplemachines.org/mods/downloads/smf_patch_1.0.19_1.1.11.zip";\n		window.smfUpdateCritical = true;\n	}\n	else if (yourVersion == "SMF 1.0.19" || yourVersion == "SMF 1.1.11")\n	{\n		window.smfUpdatePackage = "http://custom.simplemachines.org/mods/downloads/smf_patch_1.0.20_1.1.12.tar.gz";\n	}\n	else if (yourVersion == "SMF 1.0.20" || yourVersion == "SMF 1.1.12")\n	{\n		window.smfUpdatePackage = "http://custom.simplemachines.org/mods/downloads/smf_patch_1.0.21_1.1.13.tar.gz";\n		window.smfUpdateCritical = true;\n	}\n	else if (yourVersion == "SMF 1.1.14")\n	{\n		window.smfUpdatePackage = "http://custom.simplemachines.org/mods/downloads/smf_patch_1.1.15.tar.gz";\n		window.smfUpdateCritical = true;\n	}\n	else if (yourVersion == "SMF 2.0")\n	{\n		window.smfUpdatePackage = "http://custom.simplemachines.org/mods/downloads/smf_patch_2.0.1.tar.gz";\n		window.smfUpdateCritical = true;\n	}\n	else if (yourVersion == "SMF 1.1.15" || yourVersion == "SMF 1.0.21")\n	{\n		window.smfUpdatePackage = "http://custom.simplemachines.org/mods/downloads/smf_patch_1.0.22_1.1.16.tar.gz";\n		window.smfUpdateCritical = true;\n	}\n	else if (yourVersion == "SMF 2.0.1")\n	{\n		window.smfUpdatePackage = "http://custom.simplemachines.org/mods/downloads/smf_patch_2.0.2.tar.gz";\n		window.smfUpdateCritical = true;\n	}\n	else if (yourVersion == "SMF 1.1.16" || yourVersion == "SMF 1.0.22")\n	{\n		window.smfUpdatePackage = "http://custom.simplemachines.org/mods/downloads/smf_patch_1.0.23_1.1.17.tar.gz";\n		window.smfUpdateCritical = true;\n	}\n	else if (yourVersion == "SMF 1.1.17")\n	{\n		window.smfUpdatePackage = "http://custom.simplemachines.org/mods/downloads/smf_patch_1.1.18.tar.gz";\n		window.smfUpdateCritical = true;\n	}\n	else if (yourVersion == "SMF 2.0.2")\n	{\n		window.smfUpdatePackage = "http://custom.simplemachines.org/mods/downloads/smf_patch_2.0.3.tar.gz";\n		window.smfUpdateCritical = true;\n	}\n	else if (yourVersion == "SMF 2.0.3")\n	{\n		window.smfUpdatePackage = "http://custom.simplemachines.org/mods/downloads/smf_patch_2.0.4.tar.gz";\n		window.smfUpdateCritical = true;\n	}\n	else if (yourVersion == "SMF 2.0.4")\n	{\n		window.smfUpdatePackage = "http://custom.simplemachines.org/mods/downloads/smf_patch_2.0.5.tar.gz";\n		window.smfUpdateCritical = true;\n	}\n	else if (yourVersion == "SMF 1.1.18" || yourVersion == "SMF 2.0.5")\n	{\n		window.smfUpdatePackage = "http://custom.simplemachines.org/mods/downloads/smf_patch_1.1.19_2.0.6.tar.gz";\n		window.smfUpdateCritical = true;\n	}\n	else if (yourVersion == "SMF 1.1")\n		window.smfUpdatePackage = "http://custom.simplemachines.org/mods/downloads/smf_1-1-1_patch.tar.gz";\n	else if (yourVersion == "SMF 1.1.1")\n		window.smfUpdatePackage = "http://custom.simplemachines.org/mods/downloads/smf_1-1-2_patch.tar.gz";\n}\n\nif (document.getElementById(''credits''))\n	setInnerHTML(document.getElementById(''credits''), getInnerHTML(document.getElementById(''credits'')).replace(/anyone we may have missed/, ''<span title="And you thought you had escaped the credits, hadn\\''t you, Zef Hemel?">anyone we may have missed</span>''));\n', 'text/javascript');
INSERT INTO `smf_admin_info_files` (`id_file`, `filename`, `path`, `parameters`, `data`, `filetype`) VALUES
(4, 'latest-packages.js', '/smf/', 'language=%1$s&version=%3$s', 'var actionurl = ''?action=admin;area=packages;sa=download;get;package='';if (typeof(window.smfForum_sessionvar) == "undefined")\n	window.smfForum_sessionvar = ''sesc'';\n\nif (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 1.0")\n	window.smfLatestPackages = ''As was inevitable, a few small mistakes have been found in 1.0.  You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_1-0-1_update.tar.gz;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to easily update yourself to the latest version.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 1.0.1")\n	window.smfLatestPackages = ''A few problems have been found in the package manager\\''s modification code, among a few other issues.  You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_1-0-2_update.tar.gz;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to easily update yourself to the latest version.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 1.0.2")\n	window.smfLatestPackages = ''A problem has been found in the system that sends critical database messages.  You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_1-0-3_package.tar.gz;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to easily update yourself to the latest version.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 1.0.3")\n	window.smfLatestPackages = ''A few bugs have been fixed since SMF 1.0.3, and a problem with parsing nested BBC tags addressed. You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_1-0-4_package.tar.gz;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to easily update yourself to the latest version.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled. Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 1.0.4")\n	window.smfLatestPackages = ''A security issue has been identified in SMF 1.0.4.  You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_1-0-5_package.tar.gz;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to easily update yourself to the latest version.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 1.0.5")\n	window.smfLatestPackages = ''A bbc security issue has been identified in SMF 1.0.5.  You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_1.0.7_1.1-RC2-1.tar.gz;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to easily update yourself to the latest version.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 1.0.6")\n	window.smfLatestPackages = ''A security issue has been identified in SMF 1.0.6.  You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_1.0.7_1.1-RC2-1.tar.gz;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to easily update yourself to the latest version.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 1.0.7")\n	window.smfLatestPackages = ''A security issue has been identified in SMF 1.0.7.  You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_1-0-8_package.tar.gz;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to easily update yourself to the latest version.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\n\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 1.0.8")\n	window.smfLatestPackages = ''A security issue has been identified in SMF 1.0.8.  You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_1-0-9_1-1-rc3-1.tar.gz;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to easily update yourself to the latest version.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 1.0.9")\n	window.smfLatestPackages = ''A security issue has been identified in SMF 1.0.9.  You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_1-0-10_patch.tar.gz;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to easily update yourself to the latest version.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 1.0.10")\n	window.smfLatestPackages = ''A security issue has been identified in SMF 1.0.10.  You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_1.1.3_1.0.11.tar.gz;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to easily update yourself to the latest version.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 1.0.11")\n	window.smfLatestPackages = ''A few security vulnerabilities have been identified in SMF 1.0.11 as well as a few small bugs. You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_1.0.12_1.1.4_2.0.b1.1.tar.gz;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to update your version of SMF to 1.0.12.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 1.0.12")\n	window.smfLatestPackages = ''A few security vulnerabilities have been identified in SMF 1.0.12 as well as a few small bugs. You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_1.0.13_1.1.5_2.0-b3.1.zip;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to update your version of SMF to 1.0.12.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 1.0.13")\n	window.smfLatestPackages = ''A few security vulnerabilities have been identified in SMF 1.0.13 as well as a few small bugs. You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_1.0.14_1.1.6.zip;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to update your version of SMF to 1.0.14.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 1.0.14")\n	window.smfLatestPackages = ''A few security vulnerabilities have been identified in SMF 1.0.14. You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_1.0.15_1.1.7.zip;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to update your version of SMF to 1.0.15.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 1.0.15")\n	window.smfLatestPackages = ''A few security vulnerabilities have been identified in SMF 1.0.15. You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_1.0.16_1.1.8.zip;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to update your version of SMF to 1.0.16.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 1.0.16")\n	window.smfLatestPackages = ''A few security vulnerabilities have been identified in SMF 1.0.16. You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_1.0.17_1.1.9_2.0-RC1-1.zip;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to update your version of SMF to 1.0.17.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 1.0.17")\n	window.smfLatestPackages = ''A few security vulnerabilities have been identified in SMF 1.0.17. You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_1.0.18_1.1.10-2.0-RC1.2;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to update your version of SMF to 1.0.18.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 1.0.18")\n	window.smfLatestPackages = ''A few security vulnerabilities have been identified in SMF 1.0.18. You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_1.0.19_1.1.11.zip;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to update your version of SMF to 1.0.19.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 1.0.19")\n	window.smfLatestPackages = ''A few security vulnerabilities have been identified in SMF 1.0.19. You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_1.0.20_1.1.12.tar.gz;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to update your version of SMF to 1.0.20.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 1.0.20")\n	window.smfLatestPackages = ''A few security vulnerabilities have been identified in SMF 1.0.20. You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_1.0.21_1.1.13.tar.gz;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to update your version of SMF to 1.0.21.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 1.0.21")\n	window.smfLatestPackages = ''A few security vulnerabilities have been identified in SMF 1.0.21. You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_1.0.22_1.1.16.tar.gz;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to update your version of SMF to 1.0.22.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 1.0.22")\n	window.smfLatestPackages = ''A security vulnerability has been identified in SMF 1.0.22. You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_1.0.23_1.1.17.tar.gz;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to update your version of SMF to 1.0.23.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 1.0.23")\n	window.smfLatestPackages = ''SMF 1.0 was released to the world in December 2004 and has been supported for more than eight years. Starting from the 1st of January 2013 it will not receive security updates any more. Anyone still using a 1.0 release should investigate migrating to the lates SMF version. Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 1.1 Beta 2" && !in_array("smf:smf_1-1-beta2-fix1", window.smfInstalledPackages))\n	window.smfLatestPackages = ''A few bugs have been fixed since SMF 1.1 Beta 2, and a problem with parsing nested BBC tags addressed.  You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_1-1-beta2-fix1.tar.gz;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to easily fix the problem.<br /><br />Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> or in the helpdesk if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 1.1 RC2" && !in_array("smf:smf-1.0.7", window.smfInstalledPackages))\n	window.smfLatestPackages = ''A security issue has been identified in SMF 1.1 RC2. You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_1.0.7_1.1-RC2-1.tar.gz;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to easily update yourself to the latest version.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 1.1 RC2" && !in_array("smf:smf_1-1-rc2-2", window.smfInstalledPackages))\n	window.smfLatestPackages = ''A bug in PHP causes a vulnerability in SMF 1.1 RC2-1. You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_1-1-rc2-2_package.tar.gz;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to patch your version of 1.1 RC2 to 1.1 RC2-2.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 1.1")\n	window.smfLatestPackages = ''A number of small bugs and a security issue have been identified in SMF 1.1 Final. You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_1-1-1_patch.tar.gz;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to update your version of SMF to 1.1.1.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 1.1.1")\n	window.smfLatestPackages = ''A number of bugs and a couple of low risk security issues have been identified in SMF 1.1.1 - and some improvements have been made to the visual verification images on registration. You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_1-1-2_patch.tar.gz;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to update your version of SMF to 1.1.2.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 1.1.2")\n	window.smfLatestPackages = ''A number of bugs and a couple of low risk security issues have been identified in SMF 1.1.2 - and some improvements have been made to the package manager. You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_1.1.3_1.0.11.tar.gz;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to update your version of SMF to 1.1.3.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 1.1.3")\n	window.smfLatestPackages = ''A few security vulnerabilities have been identified in SMF 1.1.3 as well as a few small bugs. You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_1.0.12_1.1.4_2.0.b1.1.tar.gz;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to update your version of SMF to 1.1.4.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 1.1.4")\n	window.smfLatestPackages = ''A few security vulnerabilities have been identified in SMF 1.1.4 as well as a few small bugs. You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_1.0.13_1.1.5_2.0-b3.1.zip;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to update your version of SMF to 1.1.5.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 1.1.5")\n	window.smfLatestPackages = ''A few security vulnerabilities have been identified in SMF 1.1.5 as well as a few small bugs. You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_1.0.14_1.1.6.zip;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to update your version of SMF to 1.1.6.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 1.1.6")\n	window.smfLatestPackages = ''A few security vulnerabilities have been identified in SMF 1.1.6. You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_1.0.15_1.1.7.zip;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to update your version of SMF to 1.1.7.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 1.1.7")\n	window.smfLatestPackages = ''A few security vulnerabilities have been identified in SMF 1.1.7. You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_1.0.16_1.1.8.zip;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to update your version of SMF to 1.1.8.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 1.1.8")\n	window.smfLatestPackages = ''A few security vulnerabilities have been identified in SMF 1.1.8. You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_1.0.17_1.1.9_2.0-RC1-1.zip;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to update your version of SMF to 1.1.9.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 1.1.9")\n	window.smfLatestPackages = ''A few security vulnerabilities have been identified in SMF 1.1.9. You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_1.0.18_1.1.10-2.0-RC1.2.zip;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to update your version of SMF to 1.1.10.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 1.1.10")\n	window.smfLatestPackages = ''A few security vulnerabilities have been identified in SMF 1.1.10. You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_1.0.19_1.1.11.zip;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to update your version of SMF to 1.1.11.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 1.1.11")\n	window.smfLatestPackages = ''A few security vulnerabilities have been identified in SMF 1.1.11. You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_1.0.20_1.1.12.tar.gz;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to update your version of SMF to 1.1.12.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 1.1.12")\n	window.smfLatestPackages = ''A few security vulnerabilities have been identified in SMF 1.1.12. You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_1.0.21_1.1.13.tar.gz;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to update your version of SMF to 1.1.13.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 1.1.13")\n	window.smfLatestPackages = ''A security vulnerability have been identified in SMF 1.1.13. You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_1.1.14.tar.gz;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to update your version of SMF to 1.1.14.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled if you use the full package.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 1.1.14")\n	window.smfLatestPackages = ''A security vulnerability have been identified in SMF 1.1.14. You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_1.1.15.tar.gz;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to update your version of SMF to 1.1.15.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled if you use the full package.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 1.1.15")\n	window.smfLatestPackages = ''A couple of security vulnerabilities have been identified in SMF 1.1.15. You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_1.0.22_1.1.16.tar.gz;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to update your version of SMF to 1.1.16.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled if you use the full package.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 1.1.16")\n	window.smfLatestPackages = ''A security vulnerability has been identified in SMF 1.1.16. You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_1.0.23_1.1.17.tar.gz;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to update your version of SMF to 1.1.17.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled if you use the full package.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 1.1.17")\n	window.smfLatestPackages = ''A few security vulnerabilities have been identified in SMF 1.1.17. You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_1.1.18.tar.gz;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to update your version of SMF to 1.1.18.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled if you use the full package.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 1.1.18")\n	window.smfLatestPackages = ''A few security vulnerabilities have been identified in SMF 1.1.18. You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_1.1.19_2.0.6.tar.gz;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to update your version of SMF to 1.1.18.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled if you use the full package.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 2.0 beta 1")\n	window.smfLatestPackages = ''A few security vulnerabilities have been identified in SMF 2.0 beta 1 as well as a few small bugs. You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_1.0.12_1.1.4_2.0.b1.1.tar.gz;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to update your version of SMF to 2.0 beta 1.1.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 2.0 Beta 3 Public")\n	window.smfLatestPackages = ''A few security vulnerabilities have been identified in SMF 2.0 beta 3 as well as a few small bugs. You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_1.0.13_1.1.5_2.0-b3.1.zip;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to update your version of SMF to 2.0 beta 3.1.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 2.0 RC1")\n	window.smfLatestPackages = ''A few security vulnerabilities have been identified in SMF 2.0 RC1. You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_1.0.17_1.1.9_2.0-RC1-1.zip;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to update your version of SMF to 2.0-RC1-1.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 2.0 RC1-1")\n	window.smfLatestPackages = ''A few security vulnerabilities have been identified in SMF 2.0 RC1-1. You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_1.0.18_1.1.10-2.0-RC1.2.zip;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to update your version of SMF to 2.0-RC1.2 .<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 2.0 RC4"  && typeof(window.smfRC4patch) == "undefined")\n	window.smfLatestPackages = ''A few security vulnerabilities have been identified in SMF 2.0 RC4. You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_2.0-RC4_security.zip;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to install the security patch for SMF 2.0 RC4.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 2.0")\n	window.smfLatestPackages = ''A few security vulnerabilities have been identified in SMF 2.0. You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_2.0.1.tar.gz;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to update your forum.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 2.0.1")\n	window.smfLatestPackages = ''A few security vulnerabilities and bugs in SMF 2.0.1 have been fixed. You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_2.0.2.tar.gz;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to fix your forum.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 2.0.2")\n	window.smfLatestPackages = ''A security vulnerability and few bugs in SMF 2.0.2 have been fixed. You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_2.0.3.tar.gz;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to fix your forum.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 2.0.3")\n	window.smfLatestPackages = ''A few security vulnerabilities in SMF 2.0.3 have been fixed. You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_2.0.4.tar.gz;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to fix your forum.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 2.0.4")\n	window.smfLatestPackages = ''A few security vulnerabilities in SMF 2.0.4 have been fixed. You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_2.0.5.tar.gz;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to fix your forum.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 2.0.5")\n	window.smfLatestPackages = ''A few security vulnerabilities and bugs in SMF 2.0.5 have been fixed. You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_1.1.19_2.0.6.tar.gz;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to fix your forum.<br /><br />If you have any problems applying it, you can use the version posted on the downloads page - although, any modifications you have installed will need to be uninstalled.  Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) != "undefined" && window.smfVersion == "SMF 2.0.6")\n	window.smfLatestPackages = ''PHP 5.5 compatibility issues and several other bugs have been fixed. You can install <a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_2.0.7.tar.gz;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">this patch (click here to install)</a> to fix your forum and update it to 2.0.7.<br /><br />If you have any problems applying it, you can try to use the upgrade file posted on the downloads page - although, any modifications you have installed will need to be uninstalled when you use that method.<br />Please post on the <a href="http://www.simplemachines.org/community/index.php">forum</a> if you need more help.'';\nelse if (typeof(window.smfVersion) == "undefined")\n	window.smfLatestPackages = ''For the package manager to function properly, please upgrade to the latest version of SMF.'';\nelse\n{\nvar smf_modificationInfo = {\n\n	3852: {\n		name: ''Count Number of Own Posts in Topic View 1.00'',\n		versions: [''77''],\n		desc: ''<hr /><div align="center"><span style="color: red;" class="bbc_color"><span style="font-size: 16pt;" class="bbc_size"><strong>Count Number of Own Posts in Topic View</strong></span></span></div><br />This MODification allows you to dynamically display, for each topic, the number of posts by the user currently viewing the MessageIndex.<br />Please note that:<br />- You need to have &quot;Participation icons&quot; enabled: Administration Center » Posts and Topics » Topic Settings<br />- In order to save space, the &quot;Replies&quot; and &quot;Views&quot; texts are removed and the respective numbers are shown side-by-side, separated with a slash. Please look at the sample images.<br />- As the MOD changes MessageIndex.template.php, it is possible that this will not install cleanly in some custom themes.<br /><br /><strong>Languages:</strong><br />&nbsp; &nbsp;&nbsp; - English<br />&nbsp; &nbsp;&nbsp; - Portuguese (PT and BR)<br /><br /><strong>Changelog</strong><br /><div class="codeheader">Kod: <a href="javascript:void(0);" onclick="return smfSelectText(this);" class="codeoperation">[Seç]</a></div><code class="bbc_code">Version 1.00 // 01-04-2014<br />================================================================================<br />+ First release<br /><br />Legend:<br />--------------------------------------------------------------------------------<br />&nbsp;! Minor change or bugfix.<br />&nbsp;+ Feature addition or improvement.<br />&nbsp;- Feature or option removal.<br /></code><br /><div align="center"><img src="http://i.creativecommons.org/l/by/3.0/88x31.png" alt="" class="bbc_img" /><br />This mod is licensed under <a href="http://creativecommons.org/licenses/by/3.0/" class="bbc_link" target="_blank">Creative Commons Attribution 3.0 Unported License</a></div>'',\n		file: ''CountPostsInTopicView.zip''\n	},\n	3848: {\n		name: ''Allocate More RAM 1.0'',\n		versions: [''77''],\n		desc: ''<hr /><div align="center"><span style="color: red;" class="bbc_color"><span style="font-size: 16pt;" class="bbc_size"><strong>ALLOCATE MORE RAM v1.0</strong></span></span><br /><a href="http://www.simplemachines.org/community/index.php?action=profile;u=253913" class="bbc_link" target="_blank"><strong>By Dougiefresh</strong></a> -&gt; <a href="http://custom.simplemachines.org/mods/index.php?mod=3039" class="bbc_link" target="_blank">Link to Mod</a><br /></div><hr /><br /><span style="color: blue;" class="bbc_color"><strong><span style="font-size: 12pt;" class="bbc_size"><span class="bbc_u">Introduction</span></span></strong></span><br /><a href="http://wiki.simplemachines.org/smf/What_the_white_screen_of_death_means_when_accessing_admin_or_package_installs" class="bbc_link" target="_blank">This page</a> begins to explain the problem:<br /><div class="quoteheader"><div class="topslice_quote">Alıntı</div></div><blockquote class="bbc_standard_quote">The issue appears to be that when a page is loaded, and the script tries to load one (or more) additional files to perform sub-tasks, the system runs out of allocated memory.<br /><br />The reason this is happening is because those of you encountering this issue are very likely running your site on an overselling host. This means that the host you chose sells sites with &quot;unlimited&quot; stuff, such as bandwidth, or disk space. The truth is that nobody could actually afford to sell &quot;unlimited&quot; everything (or anything). Hosts need to pay for expenses and make money. The host that you chose may advertise &quot;unlimited&quot;, but in reality, they have severely limited your account, because they put far too many &quot;unlimited&quot; accounts on the same physical, or virtual, machine. They then apply &quot;hidden&quot; limits, and shut your forum down, when your usage exceeds these limits. Even though you are, therefore, meant to have been offered an &quot;unlimited&quot; service, you have not.<br /><br />It is important to realize that there is a limit to how much memory a given script can access, and that every host has a limit like this. A real host, however, has a reasonable amount, and will not put far too many accounts on a single server such that they overuse the available resources, and a real host will discuss how much you require if you truly need to exceed that amount.<br /><br />In your case, the host has set this limit low. So low, in fact, that the package manager cannot load Subs-Post.php to process the BBC tags in the readme file of the mod. If that inclusion is bypassed, the script next chokes on the loading of Subs-Package.php, which cannot be bypassed because that file contains the instructions needed to process the Mod package.</blockquote><div class="quotefooter"><div class="botslice_quote"></div></div><br /><span style="color: blue;" class="bbc_color"><strong><span style="font-size: 12pt;" class="bbc_size"><span class="bbc_u">What It Does</span></span></strong></span><br />This mod makes a small change to Class-Package.php to increase the memory requested from 32mb to 128mb, as described in <a href="http://www.simplemachines.org/community/index.php?topic=502354.msg3531634#msg3531634" class="bbc_link" target="_blank">this post</a>.&nbsp; Please note that this modification is not guaranteed to work, however, it works for me....<br /><br /><span style="color: blue;" class="bbc_color"><strong><span style="font-size: 12pt;" class="bbc_size"><span class="bbc_u">Admin Settings</span></span></strong></span><br />There are no admin settings.&nbsp; To disable it, you must remove this mod.<br /><br /><span style="color: blue;" class="bbc_color"><strong><span style="font-size: 12pt;" class="bbc_size"><span class="bbc_u">Compatibility Notes</span></span></strong></span><br />This mod was tested on SMF 2.0.7, but should work on SMF 2.0 and up.&nbsp; SMF 1.1 is not and will not be supported, so please don&#039;t ask.<br /><br /><span style="color: blue;" class="bbc_color"><strong><span style="font-size: 12pt;" class="bbc_size"><span class="bbc_u">Changelog</span></span></strong></span><br />v1.0 - March 20th, 2014<br />o Initial Release of the mod<br /><br /><hr /><a href="http://creativecommons.org/licenses/by/3.0" class="bbc_link" target="_blank"><img src="http://i.creativecommons.org/l/by/3.0/80x15.png" alt="" class="bbc_img" /></a><br />This work is licensed under a <a href="http://creativecommons.org/licenses/by/3.0" class="bbc_link" target="_blank">Creative Commons Attribution 3.0 Unported License</a><br />'',\n		file: ''Allocate_More_RAM_v1.0.zip''\n	},\n	3845: {\n		name: ''Remove Header Link 1.0'',\n		versions: [''77''],\n		desc: ''i noticed some small mods being approved so here is my first mod, this mod is simply it makes it so the header is no longer a link!<br /><br />mod is under released under Creative Commons - Public Domain License - so do as you wish!<br /><a href="http://creativecommons.org/publicdomain/mark/1.0/" class="bbc_link" target="_blank">http://creativecommons.org/publicdomain/mark/1.0/</a><br /><br />mod may not work in all themes so deal with it <img src="http://media.simplemachinesweb.com/smf/smileys/default/tongue.gif" alt="&#58;P" title="Tongue" class="smiley" /><br /><br />I also got told their is no min amount of edits needed so I hope this gets approved!&nbsp; i hope to make more mods as i grow!'',\n		file: ''remove logo link(1).zip''\n	},\n	2870: {\n		name: ''Customizable Home Button 1.0'',\n		versions: [''57''],\n		desc: ''<span style="font-size: 12pt;" class="bbc_size"><span style="color: #70A2FF;" class="bbc_color"><strong>Customizable Home Button</strong></span></span><br /><br /><hr /><strong>Author: <a href="http://www.simplemachines.org/community/index.php?action=profile;u=182638" class="bbc_link" target="_blank">Labradoodle-360</a></strong><br /><strong>Latest Version:</strong> 1.0<br /><strong>Compatible With SMF:</strong> 2.0 RC3, 2.0 RC4<br /><hr /><br /><br /><hr /><span style="font-size: 12pt;" class="bbc_size"><span style="color: #70A2FF;" class="bbc_color">Summary</span></span><hr />I have seen quite a few requests around lately to add a home button - Which links to their ACTUAL website outside of their forum, so I decided to write up a quick and easy way to do that with no coding necessary. In addition, it is coded fully Source side, so it should work with ALL themes right out of the package!<br /><br />Simply go to Admin &gt; Management &gt; Modification Settings &gt; Miscellaneous &gt; And enter a URL in &quot;Home Button URL&quot;<br /><br />By entering a home button URL, you still don&#039;t lose a button to your main forum!<br /><br />Only by request will I make update this mod.<br /><hr /><br /><br /><hr /><span style="font-size: 12pt;" class="bbc_size"><span style="color: #70A2FF;" class="bbc_color">Languages</span></span><hr /><img src="http://www.simplemachines.org/site_images/lang/english.gif" alt="" class="bbc_img" /><br /><hr /><br /><br /><hr /><span style="font-size: 12pt;" class="bbc_size"><span style="color: #70A2FF;" class="bbc_color">Version 1.0 Changelog</span></span><hr /><strong><span style="color: green;" class="bbc_color">+</span></strong>) First Release<br /><hr /><br /><br /><hr /><span style="font-size: 12pt;" class="bbc_size"><span style="color: #70A2FF;" class="bbc_color">Files modified by Customizable Home Button 1.0</span></span><hr /><strong>SMF 2.0 RC3, SMF 2.0 RC4</strong><br /><strong><em>Source Files (./Sources)</em></strong><br /><ul class="bbc_list"><li>ManageSettings.php</li><li>Subs.php</li></ul><strong><em>Language Files (./Themes/default/languages)</em></strong><br /><ul class="bbc_list"><li>Help.english.php</li><li>Modifications.english.php</li></ul><hr /><br /><br /><hr /><a href="http://" class="bbc_link" target="_blank">Link to Mod</a> | <a href="https://www.paypal.com/cgi-bin/webscr&amp;cmd=_s-xclick&amp;hosted_button_id=10240245" class="bbc_link" target="_blank">Support Labradoodle-360</a><hr />'',\n		file: ''Customizable_Home_Button_1.0.zip''\n	}};\nvar smf_latestModifications = [3852, 3848, 3845];\n\nfunction smf_packagesMoreInfo(id)\n{\n	window.smfLatestPackages_temp = document.getElementById("smfLatestPackagesWindow").innerHTML;\n\n	setInnerHTML(document.getElementById("smfLatestPackagesWindow"),\n	''\\\n		<h3 style="margin: 0; padding: 4px;">'' + smf_modificationInfo[id].name + ''</h3>\\\n		<h4 style="padding: 4px; margin: 0;"><a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/'' + id + ''/'' + smf_modificationInfo[id].file + '';'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">Install Now!</a></h4>\\\n		<div style="margin: 4px;">'' + smf_modificationInfo[id].desc.replace(/<a href/g, ''<a href'') + ''</div>\\\n		<div class="titlebg" style="padding: 4px; margin: 0;"><a href="javascript:smf_packagesBack();void(0);">(go back)</a></div>'');\n}\n\nfunction smf_packagesBack()\n{\n	setInnerHTML(document.getElementById("smfLatestPackagesWindow"), window.smfLatestPackages_temp);\n	window.scrollTo(0, findTop(document.getElementById("smfLatestPackagesWindow")) - 10);\n}\n\nwindow.smfLatestPackages = ''\\\n	<div id="smfLatestPackagesWindow"style="overflow: auto;">\\\n		<h3 style="margin: 0; padding: 4px;">New Packages:</h3>\\\n		<img src="http://www.simplemachines.org/smf/images/package.png" width="102" height="98" style="float: right; margin: 4px;" alt="(package)" />\\\n		<ul style="list-style: none; margin-top: 3px; padding: 0 4px;">'';\n\nfor (var i = 0; i < smf_latestModifications.length; i++)\n{\n	var id_mod = smf_latestModifications[i];\n\n	window.smfLatestPackages += ''<li><a href="javascript:smf_packagesMoreInfo('' + id_mod + '');void(0);">'' + smf_modificationInfo[id_mod].name + ''</a></li>'';\n}\n\nwindow.smfLatestPackages += ''\\\n		</ul>'';\n\nif (typeof(window.smfVersion) != "undefined" && (window.smfVersion < "SMF 1.0.6" || (window.smfVersion == "SMF 1.1 RC2" && !in_array(''smf:smf-1.0.7'', window.smfInstalledPackages))))\n	window.smfLatestPackages += ''\\\n		<h3 class="error" style="margin: 0; padding: 4px;">Updates for SMF:</h3>\\\n		<div style="padding: 0 4px;">\\\n			<a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/smf_patch_1.0.7_1.1-RC2-1.tar.gz;'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">Security update (X-Forwarded-For header vulnerability)</a>\\\n		</div>'';\nelse\n	window.smfLatestPackages += ''\\\n		<h3 style="margin: 0; padding: 4px;">Package of the Moment:</h3>\\\n		<div style="padding: 0 4px;">\\\n			<a href="javascript:smf_packagesMoreInfo(2870);void(0);">Customizable Home Button 1.0</a>\\\n		</div>'';\n\nwindow.smfLatestPackages += ''\\\n	</div>'';\n}\n\nfunction findTop(el)\n{\n	if (typeof(el.tagName) == "undefined")\n		return 0;\n\n	var skipMe = in_array(el.tagName.toLowerCase(), el.parentNode ? ["tr", "tbody", "form"] : []);\n	var coordsParent = el.parentNode ? "parentNode" : "offsetParent";\n\n	if (el[coordsParent] == null || typeof(el[coordsParent].offsetTop) == "undefined")\n		return skipMe ? 0 : el.offsetTop;\n	else\n		return (skipMe ? 0 : el.offsetTop) + findTop(el[coordsParent]);\n}\n\nfunction in_array(item, array)\n{\n	for (var i in array)\n	{\n		if (array[i] == item)\n			return true;\n	}\n\n	return false;\n}\n', 'text/javascript');
INSERT INTO `smf_admin_info_files` (`id_file`, `filename`, `path`, `parameters`, `data`, `filetype`) VALUES
(5, 'latest-smileys.js', '/smf/', 'language=%1$s&version=%3$s', 'var actionurl = ''?action=admin;area=smileys;sa=install;set_gz='';\nif (typeof(window.smfForum_sessionvar) == "undefined")\n	window.smfForum_sessionvar = ''sesc'';\n\nvar smf_smileysInfo = {\n\n	3840: {\n		name: ''Android smileys 1.0'',\n		versions: [''77''],\n		desc: ''This is just a simple modification that adds new smileys set to your forum.<br />The icons were made by Google for Android system and are under open-source license.'',\n		file: ''Android_smileys_1.0.zip''\n	},\n	3628: {\n		name: ''BBPh Smileys 1.0'',\n		versions: [''72'', ''73''],\n		desc: ''Made to easily replace default ones.<br /><br /><img src="http://dl.dropbox.com/u/1684364/arc/bbph.gif" alt="" class="bbc_img" /><br /><br />These are just my favorites since the first forum I ever lived on was based on phpBB. Some are animated. package-info.xml included.<br /><br />Original smileys belong to phpBB. Some minor mods by me.'',\n		file: ''bbph.zip''\n	},\n	3290: {\n		name: ''Blue Smiley Animation 2.0'',\n		versions: [''67'', ''72'', ''68'', ''73''],\n		desc: ''<div align="center"><span style="font-size: 1.45em;" class="bbc_size"><span style="color: green;" class="bbc_color"><strong>Blue Smiley Animation</strong></span></span></div><div align="center"><a href="http://www.simplemachines.org/community/index.php?topic=464629.0" class="bbc_link" target="_blank">English Support</a> | <a href="http://smf-portal.hu" class="bbc_link" target="_blank">Hungarian Support</a> | <a href="http://custom.simplemachines.org/mods/index.php?action=profile;u=221448" class="bbc_link" target="_blank">My Mods</a></div><hr /><br /><strong>Autor:</strong><br /><a href="http://www.simplemachines.org/community/index.php?action=profile;u=221448" class="bbc_link" target="_blank">WasdMan</a> and Cserrobi<br /><br /><strong>Description (Hungarian):</strong> <br />Kék mosolygó arcok<br /><br /><strong>Description (English):</strong><br />Blue Smiley package<br /><br /><img src="http://smf-portal.hu/Download/Egyeb/keksmiley.png" alt="" width="600" height="237" class="bbc_img resized" /><br /><br /><strong>Compatibility: </strong><br /><ul class="bbc_list"><li>1.0 - 1.99.99</li><li>2.0 - 2.99.99</li></ul>'',\n		file: ''BlueSmileyAnimation_2.1_UNI.zip''\n	},\n	1038: {\n		name: ''Ellow Christmas Edition Smiley Set 1.1.0.1'',\n		versions: [''31'', ''35'', ''39'', ''41'', ''44'', ''46'', ''49'', ''36'', ''37'', ''42'', ''47'', ''50'', ''51'', ''53''],\n		desc: ''<strong>Ellow Christmas Edition Smiley Set</strong><br /><br /><img src="http://img142.imageshack.us/img142/4312/threadpreviewnr4.jpg" alt="" class="bbc_img" /><br /><span style="font-size: 0.7em;" class="bbc_size"><tt class="bbc_tt"><a href="http://www.imageshack.us/" class="bbc_link" target="_blank">Hosted by imageshack.</a></tt></span><br /><br />A Christmas version of the <a href="http://custom.simplemachines.org/mods/index.php?mod=901" class="bbc_link" target="_blank">Ellow multi color smiley set</a>. The Christmas Edition&nbsp; is only available in yellow. <br />The set also includes a sleepy smiley. (You can delete it if you don&#039;t wand it)<br /><br />You can install it using the package manager and then use the Smileys and message icons menu (Smileys and Message Icons -&gt; smiley sets new smiley set) to import the smiley&#039;s<br /><br />Pleas read the Terms of Use included in the package. You can only use these smiley&#039;s if you agree with them.<br /><br />O and Marry Christmas and a Happy New Year <img src="http://media.simplemachinesweb.com/smf/smileys/default/wink.gif" alt=";&#41;" title="Wink" class="smiley" /><br /><br />Change log:<br />V1.1.0.1: Small T.O.U (Terms of Use) update.'',\n		file: ''ellow_yellow_christmas_edition.zip''\n	},};\nvar smf_latestSmileys = [3840, 3628, 3290];\n\nfunction smf_packagesMoreInfo(id)\n{\n	window.smfLatestSmileys_temp = document.getElementById("smfLatestSmileysWindow").innerHTML;\n\n	setInnerHTML(document.getElementById("smfLatestSmileysWindow"),\n	''\\\n		<h3 style="margin: 0; padding: 4px;">'' + smf_smileysInfo[id].name + ''</h3>\\\n		<h4 style="padding: 4px; margin: 0;"><a href="'' + window.smfForum_scripturl + actionurl + ''http://custom.simplemachines.org/mods/downloads/'' + id + ''/'' + smf_smileysInfo[id].file + '';'' + window.smfForum_sessionvar + ''='' + window.smfForum_sessionid + ''">Install Now!</a></h4>\\\n		<div style="margin: 4px;">'' + smf_smileysInfo[id].desc.replace(/<a href/g, ''<a href'') + ''</div>\\\n		<div class="titlebg" style="padding: 4px; margin: 0;"><a href="javascript:smf_packagesBack();void(0);">(go back)</a></div>'');\n}\n\nfunction smf_packagesBack()\n{\n	setInnerHTML(document.getElementById("smfLatestSmileysWindow"), window.smfLatestSmileys_temp);\n	window.scrollTo(0, findTop(document.getElementById("smfLatestSmileysWindow")) - 10);\n}\n\nwindow.smfLatestSmileys = ''\\\n	<div id="smfLatestSmileysWindow" style="overflow: auto;">\\\n		<img src="http://www.simplemachines.org/smf/images/smileys.png" width="102" height="98" style="float: right; margin: 4px;" alt="(package)" />\\\n		<h3 style="margin: 0; padding: 4px;">Smiley of the Moment:</h3>\\\n		<div style="padding: 0 4px;">\\\n			<a href="javascript:smf_packagesMoreInfo(1038);void(0);">Ellow Christmas Edition Smiley Set 1.1.0.1</a>\\\n		</div>'';\n\nwindow.smfLatestSmileys += ''\\\n		<h3 style="margin: 0; padding: 4px;">New Smileys:</h3>\\\n		<ul style="list-style: none; margin-top: 3px; padding: 0 4px;">'';\n\nfor (var i = 0; i < smf_latestSmileys.length; i++)\n{\n	var id_mod = smf_latestSmileys[i];\n\n	window.smfLatestSmileys += ''<li><a href="javascript:smf_packagesMoreInfo('' + id_mod + '');void(0);">'' + smf_smileysInfo[id_mod].name + ''</a></li>'';\n}\n\nwindow.smfLatestSmileys += ''\\\n		</ul>'';\n\nwindow.smfLatestSmileys += ''\\\n	</div>'';\n\nfunction findTop(el)\n{\n	if (typeof(el.tagName) == "undefined")\n		return 0;\n\n	var skipMe = in_array(el.tagName.toLowerCase(), el.parentNode ? ["tr", "tbody", "form"] : []);\n	var coordsParent = el.parentNode ? "parentNode" : "offsetParent";\n\n	if (el[coordsParent] == null || typeof(el[coordsParent].offsetTop) == "undefined")\n		return skipMe ? 0 : el.offsetTop;\n	else\n		return (skipMe ? 0 : el.offsetTop) + findTop(el[coordsParent]);\n}\n\nfunction in_array(item, array)\n{\n	for (var i in array)\n	{\n		if (array[i] == item)\n			return true;\n	}\n\n	return false;\n}', 'text/javascript'),
(6, 'latest-support.js', '/smf/', 'language=%1$s&version=%3$s', 'window.smfLatestSupport = ''<div style="font-size: 0.85em;"><div style="font-weight: bold;">SMF 2.0.7</div>Several bugs (including PHP 5.5 compatibility issues) have been fixed in this new release.  Please <a href="http://www.simplemachines.org/download.php">try it</a> before requesting support.</div>'';\n\nif (document.getElementById(''credits''))\n	setInnerHTML(document.getElementById(''credits''), getInnerHTML(document.getElementById(''credits'')).replace(/thank you!/, ''<span onclick="alert(\\''Kupo!\\'');">thank you!</span>''));\n', 'text/javascript'),
(7, 'latest-themes.js', '/smf/', 'language=%1$s&version=%3$s', '\r\nvar smf_themeInfo = {\r\n	2741: {\r\n		name: ''-FlatLine-'',\r\n		desc: ''FlatLine is a SMF Theme that follows the &quot;flat design&quot; trend going on. It has 5 color variations. Released under the MIT/X11 license.'',\r\n		file: ''flatline.zip'',\r\n		author: ''NBK*Twitch''\r\n	},\r\n	2755: {\r\n		name: ''Lucid Dreams'',\r\n		desc: ''<hr /><div align="center"><span style="color: teal;" class="bbc_color"><span style="font-size: 16pt;" class="bbc_size"><strong>Lucid Dreams</strong></span></span><br /><span class="bbc_u">(For SMF 2.0.x)</span><br />Theme by xPandax | <a href="http://custom.simplemachines.org/mods/index.php?action=profile;u=158159" class="bbc_link" target="_blank">Mods</a> by xPandax<br /></div><hr /><div align="center"><a href="http://custom.simplemachines.org/themes/index.php?lemma=2755" class="bbc_link" target="_blank">Link to Theme</a> | <a href="http://www.simplemachines.org/community/index.php?topic=519444.0" class="bbc_link" target="_blank">Support Thread for this Theme</a></div><br /><br /><span style="color: purple;" class="bbc_color"><span style="font-size: 12pt;" class="bbc_size"><strong>Features</strong></span></span><br /><ul class="bbc_list"><li>Flat theme with 4 colors schemes.</li><li>Colour schemes can be changed by both guests &amp; members from the fixed top navigation bar.</li><li>Fluid width.</li><li>Custom 3x3 level links in the main menu (a bit overkill, yes I know that <img src="http://media.simplemachinesweb.com/smf/smileys/default/rolleyes.gif" alt="&#58;&#58;&#41;" title="Roll Eyes" class="smiley" />).</li><li>Custom copyright &amp; links in the footer.</li><li>Fixed top navigation bar with social icons, search box, login box and a few user options.</li><li>Fixed bottom navigation bar with breadcrumb menu and up &amp; down navigation buttons.</li><li>Everything is CSS based, so everything works even if javascript is disabled.</li><li>The up &amp; down navigation buttons use jquery (for smooth sliding) but still woks (in the classic style) if javascript is disabled.</li></ul><br /><br /><span style="color: purple;" class="bbc_color"><span style="font-size: 12pt;" class="bbc_size"><strong>Supported SMF Versions</strong></span></span><br />Tested on fresh installation of 2.0.x.<br /><br /><br /><span style="color: purple;" class="bbc_color"><span style="font-size: 12pt;" class="bbc_size"><strong>Supported Languages</strong></span></span><br /><ul class="bbc_list"><li>English</li></ul>Translations to other languages are welcome. Please post them in this <a href="http://www.simplemachines.org/community/index.php?topic=519444.0" class="bbc_link" target="_blank">Support Thread for this Theme</a>.<br /><br /><br /><span style="color: purple;" class="bbc_color"><span style="font-size: 12pt;" class="bbc_size"><strong>Support</strong></span></span><br />If you need support with this theme, please use the <a href="http://www.simplemachines.org/community/index.php?topic=519444.0" class="bbc_link" target="_blank">Support Thread for this Theme</a>.<br /><br /><br /><span style="color: purple;" class="bbc_color"><span style="font-size: 12pt;" class="bbc_size"><strong>How-To</strong></span></span><br />Options for the custom copyright, social icons, footer menu and adding extra menu to the main menu can be found in the theme settings. Browse to <span class="bbc_u">Admin -&gt; Configuration -&gt; Current Theme</span>.<br /><br />If you are using custom option in the main menu and want to change the name of &#039;Home&#039; (n the main menu) to something else then browse to <span class="bbc_u">/Themes/Lucid_Dreams/languages/ThemeStrings.english.php</span>. Edit the 4th line as per your need.<br /><div class="codeheader">Kod: <a href="javascript:void(0);" onclick="return smfSelectText(this);" class="codeoperation">[Seç]</a></div><code class="bbc_code">$txt&#91;&#039;home&#039;] = &#039;Home&#039;;</code><br />You should edit only the &#039;Home&#039; part and not the other part. For example, if you want to rename &#039;Home&#039; to &#039;Community&#039; then it should look like the following.<br /><div class="codeheader">Kod: <a href="javascript:void(0);" onclick="return smfSelectText(this);" class="codeoperation">[Seç]</a></div><code class="bbc_code">$txt&#91;&#039;home&#039;] = &#039;Community&#039;;</code><br /><br /><span style="color: purple;" class="bbc_color"><span style="font-size: 12pt;" class="bbc_size"><strong>Changelog</strong></span></span><br />v1.1 (14 March 2014)<br /><ul class="bbc_list"><li>Changed the CSS for quotes.</li><li>Fixed a bug in the theme string.</li></ul>v1.0<br /><ul class="bbc_list"><li>Initial release.</li></ul><br /><br /><hr /><div align="center"><span style="color: purple;" class="bbc_color"><span style="font-size: 14pt;" class="bbc_size"><strong>License</strong></span></span><br /><br />This is free and unencumbered work released into the public domain. For more information, see <a href="http://unlicense.org/" class="bbc_link" target="_blank">http://unlicense.org/</a> or the accompanying UNLICENSE file.<br /></div>'',\r\n		file: ''Lucid_Dreams_v1.1.tar.gz'',\r\n		author: ''xPandax''\r\n	},\r\n	2754: {\r\n		name: ''Mr.Truckman'',\r\n		desc: ''I designed this theme to support the maximum size of a wider site. So beautiful, you should be scalable website is 100%.<br /><br />I hope you to like it, and enjoy it<br /><br /><a href="http://mr.truckman.xn--12cl9beo6cca1dl1hqc2p.com/index.php" class="bbc_link" target="_blank">demo</a><br /><br />by <a href="http://www.xn--12cl9beo6cca1dl1hqc2p.com/index.php" class="bbc_link" target="_blank">Mr.Truckman</a>'',\r\n		file: ''Mr_Trucksman.zip'',\r\n		author: ''mr.truckman''\r\n	},\r\n	2753: {\r\n		name: ''On the Beach'',\r\n		desc: ''Detailed design emphasizes simplicity and comfort. Add a header image and the image below. So that the user can change the banner image of a user friendly interface. But still unique to the original structure of Simple Machines Forum &quot;and it can be customized as needed&quot;.<br /><br />You can change the header image and&nbsp; bottom image. / Themes / On the Beach / images / banner<br /><br />'',\r\n		file: ''On_theBeach.zip'',\r\n		author: ''mr.truckman''\r\n	},\r\n	1705: {\r\n		name: ''BlueLike'',\r\n		desc: ''<strong>BlueLike Theme</strong>'',\r\n		file: ''BlueLike.zip'',\r\n		author: ''BuRaK.!''\r\n	}\r\n};\r\nvar smf_featured = 2741;\r\nvar smf_random = 1705;\r\nvar smf_latestThemes = [2755, 2754, 2753];\r\nfunction smf_themesMoreInfo(id)\r\n{\r\n	window.smfLatestThemes_temp = document.getElementById("smfLatestThemesWindow").innerHTML;\n\n	// !!! Why not just always auto?\n	document.getElementById("smfLatestThemesWindow").style.overflow = "auto";\n	setInnerHTML(document.getElementById("smfLatestThemesWindow"),\n	''\\\n		<h3 style="margin: 0; padding: 4px;">'' + smf_themeInfo[id].name + ''</h3>\\\r\n		<h4 style="margin: 0;padding: 4px;"><a href="http://custom.simplemachines.org/themes/index.php?lemma='' + id + ''">View Theme Now!</a></h4>\\\r\n		<div style="overflow: auto;">\\\r\n			<img src="http://custom.simplemachines.org/themes/index.php?action=download;lemma=''+id+'';image=thumb" alt="" style="float: right; margin: 10px;" />\\\r\n			<div style="padding:8px;">'' + smf_themeInfo[id].desc.replace(/<a href/g, ''<a href'') + ''</div>\\\r\n		</div>\\\r\n		<div style="padding: 4px;" class="smalltext"><a href="javascript:smf_themesBack();void(0);">(go back)</a></div>'');\n}\r\n\r\nfunction smf_themesBack()\r\n{\r\n	document.getElementById("smfLatestThemesWindow").style.overflow = "";\n	setInnerHTML(document.getElementById("smfLatestThemesWindow"), window.smfLatestThemes_temp);\n	window.scrollTo(0, findTop(document.getElementById("smfLatestThemesWindow")) - 10);\r\n}\r\n\r\nwindow.smfLatestThemes = ''\\\r\n	<div id="smfLatestThemesWindow">\\\r\n		<div>\\\r\n			<img src="http://www.simplemachines.org/smf/images/themes.png" width="102" height="98" style="float: right; margin: 0 0 10px 10px;" alt="(package)" />\\\r\n			<ul style="list-style: none; padding: 0; margin: 0 0 0 5px;">'';\r\nfor(var i=0; i < smf_latestThemes.length; i++)\r\n{\r\n	var id_theme = smf_latestThemes[i];\r\n	window.smfLatestThemes += ''\\\r\n				<li style="list-style: none;"><a href="javascript:smf_themesMoreInfo('' + id_theme + '');void(0);">'' + smf_themeInfo[id_theme].name + '' by '' + smf_themeInfo[id_theme].author + ''</a></li>'';\r\n}\r\n\r\nwindow.smfLatestThemes += ''\\\r\n			</ul>'';\r\nif ( smf_featured !=0 || smf_random != 0 )\r\n{\r\n\r\n	if ( smf_featured != 0 )\r\n		window.smfLatestThemes += ''\\\r\n				<h4 style="padding: 4px 4px 0 4px; margin: 0;">Featured Theme</h4>\\\r\n				<p style="padding: 0 4px; margin: 0;">\\\r\n					<a href="javascript:smf_themesMoreInfo(''+smf_featured+'');void(0);">''+smf_themeInfo[smf_featured].name + '' by '' + smf_themeInfo[smf_featured].author+''</a>\\\r\n				</p>'';\r\n	if ( smf_random != 0 )\r\n		window.smfLatestThemes += ''\\\r\n				<h4 style="padding: 4px 4px 0 4px;margin: 0;">Theme of the Moment</h4>\\\r\n				<p style="padding: 0 4px; margin: 0;">\\\r\n					<a href="javascript:smf_themesMoreInfo(''+smf_random+'');void(0);">''+smf_themeInfo[smf_random].name + '' by '' + smf_themeInfo[smf_random].author+''</a>\\\r\n				</p>'';\r\n}\r\nwindow.smfLatestThemes += ''\\\r\n		</div>\\\r\n	</div>'';\r\n\r\nfunction findTop(el)\r\n{\r\n	if (typeof(el.tagName) == "undefined")\r\n		return 0;\r\n\r\n	var skipMe = in_array(el.tagName.toLowerCase(), el.parentNode ? ["tr", "tbody", "form"] : []);\r\n	var coordsParent = el.parentNode ? "parentNode" : "offsetParent";\r\n\r\n	if (el[coordsParent] == null || typeof(el[coordsParent].offsetTop) == "undefined")\r\n		return skipMe ? 0 : el.offsetTop;\r\n	else\r\n		return (skipMe ? 0 : el.offsetTop) + findTop(el[coordsParent]);\r\n}\r\n\r\nfunction in_array(item, array)\r\n{\r\n	for (var i in array)\r\n	{\r\n		if (array[i] == item)\r\n			return true;\r\n	}\r\n\r\n	return false;\r\n}', 'text/javascript');

-- --------------------------------------------------------

--
-- Table structure for table `smf_approval_queue`
--

CREATE TABLE IF NOT EXISTS `smf_approval_queue` (
  `id_msg` int(10) unsigned NOT NULL DEFAULT '0',
  `id_attach` int(10) unsigned NOT NULL DEFAULT '0',
  `id_event` smallint(5) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `smf_attachments`
--

CREATE TABLE IF NOT EXISTS `smf_attachments` (
  `id_attach` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_thumb` int(10) unsigned NOT NULL DEFAULT '0',
  `id_msg` int(10) unsigned NOT NULL DEFAULT '0',
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_folder` tinyint(3) NOT NULL DEFAULT '1',
  `attachment_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `file_hash` varchar(40) NOT NULL DEFAULT '',
  `fileext` varchar(8) NOT NULL DEFAULT '',
  `size` int(10) unsigned NOT NULL DEFAULT '0',
  `downloads` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `width` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `height` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `mime_type` varchar(20) NOT NULL DEFAULT '',
  `approved` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_attach`),
  UNIQUE KEY `id_member` (`id_member`,`id_attach`),
  KEY `id_msg` (`id_msg`),
  KEY `attachment_type` (`attachment_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `smf_ban_groups`
--

CREATE TABLE IF NOT EXISTS `smf_ban_groups` (
  `id_ban_group` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `ban_time` int(10) unsigned NOT NULL DEFAULT '0',
  `expire_time` int(10) unsigned DEFAULT NULL,
  `cannot_access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `cannot_register` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `cannot_post` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `cannot_login` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `reason` varchar(255) NOT NULL DEFAULT '',
  `notes` text NOT NULL,
  PRIMARY KEY (`id_ban_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `smf_ban_items`
--

CREATE TABLE IF NOT EXISTS `smf_ban_items` (
  `id_ban` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `id_ban_group` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ip_low1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ip_high1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ip_low2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ip_high2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ip_low3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ip_high3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ip_low4` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ip_high4` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `hostname` varchar(255) NOT NULL DEFAULT '',
  `email_address` varchar(255) NOT NULL DEFAULT '',
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hits` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_ban`),
  KEY `id_ban_group` (`id_ban_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `smf_board_permissions`
--

CREATE TABLE IF NOT EXISTS `smf_board_permissions` (
  `id_group` smallint(5) NOT NULL DEFAULT '0',
  `id_profile` smallint(5) unsigned NOT NULL DEFAULT '0',
  `permission` varchar(30) NOT NULL DEFAULT '',
  `add_deny` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_group`,`id_profile`,`permission`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `smf_board_permissions`
--

INSERT INTO `smf_board_permissions` (`id_group`, `id_profile`, `permission`, `add_deny`) VALUES
(-1, 1, 'poll_view', 1),
(0, 1, 'remove_own', 1),
(0, 1, 'lock_own', 1),
(0, 1, 'mark_any_notify', 1),
(0, 1, 'mark_notify', 1),
(0, 1, 'modify_own', 1),
(0, 1, 'poll_add_own', 1),
(0, 1, 'poll_edit_own', 1),
(0, 1, 'poll_lock_own', 1),
(0, 1, 'poll_post', 1),
(0, 1, 'poll_view', 1),
(0, 1, 'poll_vote', 1),
(0, 1, 'post_attachment', 1),
(0, 1, 'post_new', 1),
(0, 1, 'post_reply_any', 1),
(0, 1, 'post_reply_own', 1),
(0, 1, 'post_unapproved_topics', 1),
(0, 1, 'post_unapproved_replies_any', 1),
(0, 1, 'post_unapproved_replies_own', 1),
(0, 1, 'post_unapproved_attachments', 1),
(0, 1, 'delete_own', 1),
(0, 1, 'report_any', 1),
(0, 1, 'send_topic', 1),
(0, 1, 'view_attachments', 1),
(2, 1, 'moderate_board', 1),
(2, 1, 'post_new', 1),
(2, 1, 'post_reply_own', 1),
(2, 1, 'post_reply_any', 1),
(2, 1, 'post_unapproved_topics', 1),
(2, 1, 'post_unapproved_replies_any', 1),
(2, 1, 'post_unapproved_replies_own', 1),
(2, 1, 'post_unapproved_attachments', 1),
(2, 1, 'poll_post', 1),
(2, 1, 'poll_add_any', 1),
(2, 1, 'poll_remove_any', 1),
(2, 1, 'poll_view', 1),
(2, 1, 'poll_vote', 1),
(2, 1, 'poll_lock_any', 1),
(2, 1, 'poll_edit_any', 1),
(2, 1, 'report_any', 1),
(2, 1, 'lock_own', 1),
(2, 1, 'send_topic', 1),
(2, 1, 'mark_any_notify', 1),
(2, 1, 'mark_notify', 1),
(2, 1, 'delete_own', 1),
(2, 1, 'modify_own', 1),
(2, 1, 'make_sticky', 1),
(2, 1, 'lock_any', 1),
(2, 1, 'remove_any', 1),
(2, 1, 'move_any', 1),
(2, 1, 'merge_any', 1),
(2, 1, 'split_any', 1),
(2, 1, 'delete_any', 1),
(2, 1, 'modify_any', 1),
(2, 1, 'approve_posts', 1),
(2, 1, 'post_attachment', 1),
(2, 1, 'view_attachments', 1),
(3, 1, 'moderate_board', 1),
(3, 1, 'post_new', 1),
(3, 1, 'post_reply_own', 1),
(3, 1, 'post_reply_any', 1),
(3, 1, 'post_unapproved_topics', 1),
(3, 1, 'post_unapproved_replies_any', 1),
(3, 1, 'post_unapproved_replies_own', 1),
(3, 1, 'post_unapproved_attachments', 1),
(3, 1, 'poll_post', 1),
(3, 1, 'poll_add_any', 1),
(3, 1, 'poll_remove_any', 1),
(3, 1, 'poll_view', 1),
(3, 1, 'poll_vote', 1),
(3, 1, 'poll_lock_any', 1),
(3, 1, 'poll_edit_any', 1),
(3, 1, 'report_any', 1),
(3, 1, 'lock_own', 1),
(3, 1, 'send_topic', 1),
(3, 1, 'mark_any_notify', 1),
(3, 1, 'mark_notify', 1),
(3, 1, 'delete_own', 1),
(3, 1, 'modify_own', 1),
(3, 1, 'make_sticky', 1),
(3, 1, 'lock_any', 1),
(3, 1, 'remove_any', 1),
(3, 1, 'move_any', 1),
(3, 1, 'merge_any', 1),
(3, 1, 'split_any', 1),
(3, 1, 'delete_any', 1),
(3, 1, 'modify_any', 1),
(3, 1, 'approve_posts', 1),
(3, 1, 'post_attachment', 1),
(3, 1, 'view_attachments', 1),
(-1, 2, 'poll_view', 1),
(0, 2, 'remove_own', 1),
(0, 2, 'lock_own', 1),
(0, 2, 'mark_any_notify', 1),
(0, 2, 'mark_notify', 1),
(0, 2, 'modify_own', 1),
(0, 2, 'poll_view', 1),
(0, 2, 'poll_vote', 1),
(0, 2, 'post_attachment', 1),
(0, 2, 'post_new', 1),
(0, 2, 'post_reply_any', 1),
(0, 2, 'post_reply_own', 1),
(0, 2, 'post_unapproved_topics', 1),
(0, 2, 'post_unapproved_replies_any', 1),
(0, 2, 'post_unapproved_replies_own', 1),
(0, 2, 'post_unapproved_attachments', 1),
(0, 2, 'delete_own', 1),
(0, 2, 'report_any', 1),
(0, 2, 'send_topic', 1),
(0, 2, 'view_attachments', 1),
(2, 2, 'moderate_board', 1),
(2, 2, 'post_new', 1),
(2, 2, 'post_reply_own', 1),
(2, 2, 'post_reply_any', 1),
(2, 2, 'post_unapproved_topics', 1),
(2, 2, 'post_unapproved_replies_any', 1),
(2, 2, 'post_unapproved_replies_own', 1),
(2, 2, 'post_unapproved_attachments', 1),
(2, 2, 'poll_post', 1),
(2, 2, 'poll_add_any', 1),
(2, 2, 'poll_remove_any', 1),
(2, 2, 'poll_view', 1),
(2, 2, 'poll_vote', 1),
(2, 2, 'poll_lock_any', 1),
(2, 2, 'poll_edit_any', 1),
(2, 2, 'report_any', 1),
(2, 2, 'lock_own', 1),
(2, 2, 'send_topic', 1),
(2, 2, 'mark_any_notify', 1),
(2, 2, 'mark_notify', 1),
(2, 2, 'delete_own', 1),
(2, 2, 'modify_own', 1),
(2, 2, 'make_sticky', 1),
(2, 2, 'lock_any', 1),
(2, 2, 'remove_any', 1),
(2, 2, 'move_any', 1),
(2, 2, 'merge_any', 1),
(2, 2, 'split_any', 1),
(2, 2, 'delete_any', 1),
(2, 2, 'modify_any', 1),
(2, 2, 'approve_posts', 1),
(2, 2, 'post_attachment', 1),
(2, 2, 'view_attachments', 1),
(3, 2, 'moderate_board', 1),
(3, 2, 'post_new', 1),
(3, 2, 'post_reply_own', 1),
(3, 2, 'post_reply_any', 1),
(3, 2, 'post_unapproved_topics', 1),
(3, 2, 'post_unapproved_replies_any', 1),
(3, 2, 'post_unapproved_replies_own', 1),
(3, 2, 'post_unapproved_attachments', 1),
(3, 2, 'poll_post', 1),
(3, 2, 'poll_add_any', 1),
(3, 2, 'poll_remove_any', 1),
(3, 2, 'poll_view', 1),
(3, 2, 'poll_vote', 1),
(3, 2, 'poll_lock_any', 1),
(3, 2, 'poll_edit_any', 1),
(3, 2, 'report_any', 1),
(3, 2, 'lock_own', 1),
(3, 2, 'send_topic', 1),
(3, 2, 'mark_any_notify', 1),
(3, 2, 'mark_notify', 1),
(3, 2, 'delete_own', 1),
(3, 2, 'modify_own', 1),
(3, 2, 'make_sticky', 1),
(3, 2, 'lock_any', 1),
(3, 2, 'remove_any', 1),
(3, 2, 'move_any', 1),
(3, 2, 'merge_any', 1),
(3, 2, 'split_any', 1),
(3, 2, 'delete_any', 1),
(3, 2, 'modify_any', 1),
(3, 2, 'approve_posts', 1),
(3, 2, 'post_attachment', 1),
(3, 2, 'view_attachments', 1),
(-1, 3, 'poll_view', 1),
(0, 3, 'remove_own', 1),
(0, 3, 'lock_own', 1),
(0, 3, 'mark_any_notify', 1),
(0, 3, 'mark_notify', 1),
(0, 3, 'modify_own', 1),
(0, 3, 'poll_view', 1),
(0, 3, 'poll_vote', 1),
(0, 3, 'post_attachment', 1),
(0, 3, 'post_reply_any', 1),
(0, 3, 'post_reply_own', 1),
(0, 3, 'post_unapproved_replies_any', 1),
(0, 3, 'post_unapproved_replies_own', 1),
(0, 3, 'post_unapproved_attachments', 1),
(0, 3, 'delete_own', 1),
(0, 3, 'report_any', 1),
(0, 3, 'send_topic', 1),
(0, 3, 'view_attachments', 1),
(2, 3, 'moderate_board', 1),
(2, 3, 'post_new', 1),
(2, 3, 'post_reply_own', 1),
(2, 3, 'post_reply_any', 1),
(2, 3, 'post_unapproved_topics', 1),
(2, 3, 'post_unapproved_replies_any', 1),
(2, 3, 'post_unapproved_replies_own', 1),
(2, 3, 'post_unapproved_attachments', 1),
(2, 3, 'poll_post', 1),
(2, 3, 'poll_add_any', 1),
(2, 3, 'poll_remove_any', 1),
(2, 3, 'poll_view', 1),
(2, 3, 'poll_vote', 1),
(2, 3, 'poll_lock_any', 1),
(2, 3, 'poll_edit_any', 1),
(2, 3, 'report_any', 1),
(2, 3, 'lock_own', 1),
(2, 3, 'send_topic', 1),
(2, 3, 'mark_any_notify', 1),
(2, 3, 'mark_notify', 1),
(2, 3, 'delete_own', 1),
(2, 3, 'modify_own', 1),
(2, 3, 'make_sticky', 1),
(2, 3, 'lock_any', 1),
(2, 3, 'remove_any', 1),
(2, 3, 'move_any', 1),
(2, 3, 'merge_any', 1),
(2, 3, 'split_any', 1),
(2, 3, 'delete_any', 1),
(2, 3, 'modify_any', 1),
(2, 3, 'approve_posts', 1),
(2, 3, 'post_attachment', 1),
(2, 3, 'view_attachments', 1),
(3, 3, 'moderate_board', 1),
(3, 3, 'post_new', 1),
(3, 3, 'post_reply_own', 1),
(3, 3, 'post_reply_any', 1),
(3, 3, 'post_unapproved_topics', 1),
(3, 3, 'post_unapproved_replies_any', 1),
(3, 3, 'post_unapproved_replies_own', 1),
(3, 3, 'post_unapproved_attachments', 1),
(3, 3, 'poll_post', 1),
(3, 3, 'poll_add_any', 1),
(3, 3, 'poll_remove_any', 1),
(3, 3, 'poll_view', 1),
(3, 3, 'poll_vote', 1),
(3, 3, 'poll_lock_any', 1),
(3, 3, 'poll_edit_any', 1),
(3, 3, 'report_any', 1),
(3, 3, 'lock_own', 1),
(3, 3, 'send_topic', 1),
(3, 3, 'mark_any_notify', 1),
(3, 3, 'mark_notify', 1),
(3, 3, 'delete_own', 1),
(3, 3, 'modify_own', 1),
(3, 3, 'make_sticky', 1),
(3, 3, 'lock_any', 1),
(3, 3, 'remove_any', 1),
(3, 3, 'move_any', 1),
(3, 3, 'merge_any', 1),
(3, 3, 'split_any', 1),
(3, 3, 'delete_any', 1),
(3, 3, 'modify_any', 1),
(3, 3, 'approve_posts', 1),
(3, 3, 'post_attachment', 1),
(3, 3, 'view_attachments', 1),
(-1, 4, 'poll_view', 1),
(0, 4, 'mark_any_notify', 1),
(0, 4, 'mark_notify', 1),
(0, 4, 'poll_view', 1),
(0, 4, 'poll_vote', 1),
(0, 4, 'report_any', 1),
(0, 4, 'send_topic', 1),
(0, 4, 'view_attachments', 1),
(2, 4, 'moderate_board', 1),
(2, 4, 'post_new', 1),
(2, 4, 'post_reply_own', 1),
(2, 4, 'post_reply_any', 1),
(2, 4, 'post_unapproved_topics', 1),
(2, 4, 'post_unapproved_replies_any', 1),
(2, 4, 'post_unapproved_replies_own', 1),
(2, 4, 'post_unapproved_attachments', 1),
(2, 4, 'poll_post', 1),
(2, 4, 'poll_add_any', 1),
(2, 4, 'poll_remove_any', 1),
(2, 4, 'poll_view', 1),
(2, 4, 'poll_vote', 1),
(2, 4, 'poll_lock_any', 1),
(2, 4, 'poll_edit_any', 1),
(2, 4, 'report_any', 1),
(2, 4, 'lock_own', 1),
(2, 4, 'send_topic', 1),
(2, 4, 'mark_any_notify', 1),
(2, 4, 'mark_notify', 1),
(2, 4, 'delete_own', 1),
(2, 4, 'modify_own', 1),
(2, 4, 'make_sticky', 1),
(2, 4, 'lock_any', 1),
(2, 4, 'remove_any', 1),
(2, 4, 'move_any', 1),
(2, 4, 'merge_any', 1),
(2, 4, 'split_any', 1),
(2, 4, 'delete_any', 1),
(2, 4, 'modify_any', 1),
(2, 4, 'approve_posts', 1),
(2, 4, 'post_attachment', 1),
(2, 4, 'view_attachments', 1),
(3, 4, 'moderate_board', 1),
(3, 4, 'post_new', 1),
(3, 4, 'post_reply_own', 1),
(3, 4, 'post_reply_any', 1),
(3, 4, 'post_unapproved_topics', 1),
(3, 4, 'post_unapproved_replies_any', 1),
(3, 4, 'post_unapproved_replies_own', 1),
(3, 4, 'post_unapproved_attachments', 1),
(3, 4, 'poll_post', 1),
(3, 4, 'poll_add_any', 1),
(3, 4, 'poll_remove_any', 1),
(3, 4, 'poll_view', 1),
(3, 4, 'poll_vote', 1),
(3, 4, 'poll_lock_any', 1),
(3, 4, 'poll_edit_any', 1),
(3, 4, 'report_any', 1),
(3, 4, 'lock_own', 1),
(3, 4, 'send_topic', 1),
(3, 4, 'mark_any_notify', 1),
(3, 4, 'mark_notify', 1),
(3, 4, 'delete_own', 1),
(3, 4, 'modify_own', 1),
(3, 4, 'make_sticky', 1),
(3, 4, 'lock_any', 1),
(3, 4, 'remove_any', 1),
(3, 4, 'move_any', 1),
(3, 4, 'merge_any', 1),
(3, 4, 'split_any', 1),
(3, 4, 'delete_any', 1),
(3, 4, 'modify_any', 1),
(3, 4, 'approve_posts', 1),
(3, 4, 'post_attachment', 1),
(3, 4, 'view_attachments', 1);

-- --------------------------------------------------------

--
-- Table structure for table `smf_boards`
--

CREATE TABLE IF NOT EXISTS `smf_boards` (
  `id_board` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `id_cat` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `child_level` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `id_parent` smallint(5) unsigned NOT NULL DEFAULT '0',
  `board_order` smallint(5) NOT NULL DEFAULT '0',
  `id_last_msg` int(10) unsigned NOT NULL DEFAULT '0',
  `id_msg_updated` int(10) unsigned NOT NULL DEFAULT '0',
  `member_groups` varchar(255) NOT NULL DEFAULT '-1,0',
  `id_profile` smallint(5) unsigned NOT NULL DEFAULT '1',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `num_topics` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `num_posts` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `count_posts` tinyint(4) NOT NULL DEFAULT '0',
  `id_theme` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `override_theme` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `unapproved_posts` smallint(5) NOT NULL DEFAULT '0',
  `unapproved_topics` smallint(5) NOT NULL DEFAULT '0',
  `redirect` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_board`),
  UNIQUE KEY `categories` (`id_cat`,`id_board`),
  KEY `id_parent` (`id_parent`),
  KEY `id_msg_updated` (`id_msg_updated`),
  KEY `member_groups` (`member_groups`(48))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `smf_boards`
--

INSERT INTO `smf_boards` (`id_board`, `id_cat`, `child_level`, `id_parent`, `board_order`, `id_last_msg`, `id_msg_updated`, `member_groups`, `id_profile`, `name`, `description`, `num_topics`, `num_posts`, `count_posts`, `id_theme`, `override_theme`, `unapproved_posts`, `unapproved_topics`, `redirect`) VALUES
(1, 1, 0, 0, 1, 1, 1, '-1,0,2', 1, 'General Discussion', 'Feel free to talk about anything and everything in this board.', 1, 1, 0, 0, 0, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `smf_calendar`
--

CREATE TABLE IF NOT EXISTS `smf_calendar` (
  `id_event` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL DEFAULT '0001-01-01',
  `end_date` date NOT NULL DEFAULT '0001-01-01',
  `id_board` smallint(5) unsigned NOT NULL DEFAULT '0',
  `id_topic` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_event`),
  KEY `start_date` (`start_date`),
  KEY `end_date` (`end_date`),
  KEY `topic` (`id_topic`,`id_member`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `smf_calendar_holidays`
--

CREATE TABLE IF NOT EXISTS `smf_calendar_holidays` (
  `id_holiday` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `event_date` date NOT NULL DEFAULT '0001-01-01',
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_holiday`),
  KEY `event_date` (`event_date`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=116 ;

--
-- Dumping data for table `smf_calendar_holidays`
--

INSERT INTO `smf_calendar_holidays` (`id_holiday`, `event_date`, `title`) VALUES
(1, '0004-01-01', 'New Year''s'),
(2, '0004-12-25', 'Christmas'),
(3, '0004-02-14', 'Valentine''s Day'),
(4, '0004-03-17', 'St. Patrick''s Day'),
(5, '0004-04-01', 'April Fools'),
(6, '0004-04-22', 'Earth Day'),
(7, '0004-10-24', 'United Nations Day'),
(8, '0004-10-31', 'Halloween'),
(9, '2010-05-09', 'Mother''s Day'),
(10, '2011-05-08', 'Mother''s Day'),
(11, '2012-05-13', 'Mother''s Day'),
(12, '2013-05-12', 'Mother''s Day'),
(13, '2014-05-11', 'Mother''s Day'),
(14, '2015-05-10', 'Mother''s Day'),
(15, '2016-05-08', 'Mother''s Day'),
(16, '2017-05-14', 'Mother''s Day'),
(17, '2018-05-13', 'Mother''s Day'),
(18, '2019-05-12', 'Mother''s Day'),
(19, '2020-05-10', 'Mother''s Day'),
(20, '2008-06-15', 'Father''s Day'),
(21, '2009-06-21', 'Father''s Day'),
(22, '2010-06-20', 'Father''s Day'),
(23, '2011-06-19', 'Father''s Day'),
(24, '2012-06-17', 'Father''s Day'),
(25, '2013-06-16', 'Father''s Day'),
(26, '2014-06-15', 'Father''s Day'),
(27, '2015-06-21', 'Father''s Day'),
(28, '2016-06-19', 'Father''s Day'),
(29, '2017-06-18', 'Father''s Day'),
(30, '2018-06-17', 'Father''s Day'),
(31, '2019-06-16', 'Father''s Day'),
(32, '2020-06-21', 'Father''s Day'),
(33, '2010-06-21', 'Summer Solstice'),
(34, '2011-06-21', 'Summer Solstice'),
(35, '2012-06-20', 'Summer Solstice'),
(36, '2013-06-21', 'Summer Solstice'),
(37, '2014-06-21', 'Summer Solstice'),
(38, '2015-06-21', 'Summer Solstice'),
(39, '2016-06-20', 'Summer Solstice'),
(40, '2017-06-20', 'Summer Solstice'),
(41, '2018-06-21', 'Summer Solstice'),
(42, '2019-06-21', 'Summer Solstice'),
(43, '2020-06-20', 'Summer Solstice'),
(44, '2010-03-20', 'Vernal Equinox'),
(45, '2011-03-20', 'Vernal Equinox'),
(46, '2012-03-20', 'Vernal Equinox'),
(47, '2013-03-20', 'Vernal Equinox'),
(48, '2014-03-20', 'Vernal Equinox'),
(49, '2015-03-20', 'Vernal Equinox'),
(50, '2016-03-19', 'Vernal Equinox'),
(51, '2017-03-20', 'Vernal Equinox'),
(52, '2018-03-20', 'Vernal Equinox'),
(53, '2019-03-20', 'Vernal Equinox'),
(54, '2020-03-19', 'Vernal Equinox'),
(55, '2010-12-21', 'Winter Solstice'),
(56, '2011-12-22', 'Winter Solstice'),
(57, '2012-12-21', 'Winter Solstice'),
(58, '2013-12-21', 'Winter Solstice'),
(59, '2014-12-21', 'Winter Solstice'),
(60, '2015-12-21', 'Winter Solstice'),
(61, '2016-12-21', 'Winter Solstice'),
(62, '2017-12-21', 'Winter Solstice'),
(63, '2018-12-21', 'Winter Solstice'),
(64, '2019-12-21', 'Winter Solstice'),
(65, '2020-12-21', 'Winter Solstice'),
(66, '2010-09-22', 'Autumnal Equinox'),
(67, '2011-09-23', 'Autumnal Equinox'),
(68, '2012-09-22', 'Autumnal Equinox'),
(69, '2013-09-22', 'Autumnal Equinox'),
(70, '2014-09-22', 'Autumnal Equinox'),
(71, '2015-09-23', 'Autumnal Equinox'),
(72, '2016-09-22', 'Autumnal Equinox'),
(73, '2017-09-22', 'Autumnal Equinox'),
(74, '2018-09-22', 'Autumnal Equinox'),
(75, '2019-09-23', 'Autumnal Equinox'),
(76, '2020-09-22', 'Autumnal Equinox'),
(77, '0004-07-04', 'Independence Day'),
(78, '0004-05-05', 'Cinco de Mayo'),
(79, '0004-06-14', 'Flag Day'),
(80, '0004-11-11', 'Veterans Day'),
(81, '0004-02-02', 'Groundhog Day'),
(82, '2010-11-25', 'Thanksgiving'),
(83, '2011-11-24', 'Thanksgiving'),
(84, '2012-11-22', 'Thanksgiving'),
(85, '2013-11-28', 'Thanksgiving'),
(86, '2014-11-27', 'Thanksgiving'),
(87, '2015-11-26', 'Thanksgiving'),
(88, '2016-11-24', 'Thanksgiving'),
(89, '2017-11-23', 'Thanksgiving'),
(90, '2018-11-22', 'Thanksgiving'),
(91, '2019-11-28', 'Thanksgiving'),
(92, '2020-11-26', 'Thanksgiving'),
(93, '2010-05-31', 'Memorial Day'),
(94, '2011-05-30', 'Memorial Day'),
(95, '2012-05-28', 'Memorial Day'),
(96, '2013-05-27', 'Memorial Day'),
(97, '2014-05-26', 'Memorial Day'),
(98, '2015-05-25', 'Memorial Day'),
(99, '2016-05-30', 'Memorial Day'),
(100, '2017-05-29', 'Memorial Day'),
(101, '2018-05-28', 'Memorial Day'),
(102, '2019-05-27', 'Memorial Day'),
(103, '2020-05-25', 'Memorial Day'),
(104, '2010-09-06', 'Labor Day'),
(105, '2011-09-05', 'Labor Day'),
(106, '2012-09-03', 'Labor Day'),
(107, '2013-09-02', 'Labor Day'),
(108, '2014-09-01', 'Labor Day'),
(109, '2015-09-07', 'Labor Day'),
(110, '2016-09-05', 'Labor Day'),
(111, '2017-09-04', 'Labor Day'),
(112, '2018-09-03', 'Labor Day'),
(113, '2019-09-02', 'Labor Day'),
(114, '2020-09-07', 'Labor Day'),
(115, '0004-06-06', 'D-Day');

-- --------------------------------------------------------

--
-- Table structure for table `smf_categories`
--

CREATE TABLE IF NOT EXISTS `smf_categories` (
  `id_cat` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `cat_order` tinyint(4) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `can_collapse` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_cat`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `smf_categories`
--

INSERT INTO `smf_categories` (`id_cat`, `cat_order`, `name`, `can_collapse`) VALUES
(1, 0, 'General Category', 1);

-- --------------------------------------------------------

--
-- Table structure for table `smf_collapsed_categories`
--

CREATE TABLE IF NOT EXISTS `smf_collapsed_categories` (
  `id_cat` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_cat`,`id_member`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `smf_custom_fields`
--

CREATE TABLE IF NOT EXISTS `smf_custom_fields` (
  `id_field` smallint(5) NOT NULL AUTO_INCREMENT,
  `col_name` varchar(12) NOT NULL DEFAULT '',
  `field_name` varchar(40) NOT NULL DEFAULT '',
  `field_desc` varchar(255) NOT NULL DEFAULT '',
  `field_type` varchar(8) NOT NULL DEFAULT 'text',
  `field_length` smallint(5) NOT NULL DEFAULT '255',
  `field_options` text NOT NULL,
  `mask` varchar(255) NOT NULL DEFAULT '',
  `show_reg` tinyint(3) NOT NULL DEFAULT '0',
  `show_display` tinyint(3) NOT NULL DEFAULT '0',
  `show_profile` varchar(20) NOT NULL DEFAULT 'forumprofile',
  `private` tinyint(3) NOT NULL DEFAULT '0',
  `active` tinyint(3) NOT NULL DEFAULT '1',
  `bbc` tinyint(3) NOT NULL DEFAULT '0',
  `can_search` tinyint(3) NOT NULL DEFAULT '0',
  `default_value` varchar(255) NOT NULL DEFAULT '',
  `enclose` text NOT NULL,
  `placement` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_field`),
  UNIQUE KEY `col_name` (`col_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `smf_group_moderators`
--

CREATE TABLE IF NOT EXISTS `smf_group_moderators` (
  `id_group` smallint(5) unsigned NOT NULL DEFAULT '0',
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_group`,`id_member`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `smf_log_actions`
--

CREATE TABLE IF NOT EXISTS `smf_log_actions` (
  `id_action` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_log` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `log_time` int(10) unsigned NOT NULL DEFAULT '0',
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ip` char(16) NOT NULL DEFAULT '',
  `action` varchar(30) NOT NULL DEFAULT '',
  `id_board` smallint(5) unsigned NOT NULL DEFAULT '0',
  `id_topic` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_msg` int(10) unsigned NOT NULL DEFAULT '0',
  `extra` text NOT NULL,
  PRIMARY KEY (`id_action`),
  KEY `id_log` (`id_log`),
  KEY `log_time` (`log_time`),
  KEY `id_member` (`id_member`),
  KEY `id_board` (`id_board`),
  KEY `id_msg` (`id_msg`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `smf_log_activity`
--

CREATE TABLE IF NOT EXISTS `smf_log_activity` (
  `date` date NOT NULL DEFAULT '0001-01-01',
  `hits` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topics` smallint(5) unsigned NOT NULL DEFAULT '0',
  `posts` smallint(5) unsigned NOT NULL DEFAULT '0',
  `registers` smallint(5) unsigned NOT NULL DEFAULT '0',
  `most_on` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`date`),
  KEY `most_on` (`most_on`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `smf_log_activity`
--

INSERT INTO `smf_log_activity` (`date`, `hits`, `topics`, `posts`, `registers`, `most_on`) VALUES
('2014-04-14', 0, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `smf_log_banned`
--

CREATE TABLE IF NOT EXISTS `smf_log_banned` (
  `id_ban_log` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ip` char(16) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `log_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_ban_log`),
  KEY `log_time` (`log_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `smf_log_boards`
--

CREATE TABLE IF NOT EXISTS `smf_log_boards` (
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_board` smallint(5) unsigned NOT NULL DEFAULT '0',
  `id_msg` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_member`,`id_board`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `smf_log_comments`
--

CREATE TABLE IF NOT EXISTS `smf_log_comments` (
  `id_comment` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `member_name` varchar(80) NOT NULL DEFAULT '',
  `comment_type` varchar(8) NOT NULL DEFAULT 'warning',
  `id_recipient` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `recipient_name` varchar(255) NOT NULL DEFAULT '',
  `log_time` int(10) NOT NULL DEFAULT '0',
  `id_notice` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `counter` tinyint(3) NOT NULL DEFAULT '0',
  `body` text NOT NULL,
  PRIMARY KEY (`id_comment`),
  KEY `id_recipient` (`id_recipient`),
  KEY `log_time` (`log_time`),
  KEY `comment_type` (`comment_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `smf_log_digest`
--

CREATE TABLE IF NOT EXISTS `smf_log_digest` (
  `id_topic` mediumint(8) unsigned NOT NULL,
  `id_msg` int(10) unsigned NOT NULL,
  `note_type` varchar(10) NOT NULL DEFAULT 'post',
  `daily` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `exclude` mediumint(8) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `smf_log_errors`
--

CREATE TABLE IF NOT EXISTS `smf_log_errors` (
  `id_error` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `log_time` int(10) unsigned NOT NULL DEFAULT '0',
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ip` char(16) NOT NULL DEFAULT '',
  `url` text NOT NULL,
  `message` text NOT NULL,
  `session` char(32) NOT NULL DEFAULT '',
  `error_type` char(15) NOT NULL DEFAULT 'general',
  `file` varchar(255) NOT NULL DEFAULT '',
  `line` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_error`),
  KEY `log_time` (`log_time`),
  KEY `id_member` (`id_member`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `smf_log_floodcontrol`
--

CREATE TABLE IF NOT EXISTS `smf_log_floodcontrol` (
  `ip` char(16) NOT NULL DEFAULT '',
  `log_time` int(10) unsigned NOT NULL DEFAULT '0',
  `log_type` varchar(8) NOT NULL DEFAULT 'post',
  PRIMARY KEY (`ip`,`log_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `smf_log_group_requests`
--

CREATE TABLE IF NOT EXISTS `smf_log_group_requests` (
  `id_request` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_group` smallint(5) unsigned NOT NULL DEFAULT '0',
  `time_applied` int(10) unsigned NOT NULL DEFAULT '0',
  `reason` text NOT NULL,
  PRIMARY KEY (`id_request`),
  UNIQUE KEY `id_member` (`id_member`,`id_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `smf_log_karma`
--

CREATE TABLE IF NOT EXISTS `smf_log_karma` (
  `id_target` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_executor` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `log_time` int(10) unsigned NOT NULL DEFAULT '0',
  `action` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_target`,`id_executor`),
  KEY `log_time` (`log_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `smf_log_mark_read`
--

CREATE TABLE IF NOT EXISTS `smf_log_mark_read` (
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_board` smallint(5) unsigned NOT NULL DEFAULT '0',
  `id_msg` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_member`,`id_board`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `smf_log_member_notices`
--

CREATE TABLE IF NOT EXISTS `smf_log_member_notices` (
  `id_notice` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  PRIMARY KEY (`id_notice`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `smf_log_notify`
--

CREATE TABLE IF NOT EXISTS `smf_log_notify` (
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_topic` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_board` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sent` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_member`,`id_topic`,`id_board`),
  KEY `id_topic` (`id_topic`,`id_member`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `smf_log_online`
--

CREATE TABLE IF NOT EXISTS `smf_log_online` (
  `session` varchar(32) NOT NULL DEFAULT '',
  `log_time` int(10) NOT NULL DEFAULT '0',
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_spider` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ip` int(10) unsigned NOT NULL DEFAULT '0',
  `url` text NOT NULL,
  PRIMARY KEY (`session`),
  KEY `log_time` (`log_time`),
  KEY `id_member` (`id_member`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `smf_log_online`
--

INSERT INTO `smf_log_online` (`session`, `log_time`, `id_member`, `id_spider`, `ip`, `url`) VALUES
('2abujhm5sufqs4uigli8taufg6', 1397437794, 1, 0, 0, 'a:1:{s:10:"USER_AGENT";s:102:"Mozilla/5.0 (Windows NT 6.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.116 Safari/537.36";}');

-- --------------------------------------------------------

--
-- Table structure for table `smf_log_packages`
--

CREATE TABLE IF NOT EXISTS `smf_log_packages` (
  `id_install` int(10) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL DEFAULT '',
  `package_id` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(255) NOT NULL DEFAULT '',
  `id_member_installed` mediumint(8) NOT NULL DEFAULT '0',
  `member_installed` varchar(255) NOT NULL DEFAULT '',
  `time_installed` int(10) NOT NULL DEFAULT '0',
  `id_member_removed` mediumint(8) NOT NULL DEFAULT '0',
  `member_removed` varchar(255) NOT NULL DEFAULT '',
  `time_removed` int(10) NOT NULL DEFAULT '0',
  `install_state` tinyint(3) NOT NULL DEFAULT '1',
  `failed_steps` text NOT NULL,
  `themes_installed` varchar(255) NOT NULL DEFAULT '',
  `db_changes` text NOT NULL,
  PRIMARY KEY (`id_install`),
  KEY `filename` (`filename`(15))
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `smf_log_polls`
--

CREATE TABLE IF NOT EXISTS `smf_log_polls` (
  `id_poll` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_choice` tinyint(3) unsigned NOT NULL DEFAULT '0',
  KEY `id_poll` (`id_poll`,`id_member`,`id_choice`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `smf_log_reported`
--

CREATE TABLE IF NOT EXISTS `smf_log_reported` (
  `id_report` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `id_msg` int(10) unsigned NOT NULL DEFAULT '0',
  `id_topic` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_board` smallint(5) unsigned NOT NULL DEFAULT '0',
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `membername` varchar(255) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `time_started` int(10) NOT NULL DEFAULT '0',
  `time_updated` int(10) NOT NULL DEFAULT '0',
  `num_reports` mediumint(6) NOT NULL DEFAULT '0',
  `closed` tinyint(3) NOT NULL DEFAULT '0',
  `ignore_all` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_report`),
  KEY `id_member` (`id_member`),
  KEY `id_topic` (`id_topic`),
  KEY `closed` (`closed`),
  KEY `time_started` (`time_started`),
  KEY `id_msg` (`id_msg`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `smf_log_reported_comments`
--

CREATE TABLE IF NOT EXISTS `smf_log_reported_comments` (
  `id_comment` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `id_report` mediumint(8) NOT NULL DEFAULT '0',
  `id_member` mediumint(8) NOT NULL,
  `membername` varchar(255) NOT NULL DEFAULT '',
  `email_address` varchar(255) NOT NULL DEFAULT '',
  `member_ip` varchar(255) NOT NULL DEFAULT '',
  `comment` varchar(255) NOT NULL DEFAULT '',
  `time_sent` int(10) NOT NULL,
  PRIMARY KEY (`id_comment`),
  KEY `id_report` (`id_report`),
  KEY `id_member` (`id_member`),
  KEY `time_sent` (`time_sent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `smf_log_scheduled_tasks`
--

CREATE TABLE IF NOT EXISTS `smf_log_scheduled_tasks` (
  `id_log` mediumint(8) NOT NULL AUTO_INCREMENT,
  `id_task` smallint(5) NOT NULL DEFAULT '0',
  `time_run` int(10) NOT NULL DEFAULT '0',
  `time_taken` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_log`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `smf_log_scheduled_tasks`
--

INSERT INTO `smf_log_scheduled_tasks` (`id_log`, `id_task`, `time_run`, `time_taken`) VALUES
(1, 2, 1397435771, 5),
(2, 3, 1397437493, 0),
(3, 5, 1397437536, 0),
(4, 6, 1397437795, 0);

-- --------------------------------------------------------

--
-- Table structure for table `smf_log_search_messages`
--

CREATE TABLE IF NOT EXISTS `smf_log_search_messages` (
  `id_search` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `id_msg` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_search`,`id_msg`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `smf_log_search_results`
--

CREATE TABLE IF NOT EXISTS `smf_log_search_results` (
  `id_search` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `id_topic` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_msg` int(10) unsigned NOT NULL DEFAULT '0',
  `relevance` smallint(5) unsigned NOT NULL DEFAULT '0',
  `num_matches` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_search`,`id_topic`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `smf_log_search_subjects`
--

CREATE TABLE IF NOT EXISTS `smf_log_search_subjects` (
  `word` varchar(20) NOT NULL DEFAULT '',
  `id_topic` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`word`,`id_topic`),
  KEY `id_topic` (`id_topic`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `smf_log_search_subjects`
--

INSERT INTO `smf_log_search_subjects` (`word`, `id_topic`) VALUES
('SMF', 1),
('to', 1),
('Welcome', 1);

-- --------------------------------------------------------

--
-- Table structure for table `smf_log_search_topics`
--

CREATE TABLE IF NOT EXISTS `smf_log_search_topics` (
  `id_search` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `id_topic` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_search`,`id_topic`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `smf_log_spider_hits`
--

CREATE TABLE IF NOT EXISTS `smf_log_spider_hits` (
  `id_hit` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_spider` smallint(5) unsigned NOT NULL DEFAULT '0',
  `log_time` int(10) unsigned NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `processed` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_hit`),
  KEY `id_spider` (`id_spider`),
  KEY `log_time` (`log_time`),
  KEY `processed` (`processed`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `smf_log_spider_stats`
--

CREATE TABLE IF NOT EXISTS `smf_log_spider_stats` (
  `id_spider` smallint(5) unsigned NOT NULL DEFAULT '0',
  `page_hits` smallint(5) unsigned NOT NULL DEFAULT '0',
  `last_seen` int(10) unsigned NOT NULL DEFAULT '0',
  `stat_date` date NOT NULL DEFAULT '0001-01-01',
  PRIMARY KEY (`stat_date`,`id_spider`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `smf_log_subscribed`
--

CREATE TABLE IF NOT EXISTS `smf_log_subscribed` (
  `id_sublog` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_subscribe` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_member` int(10) NOT NULL DEFAULT '0',
  `old_id_group` smallint(5) NOT NULL DEFAULT '0',
  `start_time` int(10) NOT NULL DEFAULT '0',
  `end_time` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `payments_pending` tinyint(3) NOT NULL DEFAULT '0',
  `pending_details` text NOT NULL,
  `reminder_sent` tinyint(3) NOT NULL DEFAULT '0',
  `vendor_ref` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_sublog`),
  UNIQUE KEY `id_subscribe` (`id_subscribe`,`id_member`),
  KEY `end_time` (`end_time`),
  KEY `reminder_sent` (`reminder_sent`),
  KEY `payments_pending` (`payments_pending`),
  KEY `status` (`status`),
  KEY `id_member` (`id_member`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `smf_log_topics`
--

CREATE TABLE IF NOT EXISTS `smf_log_topics` (
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_topic` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_msg` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_member`,`id_topic`),
  KEY `id_topic` (`id_topic`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `smf_mail_queue`
--

CREATE TABLE IF NOT EXISTS `smf_mail_queue` (
  `id_mail` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `time_sent` int(10) NOT NULL DEFAULT '0',
  `recipient` varchar(255) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `headers` text NOT NULL,
  `send_html` tinyint(3) NOT NULL DEFAULT '0',
  `priority` tinyint(3) NOT NULL DEFAULT '1',
  `private` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_mail`),
  KEY `time_sent` (`time_sent`),
  KEY `mail_priority` (`priority`,`id_mail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `smf_membergroups`
--

CREATE TABLE IF NOT EXISTS `smf_membergroups` (
  `id_group` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(80) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `online_color` varchar(20) NOT NULL DEFAULT '',
  `min_posts` mediumint(9) NOT NULL DEFAULT '-1',
  `max_messages` smallint(5) unsigned NOT NULL DEFAULT '0',
  `stars` varchar(255) NOT NULL DEFAULT '',
  `group_type` tinyint(3) NOT NULL DEFAULT '0',
  `hidden` tinyint(3) NOT NULL DEFAULT '0',
  `id_parent` smallint(5) NOT NULL DEFAULT '-2',
  PRIMARY KEY (`id_group`),
  KEY `min_posts` (`min_posts`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `smf_membergroups`
--

INSERT INTO `smf_membergroups` (`id_group`, `group_name`, `description`, `online_color`, `min_posts`, `max_messages`, `stars`, `group_type`, `hidden`, `id_parent`) VALUES
(1, 'Administrator', '', '#FF0000', -1, 0, '5#staradmin.gif', 1, 0, -2),
(2, 'Global Moderator', '', '#0000FF', -1, 0, '5#stargmod.gif', 0, 0, -2),
(3, 'Moderator', '', '', -1, 0, '5#starmod.gif', 0, 0, -2),
(4, 'Newbie', '', '', 0, 0, '1#star.gif', 0, 0, -2),
(5, 'Jr. Member', '', '', 50, 0, '2#star.gif', 0, 0, -2),
(6, 'Full Member', '', '', 100, 0, '3#star.gif', 0, 0, -2),
(7, 'Sr. Member', '', '', 250, 0, '4#star.gif', 0, 0, -2),
(8, 'Hero Member', '', '', 500, 0, '5#star.gif', 0, 0, -2);

-- --------------------------------------------------------

--
-- Table structure for table `smf_members`
--

CREATE TABLE IF NOT EXISTS `smf_members` (
  `id_member` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `member_name` varchar(80) NOT NULL DEFAULT '',
  `date_registered` int(10) unsigned NOT NULL DEFAULT '0',
  `posts` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_group` smallint(5) unsigned NOT NULL DEFAULT '0',
  `lngfile` varchar(255) NOT NULL DEFAULT '',
  `last_login` int(10) unsigned NOT NULL DEFAULT '0',
  `real_name` varchar(255) NOT NULL DEFAULT '',
  `instant_messages` smallint(5) NOT NULL DEFAULT '0',
  `unread_messages` smallint(5) NOT NULL DEFAULT '0',
  `new_pm` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `buddy_list` text NOT NULL,
  `pm_ignore_list` varchar(255) NOT NULL DEFAULT '',
  `pm_prefs` mediumint(8) NOT NULL DEFAULT '0',
  `mod_prefs` varchar(20) NOT NULL DEFAULT '',
  `message_labels` text NOT NULL,
  `passwd` varchar(64) NOT NULL DEFAULT '',
  `openid_uri` text NOT NULL,
  `email_address` varchar(255) NOT NULL DEFAULT '',
  `personal_text` varchar(255) NOT NULL DEFAULT '',
  `gender` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `birthdate` date NOT NULL DEFAULT '0001-01-01',
  `website_title` varchar(255) NOT NULL DEFAULT '',
  `website_url` varchar(255) NOT NULL DEFAULT '',
  `location` varchar(255) NOT NULL DEFAULT '',
  `icq` varchar(255) NOT NULL DEFAULT '',
  `aim` varchar(255) NOT NULL DEFAULT '',
  `yim` varchar(32) NOT NULL DEFAULT '',
  `msn` varchar(255) NOT NULL DEFAULT '',
  `hide_email` tinyint(4) NOT NULL DEFAULT '0',
  `show_online` tinyint(4) NOT NULL DEFAULT '1',
  `time_format` varchar(80) NOT NULL DEFAULT '',
  `signature` text NOT NULL,
  `time_offset` float NOT NULL DEFAULT '0',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `pm_email_notify` tinyint(4) NOT NULL DEFAULT '0',
  `karma_bad` smallint(5) unsigned NOT NULL DEFAULT '0',
  `karma_good` smallint(5) unsigned NOT NULL DEFAULT '0',
  `usertitle` varchar(255) NOT NULL DEFAULT '',
  `notify_announcements` tinyint(4) NOT NULL DEFAULT '1',
  `notify_regularity` tinyint(4) NOT NULL DEFAULT '1',
  `notify_send_body` tinyint(4) NOT NULL DEFAULT '0',
  `notify_types` tinyint(4) NOT NULL DEFAULT '2',
  `member_ip` varchar(255) NOT NULL DEFAULT '',
  `member_ip2` varchar(255) NOT NULL DEFAULT '',
  `secret_question` varchar(255) NOT NULL DEFAULT '',
  `secret_answer` varchar(64) NOT NULL DEFAULT '',
  `id_theme` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `is_activated` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `validation_code` varchar(10) NOT NULL DEFAULT '',
  `id_msg_last_visit` int(10) unsigned NOT NULL DEFAULT '0',
  `additional_groups` varchar(255) NOT NULL DEFAULT '',
  `smiley_set` varchar(48) NOT NULL DEFAULT '',
  `id_post_group` smallint(5) unsigned NOT NULL DEFAULT '0',
  `total_time_logged_in` int(10) unsigned NOT NULL DEFAULT '0',
  `password_salt` varchar(255) NOT NULL DEFAULT '',
  `ignore_boards` text NOT NULL,
  `warning` tinyint(4) NOT NULL DEFAULT '0',
  `passwd_flood` varchar(12) NOT NULL DEFAULT '',
  `pm_receive_from` tinyint(4) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_member`),
  KEY `member_name` (`member_name`),
  KEY `real_name` (`real_name`),
  KEY `date_registered` (`date_registered`),
  KEY `id_group` (`id_group`),
  KEY `birthdate` (`birthdate`),
  KEY `posts` (`posts`),
  KEY `last_login` (`last_login`),
  KEY `lngfile` (`lngfile`(30)),
  KEY `id_post_group` (`id_post_group`),
  KEY `warning` (`warning`),
  KEY `total_time_logged_in` (`total_time_logged_in`),
  KEY `id_theme` (`id_theme`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `smf_members`
--

INSERT INTO `smf_members` (`id_member`, `member_name`, `date_registered`, `posts`, `id_group`, `lngfile`, `last_login`, `real_name`, `instant_messages`, `unread_messages`, `new_pm`, `buddy_list`, `pm_ignore_list`, `pm_prefs`, `mod_prefs`, `message_labels`, `passwd`, `openid_uri`, `email_address`, `personal_text`, `gender`, `birthdate`, `website_title`, `website_url`, `location`, `icq`, `aim`, `yim`, `msn`, `hide_email`, `show_online`, `time_format`, `signature`, `time_offset`, `avatar`, `pm_email_notify`, `karma_bad`, `karma_good`, `usertitle`, `notify_announcements`, `notify_regularity`, `notify_send_body`, `notify_types`, `member_ip`, `member_ip2`, `secret_question`, `secret_answer`, `id_theme`, `is_activated`, `validation_code`, `id_msg_last_visit`, `additional_groups`, `smiley_set`, `id_post_group`, `total_time_logged_in`, `password_salt`, `ignore_boards`, `warning`, `passwd_flood`, `pm_receive_from`) VALUES
(1, 'nolvorite', 1397435745, 0, 1, '', 1397437794, 'nolvorite', 0, 0, 0, '', '', 0, '', '', '30db3d3599dec5125b21c46e4bb93589fbf5804f', '', 'hns_marcon@hotmail.com', '', 0, '0001-01-01', '', '', '', '', '', '', '', 0, 1, '', '', 0, '', 0, 0, 0, '', 1, 1, 0, 2, '', '', '', '', 0, 1, '', 1, '', '', 0, 302, '7a63', '', 0, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `smf_message_icons`
--

CREATE TABLE IF NOT EXISTS `smf_message_icons` (
  `id_icon` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(80) NOT NULL DEFAULT '',
  `filename` varchar(80) NOT NULL DEFAULT '',
  `id_board` smallint(5) unsigned NOT NULL DEFAULT '0',
  `icon_order` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_icon`),
  KEY `id_board` (`id_board`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `smf_message_icons`
--

INSERT INTO `smf_message_icons` (`id_icon`, `title`, `filename`, `id_board`, `icon_order`) VALUES
(1, 'Standard', 'xx', 0, 0),
(2, 'Thumb Up', 'thumbup', 0, 1),
(3, 'Thumb Down', 'thumbdown', 0, 2),
(4, 'Exclamation point', 'exclamation', 0, 3),
(5, 'Question mark', 'question', 0, 4),
(6, 'Lamp', 'lamp', 0, 5),
(7, 'Smiley', 'smiley', 0, 6),
(8, 'Angry', 'angry', 0, 7),
(9, 'Cheesy', 'cheesy', 0, 8),
(10, 'Grin', 'grin', 0, 9),
(11, 'Sad', 'sad', 0, 10),
(12, 'Wink', 'wink', 0, 11);

-- --------------------------------------------------------

--
-- Table structure for table `smf_messages`
--

CREATE TABLE IF NOT EXISTS `smf_messages` (
  `id_msg` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_topic` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_board` smallint(5) unsigned NOT NULL DEFAULT '0',
  `poster_time` int(10) unsigned NOT NULL DEFAULT '0',
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_msg_modified` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `poster_name` varchar(255) NOT NULL DEFAULT '',
  `poster_email` varchar(255) NOT NULL DEFAULT '',
  `poster_ip` varchar(255) NOT NULL DEFAULT '',
  `smileys_enabled` tinyint(4) NOT NULL DEFAULT '1',
  `modified_time` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_name` varchar(255) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `icon` varchar(16) NOT NULL DEFAULT 'xx',
  `approved` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_msg`),
  UNIQUE KEY `topic` (`id_topic`,`id_msg`),
  UNIQUE KEY `id_board` (`id_board`,`id_msg`),
  UNIQUE KEY `id_member` (`id_member`,`id_msg`),
  KEY `approved` (`approved`),
  KEY `ip_index` (`poster_ip`(15),`id_topic`),
  KEY `participation` (`id_member`,`id_topic`),
  KEY `show_posts` (`id_member`,`id_board`),
  KEY `id_topic` (`id_topic`),
  KEY `id_member_msg` (`id_member`,`approved`,`id_msg`),
  KEY `current_topic` (`id_topic`,`id_msg`,`id_member`,`approved`),
  KEY `related_ip` (`id_member`,`poster_ip`,`id_msg`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `smf_messages`
--

INSERT INTO `smf_messages` (`id_msg`, `id_topic`, `id_board`, `poster_time`, `id_member`, `id_msg_modified`, `subject`, `poster_name`, `poster_email`, `poster_ip`, `smileys_enabled`, `modified_time`, `modified_name`, `body`, `icon`, `approved`) VALUES
(1, 1, 1, 1397435708, 0, 1, 'Welcome to SMF!', 'Simple Machines', 'info@simplemachines.org', '127.0.0.1', 1, 0, '', 'Welcome to Simple Machines Forum!<br /><br />We hope you enjoy using your forum.&nbsp; If you have any problems, please feel free to [url=http://www.simplemachines.org/community/index.php]ask us for assistance[/url].<br /><br />Thanks!<br />Simple Machines', 'xx', 1);

-- --------------------------------------------------------

--
-- Table structure for table `smf_moderators`
--

CREATE TABLE IF NOT EXISTS `smf_moderators` (
  `id_board` smallint(5) unsigned NOT NULL DEFAULT '0',
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_board`,`id_member`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `smf_openid_assoc`
--

CREATE TABLE IF NOT EXISTS `smf_openid_assoc` (
  `server_url` text NOT NULL,
  `handle` varchar(255) NOT NULL DEFAULT '',
  `secret` text NOT NULL,
  `issued` int(10) NOT NULL DEFAULT '0',
  `expires` int(10) NOT NULL DEFAULT '0',
  `assoc_type` varchar(64) NOT NULL,
  PRIMARY KEY (`server_url`(125),`handle`(125)),
  KEY `expires` (`expires`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `smf_package_servers`
--

CREATE TABLE IF NOT EXISTS `smf_package_servers` (
  `id_server` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_server`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `smf_package_servers`
--

INSERT INTO `smf_package_servers` (`id_server`, `name`, `url`) VALUES
(1, 'Simple Machines Third-party Mod Site', 'http://custom.simplemachines.org/packages/mods');

-- --------------------------------------------------------

--
-- Table structure for table `smf_permission_profiles`
--

CREATE TABLE IF NOT EXISTS `smf_permission_profiles` (
  `id_profile` smallint(5) NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_profile`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `smf_permission_profiles`
--

INSERT INTO `smf_permission_profiles` (`id_profile`, `profile_name`) VALUES
(1, 'default'),
(2, 'no_polls'),
(3, 'reply_only'),
(4, 'read_only');

-- --------------------------------------------------------

--
-- Table structure for table `smf_permissions`
--

CREATE TABLE IF NOT EXISTS `smf_permissions` (
  `id_group` smallint(5) NOT NULL DEFAULT '0',
  `permission` varchar(30) NOT NULL DEFAULT '',
  `add_deny` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_group`,`permission`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `smf_permissions`
--

INSERT INTO `smf_permissions` (`id_group`, `permission`, `add_deny`) VALUES
(-1, 'search_posts', 1),
(-1, 'calendar_view', 1),
(-1, 'view_stats', 1),
(-1, 'profile_view_any', 1),
(0, 'view_mlist', 1),
(0, 'search_posts', 1),
(0, 'profile_view_own', 1),
(0, 'profile_view_any', 1),
(0, 'pm_read', 1),
(0, 'pm_send', 1),
(0, 'calendar_view', 1),
(0, 'view_stats', 1),
(0, 'who_view', 1),
(0, 'profile_identity_own', 1),
(0, 'profile_extra_own', 1),
(0, 'profile_remove_own', 1),
(0, 'profile_server_avatar', 1),
(0, 'profile_upload_avatar', 1),
(0, 'profile_remote_avatar', 1),
(0, 'karma_edit', 1),
(2, 'view_mlist', 1),
(2, 'search_posts', 1),
(2, 'profile_view_own', 1),
(2, 'profile_view_any', 1),
(2, 'pm_read', 1),
(2, 'pm_send', 1),
(2, 'calendar_view', 1),
(2, 'view_stats', 1),
(2, 'who_view', 1),
(2, 'profile_identity_own', 1),
(2, 'profile_extra_own', 1),
(2, 'profile_remove_own', 1),
(2, 'profile_server_avatar', 1),
(2, 'profile_upload_avatar', 1),
(2, 'profile_remote_avatar', 1),
(2, 'profile_title_own', 1),
(2, 'calendar_post', 1),
(2, 'calendar_edit_any', 1),
(2, 'karma_edit', 1),
(2, 'access_mod_center', 1);

-- --------------------------------------------------------

--
-- Table structure for table `smf_personal_messages`
--

CREATE TABLE IF NOT EXISTS `smf_personal_messages` (
  `id_pm` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_pm_head` int(10) unsigned NOT NULL DEFAULT '0',
  `id_member_from` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `deleted_by_sender` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `from_name` varchar(255) NOT NULL DEFAULT '',
  `msgtime` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  PRIMARY KEY (`id_pm`),
  KEY `id_member` (`id_member_from`,`deleted_by_sender`),
  KEY `msgtime` (`msgtime`),
  KEY `id_pm_head` (`id_pm_head`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `smf_pm_recipients`
--

CREATE TABLE IF NOT EXISTS `smf_pm_recipients` (
  `id_pm` int(10) unsigned NOT NULL DEFAULT '0',
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `labels` varchar(60) NOT NULL DEFAULT '-1',
  `bcc` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `is_read` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `is_new` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_pm`,`id_member`),
  UNIQUE KEY `id_member` (`id_member`,`deleted`,`id_pm`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `smf_pm_rules`
--

CREATE TABLE IF NOT EXISTS `smf_pm_rules` (
  `id_rule` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_member` int(10) unsigned NOT NULL DEFAULT '0',
  `rule_name` varchar(60) NOT NULL,
  `criteria` text NOT NULL,
  `actions` text NOT NULL,
  `delete_pm` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `is_or` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_rule`),
  KEY `id_member` (`id_member`),
  KEY `delete_pm` (`delete_pm`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `smf_poll_choices`
--

CREATE TABLE IF NOT EXISTS `smf_poll_choices` (
  `id_poll` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_choice` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `label` varchar(255) NOT NULL DEFAULT '',
  `votes` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_poll`,`id_choice`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `smf_polls`
--

CREATE TABLE IF NOT EXISTS `smf_polls` (
  `id_poll` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL DEFAULT '',
  `voting_locked` tinyint(1) NOT NULL DEFAULT '0',
  `max_votes` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0',
  `hide_results` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `change_vote` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `guest_vote` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `num_guest_voters` int(10) unsigned NOT NULL DEFAULT '0',
  `reset_poll` int(10) unsigned NOT NULL DEFAULT '0',
  `id_member` mediumint(8) NOT NULL DEFAULT '0',
  `poster_name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_poll`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `smf_scheduled_tasks`
--

CREATE TABLE IF NOT EXISTS `smf_scheduled_tasks` (
  `id_task` smallint(5) NOT NULL AUTO_INCREMENT,
  `next_time` int(10) NOT NULL DEFAULT '0',
  `time_offset` int(10) NOT NULL DEFAULT '0',
  `time_regularity` smallint(5) NOT NULL DEFAULT '0',
  `time_unit` varchar(1) NOT NULL DEFAULT 'h',
  `disabled` tinyint(3) NOT NULL DEFAULT '0',
  `task` varchar(24) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_task`),
  UNIQUE KEY `task` (`task`),
  KEY `next_time` (`next_time`),
  KEY `disabled` (`disabled`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `smf_scheduled_tasks`
--

INSERT INTO `smf_scheduled_tasks` (`id_task`, `next_time`, `time_offset`, `time_regularity`, `time_unit`, `disabled`, `task`) VALUES
(1, 1397440800, 0, 2, 'h', 0, 'approval_notification'),
(2, 1398038400, 0, 7, 'd', 0, 'auto_optimize'),
(3, 1397520060, 60, 1, 'd', 0, 'daily_maintenance'),
(5, 1397520000, 0, 1, 'd', 0, 'daily_digest'),
(6, 1398038400, 0, 1, 'w', 0, 'weekly_digest'),
(7, 0, 118144, 1, 'd', 0, 'fetchSMfiles'),
(8, 0, 0, 1, 'd', 1, 'birthdayemails'),
(9, 0, 0, 1, 'w', 0, 'weekly_maintenance'),
(10, 0, 120, 1, 'd', 1, 'paid_subscriptions');

-- --------------------------------------------------------

--
-- Table structure for table `smf_sessions`
--

CREATE TABLE IF NOT EXISTS `smf_sessions` (
  `session_id` char(32) NOT NULL,
  `last_update` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `smf_sessions`
--

INSERT INTO `smf_sessions` (`session_id`, `last_update`, `data`) VALUES
('2abujhm5sufqs4uigli8taufg6', 1397437794, 'USER_AGENT|s:102:"Mozilla/5.0 (Windows NT 6.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.116 Safari/537.36";admin_time|i:1397435745;session_value|s:32:"9fe5140995bb1a2f3b3227df2b6b60a3";session_var|s:12:"b280093fc32f";id_msg_last_visit|s:1:"1";mc|a:7:{s:4:"time";i:1397435758;s:2:"id";s:1:"1";s:2:"gq";s:3:"1=1";s:2:"bq";s:3:"1=1";s:2:"ap";a:1:{i:0;i:0;}s:2:"mb";a:0:{}s:2:"mq";s:3:"0=1";}rc|a:3:{s:2:"id";s:1:"1";s:4:"time";i:1397435758;s:7:"reports";s:1:"0";}log_time|i:1397437794;timeOnlineUpdated|i:1397437794;unread_messages|i:0;old_url|s:34:"http://localhost/smftest/index.php";');

-- --------------------------------------------------------

--
-- Table structure for table `smf_settings`
--

CREATE TABLE IF NOT EXISTS `smf_settings` (
  `variable` varchar(255) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`variable`(30))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `smf_settings`
--

INSERT INTO `smf_settings` (`variable`, `value`) VALUES
('smfVersion', '2.0.7'),
('news', 'SMF - Just Installed!'),
('compactTopicPagesContiguous', '5'),
('compactTopicPagesEnable', '1'),
('enableStickyTopics', '1'),
('todayMod', '1'),
('karmaMode', '0'),
('karmaTimeRestrictAdmins', '1'),
('enablePreviousNext', '1'),
('pollMode', '1'),
('enableVBStyleLogin', '1'),
('enableCompressedOutput', '1'),
('karmaWaitTime', '1'),
('karmaMinPosts', '0'),
('karmaLabel', 'Karma:'),
('karmaSmiteLabel', '[smite]'),
('karmaApplaudLabel', '[applaud]'),
('attachmentSizeLimit', '128'),
('attachmentPostLimit', '192'),
('attachmentNumPerPostLimit', '4'),
('attachmentDirSizeLimit', '10240'),
('attachmentUploadDir', 'C:\\wamp\\www\\smftest/attachments'),
('attachmentExtensions', 'doc,gif,jpg,mpg,pdf,png,txt,zip'),
('attachmentCheckExtensions', '0'),
('attachmentShowImages', '1'),
('attachmentEnable', '1'),
('attachmentEncryptFilenames', '1'),
('attachmentThumbnails', '1'),
('attachmentThumbWidth', '150'),
('attachmentThumbHeight', '150'),
('censorIgnoreCase', '1'),
('mostOnline', '1'),
('mostOnlineToday', '1'),
('mostDate', '1397437794'),
('allow_disableAnnounce', '1'),
('trackStats', '1'),
('userLanguage', '1'),
('titlesEnable', '1'),
('topicSummaryPosts', '15'),
('enableErrorLogging', '1'),
('max_image_width', '0'),
('max_image_height', '0'),
('onlineEnable', '0'),
('cal_enabled', '0'),
('cal_maxyear', '2020'),
('cal_minyear', '2008'),
('cal_daysaslink', '0'),
('cal_defaultboard', ''),
('cal_showholidays', '1'),
('cal_showbdays', '1'),
('cal_showevents', '1'),
('cal_showweeknum', '0'),
('cal_maxspan', '7'),
('smtp_host', ''),
('smtp_port', '25'),
('smtp_username', ''),
('smtp_password', ''),
('mail_type', '0'),
('timeLoadPageEnable', '0'),
('totalMembers', '1'),
('totalTopics', '1'),
('totalMessages', '1'),
('simpleSearch', '0'),
('censor_vulgar', ''),
('censor_proper', ''),
('enablePostHTML', '0'),
('theme_allow', '1'),
('theme_default', '1'),
('theme_guests', '1'),
('enableEmbeddedFlash', '0'),
('xmlnews_enable', '1'),
('xmlnews_maxlen', '255'),
('hotTopicPosts', '15'),
('hotTopicVeryPosts', '25'),
('registration_method', '0'),
('send_validation_onChange', '0'),
('send_welcomeEmail', '1'),
('allow_editDisplayName', '1'),
('allow_hideOnline', '1'),
('guest_hideContacts', '1'),
('spamWaitTime', '5'),
('pm_spam_settings', '10,5,20'),
('reserveWord', '0'),
('reserveCase', '1'),
('reserveUser', '1'),
('reserveName', '1'),
('reserveNames', 'Admin\nWebmaster\nGuest\nroot'),
('autoLinkUrls', '1'),
('banLastUpdated', '0'),
('smileys_dir', 'C:\\wamp\\www\\smftest/Smileys'),
('smileys_url', 'http://localhost/smftest/Smileys'),
('avatar_directory', 'C:\\wamp\\www\\smftest/avatars'),
('avatar_url', 'http://localhost/smftest/avatars'),
('avatar_max_height_external', '65'),
('avatar_max_width_external', '65'),
('avatar_action_too_large', 'option_html_resize'),
('avatar_max_height_upload', '65'),
('avatar_max_width_upload', '65'),
('avatar_resize_upload', '1'),
('avatar_download_png', '1'),
('failed_login_threshold', '3'),
('oldTopicDays', '120'),
('edit_wait_time', '90'),
('edit_disable_time', '0'),
('autoFixDatabase', '1'),
('allow_guestAccess', '1'),
('time_format', '%B %d, %Y, %I:%M:%S %p'),
('number_format', '1234.00'),
('enableBBC', '1'),
('max_messageLength', '20000'),
('signature_settings', '1,300,0,0,0,0,0,0:'),
('autoOptMaxOnline', '0'),
('defaultMaxMessages', '15'),
('defaultMaxTopics', '20'),
('defaultMaxMembers', '30'),
('enableParticipation', '1'),
('recycle_enable', '0'),
('recycle_board', '0'),
('maxMsgID', '1'),
('enableAllMessages', '0'),
('fixLongWords', '0'),
('knownThemes', '1,2,3'),
('who_enabled', '1'),
('time_offset', '0'),
('cookieTime', '60'),
('lastActive', '15'),
('smiley_sets_known', 'default,aaron,akyhne'),
('smiley_sets_names', 'Alienine''s Set\nAaron''s Set\nAkyhne''s Set'),
('smiley_sets_default', 'default'),
('cal_days_for_index', '7'),
('requireAgreement', '1'),
('unapprovedMembers', '0'),
('default_personal_text', ''),
('package_make_backups', '1'),
('databaseSession_enable', '1'),
('databaseSession_loose', '1'),
('databaseSession_lifetime', '2880'),
('search_cache_size', '50'),
('search_results_per_page', '30'),
('search_weight_frequency', '30'),
('search_weight_age', '25'),
('search_weight_length', '20'),
('search_weight_subject', '15'),
('search_weight_first_message', '10'),
('search_max_results', '1200'),
('search_floodcontrol_time', '5'),
('permission_enable_deny', '0'),
('permission_enable_postgroups', '0'),
('mail_next_send', '0'),
('mail_recent', '0000000000|0'),
('settings_updated', '0'),
('next_task_time', '0'),
('warning_settings', '1,20,0'),
('warning_watch', '10'),
('warning_moderate', '35'),
('warning_mute', '60'),
('admin_features', ''),
('last_mod_report_action', '0'),
('pruningOptions', '30,180,180,180,30,0'),
('cache_enable', '1'),
('reg_verification', '1'),
('visual_verification_type', '3'),
('enable_buddylist', '1'),
('birthday_email', 'happy_birthday'),
('dont_repeat_theme_core', '1'),
('dont_repeat_smileys_20', '1'),
('dont_repeat_buddylists', '1'),
('attachment_image_reencode', '1'),
('attachment_image_paranoid', '0'),
('attachment_thumb_png', '1'),
('avatar_reencode', '1'),
('avatar_paranoid', '0'),
('global_character_set', 'UTF-8'),
('globalCookies', '1'),
('default_timezone', 'Etc/GMT0'),
('memberlist_updated', '1397435745'),
('latestMember', '1'),
('latestRealName', 'nolvorite'),
('rand_seed', '1903105548'),
('mostOnlineUpdated', '2014-04-14');

-- --------------------------------------------------------

--
-- Table structure for table `smf_smileys`
--

CREATE TABLE IF NOT EXISTS `smf_smileys` (
  `id_smiley` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL DEFAULT '',
  `filename` varchar(48) NOT NULL DEFAULT '',
  `description` varchar(80) NOT NULL DEFAULT '',
  `smiley_row` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `smiley_order` smallint(5) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_smiley`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `smf_smileys`
--

INSERT INTO `smf_smileys` (`id_smiley`, `code`, `filename`, `description`, `smiley_row`, `smiley_order`, `hidden`) VALUES
(1, ':)', 'smiley.gif', 'Smiley', 0, 0, 0),
(2, ';)', 'wink.gif', 'Wink', 0, 1, 0),
(3, ':D', 'cheesy.gif', 'Cheesy', 0, 2, 0),
(4, ';D', 'grin.gif', 'Grin', 0, 3, 0),
(5, '>:(', 'angry.gif', 'Angry', 0, 4, 0),
(6, ':(', 'sad.gif', 'Sad', 0, 5, 0),
(7, ':o', 'shocked.gif', 'Shocked', 0, 6, 0),
(8, '8)', 'cool.gif', 'Cool', 0, 7, 0),
(9, '???', 'huh.gif', 'Huh?', 0, 8, 0),
(10, '::)', 'rolleyes.gif', 'Roll Eyes', 0, 9, 0),
(11, ':P', 'tongue.gif', 'Tongue', 0, 10, 0),
(12, ':-[', 'embarrassed.gif', 'Embarrassed', 0, 11, 0),
(13, ':-X', 'lipsrsealed.gif', 'Lips Sealed', 0, 12, 0),
(14, ':-\\', 'undecided.gif', 'Undecided', 0, 13, 0),
(15, ':-*', 'kiss.gif', 'Kiss', 0, 14, 0),
(16, ':''(', 'cry.gif', 'Cry', 0, 15, 0),
(17, '>:D', 'evil.gif', 'Evil', 0, 16, 1),
(18, '^-^', 'azn.gif', 'Azn', 0, 17, 1),
(19, 'O0', 'afro.gif', 'Afro', 0, 18, 1),
(20, ':))', 'laugh.gif', 'Laugh', 0, 19, 1),
(21, 'C:-)', 'police.gif', 'Police', 0, 20, 1),
(22, 'O:-)', 'angel.gif', 'Angel', 0, 21, 1);

-- --------------------------------------------------------

--
-- Table structure for table `smf_spiders`
--

CREATE TABLE IF NOT EXISTS `smf_spiders` (
  `id_spider` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `spider_name` varchar(255) NOT NULL DEFAULT '',
  `user_agent` varchar(255) NOT NULL DEFAULT '',
  `ip_info` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_spider`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `smf_spiders`
--

INSERT INTO `smf_spiders` (`id_spider`, `spider_name`, `user_agent`, `ip_info`) VALUES
(1, 'Google', 'googlebot', ''),
(2, 'Yahoo!', 'slurp', ''),
(3, 'MSN', 'msnbot', ''),
(4, 'Google (Mobile)', 'Googlebot-Mobile', ''),
(5, 'Google (Image)', 'Googlebot-Image', ''),
(6, 'Google (AdSense)', 'Mediapartners-Google', ''),
(7, 'Google (Adwords)', 'AdsBot-Google', ''),
(8, 'Yahoo! (Mobile)', 'YahooSeeker/M1A1-R2D2', ''),
(9, 'Yahoo! (Image)', 'Yahoo-MMCrawler', ''),
(10, 'MSN (Mobile)', 'MSNBOT_Mobile', ''),
(11, 'MSN (Media)', 'msnbot-media', ''),
(12, 'Cuil', 'twiceler', ''),
(13, 'Ask', 'Teoma', ''),
(14, 'Baidu', 'Baiduspider', ''),
(15, 'Gigablast', 'Gigabot', ''),
(16, 'InternetArchive', 'ia_archiver-web.archive.org', ''),
(17, 'Alexa', 'ia_archiver', ''),
(18, 'Omgili', 'omgilibot', ''),
(19, 'EntireWeb', 'Speedy Spider', '');

-- --------------------------------------------------------

--
-- Table structure for table `smf_subscriptions`
--

CREATE TABLE IF NOT EXISTS `smf_subscriptions` (
  `id_subscribe` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `cost` text NOT NULL,
  `length` varchar(6) NOT NULL DEFAULT '',
  `id_group` smallint(5) NOT NULL DEFAULT '0',
  `add_groups` varchar(40) NOT NULL DEFAULT '',
  `active` tinyint(3) NOT NULL DEFAULT '1',
  `repeatable` tinyint(3) NOT NULL DEFAULT '0',
  `allow_partial` tinyint(3) NOT NULL DEFAULT '0',
  `reminder` tinyint(3) NOT NULL DEFAULT '0',
  `email_complete` text NOT NULL,
  PRIMARY KEY (`id_subscribe`),
  KEY `active` (`active`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `smf_themes`
--

CREATE TABLE IF NOT EXISTS `smf_themes` (
  `id_member` mediumint(8) NOT NULL DEFAULT '0',
  `id_theme` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `variable` varchar(255) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id_theme`,`id_member`,`variable`(30)),
  KEY `id_member` (`id_member`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `smf_themes`
--

INSERT INTO `smf_themes` (`id_member`, `id_theme`, `variable`, `value`) VALUES
(0, 1, 'name', 'SMF Default Theme - Curve'),
(0, 1, 'theme_url', 'http://localhost/smftest/Themes/default'),
(0, 1, 'images_url', 'http://localhost/smftest/Themes/default/images'),
(0, 1, 'theme_dir', 'C:\\wamp\\www\\smftest/Themes/default'),
(0, 1, 'show_bbc', '1'),
(0, 1, 'show_latest_member', '1'),
(0, 1, 'show_modify', '1'),
(0, 1, 'show_user_images', '1'),
(0, 1, 'show_blurb', '1'),
(0, 1, 'show_gender', '0'),
(0, 1, 'show_newsfader', '0'),
(0, 1, 'number_recent_posts', '0'),
(0, 1, 'show_member_bar', '1'),
(0, 1, 'linktree_link', '1'),
(0, 1, 'show_profile_buttons', '1'),
(0, 1, 'show_mark_read', '1'),
(0, 1, 'show_stats_index', '1'),
(0, 1, 'linktree_inline', '0'),
(0, 1, 'show_board_desc', '1'),
(0, 1, 'newsfader_time', '5000'),
(0, 1, 'allow_no_censored', '0'),
(0, 1, 'additional_options_collapsable', '1'),
(0, 1, 'use_image_buttons', '1'),
(0, 1, 'enable_news', '1'),
(0, 1, 'forum_width', '90%'),
(0, 2, 'name', 'Core Theme'),
(0, 2, 'theme_url', 'http://localhost/smftest/Themes/core'),
(0, 2, 'images_url', 'http://localhost/smftest/Themes/core/images'),
(0, 2, 'theme_dir', 'C:\\wamp\\www\\smftest/Themes/core'),
(-1, 1, 'display_quick_reply', '1'),
(-1, 1, 'posts_apply_ignore_list', '1');

-- --------------------------------------------------------

--
-- Table structure for table `smf_topics`
--

CREATE TABLE IF NOT EXISTS `smf_topics` (
  `id_topic` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `is_sticky` tinyint(4) NOT NULL DEFAULT '0',
  `id_board` smallint(5) unsigned NOT NULL DEFAULT '0',
  `id_first_msg` int(10) unsigned NOT NULL DEFAULT '0',
  `id_last_msg` int(10) unsigned NOT NULL DEFAULT '0',
  `id_member_started` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_member_updated` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_poll` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_previous_board` smallint(5) NOT NULL DEFAULT '0',
  `id_previous_topic` mediumint(8) NOT NULL DEFAULT '0',
  `num_replies` int(10) unsigned NOT NULL DEFAULT '0',
  `num_views` int(10) unsigned NOT NULL DEFAULT '0',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `unapproved_posts` smallint(5) NOT NULL DEFAULT '0',
  `approved` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_topic`),
  UNIQUE KEY `last_message` (`id_last_msg`,`id_board`),
  UNIQUE KEY `first_message` (`id_first_msg`,`id_board`),
  UNIQUE KEY `poll` (`id_poll`,`id_topic`),
  KEY `is_sticky` (`is_sticky`),
  KEY `approved` (`approved`),
  KEY `id_board` (`id_board`),
  KEY `member_started` (`id_member_started`,`id_board`),
  KEY `last_message_sticky` (`id_board`,`is_sticky`,`id_last_msg`),
  KEY `board_news` (`id_board`,`id_first_msg`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `smf_topics`
--

INSERT INTO `smf_topics` (`id_topic`, `is_sticky`, `id_board`, `id_first_msg`, `id_last_msg`, `id_member_started`, `id_member_updated`, `id_poll`, `id_previous_board`, `id_previous_topic`, `num_replies`, `num_views`, `locked`, `unapproved_posts`, `approved`) VALUES
(1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
