-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 09, 2018 at 04:56 PM
-- Server version: 5.6.35
-- PHP Version: 7.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `starter_craft3`
--

-- --------------------------------------------------------

--
-- Table structure for table `craft_assetindexdata`
--

CREATE TABLE `craft_assetindexdata` (
  `id` int(11) NOT NULL,
  `sessionId` varchar(36) NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_assets`
--

CREATE TABLE `craft_assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_assets`
--

INSERT INTO `craft_assets` (`id`, `volumeId`, `folderId`, `filename`, `kind`, `width`, `height`, `size`, `focalPoint`, `dateModified`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(19, 1, 1, 'logo.png', 'image', 1000, 272, 14929, NULL, '2018-05-09 19:23:46', '2018-05-09 19:23:46', '2018-05-09 19:23:46', 'ff16b12f-550c-45dc-abcf-19face1a6723');

-- --------------------------------------------------------

--
-- Table structure for table `craft_assettransformindex`
--

CREATE TABLE `craft_assettransformindex` (
  `id` int(11) NOT NULL,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_assettransforms`
--

CREATE TABLE `craft_assettransforms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_categories`
--

CREATE TABLE `craft_categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_categorygroups`
--

CREATE TABLE `craft_categorygroups` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_categorygroups_sites`
--

CREATE TABLE `craft_categorygroups_sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_content`
--

CREATE TABLE `craft_content` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_body` text,
  `field_email` text,
  `field_phoneNumber` text,
  `field_copyright` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_content`
--

INSERT INTO `craft_content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_body`, `field_email`, `field_phoneNumber`, `field_copyright`) VALUES
(1, 1, 1, NULL, '2018-05-02 20:31:26', '2018-05-02 20:31:26', 'd570f867-dd68-4f6b-92b7-f9c8ad96ec9b', NULL, NULL, NULL, NULL),
(2, 2, 1, 'Home Page', '2018-05-02 20:42:28', '2018-05-09 19:51:57', '116d8c53-f4f7-45d6-a016-8bae0396ed04', NULL, NULL, NULL, NULL),
(5, 12, 1, NULL, '2018-05-07 20:19:03', '2018-05-09 18:47:43', '1c95dca9-3b88-4dcd-b35b-92d8cb6d384a', NULL, NULL, NULL, NULL),
(6, 13, 1, NULL, '2018-05-07 20:19:06', '2018-05-09 19:28:26', 'fb58221a-0b49-43d3-ba3c-09da76b8e7c8', NULL, 'testemail@email.com', '911', '<p>Copyright nIck pappas</p>\n'),
(10, 19, 1, 'Logo', '2018-05-09 19:23:45', '2018-05-09 19:23:45', '0adb87ad-2c3d-45bf-af34-e251cc4abd43', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `craft_craftidtokens`
--

CREATE TABLE `craft_craftidtokens` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_deprecationerrors`
--

CREATE TABLE `craft_deprecationerrors` (
  `id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) UNSIGNED DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `traces` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_deprecationerrors`
--

INSERT INTO `craft_deprecationerrors` (`id`, `key`, `fingerprint`, `lastOccurrence`, `file`, `line`, `message`, `traces`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'validation.key', '/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/services/Config.php:145', '2018-05-09 20:56:20', '/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/services/Config.php', 145, 'The auto-generated validation key stored at /Users/nick/Documents/starter_kit2/craft/storage/runtime/validation.key has been deprecated. Copy its value to the “securityKey” config setting in config/general.php.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/services/Config.php\",\"line\":117,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"validation.key\\\", \\\"The auto-generated validation key stored at /Users/nick/Document...\\\"\"},{\"objectClass\":\"craft\\\\services\\\\Config\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/services/Config.php\",\"line\":145,\"class\":\"craft\\\\services\\\\Config\",\"method\":\"getConfigSettings\",\"args\":\"\\\"general\\\"\"},{\"objectClass\":\"craft\\\\services\\\\Config\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/config/app.web.php\",\"line\":19,\"class\":\"craft\\\\services\\\\Config\",\"method\":\"getGeneral\",\"args\":null},{\"objectClass\":null,\"file\":null,\"line\":null,\"class\":null,\"method\":\"{closure}\",\"args\":null},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/di/Container.php\",\"line\":503,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"Closure, []\"},{\"objectClass\":\"yii\\\\di\\\\Container\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/BaseYii.php\",\"line\":351,\"class\":\"yii\\\\di\\\\Container\",\"method\":\"invoke\",\"args\":\"Closure, []\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/di/ServiceLocator.php\",\"line\":137,\"class\":\"yii\\\\BaseYii\",\"method\":\"createObject\",\"args\":\"Closure\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Module.php\",\"line\":742,\"class\":\"yii\\\\di\\\\ServiceLocator\",\"method\":\"get\",\"args\":\"\\\"request\\\", true\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":327,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"get\",\"args\":\"\\\"request\\\", true\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/web/Application.php\",\"line\":160,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"get\",\"args\":\"\\\"request\\\"\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/config/app.php\",\"line\":235,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"getRequest\",\"args\":null},{\"objectClass\":null,\"file\":null,\"line\":null,\"class\":null,\"method\":\"{closure}\",\"args\":null},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/di/Container.php\",\"line\":503,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"Closure, []\"},{\"objectClass\":\"yii\\\\di\\\\Container\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/BaseYii.php\",\"line\":351,\"class\":\"yii\\\\di\\\\Container\",\"method\":\"invoke\",\"args\":\"Closure, []\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/di/ServiceLocator.php\",\"line\":137,\"class\":\"yii\\\\BaseYii\",\"method\":\"createObject\",\"args\":\"Closure\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Module.php\",\"line\":742,\"class\":\"yii\\\\di\\\\ServiceLocator\",\"method\":\"get\",\"args\":\"\\\"log\\\", true\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":327,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"get\",\"args\":\"\\\"log\\\", true\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Application.php\",\"line\":508,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"get\",\"args\":\"\\\"log\\\"\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/base/ApplicationTrait.php\",\"line\":1115,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"getLog\",\"args\":null},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":97,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"_preInit\",\"args\":null},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/BaseObject.php\",\"line\":109,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"init\",\"args\":null},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Application.php\",\"line\":206,\"class\":\"yii\\\\base\\\\BaseObject\",\"method\":\"__construct\",\"args\":\"[\\\"env\\\" => \\\"starter.web\\\", \\\"components\\\" => [\\\"config\\\" => craft\\\\services\\\\Config, \\\"api\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Api\\\"], \\\"assets\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Assets\\\"], \\\"assetIndexer\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\AssetIndexer\\\"], ...], \\\"id\\\" => \\\"CraftCMS\\\", \\\"name\\\" => \\\"Craft CMS\\\", ...]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":88,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"__construct\",\"args\":\"[\\\"env\\\" => \\\"starter.web\\\", \\\"components\\\" => [\\\"config\\\" => craft\\\\services\\\\Config, \\\"api\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Api\\\"], \\\"assets\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Assets\\\"], \\\"assetIndexer\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\AssetIndexer\\\"], ...], \\\"id\\\" => \\\"CraftCMS\\\", \\\"name\\\" => \\\"Craft CMS\\\", ...]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":null,\"line\":null,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"__construct\",\"args\":\"[\\\"vendorPath\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor\\\", \\\"env\\\" => \\\"starter.web\\\", \\\"components\\\" => [\\\"config\\\" => craft\\\\services\\\\Config, \\\"api\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Api\\\"], \\\"assets\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Assets\\\"], \\\"assetIndexer\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\AssetIndexer\\\"], ...], \\\"id\\\" => \\\"CraftCMS\\\", ...]\"},{\"objectClass\":\"ReflectionClass\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/di/Container.php\",\"line\":383,\"class\":\"ReflectionClass\",\"method\":\"newInstanceArgs\",\"args\":\"[[\\\"vendorPath\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor\\\", \\\"env\\\" => \\\"starter.web\\\", \\\"components\\\" => [\\\"config\\\" => craft\\\\services\\\\Config, \\\"api\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Api\\\"], \\\"assets\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Assets\\\"], \\\"assetIndexer\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\AssetIndexer\\\"], ...], \\\"id\\\" => \\\"CraftCMS\\\", ...]]\"},{\"objectClass\":\"yii\\\\di\\\\Container\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/di/Container.php\",\"line\":156,\"class\":\"yii\\\\di\\\\Container\",\"method\":\"build\",\"args\":\"\\\"craft\\\\web\\\\Application\\\", [], [\\\"vendorPath\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor\\\", \\\"env\\\" => \\\"starter.web\\\", \\\"components\\\" => [\\\"config\\\" => craft\\\\services\\\\Config, \\\"api\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Api\\\"], \\\"assets\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Assets\\\"], \\\"assetIndexer\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\AssetIndexer\\\"], ...], \\\"id\\\" => \\\"CraftCMS\\\", ...]\"},{\"objectClass\":\"yii\\\\di\\\\Container\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/BaseYii.php\",\"line\":349,\"class\":\"yii\\\\di\\\\Container\",\"method\":\"get\",\"args\":\"\\\"craft\\\\web\\\\Application\\\", [], [\\\"vendorPath\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor\\\", \\\"env\\\" => \\\"starter.web\\\", \\\"components\\\" => [\\\"config\\\" => craft\\\\services\\\\Config, \\\"api\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Api\\\"], \\\"assets\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Assets\\\"], \\\"assetIndexer\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\AssetIndexer\\\"], ...], \\\"id\\\" => \\\"CraftCMS\\\", ...]\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/bootstrap/bootstrap.php\",\"line\":249,\"class\":\"yii\\\\BaseYii\",\"method\":\"createObject\",\"args\":\"[\\\"vendorPath\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor\\\", \\\"env\\\" => \\\"starter.web\\\", \\\"components\\\" => [\\\"config\\\" => craft\\\\services\\\\Config, \\\"api\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Api\\\"], \\\"assets\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Assets\\\"], \\\"assetIndexer\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\AssetIndexer\\\"], ...], \\\"id\\\" => \\\"CraftCMS\\\", ...]\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/bootstrap/web.php\",\"line\":42,\"class\":null,\"method\":\"require\",\"args\":\"\\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/boo...\\\"\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/public/index.php\",\"line\":14,\"class\":null,\"method\":\"require\",\"args\":\"\\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/boo...\\\"\"}]', '2018-05-09 20:56:20', '2018-05-09 20:56:20', '493f212b-8911-4cc4-9228-e027e633e14f'),
(10, 'ElementQuery::find()', '/Users/nick/Documents/starter_kit2/craft/templates/index.html:29', '2018-05-09 20:06:45', '/Users/nick/Documents/starter_kit2/craft/templates/index.html', 29, 'The find() function used to query for elements is now deprecated. Use all() instead.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":1229,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::find()\\\", \\\"The find() function used to query for elements is now deprecated...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\EntryQuery\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Extension/Core.php\",\"line\":1605,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"find\",\"args\":null},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/helpers/Template.php\",\"line\":73,\"class\":null,\"method\":\"twig_get_attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig_Source, craft\\\\elements\\\\db\\\\EntryQuery, \\\"find\\\", ...\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/6e/6e396d50f8cc2a8976bc3bebc936308c67167fee615453f7958ff9f142720a45.php\",\"line\":49,\"class\":\"craft\\\\helpers\\\\Template\",\"method\":\"attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig_Source, craft\\\\elements\\\\db\\\\EntryQuery, \\\"find\\\", ...\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":189,\"class\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"method\":\"block_content\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/0b/0b55b978a6e47c0f05931667141d73fcb9351cf208684014a51ed98cb459f431.php\",\"line\":84,\"class\":\"Twig_Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/6e/6e396d50f8cc2a8976bc3bebc936308c67167fee615453f7958ff9f142720a45.php\",\"line\":28,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":375,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Environment.php\",\"line\":289,\"class\":\"Twig_Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/View.php\",\"line\":305,\"class\":\"Twig_Environment\",\"method\":\"render\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/View.php\",\"line\":352,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Controller.php\",\"line\":128,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":78,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Controller.php\",\"line\":76,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":276,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":265,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/public/index.php\",\"line\":15,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2018-05-09 20:06:45', '2018-05-09 20:06:45', '42741ade-6586-498c-abfe-15018ccb6c5d'),
(11, 'DateTime::year()', '/Users/nick/Documents/starter_kit2/craft/templates/_layout.html:51', '2018-05-02 20:31:44', '/Users/nick/Documents/starter_kit2/craft/templates/_layout.html', 51, 'DateTime::year is deprecated. Use the |date(\'Y\') filter instead.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/helpers/Template.php\",\"line\":278,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"DateTime::year()\\\", \\\"DateTime::year is deprecated. Use the |date(\'Y\') filter instead.\\\"\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/helpers/Template.php\",\"line\":68,\"class\":\"craft\\\\helpers\\\\Template\",\"method\":\"_dateTimeAttribute\",\"args\":\"DateTime, \\\"year\\\", \\\"any\\\"\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/d1/d16bc09f5a2696f8dcf082f0c15b5a875a606e3d5ccc6ba81bb3b1bcf2602380.php\",\"line\":92,\"class\":\"craft\\\\helpers\\\\Template\",\"method\":\"attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig_Source, DateTime, \\\"year\\\", ...\"},{\"objectClass\":\"__TwigTemplate_31ae712a236d3dd8fc418f1932042aa712613f58b163766fa17c5592fa2098d6\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_31ae712a236d3dd8fc418f1932042aa712613f58b163766fa17c5592fa2098d6\",\"method\":\"doDisplay\",\"args\":\"[\\\"message\\\" => \\\"Template not found: assets/img/favicon/favicon-96x96.png\\\", \\\"code\\\" => 0, \\\"file\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src...\\\", \\\"line\\\" => 70, ...], [\\\"content\\\" => [__TwigTemplate_fb0ca9446afed21b2f2779f5cfaf0549a051cd556f03bf0a599d446ab5fc25a0, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_31ae712a236d3dd8fc418f1932042aa712613f58b163766fa17c5592fa2098d6\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"message\\\" => \\\"Template not found: assets/img/favicon/favicon-96x96.png\\\", \\\"code\\\" => 0, \\\"file\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src...\\\", \\\"line\\\" => 70, ...], [\\\"content\\\" => [__TwigTemplate_fb0ca9446afed21b2f2779f5cfaf0549a051cd556f03bf0a599d446ab5fc25a0, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_31ae712a236d3dd8fc418f1932042aa712613f58b163766fa17c5592fa2098d6\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"message\\\" => \\\"Template not found: assets/img/favicon/favicon-96x96.png\\\", \\\"code\\\" => 0, \\\"file\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src...\\\", \\\"line\\\" => 70, ...], [\\\"content\\\" => [__TwigTemplate_fb0ca9446afed21b2f2779f5cfaf0549a051cd556f03bf0a599d446ab5fc25a0, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_31ae712a236d3dd8fc418f1932042aa712613f58b163766fa17c5592fa2098d6\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"message\\\" => \\\"Template not found: assets/img/favicon/favicon-96x96.png\\\", \\\"code\\\" => 0, \\\"file\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src...\\\", \\\"line\\\" => 70, ...], [\\\"content\\\" => [__TwigTemplate_fb0ca9446afed21b2f2779f5cfaf0549a051cd556f03bf0a599d446ab5fc25a0, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_31ae712a236d3dd8fc418f1932042aa712613f58b163766fa17c5592fa2098d6\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/8f/8f5fd25587c2c0d51295dabb0cda33c1b172ca8369f3ab7cf7cf907893cc1df1.php\",\"line\":31,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"message\\\" => \\\"Template not found: assets/img/favicon/favicon-96x96.png\\\", \\\"code\\\" => 0, \\\"file\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src...\\\", \\\"line\\\" => 70, ...], [\\\"content\\\" => [__TwigTemplate_fb0ca9446afed21b2f2779f5cfaf0549a051cd556f03bf0a599d446ab5fc25a0, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_fb0ca9446afed21b2f2779f5cfaf0549a051cd556f03bf0a599d446ab5fc25a0\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_fb0ca9446afed21b2f2779f5cfaf0549a051cd556f03bf0a599d446ab5fc25a0\",\"method\":\"doDisplay\",\"args\":\"[\\\"message\\\" => \\\"Template not found: assets/img/favicon/favicon-96x96.png\\\", \\\"code\\\" => 0, \\\"file\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src...\\\", \\\"line\\\" => 70, ...], [\\\"content\\\" => [__TwigTemplate_fb0ca9446afed21b2f2779f5cfaf0549a051cd556f03bf0a599d446ab5fc25a0, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_fb0ca9446afed21b2f2779f5cfaf0549a051cd556f03bf0a599d446ab5fc25a0\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"message\\\" => \\\"Template not found: assets/img/favicon/favicon-96x96.png\\\", \\\"code\\\" => 0, \\\"file\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src...\\\", \\\"line\\\" => 70, ...], [\\\"content\\\" => [__TwigTemplate_fb0ca9446afed21b2f2779f5cfaf0549a051cd556f03bf0a599d446ab5fc25a0, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_fb0ca9446afed21b2f2779f5cfaf0549a051cd556f03bf0a599d446ab5fc25a0\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"message\\\" => \\\"Template not found: assets/img/favicon/favicon-96x96.png\\\", \\\"code\\\" => 0, \\\"file\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src...\\\", \\\"line\\\" => 70, ...], [\\\"content\\\" => [__TwigTemplate_fb0ca9446afed21b2f2779f5cfaf0549a051cd556f03bf0a599d446ab5fc25a0, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_fb0ca9446afed21b2f2779f5cfaf0549a051cd556f03bf0a599d446ab5fc25a0\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"message\\\" => \\\"Template not found: assets/img/favicon/favicon-96x96.png\\\", \\\"code\\\" => 0, \\\"file\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src...\\\", \\\"line\\\" => 70, ...], []\"},{\"objectClass\":\"__TwigTemplate_fb0ca9446afed21b2f2779f5cfaf0549a051cd556f03bf0a599d446ab5fc25a0\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":375,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"message\\\" => \\\"Template not found: assets/img/favicon/favicon-96x96.png\\\", \\\"code\\\" => 0, \\\"file\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src...\\\", \\\"line\\\" => 70, ...]\"},{\"objectClass\":\"__TwigTemplate_fb0ca9446afed21b2f2779f5cfaf0549a051cd556f03bf0a599d446ab5fc25a0\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Environment.php\",\"line\":289,\"class\":\"Twig_Template\",\"method\":\"render\",\"args\":\"[\\\"message\\\" => \\\"Template not found: assets/img/favicon/favicon-96x96.png\\\", \\\"code\\\" => 0, \\\"file\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src...\\\", \\\"line\\\" => 70, ...]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/View.php\",\"line\":305,\"class\":\"Twig_Environment\",\"method\":\"render\",\"args\":\"\\\"404\\\", [\\\"message\\\" => \\\"Template not found: assets/img/favicon/favicon-96x96.png\\\", \\\"code\\\" => 0, \\\"file\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src...\\\", \\\"line\\\" => 70, ...]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/View.php\",\"line\":352,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"404\\\", [\\\"message\\\" => \\\"Template not found: assets/img/favicon/favicon-96x96.png\\\", \\\"code\\\" => 0, \\\"file\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src...\\\", \\\"line\\\" => 70, ...]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Controller.php\",\"line\":128,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"404\\\", [\\\"message\\\" => \\\"Template not found: assets/img/favicon/favicon-96x96.png\\\", \\\"code\\\" => 0, \\\"file\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src...\\\", \\\"line\\\" => 70, ...]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":209,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"404\\\", [\\\"message\\\" => \\\"Template not found: assets/img/favicon/favicon-96x96.png\\\", \\\"code\\\" => 0, \\\"file\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src...\\\", \\\"line\\\" => 70, ...]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRenderError\",\"args\":null},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRenderError\\\"], []\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Controller.php\",\"line\":76,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render-error\\\", []\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render-error\\\", []\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":274,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render-error\\\", []\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/web/ErrorHandler.php\",\"line\":108,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render-error\\\"\"},{\"objectClass\":\"craft\\\\web\\\\ErrorHandler\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/ErrorHandler.php\",\"line\":156,\"class\":\"yii\\\\web\\\\ErrorHandler\",\"method\":\"renderException\",\"args\":\"yii\\\\web\\\\NotFoundHttpException\"},{\"objectClass\":\"craft\\\\web\\\\ErrorHandler\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/ErrorHandler.php\",\"line\":111,\"class\":\"craft\\\\web\\\\ErrorHandler\",\"method\":\"renderException\",\"args\":\"yii\\\\web\\\\NotFoundHttpException\"},{\"objectClass\":\"craft\\\\web\\\\ErrorHandler\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/ErrorHandler.php\",\"line\":71,\"class\":\"yii\\\\base\\\\ErrorHandler\",\"method\":\"handleException\",\"args\":\"yii\\\\web\\\\NotFoundHttpException\"},{\"objectClass\":\"craft\\\\web\\\\ErrorHandler\",\"file\":null,\"line\":null,\"class\":\"craft\\\\web\\\\ErrorHandler\",\"method\":\"handleException\",\"args\":\"yii\\\\web\\\\NotFoundHttpException\"}]', '2018-05-02 20:31:44', '2018-05-02 20:31:44', 'dc21d345-58c1-40c0-a9e2-d2cb7c205aa9');
INSERT INTO `craft_deprecationerrors` (`id`, `key`, `fingerprint`, `lastOccurrence`, `file`, `line`, `message`, `traces`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(12, 'craft.request.getServerName()', '/Users/nick/Documents/starter_kit2/craft/templates/_layout.html:51', '2018-05-02 20:31:44', '/Users/nick/Documents/starter_kit2/craft/templates/_layout.html', 51, 'craft.request.getServerName() has been deprecated. Use craft.app.request.serverName instead.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/variables/Request.php\",\"line\":229,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"craft.request.getServerName()\\\", \\\"craft.request.getServerName() has been deprecated. Use craft.app...\\\"\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\variables\\\\Request\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Extension/Core.php\",\"line\":1605,\"class\":\"craft\\\\web\\\\twig\\\\variables\\\\Request\",\"method\":\"getServerName\",\"args\":null},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/helpers/Template.php\",\"line\":73,\"class\":null,\"method\":\"twig_get_attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig_Source, craft\\\\web\\\\twig\\\\variables\\\\Request, \\\"serverName\\\", ...\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/d1/d16bc09f5a2696f8dcf082f0c15b5a875a606e3d5ccc6ba81bb3b1bcf2602380.php\",\"line\":94,\"class\":\"craft\\\\helpers\\\\Template\",\"method\":\"attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig_Source, craft\\\\web\\\\twig\\\\variables\\\\Request, \\\"serverName\\\", ...\"},{\"objectClass\":\"__TwigTemplate_31ae712a236d3dd8fc418f1932042aa712613f58b163766fa17c5592fa2098d6\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_31ae712a236d3dd8fc418f1932042aa712613f58b163766fa17c5592fa2098d6\",\"method\":\"doDisplay\",\"args\":\"[\\\"message\\\" => \\\"Template not found: assets/img/favicon/favicon-96x96.png\\\", \\\"code\\\" => 0, \\\"file\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src...\\\", \\\"line\\\" => 70, ...], [\\\"content\\\" => [__TwigTemplate_fb0ca9446afed21b2f2779f5cfaf0549a051cd556f03bf0a599d446ab5fc25a0, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_31ae712a236d3dd8fc418f1932042aa712613f58b163766fa17c5592fa2098d6\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"message\\\" => \\\"Template not found: assets/img/favicon/favicon-96x96.png\\\", \\\"code\\\" => 0, \\\"file\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src...\\\", \\\"line\\\" => 70, ...], [\\\"content\\\" => [__TwigTemplate_fb0ca9446afed21b2f2779f5cfaf0549a051cd556f03bf0a599d446ab5fc25a0, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_31ae712a236d3dd8fc418f1932042aa712613f58b163766fa17c5592fa2098d6\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"message\\\" => \\\"Template not found: assets/img/favicon/favicon-96x96.png\\\", \\\"code\\\" => 0, \\\"file\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src...\\\", \\\"line\\\" => 70, ...], [\\\"content\\\" => [__TwigTemplate_fb0ca9446afed21b2f2779f5cfaf0549a051cd556f03bf0a599d446ab5fc25a0, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_31ae712a236d3dd8fc418f1932042aa712613f58b163766fa17c5592fa2098d6\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"message\\\" => \\\"Template not found: assets/img/favicon/favicon-96x96.png\\\", \\\"code\\\" => 0, \\\"file\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src...\\\", \\\"line\\\" => 70, ...], [\\\"content\\\" => [__TwigTemplate_fb0ca9446afed21b2f2779f5cfaf0549a051cd556f03bf0a599d446ab5fc25a0, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_31ae712a236d3dd8fc418f1932042aa712613f58b163766fa17c5592fa2098d6\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/8f/8f5fd25587c2c0d51295dabb0cda33c1b172ca8369f3ab7cf7cf907893cc1df1.php\",\"line\":31,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"message\\\" => \\\"Template not found: assets/img/favicon/favicon-96x96.png\\\", \\\"code\\\" => 0, \\\"file\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src...\\\", \\\"line\\\" => 70, ...], [\\\"content\\\" => [__TwigTemplate_fb0ca9446afed21b2f2779f5cfaf0549a051cd556f03bf0a599d446ab5fc25a0, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_fb0ca9446afed21b2f2779f5cfaf0549a051cd556f03bf0a599d446ab5fc25a0\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_fb0ca9446afed21b2f2779f5cfaf0549a051cd556f03bf0a599d446ab5fc25a0\",\"method\":\"doDisplay\",\"args\":\"[\\\"message\\\" => \\\"Template not found: assets/img/favicon/favicon-96x96.png\\\", \\\"code\\\" => 0, \\\"file\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src...\\\", \\\"line\\\" => 70, ...], [\\\"content\\\" => [__TwigTemplate_fb0ca9446afed21b2f2779f5cfaf0549a051cd556f03bf0a599d446ab5fc25a0, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_fb0ca9446afed21b2f2779f5cfaf0549a051cd556f03bf0a599d446ab5fc25a0\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"message\\\" => \\\"Template not found: assets/img/favicon/favicon-96x96.png\\\", \\\"code\\\" => 0, \\\"file\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src...\\\", \\\"line\\\" => 70, ...], [\\\"content\\\" => [__TwigTemplate_fb0ca9446afed21b2f2779f5cfaf0549a051cd556f03bf0a599d446ab5fc25a0, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_fb0ca9446afed21b2f2779f5cfaf0549a051cd556f03bf0a599d446ab5fc25a0\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"message\\\" => \\\"Template not found: assets/img/favicon/favicon-96x96.png\\\", \\\"code\\\" => 0, \\\"file\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src...\\\", \\\"line\\\" => 70, ...], [\\\"content\\\" => [__TwigTemplate_fb0ca9446afed21b2f2779f5cfaf0549a051cd556f03bf0a599d446ab5fc25a0, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_fb0ca9446afed21b2f2779f5cfaf0549a051cd556f03bf0a599d446ab5fc25a0\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"message\\\" => \\\"Template not found: assets/img/favicon/favicon-96x96.png\\\", \\\"code\\\" => 0, \\\"file\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src...\\\", \\\"line\\\" => 70, ...], []\"},{\"objectClass\":\"__TwigTemplate_fb0ca9446afed21b2f2779f5cfaf0549a051cd556f03bf0a599d446ab5fc25a0\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":375,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"message\\\" => \\\"Template not found: assets/img/favicon/favicon-96x96.png\\\", \\\"code\\\" => 0, \\\"file\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src...\\\", \\\"line\\\" => 70, ...]\"},{\"objectClass\":\"__TwigTemplate_fb0ca9446afed21b2f2779f5cfaf0549a051cd556f03bf0a599d446ab5fc25a0\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Environment.php\",\"line\":289,\"class\":\"Twig_Template\",\"method\":\"render\",\"args\":\"[\\\"message\\\" => \\\"Template not found: assets/img/favicon/favicon-96x96.png\\\", \\\"code\\\" => 0, \\\"file\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src...\\\", \\\"line\\\" => 70, ...]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/View.php\",\"line\":305,\"class\":\"Twig_Environment\",\"method\":\"render\",\"args\":\"\\\"404\\\", [\\\"message\\\" => \\\"Template not found: assets/img/favicon/favicon-96x96.png\\\", \\\"code\\\" => 0, \\\"file\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src...\\\", \\\"line\\\" => 70, ...]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/View.php\",\"line\":352,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"404\\\", [\\\"message\\\" => \\\"Template not found: assets/img/favicon/favicon-96x96.png\\\", \\\"code\\\" => 0, \\\"file\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src...\\\", \\\"line\\\" => 70, ...]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Controller.php\",\"line\":128,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"404\\\", [\\\"message\\\" => \\\"Template not found: assets/img/favicon/favicon-96x96.png\\\", \\\"code\\\" => 0, \\\"file\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src...\\\", \\\"line\\\" => 70, ...]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":209,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"404\\\", [\\\"message\\\" => \\\"Template not found: assets/img/favicon/favicon-96x96.png\\\", \\\"code\\\" => 0, \\\"file\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src...\\\", \\\"line\\\" => 70, ...]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRenderError\",\"args\":null},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRenderError\\\"], []\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Controller.php\",\"line\":76,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render-error\\\", []\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render-error\\\", []\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":274,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render-error\\\", []\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/web/ErrorHandler.php\",\"line\":108,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render-error\\\"\"},{\"objectClass\":\"craft\\\\web\\\\ErrorHandler\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/ErrorHandler.php\",\"line\":156,\"class\":\"yii\\\\web\\\\ErrorHandler\",\"method\":\"renderException\",\"args\":\"yii\\\\web\\\\NotFoundHttpException\"},{\"objectClass\":\"craft\\\\web\\\\ErrorHandler\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/ErrorHandler.php\",\"line\":111,\"class\":\"craft\\\\web\\\\ErrorHandler\",\"method\":\"renderException\",\"args\":\"yii\\\\web\\\\NotFoundHttpException\"},{\"objectClass\":\"craft\\\\web\\\\ErrorHandler\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/ErrorHandler.php\",\"line\":71,\"class\":\"yii\\\\base\\\\ErrorHandler\",\"method\":\"handleException\",\"args\":\"yii\\\\web\\\\NotFoundHttpException\"},{\"objectClass\":\"craft\\\\web\\\\ErrorHandler\",\"file\":null,\"line\":null,\"class\":\"craft\\\\web\\\\ErrorHandler\",\"method\":\"handleException\",\"args\":\"yii\\\\web\\\\NotFoundHttpException\"}]', '2018-05-02 20:31:44', '2018-05-02 20:31:44', 'cee8dd96-a042-496a-b36a-c60cc277d910'),
(13, 'craft.config.[setting]', '/Users/nick/Documents/starter_kit2/craft/templates/_layout.html:65', '2018-05-02 20:31:44', '/Users/nick/Documents/starter_kit2/craft/templates/_layout.html', 65, 'craft.config.[setting] has been deprecated. Use craft.app.config.general.setting instead.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/variables/Config.php\",\"line\":47,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"craft.config.[setting]\\\", \\\"craft.config.[setting] has been deprecated. Use craft.app.config...\\\"\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\variables\\\\Config\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Extension/Core.php\",\"line\":1525,\"class\":\"craft\\\\web\\\\twig\\\\variables\\\\Config\",\"method\":\"__get\",\"args\":\"\\\"devMode\\\"\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/helpers/Template.php\",\"line\":73,\"class\":null,\"method\":\"twig_get_attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig_Source, craft\\\\web\\\\twig\\\\variables\\\\Config, \\\"devMode\\\", ...\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/d1/d16bc09f5a2696f8dcf082f0c15b5a875a606e3d5ccc6ba81bb3b1bcf2602380.php\",\"line\":120,\"class\":\"craft\\\\helpers\\\\Template\",\"method\":\"attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig_Source, craft\\\\web\\\\twig\\\\variables\\\\Config, \\\"devMode\\\", ...\"},{\"objectClass\":\"__TwigTemplate_31ae712a236d3dd8fc418f1932042aa712613f58b163766fa17c5592fa2098d6\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_31ae712a236d3dd8fc418f1932042aa712613f58b163766fa17c5592fa2098d6\",\"method\":\"doDisplay\",\"args\":\"[\\\"message\\\" => \\\"Template not found: assets/img/favicon/favicon-96x96.png\\\", \\\"code\\\" => 0, \\\"file\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src...\\\", \\\"line\\\" => 70, ...], [\\\"content\\\" => [__TwigTemplate_fb0ca9446afed21b2f2779f5cfaf0549a051cd556f03bf0a599d446ab5fc25a0, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_31ae712a236d3dd8fc418f1932042aa712613f58b163766fa17c5592fa2098d6\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"message\\\" => \\\"Template not found: assets/img/favicon/favicon-96x96.png\\\", \\\"code\\\" => 0, \\\"file\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src...\\\", \\\"line\\\" => 70, ...], [\\\"content\\\" => [__TwigTemplate_fb0ca9446afed21b2f2779f5cfaf0549a051cd556f03bf0a599d446ab5fc25a0, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_31ae712a236d3dd8fc418f1932042aa712613f58b163766fa17c5592fa2098d6\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"message\\\" => \\\"Template not found: assets/img/favicon/favicon-96x96.png\\\", \\\"code\\\" => 0, \\\"file\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src...\\\", \\\"line\\\" => 70, ...], [\\\"content\\\" => [__TwigTemplate_fb0ca9446afed21b2f2779f5cfaf0549a051cd556f03bf0a599d446ab5fc25a0, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_31ae712a236d3dd8fc418f1932042aa712613f58b163766fa17c5592fa2098d6\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"message\\\" => \\\"Template not found: assets/img/favicon/favicon-96x96.png\\\", \\\"code\\\" => 0, \\\"file\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src...\\\", \\\"line\\\" => 70, ...], [\\\"content\\\" => [__TwigTemplate_fb0ca9446afed21b2f2779f5cfaf0549a051cd556f03bf0a599d446ab5fc25a0, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_31ae712a236d3dd8fc418f1932042aa712613f58b163766fa17c5592fa2098d6\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/8f/8f5fd25587c2c0d51295dabb0cda33c1b172ca8369f3ab7cf7cf907893cc1df1.php\",\"line\":31,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"message\\\" => \\\"Template not found: assets/img/favicon/favicon-96x96.png\\\", \\\"code\\\" => 0, \\\"file\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src...\\\", \\\"line\\\" => 70, ...], [\\\"content\\\" => [__TwigTemplate_fb0ca9446afed21b2f2779f5cfaf0549a051cd556f03bf0a599d446ab5fc25a0, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_fb0ca9446afed21b2f2779f5cfaf0549a051cd556f03bf0a599d446ab5fc25a0\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_fb0ca9446afed21b2f2779f5cfaf0549a051cd556f03bf0a599d446ab5fc25a0\",\"method\":\"doDisplay\",\"args\":\"[\\\"message\\\" => \\\"Template not found: assets/img/favicon/favicon-96x96.png\\\", \\\"code\\\" => 0, \\\"file\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src...\\\", \\\"line\\\" => 70, ...], [\\\"content\\\" => [__TwigTemplate_fb0ca9446afed21b2f2779f5cfaf0549a051cd556f03bf0a599d446ab5fc25a0, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_fb0ca9446afed21b2f2779f5cfaf0549a051cd556f03bf0a599d446ab5fc25a0\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"message\\\" => \\\"Template not found: assets/img/favicon/favicon-96x96.png\\\", \\\"code\\\" => 0, \\\"file\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src...\\\", \\\"line\\\" => 70, ...], [\\\"content\\\" => [__TwigTemplate_fb0ca9446afed21b2f2779f5cfaf0549a051cd556f03bf0a599d446ab5fc25a0, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_fb0ca9446afed21b2f2779f5cfaf0549a051cd556f03bf0a599d446ab5fc25a0\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"message\\\" => \\\"Template not found: assets/img/favicon/favicon-96x96.png\\\", \\\"code\\\" => 0, \\\"file\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src...\\\", \\\"line\\\" => 70, ...], [\\\"content\\\" => [__TwigTemplate_fb0ca9446afed21b2f2779f5cfaf0549a051cd556f03bf0a599d446ab5fc25a0, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_fb0ca9446afed21b2f2779f5cfaf0549a051cd556f03bf0a599d446ab5fc25a0\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"message\\\" => \\\"Template not found: assets/img/favicon/favicon-96x96.png\\\", \\\"code\\\" => 0, \\\"file\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src...\\\", \\\"line\\\" => 70, ...], []\"},{\"objectClass\":\"__TwigTemplate_fb0ca9446afed21b2f2779f5cfaf0549a051cd556f03bf0a599d446ab5fc25a0\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":375,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"message\\\" => \\\"Template not found: assets/img/favicon/favicon-96x96.png\\\", \\\"code\\\" => 0, \\\"file\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src...\\\", \\\"line\\\" => 70, ...]\"},{\"objectClass\":\"__TwigTemplate_fb0ca9446afed21b2f2779f5cfaf0549a051cd556f03bf0a599d446ab5fc25a0\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Environment.php\",\"line\":289,\"class\":\"Twig_Template\",\"method\":\"render\",\"args\":\"[\\\"message\\\" => \\\"Template not found: assets/img/favicon/favicon-96x96.png\\\", \\\"code\\\" => 0, \\\"file\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src...\\\", \\\"line\\\" => 70, ...]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/View.php\",\"line\":305,\"class\":\"Twig_Environment\",\"method\":\"render\",\"args\":\"\\\"404\\\", [\\\"message\\\" => \\\"Template not found: assets/img/favicon/favicon-96x96.png\\\", \\\"code\\\" => 0, \\\"file\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src...\\\", \\\"line\\\" => 70, ...]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/View.php\",\"line\":352,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"404\\\", [\\\"message\\\" => \\\"Template not found: assets/img/favicon/favicon-96x96.png\\\", \\\"code\\\" => 0, \\\"file\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src...\\\", \\\"line\\\" => 70, ...]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Controller.php\",\"line\":128,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"404\\\", [\\\"message\\\" => \\\"Template not found: assets/img/favicon/favicon-96x96.png\\\", \\\"code\\\" => 0, \\\"file\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src...\\\", \\\"line\\\" => 70, ...]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":209,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"404\\\", [\\\"message\\\" => \\\"Template not found: assets/img/favicon/favicon-96x96.png\\\", \\\"code\\\" => 0, \\\"file\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src...\\\", \\\"line\\\" => 70, ...]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRenderError\",\"args\":null},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRenderError\\\"], []\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Controller.php\",\"line\":76,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render-error\\\", []\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render-error\\\", []\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":274,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render-error\\\", []\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/web/ErrorHandler.php\",\"line\":108,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render-error\\\"\"},{\"objectClass\":\"craft\\\\web\\\\ErrorHandler\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/ErrorHandler.php\",\"line\":156,\"class\":\"yii\\\\web\\\\ErrorHandler\",\"method\":\"renderException\",\"args\":\"yii\\\\web\\\\NotFoundHttpException\"},{\"objectClass\":\"craft\\\\web\\\\ErrorHandler\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/ErrorHandler.php\",\"line\":111,\"class\":\"craft\\\\web\\\\ErrorHandler\",\"method\":\"renderException\",\"args\":\"yii\\\\web\\\\NotFoundHttpException\"},{\"objectClass\":\"craft\\\\web\\\\ErrorHandler\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/ErrorHandler.php\",\"line\":71,\"class\":\"yii\\\\base\\\\ErrorHandler\",\"method\":\"handleException\",\"args\":\"yii\\\\web\\\\NotFoundHttpException\"},{\"objectClass\":\"craft\\\\web\\\\ErrorHandler\",\"file\":null,\"line\":null,\"class\":\"craft\\\\web\\\\ErrorHandler\",\"method\":\"handleException\",\"args\":\"yii\\\\web\\\\NotFoundHttpException\"}]', '2018-05-02 20:31:44', '2018-05-02 20:31:44', 'ee6b2d34-e0b4-4b1a-ab6d-6cf81e4eebb2'),
(59, 'environmentVariables', '/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/services/Config.php:99', '2018-05-09 20:56:20', '/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/services/Config.php', 99, 'The environmentVariables config setting has been renamed to aliases.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/config/GeneralConfig.php\",\"line\":674,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"environmentVariables\\\", \\\"The environmentVariables config setting has been renamed to alia...\\\"\"},{\"objectClass\":\"craft\\\\config\\\\GeneralConfig\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/services/Config.php\",\"line\":99,\"class\":\"craft\\\\config\\\\GeneralConfig\",\"method\":\"__construct\",\"args\":\"[\\\"extraAllowedFileExtensions\\\" => \\\"eps\\\", \\\"siteUrl\\\" => \\\"http://starter.web\\\", \\\"enableCsrfProtection\\\" => true, \\\"omitScriptNameInUrls\\\" => true, ...]\"},{\"objectClass\":\"craft\\\\services\\\\Config\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/services/Config.php\",\"line\":145,\"class\":\"craft\\\\services\\\\Config\",\"method\":\"getConfigSettings\",\"args\":\"\\\"general\\\"\"},{\"objectClass\":\"craft\\\\services\\\\Config\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/config/app.web.php\",\"line\":19,\"class\":\"craft\\\\services\\\\Config\",\"method\":\"getGeneral\",\"args\":null},{\"objectClass\":null,\"file\":null,\"line\":null,\"class\":null,\"method\":\"{closure}\",\"args\":null},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/di/Container.php\",\"line\":503,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"Closure, []\"},{\"objectClass\":\"yii\\\\di\\\\Container\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/BaseYii.php\",\"line\":351,\"class\":\"yii\\\\di\\\\Container\",\"method\":\"invoke\",\"args\":\"Closure, []\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/di/ServiceLocator.php\",\"line\":137,\"class\":\"yii\\\\BaseYii\",\"method\":\"createObject\",\"args\":\"Closure\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Module.php\",\"line\":742,\"class\":\"yii\\\\di\\\\ServiceLocator\",\"method\":\"get\",\"args\":\"\\\"request\\\", true\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":327,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"get\",\"args\":\"\\\"request\\\", true\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/web/Application.php\",\"line\":160,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"get\",\"args\":\"\\\"request\\\"\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/config/app.php\",\"line\":235,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"getRequest\",\"args\":null},{\"objectClass\":null,\"file\":null,\"line\":null,\"class\":null,\"method\":\"{closure}\",\"args\":null},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/di/Container.php\",\"line\":503,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"Closure, []\"},{\"objectClass\":\"yii\\\\di\\\\Container\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/BaseYii.php\",\"line\":351,\"class\":\"yii\\\\di\\\\Container\",\"method\":\"invoke\",\"args\":\"Closure, []\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/di/ServiceLocator.php\",\"line\":137,\"class\":\"yii\\\\BaseYii\",\"method\":\"createObject\",\"args\":\"Closure\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Module.php\",\"line\":742,\"class\":\"yii\\\\di\\\\ServiceLocator\",\"method\":\"get\",\"args\":\"\\\"log\\\", true\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":327,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"get\",\"args\":\"\\\"log\\\", true\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Application.php\",\"line\":508,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"get\",\"args\":\"\\\"log\\\"\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/base/ApplicationTrait.php\",\"line\":1115,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"getLog\",\"args\":null},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":97,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"_preInit\",\"args\":null},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/BaseObject.php\",\"line\":109,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"init\",\"args\":null},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Application.php\",\"line\":206,\"class\":\"yii\\\\base\\\\BaseObject\",\"method\":\"__construct\",\"args\":\"[\\\"env\\\" => \\\"starter.web\\\", \\\"components\\\" => [\\\"config\\\" => craft\\\\services\\\\Config, \\\"api\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Api\\\"], \\\"assets\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Assets\\\"], \\\"assetIndexer\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\AssetIndexer\\\"], ...], \\\"id\\\" => \\\"CraftCMS\\\", \\\"name\\\" => \\\"Craft CMS\\\", ...]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":88,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"__construct\",\"args\":\"[\\\"env\\\" => \\\"starter.web\\\", \\\"components\\\" => [\\\"config\\\" => craft\\\\services\\\\Config, \\\"api\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Api\\\"], \\\"assets\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Assets\\\"], \\\"assetIndexer\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\AssetIndexer\\\"], ...], \\\"id\\\" => \\\"CraftCMS\\\", \\\"name\\\" => \\\"Craft CMS\\\", ...]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":null,\"line\":null,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"__construct\",\"args\":\"[\\\"vendorPath\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor\\\", \\\"env\\\" => \\\"starter.web\\\", \\\"components\\\" => [\\\"config\\\" => craft\\\\services\\\\Config, \\\"api\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Api\\\"], \\\"assets\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Assets\\\"], \\\"assetIndexer\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\AssetIndexer\\\"], ...], \\\"id\\\" => \\\"CraftCMS\\\", ...]\"},{\"objectClass\":\"ReflectionClass\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/di/Container.php\",\"line\":383,\"class\":\"ReflectionClass\",\"method\":\"newInstanceArgs\",\"args\":\"[[\\\"vendorPath\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor\\\", \\\"env\\\" => \\\"starter.web\\\", \\\"components\\\" => [\\\"config\\\" => craft\\\\services\\\\Config, \\\"api\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Api\\\"], \\\"assets\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Assets\\\"], \\\"assetIndexer\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\AssetIndexer\\\"], ...], \\\"id\\\" => \\\"CraftCMS\\\", ...]]\"},{\"objectClass\":\"yii\\\\di\\\\Container\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/di/Container.php\",\"line\":156,\"class\":\"yii\\\\di\\\\Container\",\"method\":\"build\",\"args\":\"\\\"craft\\\\web\\\\Application\\\", [], [\\\"vendorPath\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor\\\", \\\"env\\\" => \\\"starter.web\\\", \\\"components\\\" => [\\\"config\\\" => craft\\\\services\\\\Config, \\\"api\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Api\\\"], \\\"assets\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Assets\\\"], \\\"assetIndexer\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\AssetIndexer\\\"], ...], \\\"id\\\" => \\\"CraftCMS\\\", ...]\"},{\"objectClass\":\"yii\\\\di\\\\Container\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/BaseYii.php\",\"line\":349,\"class\":\"yii\\\\di\\\\Container\",\"method\":\"get\",\"args\":\"\\\"craft\\\\web\\\\Application\\\", [], [\\\"vendorPath\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor\\\", \\\"env\\\" => \\\"starter.web\\\", \\\"components\\\" => [\\\"config\\\" => craft\\\\services\\\\Config, \\\"api\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Api\\\"], \\\"assets\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Assets\\\"], \\\"assetIndexer\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\AssetIndexer\\\"], ...], \\\"id\\\" => \\\"CraftCMS\\\", ...]\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/bootstrap/bootstrap.php\",\"line\":249,\"class\":\"yii\\\\BaseYii\",\"method\":\"createObject\",\"args\":\"[\\\"vendorPath\\\" => \\\"/Users/nick/Documents/starter_kit2/craft/vendor\\\", \\\"env\\\" => \\\"starter.web\\\", \\\"components\\\" => [\\\"config\\\" => craft\\\\services\\\\Config, \\\"api\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Api\\\"], \\\"assets\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\Assets\\\"], \\\"assetIndexer\\\" => [\\\"class\\\" => \\\"craft\\\\services\\\\AssetIndexer\\\"], ...], \\\"id\\\" => \\\"CraftCMS\\\", ...]\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/bootstrap/web.php\",\"line\":42,\"class\":null,\"method\":\"require\",\"args\":\"\\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/boo...\\\"\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/public/index.php\",\"line\":14,\"class\":null,\"method\":\"require\",\"args\":\"\\\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/boo...\\\"\"}]', '2018-05-09 20:56:20', '2018-05-09 20:56:20', '450b0735-e438-403b-acd4-58501c39d510'),
(267, 'DateTime::year()', '/Users/nick/Documents/starter_kit2/craft/templates/_layout.html:41', '2018-05-09 18:38:47', '/Users/nick/Documents/starter_kit2/craft/templates/_layout.html', 41, 'DateTime::year is deprecated. Use the |date(\'Y\') filter instead.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/helpers/Template.php\",\"line\":278,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"DateTime::year()\\\", \\\"DateTime::year is deprecated. Use the |date(\'Y\') filter instead.\\\"\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/helpers/Template.php\",\"line\":68,\"class\":\"craft\\\\helpers\\\\Template\",\"method\":\"_dateTimeAttribute\",\"args\":\"DateTime, \\\"year\\\", \\\"any\\\"\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/0b/0b55b978a6e47c0f05931667141d73fcb9351cf208684014a51ed98cb459f431.php\",\"line\":88,\"class\":\"craft\\\\helpers\\\\Template\",\"method\":\"attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig_Source, DateTime, \\\"year\\\", ...\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/6e/6e396d50f8cc2a8976bc3bebc936308c67167fee615453f7958ff9f142720a45.php\",\"line\":28,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":375,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Environment.php\",\"line\":289,\"class\":\"Twig_Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/View.php\",\"line\":305,\"class\":\"Twig_Environment\",\"method\":\"render\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/View.php\",\"line\":352,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Controller.php\",\"line\":128,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":78,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Controller.php\",\"line\":76,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":274,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":263,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/public/index.php\",\"line\":15,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2018-05-09 18:38:47', '2018-05-09 18:38:47', 'c630d54e-30d0-401d-95f3-7fa88ed39052');
INSERT INTO `craft_deprecationerrors` (`id`, `key`, `fingerprint`, `lastOccurrence`, `file`, `line`, `message`, `traces`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(268, 'craft.request.getServerName()', '/Users/nick/Documents/starter_kit2/craft/templates/_layout.html:41', '2018-05-09 18:38:47', '/Users/nick/Documents/starter_kit2/craft/templates/_layout.html', 41, 'craft.request.getServerName() has been deprecated. Use craft.app.request.serverName instead.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/variables/Request.php\",\"line\":229,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"craft.request.getServerName()\\\", \\\"craft.request.getServerName() has been deprecated. Use craft.app...\\\"\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\variables\\\\Request\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Extension/Core.php\",\"line\":1605,\"class\":\"craft\\\\web\\\\twig\\\\variables\\\\Request\",\"method\":\"getServerName\",\"args\":null},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/helpers/Template.php\",\"line\":73,\"class\":null,\"method\":\"twig_get_attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig_Source, craft\\\\web\\\\twig\\\\variables\\\\Request, \\\"serverName\\\", ...\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/0b/0b55b978a6e47c0f05931667141d73fcb9351cf208684014a51ed98cb459f431.php\",\"line\":90,\"class\":\"craft\\\\helpers\\\\Template\",\"method\":\"attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig_Source, craft\\\\web\\\\twig\\\\variables\\\\Request, \\\"serverName\\\", ...\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/6e/6e396d50f8cc2a8976bc3bebc936308c67167fee615453f7958ff9f142720a45.php\",\"line\":28,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":375,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Environment.php\",\"line\":289,\"class\":\"Twig_Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/View.php\",\"line\":305,\"class\":\"Twig_Environment\",\"method\":\"render\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/View.php\",\"line\":352,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Controller.php\",\"line\":128,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":78,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Controller.php\",\"line\":76,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":274,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":263,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/public/index.php\",\"line\":15,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2018-05-09 18:38:47', '2018-05-09 18:38:47', 'a4a2a598-3fd6-4e9a-98ea-2c93f7da27c7'),
(269, 'craft.config.[setting]', '/Users/nick/Documents/starter_kit2/craft/templates/_layout.html:55', '2018-05-09 18:38:47', '/Users/nick/Documents/starter_kit2/craft/templates/_layout.html', 55, 'craft.config.[setting] has been deprecated. Use craft.app.config.general.setting instead.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/variables/Config.php\",\"line\":47,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"craft.config.[setting]\\\", \\\"craft.config.[setting] has been deprecated. Use craft.app.config...\\\"\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\variables\\\\Config\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Extension/Core.php\",\"line\":1525,\"class\":\"craft\\\\web\\\\twig\\\\variables\\\\Config\",\"method\":\"__get\",\"args\":\"\\\"devMode\\\"\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/helpers/Template.php\",\"line\":73,\"class\":null,\"method\":\"twig_get_attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig_Source, craft\\\\web\\\\twig\\\\variables\\\\Config, \\\"devMode\\\", ...\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/0b/0b55b978a6e47c0f05931667141d73fcb9351cf208684014a51ed98cb459f431.php\",\"line\":116,\"class\":\"craft\\\\helpers\\\\Template\",\"method\":\"attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig_Source, craft\\\\web\\\\twig\\\\variables\\\\Config, \\\"devMode\\\", ...\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/6e/6e396d50f8cc2a8976bc3bebc936308c67167fee615453f7958ff9f142720a45.php\",\"line\":28,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":375,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Environment.php\",\"line\":289,\"class\":\"Twig_Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/View.php\",\"line\":305,\"class\":\"Twig_Environment\",\"method\":\"render\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/View.php\",\"line\":352,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Controller.php\",\"line\":128,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":78,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Controller.php\",\"line\":76,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":274,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":263,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/public/index.php\",\"line\":15,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2018-05-09 18:38:47', '2018-05-09 18:38:47', 'e8b0364d-5aa4-4089-afe2-4d0c7ef70178'),
(641, 'ElementQuery::getIterator()', '/Users/nick/Documents/starter_kit2/craft/templates/_includes/_pageContent.html:2', '2018-05-07 20:05:57', '/Users/nick/Documents/starter_kit2/craft/templates/_includes/_pageContent.html', 2, 'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":403,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/92/92acfb712027b5d36b3fdc65b09a66043453ed2f7636804048cc5bba0939e394.php\",\"line\":28,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_c827cb525959c565b316c3b17285ccada5436f897c4f058d17ce30b4d41112f6\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_c827cb525959c565b316c3b17285ccada5436f897c4f058d17ce30b4d41112f6\",\"method\":\"doDisplay\",\"args\":\"[\\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, ...], []\"},{\"objectClass\":\"__TwigTemplate_c827cb525959c565b316c3b17285ccada5436f897c4f058d17ce30b4d41112f6\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, ...], []\"},{\"objectClass\":\"__TwigTemplate_c827cb525959c565b316c3b17285ccada5436f897c4f058d17ce30b4d41112f6\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, ...], []\"},{\"objectClass\":\"__TwigTemplate_c827cb525959c565b316c3b17285ccada5436f897c4f058d17ce30b4d41112f6\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, ...], []\"},{\"objectClass\":\"__TwigTemplate_c827cb525959c565b316c3b17285ccada5436f897c4f058d17ce30b4d41112f6\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/6e/6e396d50f8cc2a8976bc3bebc936308c67167fee615453f7958ff9f142720a45.php\",\"line\":67,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, ...]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":189,\"class\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"method\":\"block_content\",\"args\":\"[\\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/0b/0b55b978a6e47c0f05931667141d73fcb9351cf208684014a51ed98cb459f431.php\",\"line\":81,\"class\":\"Twig_Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/6e/6e396d50f8cc2a8976bc3bebc936308c67167fee615453f7958ff9f142720a45.php\",\"line\":28,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":375,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Environment.php\",\"line\":289,\"class\":\"Twig_Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/View.php\",\"line\":305,\"class\":\"Twig_Environment\",\"method\":\"render\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/View.php\",\"line\":352,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Controller.php\",\"line\":128,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":78,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Controller.php\",\"line\":76,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":274,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":263,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/public/index.php\",\"line\":15,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2018-05-07 20:05:57', '2018-05-07 20:05:57', '8c611bbe-538f-413f-893f-a431bc91c302');
INSERT INTO `craft_deprecationerrors` (`id`, `key`, `fingerprint`, `lastOccurrence`, `file`, `line`, `message`, `traces`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(877, 'ElementQuery::first()', '/Users/nick/Documents/starter_kit2/craft/templates/_includes/_pageContent.html:21', '2018-05-07 20:04:06', '/Users/nick/Documents/starter_kit2/craft/templates/_includes/_pageContent.html', 21, 'The first() function used to query for elements is now deprecated. Use one() instead.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":1244,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::first()\\\", \\\"The first() function used to query for elements is now deprecate...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\AssetQuery\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Extension/Core.php\",\"line\":1605,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"first\",\"args\":null},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/helpers/Template.php\",\"line\":73,\"class\":null,\"method\":\"twig_get_attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig_Source, craft\\\\elements\\\\db\\\\AssetQuery, \\\"first\\\", ...\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/92/92acfb712027b5d36b3fdc65b09a66043453ed2f7636804048cc5bba0939e394.php\",\"line\":75,\"class\":\"craft\\\\helpers\\\\Template\",\"method\":\"attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig_Source, craft\\\\elements\\\\db\\\\AssetQuery, \\\"first\\\", ...\"},{\"objectClass\":\"__TwigTemplate_c827cb525959c565b316c3b17285ccada5436f897c4f058d17ce30b4d41112f6\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_c827cb525959c565b316c3b17285ccada5436f897c4f058d17ce30b4d41112f6\",\"method\":\"doDisplay\",\"args\":\"[\\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, ...], []\"},{\"objectClass\":\"__TwigTemplate_c827cb525959c565b316c3b17285ccada5436f897c4f058d17ce30b4d41112f6\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, ...], []\"},{\"objectClass\":\"__TwigTemplate_c827cb525959c565b316c3b17285ccada5436f897c4f058d17ce30b4d41112f6\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, ...], []\"},{\"objectClass\":\"__TwigTemplate_c827cb525959c565b316c3b17285ccada5436f897c4f058d17ce30b4d41112f6\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, ...], []\"},{\"objectClass\":\"__TwigTemplate_c827cb525959c565b316c3b17285ccada5436f897c4f058d17ce30b4d41112f6\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/6e/6e396d50f8cc2a8976bc3bebc936308c67167fee615453f7958ff9f142720a45.php\",\"line\":67,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, ...]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":189,\"class\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"method\":\"block_content\",\"args\":\"[\\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/0b/0b55b978a6e47c0f05931667141d73fcb9351cf208684014a51ed98cb459f431.php\",\"line\":81,\"class\":\"Twig_Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/6e/6e396d50f8cc2a8976bc3bebc936308c67167fee615453f7958ff9f142720a45.php\",\"line\":28,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":375,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Environment.php\",\"line\":289,\"class\":\"Twig_Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/View.php\",\"line\":305,\"class\":\"Twig_Environment\",\"method\":\"render\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/View.php\",\"line\":352,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Controller.php\",\"line\":128,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":78,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Controller.php\",\"line\":76,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":274,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":263,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/public/index.php\",\"line\":15,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2018-05-07 20:04:06', '2018-05-07 20:04:06', '78c14941-f224-46a1-81c3-ca834d7bdf37'),
(1357, 'ElementQuery::getIterator()', '/Users/nick/Documents/starter_kit2/craft/templates/_includes/_pageContent.html:21', '2018-05-07 20:00:13', '/Users/nick/Documents/starter_kit2/craft/templates/_includes/_pageContent.html', 21, 'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":403,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\AssetQuery\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/92/92acfb712027b5d36b3fdc65b09a66043453ed2f7636804048cc5bba0939e394.php\",\"line\":77,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_c827cb525959c565b316c3b17285ccada5436f897c4f058d17ce30b4d41112f6\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_c827cb525959c565b316c3b17285ccada5436f897c4f058d17ce30b4d41112f6\",\"method\":\"doDisplay\",\"args\":\"[\\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, ...], []\"},{\"objectClass\":\"__TwigTemplate_c827cb525959c565b316c3b17285ccada5436f897c4f058d17ce30b4d41112f6\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, ...], []\"},{\"objectClass\":\"__TwigTemplate_c827cb525959c565b316c3b17285ccada5436f897c4f058d17ce30b4d41112f6\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, ...], []\"},{\"objectClass\":\"__TwigTemplate_c827cb525959c565b316c3b17285ccada5436f897c4f058d17ce30b4d41112f6\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, ...], []\"},{\"objectClass\":\"__TwigTemplate_c827cb525959c565b316c3b17285ccada5436f897c4f058d17ce30b4d41112f6\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/6e/6e396d50f8cc2a8976bc3bebc936308c67167fee615453f7958ff9f142720a45.php\",\"line\":67,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, ...]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":189,\"class\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"method\":\"block_content\",\"args\":\"[\\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/0b/0b55b978a6e47c0f05931667141d73fcb9351cf208684014a51ed98cb459f431.php\",\"line\":81,\"class\":\"Twig_Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/6e/6e396d50f8cc2a8976bc3bebc936308c67167fee615453f7958ff9f142720a45.php\",\"line\":28,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":375,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Environment.php\",\"line\":289,\"class\":\"Twig_Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/View.php\",\"line\":305,\"class\":\"Twig_Environment\",\"method\":\"render\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/View.php\",\"line\":352,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Controller.php\",\"line\":128,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":78,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Controller.php\",\"line\":76,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":274,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":263,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/public/index.php\",\"line\":15,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2018-05-07 20:00:13', '2018-05-07 20:00:13', '221cca83-e302-4aa4-a5fc-cb08c5c8ea0d'),
(1536, 'ElementQuery::getIterator()', '/Users/nick/Documents/starter_kit2/craft/templates/global/header.html:5', '2018-05-09 20:06:45', '/Users/nick/Documents/starter_kit2/craft/templates/global/header.html', 5, 'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":403,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\AssetQuery\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/d2/d2ffea01b8fd158d4ae5547118b0a8d9a1b16f5ee89b63348eec53cff2df35f9.php\",\"line\":48,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_4911995a7afe6ad8c0a63a574ab39781be3757ed07a7686ca4240c808fd8a861\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_4911995a7afe6ad8c0a63a574ab39781be3757ed07a7686ca4240c808fd8a861\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], []\"},{\"objectClass\":\"__TwigTemplate_4911995a7afe6ad8c0a63a574ab39781be3757ed07a7686ca4240c808fd8a861\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], []\"},{\"objectClass\":\"__TwigTemplate_4911995a7afe6ad8c0a63a574ab39781be3757ed07a7686ca4240c808fd8a861\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], []\"},{\"objectClass\":\"__TwigTemplate_4911995a7afe6ad8c0a63a574ab39781be3757ed07a7686ca4240c808fd8a861\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], []\"},{\"objectClass\":\"__TwigTemplate_4911995a7afe6ad8c0a63a574ab39781be3757ed07a7686ca4240c808fd8a861\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/0b/0b55b978a6e47c0f05931667141d73fcb9351cf208684014a51ed98cb459f431.php\",\"line\":79,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/6e/6e396d50f8cc2a8976bc3bebc936308c67167fee615453f7958ff9f142720a45.php\",\"line\":28,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":375,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Environment.php\",\"line\":289,\"class\":\"Twig_Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/View.php\",\"line\":305,\"class\":\"Twig_Environment\",\"method\":\"render\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/View.php\",\"line\":352,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Controller.php\",\"line\":128,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":78,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Controller.php\",\"line\":76,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":276,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":265,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/public/index.php\",\"line\":15,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2018-05-09 20:06:45', '2018-05-09 20:06:45', 'fca09e13-0b48-49fe-8862-1711027c9a0d');
INSERT INTO `craft_deprecationerrors` (`id`, `key`, `fingerprint`, `lastOccurrence`, `file`, `line`, `message`, `traces`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1538, 'DateTime::year()', '/Users/nick/Documents/starter_kit2/craft/templates/_layout.html:43', '2018-05-09 18:54:52', '/Users/nick/Documents/starter_kit2/craft/templates/_layout.html', 43, 'DateTime::year is deprecated. Use the |date(\'Y\') filter instead.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/helpers/Template.php\",\"line\":278,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"DateTime::year()\\\", \\\"DateTime::year is deprecated. Use the |date(\'Y\') filter instead.\\\"\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/helpers/Template.php\",\"line\":68,\"class\":\"craft\\\\helpers\\\\Template\",\"method\":\"_dateTimeAttribute\",\"args\":\"DateTime, \\\"year\\\", \\\"any\\\"\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/0b/0b55b978a6e47c0f05931667141d73fcb9351cf208684014a51ed98cb459f431.php\",\"line\":84,\"class\":\"craft\\\\helpers\\\\Template\",\"method\":\"attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig_Source, DateTime, \\\"year\\\", ...\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/6e/6e396d50f8cc2a8976bc3bebc936308c67167fee615453f7958ff9f142720a45.php\",\"line\":28,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":375,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Environment.php\",\"line\":289,\"class\":\"Twig_Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/View.php\",\"line\":305,\"class\":\"Twig_Environment\",\"method\":\"render\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/View.php\",\"line\":352,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Controller.php\",\"line\":128,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":78,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Controller.php\",\"line\":76,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":274,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":263,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/public/index.php\",\"line\":15,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2018-05-09 18:54:52', '2018-05-09 18:54:52', '089363ca-8a64-4b18-83ed-f0e7f7fcc07a'),
(1539, 'craft.request.getServerName()', '/Users/nick/Documents/starter_kit2/craft/templates/_layout.html:43', '2018-05-09 18:54:52', '/Users/nick/Documents/starter_kit2/craft/templates/_layout.html', 43, 'craft.request.getServerName() has been deprecated. Use craft.app.request.serverName instead.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/variables/Request.php\",\"line\":229,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"craft.request.getServerName()\\\", \\\"craft.request.getServerName() has been deprecated. Use craft.app...\\\"\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\variables\\\\Request\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Extension/Core.php\",\"line\":1605,\"class\":\"craft\\\\web\\\\twig\\\\variables\\\\Request\",\"method\":\"getServerName\",\"args\":null},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/helpers/Template.php\",\"line\":73,\"class\":null,\"method\":\"twig_get_attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig_Source, craft\\\\web\\\\twig\\\\variables\\\\Request, \\\"serverName\\\", ...\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/0b/0b55b978a6e47c0f05931667141d73fcb9351cf208684014a51ed98cb459f431.php\",\"line\":86,\"class\":\"craft\\\\helpers\\\\Template\",\"method\":\"attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig_Source, craft\\\\web\\\\twig\\\\variables\\\\Request, \\\"serverName\\\", ...\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/6e/6e396d50f8cc2a8976bc3bebc936308c67167fee615453f7958ff9f142720a45.php\",\"line\":28,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":375,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Environment.php\",\"line\":289,\"class\":\"Twig_Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/View.php\",\"line\":305,\"class\":\"Twig_Environment\",\"method\":\"render\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/View.php\",\"line\":352,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Controller.php\",\"line\":128,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":78,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Controller.php\",\"line\":76,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":274,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":263,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/public/index.php\",\"line\":15,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2018-05-09 18:54:52', '2018-05-09 18:54:52', '26408a30-34da-42ad-b059-700c74317a55'),
(1540, 'craft.config.[setting]', '/Users/nick/Documents/starter_kit2/craft/templates/_layout.html:57', '2018-05-09 18:54:52', '/Users/nick/Documents/starter_kit2/craft/templates/_layout.html', 57, 'craft.config.[setting] has been deprecated. Use craft.app.config.general.setting instead.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/variables/Config.php\",\"line\":47,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"craft.config.[setting]\\\", \\\"craft.config.[setting] has been deprecated. Use craft.app.config...\\\"\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\variables\\\\Config\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Extension/Core.php\",\"line\":1525,\"class\":\"craft\\\\web\\\\twig\\\\variables\\\\Config\",\"method\":\"__get\",\"args\":\"\\\"devMode\\\"\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/helpers/Template.php\",\"line\":73,\"class\":null,\"method\":\"twig_get_attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig_Source, craft\\\\web\\\\twig\\\\variables\\\\Config, \\\"devMode\\\", ...\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/0b/0b55b978a6e47c0f05931667141d73fcb9351cf208684014a51ed98cb459f431.php\",\"line\":112,\"class\":\"craft\\\\helpers\\\\Template\",\"method\":\"attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig_Source, craft\\\\web\\\\twig\\\\variables\\\\Config, \\\"devMode\\\", ...\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/6e/6e396d50f8cc2a8976bc3bebc936308c67167fee615453f7958ff9f142720a45.php\",\"line\":28,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":375,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Environment.php\",\"line\":289,\"class\":\"Twig_Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/View.php\",\"line\":305,\"class\":\"Twig_Environment\",\"method\":\"render\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/View.php\",\"line\":352,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Controller.php\",\"line\":128,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":78,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Controller.php\",\"line\":76,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":274,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":263,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/public/index.php\",\"line\":15,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2018-05-09 18:54:52', '2018-05-09 18:54:52', '3e1f36d1-4a15-4326-901d-11e01d5c3c69');
INSERT INTO `craft_deprecationerrors` (`id`, `key`, `fingerprint`, `lastOccurrence`, `file`, `line`, `message`, `traces`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1648, 'craft.config.[setting]', '/Users/nick/Documents/starter_kit2/craft/templates/_layout.html:61', '2018-05-09 19:19:24', '/Users/nick/Documents/starter_kit2/craft/templates/_layout.html', 61, 'craft.config.[setting] has been deprecated. Use craft.app.config.general.setting instead.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/variables/Config.php\",\"line\":47,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"craft.config.[setting]\\\", \\\"craft.config.[setting] has been deprecated. Use craft.app.config...\\\"\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\variables\\\\Config\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Extension/Core.php\",\"line\":1525,\"class\":\"craft\\\\web\\\\twig\\\\variables\\\\Config\",\"method\":\"__get\",\"args\":\"\\\"devMode\\\"\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/helpers/Template.php\",\"line\":73,\"class\":null,\"method\":\"twig_get_attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig_Source, craft\\\\web\\\\twig\\\\variables\\\\Config, \\\"devMode\\\", ...\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/0b/0b55b978a6e47c0f05931667141d73fcb9351cf208684014a51ed98cb459f431.php\",\"line\":110,\"class\":\"craft\\\\helpers\\\\Template\",\"method\":\"attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig_Source, craft\\\\web\\\\twig\\\\variables\\\\Config, \\\"devMode\\\", ...\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/6e/6e396d50f8cc2a8976bc3bebc936308c67167fee615453f7958ff9f142720a45.php\",\"line\":28,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":375,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Environment.php\",\"line\":289,\"class\":\"Twig_Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/View.php\",\"line\":305,\"class\":\"Twig_Environment\",\"method\":\"render\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/View.php\",\"line\":352,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Controller.php\",\"line\":128,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":78,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Controller.php\",\"line\":76,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":274,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":263,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/public/index.php\",\"line\":15,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2018-05-09 19:19:24', '2018-05-09 19:19:24', '078c8392-36aa-497d-93eb-842e6f95790c'),
(1780, 'ElementQuery::getIterator()', '/Users/nick/Documents/starter_kit2/craft/templates/global/footer.html:12', '2018-05-09 19:25:11', '/Users/nick/Documents/starter_kit2/craft/templates/global/footer.html', 12, 'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":403,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\AssetQuery\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/dd/dd705e781ab080f328d0ec95417ce593af4f33fcf9d73e108c3fdfbfe9fac235.php\",\"line\":67,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_28829aa91e26a3be14ea7f7f1acd7e65b6804d2689b94c653fd47a7887b78494\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_28829aa91e26a3be14ea7f7f1acd7e65b6804d2689b94c653fd47a7887b78494\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], []\"},{\"objectClass\":\"__TwigTemplate_28829aa91e26a3be14ea7f7f1acd7e65b6804d2689b94c653fd47a7887b78494\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], []\"},{\"objectClass\":\"__TwigTemplate_28829aa91e26a3be14ea7f7f1acd7e65b6804d2689b94c653fd47a7887b78494\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], []\"},{\"objectClass\":\"__TwigTemplate_28829aa91e26a3be14ea7f7f1acd7e65b6804d2689b94c653fd47a7887b78494\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], []\"},{\"objectClass\":\"__TwigTemplate_28829aa91e26a3be14ea7f7f1acd7e65b6804d2689b94c653fd47a7887b78494\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/0b/0b55b978a6e47c0f05931667141d73fcb9351cf208684014a51ed98cb459f431.php\",\"line\":90,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/6e/6e396d50f8cc2a8976bc3bebc936308c67167fee615453f7958ff9f142720a45.php\",\"line\":28,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":375,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Environment.php\",\"line\":289,\"class\":\"Twig_Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/View.php\",\"line\":305,\"class\":\"Twig_Environment\",\"method\":\"render\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/View.php\",\"line\":352,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Controller.php\",\"line\":128,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":78,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Controller.php\",\"line\":76,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":274,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":263,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/public/index.php\",\"line\":15,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2018-05-09 19:25:11', '2018-05-09 19:25:11', '0da2c1d1-39a2-4066-aea1-c9298cdde27c'),
(1995, 'craft.config.[setting]', '/Users/nick/Documents/starter_kit2/craft/templates/_layout.html:64', '2018-05-09 19:20:31', '/Users/nick/Documents/starter_kit2/craft/templates/_layout.html', 64, 'craft.config.[setting] has been deprecated. Use craft.app.config.general.setting instead.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/variables/Config.php\",\"line\":47,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"craft.config.[setting]\\\", \\\"craft.config.[setting] has been deprecated. Use craft.app.config...\\\"\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\variables\\\\Config\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Extension/Core.php\",\"line\":1525,\"class\":\"craft\\\\web\\\\twig\\\\variables\\\\Config\",\"method\":\"__get\",\"args\":\"\\\"devMode\\\"\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/helpers/Template.php\",\"line\":73,\"class\":null,\"method\":\"twig_get_attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig_Source, craft\\\\web\\\\twig\\\\variables\\\\Config, \\\"devMode\\\", ...\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/0b/0b55b978a6e47c0f05931667141d73fcb9351cf208684014a51ed98cb459f431.php\",\"line\":118,\"class\":\"craft\\\\helpers\\\\Template\",\"method\":\"attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig_Source, craft\\\\web\\\\twig\\\\variables\\\\Config, \\\"devMode\\\", ...\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/6e/6e396d50f8cc2a8976bc3bebc936308c67167fee615453f7958ff9f142720a45.php\",\"line\":28,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":375,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Environment.php\",\"line\":289,\"class\":\"Twig_Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/View.php\",\"line\":305,\"class\":\"Twig_Environment\",\"method\":\"render\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/View.php\",\"line\":352,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Controller.php\",\"line\":128,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":78,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Controller.php\",\"line\":76,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":274,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":263,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/public/index.php\",\"line\":15,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2018-05-09 19:20:31', '2018-05-09 19:20:31', 'c98d1cf9-54b8-45fa-9c04-e4d3780d8c7d');
INSERT INTO `craft_deprecationerrors` (`id`, `key`, `fingerprint`, `lastOccurrence`, `file`, `line`, `message`, `traces`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2005, 'craft.config.[setting]', '/Users/nick/Documents/starter_kit2/craft/templates/_layout.html:63', '2018-05-09 20:06:46', '/Users/nick/Documents/starter_kit2/craft/templates/_layout.html', 63, 'craft.config.[setting] has been deprecated. Use craft.app.config.general.setting instead.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/variables/Config.php\",\"line\":47,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"craft.config.[setting]\\\", \\\"craft.config.[setting] has been deprecated. Use craft.app.config...\\\"\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\variables\\\\Config\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Extension/Core.php\",\"line\":1525,\"class\":\"craft\\\\web\\\\twig\\\\variables\\\\Config\",\"method\":\"__get\",\"args\":\"\\\"devMode\\\"\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/helpers/Template.php\",\"line\":73,\"class\":null,\"method\":\"twig_get_attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig_Source, craft\\\\web\\\\twig\\\\variables\\\\Config, \\\"devMode\\\", ...\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/0b/0b55b978a6e47c0f05931667141d73fcb9351cf208684014a51ed98cb459f431.php\",\"line\":116,\"class\":\"craft\\\\helpers\\\\Template\",\"method\":\"attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig_Source, craft\\\\web\\\\twig\\\\variables\\\\Config, \\\"devMode\\\", ...\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/6e/6e396d50f8cc2a8976bc3bebc936308c67167fee615453f7958ff9f142720a45.php\",\"line\":28,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":375,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Environment.php\",\"line\":289,\"class\":\"Twig_Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/View.php\",\"line\":305,\"class\":\"Twig_Environment\",\"method\":\"render\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/View.php\",\"line\":352,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Controller.php\",\"line\":128,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":78,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Controller.php\",\"line\":76,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":276,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":265,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/public/index.php\",\"line\":15,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2018-05-09 20:06:46', '2018-05-09 20:06:46', 'd2d8e51a-c4bd-4b6d-9e0e-05f47ae4cffd'),
(2284, 'ElementQuery::first()', '/Users/nick/Documents/starter_kit2/craft/templates/global/footer.html:3', '2018-05-09 19:44:44', '/Users/nick/Documents/starter_kit2/craft/templates/global/footer.html', 3, 'The first() function used to query for elements is now deprecated. Use one() instead.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":1244,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::first()\\\", \\\"The first() function used to query for elements is now deprecate...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\AssetQuery\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Extension/Core.php\",\"line\":1605,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"first\",\"args\":null},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/helpers/Template.php\",\"line\":73,\"class\":null,\"method\":\"twig_get_attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig_Source, craft\\\\elements\\\\db\\\\AssetQuery, \\\"first\\\", ...\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/dd/dd705e781ab080f328d0ec95417ce593af4f33fcf9d73e108c3fdfbfe9fac235.php\",\"line\":27,\"class\":\"craft\\\\helpers\\\\Template\",\"method\":\"attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig_Source, craft\\\\elements\\\\db\\\\AssetQuery, \\\"first\\\", ...\"},{\"objectClass\":\"__TwigTemplate_28829aa91e26a3be14ea7f7f1acd7e65b6804d2689b94c653fd47a7887b78494\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_28829aa91e26a3be14ea7f7f1acd7e65b6804d2689b94c653fd47a7887b78494\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], []\"},{\"objectClass\":\"__TwigTemplate_28829aa91e26a3be14ea7f7f1acd7e65b6804d2689b94c653fd47a7887b78494\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], []\"},{\"objectClass\":\"__TwigTemplate_28829aa91e26a3be14ea7f7f1acd7e65b6804d2689b94c653fd47a7887b78494\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], []\"},{\"objectClass\":\"__TwigTemplate_28829aa91e26a3be14ea7f7f1acd7e65b6804d2689b94c653fd47a7887b78494\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], []\"},{\"objectClass\":\"__TwigTemplate_28829aa91e26a3be14ea7f7f1acd7e65b6804d2689b94c653fd47a7887b78494\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/0b/0b55b978a6e47c0f05931667141d73fcb9351cf208684014a51ed98cb459f431.php\",\"line\":90,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/6e/6e396d50f8cc2a8976bc3bebc936308c67167fee615453f7958ff9f142720a45.php\",\"line\":28,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":375,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Environment.php\",\"line\":289,\"class\":\"Twig_Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/View.php\",\"line\":305,\"class\":\"Twig_Environment\",\"method\":\"render\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/View.php\",\"line\":352,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Controller.php\",\"line\":128,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":78,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Controller.php\",\"line\":76,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":274,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":263,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/public/index.php\",\"line\":15,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2018-05-09 19:44:44', '2018-05-09 19:44:44', '4db59105-9413-4db4-bf68-507776c1b4ec'),
(2598, 'ElementQuery::first()', '/Users/nick/Documents/starter_kit2/craft/templates/global/footer.html:2', '2018-05-09 20:06:46', '/Users/nick/Documents/starter_kit2/craft/templates/global/footer.html', 2, 'The first() function used to query for elements is now deprecated. Use one() instead.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":1244,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::first()\\\", \\\"The first() function used to query for elements is now deprecate...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\AssetQuery\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Extension/Core.php\",\"line\":1605,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"first\",\"args\":null},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/helpers/Template.php\",\"line\":73,\"class\":null,\"method\":\"twig_get_attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig_Source, craft\\\\elements\\\\db\\\\AssetQuery, \\\"first\\\", ...\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/dd/dd705e781ab080f328d0ec95417ce593af4f33fcf9d73e108c3fdfbfe9fac235.php\",\"line\":26,\"class\":\"craft\\\\helpers\\\\Template\",\"method\":\"attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig_Source, craft\\\\elements\\\\db\\\\AssetQuery, \\\"first\\\", ...\"},{\"objectClass\":\"__TwigTemplate_28829aa91e26a3be14ea7f7f1acd7e65b6804d2689b94c653fd47a7887b78494\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_28829aa91e26a3be14ea7f7f1acd7e65b6804d2689b94c653fd47a7887b78494\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], []\"},{\"objectClass\":\"__TwigTemplate_28829aa91e26a3be14ea7f7f1acd7e65b6804d2689b94c653fd47a7887b78494\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], []\"},{\"objectClass\":\"__TwigTemplate_28829aa91e26a3be14ea7f7f1acd7e65b6804d2689b94c653fd47a7887b78494\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], []\"},{\"objectClass\":\"__TwigTemplate_28829aa91e26a3be14ea7f7f1acd7e65b6804d2689b94c653fd47a7887b78494\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], []\"},{\"objectClass\":\"__TwigTemplate_28829aa91e26a3be14ea7f7f1acd7e65b6804d2689b94c653fd47a7887b78494\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/0b/0b55b978a6e47c0f05931667141d73fcb9351cf208684014a51ed98cb459f431.php\",\"line\":90,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c8f6a75816676f1d23aa009e2fb160e6173719f3594920f1bce23b2a2488a19f\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/storage/runtime/compiled_templates/6e/6e396d50f8cc2a8976bc3bebc936308c67167fee615453f7958ff9f142720a45.php\",\"line\":28,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":390,\"class\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":367,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Template.php\",\"line\":375,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_ed8117da6e0d70a76d31a31707bcf19b9ada9bde2d98d93e74be9e97a1c3ca01\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/twig/twig/lib/Twig/Environment.php\",\"line\":289,\"class\":\"Twig_Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/View.php\",\"line\":305,\"class\":\"Twig_Environment\",\"method\":\"render\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/View.php\",\"line\":352,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Controller.php\",\"line\":128,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":78,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"index.html\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Controller.php\",\"line\":76,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":276,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index.html\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":265,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/craft/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/nick/Documents/starter_kit2/public/index.php\",\"line\":15,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2018-05-09 20:06:46', '2018-05-09 20:06:46', 'f0aadb9d-8e7d-4717-924e-89cf20f9c756');

-- --------------------------------------------------------

--
-- Table structure for table `craft_elementindexsettings`
--

CREATE TABLE `craft_elementindexsettings` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_elements`
--

CREATE TABLE `craft_elements` (
  `id` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_elements`
--

INSERT INTO `craft_elements` (`id`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 'craft\\elements\\User', 1, 0, '2018-05-02 20:31:26', '2018-05-02 20:31:26', '89f45b03-5cb5-4ffb-b8ff-9762a1d787ea'),
(2, 1, 'craft\\elements\\Entry', 1, 0, '2018-05-02 20:42:28', '2018-05-09 19:51:57', '2f926fa0-3b77-4b8d-8a23-03a5069d3ef3'),
(3, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2018-05-07 19:39:42', '2018-05-09 19:51:57', '145b81ed-1605-4d18-a2fd-40fbcf306336'),
(4, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2018-05-07 19:39:42', '2018-05-09 19:51:57', '038f77f4-8ae3-4fa4-8e0d-29330f7aebfc'),
(5, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2018-05-07 19:39:42', '2018-05-09 19:51:57', '7a2b3f1a-6981-43b0-a944-d61075285fc3'),
(6, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2018-05-07 19:39:42', '2018-05-09 19:51:57', 'fafcde8e-7ed5-4626-bf89-1aedf4804b3c'),
(11, 10, 'craft\\elements\\MatrixBlock', 1, 0, '2018-05-07 20:18:08', '2018-05-09 19:51:57', '5ab98c0c-f2d3-4375-adba-15ba62508093'),
(12, 11, 'craft\\elements\\GlobalSet', 1, 0, '2018-05-07 20:19:03', '2018-05-09 18:47:43', 'c2246d3f-7d05-4a74-9996-ddd0cfef84b7'),
(13, 12, 'craft\\elements\\GlobalSet', 1, 0, '2018-05-07 20:19:06', '2018-05-09 19:28:26', '68fe8888-5195-4685-9e90-131f2a5ba43e'),
(15, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2018-05-07 20:22:07', '2018-05-09 19:51:57', 'df846058-801d-4337-81b0-66bfd15b1a1c'),
(17, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2018-05-07 20:41:15', '2018-05-09 19:51:57', '4a9a96c1-8719-41ac-b06a-7b93a77d20d4'),
(19, 9, 'craft\\elements\\Asset', 1, 0, '2018-05-09 19:23:45', '2018-05-09 19:23:45', '52aabfd4-1230-4b38-9c8d-125a4bcb463f');

-- --------------------------------------------------------

--
-- Table structure for table `craft_elements_sites`
--

CREATE TABLE `craft_elements_sites` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_elements_sites`
--

INSERT INTO `craft_elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, NULL, 1, '2018-05-02 20:31:26', '2018-05-02 20:31:26', '93590951-48e8-403b-8852-90af058d53cb'),
(2, 2, 1, 'home-page', '__home__', 1, '2018-05-02 20:42:28', '2018-05-09 19:51:57', '9e5fe65f-cc68-4244-8a18-4a4d503c6aa1'),
(3, 3, 1, NULL, NULL, 1, '2018-05-07 19:39:42', '2018-05-09 19:51:57', '028ff17e-ded6-4b7d-b267-0c84bd32ec2c'),
(4, 4, 1, NULL, NULL, 1, '2018-05-07 19:39:42', '2018-05-09 19:51:57', '6fd0302a-9864-4dbf-a2f2-1a5f9584962e'),
(5, 5, 1, NULL, NULL, 1, '2018-05-07 19:39:42', '2018-05-09 19:51:57', '11f3eb39-3000-41db-a9b3-3e5c5b1e7e05'),
(6, 6, 1, NULL, NULL, 1, '2018-05-07 19:39:42', '2018-05-09 19:51:57', '29ebd98d-5b7d-4073-82d7-32dad3f16ed1'),
(11, 11, 1, NULL, NULL, 1, '2018-05-07 20:18:08', '2018-05-09 19:51:57', 'fb4af5b3-10d9-4761-ab94-1a69e1b8861a'),
(12, 12, 1, NULL, NULL, 1, '2018-05-07 20:19:03', '2018-05-09 18:47:43', 'b64d491c-83e3-4636-b8ae-b40b8678587c'),
(13, 13, 1, NULL, NULL, 1, '2018-05-07 20:19:06', '2018-05-09 19:28:26', 'bdefe40e-5c38-45df-ab54-1e3bc00cb202'),
(15, 15, 1, NULL, NULL, 1, '2018-05-07 20:22:07', '2018-05-09 19:51:57', '353626e4-d8a1-4e3b-b136-3be781b3130a'),
(17, 17, 1, NULL, NULL, 1, '2018-05-07 20:41:15', '2018-05-09 19:51:57', 'a36d9750-c7d1-45df-8f5d-1c9349282a0d'),
(19, 19, 1, NULL, NULL, 1, '2018-05-09 19:23:45', '2018-05-09 19:23:45', '9896cb1a-ae8e-416d-b355-e84ae2f87401');

-- --------------------------------------------------------

--
-- Table structure for table `craft_entries`
--

CREATE TABLE `craft_entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_entries`
--

INSERT INTO `craft_entries` (`id`, `sectionId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 1, 1, NULL, '2018-05-02 20:42:28', NULL, '2018-05-02 20:42:28', '2018-05-09 19:51:57', 'ae7775af-d769-4fcb-b46e-df2a77ac1c7e');

-- --------------------------------------------------------

--
-- Table structure for table `craft_entrydrafts`
--

CREATE TABLE `craft_entrydrafts` (
  `id` int(11) NOT NULL,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `notes` text,
  `data` mediumtext NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_entrytypes`
--

CREATE TABLE `craft_entrytypes` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleLabel` varchar(255) DEFAULT 'Title',
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_entrytypes`
--

INSERT INTO `craft_entrytypes` (`id`, `sectionId`, `fieldLayoutId`, `name`, `handle`, `hasTitleField`, `titleLabel`, `titleFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, 'Home Page', 'homepage', 0, NULL, '{section.name|raw}', 1, '2018-05-02 20:42:28', '2018-05-07 20:17:02', '575e829a-d112-4988-889b-da0863cc2603');

-- --------------------------------------------------------

--
-- Table structure for table `craft_entryversions`
--

CREATE TABLE `craft_entryversions` (
  `id` int(11) NOT NULL,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `siteId` int(11) NOT NULL,
  `num` smallint(6) UNSIGNED NOT NULL,
  `notes` text,
  `data` mediumtext NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_entryversions`
--

INSERT INTO `craft_entryversions` (`id`, `entryId`, `sectionId`, `creatorId`, `siteId`, `num`, `notes`, `data`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 2, 1, 1, 1, 1, 'Revision from May 7, 2018, 12:37:46 PM', '{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Home Page\",\"slug\":\"home-page\",\"postDate\":1525293748,\"expiryDate\":null,\"enabled\":\"1\",\"newParentId\":null,\"fields\":{\"2\":[]}}', '2018-05-07 19:39:41', '2018-05-07 19:39:41', 'bfe69956-37d5-4648-b37e-4081cd5addb8'),
(2, 2, 1, 1, 1, 2, '', '{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Home Page\",\"slug\":\"home-page\",\"postDate\":1525293748,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"2\":{\"3\":{\"type\":\"body\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"bodyText\":\"<p>This is body text.</p>\\n\"}},\"4\":{\"type\":\"buttonExternalLink\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"buttonTitle\":\"Link to google\",\"buttonUrl\":\"www.google.com\"}},\"5\":{\"type\":\"video\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"videoUrl\":\"https://www.youtube.com/watch?v=Btw_99WDFVA\",\"videoCaption\":\"carl malone\"}},\"6\":{\"type\":\"pullQuote\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"pullQuote\":\"Hey my name is nick\",\"pullQuoteAuthor\":\"Nick Pappas\"}}}}}', '2018-05-07 19:39:42', '2018-05-07 19:39:42', 'cc426583-0a34-4ba1-b843-3bcb8ba9c015'),
(3, 2, 1, 1, 1, 3, '', '{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Home Page\",\"slug\":\"home-page\",\"postDate\":1525293748,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"2\":{\"3\":{\"type\":\"body\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"bodyText\":\"<p>This is body text.</p>\\n\"}},\"4\":{\"type\":\"buttonExternalLink\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"buttonTitle\":\"Link to google\",\"buttonUrl\":\"www.google.com\"}},\"5\":{\"type\":\"video\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"videoUrl\":\"https://www.youtube.com/watch?v=Btw_99WDFVA\",\"videoCaption\":\"carl malone\"}},\"6\":{\"type\":\"pullQuote\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"pullQuote\":\"Hey my name is nick\",\"pullQuoteAuthor\":\"Nick Pappas\"}},\"8\":{\"type\":\"image\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"7\"]}}}}}', '2018-05-07 19:46:15', '2018-05-07 19:46:15', 'c23fe140-bc7d-4582-aec2-6c8182f036f5'),
(4, 2, 1, 1, 1, 4, '', '{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Home Page\",\"slug\":\"home-page\",\"postDate\":1525293748,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"2\":{\"3\":{\"type\":\"body\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"bodyText\":\"<p>This is body text.</p>\\n\"}},\"4\":{\"type\":\"buttonExternalLink\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"buttonTitle\":\"Link to google\",\"buttonUrl\":\"www.google.com\"}},\"5\":{\"type\":\"video\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"videoUrl\":\"https://www.youtube.com/watch?v=Btw_99WDFVA\",\"videoCaption\":\"carl malone\"}},\"6\":{\"type\":\"pullQuote\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"pullQuote\":\"Hey my name is nick\",\"pullQuoteAuthor\":\"Nick Pappas\"}},\"8\":{\"type\":\"image\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"7\"],\"caption\":\"Browns suck\"}}}}}', '2018-05-07 19:49:01', '2018-05-07 19:49:01', '2fa8c224-e28b-435b-a592-76cd827fcb37'),
(5, 2, 1, 1, 1, 5, '', '{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Home Page\",\"slug\":\"home-page\",\"postDate\":1525293748,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"2\":{\"3\":{\"type\":\"body\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"bodyText\":\"<p>This is body text.</p>\\n\"}},\"4\":{\"type\":\"buttonExternalLink\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"buttonTitle\":\"Link to google\",\"buttonUrl\":\"www.google.com\"}},\"5\":{\"type\":\"video\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"videoUrl\":\"https://www.youtube.com/watch?v=Btw_99WDFVA\",\"videoCaption\":\"carl malone\"}},\"6\":{\"type\":\"pullQuote\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"pullQuote\":\"Hey my name is nick\",\"pullQuoteAuthor\":\"Nick Pappas\"}},\"8\":{\"type\":\"image\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"7\"],\"caption\":\"Browns suck\"}}}}}', '2018-05-07 19:49:07', '2018-05-07 19:49:07', '0ec815f2-82e2-4084-93c9-a7a80d3ccb5e'),
(6, 2, 1, 1, 1, 6, '', '{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Home Page\",\"slug\":\"home-page\",\"postDate\":1525293748,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"2\":{\"3\":{\"type\":\"body\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"bodyText\":\"<p>This is body text.</p>\\n\"}},\"4\":{\"type\":\"buttonExternalLink\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"buttonTitle\":\"Link to google\",\"buttonUrl\":\"www.google.com\"}},\"5\":{\"type\":\"video\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"videoUrl\":\"https://www.youtube.com/watch?v=Btw_99WDFVA\",\"videoCaption\":\"carl malone\"}},\"6\":{\"type\":\"pullQuote\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"pullQuote\":\"Hey my name is nick\",\"pullQuoteAuthor\":\"Nick Pappas\"}},\"8\":{\"type\":\"image\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"9\"],\"caption\":\"Browns suck\"}}}}}', '2018-05-07 19:52:36', '2018-05-07 19:52:36', '61dbc193-96fc-4085-8e25-cc8b04efba69'),
(7, 2, 1, 1, 1, 7, '', '{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Home Page\",\"slug\":\"home-page\",\"postDate\":1525293748,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"2\":{\"3\":{\"type\":\"body\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"bodyText\":\"<p>This is body text.</p>\\n\"}},\"4\":{\"type\":\"buttonExternalLink\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"buttonTitle\":\"Link to google\",\"buttonUrl\":\"www.google.com\"}},\"5\":{\"type\":\"video\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"videoUrl\":\"https://www.youtube.com/watch?v=Btw_99WDFVA\",\"videoCaption\":\"carl malone\"}},\"6\":{\"type\":\"pullQuote\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"pullQuote\":\"Hey my name is nick\",\"pullQuoteAuthor\":\"Nick Pappas\"}},\"8\":{\"type\":\"image\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"9\"],\"caption\":\"Browns suck\"}},\"10\":{\"type\":\"image\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"7\"],\"caption\":\"asdsadsda\"}}}}}', '2018-05-07 19:56:00', '2018-05-07 19:56:00', '8784d4f7-256a-4a5b-81a7-2a8e5e730735'),
(8, 2, 1, 1, 1, 8, '', '{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Home Page\",\"slug\":\"home-page\",\"postDate\":1525293748,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"2\":{\"3\":{\"type\":\"body\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"bodyText\":\"<p>This is body text.</p>\\n\"}},\"4\":{\"type\":\"buttonExternalLink\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"buttonTitle\":\"Link to google\",\"buttonUrl\":\"www.google.com\"}},\"5\":{\"type\":\"video\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"videoUrl\":\"https://www.youtube.com/watch?v=Btw_99WDFVA\",\"videoCaption\":\"carl malone\"}},\"6\":{\"type\":\"pullQuote\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"pullQuote\":\"Hey my name is nick\",\"pullQuoteAuthor\":\"Nick Pappas\"}},\"8\":{\"type\":\"image\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"9\"]}},\"10\":{\"type\":\"image\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"7\"]}}}}}', '2018-05-07 20:01:31', '2018-05-07 20:01:31', 'fe2f5fc3-f94b-4018-9df2-3f389936215e'),
(9, 2, 1, 1, 1, 9, '', '{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Home Page\",\"slug\":\"home-page\",\"postDate\":1525293748,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"2\":{\"3\":{\"type\":\"body\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"bodyText\":\"<p>This is body text.</p>\\n\"}},\"4\":{\"type\":\"buttonExternalLink\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"buttonTitle\":\"Link to google\",\"buttonUrl\":\"www.google.com\"}},\"5\":{\"type\":\"video\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"videoUrl\":\"https://www.youtube.com/watch?v=Btw_99WDFVA\",\"videoCaption\":\"carl malone\"}},\"6\":{\"type\":\"pullQuote\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"pullQuote\":\"Hey my name is nick\",\"pullQuoteAuthor\":\"Nick Pappas\"}},\"8\":{\"type\":\"image\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"7\"]}},\"10\":{\"type\":\"image\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[]}}}}}', '2018-05-07 20:02:37', '2018-05-07 20:02:37', '0ebb1662-f937-433d-ae40-939cd3d26fa3'),
(10, 2, 1, 1, 1, 10, '', '{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Home Page\",\"slug\":\"home-page\",\"postDate\":1525293748,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"2\":{\"3\":{\"type\":\"body\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"bodyText\":\"<p>This is body text.</p>\\n\"}},\"4\":{\"type\":\"buttonExternalLink\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"buttonTitle\":\"Link to google\",\"buttonUrl\":\"www.google.com\"}},\"5\":{\"type\":\"video\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"videoUrl\":\"https://www.youtube.com/watch?v=Btw_99WDFVA\",\"videoCaption\":\"carl malone\"}},\"6\":{\"type\":\"pullQuote\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"pullQuote\":\"Hey my name is nick\",\"pullQuoteAuthor\":\"Nick Pappas\"}},\"8\":{\"type\":\"image\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"9\"]}},\"10\":{\"type\":\"image\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[]}}}}}', '2018-05-07 20:13:54', '2018-05-07 20:13:54', '6efc642c-4b1d-48f4-8b1d-f419749a005b'),
(11, 2, 1, 1, 1, 11, '', '{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Home Page\",\"slug\":\"home-page\",\"postDate\":1525293748,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"2\":{\"3\":{\"type\":\"body\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"bodyText\":\"<p>This is body text.</p>\\n\"}},\"4\":{\"type\":\"buttonExternalLink\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"buttonTitle\":\"Link to google\",\"buttonUrl\":\"www.google.com\"}},\"5\":{\"type\":\"video\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"videoUrl\":\"https://www.youtube.com/watch?v=Btw_99WDFVA\",\"videoCaption\":\"carl malone\"}},\"6\":{\"type\":\"pullQuote\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"pullQuote\":\"Hey my name is nick\",\"pullQuoteAuthor\":\"Nick Pappas\"}},\"8\":{\"type\":\"image\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"9\"]}},\"10\":{\"type\":\"image\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[]}}},\"18\":{\"11\":{\"type\":\"socialBlock\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"socialName\":\"Facebook\",\"socialHandle\":\"https://www.google.com\"}}}}}', '2018-05-07 20:18:08', '2018-05-07 20:18:08', '595a18b9-f607-4afe-ad8f-778ef8b1fc5b'),
(12, 2, 1, 1, 1, 12, '', '{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Home Page\",\"slug\":\"home-page\",\"postDate\":1525293748,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"2\":{\"3\":{\"type\":\"body\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"bodyText\":\"<p>This is body text.</p>\\n\"}},\"4\":{\"type\":\"buttonExternalLink\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"buttonTitle\":\"Link to google\",\"buttonUrl\":\"www.google.com\"}},\"5\":{\"type\":\"video\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"videoUrl\":\"https://www.youtube.com/watch?v=Btw_99WDFVA\",\"videoCaption\":\"carl malone\"}},\"6\":{\"type\":\"pullQuote\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"pullQuote\":\"Hey my name is nick\",\"pullQuoteAuthor\":\"Nick Pappas\"}},\"15\":{\"type\":\"image\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"14\"]}}},\"18\":{\"11\":{\"type\":\"socialBlock\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"socialName\":\"Facebook\",\"socialHandle\":\"https://www.google.com\"}}}}}', '2018-05-07 20:22:07', '2018-05-07 20:22:07', '4757c0d9-c4e9-4332-bc2a-8b3d8316065a'),
(13, 2, 1, 1, 1, 13, '', '{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Home Page\",\"slug\":\"home-page\",\"postDate\":1525293748,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"2\":{\"3\":{\"type\":\"body\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"bodyText\":\"<p>This is body text.</p>\\n\"}},\"4\":{\"type\":\"buttonExternalLink\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"buttonTitle\":\"Link to google\",\"buttonUrl\":\"www.google.com\"}},\"5\":{\"type\":\"video\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"videoUrl\":\"https://www.youtube.com/watch?v=Btw_99WDFVA\",\"videoCaption\":\"carl malone\"}},\"6\":{\"type\":\"pullQuote\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"pullQuote\":\"Hey my name is nick\",\"pullQuoteAuthor\":\"Nick Pappas\"}},\"15\":{\"type\":\"image\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"14\"]}},\"17\":{\"type\":\"image\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"16\"]}}},\"18\":{\"11\":{\"type\":\"socialBlock\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"socialName\":\"Facebook\",\"socialHandle\":\"https://www.google.com\"}}}}}', '2018-05-07 20:41:15', '2018-05-07 20:41:15', 'b3d0558f-607f-4a68-bcc2-73bd128cd178'),
(14, 2, 1, 1, 1, 14, '', '{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Home Page\",\"slug\":\"home-page\",\"postDate\":1525293748,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"2\":{\"3\":{\"type\":\"body\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"bodyText\":\"<p>This is body text.</p>\\n\"}},\"4\":{\"type\":\"buttonExternalLink\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"buttonTitle\":\"Link to google\",\"buttonUrl\":\"www.google.com\"}},\"5\":{\"type\":\"video\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"videoUrl\":\"https://www.youtube.com/watch?v=Btw_99WDFVA\",\"videoCaption\":\"carl malone\"}},\"6\":{\"type\":\"pullQuote\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"pullQuote\":\"Hey my name is nick\",\"pullQuoteAuthor\":\"Nick Pappas\"}},\"15\":{\"type\":\"image\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"18\"]}},\"17\":{\"type\":\"image\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"16\"]}}},\"18\":{\"11\":{\"type\":\"socialBlock\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"socialName\":\"Facebook\",\"socialHandle\":\"https://www.google.com\"}}}}}', '2018-05-09 19:22:40', '2018-05-09 19:22:40', 'eda6ee73-89cc-4707-b542-2a41e75caff3'),
(15, 2, 1, 1, 1, 15, '', '{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Home Page\",\"slug\":\"home-page\",\"postDate\":1525293748,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"2\":{\"3\":{\"type\":\"body\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"bodyText\":\"<p>This is body text.</p>\\n\"}},\"4\":{\"type\":\"buttonExternalLink\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"buttonTitle\":\"Link to google\",\"buttonUrl\":\"www.google.com\"}},\"5\":{\"type\":\"video\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"videoUrl\":\"https://www.youtube.com/watch?v=Btw_99WDFVA\",\"videoCaption\":\"carl malone\"}},\"6\":{\"type\":\"pullQuote\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"pullQuote\":\"Hey my name is nick\",\"pullQuoteAuthor\":\"Nick Pappas\"}},\"15\":{\"type\":\"image\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"19\"]}},\"17\":{\"type\":\"image\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[]}}},\"18\":{\"11\":{\"type\":\"socialBlock\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"socialName\":\"Facebook\",\"socialHandle\":\"https://www.google.com\"}}}}}', '2018-05-09 19:23:49', '2018-05-09 19:23:49', '7d36306c-24d5-4c04-a949-f66e109b0ed6'),
(16, 2, 1, 1, 1, 16, '', '{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Home Page\",\"slug\":\"home-page\",\"postDate\":1525293748,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"2\":{\"3\":{\"type\":\"body\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"bodyText\":\"<p>This is body text.</p>\\n\"}},\"4\":{\"type\":\"buttonExternalLink\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"buttonTitle\":\"Link to google\",\"buttonUrl\":\"www.google.com\"}},\"5\":{\"type\":\"video\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"videoUrl\":\"https://www.youtube.com/watch?v=Btw_99WDFVA\",\"videoCaption\":\"carl malone\"}},\"6\":{\"type\":\"pullQuote\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"pullQuote\":\"Hey my name is nick\",\"pullQuoteAuthor\":\"Nick Pappas\"}},\"15\":{\"type\":\"image\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"19\"]}},\"17\":{\"type\":\"image\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[]}}},\"18\":{\"11\":{\"type\":\"socialBlock\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"socialName\":\"Facebook\",\"socialHandle\":\"https://www.google.com\"}}}}}', '2018-05-09 19:51:57', '2018-05-09 19:51:57', 'caac8596-6869-4bb5-837e-cfeafb0b64c6');

-- --------------------------------------------------------

--
-- Table structure for table `craft_fieldgroups`
--

CREATE TABLE `craft_fieldgroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_fieldgroups`
--

INSERT INTO `craft_fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Common', '2018-05-02 20:31:26', '2018-05-02 20:31:26', '169f571a-5810-482d-b786-6cc57d569b46');

-- --------------------------------------------------------

--
-- Table structure for table `craft_fieldlayoutfields`
--

CREATE TABLE `craft_fieldlayoutfields` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_fieldlayoutfields`
--

INSERT INTO `craft_fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(93, 10, 51, 19, 0, 1, '2018-05-07 20:15:47', '2018-05-07 20:15:47', '2f2d6312-5f6d-4e1d-bb2c-cd8261295650'),
(94, 10, 51, 20, 0, 2, '2018-05-07 20:15:47', '2018-05-07 20:15:47', '37dbc80c-83da-46e3-b965-db9e2a248aa4'),
(95, 1, 52, 2, 0, 1, '2018-05-07 20:17:02', '2018-05-07 20:17:02', 'f44b9085-0291-41cb-9268-1b4bf0f6f9eb'),
(96, 1, 52, 18, 0, 2, '2018-05-07 20:17:02', '2018-05-07 20:17:02', 'c98c51c6-ba25-41e1-b7d0-2d93fb952453'),
(97, 11, 53, 21, 0, 1, '2018-05-09 18:46:01', '2018-05-09 18:46:01', '7f43c6bd-675a-473f-bded-1ab23eb965f6'),
(101, 12, 55, 25, 0, 1, '2018-05-09 19:03:14', '2018-05-09 19:03:14', 'ddcfc650-c733-40b9-b69a-f6d2efb482d0'),
(102, 12, 55, 22, 0, 2, '2018-05-09 19:03:14', '2018-05-09 19:03:14', '366e8903-ffcd-4f43-b7bc-bfd90d19d24b'),
(103, 12, 55, 23, 0, 3, '2018-05-09 19:03:14', '2018-05-09 19:03:14', '0ff32275-2c7b-48d6-9a71-8282c5ba6163'),
(104, 12, 55, 24, 0, 4, '2018-05-09 19:03:14', '2018-05-09 19:03:14', 'd1ba3089-944e-4622-886e-fc2e7e539867'),
(105, 2, 56, 3, 0, 1, '2018-05-09 19:23:10', '2018-05-09 19:23:10', 'dc7805e7-23e1-4a88-92e6-63253c642e97'),
(106, 3, 57, 4, 0, 1, '2018-05-09 19:23:10', '2018-05-09 19:23:10', '786d0e52-91a1-4984-9aea-100dce9f6495'),
(107, 3, 57, 5, 0, 2, '2018-05-09 19:23:10', '2018-05-09 19:23:10', '83fb21cb-129b-4983-9269-19874108c512'),
(108, 4, 58, 6, 0, 1, '2018-05-09 19:23:10', '2018-05-09 19:23:10', 'b13c28a0-b3df-4e8a-bb9c-75906e91113d'),
(109, 4, 58, 7, 0, 2, '2018-05-09 19:23:10', '2018-05-09 19:23:10', '1cc7b8f9-d253-4676-9b28-dbed4ab3dace'),
(110, 5, 59, 17, 0, 1, '2018-05-09 19:23:10', '2018-05-09 19:23:10', '50109b31-1c5c-4a2f-bee4-a5fff626fe8f'),
(111, 6, 60, 9, 0, 1, '2018-05-09 19:23:10', '2018-05-09 19:23:10', '1df95a86-34c3-4935-aeef-1ad09f5e5c66'),
(112, 6, 60, 10, 0, 2, '2018-05-09 19:23:10', '2018-05-09 19:23:10', 'c09fec7f-fc97-4ef5-955d-edf7f83591bf'),
(113, 7, 61, 11, 0, 1, '2018-05-09 19:23:11', '2018-05-09 19:23:11', 'bdbb54e0-524e-4db4-a902-9d26e28ad81d'),
(114, 7, 61, 12, 0, 2, '2018-05-09 19:23:11', '2018-05-09 19:23:11', '62a2351a-54d4-4827-bd2b-8e5bc84b6724'),
(115, 8, 62, 13, 0, 1, '2018-05-09 19:23:11', '2018-05-09 19:23:11', '551332a5-dcf5-40e4-a0f0-66cdf96decdc'),
(116, 8, 62, 14, 0, 2, '2018-05-09 19:23:11', '2018-05-09 19:23:11', 'b59bda61-c4e9-4b05-85f0-10b66d5c0e59'),
(117, 8, 62, 15, 0, 3, '2018-05-09 19:23:11', '2018-05-09 19:23:11', '08b60bd1-6c4b-492a-9c30-e346cb982d4c');

-- --------------------------------------------------------

--
-- Table structure for table `craft_fieldlayouts`
--

CREATE TABLE `craft_fieldlayouts` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_fieldlayouts`
--

INSERT INTO `craft_fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'craft\\elements\\Entry', '2018-05-02 20:42:28', '2018-05-07 20:17:02', '889b4735-9f44-468d-a20b-52ba58e8c496'),
(2, 'craft\\elements\\MatrixBlock', '2018-05-07 19:30:58', '2018-05-09 19:23:10', 'c3482c33-a57b-4351-9585-63e81b0ed316'),
(3, 'craft\\elements\\MatrixBlock', '2018-05-07 19:30:58', '2018-05-09 19:23:10', 'f629a9c7-89dc-4f89-a994-492fa2187b4a'),
(4, 'craft\\elements\\MatrixBlock', '2018-05-07 19:30:58', '2018-05-09 19:23:10', '9738cea7-5770-4354-902b-c76be71a5acc'),
(5, 'craft\\elements\\MatrixBlock', '2018-05-07 19:30:58', '2018-05-09 19:23:10', 'be64468c-17d8-496c-84c5-825bceb7603c'),
(6, 'craft\\elements\\MatrixBlock', '2018-05-07 19:30:58', '2018-05-09 19:23:10', 'bb98cafc-ffe3-4e1d-9a91-354a719fb741'),
(7, 'craft\\elements\\MatrixBlock', '2018-05-07 19:30:58', '2018-05-09 19:23:11', '7f8be928-2542-412d-9a6e-d5af863ad7dc'),
(8, 'craft\\elements\\MatrixBlock', '2018-05-07 19:30:58', '2018-05-09 19:23:11', '405cdbda-2931-4a69-b5ac-e912a05fbd6b'),
(9, 'craft\\elements\\Asset', '2018-05-07 19:45:09', '2018-05-09 19:25:10', 'cf0a419a-66e5-4213-9752-6a27e8ae11e8'),
(10, 'craft\\elements\\MatrixBlock', '2018-05-07 20:15:47', '2018-05-07 20:15:47', '9df65db5-c17d-42a4-92bf-52dec0dcdcd0'),
(11, 'craft\\elements\\GlobalSet', '2018-05-07 20:19:03', '2018-05-09 18:46:01', '2e7fa616-70ba-4bb8-a1f0-075a3c9acbeb'),
(12, 'craft\\elements\\GlobalSet', '2018-05-07 20:19:06', '2018-05-09 19:03:14', '29e36447-3f7c-47fc-9e20-d80605f9f77d');

-- --------------------------------------------------------

--
-- Table structure for table `craft_fieldlayouttabs`
--

CREATE TABLE `craft_fieldlayouttabs` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_fieldlayouttabs`
--

INSERT INTO `craft_fieldlayouttabs` (`id`, `layoutId`, `name`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(51, 10, 'Content', 1, '2018-05-07 20:15:47', '2018-05-07 20:15:47', '020d520e-8af6-4b6e-b039-ab3316d380d7'),
(52, 1, 'Tab 1', 1, '2018-05-07 20:17:02', '2018-05-07 20:17:02', '8590e4af-dbcb-4a83-b317-ef7ea4030ff0'),
(53, 11, 'Tab 1', 1, '2018-05-09 18:46:01', '2018-05-09 18:46:01', 'ba3bdfab-6108-4079-8f44-dcfa0658df4d'),
(55, 12, 'Tab 1', 1, '2018-05-09 19:03:14', '2018-05-09 19:03:14', '30543e4d-1abd-400c-9ac9-55e0611bba47'),
(56, 2, 'Content', 1, '2018-05-09 19:23:10', '2018-05-09 19:23:10', '1321e7bf-5148-4027-bf92-455d764bfc5f'),
(57, 3, 'Content', 1, '2018-05-09 19:23:10', '2018-05-09 19:23:10', '25d2552f-187a-45a7-b6c5-0b5991a15822'),
(58, 4, 'Content', 1, '2018-05-09 19:23:10', '2018-05-09 19:23:10', '6852e5ae-0101-4154-abe9-938af265facd'),
(59, 5, 'Content', 1, '2018-05-09 19:23:10', '2018-05-09 19:23:10', 'd356d655-c07e-4370-a4e0-f4451150bc40'),
(60, 6, 'Content', 1, '2018-05-09 19:23:10', '2018-05-09 19:23:10', '704fa5b2-8adf-40ed-911f-4199563ef126'),
(61, 7, 'Content', 1, '2018-05-09 19:23:11', '2018-05-09 19:23:11', '3d6743f8-6938-4688-92ab-5f6660749b2b'),
(62, 8, 'Content', 1, '2018-05-09 19:23:11', '2018-05-09 19:23:11', '8e0a8ad2-7077-4eba-aeef-ff1aaec32b00');

-- --------------------------------------------------------

--
-- Table structure for table `craft_fields`
--

CREATE TABLE `craft_fields` (
  `id` int(11) NOT NULL,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `instructions` text,
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_fields`
--

INSERT INTO `craft_fields` (`id`, `groupId`, `name`, `handle`, `context`, `instructions`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'Body', 'body', 'global', '', 'none', NULL, 'craft\\redactor\\Field', '{\"redactorConfig\":\"\",\"purifierConfig\":\"\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"1\",\"columnType\":\"text\",\"availableVolumes\":\"*\",\"availableTransforms\":\"*\"}', '2018-05-02 20:46:29', '2018-05-02 20:46:29', '33457c4e-d15a-47cb-8aa9-7440cf88498c'),
(2, 1, 'Page Content', 'pageContent', 'global', '', 'site', NULL, 'craft\\fields\\Matrix', '{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"localizeBlocks\":false}', '2018-05-07 19:30:57', '2018-05-09 19:23:10', '17e29334-b847-45dc-a676-5f312b7197bd'),
(3, NULL, 'Body Text', 'bodyText', 'matrixBlockType:1', '', 'none', NULL, 'craft\\redactor\\Field', '{\"redactorConfig\":\"\",\"purifierConfig\":\"\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"1\",\"columnType\":\"text\",\"availableVolumes\":\"*\",\"availableTransforms\":\"*\"}', '2018-05-07 19:30:58', '2018-05-09 19:23:10', 'f779d60d-f36a-4d90-9994-9781dfbdca5f'),
(4, NULL, 'Button Name', 'buttonNameInternal', 'matrixBlockType:2', '', 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2018-05-07 19:30:58', '2018-05-09 19:23:10', '8b2def62-b99c-4d0e-ad71-cbffacc8bfb8'),
(5, NULL, 'Button Link', 'buttonLinkInternal', 'matrixBlockType:2', '', 'site', NULL, 'craft\\fields\\Entries', '{\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":null,\"limit\":\"\",\"selectionLabel\":\"\",\"localizeRelations\":false}', '2018-05-07 19:30:58', '2018-05-09 19:23:10', '53abc2fe-1142-40ea-9f1c-151077446053'),
(6, NULL, 'Button Title', 'buttonTitle', 'matrixBlockType:3', '', 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2018-05-07 19:30:58', '2018-05-09 19:23:10', '7cac78e9-9bff-4ad9-aa4d-ae3b377b49f0'),
(7, NULL, 'Button URL', 'buttonUrl', 'matrixBlockType:3', '', 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2018-05-07 19:30:58', '2018-05-09 19:23:10', '246d6bce-8a99-4a4d-a0ac-aca7818b59d8'),
(9, NULL, 'Video URL', 'videoUrl', 'matrixBlockType:5', '', 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2018-05-07 19:30:58', '2018-05-09 19:23:10', '3e705071-9ac2-4651-bf62-4cf1291b8480'),
(10, NULL, 'Video Caption', 'videoCaption', 'matrixBlockType:5', '', 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2018-05-07 19:30:58', '2018-05-09 19:23:10', '3db655d6-8e14-47c3-9809-d22776085aab'),
(11, NULL, 'Pull Quote', 'pullQuote', 'matrixBlockType:6', 'No need to put in quotation marks - we\'ll do that for you.', 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2018-05-07 19:30:58', '2018-05-09 19:23:11', 'b68a860c-6f15-4fac-b9cc-796d05920b8c'),
(12, NULL, 'Pull Quote Author', 'pullQuoteAuthor', 'matrixBlockType:6', '', 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2018-05-07 19:30:58', '2018-05-09 19:23:11', 'c90f9f1c-da69-44c5-8dab-c880db39c875'),
(13, NULL, 'Call Out Title', 'callOutTitle', 'matrixBlockType:7', '', 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2018-05-07 19:30:58', '2018-05-09 19:23:11', '3e7f3a94-1e14-4b04-af65-ddf8834c878c'),
(14, NULL, 'Call Out Text', 'callOutText', 'matrixBlockType:7', '', 'none', NULL, 'craft\\redactor\\Field', '{\"redactorConfig\":\"\",\"purifierConfig\":\"\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"1\",\"columnType\":\"text\",\"availableVolumes\":\"*\",\"availableTransforms\":\"*\"}', '2018-05-07 19:31:26', '2018-05-09 19:23:11', 'edcf1d23-a598-48fb-97a2-c1e009af3d75'),
(15, NULL, 'Call Out Image', 'callOutImage', 'matrixBlockType:7', '', 'site', NULL, 'craft\\fields\\Assets', '{\"useSingleFolder\":\"\",\"defaultUploadLocationSource\":\"folder:1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"folder:1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"\",\"allowedKinds\":null,\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"list\",\"limit\":\"\",\"selectionLabel\":\"\",\"localizeRelations\":false}', '2018-05-07 19:31:26', '2018-05-09 19:23:11', 'c010a3a8-4504-42dc-8077-ca3ac7ede1d8'),
(17, NULL, 'Image', 'image', 'matrixBlockType:4', '', 'site', NULL, 'craft\\fields\\Assets', '{\"useSingleFolder\":\"\",\"defaultUploadLocationSource\":\"folder:1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"folder:1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"\",\"allowedKinds\":null,\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"list\",\"limit\":\"\",\"selectionLabel\":\"\",\"localizeRelations\":false}', '2018-05-07 20:02:25', '2018-05-09 19:23:10', '0cc70e17-df2a-42b0-af6f-9a57763d02bb'),
(18, 1, 'Social Matrix', 'socialMatrix', 'global', '', 'site', NULL, 'craft\\fields\\Matrix', '{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"localizeBlocks\":false}', '2018-05-07 20:15:47', '2018-05-07 20:15:47', '7f98c71d-c65f-4566-8ce9-5baf7f47f661'),
(19, NULL, 'Social Name', 'socialName', 'matrixBlockType:8', '', 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2018-05-07 20:15:47', '2018-05-07 20:15:47', '522789ca-4f7f-4901-8714-32ee0802632e'),
(20, NULL, 'Social Handle', 'socialHandle', 'matrixBlockType:8', '', 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2018-05-07 20:15:47', '2018-05-07 20:15:47', '284f7a94-16ed-43b0-b3e1-f9325018f611'),
(21, 1, 'Header Logo', 'headerLogo', 'global', '', 'site', NULL, 'craft\\fields\\Assets', '{\"useSingleFolder\":\"\",\"defaultUploadLocationSource\":\"folder:1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"folder:1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"\",\"allowedKinds\":null,\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"list\",\"limit\":\"\",\"selectionLabel\":\"\",\"localizeRelations\":false}', '2018-05-09 18:45:42', '2018-05-09 18:45:42', '477da3b6-a1b0-4234-9f8a-c562b568119a'),
(22, 1, 'Email', 'email', 'global', '', 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2018-05-09 18:50:21', '2018-05-09 18:50:21', '0b30e2e4-9396-4125-893f-60b41b33e434'),
(23, 1, 'Phone Number', 'phoneNumber', 'global', '', 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2018-05-09 18:50:32', '2018-05-09 18:50:32', '2a807176-ba96-43c0-bd9b-83af6e7030e4'),
(24, 1, 'Copyright', 'copyright', 'global', '', 'none', NULL, 'craft\\redactor\\Field', '{\"redactorConfig\":\"\",\"purifierConfig\":\"\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"1\",\"columnType\":\"text\",\"availableVolumes\":\"*\",\"availableTransforms\":\"*\"}', '2018-05-09 18:50:41', '2018-05-09 18:50:41', '8cc610ee-aaa5-497b-905f-9d246fb94649'),
(25, 1, 'Footer Image', 'footerImage', 'global', '', 'site', NULL, 'craft\\fields\\Assets', '{\"useSingleFolder\":\"\",\"defaultUploadLocationSource\":\"folder:1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"folder:1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"\",\"allowedKinds\":null,\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"list\",\"limit\":\"\",\"selectionLabel\":\"\",\"localizeRelations\":false}', '2018-05-09 19:02:55', '2018-05-09 19:02:55', 'e67d64b7-976a-4009-9cc2-a5e4e6a70a95');

-- --------------------------------------------------------

--
-- Table structure for table `craft_globalsets`
--

CREATE TABLE `craft_globalsets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_globalsets`
--

INSERT INTO `craft_globalsets` (`id`, `name`, `handle`, `fieldLayoutId`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(12, 'Header', 'header', 11, '2018-05-07 20:19:03', '2018-05-09 18:46:01', '98f4a7d5-d6dc-4474-bb31-35714554acc0'),
(13, 'Footer', 'footer', 12, '2018-05-07 20:19:06', '2018-05-09 19:03:14', 'ca28c278-e1c2-46ce-a89a-d9a5c3b6172b');

-- --------------------------------------------------------

--
-- Table structure for table `craft_info`
--

CREATE TABLE `craft_info` (
  `id` int(11) NOT NULL,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `edition` tinyint(3) UNSIGNED NOT NULL,
  `timezone` varchar(30) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `on` tinyint(1) NOT NULL DEFAULT '0',
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_info`
--

INSERT INTO `craft_info` (`id`, `version`, `schemaVersion`, `edition`, `timezone`, `name`, `on`, `maintenance`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '3.0.6', '3.0.91', 0, 'America/Los_Angeles', 'IdeaBase Starter Kit', 1, 0, 'kGOD0a6AgjnC', '2018-05-02 20:31:26', '2018-05-09 20:01:19', 'bb4e3e64-e6ce-4490-ae25-923d04716360');

-- --------------------------------------------------------

--
-- Table structure for table `craft_matrixblocks`
--

CREATE TABLE `craft_matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `ownerSiteId` int(11) DEFAULT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_matrixblocks`
--

INSERT INTO `craft_matrixblocks` (`id`, `ownerId`, `ownerSiteId`, `fieldId`, `typeId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(3, 2, NULL, 2, 1, 1, '2018-05-07 19:39:42', '2018-05-09 19:51:57', '12962531-55bf-4be0-8edb-9c55ee662d4e'),
(4, 2, NULL, 2, 3, 2, '2018-05-07 19:39:42', '2018-05-09 19:51:57', 'c2c5c0f2-f45c-4547-8a7c-3d03ec692abe'),
(5, 2, NULL, 2, 5, 3, '2018-05-07 19:39:42', '2018-05-09 19:51:57', 'd10914b3-ae28-4e1e-a143-6b923159b6f2'),
(6, 2, NULL, 2, 6, 4, '2018-05-07 19:39:42', '2018-05-09 19:51:57', '11d7764d-347a-4d37-9d37-b7827648063b'),
(11, 2, NULL, 18, 8, 1, '2018-05-07 20:18:08', '2018-05-09 19:51:57', '0cc89d28-eb94-4cc8-a58a-19ffaf86fbed'),
(15, 2, NULL, 2, 4, 5, '2018-05-07 20:22:07', '2018-05-09 19:51:57', '31ed74af-d9d8-40ca-a356-f7ee02c387eb'),
(17, 2, NULL, 2, 4, 6, '2018-05-07 20:41:15', '2018-05-09 19:51:57', '9c0434fe-db19-4b65-bdd7-ef40d39c0a50');

-- --------------------------------------------------------

--
-- Table structure for table `craft_matrixblocktypes`
--

CREATE TABLE `craft_matrixblocktypes` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_matrixblocktypes`
--

INSERT INTO `craft_matrixblocktypes` (`id`, `fieldId`, `fieldLayoutId`, `name`, `handle`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 2, 2, 'Body', 'body', 1, '2018-05-07 19:30:58', '2018-05-09 19:23:10', '01678f61-d124-469a-8c54-1d4fa4b65c26'),
(2, 2, 3, 'Button (Internal Link)', 'buttonInternalLink', 2, '2018-05-07 19:30:58', '2018-05-09 19:23:10', '8d3666dd-2d9d-481e-aee8-2c4eb27e235f'),
(3, 2, 4, 'Button (External Link)', 'buttonExternalLink', 3, '2018-05-07 19:30:58', '2018-05-09 19:23:10', '79b367aa-bffb-426c-a20f-b369fabf760d'),
(4, 2, 5, 'Image', 'image', 4, '2018-05-07 19:30:58', '2018-05-09 19:23:10', 'd34bcb04-7b27-4c57-bf01-3ba995e155f4'),
(5, 2, 6, 'Video', 'video', 5, '2018-05-07 19:30:58', '2018-05-09 19:23:10', 'c2d7ab57-249f-4411-a7df-fd48b63bc5a6'),
(6, 2, 7, 'Pull Quote', 'pullQuote', 6, '2018-05-07 19:30:58', '2018-05-09 19:23:11', '31602c40-bb81-4f6d-91d1-782f018839d3'),
(7, 2, 8, 'Call Out', 'callOut', 7, '2018-05-07 19:30:58', '2018-05-09 19:23:11', '0adedcb1-4561-4b1e-a359-de232f1bd592'),
(8, 18, 10, 'Social Block', 'socialBlock', 1, '2018-05-07 20:15:47', '2018-05-07 20:15:47', '642dc902-d717-4670-906b-530e08e20694');

-- --------------------------------------------------------

--
-- Table structure for table `craft_matrixcontent_pagecontent`
--

CREATE TABLE `craft_matrixcontent_pagecontent` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_body_bodyText` text,
  `field_buttonInternalLink_buttonNameInternal` text,
  `field_buttonExternalLink_buttonTitle` text,
  `field_buttonExternalLink_buttonUrl` text,
  `field_video_videoUrl` text,
  `field_video_videoCaption` text,
  `field_pullQuote_pullQuote` text,
  `field_pullQuote_pullQuoteAuthor` text,
  `field_callOut_callOutTitle` text,
  `field_callOut_callOutText` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_matrixcontent_pagecontent`
--

INSERT INTO `craft_matrixcontent_pagecontent` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_body_bodyText`, `field_buttonInternalLink_buttonNameInternal`, `field_buttonExternalLink_buttonTitle`, `field_buttonExternalLink_buttonUrl`, `field_video_videoUrl`, `field_video_videoCaption`, `field_pullQuote_pullQuote`, `field_pullQuote_pullQuoteAuthor`, `field_callOut_callOutTitle`, `field_callOut_callOutText`) VALUES
(1, 3, 1, '2018-05-07 19:39:42', '2018-05-09 19:51:57', '4cf48910-06b0-4b0f-be3b-b12e27728b74', '<p>This is body text.</p>\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 4, 1, '2018-05-07 19:39:42', '2018-05-09 19:51:57', 'ac63c083-ce8d-42ed-a89e-8a41e0a8c8d9', NULL, NULL, 'Link to google', 'www.google.com', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 5, 1, '2018-05-07 19:39:42', '2018-05-09 19:51:57', '06de3519-7bae-4c06-b527-0287ebe19298', NULL, NULL, NULL, NULL, 'https://www.youtube.com/watch?v=Btw_99WDFVA', 'carl malone', NULL, NULL, NULL, NULL),
(4, 6, 1, '2018-05-07 19:39:42', '2018-05-09 19:51:57', 'ae0699ba-dbe1-49b8-89e7-aaf8d7a65f76', NULL, NULL, NULL, NULL, NULL, NULL, 'Hey my name is nick', 'Nick Pappas', NULL, NULL),
(7, 15, 1, '2018-05-07 20:22:07', '2018-05-09 19:51:57', '216cb043-5d2b-45c6-a784-7152ba3574c3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 17, 1, '2018-05-07 20:41:15', '2018-05-09 19:51:57', 'de3e3fa8-bb09-4177-95b9-a3929cafbbec', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `craft_matrixcontent_socialmatrix`
--

CREATE TABLE `craft_matrixcontent_socialmatrix` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_socialBlock_socialName` text,
  `field_socialBlock_socialHandle` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_matrixcontent_socialmatrix`
--

INSERT INTO `craft_matrixcontent_socialmatrix` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_socialBlock_socialName`, `field_socialBlock_socialHandle`) VALUES
(1, 11, 1, '2018-05-07 20:18:08', '2018-05-09 19:51:57', 'e41ddef2-fe14-42d2-97e6-3d326f745206', 'Facebook', 'https://www.google.com');

-- --------------------------------------------------------

--
-- Table structure for table `craft_migrations`
--

CREATE TABLE `craft_migrations` (
  `id` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `type` enum('app','plugin','content') NOT NULL DEFAULT 'app',
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_migrations`
--

INSERT INTO `craft_migrations` (`id`, `pluginId`, `type`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 'app', 'Install', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'f0177a61-7f22-43ea-955d-1e60e20f6729'),
(2, NULL, 'app', 'm150403_183908_migrations_table_changes', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'a9baf977-97f9-47e2-b175-29b284dbae3e'),
(3, NULL, 'app', 'm150403_184247_plugins_table_changes', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'dc57a6b2-a764-482b-9b85-2bc38da967fc'),
(4, NULL, 'app', 'm150403_184533_field_version', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'a1696d51-bd70-41b9-b6b6-4352b4f68bba'),
(5, NULL, 'app', 'm150403_184729_type_columns', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'f136adf7-18f6-40ce-adc1-0eb05485e773'),
(6, NULL, 'app', 'm150403_185142_volumes', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '8fd58df0-0487-42c6-9d3f-6300461c9849'),
(7, NULL, 'app', 'm150428_231346_userpreferences', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '5f39d910-85af-43b6-aeca-d4d7120e4522'),
(8, NULL, 'app', 'm150519_150900_fieldversion_conversion', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'f1af9a19-4eef-4471-bba7-b84a7f5533ff'),
(9, NULL, 'app', 'm150617_213829_update_email_settings', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '0af0d5eb-6a60-4a03-a1da-72a15ed0b8b7'),
(10, NULL, 'app', 'm150721_124739_templatecachequeries', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '76d99301-f240-42b1-88c9-7cde5846a3ea'),
(11, NULL, 'app', 'm150724_140822_adjust_quality_settings', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'dd8a85a6-e957-4be8-8657-8ff3651ab9a6'),
(12, NULL, 'app', 'm150815_133521_last_login_attempt_ip', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'e48a74f8-a89f-44ce-8834-0dcd747a8232'),
(13, NULL, 'app', 'm151002_095935_volume_cache_settings', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'ddf23a9a-9602-4ca8-bf1d-01a637da246e'),
(14, NULL, 'app', 'm151005_142750_volume_s3_storage_settings', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '80b25c1d-b380-4416-b326-7aacea8fb227'),
(15, NULL, 'app', 'm151016_133600_delete_asset_thumbnails', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '9543384b-1814-4942-a88e-7fd40a8e9099'),
(16, NULL, 'app', 'm151209_000000_move_logo', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '79616d6e-37f0-4d49-9cc7-2f794b9d03ae'),
(17, NULL, 'app', 'm151211_000000_rename_fileId_to_assetId', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'fe570afa-4301-48d1-a5a5-9a77ebe12405'),
(18, NULL, 'app', 'm151215_000000_rename_asset_permissions', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '6e0f138a-2d05-4684-9840-8e63f3ba0c3b'),
(19, NULL, 'app', 'm160707_000001_rename_richtext_assetsource_setting', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '1f179f11-17f2-4704-84c9-deca68e462e4'),
(20, NULL, 'app', 'm160708_185142_volume_hasUrls_setting', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '540f4b1f-2614-4920-81ce-320badf5fb8f'),
(21, NULL, 'app', 'm160714_000000_increase_max_asset_filesize', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '07dd65e4-6862-4e66-a818-513cb379da55'),
(22, NULL, 'app', 'm160727_194637_column_cleanup', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'd941c82c-275f-4271-86a2-ca2d27c4fe15'),
(23, NULL, 'app', 'm160804_110002_userphotos_to_assets', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '83ff4ec5-c554-4e8a-acde-28008a0d9456'),
(24, NULL, 'app', 'm160807_144858_sites', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '4a125e81-a0a9-43b3-993b-77aad0b9a5a1'),
(25, NULL, 'app', 'm160829_000000_pending_user_content_cleanup', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '19466dc8-2a6b-41b1-846b-ce5b7396ca30'),
(26, NULL, 'app', 'm160830_000000_asset_index_uri_increase', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'b6c82561-7cbe-4eb6-a67e-84027237b7fb'),
(27, NULL, 'app', 'm160912_230520_require_entry_type_id', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '3a72571f-8547-4314-8173-6f8126f8d816'),
(28, NULL, 'app', 'm160913_134730_require_matrix_block_type_id', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '37b03b58-756a-4ebf-95ce-df62ef602d67'),
(29, NULL, 'app', 'm160920_174553_matrixblocks_owner_site_id_nullable', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '63f4da32-96f3-47b2-848c-6794093daee5'),
(30, NULL, 'app', 'm160920_231045_usergroup_handle_title_unique', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'f7ac1aa0-fe33-4021-a8bb-e66f6c37f8d8'),
(31, NULL, 'app', 'm160925_113941_route_uri_parts', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'b7946cea-f101-4e01-ac29-eaea146c0374'),
(32, NULL, 'app', 'm161006_205918_schemaVersion_not_null', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '221c7aad-8ed5-49a0-b132-eeb00e08efdf'),
(33, NULL, 'app', 'm161007_130653_update_email_settings', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '055b6f0c-bd18-4b76-a293-b81a692af6fc'),
(34, NULL, 'app', 'm161013_175052_newParentId', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '52f59962-8b29-4a7d-a4ca-854098b3e4b6'),
(35, NULL, 'app', 'm161021_102916_fix_recent_entries_widgets', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '6abe32d7-3d9f-4ed0-9cc9-0588b4f89585'),
(36, NULL, 'app', 'm161021_182140_rename_get_help_widget', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '81e365cd-3801-4164-89a8-5a6dd76b0e34'),
(37, NULL, 'app', 'm161025_000000_fix_char_columns', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '644d1f50-9d85-4506-9cac-c161e34a1a4a'),
(38, NULL, 'app', 'm161029_124145_email_message_languages', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '8ff100bc-7a8c-41d3-a4a6-d4f055694b41'),
(39, NULL, 'app', 'm161108_000000_new_version_format', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '5ede0cb3-9158-4a61-b150-d7bf30e3ce1f'),
(40, NULL, 'app', 'm161109_000000_index_shuffle', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'e1bdf999-6dad-460b-99dd-c342c6d92df1'),
(41, NULL, 'app', 'm161122_185500_no_craft_app', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'a596e0e7-118c-43df-a83f-5d543d17336c'),
(42, NULL, 'app', 'm161125_150752_clear_urlmanager_cache', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '32676df8-8901-4335-90ff-985b8858ceca'),
(43, NULL, 'app', 'm161220_000000_volumes_hasurl_notnull', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '464d68bb-7399-45c3-9605-7ba584864ccb'),
(44, NULL, 'app', 'm170114_161144_udates_permission', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'f0f17eba-bd15-4bf8-9d7c-70f639950f54'),
(45, NULL, 'app', 'm170120_000000_schema_cleanup', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'a5f24cbe-1b5b-47e1-ba1e-05a92194131c'),
(46, NULL, 'app', 'm170126_000000_assets_focal_point', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2d3c0547-80c0-4039-b1a8-e904302f5875'),
(47, NULL, 'app', 'm170206_142126_system_name', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'f6290d0d-314a-44ea-aa43-02aa93682864'),
(48, NULL, 'app', 'm170217_044740_category_branch_limits', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'fbf7cc5e-320b-4635-99a0-93344543e060'),
(49, NULL, 'app', 'm170217_120224_asset_indexing_columns', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '12b673ea-7bed-44a8-85d3-ac084f687a2b'),
(50, NULL, 'app', 'm170223_224012_plain_text_settings', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '09f70baa-698b-4a4b-a6d1-333bdda4972a'),
(51, NULL, 'app', 'm170227_120814_focal_point_percentage', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '1040c030-15bb-4f9d-9dfd-ec99ec77b1e8'),
(52, NULL, 'app', 'm170228_171113_system_messages', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '01f05764-9d5c-4f6d-bd25-2dc361dd4790'),
(53, NULL, 'app', 'm170303_140500_asset_field_source_settings', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '487398f3-0dcf-46c8-92e9-493fe0df7a70'),
(54, NULL, 'app', 'm170306_150500_asset_temporary_uploads', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '802dd6e9-cb25-4735-b7da-1fe44c270743'),
(55, NULL, 'app', 'm170414_162429_rich_text_config_setting', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '59aadb4e-244a-4699-8135-b00726423758'),
(56, NULL, 'app', 'm170523_190652_element_field_layout_ids', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'df586e22-a9d3-4fca-972a-e72beab03caf'),
(57, NULL, 'app', 'm170612_000000_route_index_shuffle', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '473b8a4b-f2b5-4a1d-ad16-628cfb529cac'),
(58, NULL, 'app', 'm170621_195237_format_plugin_handles', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '9757e853-beff-42b7-a765-5cbab7d6ba65'),
(59, NULL, 'app', 'm170630_161028_deprecation_changes', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'd2d5ffb5-8882-4796-be1b-4d39a3f2530b'),
(60, NULL, 'app', 'm170703_181539_plugins_table_tweaks', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '4f43e191-822b-40c7-94fd-106ebbeca0ad'),
(61, NULL, 'app', 'm170704_134916_sites_tables', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '4a5d8c80-4d53-4a5d-a3ed-cc01ad293a82'),
(62, NULL, 'app', 'm170706_183216_rename_sequences', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'd748e787-fd21-46eb-bb46-9021a0a85c31'),
(63, NULL, 'app', 'm170707_094758_delete_compiled_traits', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '8fbc43c1-cdb8-4439-9aac-19b641844e4c'),
(64, NULL, 'app', 'm170731_190138_drop_asset_packagist', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'f30c4453-b6f1-4992-8085-83b86060dcdc'),
(65, NULL, 'app', 'm170810_201318_create_queue_table', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'd420becb-1b47-4923-870f-43114763a79e'),
(66, NULL, 'app', 'm170816_133741_delete_compiled_behaviors', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'dd0cb768-766a-4eff-a53a-7008faea02d0'),
(67, NULL, 'app', 'm170821_180624_deprecation_line_nullable', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '30747a60-ae0e-4c65-bb53-01e0eb4b8d1d'),
(68, NULL, 'app', 'm170903_192801_longblob_for_queue_jobs', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'ba24dbb3-fcab-45d5-ac31-4e94ab93d996'),
(69, NULL, 'app', 'm170914_204621_asset_cache_shuffle', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '0fea5a9c-740b-48c1-9bbe-c17d526aee27'),
(70, NULL, 'app', 'm171011_214115_site_groups', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'a7496f82-85af-4b5e-a824-c2c0168cb383'),
(71, NULL, 'app', 'm171012_151440_primary_site', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'e54bcfd6-ff7a-4650-a0c3-c9235ab0b8d4'),
(72, NULL, 'app', 'm171013_142500_transform_interlace', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'df691ecb-2666-4959-9647-09b50cf3703b'),
(73, NULL, 'app', 'm171016_092553_drop_position_select', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '1436d6c5-a6cd-4c94-a539-7f965d82229f'),
(74, NULL, 'app', 'm171016_221244_less_strict_translation_method', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '65762e18-3b65-4341-817d-98f25bde578b'),
(75, NULL, 'app', 'm171107_000000_assign_group_permissions', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-02 20:31:27', 'b87b13dd-6f77-4454-9c28-347662970db1'),
(76, NULL, 'app', 'm171117_000001_templatecache_index_tune', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '2c38c09a-7757-42b3-a742-97d0d8dc20e2'),
(77, NULL, 'app', 'm171126_105927_disabled_plugins', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '1476bea3-e6b4-45cb-b20a-de9a4bc149c0'),
(78, NULL, 'app', 'm171130_214407_craftidtokens_table', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '5cdb6563-179c-4109-ae4b-169eef79b9f5'),
(79, NULL, 'app', 'm171202_004225_update_email_settings', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '5ae04520-09db-4c89-b00e-ed2f1115a603'),
(80, NULL, 'app', 'm171204_000001_templatecache_index_tune_deux', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '2018-05-02 20:31:28', 'bdc0b4ad-a1e9-4edc-a3b3-0e3295c22b0a'),
(81, NULL, 'app', 'm171205_130908_remove_craftidtokens_refreshtoken_column', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '4712c9ee-1526-4d8b-8961-7e5ec8aba57e'),
(82, NULL, 'app', 'm171218_143135_longtext_query_column', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '7fdf176a-ccfd-402d-a890-7b36dd64d7f3'),
(83, NULL, 'app', 'm171231_055546_environment_variables_to_aliases', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '453c95de-6664-4b84-8ed2-09170c4b83d9'),
(84, NULL, 'app', 'm180113_153740_drop_users_archived_column', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '2018-05-02 20:31:28', 'd5a6ccb6-f60e-48b4-86e4-adfce3876d9d'),
(85, NULL, 'app', 'm180122_213433_propagate_entries_setting', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '55639851-f747-48af-bef2-80fd56169466'),
(86, NULL, 'app', 'm180124_230459_fix_propagate_entries_values', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '8b97b351-1d11-40b7-8de5-20967e01dad6'),
(87, NULL, 'app', 'm180128_235202_set_tag_slugs', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '2018-05-02 20:31:28', 'eac96ed8-f1e3-401d-a305-0bb0982c9bb4'),
(88, NULL, 'app', 'm180202_185551_fix_focal_points', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '46139dce-e8bb-49d1-8a20-8d4d1c1dd81f'),
(89, NULL, 'app', 'm180217_172123_tiny_ints', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '280f016e-0c15-44b0-9bac-204f673d1622'),
(90, NULL, 'app', 'm180321_233505_small_ints', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '2018-05-02 20:31:28', 'bd53a886-e236-4730-ab6d-d586ffe2efea'),
(91, NULL, 'app', 'm180328_115523_new_license_key_statuses', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '4c160b62-4482-4b9c-baed-15cb54459d24'),
(92, NULL, 'app', 'm180404_182320_edition_changes', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '3312ff27-030b-4d2b-8933-1722235630dd'),
(93, NULL, 'app', 'm180411_102218_fix_db_routes', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '4778cd65-6456-41cb-96df-5ed29f4e89d8'),
(94, NULL, 'app', 'm180416_205628_resourcepaths_table', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '438620c4-5744-4eec-8a5f-31118beee281'),
(95, NULL, 'app', 'm180418_205713_widget_cleanup', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '2018-05-02 20:31:28', '1df40b45-f163-4f0a-9151-d7a1ba0139d3'),
(96, 1, 'plugin', 'Install', '2018-05-02 20:43:38', '2018-05-02 20:43:38', '2018-05-02 20:43:38', '92c7a610-149b-448a-9885-320ad9f93a98'),
(97, 1, 'plugin', 'm180430_204710_remove_old_plugins', '2018-05-02 20:43:39', '2018-05-02 20:43:39', '2018-05-02 20:43:39', 'bca9d811-6247-4590-b87c-1ad32d514f47');

-- --------------------------------------------------------

--
-- Table structure for table `craft_plugins`
--

CREATE TABLE `craft_plugins` (
  `id` int(11) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKey` char(24) DEFAULT NULL,
  `licenseKeyStatus` enum('valid','invalid','mismatched','astray','unknown') NOT NULL DEFAULT 'unknown',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `settings` text,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_plugins`
--

INSERT INTO `craft_plugins` (`id`, `handle`, `version`, `schemaVersion`, `licenseKey`, `licenseKeyStatus`, `enabled`, `settings`, `installDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'redactor', '2.0.0.1', '2.0.0', NULL, 'unknown', 1, NULL, '2018-05-02 20:43:38', '2018-05-02 20:43:38', '2018-05-09 20:41:37', '9a8c417b-918c-458e-a659-ff5ee5d4417d'),
(2, 'admin-bar', '3.1.5', '3.1.0', NULL, 'unknown', 1, '{\"customCss\":\"\",\"customLinks\":[{\"linkLabel\":\"\",\"linkUrl\":\"\",\"adminOnly\":\"\"}],\"additionalLinks\":[],\"displayGreeting\":true,\"displayDashboardLink\":true,\"displayDefaultEditSection\":true,\"displaySettingsLink\":true,\"displayLogout\":true,\"enableMobileMenu\":true,\"widgets\":{\"admin-bar_edit-links\":\"\"},\"displayEditDate\":true,\"displayEditAuthor\":true,\"displayRevisionNote\":true}', '2018-05-02 20:43:57', '2018-05-02 20:43:57', '2018-05-09 20:41:37', 'ec3cede6-5451-4d33-8c0c-bbb6fde5b28a'),
(3, 'video-embedder', '1.0.9', '1.0.0', NULL, 'unknown', 1, NULL, '2018-05-07 19:35:58', '2018-05-07 19:35:58', '2018-05-09 20:41:37', '47ebbb4f-c37d-4d8a-b0e4-c4440ea28a66'),
(4, 'cp-field-inspect', '1.0.4', '1.0.0', NULL, 'unknown', 1, NULL, '2018-05-09 19:32:53', '2018-05-09 19:32:53', '2018-05-09 20:41:37', '2a9c99ab-b4d9-42fe-964a-fc261ea23f56');

-- --------------------------------------------------------

--
-- Table structure for table `craft_queue`
--

CREATE TABLE `craft_queue` (
  `id` int(11) NOT NULL,
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) UNSIGNED NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_relations`
--

CREATE TABLE `craft_relations` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_relations`
--

INSERT INTO `craft_relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(24, 25, 13, NULL, 19, 1, '2018-05-09 19:28:26', '2018-05-09 19:28:26', '1b5d389c-f999-448b-a526-a62a9e43f0dd'),
(25, 17, 15, NULL, 19, 1, '2018-05-09 19:51:57', '2018-05-09 19:51:57', '3c134f98-588c-4c0a-b000-5c424a5094b6');

-- --------------------------------------------------------

--
-- Table structure for table `craft_resourcepaths`
--

CREATE TABLE `craft_resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_resourcepaths`
--

INSERT INTO `craft_resourcepaths` (`hash`, `path`) VALUES
('10431919', '@app/web/assets/updates/dist'),
('14e78f96', '@lib/selectize'),
('198a5993', '@lib/garnishjs'),
('1e8bcb1c', '@lib/xregexp'),
('203a365c', '@app/web/assets/matrix/dist'),
('218252e5', '@mmikkel/cpfieldinspect/resources'),
('21b0580f', '@lib/prismjs'),
('23365286', '@lib/jquery-touch-events'),
('241bf635', '@craft/web/assets/tablesettings/dist'),
('24926e44', '@lib/picturefill'),
('25fd17e8', '@wbrowar/adminbar/assetbundles/adminbar/dist'),
('26577dc1', '@runtime/assets/thumbs/19'),
('2a374e15', '@lib/d3'),
('2bbedcf', '@runtime/assets/thumbs/18'),
('2c315e43', '@craft/web/assets/utilities/dist'),
('2f181468', '@app/web/assets/editentry/dist'),
('30f6594b', '@app/web/assets/dbbackup/dist'),
('360b4fb9', '@runtime/assets/thumbs/7'),
('3825fb80', '@app/web/assets/clearcaches/dist'),
('3c7a6fba', '@lib/fileupload'),
('400b0030', '@runtime/assets/thumbs/9'),
('4099a212', '@lib/picturefill'),
('457f5f3f', '@lib/timepicker'),
('45bb9459', '@lib/prismjs'),
('473d9ed0', '@lib/jquery-touch-events'),
('4d759b7b', '@app/web/assets/plugins/dist'),
('4e3c8243', '@lib/d3'),
('5207fd76', '@craft/web/assets/recententries/dist'),
('54fd951d', '@app/web/assets/dbbackup/dist'),
('5871a3ec', '@lib/fileupload'),
('5bc4bb29', '@craft/web/assets/updater/dist'),
('5c2e37d6', '@app/web/assets/clearcaches/dist'),
('5f45025e', '@craft/web/assets/findreplace/dist'),
('68c741fb', '@lib/fabric'),
('6a29083b', '@app/web/assets/deprecationerrors/dist'),
('6bb51a3e', '@app/web/assets/dashboard/dist'),
('6cbdbf18', '@craft/web/assets/updateswidget/dist'),
('70ec43c0', '@lib/selectize'),
('7448d54f', '@app/web/assets/updates/dist'),
('76c36689', '@craft/web/assets/cp/dist'),
('7a80074a', '@lib/xregexp'),
('7d8195c5', '@lib/garnishjs'),
('7fb856f4', '@craft/web/assets/pluginstore/dist'),
('846287f5', '@app/web/assets/matrixsettings/dist'),
('85dd9d50', '@app/web/assets/craftsupport/dist'),
('87a8f936', '@lib/element-resize-detector'),
('8d47529e', '@craft/web/assets/dashboard/dist'),
('8d9f826', '@app/web/assets/fields/dist'),
('8dcaecb3', '@vendor/craftcms/redactor/lib/redactor'),
('8f88fbda', '@runtime/assets/thumbs/14'),
('9012933b', '@lib'),
('928db1f2', '@craft/web/assets/matrixsettings/dist'),
('9315f24d', '@lib/jquery-ui'),
('a5900a56', '@lib/jquery.payment'),
('a7e2b4ea', '@app/web/assets/tablesettings/dist'),
('a83852c3', '@bower/jquery/dist'),
('a8b85472', '@app/web/assets/cp/dist'),
('ac86410c', '@app/web/assets/login/dist'),
('aec8dab5', '@app/web/assets/utilities/dist'),
('b2c4bc62', '@craft/web/assets/deprecationerrors/dist'),
('b4960dc8', '@craft/web/assets/updates/dist'),
('b572c364', '@runtime/assets/thumbs/19'),
('b5a8d39a', '@app/web/assets/feed/dist'),
('b5f573ff', '@app/web/assets/recententries/dist'),
('b9b7a5be', '@lib/velocity'),
('c094440', '@craft/web/assets/fields/dist'),
('c1866e1d', '@craft/web/assets/dbbackup/dist'),
('c19bc600', '@lib/jquery.payment'),
('c317fedc', '@craft/web/assets/login/dist'),
('c6ca0a24', '@runtime/assets/thumbs/16'),
('c88d8d5a', '@app/web/assets/login/dist'),
('cac316e3', '@app/web/assets/utilities/dist'),
('cb114911', '@craft/web/assets/craftsupport/dist'),
('cc339e95', '@bower/jquery/dist'),
('ccb39824', '@app/web/assets/cp/dist'),
('ccc8dad', '@lib/fabric'),
('d1a31fcc', '@app/web/assets/feed/dist'),
('d1febfa9', '@app/web/assets/recententries/dist'),
('d78bd50f', '@app/web/assets/pluginstore/dist'),
('ddbc69e8', '@lib/velocity'),
('de65e6bc', '@app/web/assets/assetindexes/dist'),
('e1d65106', '@app/web/assets/craftsupport/dist'),
('e3a33560', '@lib/element-resize-detector'),
('ef44fdc7', '@app/web/assets/updateswidget/dist'),
('f0907133', '@craft/redactor/assets/field/dist'),
('f4047455', '@craft/web/assets/feed/dist'),
('f41db42d', '@craft/web/assets/clearcaches/dist'),
('f71e3e1b', '@lib/jquery-ui'),
('fbe091d6', '@app/web/assets/generalsettings/dist'),
('fbed668', '@app/web/assets/dashboard/dist'),
('ff11aff8', '@app/web/assets/updater/dist');

-- --------------------------------------------------------

--
-- Table structure for table `craft_routes`
--

CREATE TABLE `craft_routes` (
  `id` int(11) NOT NULL,
  `siteId` int(11) DEFAULT NULL,
  `uriParts` varchar(255) NOT NULL,
  `uriPattern` varchar(255) NOT NULL,
  `template` varchar(500) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_searchindex`
--

CREATE TABLE `craft_searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_searchindex`
--

INSERT INTO `craft_searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES
(1, 'username', 0, 1, ' ideabase '),
(1, 'firstname', 0, 1, ''),
(1, 'lastname', 0, 1, ''),
(1, 'fullname', 0, 1, ''),
(1, 'email', 0, 1, ' info ideabasekent com '),
(1, 'slug', 0, 1, ''),
(2, 'slug', 0, 1, ' home page '),
(2, 'title', 0, 1, ' home page '),
(2, 'field', 2, 1, ' this is body text link to google www google com carl malone https www youtube com watch v=btw_99wdfva hey my name is nick nick pappas logo '),
(3, 'field', 3, 1, ' this is body text '),
(3, 'slug', 0, 1, ''),
(4, 'field', 6, 1, ' link to google '),
(4, 'field', 7, 1, ' www google com '),
(4, 'slug', 0, 1, ''),
(5, 'field', 9, 1, ' https www youtube com watch v=btw_99wdfva '),
(5, 'field', 10, 1, ' carl malone '),
(5, 'slug', 0, 1, ''),
(6, 'field', 11, 1, ' hey my name is nick '),
(6, 'field', 12, 1, ' nick pappas '),
(6, 'slug', 0, 1, ''),
(17, 'slug', 0, 1, ''),
(12, 'field', 21, 1, ' logo '),
(15, 'slug', 0, 1, ''),
(19, 'filename', 0, 1, ' logo png '),
(19, 'extension', 0, 1, ' png '),
(19, 'kind', 0, 1, ' image '),
(19, 'slug', 0, 1, ''),
(19, 'title', 0, 1, ' logo '),
(17, 'field', 17, 1, ''),
(15, 'field', 17, 1, ' logo '),
(2, 'field', 18, 1, ' https www google com facebook '),
(11, 'field', 19, 1, ' facebook '),
(11, 'field', 20, 1, ' https www google com '),
(11, 'slug', 0, 1, ''),
(12, 'slug', 0, 1, ''),
(13, 'slug', 0, 1, ''),
(13, 'field', 22, 1, ' testemail email com '),
(13, 'field', 23, 1, ' 911 '),
(13, 'field', 24, 1, ' copyright nick pappas '),
(13, 'field', 25, 1, ' logo ');

-- --------------------------------------------------------

--
-- Table structure for table `craft_sections`
--

CREATE TABLE `craft_sections` (
  `id` int(11) NOT NULL,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagateEntries` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_sections`
--

INSERT INTO `craft_sections` (`id`, `structureId`, `name`, `handle`, `type`, `enableVersioning`, `propagateEntries`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 'Home Page', 'homepage', 'single', 1, 1, '2018-05-02 20:42:28', '2018-05-02 20:42:28', 'aac398bd-73a6-415d-ac5b-b04babbd68c5');

-- --------------------------------------------------------

--
-- Table structure for table `craft_sections_sites`
--

CREATE TABLE `craft_sections_sites` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_sections_sites`
--

INSERT INTO `craft_sections_sites` (`id`, `sectionId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `enabledByDefault`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, 1, '__home__', 'index.html', 1, '2018-05-02 20:42:28', '2018-05-02 20:42:28', 'decee477-7061-404c-a54e-e1100b3772c4');

-- --------------------------------------------------------

--
-- Table structure for table `craft_sessions`
--

CREATE TABLE `craft_sessions` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_sessions`
--

INSERT INTO `craft_sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 1, '0ukFQpBmansTKYpkYdw1T1Sn3pm08zzn7vVsXLZXE8NvMtnjg77FH0j20wOVGrhyiM4CJ4Jed8ff_vDsqglRCSm2gZcWM-gn9ecv', '2018-05-09 20:47:12', '2018-05-09 20:56:20', 'f3d1ac2c-d2e7-492d-b26c-d17027ae6434');

-- --------------------------------------------------------

--
-- Table structure for table `craft_shunnedmessages`
--

CREATE TABLE `craft_shunnedmessages` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_sitegroups`
--

CREATE TABLE `craft_sitegroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_sitegroups`
--

INSERT INTO `craft_sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'IdeaBase Starter Kit', '2018-05-02 20:31:26', '2018-05-02 20:31:26', '5f0f2a75-84ba-4564-8fdc-fe4b334a264f');

-- --------------------------------------------------------

--
-- Table structure for table `craft_sites`
--

CREATE TABLE `craft_sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_sites`
--

INSERT INTO `craft_sites` (`id`, `groupId`, `primary`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, 'IdeaBase Starter Kit', 'default', 'en-US', 1, '@web/', 1, '2018-05-02 20:31:26', '2018-05-02 20:31:26', '8d38eac1-e5ec-4b1e-8816-dbec410c110d');

-- --------------------------------------------------------

--
-- Table structure for table `craft_structureelements`
--

CREATE TABLE `craft_structureelements` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) UNSIGNED DEFAULT NULL,
  `lft` int(11) UNSIGNED NOT NULL,
  `rgt` int(11) UNSIGNED NOT NULL,
  `level` smallint(6) UNSIGNED NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_structures`
--

CREATE TABLE `craft_structures` (
  `id` int(11) NOT NULL,
  `maxLevels` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_systemmessages`
--

CREATE TABLE `craft_systemmessages` (
  `id` int(11) NOT NULL,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_systemsettings`
--

CREATE TABLE `craft_systemsettings` (
  `id` int(11) NOT NULL,
  `category` varchar(15) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_systemsettings`
--

INSERT INTO `craft_systemsettings` (`id`, `category`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'email', '{\"fromEmail\":\"info@ideabasekent.com\",\"fromName\":\"IdeaBase Starter Kit\",\"transportType\":\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"}', '2018-05-02 20:31:27', '2018-05-02 20:31:27', '7779fb43-cfee-4cc5-94e2-cd44081bf036');

-- --------------------------------------------------------

--
-- Table structure for table `craft_taggroups`
--

CREATE TABLE `craft_taggroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_tags`
--

CREATE TABLE `craft_tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_templatecacheelements`
--

CREATE TABLE `craft_templatecacheelements` (
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_templatecachequeries`
--

CREATE TABLE `craft_templatecachequeries` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `query` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_templatecaches`
--

CREATE TABLE `craft_templatecaches` (
  `id` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_tokens`
--

CREATE TABLE `craft_tokens` (
  `id` int(11) NOT NULL,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint(3) UNSIGNED DEFAULT NULL,
  `usageCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_usergroups`
--

CREATE TABLE `craft_usergroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_usergroups_users`
--

CREATE TABLE `craft_usergroups_users` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_userpermissions`
--

CREATE TABLE `craft_userpermissions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_userpermissions_usergroups`
--

CREATE TABLE `craft_userpermissions_usergroups` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_userpermissions_users`
--

CREATE TABLE `craft_userpermissions_users` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `craft_userpreferences`
--

CREATE TABLE `craft_userpreferences` (
  `userId` int(11) NOT NULL,
  `preferences` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_userpreferences`
--

INSERT INTO `craft_userpreferences` (`userId`, `preferences`) VALUES
(1, '{\"language\":\"en-US\"}');

-- --------------------------------------------------------

--
-- Table structure for table `craft_users`
--

CREATE TABLE `craft_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_users`
--

INSERT INTO `craft_users` (`id`, `username`, `photoId`, `firstName`, `lastName`, `email`, `password`, `admin`, `locked`, `suspended`, `pending`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'ideabase', NULL, NULL, NULL, 'info@ideabasekent.com', '$2y$13$5T6BIgvlnAVqKK4rDrY/3urxYSaEsVCHl24zJvtUTDsH6DThE4mnO', 1, 0, 0, 0, '2018-05-09 20:47:12', '::1', NULL, NULL, '2018-05-09 18:40:05', NULL, 1, NULL, NULL, NULL, 0, '2018-05-02 20:31:27', '2018-05-02 20:31:27', '2018-05-09 20:47:12', '36ed8153-4670-400d-8540-d2f926079c0e');

-- --------------------------------------------------------

--
-- Table structure for table `craft_volumefolders`
--

CREATE TABLE `craft_volumefolders` (
  `id` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_volumefolders`
--

INSERT INTO `craft_volumefolders` (`id`, `parentId`, `volumeId`, `name`, `path`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 1, 'Assets', '', '2018-05-07 19:45:09', '2018-05-07 19:45:09', '919ceac1-f7ec-42d4-9d53-bd08636acb0d'),
(2, NULL, NULL, 'Temporary source', NULL, '2018-05-07 19:45:44', '2018-05-07 19:45:44', '8d8a4731-8c76-47c7-ae0a-50c63527502b'),
(3, 2, NULL, 'user_1', 'user_1/', '2018-05-07 19:45:44', '2018-05-07 19:45:44', '610ec81c-b724-4c93-b951-a5d5f13e861f');

-- --------------------------------------------------------

--
-- Table structure for table `craft_volumes`
--

CREATE TABLE `craft_volumes` (
  `id` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) DEFAULT NULL,
  `settings` text,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_volumes`
--

INSERT INTO `craft_volumes` (`id`, `fieldLayoutId`, `name`, `handle`, `type`, `hasUrls`, `url`, `settings`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 9, 'Assets', 'assets', 'craft\\volumes\\Local', 1, '@baseUrl/assets/img/uploads', '{\"path\":\"assets/img/uploads/\"}', 1, '2018-05-07 19:45:09', '2018-05-09 19:25:10', '0f18705a-a007-42c9-ab24-1dee9a7d2c8e');

-- --------------------------------------------------------

--
-- Table structure for table `craft_widgets`
--

CREATE TABLE `craft_widgets` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `colspan` tinyint(1) NOT NULL DEFAULT '0',
  `settings` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `craft_widgets`
--

INSERT INTO `craft_widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'craft\\widgets\\RecentEntries', 1, 0, '{\"section\":\"*\",\"siteId\":\"1\",\"limit\":10}', 1, '2018-05-02 20:31:29', '2018-05-02 20:31:29', '38cc3888-b2dc-4b5e-9d96-3c62ea59ae10'),
(2, 1, 'craft\\widgets\\CraftSupport', 2, 0, '[]', 1, '2018-05-02 20:31:29', '2018-05-02 20:31:29', 'c4573e93-ab40-4276-bf0a-7725de48a741'),
(3, 1, 'craft\\widgets\\Updates', 3, 0, '[]', 1, '2018-05-02 20:31:29', '2018-05-02 20:31:29', '138c2926-45e7-4cb4-a9ff-11ed28a77e79'),
(4, 1, 'craft\\widgets\\Feed', 4, 0, '{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}', 1, '2018-05-02 20:31:29', '2018-05-02 20:31:29', '988ebc79-a54f-4308-ba88-0b4644bd3f96');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `craft_assetindexdata`
--
ALTER TABLE `craft_assetindexdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_assetindexdata_sessionId_volumeId_idx` (`sessionId`,`volumeId`),
  ADD KEY `craft_assetindexdata_volumeId_idx` (`volumeId`);

--
-- Indexes for table `craft_assets`
--
ALTER TABLE `craft_assets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_assets_filename_folderId_unq_idx` (`filename`,`folderId`),
  ADD KEY `craft_assets_folderId_idx` (`folderId`),
  ADD KEY `craft_assets_volumeId_idx` (`volumeId`);

--
-- Indexes for table `craft_assettransformindex`
--
ALTER TABLE `craft_assettransformindex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_assettransformindex_volumeId_assetId_location_idx` (`volumeId`,`assetId`,`location`);

--
-- Indexes for table `craft_assettransforms`
--
ALTER TABLE `craft_assettransforms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_assettransforms_name_unq_idx` (`name`),
  ADD UNIQUE KEY `craft_assettransforms_handle_unq_idx` (`handle`);

--
-- Indexes for table `craft_categories`
--
ALTER TABLE `craft_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_categories_groupId_idx` (`groupId`);

--
-- Indexes for table `craft_categorygroups`
--
ALTER TABLE `craft_categorygroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_categorygroups_name_unq_idx` (`name`),
  ADD UNIQUE KEY `craft_categorygroups_handle_unq_idx` (`handle`),
  ADD KEY `craft_categorygroups_structureId_idx` (`structureId`),
  ADD KEY `craft_categorygroups_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indexes for table `craft_categorygroups_sites`
--
ALTER TABLE `craft_categorygroups_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_categorygroups_sites_groupId_siteId_unq_idx` (`groupId`,`siteId`),
  ADD KEY `craft_categorygroups_sites_siteId_idx` (`siteId`);

--
-- Indexes for table `craft_content`
--
ALTER TABLE `craft_content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_content_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `craft_content_siteId_idx` (`siteId`),
  ADD KEY `craft_content_title_idx` (`title`);

--
-- Indexes for table `craft_craftidtokens`
--
ALTER TABLE `craft_craftidtokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_craftidtokens_userId_fk` (`userId`);

--
-- Indexes for table `craft_deprecationerrors`
--
ALTER TABLE `craft_deprecationerrors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`);

--
-- Indexes for table `craft_elementindexsettings`
--
ALTER TABLE `craft_elementindexsettings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_elementindexsettings_type_unq_idx` (`type`);

--
-- Indexes for table `craft_elements`
--
ALTER TABLE `craft_elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_elements_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `craft_elements_type_idx` (`type`),
  ADD KEY `craft_elements_enabled_idx` (`enabled`),
  ADD KEY `craft_elements_archived_dateCreated_idx` (`archived`,`dateCreated`);

--
-- Indexes for table `craft_elements_sites`
--
ALTER TABLE `craft_elements_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_elements_sites_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD UNIQUE KEY `craft_elements_sites_uri_siteId_unq_idx` (`uri`,`siteId`),
  ADD KEY `craft_elements_sites_siteId_idx` (`siteId`),
  ADD KEY `craft_elements_sites_slug_siteId_idx` (`slug`,`siteId`),
  ADD KEY `craft_elements_sites_enabled_idx` (`enabled`);

--
-- Indexes for table `craft_entries`
--
ALTER TABLE `craft_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_entries_postDate_idx` (`postDate`),
  ADD KEY `craft_entries_expiryDate_idx` (`expiryDate`),
  ADD KEY `craft_entries_authorId_idx` (`authorId`),
  ADD KEY `craft_entries_sectionId_idx` (`sectionId`),
  ADD KEY `craft_entries_typeId_idx` (`typeId`);

--
-- Indexes for table `craft_entrydrafts`
--
ALTER TABLE `craft_entrydrafts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_entrydrafts_sectionId_idx` (`sectionId`),
  ADD KEY `craft_entrydrafts_entryId_siteId_idx` (`entryId`,`siteId`),
  ADD KEY `craft_entrydrafts_siteId_idx` (`siteId`),
  ADD KEY `craft_entrydrafts_creatorId_idx` (`creatorId`);

--
-- Indexes for table `craft_entrytypes`
--
ALTER TABLE `craft_entrytypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_entrytypes_name_sectionId_unq_idx` (`name`,`sectionId`),
  ADD UNIQUE KEY `craft_entrytypes_handle_sectionId_unq_idx` (`handle`,`sectionId`),
  ADD KEY `craft_entrytypes_sectionId_idx` (`sectionId`),
  ADD KEY `craft_entrytypes_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indexes for table `craft_entryversions`
--
ALTER TABLE `craft_entryversions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_entryversions_sectionId_idx` (`sectionId`),
  ADD KEY `craft_entryversions_entryId_siteId_idx` (`entryId`,`siteId`),
  ADD KEY `craft_entryversions_siteId_idx` (`siteId`),
  ADD KEY `craft_entryversions_creatorId_idx` (`creatorId`);

--
-- Indexes for table `craft_fieldgroups`
--
ALTER TABLE `craft_fieldgroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_fieldgroups_name_unq_idx` (`name`);

--
-- Indexes for table `craft_fieldlayoutfields`
--
ALTER TABLE `craft_fieldlayoutfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  ADD KEY `craft_fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  ADD KEY `craft_fieldlayoutfields_tabId_idx` (`tabId`),
  ADD KEY `craft_fieldlayoutfields_fieldId_idx` (`fieldId`);

--
-- Indexes for table `craft_fieldlayouts`
--
ALTER TABLE `craft_fieldlayouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_fieldlayouts_type_idx` (`type`);

--
-- Indexes for table `craft_fieldlayouttabs`
--
ALTER TABLE `craft_fieldlayouttabs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  ADD KEY `craft_fieldlayouttabs_layoutId_idx` (`layoutId`);

--
-- Indexes for table `craft_fields`
--
ALTER TABLE `craft_fields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_fields_handle_context_unq_idx` (`handle`,`context`),
  ADD KEY `craft_fields_groupId_idx` (`groupId`),
  ADD KEY `craft_fields_context_idx` (`context`);

--
-- Indexes for table `craft_globalsets`
--
ALTER TABLE `craft_globalsets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_globalsets_name_unq_idx` (`name`),
  ADD UNIQUE KEY `craft_globalsets_handle_unq_idx` (`handle`),
  ADD KEY `craft_globalsets_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indexes for table `craft_info`
--
ALTER TABLE `craft_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `craft_matrixblocks`
--
ALTER TABLE `craft_matrixblocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_matrixblocks_ownerId_idx` (`ownerId`),
  ADD KEY `craft_matrixblocks_fieldId_idx` (`fieldId`),
  ADD KEY `craft_matrixblocks_typeId_idx` (`typeId`),
  ADD KEY `craft_matrixblocks_sortOrder_idx` (`sortOrder`),
  ADD KEY `craft_matrixblocks_ownerSiteId_idx` (`ownerSiteId`);

--
-- Indexes for table `craft_matrixblocktypes`
--
ALTER TABLE `craft_matrixblocktypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_matrixblocktypes_name_fieldId_unq_idx` (`name`,`fieldId`),
  ADD UNIQUE KEY `craft_matrixblocktypes_handle_fieldId_unq_idx` (`handle`,`fieldId`),
  ADD KEY `craft_matrixblocktypes_fieldId_idx` (`fieldId`),
  ADD KEY `craft_matrixblocktypes_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indexes for table `craft_matrixcontent_pagecontent`
--
ALTER TABLE `craft_matrixcontent_pagecontent`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_matrixcontent_pagecontent_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `craft_matrixcontent_pagecontent_siteId_fk` (`siteId`);

--
-- Indexes for table `craft_matrixcontent_socialmatrix`
--
ALTER TABLE `craft_matrixcontent_socialmatrix`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_matrixcontent_socialmatrix_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `craft_matrixcontent_socialmatrix_siteId_fk` (`siteId`);

--
-- Indexes for table `craft_migrations`
--
ALTER TABLE `craft_migrations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_migrations_pluginId_idx` (`pluginId`),
  ADD KEY `craft_migrations_type_pluginId_idx` (`type`,`pluginId`);

--
-- Indexes for table `craft_plugins`
--
ALTER TABLE `craft_plugins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_plugins_handle_unq_idx` (`handle`),
  ADD KEY `craft_plugins_enabled_idx` (`enabled`);

--
-- Indexes for table `craft_queue`
--
ALTER TABLE `craft_queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_queue_fail_timeUpdated_timePushed_idx` (`fail`,`timeUpdated`,`timePushed`),
  ADD KEY `craft_queue_fail_timeUpdated_delay_idx` (`fail`,`timeUpdated`,`delay`);

--
-- Indexes for table `craft_relations`
--
ALTER TABLE `craft_relations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_relations_fieldId_sourceId_sourceSiteId_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  ADD KEY `craft_relations_sourceId_idx` (`sourceId`),
  ADD KEY `craft_relations_targetId_idx` (`targetId`),
  ADD KEY `craft_relations_sourceSiteId_idx` (`sourceSiteId`);

--
-- Indexes for table `craft_resourcepaths`
--
ALTER TABLE `craft_resourcepaths`
  ADD PRIMARY KEY (`hash`);

--
-- Indexes for table `craft_routes`
--
ALTER TABLE `craft_routes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_routes_uriPattern_idx` (`uriPattern`),
  ADD KEY `craft_routes_siteId_idx` (`siteId`);

--
-- Indexes for table `craft_searchindex`
--
ALTER TABLE `craft_searchindex`
  ADD PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`);
ALTER TABLE `craft_searchindex` ADD FULLTEXT KEY `craft_searchindex_keywords_idx` (`keywords`);

--
-- Indexes for table `craft_sections`
--
ALTER TABLE `craft_sections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_sections_handle_unq_idx` (`handle`),
  ADD UNIQUE KEY `craft_sections_name_unq_idx` (`name`),
  ADD KEY `craft_sections_structureId_idx` (`structureId`);

--
-- Indexes for table `craft_sections_sites`
--
ALTER TABLE `craft_sections_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_sections_sites_sectionId_siteId_unq_idx` (`sectionId`,`siteId`),
  ADD KEY `craft_sections_sites_siteId_idx` (`siteId`);

--
-- Indexes for table `craft_sessions`
--
ALTER TABLE `craft_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_sessions_uid_idx` (`uid`),
  ADD KEY `craft_sessions_token_idx` (`token`),
  ADD KEY `craft_sessions_dateUpdated_idx` (`dateUpdated`),
  ADD KEY `craft_sessions_userId_idx` (`userId`);

--
-- Indexes for table `craft_shunnedmessages`
--
ALTER TABLE `craft_shunnedmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_shunnedmessages_userId_message_unq_idx` (`userId`,`message`);

--
-- Indexes for table `craft_sitegroups`
--
ALTER TABLE `craft_sitegroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_sitegroups_name_unq_idx` (`name`);

--
-- Indexes for table `craft_sites`
--
ALTER TABLE `craft_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_sites_handle_unq_idx` (`handle`),
  ADD KEY `craft_sites_sortOrder_idx` (`sortOrder`),
  ADD KEY `craft_sites_groupId_fk` (`groupId`);

--
-- Indexes for table `craft_structureelements`
--
ALTER TABLE `craft_structureelements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  ADD KEY `craft_structureelements_root_idx` (`root`),
  ADD KEY `craft_structureelements_lft_idx` (`lft`),
  ADD KEY `craft_structureelements_rgt_idx` (`rgt`),
  ADD KEY `craft_structureelements_level_idx` (`level`),
  ADD KEY `craft_structureelements_elementId_idx` (`elementId`);

--
-- Indexes for table `craft_structures`
--
ALTER TABLE `craft_structures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `craft_systemmessages`
--
ALTER TABLE `craft_systemmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_systemmessages_key_language_unq_idx` (`key`,`language`),
  ADD KEY `craft_systemmessages_language_idx` (`language`);

--
-- Indexes for table `craft_systemsettings`
--
ALTER TABLE `craft_systemsettings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_systemsettings_category_unq_idx` (`category`);

--
-- Indexes for table `craft_taggroups`
--
ALTER TABLE `craft_taggroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_taggroups_name_unq_idx` (`name`),
  ADD UNIQUE KEY `craft_taggroups_handle_unq_idx` (`handle`),
  ADD KEY `craft_taggroups_fieldLayoutId_fk` (`fieldLayoutId`);

--
-- Indexes for table `craft_tags`
--
ALTER TABLE `craft_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_tags_groupId_idx` (`groupId`);

--
-- Indexes for table `craft_templatecacheelements`
--
ALTER TABLE `craft_templatecacheelements`
  ADD KEY `craft_templatecacheelements_cacheId_idx` (`cacheId`),
  ADD KEY `craft_templatecacheelements_elementId_idx` (`elementId`);

--
-- Indexes for table `craft_templatecachequeries`
--
ALTER TABLE `craft_templatecachequeries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_templatecachequeries_cacheId_idx` (`cacheId`),
  ADD KEY `craft_templatecachequeries_type_idx` (`type`);

--
-- Indexes for table `craft_templatecaches`
--
ALTER TABLE `craft_templatecaches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_templatecaches_cacheKey_siteId_expiryDate_path_idx` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  ADD KEY `craft_templatecaches_cacheKey_siteId_expiryDate_idx` (`cacheKey`,`siteId`,`expiryDate`),
  ADD KEY `craft_templatecaches_siteId_idx` (`siteId`);

--
-- Indexes for table `craft_tokens`
--
ALTER TABLE `craft_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_tokens_token_unq_idx` (`token`),
  ADD KEY `craft_tokens_expiryDate_idx` (`expiryDate`);

--
-- Indexes for table `craft_usergroups`
--
ALTER TABLE `craft_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_usergroups_handle_unq_idx` (`handle`),
  ADD UNIQUE KEY `craft_usergroups_name_unq_idx` (`name`);

--
-- Indexes for table `craft_usergroups_users`
--
ALTER TABLE `craft_usergroups_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  ADD KEY `craft_usergroups_users_userId_idx` (`userId`);

--
-- Indexes for table `craft_userpermissions`
--
ALTER TABLE `craft_userpermissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_userpermissions_name_unq_idx` (`name`);

--
-- Indexes for table `craft_userpermissions_usergroups`
--
ALTER TABLE `craft_userpermissions_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  ADD KEY `craft_userpermissions_usergroups_groupId_idx` (`groupId`);

--
-- Indexes for table `craft_userpermissions_users`
--
ALTER TABLE `craft_userpermissions_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  ADD KEY `craft_userpermissions_users_userId_idx` (`userId`);

--
-- Indexes for table `craft_userpreferences`
--
ALTER TABLE `craft_userpreferences`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `craft_users`
--
ALTER TABLE `craft_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_users_username_unq_idx` (`username`),
  ADD UNIQUE KEY `craft_users_email_unq_idx` (`email`),
  ADD KEY `craft_users_uid_idx` (`uid`),
  ADD KEY `craft_users_verificationCode_idx` (`verificationCode`),
  ADD KEY `craft_users_photoId_fk` (`photoId`);

--
-- Indexes for table `craft_volumefolders`
--
ALTER TABLE `craft_volumefolders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_volumefolders_name_parentId_volumeId_unq_idx` (`name`,`parentId`,`volumeId`),
  ADD KEY `craft_volumefolders_parentId_idx` (`parentId`),
  ADD KEY `craft_volumefolders_volumeId_idx` (`volumeId`);

--
-- Indexes for table `craft_volumes`
--
ALTER TABLE `craft_volumes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_volumes_name_unq_idx` (`name`),
  ADD UNIQUE KEY `craft_volumes_handle_unq_idx` (`handle`),
  ADD KEY `craft_volumes_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indexes for table `craft_widgets`
--
ALTER TABLE `craft_widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_widgets_userId_idx` (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `craft_assetindexdata`
--
ALTER TABLE `craft_assetindexdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_assettransformindex`
--
ALTER TABLE `craft_assettransformindex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_assettransforms`
--
ALTER TABLE `craft_assettransforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_categorygroups`
--
ALTER TABLE `craft_categorygroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_categorygroups_sites`
--
ALTER TABLE `craft_categorygroups_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_content`
--
ALTER TABLE `craft_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `craft_craftidtokens`
--
ALTER TABLE `craft_craftidtokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_deprecationerrors`
--
ALTER TABLE `craft_deprecationerrors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2681;
--
-- AUTO_INCREMENT for table `craft_elementindexsettings`
--
ALTER TABLE `craft_elementindexsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_elements`
--
ALTER TABLE `craft_elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `craft_elements_sites`
--
ALTER TABLE `craft_elements_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `craft_entrydrafts`
--
ALTER TABLE `craft_entrydrafts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_entrytypes`
--
ALTER TABLE `craft_entrytypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `craft_entryversions`
--
ALTER TABLE `craft_entryversions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `craft_fieldgroups`
--
ALTER TABLE `craft_fieldgroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `craft_fieldlayoutfields`
--
ALTER TABLE `craft_fieldlayoutfields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;
--
-- AUTO_INCREMENT for table `craft_fieldlayouts`
--
ALTER TABLE `craft_fieldlayouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `craft_fieldlayouttabs`
--
ALTER TABLE `craft_fieldlayouttabs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `craft_fields`
--
ALTER TABLE `craft_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `craft_globalsets`
--
ALTER TABLE `craft_globalsets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `craft_info`
--
ALTER TABLE `craft_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `craft_matrixblocktypes`
--
ALTER TABLE `craft_matrixblocktypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `craft_matrixcontent_pagecontent`
--
ALTER TABLE `craft_matrixcontent_pagecontent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `craft_matrixcontent_socialmatrix`
--
ALTER TABLE `craft_matrixcontent_socialmatrix`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `craft_migrations`
--
ALTER TABLE `craft_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;
--
-- AUTO_INCREMENT for table `craft_plugins`
--
ALTER TABLE `craft_plugins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `craft_queue`
--
ALTER TABLE `craft_queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_relations`
--
ALTER TABLE `craft_relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `craft_routes`
--
ALTER TABLE `craft_routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_sections`
--
ALTER TABLE `craft_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `craft_sections_sites`
--
ALTER TABLE `craft_sections_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `craft_sessions`
--
ALTER TABLE `craft_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `craft_shunnedmessages`
--
ALTER TABLE `craft_shunnedmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_sitegroups`
--
ALTER TABLE `craft_sitegroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `craft_sites`
--
ALTER TABLE `craft_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `craft_structureelements`
--
ALTER TABLE `craft_structureelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_structures`
--
ALTER TABLE `craft_structures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_systemmessages`
--
ALTER TABLE `craft_systemmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_systemsettings`
--
ALTER TABLE `craft_systemsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `craft_taggroups`
--
ALTER TABLE `craft_taggroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_templatecachequeries`
--
ALTER TABLE `craft_templatecachequeries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_templatecaches`
--
ALTER TABLE `craft_templatecaches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_tokens`
--
ALTER TABLE `craft_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_usergroups`
--
ALTER TABLE `craft_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_usergroups_users`
--
ALTER TABLE `craft_usergroups_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_userpermissions`
--
ALTER TABLE `craft_userpermissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_userpermissions_usergroups`
--
ALTER TABLE `craft_userpermissions_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_userpermissions_users`
--
ALTER TABLE `craft_userpermissions_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_userpreferences`
--
ALTER TABLE `craft_userpreferences`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `craft_volumefolders`
--
ALTER TABLE `craft_volumefolders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `craft_volumes`
--
ALTER TABLE `craft_volumes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `craft_widgets`
--
ALTER TABLE `craft_widgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `craft_assetindexdata`
--
ALTER TABLE `craft_assetindexdata`
  ADD CONSTRAINT `craft_assetindexdata_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `craft_volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_assets`
--
ALTER TABLE `craft_assets`
  ADD CONSTRAINT `craft_assets_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `craft_volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_assets_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_assets_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `craft_volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_categories`
--
ALTER TABLE `craft_categories`
  ADD CONSTRAINT `craft_categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_categories_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_categorygroups`
--
ALTER TABLE `craft_categorygroups`
  ADD CONSTRAINT `craft_categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `craft_categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_categorygroups_sites`
--
ALTER TABLE `craft_categorygroups_sites`
  ADD CONSTRAINT `craft_categorygroups_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_categorygroups_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_content`
--
ALTER TABLE `craft_content`
  ADD CONSTRAINT `craft_content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_content_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_craftidtokens`
--
ALTER TABLE `craft_craftidtokens`
  ADD CONSTRAINT `craft_craftidtokens_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_elements`
--
ALTER TABLE `craft_elements`
  ADD CONSTRAINT `craft_elements_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_elements_sites`
--
ALTER TABLE `craft_elements_sites`
  ADD CONSTRAINT `craft_elements_sites_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_elements_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_entries`
--
ALTER TABLE `craft_entries`
  ADD CONSTRAINT `craft_entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_entries_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_entrytypes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_entrydrafts`
--
ALTER TABLE `craft_entrydrafts`
  ADD CONSTRAINT `craft_entrydrafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_entrydrafts_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `craft_entries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_entrydrafts_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_entrydrafts_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_entrytypes`
--
ALTER TABLE `craft_entrytypes`
  ADD CONSTRAINT `craft_entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `craft_entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_entryversions`
--
ALTER TABLE `craft_entryversions`
  ADD CONSTRAINT `craft_entryversions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `craft_entryversions_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `craft_entries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_entryversions_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_entryversions_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_fieldlayoutfields`
--
ALTER TABLE `craft_fieldlayoutfields`
  ADD CONSTRAINT `craft_fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `craft_fieldlayouttabs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_fieldlayouttabs`
--
ALTER TABLE `craft_fieldlayouttabs`
  ADD CONSTRAINT `craft_fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_fields`
--
ALTER TABLE `craft_fields`
  ADD CONSTRAINT `craft_fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_fieldgroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_globalsets`
--
ALTER TABLE `craft_globalsets`
  ADD CONSTRAINT `craft_globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `craft_globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_matrixblocks`
--
ALTER TABLE `craft_matrixblocks`
  ADD CONSTRAINT `craft_matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_matrixblocks_ownerSiteId_fk` FOREIGN KEY (`ownerSiteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `craft_matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_matrixblocktypes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_matrixblocktypes`
--
ALTER TABLE `craft_matrixblocktypes`
  ADD CONSTRAINT `craft_matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_matrixcontent_pagecontent`
--
ALTER TABLE `craft_matrixcontent_pagecontent`
  ADD CONSTRAINT `craft_matrixcontent_pagecontent_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_matrixcontent_pagecontent_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_matrixcontent_socialmatrix`
--
ALTER TABLE `craft_matrixcontent_socialmatrix`
  ADD CONSTRAINT `craft_matrixcontent_socialmatrix_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_matrixcontent_socialmatrix_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_migrations`
--
ALTER TABLE `craft_migrations`
  ADD CONSTRAINT `craft_migrations_pluginId_fk` FOREIGN KEY (`pluginId`) REFERENCES `craft_plugins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_relations`
--
ALTER TABLE `craft_relations`
  ADD CONSTRAINT `craft_relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_relations_sourceSiteId_fk` FOREIGN KEY (`sourceSiteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `craft_relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_routes`
--
ALTER TABLE `craft_routes`
  ADD CONSTRAINT `craft_routes_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_sections`
--
ALTER TABLE `craft_sections`
  ADD CONSTRAINT `craft_sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_sections_sites`
--
ALTER TABLE `craft_sections_sites`
  ADD CONSTRAINT `craft_sections_sites_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_sections_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_sessions`
--
ALTER TABLE `craft_sessions`
  ADD CONSTRAINT `craft_sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_shunnedmessages`
--
ALTER TABLE `craft_shunnedmessages`
  ADD CONSTRAINT `craft_shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_sites`
--
ALTER TABLE `craft_sites`
  ADD CONSTRAINT `craft_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_sitegroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_structureelements`
--
ALTER TABLE `craft_structureelements`
  ADD CONSTRAINT `craft_structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_taggroups`
--
ALTER TABLE `craft_taggroups`
  ADD CONSTRAINT `craft_taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_tags`
--
ALTER TABLE `craft_tags`
  ADD CONSTRAINT `craft_tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_taggroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_tags_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_templatecacheelements`
--
ALTER TABLE `craft_templatecacheelements`
  ADD CONSTRAINT `craft_templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `craft_templatecaches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_templatecachequeries`
--
ALTER TABLE `craft_templatecachequeries`
  ADD CONSTRAINT `craft_templatecachequeries_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `craft_templatecaches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_templatecaches`
--
ALTER TABLE `craft_templatecaches`
  ADD CONSTRAINT `craft_templatecaches_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_usergroups_users`
--
ALTER TABLE `craft_usergroups_users`
  ADD CONSTRAINT `craft_usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_userpermissions_usergroups`
--
ALTER TABLE `craft_userpermissions_usergroups`
  ADD CONSTRAINT `craft_userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_userpermissions_users`
--
ALTER TABLE `craft_userpermissions_users`
  ADD CONSTRAINT `craft_userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_userpreferences`
--
ALTER TABLE `craft_userpreferences`
  ADD CONSTRAINT `craft_userpreferences_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_users`
--
ALTER TABLE `craft_users`
  ADD CONSTRAINT `craft_users_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_users_photoId_fk` FOREIGN KEY (`photoId`) REFERENCES `craft_assets` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_volumefolders`
--
ALTER TABLE `craft_volumefolders`
  ADD CONSTRAINT `craft_volumefolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `craft_volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_volumefolders_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `craft_volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_volumes`
--
ALTER TABLE `craft_volumes`
  ADD CONSTRAINT `craft_volumes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_widgets`
--
ALTER TABLE `craft_widgets`
  ADD CONSTRAINT `craft_widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
