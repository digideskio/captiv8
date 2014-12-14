-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 12, 2014 at 07:48 PM
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
-- Table structure for table `polls`
--

CREATE TABLE IF NOT EXISTS `polls` (
  `post_id_root` int(11) NOT NULL,
  `value` varchar(100) NOT NULL,
  `data_id` int(11) NOT NULL AUTO_INCREMENT,
  `define_set` varchar(20) NOT NULL,
  PRIMARY KEY (`data_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=79 ;

--
-- Dumping data for table `polls`
--

INSERT INTO `polls` (`post_id_root`, `value`, `data_id`, `define_set`) VALUES
(84, 'To be or not to be...', 59, 'question'),
(84, 'true', 60, 'choice_selection'),
(84, 'false', 61, 'choice_addition'),
(84, 'Or is it?', 62, 'poll_choice'),
(84, 'Is the question.', 63, 'poll_choice'),
(85, 'To be or not to be...', 64, 'question'),
(85, 'true', 65, 'choice_selection'),
(85, 'false', 66, 'choice_addition'),
(85, '...Or is it?', 67, 'poll_choice'),
(85, 'Is the question.', 68, 'poll_choice'),
(88, 'To be or not to be...', 69, 'question'),
(88, 'true', 70, 'choice_selection'),
(88, 'false', 71, 'choice_addition'),
(88, '...Or is it?', 72, 'poll_choice'),
(88, 'Is the question.', 73, 'poll_choice'),
(89, 'Test poll question', 74, 'question'),
(89, 'true', 75, 'choice_selection'),
(89, 'true', 76, 'choice_addition'),
(89, '3 and 4', 77, 'poll_choice'),
(89, '1 and 2', 78, 'poll_choice');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `content` varchar(15000) DEFAULT NULL,
  `cnttype` int(11) NOT NULL,
  `msgtype` char(20) DEFAULT NULL,
  `forwhom` text NOT NULL,
  `parent` int(11) NOT NULL,
  `postid` int(11) NOT NULL AUTO_INCREMENT,
  `stamptime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bywhom` text NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `thread_nick` varchar(50) DEFAULT NULL,
  `topic_hash` varchar(10) DEFAULT NULL,
  `settings` int(11) NOT NULL DEFAULT '1',
  `thread_id` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `upvotes` int(11) NOT NULL DEFAULT '1',
  `downvotes` int(11) NOT NULL DEFAULT '0',
  `post_type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`postid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=91 ;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`content`, `cnttype`, `msgtype`, `forwhom`, `parent`, `postid`, `stamptime`, `bywhom`, `title`, `thread_nick`, `topic_hash`, `settings`, `thread_id`, `level`, `upvotes`, `downvotes`, `post_type`) VALUES
('...Even explain it in detail, if you like!', 1, NULL, 'self', 0, 5, '2014-11-24 00:58:31', 'nolvorite', 'Thoughts you might have right now, post it here!', 'Thoughts_you_might_have_right_now__post_it_here_', '276e6b7e1e', 1, NULL, NULL, 1, 0, 0),
('...Even explain it in detail, if you like!', 1, NULL, 'self', 0, 6, '2014-11-24 03:06:39', 'nolvorite', 'Thoughts you might have right now, post it here!', 'Thoughts_you_might_have_right_now__post_it_here_', 'b5a74135ed', 1, NULL, NULL, 1, 0, 0),
('...Even explain it in detail, if you like!', 1, NULL, 'self', 0, 7, '2014-11-24 03:08:43', 'nolvorite', 'Thoughts you might have right now, post it here!', 'Thoughts_you_might_have_right_now__post_it_here_', 'bf67b81029', 1, NULL, NULL, 1, 0, 0),
('...Even explain it in detail, if you like!', 1, NULL, 'self', 0, 8, '2014-11-24 03:09:40', 'nolvorite', 'Thoughts you might have right now, post it here!', 'Thoughts_you_might_have_right_now__post_it_here_', '8edaae084a', 1, NULL, NULL, 1, 0, 0),
('...Even explain it in detail, if you like!', 1, NULL, 'self', 0, 9, '2014-11-24 03:11:58', 'nolvorite', 'Thoughts you might have right now, post it here!', 'Thoughts_you_might_have_right_now__post_it_here_', 'f3cf520162', 1, NULL, NULL, 1, 0, 0),
('...Even explain it in detail, if you like!', 1, NULL, 'self', 0, 10, '2014-11-24 03:24:44', 'nolvorite', 'Thoughts you might have right now, post it here!', 'Thoughts_you_might_have_right_now__post_it_here_', '7aa3b7e43d', 1, NULL, NULL, 1, 0, 0),
('...Checkmate, Kierkegaard!', 1, NULL, 'self', 0, 11, '2014-11-24 05:33:06', 'nolvorite', 'Morality don''t real without STEM', 'Morality_don__t_real_without_STEM', '0eeef9e370', 1, NULL, NULL, 1, 0, 0),
('something for breakfast', 1, NULL, 'self', 0, 12, '2014-11-24 05:35:35', 'nolvorite', 'I ate', 'I_ate', 'd8b7e25aab', 1, NULL, NULL, 1, 0, 0),
('''; SELECT FROM', 1, NULL, 'self', 0, 13, '2014-11-24 05:39:57', 'nolvorite', 'Hmm....', 'Hmm____', '52335748c5', 1, NULL, NULL, 1, 0, 0),
('Nope', 1, NULL, 'self', 0, 14, '2014-11-24 05:42:18', 'nolvorite', 'I...asda', 'I___asda', '827dfd66eb', 1, NULL, NULL, 1, 0, 0),
('nope', 1, NULL, 'self', 0, 15, '2014-11-24 05:42:30', 'nolvorite', 'I....', 'I____', '9e340cf9a9', 1, NULL, NULL, 1, 0, 0),
('Last spam!', 1, NULL, 'self', 0, 16, '2014-11-24 05:43:13', 'nolvorite', 'Last spam', 'Last_spam', 'f7e4ec6ec5', 1, NULL, NULL, 1, 0, 0),
('Hmm...', 1, NULL, 'self', 0, 17, '2014-11-25 01:32:44', 'nolvorite', 'Hmm', 'Hmm', '52aa06291f', 1, NULL, NULL, 1, 0, 0),
('...Even explain it in detail, if you like!', 1, NULL, 'self', 0, 18, '2014-11-25 01:33:55', 'nolvorite', 'Thoughts you might have right now, post it here!', 'Thoughts_you_might_have_right_now__post_it_here_', 'e14c192c90', 1, NULL, NULL, 1, 0, 0),
('And again', 1, NULL, 'self', 0, 19, '2014-11-25 01:48:31', 'nolvorite', 'Test again&gt;', 'Test_again_gt_', 'dd52dd2c10', 1, NULL, NULL, 1, 0, 0),
('this time, test a comment.', 2, NULL, 'n-a', 19, 21, '2014-11-25 01:59:34', 'nolvorite', '', '', '5ee3311f2f', 1, 19, NULL, 1, 0, 0),
('...Even explain it in detail, if you like!', 1, NULL, 'self', 0, 22, '2014-11-27 04:46:32', 'nolvorite', '////xdsd', '____xdsd', '7c42424563', 1, NULL, NULL, 1, 0, 0),
('tttt', 1, NULL, 'self', 0, 23, '2014-11-27 05:10:53', 'nolvorite', 'ttt', 'ttt', '98738252a4', 1, NULL, NULL, 1, 0, 0),
('Reply to this comment... Ergo, comment on this comment.', 2, NULL, 'n-a', 21, 24, '2014-11-27 05:21:53', 'nolvorite', 'Comments', 'Comments', '5db884b51d', 1, 19, NULL, 1, 0, 0),
('Reply to this comment... Ergo, comment on this comment.', 2, NULL, 'n-a', 21, 25, '2014-11-27 14:59:35', 'nolvorite', 'Comments', 'Comments', '9fe4de9981', 1, 19, NULL, 1, 0, 0),
('test', 2, NULL, 'n-a', 21, 26, '2014-11-27 15:13:53', 'nolvorite', 'Comments', 'Comments', 'ec1d24a3f1', 1, NULL, NULL, 1, 0, 0),
('whyyyyyyy', 2, NULL, 'n-a', 21, 27, '2014-11-27 15:52:55', 'nolvorite', 'Comments', 'Comments', 'ef5abae8b2', 1, 19, NULL, 1, 0, 0),
('nooooooooooo try this', 2, NULL, 'n-a', 21, 28, '2014-11-27 15:54:38', 'nolvorite', 'Comments', 'Comments', 'e93bbb26e9', 1, 19, NULL, 1, 0, 0),
('...Even explain it in detail, if you like!', 1, NULL, 'self', 0, 29, '2014-11-27 17:25:44', 'nolvorite', 'asdasda', 'asdasda', 'c25120cea5', 1, NULL, NULL, 1, 0, 0),
('Test', 2, NULL, 'n-a', 28, 30, '2014-11-27 21:52:33', 'nolvorite', 'Comments', 'Comments', '61e12ccd6e', 1, 19, NULL, 1, 0, 0),
('Level 2', 2, NULL, 'n-a', 27, 31, '2014-11-27 21:56:08', 'nolvorite', 'Comments', 'Comments', '40ad952f57', 1, 19, NULL, 1, 0, 0),
('Level 3', 2, NULL, 'n-a', 31, 32, '2014-11-27 21:56:25', 'nolvorite', 'Comments', 'Comments', 'd112d60de6', 1, 19, NULL, 1, 0, 0),
('Testing for comment-generations', 2, NULL, 'n-a', 30, 33, '2014-11-28 19:06:56', 'nolvorite', 'Comments', 'Comments', 'b49694ad68', 1, 19, NULL, 1, 0, 0),
('test', 2, NULL, 'n-a', 19, 34, '2014-11-28 19:45:43', 'nolvorite', '', '', '494a456d05', 1, 19, NULL, 1, 0, 0),
('Reply to this comment... Ergo, comment on this comment.', 2, NULL, 'n-a', 28, 35, '2014-11-28 21:19:01', 'nolvorite', 'Comments', 'Comments', 'acf8ac4cf4', 1, 19, NULL, 1, 0, 0),
('another one', 2, NULL, 'n-a', 33, 36, '2014-11-30 00:51:41', 'nolvorite', 'Comments', 'Comments', '383780840c', 1, 19, NULL, 1, 0, 0),
('last comment generation to boot?', 2, NULL, 'n-a', 36, 37, '2014-11-30 04:50:18', 'nolvorite', 'Comments', 'Comments', '1974971f18', 1, 19, NULL, 1, 0, 0),
('test last comment generation?', 2, NULL, 'n-a', 36, 38, '2014-11-30 04:51:19', 'nolvorite', 'Comments', 'Comments', '0aadae2602', 1, 19, NULL, 1, 0, 0),
('test once and never again', 2, NULL, 'n-a', 36, 39, '2014-11-30 08:33:37', 'nolvorite', 'Comments', 'Comments', '6a334ce691', 1, 19, NULL, 1, 0, 0),
('#2', 2, NULL, 'n-a', 28, 40, '2014-12-01 04:13:42', 'nolvorite', 'Comments', 'Comments', '2480d5875c', 1, 19, NULL, 1, 0, 0),
('oh dear God pleaaaaaaase', 2, NULL, 'n-a', 39, 41, '2014-12-01 07:52:53', 'nolvorite', 'Comments', 'Comments', '482cd668fa', 1, 19, NULL, 1, 0, 0),
('I am actually essentially done with the posting system\r\nMy god there''s just been too much wasted time man', 1, NULL, 'self', 0, 42, '2014-12-01 08:50:53', 'nolvorite', 'Hallelujah', 'Hallelujah', '67b5de8682', 1, NULL, NULL, 1, 0, 0),
('Test for line breaks....', 2, NULL, 'n-a', 42, 43, '2014-12-01 09:02:23', 'nolvorite', '', '', '77ecd433bf', 1, 42, NULL, 1, 0, 0),
('Whoops\r\nNow test for em''', 2, NULL, 'n-a', 42, 44, '2014-12-01 09:02:36', 'nolvorite', '', '', 'c8b644d746', 1, 42, NULL, 1, 0, 0),
('Test\r\nfor\r\nline breaks', 2, NULL, 'n-a', 43, 45, '2014-12-01 09:04:34', 'nolvorite', 'Comments', 'Comments', '778d2a3089', 1, 42, NULL, 1, 0, 0),
('Test now\r\n...? omg', 2, NULL, 'n-a', 45, 46, '2014-12-01 09:06:20', 'nolvorite', 'Comments', 'Comments', 'ada1f15197', 1, 42, NULL, 1, 0, 0),
('Test\r\nline breaks\r\n\r\nnow!', 2, NULL, 'n-a', 42, 47, '2014-12-01 23:35:23', 'nolvorite', '', '', 'ae0e475f7d', 1, 42, NULL, 1, 0, 0),
('Test line breaks\r<br>\r<br>gr\r<br>gr', 2, NULL, 'n-a', 42, 48, '2014-12-01 23:36:48', 'nolvorite', '', '', '503bf27d09', 1, 42, NULL, 1, 0, 0),
('Check for the new safe string comparison...?', 2, NULL, 'n-a', 42, 49, '2014-12-01 23:55:09', 'nolvorite', '', '', '323ac6e5e8', 1, 42, NULL, 1, 0, 0),
('noobs', 1, NULL, 'self', 0, 50, '2014-12-02 08:47:46', 'nolvorite', 'Noobs', 'Noobs', 'da582833ad', 1, NULL, NULL, 1, 0, 0),
('Test!!!!\r<br>Yes', 1, NULL, 'self', 0, 51, '2014-12-02 19:35:08', 'nolvorite', 'Test', 'Test', '4a6d4eacbc', 1, NULL, NULL, 1, 0, 0),
(' ', 1, NULL, 'self', 0, 52, '2014-12-02 20:22:46', 'nolvorite', 'Hmm', 'Hmm', '69775851ce', 1, NULL, NULL, 1, 0, 0),
('...Even explain it in detail, if you like!', 1, NULL, 'self', 0, 53, '2014-12-02 21:39:35', 'nolvorite', 'Thoughts you might have right now, post it here!', 'Thoughts_you_might_have_right_now__post_it_here_', '9299c3b5ef', 1, NULL, NULL, 1, 0, 0),
('...Even explain it in detail, if you like!', 1, NULL, 'self', 0, 54, '2014-12-02 21:47:31', 'nolvorite', 'Testing em'' now', 'Testing_em___now', '8a5723ec91', 1, NULL, NULL, 1, 0, 0),
(' ', 1, NULL, 'self', 0, 55, '2014-12-02 21:48:04', 'nolvorite', 'And again', 'And_again', 'fdf02221ab', 1, NULL, NULL, 1, 0, 0),
('Hmm', 1, NULL, 'self', 0, 56, '2014-12-03 02:25:29', 'nolvorite', 'Hmm', 'Hmm', '09a0f5e1fc', 1, NULL, NULL, 1, 0, 0),
('Now?', 1, NULL, 'self', 0, 57, '2014-12-03 02:42:34', 'nolvorite', 'Try this?', 'Try_this_', '04def5aa86', 1, NULL, NULL, 1, 0, 0),
('hmm hmm hmm', 1, NULL, 'self', 0, 58, '2014-12-03 03:07:15', 'nolvorite', 'Test for timezone adjustment', 'Test_for_timezone_adjustment', '25b8e1f905', 1, NULL, NULL, 1, 0, 0),
('hmm', 1, NULL, 'self', 0, 59, '2014-12-04 01:25:26', 'nolvorite', 'New post btw', 'New_post_btw', '22498c2aff', 1, NULL, NULL, 1, 0, 0),
('repluuuuu', 1, NULL, 'self', 0, 60, '2014-12-04 01:37:30', 'nolvorite', 'test ', 'test_', '120ffce301', 1, NULL, NULL, 1, 0, 0),
('One flips out, and then they both do. (yu-gi-oh joke--ikr)', 1, NULL, 'self', 0, 61, '2014-12-04 01:43:05', 'nolvorite', '(One-liner) [Two Penguin Soldiers meet in a bar.]', '_One-liner___Two_Penguin_Soldiers_meet_in_a_bar__', '1ff77ba424', 1, NULL, NULL, 1, 0, 0),
('Muchacha!', 1, NULL, 'self', 0, 62, '2014-12-05 01:55:01', 'nolvorite', 'Muchacho', 'Muchacho', 'e6c64e50b1', 1, NULL, NULL, 1, 0, 0),
('it''s not a free will question, it''s a destiny question', 1, NULL, 'self', 0, 87, '2014-12-08 01:15:59', 'nolvorite', 'Wait...', 'Wait___', 'dd73afeb21', 1, NULL, NULL, 1, 0, 0),
('Sigh... with a poll. again. soz', 1, NULL, 'self', 0, 88, '2014-12-08 01:22:44', 'nolvorite', 'Test question', 'Test_question', '6845525f04', 1, NULL, NULL, 1, 0, 0),
('I swear right', 1, NULL, 'self', 0, 89, '2014-12-08 01:24:52', 'nolvorite', 'Soz....', 'Soz____', 'a1f4d23957', 1, NULL, NULL, 1, 0, 0),
('Test post', 1, NULL, 'self', 0, 90, '2014-12-12 19:46:39', 'nolvorite', 'Test post', 'Test_post', '19adda3671', 1, NULL, NULL, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sg_permissions`
--

CREATE TABLE IF NOT EXISTS `sg_permissions` (
  `access_type` varchar(30) NOT NULL,
  `towhom` varchar(30) NOT NULL,
  `date_g` date NOT NULL,
  `granted_by` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `sg_settings`
--

INSERT INTO `sg_settings` (`id`, `a1_check`, `a2_check`, `a3_check`, `a4_check`, `a5_check`, `real_id`) VALUES
('user_1', 'all', 'all', 'all', 'self', 'self', 1),
('user_27', 'all', 'all', 'all', 'self', 'self', 2),
('user_31', 'all', 'all', 'all', 'self', 'self', 3),
('user_32', 'all', 'all', 'all', 'self', 'self', 4);

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
  PRIMARY KEY (`userid`),
  UNIQUE KEY `root_admin_status` (`root_admin_status`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `isvalidated`, `email`, `userid`, `joindate`, `fullname`, `admin_notifs`, `root_admin_status`, `month2`, `day2`, `year2`, `salt`, `login_attempts`, `login_att_last`, `last_active_at`, `last_activity`) VALUES
('nolvorite', 'd83ab46b4325d8bcd1102188c38d8a098b23a168', 1, 'hns_marcon@hotmail.com', 1, '2014-11-14 23:52:34', 'Hans Marcon', 'on', '1', 4, 9, 1996, '6c478c525f517a7ab838', '4', '2014-12-02 00:32:47', '2014-12-12 13:46:42', NULL),
('test_user4aaaasd', 'c08c7f680792684058eafc92e8e1e85e07617eff', NULL, 'asdasdas@asda.asdas', 27, '2014-11-13 21:16:30', 'asdas asdas', 'on', NULL, 12, 16, 1994, 'aad763cbecdacccb1f63', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
('test_9', '6e1d3ee1ec90c3617dc4aff58fe39bba75a8b68e', NULL, 'laskdla@alsdkalsd.asdjas', 31, '2014-11-14 23:21:41', 'asdajsdjaks asdjaks', 'on', NULL, 4, 19, 1996, '3aab2407326f6ada6661', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
('asdasdas', 'ef659ade9df94a0bc3e792ec9e2f81095d375a48', NULL, 'hns_marcon@hotmail.coma', 32, '2014-11-13 21:16:30', 'asdasd asd asdas', 'on', NULL, 11, 15, 1999, 'e64ec838d0dba46ea10a', '0', '2014-12-02 00:06:50', '0000-00-00 00:00:00', NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=85 ;

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
('nolvorite', '2014-12-12 13:37:39', 89, 1, 83),
('nolvorite', '2014-12-12 13:46:40', 90, 1, 84);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;