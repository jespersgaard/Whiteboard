-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 06, 2011 at 08:40 PM
-- Server version: 5.1.41
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

-- Database: `white_board`
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

CREATE DATABASE IF NOT EXISTS white_board;
GRANT ALL ON white_board.* TO 'whiteboard'@'localhost' IDENTIFIED BY 'password';
use white_board;
--
--

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE IF NOT EXISTS `events` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `location` int(11) NOT NULL,
  `group` varchar(20) NOT NULL,
  PRIMARY KEY (`event_id`),
  UNIQUE KEY `location` (`location`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `events`
--


-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `groupName` varchar(20) NOT NULL,
  `groupdescription` blob NOT NULL,
  `groupadmin` varchar(20) NOT NULL,
  `shortInfo` varchar(160) DEFAULT NULL,
  PRIMARY KEY (`groupName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`groupName`, `groupdescription`, `groupadmin`, `shortInfo`) VALUES
('Animals', 0x46726f6d2057496b6970656469613a0d0a416e696d616c73206172652061206d616a6f722067726f7570206f66206d756c746963656c6c756c61722c2065756b6172796f746963206f7267616e69736d73206f6620746865206b696e67646f6d20416e696d616c6961206f72204d6574617a6f612e20546865697220626f647920706c616e206576656e7475616c6c79206265636f6d6573206669786564206173207468657920646576656c6f702c20616c74686f75676820736f6d6520756e646572676f20612070726f63657373206f66206d6574616d6f7270686f736973206c61746572206f6e20696e207468656972206c6966652e204d6f737420616e696d616c7320617265206d6f74696c652c206d65616e696e6720746865792063616e206d6f76652073706f6e74616e656f75736c7920616e6420696e646570656e64656e746c792e20416c6c20616e696d616c732061726520616c736f2068657465726f74726f7068732c206d65616e696e672074686579206d75737420696e67657374206f74686572206f7267616e69736d7320666f722073757374656e616e63652e0d0a0d0a4d6f7374206b6e6f776e20616e696d616c207068796c6120617070656172656420696e2074686520666f7373696c207265636f7264206173206d6172696e65207370656369657320647572696e67207468652043616d627269616e206578706c6f73696f6e2c2061626f757420353432206d696c6c696f6e2079656172732061676f2e, 'dog', 'All kinds of critters'),
('bob', 0x536565696e6720776861742068617070656e73207768656e20612067726f757020616e642075736572207368617265207468652073616d65206e616d65, 'Dr.Pepper', 'test'),
('Mammals', 0x46726f6d2057696b6970656469613a0d0a4d616d6d616c732028666f726d616c6c79204d616d6d616c6961202f6d26233630313b26233731323b6d6526233631383b6c692e26233630313b2f2920617265206d656d62657273206f66206120636c617373206f66206169722d627265617468696e67207665727465627261746520616e696d616c7320636861726163746572697a65642062792074686520706f7373657373696f6e206f6620686169722c207468726565206d6964646c652065617220626f6e65732c20616e64206d616d6d61727920676c616e64732066756e6374696f6e616c20696e206d6f7468657273207769746820796f756e672e204d6f7374206d616d6d616c7320616c736f20706f737365737320737765617420676c616e647320616e64207370656369616c697365642074656574682c20616e6420746865206c6172676573742067726f7570206f66206d616d6d616c732c2074686520706c6163656e74616c732c2068617665206120706c6163656e746120776869636820666565647320746865206f6666737072696e6720647572696e6720676573746174696f6e2e20546865206d616d6d616c69616e20627261696e2c207769746820697473206368617261637465726973746963206e656f636f727465782c20726567756c6174657320656e646f746865726d696320616e642063697263756c61746f72792073797374656d732c20696e636c7564696e67206120666f75722d6368616d62657265642068656172742e204d616d6d616c732072616e676520696e2073697a652066726f6d20746865203330963430206d696c6c696d657472652028312d20746f20312e352d696e6368292042756d626c656265652042617420746f207468652033332d6d6574726520283130382d666f6f742920426c7565205768616c652e, 'bob', 'Furry live-birth giving critters'),
('People', 0x46726f6d2057696b6970656469613a0d0a0d0a48756d616e732c206b6e6f776e207461786f6e6f6d6963616c6c7920617320486f6d6f2073617069656e735b335d5b345d20284c6174696e20666f72202277697365206d616e22206f7220226b6e6f77696e67206d616e22292c5b355d2061726520746865206f6e6c79206c6976696e67207370656369657320696e2074686520486f6d6f2067656e7573206f66206269706564616c207072696d6174657320696e20486f6d696e696461652c20746865206772656174206170652066616d696c792e20416e61746f6d6963616c6c79206d6f6465726e2068756d616e73206f726967696e6174656420696e204166726963612061626f7574203230302c3030302079656172732061676f2c207265616368696e672066756c6c206265686176696f72616c206d6f6465726e6974792061726f756e642035302c3030302079656172732061676f2e5b365d, 'bob', 'human beings'),
('Soda', 0x46726f6d2057696b6970656469613a0d0a0d0a4120736f6674206472696e6b2028616c736f2063616c6c656420736f64612c20706f702c20736f646120706f702c206f7220636172626f6e61746564206265766572616765292069732061206e6f6e2d616c636f686f6c69632062657665726167652074686174207479706963616c6c7920636f6e7461696e7320636172626f6e617465642077617465722c2061207377656574656e696e67206167656e742c20616e64206120666c61766f72696e67206167656e742e20546865207377656574656e696e67206167656e74206d61792062652073756761722c20686967682d66727563746f736520636f726e2073797275702c206f72206120737567617220737562737469747574652028696e207468652063617365206f662064696574206472696e6b73292e204120736f6674206472696e6b206d617920616c736f20636f6e7461696e206361666665696e65206f72206672756974206a756963652e0d0a0d0a50726f6475637473207375636820617320656e65726779206472696e6b732c204b6f6f6c2d4169642c20616e642070757265206a7569636520617265206e6f7420636f6e7369646572656420746f20626520736f6674206472696e6b732e204f7468657220626576657261676573206e6f7420636f6e7369646572656420746f20626520736f6674206472696e6b732061726520686f742063686f636f6c6174652c20686f74207465612c20636f666665652c206d696c6b2c206d696c6b7368616b65732c20616e64207363686f726c652e0d0a0d0a536f6674206472696e6b73206172652063616c6c65642022736f66742220696e20636f6e747261737420746f202268617264206472696e6b73222028616c636f686f6c696320626576657261676573292e20536d616c6c20616d6f756e7473206f6620616c636f686f6c206d61792062652070726573656e7420696e206120736f6674206472696e6b2c206275742074686520616c636f686f6c20636f6e74656e74206d757374206265206c657373207468616e20302e3525206f662074686520746f74616c20766f6c756d655b315d5b325d20696620746865206472696e6b20697320746f20626520636f6e73696465726564206e6f6e2d616c636f686f6c69632e5b335d0d0a0d0a576964656c7920736f6c6420736f6674206472696e6b20666c61766f72732061726520636f6c612c206c656d6f6e2d6c696d652c20726f6f7420626565722c206f72616e67652c2067726170652c2076616e696c6c612c2067696e67657220616c652c2066727569742070756e63682c20737061726b6c696e67206c656d6f6e6164652c207371756173682c20616e6420666c61766f7265642077617465722e0d0a0d0a536f6674206472696e6b73206d617920626520736572766564206368696c6c6564206f7220617420726f6f6d2074656d70657261747572652e20546865792061726520726172656c79206865617465642e, 'Dr.Pepper', 'Sweet and carbonated');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE IF NOT EXISTS `location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(70) NOT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `location`
--


-- --------------------------------------------------------

--
-- Table structure for table `memberjunction`
--

CREATE TABLE IF NOT EXISTS `memberjunction` (
  `userName` varchar(20) NOT NULL,
  `groupName` varchar(20) NOT NULL,
  PRIMARY KEY (`userName`,`groupName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `memberjunction`
--

INSERT INTO `memberjunction` (`userName`, `groupName`) VALUES
('bob', 'bob'),
('bob', 'Mammals'),
('bob', 'People'),
('cat', 'Animals'),
('coke', 'Soda'),
('dog', 'Animals'),
('Dr.Pepper', 'Soda'),
('fish', 'Animals'),
('frog', 'Animals'),
('sprite', 'Soda');

-- --------------------------------------------------------

--
-- Table structure for table `membership`
--

CREATE TABLE IF NOT EXISTS `membership` (
  `memberKey` int(99) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) NOT NULL,
  `groupName` varchar(20) NOT NULL,
  PRIMARY KEY (`memberKey`),
  UNIQUE KEY `userName` (`userName`),
  UNIQUE KEY `groupName` (`groupName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `membership`
--


-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `key` int(11) NOT NULL AUTO_INCREMENT,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `title` varchar(20) NOT NULL,
  `value` blob NOT NULL,
  `author` varchar(20) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`key`, `time`, `title`, `value`, `author`) VALUES
(1, '2011-02-23 19:36:30', 'Mid Term Exam', 0x496d20667265616b696e67206f75742121, 'Thomas Jefferson');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `userName` varchar(20) NOT NULL,
  `password` varchar(10) NOT NULL,
  `eMail` varchar(30) NOT NULL,
  `Bio` blob NOT NULL,
  `Avatar` varchar(25) NOT NULL,
  PRIMARY KEY (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userName`, `password`, `eMail`, `Bio`, `Avatar`) VALUES
('bob', 'password', 'bob@gmail.com', 0x46726f6d2057696b6970656469613a0d0a546865206e616d6520526f626572742069732061204765726d616e696320676976656e206e616d652c2066726f6d2068726f64202266616d652220616e64206265726168742022627269676874222e20497420697320616c736f20696e207573652061732061207375726e616d652e5b315d5b325d0d0a0d0a4166746572206265636f6d696e6720776964656c79207573656420696e20436f6e74696e656e74616c204575726f706520697420656e746572656420456e676c616e6420696e20697473204f6c64204672656e636820666f726d20526f626572742c20776865726520616e204f6c6420456e676c69736820636f676e61746520666f726d2028487226233237353b6f646226233237353b6f7268742c2048726f6462657268742c20487226233237353b6f646226233237353b6f72f02c2048729c64629c72f02c2048729c64626572f029206861642065786973746564206265666f726520746865204e6f726d616e20436f6e71756573742e205468652066656d696e696e652076657273696f6e20697320526f62657274612e20546865204974616c69616e20666f726d20697320526f626572746f2e0909090909, 'avatars/bob.jpg'),
('cat', 'password', 'cat@gmail.com', 0x46726f6d2057696b6970656469613a0d0a0d0a54686520636174202846656c6973206361747573292c20616c736f206b6e6f776e2061732074686520646f6d657374696320636174206f7220686f7573656361745b355d20746f2064697374696e67756973682069742066726f6d206f746865722066656c696e657320616e642066656c6964732c206973206120736d616c6c20667572727920646f6d657374696361746564206361726e69766f726f7573206d616d6d616c20746861742069732076616c7565642062792068756d616e7320666f722069747320636f6d70616e696f6e7368697020616e6420666f7220697473206162696c69747920746f2068756e74207665726d696e20616e6420686f757365686f6c642070657374732e20436174732068617665206265656e206173736f63696174656420776974682068756d616e7320666f72206174206c6561737420392c3530302079656172732c5b365d20616e64206172652063757272656e746c7920746865206d6f737420706f70756c61722070657420696e2074686520776f726c642e5b375d204f77696e6720746f20746865697220636c6f7365206173736f63696174696f6e20776974682068756d616e732c206361747320617265206e6f7720666f756e6420616c6d6f7374206576657279776865726520696e2074686520776f726c642e0d0a0d0a43617473206172652073696d696c617220696e20616e61746f6d7920746f20746865206f746865722066656c6964732c2077697468207374726f6e672c20666c657869626c6520626f646965732c20717569636b207265666c657865732c207368617270207265747261637461626c6520636c6177732c20616e64207465657468206164617074656420746f206b696c6c696e6720736d616c6c20707265792e204173206e6f637475726e616c207072656461746f72732c2063617473207573652074686569722061637574652068656172696e6720616e64206162696c69747920746f2073656520696e206e656172206461726b6e65737320746f206c6f6361746520707265792e204e6f74206f6e6c792063616e2063617473206865617220736f756e647320746f6f206661696e7420666f722068756d616e20656172732c20746865792063616e20616c736f206865617220736f756e64732068696768657220696e206672657175656e6379207468616e2068756d616e732063616e2070657263656976652e205468697320697320626563617573652074686520757375616c2070726579206f6620636174732028706172746963756c61726c7920726f64656e74732073756368206173206d69636529206d616b652068696768206672657175656e6379206e6f697365732c20736f207468652068656172696e67206f662074686520636174206861732065766f6c76656420746f2070696e706f696e74207468657365206661696e7420686967682d7069746368656420736f756e64732e20436174732072656c79206d6f7265206f6e20736d656c6c207468616e2074617374652c20616e6420686176652061206d756368206265747465722073656e7365206f6620736d656c6c207468616e2068756d616e732e0d0a0d0a44657370697465206265696e6720736f6c69746172792068756e746572732c206361747320617265206120736f6369616c207370656369657320616e642075736520612076617269657479206f6620766f63616c697a6174696f6e732c20706865726f6d6f6e657320616e64207479706573206f6620626f6479206c616e677561676520666f7220636f6d6d756e69636174696f6e2e20546865736520696e636c756465206d656f77696e672c2070757272696e672c207472696c6c696e672c2068697373696e672c2067726f776c696e672c20616e64206772756e74696e672e5b385d0d0a0d0a4361747320686176652061207261706964206272656564696e6720726174652e20556e64657220636f6e74726f6c6c6564206272656564696e672c20746865792063616e206265206272656420616e642073686f776e206173207265676973746572656420706564696772656520706574732c206120686f626279206b6e6f776e206173206361742066616e63792e204661696c75726520746f20636f6e74726f6c20746865206272656564696e67206f662070657420636174732062792073706179696e6720616e64206e6575746572696e6720616e6420746865206162616e646f6e6d656e74206f6620666f726d657220686f757365686f6c6420706574732068617320726573756c74656420696e206c61726765206e756d62657273206f6620666572616c206361747320776f726c64776964652c2077697468206120706f70756c6174696f6e206f6620757020746f203630206d696c6c696f6e206f6620746865736520616e696d616c7320696e2074686520556e697465642053746174657320616c6f6e652e5b395d0d0a0d0a417320546865204e657720596f726b2054696d65732077726f746520696e20323030372c2022556e74696c20726563656e746c7920746865206361742077617320636f6d6d6f6e6c792062656c696576656420746f2068617665206265656e20646f6d65737469636174656420696e20616e6369656e742045677970742c2077686572652069742077617320612063756c7420616e696d616c222c5b31305d206275742061207374756479207468617420796561722072657665616c6564207468617420746865206c696e6573206f662064657363656e74206f6620616c6c20686f75736520636174732070726f6261626c792072756e207468726f7567682061732066657720617320666976652073656c662d646f6d65737469636174696e67204166726963616e2057696c6463617473202846656c69732073696c76657374726973206c79626963612920632e20383030302042432c20696e20746865204e65617220456173742e5b345d20546865206561726c69657374206469726563742065766964656e6365206f662063617420646f6d65737469636174696f6e2069732061206b697474656e2074686174207761732062757269656420616c6f6e677369646520612068756d616e20392c3530302079656172732061676f20696e204379707275732e090909090909090909, 'avatars/cat.jpg'),
('coke', 'password', 'coke@gmail.com', 0x46726f6d2057696b6970656469613a0d0a0d0a436f63612d436f6c61206973206120636172626f6e6174656420736f6674206472696e6b20736f6c6420696e207468652073746f7265732c2072657374617572616e74732c20616e642076656e64696e67206d616368696e6573206f66206d6f7265207468616e2032303020636f756e74726965732e5b315d2049742069732070726f64756365642062792054686520436f63612d436f6c6120436f6d70616e79206f662041746c616e74612c2047656f726769612c20616e64206973206f6674656e20726566657272656420746f2073696d706c7920617320436f6b6520286120726567697374657265642074726164656d61726b206f662054686520436f63612d436f6c6120436f6d70616e7920696e2074686520556e69746564205374617465732073696e6365204d617263682032372c2031393434292e204f726967696e616c6c7920696e74656e646564206173206120706174656e74206d65646963696e65207768656e2069742077617320696e76656e74656420696e20746865206c61746520313974682063656e74757279206279204a6f686e2050656d626572746f6e2c20436f63612d436f6c612077617320626f75676874206f757420627920627573696e6573736d616e20417361204772696767732043616e646c65722c2077686f7365206d61726b6574696e672074616374696373206c656420436f6b6520746f2069747320646f6d696e616e6365206f662074686520776f726c6420736f66742d6472696e6b206d61726b6574207468726f7567686f75742074686520323074682063656e747572792e, 'avatars/coke.jpg'),
('dog', 'password', 'dog@gmail.com', 0x46726f6d2057696b6970656469613a0d0a0d0a54686520646f67202843616e6973206c757075732066616d696c69617269735b335d20616e642043616e6973206c757075732064696e676f5b315d5b325d29206973206120646f6d65737469636174656420666f726d206f6620746865206772617920776f6c662c2061206d656d626572206f66207468652043616e696461652066616d696c79206f6620746865206f72646572204361726e69766f72612e20546865207465726d206973207573656420666f7220626f746820666572616c20616e6420706574207661726965746965732e2054686520646f67207761732074686520666972737420616e696d616c20746f20626520646f6d6573746963617465642c20616e6420686173206265656e20746865206d6f737420776964656c79206b65707420776f726b696e672c2068756e74696e672c20616e6420636f6d70616e696f6e20616e696d616c20696e2068756d616e20686973746f72792e2054686520776f72642022646f6722206d617920616c736f206d65616e20746865206d616c65206f6620612063616e696e6520737065636965732c5b345d206173206f70706f73656420746f2074686520776f7264202262697463682220666f72207468652066656d616c65206f662074686520737065636965732e5b355d09090909090909090909, 'avatars/dog.jpg'),
('Dr.Pepper', 'password', 'drpepper@gmail.com', 0x4920616d206120736f64612e20204920616d20617661696c61626c6520696e20626f746820726567756c617220616e64206469657420666f726d732e2020492074617374652064656c6963696f75732e, 'avatars/drpepper_logo.jpg'),
('fish', 'password', 'fish@gmail.com', 0x46726f6d2057696b6970656469613a0d0a0d0a41206669736820697320616e792067696c6c2d62656172696e672061717561746963207665727465627261746520286f72206372616e696174652920616e696d616c2074686174206c61636b73206c696d62732077697468206469676974732e20496e636c7564656420696e207468697320646566696e6974696f6e2061726520746865206c6976696e6720686167666973682c206c616d70726579732c20616e642063617274696c6167696e6f757320616e6420626f6e7920666973682c2061732077656c6c20617320766172696f757320657874696e63742072656c617465642067726f7570732e204265636175736520746865207465726d20697320646566696e6564206e656761746976656c792c20616e64206578636c7564657320746865207465747261706f64732028692e652e2c2074686520616d7068696269616e732c2072657074696c65732c20626972647320616e64206d616d6d616c73292077686963682064657363656e642066726f6d2077697468696e207468652073616d6520616e6365737472792c20697420697320706172617068796c657469632e2054686520747261646974696f6e616c207465726d207069736365732028616c736f2069636874687965732920697320636f6e736964657265642061207479706f6c6f676963616c2c20627574206e6f742061207068796c6f67656e6574696320636c617373696669636174696f6e2e0d0a0d0a4d6f73742066697368206172652022636f6c642d626c6f6f646564222c206f72206563746f746865726d69632c20616c6c6f77696e6720746865697220626f64792074656d70657261747572657320746f207661727920617320616d6269656e742074656d706572617475726573206368616e67652e204669736820617265206162756e64616e7420696e206d6f737420626f64696573206f662077617465722e20546865792063616e20626520666f756e6420696e206e6561726c7920616c6c206171756174696320656e7669726f6e6d656e74732c2066726f6d2068696768206d6f756e7461696e2073747265616d732028652e672e2c206368617220616e642067756467656f6e2920746f20746865206162797373616c20616e64206576656e20686164616c20646570746873206f66207468652064656570657374206f6365616e732028652e672e2c2067756c7065727320616e6420616e676c657266697368292e2041742033312c39303020737065636965732c206669736820657868696269742067726561746572207370656369657320646976657273697479207468616e20616e79206f7468657220636c617373206f662076657274656272617465732e5b315d0d0a0d0a466973682c20657370656369616c6c7920617320666f6f642c2061726520616e20696d706f7274616e74207265736f7572636520776f726c64776964652e20436f6d6d65726369616c20616e642073756273697374656e636520666973686572732068756e74206669736820696e2077696c642066697368657269657320287365652066697368696e6729206f72206661726d207468656d20696e20706f6e6473206f7220696e20636167657320696e20746865206f6365616e2028736565206171756163756c74757265292e20546865792061726520616c736f206361756768742062792072656372656174696f6e616c20666973686572732c206b65707420617320706574732c2072616973656420627920666973686b6565706572732c20616e642065786869626974656420696e207075626c696320617175617269612e2046697368206861766520686164206120726f6c6520696e2063756c74757265207468726f7567682074686520616765732c2073657276696e6720617320646569746965732c2072656c6967696f75732073796d626f6c732c20616e6420617320746865207375626a65637473206f66206172742c20626f6f6b7320616e64206d6f766965732e, 'avatars/fish.jpg'),
('frog', 'password', 'frog@gmail.com', 0x46726f6d2057696b6970656469613a0d0a0d0a46726f67732061726520616d7068696269616e7320696e20746865206f7264657220416e75726120286d65616e696e6720227461696c2d6c657373222c2066726f6d20477265656b20616e2d2c20776974686f7574202b206f7572612c207461696c292c20666f726d65726c7920726566657272656420746f2061732053616c69656e74696120284c6174696e2073616c657265202873616c696f292c2022746f206a756d7022292e204d6f73742066726f67732061726520636861726163746572697a656420627920612073686f727420626f64792c2077656262656420646967697473202866696e67657273206f7220746f6573292c2070726f74727564696e67206579657320616e642074686520616273656e6365206f662061207461696c2e2046726f67732061726520776964656c79206b6e6f776e20617320657863657074696f6e616c206a756d706572732c20616e64206d616e79206f662074686520616e61746f6d6963616c20636861726163746572697374696373206f662066726f67732c20706172746963756c61726c79207468656972206c6f6e672c20706f77657266756c206c6567732c206172652061646170746174696f6e7320746f20696d70726f7665206a756d70696e6720706572666f726d616e63652e2044756520746f207468656972207065726d6561626c6520736b696e2c2066726f677320617265206f6674656e2073656d692d61717561746963206f7220696e68616269742068756d69642061726561732c20627574206d6f766520656173696c79206f6e206c616e642e2054686579207479706963616c6c79206c6179207468656972206567677320696e20707564646c65732c20706f6e6473206f72206c616b65732c20616e64207468656972206c61727661652c2063616c6c656420746164706f6c65732c20686176652067696c6c7320616e6420646576656c6f7020696e2077617465722e204164756c742066726f677320666f6c6c6f772061206361726e69766f726f757320646965742c206d6f73746c79206f662061727468726f706f64732c20616e6e656c69647320616e642067617374726f706f64732e2046726f677320617265206d6f7374206e6f7469636561626c652062792074686569722063616c6c2c2077686963682063616e20626520776964656c7920686561726420647572696e6720746865206e69676874206f72206461792c206d61696e6c7920696e207468656972206d6174696e6720736561736f6e2e0d0a0d0a54686520646973747269627574696f6e206f662066726f67732072616e6765732066726f6d2074726f70696320746f2073756261726374696320726567696f6e732c20627574206d6f737420737065636965732061726520666f756e6420696e2074726f706963616c207261696e666f72657374732e20436f6e73697374696e67206f66206d6f7265207468616e20352c3030302073706563696573206465736372696265642c20746865792061726520616d6f6e6720746865206d6f737420646976657273652067726f757073206f662076657274656272617465732e20486f77657665722c20706f70756c6174696f6e73206f66206365727461696e2066726f67207370656369657320617265206465636c696e696e67207369676e69666963616e746c792e0d0a0d0a4120706f70756c61722064697374696e6374696f6e206973206f6674656e206d616465206265747765656e2066726f677320616e6420746f616473206f6e20746865206261736973206f6620746865697220617070656172616e63652c20627574207468697320686173206e6f207461786f6e6f6d69632062617369732e20284d656d62657273206f662074686520616e7572616e2066616d696c79204275666f6e69646165206172652063616c6c6564207472756520746f6164732c20627574206d616e7920737065636965732066726f6d206f746865722066616d696c6965732061726520616c736f2063616c6c656420746f6164732e2920496e206164646974696f6e20746f2074686569722065636f6c6f676963616c20696d706f7274616e63652c2066726f67732068617665206d616e792063756c747572616c20726f6c65732c207375636820617320696e206c6974657261747572652c2073796d626f6c69736d20616e642072656c6967696f6e2c20616e6420746865792061726520616c736f2076616c75656420617320666f6f6420616e6420617320706574732e, 'avatars/frog.jpg'),
('sprite', 'password', 'sprite@gmail.com', 0x46726f6d2057696b6970656469613a0d0a0d0a5370726974652069732061207472616e73706172656e742c206c656d6f6e2d6c696d6520666c61766f7265642c206361666665696e65206672656520736f6674206472696e6b2c2070726f64756365642062792074686520436f6361436f6c6120436f6d70616e792e2049742077617320696e74726f647563656420696e2074686520556e697465642053746174657320696e20313936312e20546869732077617320436f6b657320726573706f6e736520746f2074686520706f70756c6172697479206f6620372055702c2077686963682068616420626567756e206173204c6974686961746564204c656d6f6e20696e20313932392e20497420636f6d657320696e2061207072696d6172696c792073696c7665722c20677265656e2c20616e6420626c75652063616e206f72206120677265656e207472616e736c7563656e7420626f74746c6520776974682061207072696d6172696c7920677265656e20616e6420626c7565206c6162656c2e20496e20313937382c2053707269746520626563616d6520746865206d61726b6574206c656164657220706f736974696f6e20696e20746865206c656d6f6e20736f64612063617465676f72792e, 'avatars/sprite.jpg');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `membership`
--
ALTER TABLE `membership`
  ADD CONSTRAINT `membership_ibfk_1` FOREIGN KEY (`userName`) REFERENCES `users` (`userName`),
  ADD CONSTRAINT `membership_ibfk_2` FOREIGN KEY (`groupName`) REFERENCES `groups` (`groupName`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
