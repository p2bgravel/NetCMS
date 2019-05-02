-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 02, 2019 at 11:33 AM
-- Server version: 5.7.23
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `cms_core_ncc_category`
--

CREATE TABLE `cms_core_ncc_category` (
  `Id` bigint(20) NOT NULL,
  `CategoryImage` longtext,
  `CreateBy` bigint(20) NOT NULL,
  `CreationDate` datetime(6) NOT NULL,
  `Metadata` longtext,
  `ModificationDate` datetime(6) NOT NULL,
  `ModifyBy` bigint(20) NOT NULL,
  `Name` longtext,
  `ParentId` bigint(20) DEFAULT NULL,
  `Status` int(11) NOT NULL,
  `VersionNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_core_ncc_category`
--

INSERT INTO `cms_core_ncc_category` (`Id`, `CategoryImage`, `CreateBy`, `CreationDate`, `Metadata`, `ModificationDate`, `ModifyBy`, `Name`, `ParentId`, `Status`, `VersionNumber`) VALUES
(1, '/media/Images/2017/06/image-slider-0.jpg', 0, '2019-05-02 11:32:47.953125', 'DEMODATA', '2019-05-02 11:32:47.953125', 0, 'Sample Category ', NULL, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cms_core_ncc_category_details`
--

CREATE TABLE `cms_core_ncc_category_details` (
  `Id` bigint(20) NOT NULL,
  `CategoryId` bigint(20) DEFAULT NULL,
  `CreateBy` bigint(20) NOT NULL,
  `CreationDate` datetime(6) NOT NULL,
  `Language` longtext,
  `MetaDescription` longtext,
  `MetaKeyword` longtext,
  `Metadata` longtext,
  `ModificationDate` datetime(6) NOT NULL,
  `ModifyBy` bigint(20) NOT NULL,
  `Name` longtext,
  `Slug` longtext,
  `Status` int(11) NOT NULL,
  `Title` longtext,
  `VersionNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_core_ncc_category_details`
--

INSERT INTO `cms_core_ncc_category_details` (`Id`, `CategoryId`, `CreateBy`, `CreationDate`, `Language`, `MetaDescription`, `MetaKeyword`, `Metadata`, `ModificationDate`, `ModifyBy`, `Name`, `Slug`, `Status`, `Title`, `VersionNumber`) VALUES
(1, 1, 0, '2019-05-02 11:32:47.952164', 'en', NULL, NULL, '', '2019-05-02 11:32:47.952165', 0, 'Sample-Category', 'Sample-Category', 0, 'Sample Category ', 1),
(2, 1, 0, '2019-05-02 11:32:47.952382', 'bn', NULL, NULL, '', '2019-05-02 11:32:47.952383', 0, 'নমুনা-ক্যাটাগরি', 'নমুনা-ক্যাটাগরি', 0, 'নমুনা ক্যাটাগরি ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cms_core_ncc_comment`
--

CREATE TABLE `cms_core_ncc_comment` (
  `Id` bigint(20) NOT NULL,
  `AuthorId` bigint(20) DEFAULT NULL,
  `AuthorName` longtext,
  `CommentStatus` int(11) NOT NULL,
  `Content` longtext,
  `CreateBy` bigint(20) NOT NULL,
  `CreationDate` datetime(6) NOT NULL,
  `Email` longtext,
  `Metadata` longtext,
  `ModificationDate` datetime(6) NOT NULL,
  `ModifyBy` bigint(20) NOT NULL,
  `Name` longtext,
  `PostId` bigint(20) DEFAULT NULL,
  `Status` int(11) NOT NULL,
  `Title` longtext,
  `VersionNumber` int(11) NOT NULL,
  `WebSite` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_core_ncc_comment`
--

INSERT INTO `cms_core_ncc_comment` (`Id`, `AuthorId`, `AuthorName`, `CommentStatus`, `Content`, `CreateBy`, `CreationDate`, `Email`, `Metadata`, `ModificationDate`, `ModifyBy`, `Name`, `PostId`, `Status`, `Title`, `VersionNumber`, `WebSite`) VALUES
(1, NULL, NULL, 1, 'This is a sample comment.', 0, '2019-05-02 11:32:48.711447', NULL, 'DEMODATA', '2019-05-02 11:32:48.711447', 0, 'Sample Comments', 1, 0, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_core_ncc_menu`
--

CREATE TABLE `cms_core_ncc_menu` (
  `Id` bigint(20) NOT NULL,
  `CreateBy` bigint(20) NOT NULL,
  `CreationDate` datetime(6) NOT NULL,
  `MenuIconCls` longtext,
  `MenuLanguage` longtext,
  `MenuOrder` int(11) NOT NULL,
  `Metadata` longtext,
  `ModificationDate` datetime(6) NOT NULL,
  `ModifyBy` bigint(20) NOT NULL,
  `Name` longtext,
  `Position` longtext,
  `Status` int(11) NOT NULL,
  `VersionNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_core_ncc_menu`
--

INSERT INTO `cms_core_ncc_menu` (`Id`, `CreateBy`, `CreationDate`, `MenuIconCls`, `MenuLanguage`, `MenuOrder`, `Metadata`, `ModificationDate`, `ModifyBy`, `Name`, `Position`, `Status`, `VersionNumber`) VALUES
(1, 0, '2019-05-02 11:32:48.742918', NULL, '', 1, '', '2019-05-02 11:32:48.742918', 0, 'Main Menu', 'Navigation', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cms_core_ncc_menu_item`
--

CREATE TABLE `cms_core_ncc_menu_item` (
  `Id` bigint(20) NOT NULL,
  `Action` longtext,
  `Controller` longtext,
  `Area` longtext,
  `CreateBy` bigint(20) NOT NULL,
  `CreationDate` datetime(6) NOT NULL,
  `Data` longtext,
  `MenuActionType` int(11) NOT NULL,
  `MenuFor` int(11) NOT NULL,
  `MenuIconCls` longtext,
  `MenuOrder` int(11) NOT NULL,
  `Metadata` longtext,
  `ModificationDate` datetime(6) NOT NULL,
  `ModifyBy` bigint(20) NOT NULL,
  `Module` longtext,
  `Name` longtext,
  `NccMenuId` bigint(20) DEFAULT NULL,
  `NccMenuItemId` bigint(20) DEFAULT NULL,
  `NccMenuItemId1` bigint(20) DEFAULT NULL,
  `ParentId` bigint(20) DEFAULT NULL,
  `Position` int(11) NOT NULL,
  `Status` int(11) NOT NULL,
  `Target` longtext,
  `Url` longtext,
  `IsAnonymous` bit(1) NOT NULL DEFAULT b'0',
  `IsAllowAuthenticated` bit(1) NOT NULL DEFAULT b'0',
  `VersionNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_core_ncc_menu_item`
--

INSERT INTO `cms_core_ncc_menu_item` (`Id`, `Action`, `Controller`, `Area`, `CreateBy`, `CreationDate`, `Data`, `MenuActionType`, `MenuFor`, `MenuIconCls`, `MenuOrder`, `Metadata`, `ModificationDate`, `ModifyBy`, `Module`, `Name`, `NccMenuId`, `NccMenuItemId`, `NccMenuItemId1`, `ParentId`, `Position`, `Status`, `Target`, `Url`, `IsAnonymous`, `IsAllowAuthenticated`, `VersionNumber`) VALUES
(1, '', '', NULL, 0, '2019-05-02 11:32:48.741742', '', 0, 0, NULL, 1, '', '2019-05-02 11:32:48.741743', 0, '', 'Home', 1, NULL, NULL, NULL, 0, 0, '_self', '/', b'0', b'0', 1),
(2, '', '', NULL, 0, '2019-05-02 11:32:48.742255', '', 0, 0, NULL, 2, '', '2019-05-02 11:32:48.742256', 0, '', 'Sample Page', 1, NULL, NULL, NULL, 0, 0, '_self', '/Sample-Page', b'0', b'0', 1),
(3, '', '', NULL, 0, '2019-05-02 11:32:48.742272', '', 0, 0, NULL, 3, '', '2019-05-02 11:32:48.742272', 0, '', 'Blog Posts', 1, NULL, NULL, NULL, 0, 0, '_self', '/Post', b'0', b'0', 1),
(4, '', '', NULL, 0, '2019-05-02 11:32:48.742274', '', 0, 0, NULL, 4, '', '2019-05-02 11:32:48.742274', 0, '', 'Blog Categories', 1, NULL, NULL, NULL, 0, 0, '_self', '/Category', b'0', b'0', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cms_core_ncc_module`
--

CREATE TABLE `cms_core_ncc_module` (
  `Id` bigint(20) NOT NULL,
  `ExecutionOrder` int(11) NOT NULL DEFAULT '100',
  `AntiForgery` bit(1) NOT NULL,
  `Author` longtext,
  `Category` longtext,
  `CreateBy` bigint(20) NOT NULL,
  `CreationDate` datetime(6) NOT NULL,
  `Description` longtext,
  `Folder` longtext,
  `IsCore` bit(1) NOT NULL,
  `Metadata` longtext,
  `NccVersion` longtext,
  `ModificationDate` datetime(6) NOT NULL,
  `ModifyBy` bigint(20) NOT NULL,
  `ModuleName` longtext,
  `ModuleStatus` int(11) NOT NULL,
  `ModuleTitle` longtext,
  `Name` longtext,
  `Path` longtext,
  `Status` int(11) NOT NULL,
  `Version` longtext,
  `VersionNumber` int(11) NOT NULL,
  `WebSite` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_core_ncc_module`
--

INSERT INTO `cms_core_ncc_module` (`Id`, `ExecutionOrder`, `AntiForgery`, `Author`, `Category`, `CreateBy`, `CreationDate`, `Description`, `Folder`, `IsCore`, `Metadata`, `NccVersion`, `ModificationDate`, `ModifyBy`, `ModuleName`, `ModuleStatus`, `ModuleTitle`, `Name`, `Path`, `Status`, `Version`, `VersionNumber`, `WebSite`) VALUES
(1, 100, b'1', 'NetCoreCMS', 'Core', 0, '2019-05-02 11:32:52.061013', 'Builtin Content Management System Module.', 'Core.Cms', b'1', '', '0.4.5', '2019-05-02 11:32:52.061013', 0, 'Core.Cms', 3, 'CMS', 'Core.Cms', '/Users/nguyenpham/SourceCode/NetCMS/NetCoreCMS.Web/Core/Core.Cms', 0, '0.1.1', 1, 'http://DotNetCoreCMS.com'),
(2, 100, b'1', 'NetCoreCMS', 'Core', 0, '2019-05-02 11:32:52.098980', 'Builtin Administration for Content Management.', 'Core.Admin', b'1', '', '0.4.5', '2019-05-02 11:32:52.098980', 0, 'Core.Admin', 3, 'CMS Administration', 'Core.Admin', '/Users/nguyenpham/SourceCode/NetCMS/NetCoreCMS.Web/Core/Core.Admin', 0, '0.1.1', 1, 'http://DotNetCoreCMS.com'),
(3, 100, b'1', 'NetCoreCMS', 'Core', 0, '2019-05-02 11:32:52.104799', 'Builtin Blog Module.', 'Core.Blog', b'1', '', '0.4.5', '2019-05-02 11:32:52.104799', 0, 'Core.Blog', 3, 'Blog', 'Core.Blog', '/Users/nguyenpham/SourceCode/NetCMS/NetCoreCMS.Web/Core/Core.Blog', 0, '0.1.1', 1, 'http://DotNetCoreCMS.com'),
(4, 100, b'1', 'NetCoreCMS', 'Core', 0, '2019-05-02 11:32:52.109553', 'Builtin Media module for Content Management.', 'Core.Media', b'1', '', '0.4.5', '2019-05-02 11:32:52.109553', 0, 'Core.Media', 3, 'CMS Media', 'Core.Media', '/Users/nguyenpham/SourceCode/NetCMS/NetCoreCMS.Web/Core/Core.Media', 0, '0.1.1', 1, 'http://DotNetCoreCMS.com'),
(5, 100, b'1', 'NetCoreCMS', 'Link,share,notice,News', 0, '2019-05-02 11:32:52.115327', 'Easy and smart News Module.', 'NetCoreCMS.EasyNews', b'0', '', '0.4.5', '2019-05-02 11:32:52.115327', 0, 'NetCoreCMS.EasyNews', 0, 'Easy News', 'NetCoreCMS.EasyNews', '/Users/nguyenpham/SourceCode/NetCMS/NetCoreCMS.Web/Modules/NetCoreCMS.EasyNews', 0, '1.1', 1, 'http://DotNetCoreCMS.com'),
(6, 100, b'1', 'NetCoreCMS', 'Demo, data', 0, '2019-05-02 11:32:52.119609', 'Builtin Demo data for page and blog Module.', 'NetCoreCMS.DemoData', b'0', '', '0.4.5', '2019-05-02 11:32:52.119609', 0, 'NetCoreCMS.DemoData', 0, 'Demo Data', 'NetCoreCMS.DemoData', '/Users/nguyenpham/SourceCode/NetCMS/NetCoreCMS.Web/Modules/NetCoreCMS.DemoData', 0, '0.1.1', 1, 'http://DotNetCoreCMS.com'),
(7, 100, b'1', 'NetCoreCMS', 'Image,Slider,Media', 0, '2019-05-02 11:32:52.124325', 'Builtin ImageSlider Module.', 'NetCoreCMS.ImageSlider', b'0', '', '0.4.5', '2019-05-02 11:32:52.124325', 0, 'NetCoreCMS.ImageSlider', 0, 'Image Slider', 'NetCoreCMS.ImageSlider', '/Users/nguyenpham/SourceCode/NetCMS/NetCoreCMS.Web/Modules/NetCoreCMS.ImageSlider', 0, '1.0', 1, 'http://DotNetCoreCMS.com'),
(8, 100, b'1', 'NetCoreCMS', 'HelloWorld,Example', 0, '2019-05-02 11:32:52.128942', 'Builtin Content Management Example Module.', 'NetCoreCMS.HelloWorld', b'0', '', '0.4.5', '2019-05-02 11:32:52.128942', 0, 'NetCoreCMS.HelloWorld', 0, 'NetCoreCMS HelloWorld', 'NetCoreCMS.HelloWorld', '/Users/nguyenpham/SourceCode/NetCMS/NetCoreCMS.Web/Modules/NetCoreCMS.HelloWorld', 0, '0.1.1', 1, 'http://DotNetCoreCMS.com');

-- --------------------------------------------------------

--
-- Table structure for table `cms_core_ncc_module_dependency`
--

CREATE TABLE `cms_core_ncc_module_dependency` (
  `Id` bigint(20) NOT NULL,
  `CreateBy` bigint(20) NOT NULL,
  `CreationDate` datetime(6) NOT NULL,
  `Metadata` longtext,
  `ModuleVersion` longtext,
  `ModificationDate` datetime(6) NOT NULL,
  `ModifyBy` bigint(20) NOT NULL,
  `ModuleName` longtext,
  `Name` longtext,
  `NccModuleId` bigint(20) DEFAULT NULL,
  `Status` int(11) NOT NULL,
  `VersionNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_core_ncc_page`
--

CREATE TABLE `cms_core_ncc_page` (
  `Id` bigint(20) NOT NULL,
  `CreateBy` bigint(20) NOT NULL,
  `CreationDate` datetime(6) NOT NULL,
  `Layout` longtext,
  `Metadata` longtext,
  `ModificationDate` datetime(6) NOT NULL,
  `ModifyBy` bigint(20) NOT NULL,
  `Name` longtext,
  `PageOrder` int(11) NOT NULL,
  `PageStatus` int(11) NOT NULL,
  `PageType` int(11) NOT NULL,
  `ParentId` bigint(20) DEFAULT NULL,
  `PublishDate` datetime(6) NOT NULL,
  `Status` int(11) NOT NULL,
  `VersionNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_core_ncc_page`
--

INSERT INTO `cms_core_ncc_page` (`Id`, `CreateBy`, `CreationDate`, `Layout`, `Metadata`, `ModificationDate`, `ModifyBy`, `Name`, `PageOrder`, `PageStatus`, `PageType`, `ParentId`, `PublishDate`, `Status`, `VersionNumber`) VALUES
(1, 0, '2019-05-02 11:32:47.890305', 'SiteLayout', 'DEMODATA', '2019-05-02 11:32:47.890305', 0, 'Sample Page ', 0, 2, 0, NULL, '2019-05-02 11:32:47.888476', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cms_core_ncc_page_details`
--

CREATE TABLE `cms_core_ncc_page_details` (
  `Id` bigint(20) NOT NULL,
  `Content` longtext,
  `CreateBy` bigint(20) NOT NULL,
  `CreationDate` datetime(6) NOT NULL,
  `Language` longtext,
  `MetaDescription` longtext,
  `MetaKeyword` longtext,
  `Metadata` longtext,
  `ModificationDate` datetime(6) NOT NULL,
  `ModifyBy` bigint(20) NOT NULL,
  `Name` longtext,
  `PageId` bigint(20) DEFAULT NULL,
  `Slug` longtext,
  `Status` int(11) NOT NULL,
  `Title` longtext,
  `VersionNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_core_ncc_page_details`
--

INSERT INTO `cms_core_ncc_page_details` (`Id`, `Content`, `CreateBy`, `CreationDate`, `Language`, `MetaDescription`, `MetaKeyword`, `Metadata`, `ModificationDate`, `ModifyBy`, `Name`, `PageId`, `Slug`, `Status`, `Title`, `VersionNumber`) VALUES
(1, '<h1 style=\"text-align:center\">Sample Page </h1><p>This is a sample page.</p>', 0, '2019-05-02 11:32:47.888747', 'en', 'Sample Page  This is a sample page.', NULL, '', '2019-05-02 11:32:47.888748', 0, 'Sample-Page', 1, 'Sample-Page', 0, 'Sample Page ', 1),
(2, '<h1 style=\"text-align:center\">নমুনা পৃষ্ঠা </h1><p>এটি একটি নমুনা পাতা।</p>', 0, '2019-05-02 11:32:47.889056', 'bn', 'নমুনা পৃষ্ঠা  এটি একটি নমুনা পাতা।', NULL, '', '2019-05-02 11:32:47.889057', 0, 'নমুনা-পৃষ্ঠা', 1, 'নমুনা-পৃষ্ঠা', 0, 'নমুনা পৃষ্ঠা ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cms_core_ncc_page_details_history`
--

CREATE TABLE `cms_core_ncc_page_details_history` (
  `Id` bigint(20) NOT NULL,
  `Content` longtext,
  `CreateBy` bigint(20) NOT NULL,
  `CreationDate` datetime(6) NOT NULL,
  `Language` longtext,
  `MetaDescription` longtext,
  `MetaKeyword` longtext,
  `Metadata` longtext,
  `ModificationDate` datetime(6) NOT NULL,
  `ModifyBy` bigint(20) NOT NULL,
  `Name` longtext,
  `PageDetailsId` bigint(20) NOT NULL,
  `PageHistoryId` bigint(20) DEFAULT NULL,
  `Slug` longtext,
  `Status` int(11) NOT NULL,
  `Title` longtext,
  `VersionNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_core_ncc_page_history`
--

CREATE TABLE `cms_core_ncc_page_history` (
  `Id` bigint(20) NOT NULL,
  `CreateBy` bigint(20) NOT NULL,
  `CreationDate` datetime(6) NOT NULL,
  `Layout` longtext,
  `Metadata` longtext,
  `ModificationDate` datetime(6) NOT NULL,
  `ModifyBy` bigint(20) NOT NULL,
  `Name` longtext,
  `PageId` bigint(20) NOT NULL,
  `PageOrder` int(11) NOT NULL,
  `PageStatus` int(11) NOT NULL,
  `PageType` int(11) NOT NULL,
  `ParentId` bigint(20) DEFAULT NULL,
  `PublishDate` datetime(6) NOT NULL,
  `Status` int(11) NOT NULL,
  `VersionNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_core_ncc_permission`
--

CREATE TABLE `cms_core_ncc_permission` (
  `Id` bigint(20) NOT NULL,
  `CreateBy` bigint(20) NOT NULL,
  `CreationDate` datetime(6) NOT NULL,
  `Description` longtext,
  `Group` longtext,
  `Metadata` longtext,
  `ModificationDate` datetime(6) NOT NULL,
  `ModifyBy` bigint(20) NOT NULL,
  `Name` longtext,
  `Rank` int(11) NOT NULL,
  `Status` int(11) NOT NULL,
  `VersionNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_core_ncc_permission`
--

INSERT INTO `cms_core_ncc_permission` (`Id`, `CreateBy`, `CreationDate`, `Description`, `Group`, `Metadata`, `ModificationDate`, `ModifyBy`, `Name`, `Rank`, `Status`, `VersionNumber`) VALUES
(1, 0, '2019-05-02 11:32:46.229590', 'Permission for Administrative users.', 'NetCoreCMS', '', '2019-05-02 11:32:46.229590', 0, 'Administrator', 1, 0, 1),
(2, 0, '2019-05-02 11:32:46.427406', 'Permission for Managers.', 'NetCoreCMS', '', '2019-05-02 11:32:46.427406', 0, 'Manager', 2, 0, 1),
(3, 0, '2019-05-02 11:32:46.432862', 'Permission for Editor.', 'NetCoreCMS', '', '2019-05-02 11:32:46.432862', 0, 'Editor', 3, 0, 1),
(4, 0, '2019-05-02 11:32:46.433374', 'Permission for Authors.', 'NetCoreCMS', '', '2019-05-02 11:32:46.433374', 0, 'Author', 4, 0, 1),
(5, 0, '2019-05-02 11:32:46.433667', 'Permission for Contributor.', 'NetCoreCMS', '', '2019-05-02 11:32:46.433667', 0, 'Contributor', 5, 0, 1),
(6, 0, '2019-05-02 11:32:46.434019', 'Permission for Subscriber.', 'NetCoreCMS', '', '2019-05-02 11:32:46.434019', 0, 'Subscriber', 1000, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cms_core_ncc_permission_details`
--

CREATE TABLE `cms_core_ncc_permission_details` (
  `Id` bigint(20) NOT NULL,
  `Action` longtext,
  `Controller` longtext,
  `CreateBy` bigint(20) NOT NULL,
  `CreationDate` datetime(6) NOT NULL,
  `ExtraAllowUserId` bigint(20) DEFAULT NULL,
  `ExtraDenyUserId` bigint(20) DEFAULT NULL,
  `MenuType` longtext,
  `Metadata` longtext,
  `ModificationDate` datetime(6) NOT NULL,
  `ModifyBy` bigint(20) NOT NULL,
  `ModuleName` longtext,
  `Name` longtext,
  `Order` int(11) NOT NULL,
  `PermissionId` bigint(20) DEFAULT NULL,
  `Requirements` longtext,
  `Status` int(11) NOT NULL,
  `VersionNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_core_ncc_permission_details`
--

INSERT INTO `cms_core_ncc_permission_details` (`Id`, `Action`, `Controller`, `CreateBy`, `CreationDate`, `ExtraAllowUserId`, `ExtraDenyUserId`, `MenuType`, `Metadata`, `ModificationDate`, `ModifyBy`, `ModuleName`, `Name`, `Order`, `PermissionId`, `Requirements`, `Status`, `VersionNumber`) VALUES
(1, 'Index', 'Admin', 0, '2017-11-18 21:57:55.962886', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.962887', 0, 'Core.Admin', 'Admin Index', 4, 1, NULL, 0, 1),
(2, 'Manage', 'Tags', 0, '2017-11-18 21:57:55.963505', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963505', 0, 'Core.Blog', 'Tags', 7, 2, NULL, 0, 1),
(3, 'Index', 'CmsMenu', 0, '2017-11-18 21:57:55.963577', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963577', 0, 'Core.Cms', 'Menu', 1, 2, NULL, 0, 1),
(4, 'CreateEdit', 'CmsPage', 0, '2017-11-18 21:57:55.963580', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963580', 0, 'Core.Cms', 'New page', 3, 2, NULL, 0, 1),
(5, 'Manage', 'CmsPage', 0, '2017-11-18 21:57:55.963581', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963581', 0, 'Core.Cms', 'Manage', 1, 2, NULL, 0, 1),
(6, 'Upload', 'MediaHome', 0, '2017-11-18 21:57:55.963641', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963641', 0, 'Core.Media', 'Upload', 5, 2, NULL, 0, 1),
(7, 'Index', 'MediaHome', 0, '2017-11-18 21:57:55.963643', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963643', 0, 'Core.Media', 'Manage Gallary', 1, 2, NULL, 0, 1),
(8, 'ManageFiles', 'MediaHome', 0, '2017-11-18 21:57:55.963644', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963644', 0, 'Core.Media', 'Manage Files', 3, 2, NULL, 0, 1),
(9, 'Index', 'Admin', 0, '2017-11-18 21:57:55.962886', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.962887', 0, 'Core.Admin', 'Admin Index', 4, 3, NULL, 0, 1),
(10, 'Index', 'Dashboard', 0, '2017-11-18 21:57:55.962886', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.962887', 0, 'Core.Admin', 'Dashboard', 4, 3, NULL, 0, 1),
(11, 'TranslationFiles', 'Language', 0, '2017-11-18 21:57:55.963441', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963441', 0, 'Core.Admin', 'Translation', 200, 3, NULL, 0, 1),
(12, 'Manage', 'Comments', 0, '2017-11-18 21:57:55.963496', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963496', 0, 'Core.Blog', 'Manage Comments', 9, 3, NULL, 0, 1),
(13, 'CreateEdit', 'Post', 0, '2017-11-18 21:57:55.963498', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963498', 0, 'Core.Blog', 'New post', 3, 3, NULL, 0, 1),
(14, 'Manage', 'Post', 0, '2017-11-18 21:57:55.963499', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963499', 0, 'Core.Blog', 'Manage post', 1, 3, NULL, 0, 1),
(15, 'Manage', 'Category', 0, '2017-11-18 21:57:55.963503', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963503', 0, 'Core.Blog', 'Category', 5, 3, NULL, 0, 1),
(16, 'Manage', 'Category', 0, '2017-11-18 21:57:55.963503', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963503', 0, 'Core.Blog', 'Category', 5, 2, NULL, 0, 1),
(17, 'Manage', 'Tags', 0, '2017-11-18 21:57:55.963505', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963505', 0, 'Core.Blog', 'Tags', 7, 3, NULL, 0, 1),
(18, 'Index', 'MediaHome', 0, '2017-11-18 21:57:55.963643', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963643', 0, 'Core.Media', 'Manage Gallary', 1, 3, NULL, 0, 1),
(19, 'ManageFiles', 'MediaHome', 0, '2017-11-18 21:57:55.963644', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963644', 0, 'Core.Media', 'Manage Files', 3, 3, NULL, 0, 1),
(20, 'Index', 'Admin', 0, '2017-11-18 21:57:55.962886', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.962887', 0, 'Core.Admin', 'Admin Index', 4, 4, NULL, 0, 1),
(21, 'Index', 'Dashboard', 0, '2017-11-18 21:57:55.962886', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.962887', 0, 'Core.Admin', 'Dashboard', 4, 4, NULL, 0, 1),
(22, 'Manage', 'CommentsAuthor', 0, '2017-11-18 21:57:55.963496', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963496', 0, 'Core.Blog', 'Manage Comments', 9, 4, NULL, 0, 1),
(23, 'CreateEdit', 'PostAuthor', 0, '2017-11-18 21:57:55.963498', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963498', 0, 'Core.Blog', 'New post', 3, 4, NULL, 0, 1),
(24, 'Manage', 'PostAuthor', 0, '2017-11-18 21:57:55.963499', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963499', 0, 'Core.Blog', 'Manage post', 1, 4, NULL, 0, 1),
(25, 'Upload', 'MediaHome', 0, '2017-11-18 21:57:55.963641', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963641', 0, 'Core.Media', 'Upload', 5, 4, NULL, 0, 1),
(26, 'Index', 'MediaHome', 0, '2017-11-18 21:57:55.963643', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963643', 0, 'Core.Media', 'Manage Gallary', 1, 4, NULL, 0, 1),
(27, 'Index', 'Admin', 0, '2017-11-18 21:57:55.962886', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.962887', 0, 'Core.Admin', 'Admin Index', 4, 5, NULL, 0, 1),
(28, 'Index', 'Dashboard', 0, '2017-11-18 21:57:55.962886', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.962887', 0, 'Core.Admin', 'Dashboard', 4, 5, NULL, 0, 1),
(29, 'CreateEdit', 'PostAuthor', 0, '2017-11-18 21:57:55.963498', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963498', 0, 'Core.Blog', 'New post', 3, 5, NULL, 0, 1),
(30, 'Manage', 'PostAuthor', 0, '2017-11-18 21:57:55.963499', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963499', 0, 'Core.Blog', 'Manage post', 1, 5, NULL, 0, 1),
(31, 'Manage', 'Post', 0, '2017-11-18 21:57:55.963499', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963499', 0, 'Core.Blog', 'Manage post', 1, 5, NULL, 0, 1),
(32, 'Upload', 'MediaHome', 0, '2017-11-18 21:57:55.963641', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963641', 0, 'Core.Media', 'Upload', 5, 3, NULL, 0, 1),
(33, 'Manage', 'Post', 0, '2017-11-18 21:57:55.963499', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963499', 0, 'Core.Blog', 'Manage post', 1, 2, NULL, 0, 1),
(34, 'CreateEdit', 'Post', 0, '2017-11-18 21:57:55.963498', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963498', 0, 'Core.Blog', 'New post', 3, 2, NULL, 0, 1),
(35, 'Manage', 'Comments', 0, '2017-11-18 21:57:55.963496', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963496', 0, 'Core.Blog', 'Manage Comments', 9, 2, NULL, 0, 1),
(36, 'Index', 'Dashboard', 0, '2017-11-18 21:57:55.962886', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.962887', 0, 'Core.Admin', 'Dashboard', 4, 1, NULL, 0, 1),
(37, 'ManageUserRoles', 'UserAuth', 0, '2017-11-18 21:57:55.962886', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.962887', 0, 'Core.Admin', 'Manage User Roles', 4, 1, NULL, 0, 1),
(38, 'CreateEdit', 'Users', 0, '2017-11-18 21:57:55.963425', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963425', 0, 'Core.Admin', 'New User', 1, 1, NULL, 0, 1),
(39, 'Index', 'Users', 0, '2017-11-18 21:57:55.963429', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963429', 0, 'Core.Admin', 'Manage Users', 2, 1, NULL, 0, 1),
(40, 'Settings', 'Admin', 0, '2017-11-18 21:57:55.963433', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963433', 0, 'Core.Admin', 'General', 2, 1, NULL, 0, 1),
(41, 'Startup', 'Admin', 0, '2017-11-18 21:57:55.963434', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963434', 0, 'Core.Admin', 'Startup', 3, 1, NULL, 0, 1),
(42, 'EmailSettings', 'Admin', 0, '2017-11-18 21:57:55.963435', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963435', 0, 'Core.Admin', 'Email', 4, 1, NULL, 0, 1),
(43, 'Logging', 'Admin', 0, '2017-11-18 21:57:55.963436', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963436', 0, 'Core.Admin', 'Logging', 5, 1, NULL, 0, 1),
(44, 'MaintenanceMode', 'Admin', 0, '2017-11-18 21:57:55.963437', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963437', 0, 'Core.Admin', 'Maintenance Mode', 10, 1, NULL, 0, 1),
(45, 'Index', 'CmsModule', 0, '2017-11-18 21:57:55.963438', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963438', 0, 'Core.Admin', 'Manage', 1, 1, NULL, 0, 1),
(46, 'Index', 'CmsTheme', 0, '2017-11-18 21:57:55.963439', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963439', 0, 'Core.Admin', 'Theme', 3, 1, NULL, 0, 1),
(47, 'Settings', 'CmsTheme', 0, '2017-11-18 21:57:55.963439', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963439', 0, 'Core.Admin', 'Theme Settings', 3, 1, NULL, 0, 1),
(48, 'Index', 'CmsWidget', 0, '2017-11-18 21:57:55.963440', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963440', 0, 'Core.Admin', 'Widget', 2, 1, NULL, 0, 1),
(49, 'TranslationFiles', 'Language', 0, '2017-11-18 21:57:55.963441', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963441', 0, 'Core.Admin', 'Translation', 200, 1, NULL, 0, 1),
(50, 'Manage', 'Comments', 0, '2017-11-18 21:57:55.963496', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963496', 0, 'Core.Blog', 'Manage Comments', 9, 1, NULL, 0, 1),
(51, 'CreateEdit', 'Post', 0, '2017-11-18 21:57:55.963498', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963498', 0, 'Core.Blog', 'New post', 3, 1, NULL, 0, 1),
(52, 'Manage', 'Post', 0, '2017-11-18 21:57:55.963499', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963499', 0, 'Core.Blog', 'Manage post', 1, 1, NULL, 0, 1),
(53, 'TranslationFiles', 'Language', 0, '2017-11-18 21:57:55.963441', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963441', 0, 'Core.Admin', 'Translation', 200, 2, NULL, 0, 1),
(54, 'Index', 'CmsWidget', 0, '2017-11-18 21:57:55.963440', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963440', 0, 'Core.Admin', 'Widget', 2, 2, NULL, 0, 1),
(55, 'Index', 'Users', 0, '2017-11-18 21:57:55.963429', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963429', 0, 'Core.Admin', 'Manage Users', 2, 2, NULL, 0, 1),
(56, 'CreateEdit', 'Users', 0, '2017-11-18 21:57:55.963425', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963425', 0, 'Core.Admin', 'New User', 1, 2, NULL, 0, 1),
(57, 'Index', 'Dashboard', 0, '2017-11-18 21:57:55.962886', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.962887', 0, 'Core.Admin', 'Dashboard', 4, 2, NULL, 0, 1),
(58, 'Index', 'Admin', 0, '2017-11-18 21:57:55.962886', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.962887', 0, 'Core.Admin', 'Admin Index', 4, 2, NULL, 0, 1),
(59, 'Manage', 'CommentsAuthor', 0, '2017-11-18 21:57:55.963496', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963496', 0, 'Core.Blog', 'Manage Comments', 9, 5, NULL, 0, 1),
(60, 'ManageFiles', 'MediaHome', 0, '2017-11-18 21:57:55.963644', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963644', 0, 'Core.Media', 'Manage Files', 3, 1, NULL, 0, 1),
(61, 'Upload', 'MediaHome', 0, '2017-11-18 21:57:55.963641', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963641', 0, 'Core.Media', 'Upload', 5, 1, NULL, 0, 1),
(62, 'Manage', 'CmsPage', 0, '2017-11-18 21:57:55.963581', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963581', 0, 'Core.Cms', 'Manage', 1, 1, NULL, 0, 1),
(63, 'CreateEdit', 'CmsPage', 0, '2017-11-18 21:57:55.963580', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963580', 0, 'Core.Cms', 'New page', 3, 1, NULL, 0, 1),
(64, 'Index', 'CmsMenu', 0, '2017-11-18 21:57:55.963577', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963577', 0, 'Core.Cms', 'Menu', 1, 1, NULL, 0, 1),
(65, 'Manage', 'Tags', 0, '2017-11-18 21:57:55.963505', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963505', 0, 'Core.Blog', 'Tags', 7, 1, NULL, 0, 1),
(66, 'Manage', 'Category', 0, '2017-11-18 21:57:55.963503', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963503', 0, 'Core.Blog', 'Category', 5, 1, NULL, 0, 1),
(67, 'Index', 'MediaHome', 0, '2017-11-18 21:57:55.963643', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963643', 0, 'Core.Media', 'Manage Gallary', 1, 1, NULL, 0, 1),
(68, 'Upload', 'MediaHome', 0, '2017-11-18 21:57:55.963641', NULL, NULL, 'Admin', '', '2017-11-18 21:57:55.963641', 0, 'Core.Media', 'Upload', 5, 5, NULL, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cms_core_ncc_plugins`
--

CREATE TABLE `cms_core_ncc_plugins` (
  `Id` bigint(20) NOT NULL,
  `AntiForgery` bit(1) NOT NULL,
  `Author` longtext,
  `Category` longtext,
  `CreateBy` bigint(20) NOT NULL,
  `CreationDate` datetime(6) NOT NULL,
  `Dependencies` longtext,
  `Description` longtext,
  `Metadata` longtext,
  `ModificationDate` datetime(6) NOT NULL,
  `ModifyBy` bigint(20) NOT NULL,
  `Name` longtext,
  `NetCoreCMSVersion` longtext,
  `Path` longtext,
  `PluginsStatus` int(11) NOT NULL,
  `SortName` longtext,
  `Status` int(11) NOT NULL,
  `Version` longtext,
  `VersionNumber` int(11) NOT NULL,
  `Website` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_core_ncc_post`
--

CREATE TABLE `cms_core_ncc_post` (
  `Id` bigint(20) NOT NULL,
  `AllowComment` bit(1) NOT NULL,
  `AuthorId` bigint(20) DEFAULT NULL,
  `CommentCount` bigint(20) NOT NULL,
  `CreateBy` bigint(20) NOT NULL,
  `CreationDate` datetime(6) NOT NULL,
  `IsFeatured` bit(1) NOT NULL,
  `IsStiky` bit(1) NOT NULL,
  `Layout` longtext,
  `Metadata` longtext,
  `ModificationDate` datetime(6) NOT NULL,
  `ModifyBy` bigint(20) NOT NULL,
  `Name` longtext,
  `ParentId` bigint(20) DEFAULT NULL,
  `PostStatus` int(11) NOT NULL,
  `PostType` int(11) NOT NULL,
  `PublishDate` datetime(6) NOT NULL,
  `RelatedPosts` longtext,
  `Status` int(11) NOT NULL,
  `ThumImage` longtext,
  `VersionNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_core_ncc_post`
--

INSERT INTO `cms_core_ncc_post` (`Id`, `AllowComment`, `AuthorId`, `CommentCount`, `CreateBy`, `CreationDate`, `IsFeatured`, `IsStiky`, `Layout`, `Metadata`, `ModificationDate`, `ModifyBy`, `Name`, `ParentId`, `PostStatus`, `PostType`, `PublishDate`, `RelatedPosts`, `Status`, `ThumImage`, `VersionNumber`) VALUES
(1, b'1', NULL, 0, 0, '2019-05-02 11:32:48.380051', b'0', b'0', 'SiteLayout', 'DEMODATA', '2019-05-02 11:32:48.642926', 0, 'Sample Post ', NULL, 2, 0, '2019-05-02 11:32:48.378653', NULL, 0, '/media/Images/2017/06/image-slider-2.jpg', 2);

-- --------------------------------------------------------

--
-- Table structure for table `cms_core_ncc_post_category`
--

CREATE TABLE `cms_core_ncc_post_category` (
  `PostId` bigint(20) NOT NULL,
  `CategoryId` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_core_ncc_post_category`
--

INSERT INTO `cms_core_ncc_post_category` (`PostId`, `CategoryId`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cms_core_ncc_post_details`
--

CREATE TABLE `cms_core_ncc_post_details` (
  `Id` bigint(20) NOT NULL,
  `Content` longtext,
  `CreateBy` bigint(20) NOT NULL,
  `CreationDate` datetime(6) NOT NULL,
  `Language` longtext,
  `MetaDescription` longtext,
  `MetaKeyword` longtext,
  `Metadata` longtext,
  `ModificationDate` datetime(6) NOT NULL,
  `ModifyBy` bigint(20) NOT NULL,
  `Name` longtext,
  `PostId` bigint(20) DEFAULT NULL,
  `Slug` longtext,
  `Status` int(11) NOT NULL,
  `Title` longtext,
  `VersionNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_core_ncc_post_details`
--

INSERT INTO `cms_core_ncc_post_details` (`Id`, `Content`, `CreateBy`, `CreationDate`, `Language`, `MetaDescription`, `MetaKeyword`, `Metadata`, `ModificationDate`, `ModifyBy`, `Name`, `PostId`, `Slug`, `Status`, `Title`, `VersionNumber`) VALUES
(1, '<h1 style=\"text-align:center\">Sample Post </h1><hr />This is a sample post.', 0, '2019-05-02 11:32:48.379079', 'en', 'Sample Post  This is a sample post.', NULL, '', '2019-05-02 11:32:48.642080', 0, 'Sample-Post', 1, 'Sample-Post', 0, 'Sample Post ', 1),
(2, '<h1 style=\"text-align:center\">নমুনা পোস্ট </h1><hr />এটি একটি নমুনা পোস্ট।', 0, '2019-05-02 11:32:48.379428', 'bn', 'নমুনা পোস্ট  এটি একটি নমুনা পোস্ট।', NULL, '', '2019-05-02 11:32:48.642080', 0, 'নমুনা-পোস্ট', 1, 'নমুনা-পোস্ট', 0, 'নমুনা পোস্ট ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cms_core_ncc_post_tag`
--

CREATE TABLE `cms_core_ncc_post_tag` (
  `PostId` bigint(20) NOT NULL,
  `TagId` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_core_ncc_role`
--

CREATE TABLE `cms_core_ncc_role` (
  `Id` bigint(20) NOT NULL,
  `ConcurrencyStamp` longtext,
  `CreateBy` bigint(20) NOT NULL,
  `CreationDate` datetime(6) NOT NULL,
  `Metadata` longtext,
  `ModificationDate` datetime(6) NOT NULL,
  `ModifyBy` bigint(20) NOT NULL,
  `Name` varchar(256) DEFAULT NULL,
  `NormalizedName` varchar(256) DEFAULT NULL,
  `Slug` longtext,
  `Status` int(11) NOT NULL,
  `VersionNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_core_ncc_role`
--

INSERT INTO `cms_core_ncc_role` (`Id`, `ConcurrencyStamp`, `CreateBy`, `CreationDate`, `Metadata`, `ModificationDate`, `ModifyBy`, `Name`, `NormalizedName`, `Slug`, `Status`, `VersionNumber`) VALUES
(1, 'ba618a34-0d49-49e8-9cb8-0b6d72f2ce7c', 0, '2019-05-02 11:32:46.693287', NULL, '2019-05-02 11:32:46.693372', 0, 'SuperAdmin', 'SUPERADMIN', NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cms_core_ncc_schedule_task_history`
--

CREATE TABLE `cms_core_ncc_schedule_task_history` (
  `Id` bigint(20) NOT NULL,
  `CreateBy` bigint(20) NOT NULL,
  `CreationDate` datetime(6) NOT NULL,
  `Data` longtext,
  `Metadata` longtext,
  `ModificationDate` datetime(6) NOT NULL,
  `ModifyBy` bigint(20) NOT NULL,
  `Name` longtext,
  `Status` int(11) NOT NULL,
  `TaskCreator` longtext,
  `TaskId` longtext,
  `TaskOf` longtext,
  `TaskType` longtext,
  `VersionNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_core_ncc_settings`
--

CREATE TABLE `cms_core_ncc_settings` (
  `Id` bigint(20) NOT NULL,
  `CreateBy` bigint(20) NOT NULL,
  `CreationDate` datetime(6) NOT NULL,
  `GroupId` longtext,
  `Key` longtext,
  `Metadata` longtext,
  `ModificationDate` datetime(6) NOT NULL,
  `ModifyBy` bigint(20) NOT NULL,
  `Name` longtext,
  `Status` int(11) NOT NULL,
  `Value` longtext,
  `VersionNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_core_ncc_startup`
--

CREATE TABLE `cms_core_ncc_startup` (
  `Id` bigint(20) NOT NULL,
  `CreateBy` bigint(20) NOT NULL,
  `CreationDate` datetime(6) NOT NULL,
  `Metadata` longtext,
  `ModificationDate` datetime(6) NOT NULL,
  `ModifyBy` bigint(20) NOT NULL,
  `Name` longtext,
  `PermissionId` bigint(20) DEFAULT NULL,
  `RoleId` bigint(20) NOT NULL,
  `StartupFor` int(11) NOT NULL,
  `StartupType` int(11) NOT NULL,
  `StartupUrl` longtext,
  `Status` int(11) NOT NULL,
  `UserId` bigint(20) NOT NULL,
  `VersionNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_core_ncc_tag`
--

CREATE TABLE `cms_core_ncc_tag` (
  `Id` bigint(20) NOT NULL,
  `CreateBy` bigint(20) NOT NULL,
  `CreationDate` datetime(6) NOT NULL,
  `Metadata` longtext,
  `ModificationDate` datetime(6) NOT NULL,
  `ModifyBy` bigint(20) NOT NULL,
  `Name` longtext,
  `Status` int(11) NOT NULL,
  `VersionNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_core_ncc_user`
--

CREATE TABLE `cms_core_ncc_user` (
  `Id` bigint(20) NOT NULL,
  `AccessFailedCount` int(11) NOT NULL,
  `ConcurrencyStamp` longtext,
  `CreateBy` bigint(20) NOT NULL,
  `CreationDate` datetime(6) NOT NULL,
  `Email` varchar(256) DEFAULT NULL,
  `EmailConfirmed` bit(1) NOT NULL,
  `FullName` longtext,
  `LockoutEnabled` bit(1) NOT NULL,
  `LockoutEnd` datetime(6) DEFAULT NULL,
  `Metadata` longtext,
  `Mobile` longtext,
  `IsRequireLogin` bit(1) NOT NULL DEFAULT b'0',
  `ModificationDate` datetime(6) NOT NULL,
  `ModifyBy` bigint(20) NOT NULL,
  `Name` longtext,
  `NormalizedEmail` varchar(256) DEFAULT NULL,
  `NormalizedUserName` varchar(256) DEFAULT NULL,
  `PasswordHash` longtext,
  `PhoneNumber` longtext,
  `PhoneNumberConfirmed` bit(1) NOT NULL,
  `SecurityStamp` longtext,
  `Slug` longtext,
  `Status` int(11) NOT NULL,
  `TwoFactorEnabled` bit(1) NOT NULL,
  `UserName` varchar(256) DEFAULT NULL,
  `VersionNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_core_ncc_user`
--

INSERT INTO `cms_core_ncc_user` (`Id`, `AccessFailedCount`, `ConcurrencyStamp`, `CreateBy`, `CreationDate`, `Email`, `EmailConfirmed`, `FullName`, `LockoutEnabled`, `LockoutEnd`, `Metadata`, `Mobile`, `IsRequireLogin`, `ModificationDate`, `ModifyBy`, `Name`, `NormalizedEmail`, `NormalizedUserName`, `PasswordHash`, `PhoneNumber`, `PhoneNumberConfirmed`, `SecurityStamp`, `Slug`, `Status`, `TwoFactorEnabled`, `UserName`, `VersionNumber`) VALUES
(1, 0, '4026e934-6ca7-4a34-bc1a-7a5eeb9a429c', 0, '2019-05-02 11:32:47.445037', 'admin@admin.com', b'0', 'Site Super Admin', b'1', NULL, NULL, NULL, b'0', '2019-05-02 11:32:47.445178', 0, 'Super Admin', 'ADMIN@ADMIN.COM', 'ADMIN', 'AQAAAAEAACcQAAAAELxZR3ARX1E4VZDD6MY1T/OeQa1P6lrJib8BXtreHTKVBibgJGzR0mjYtOhXnNQAKQ==', NULL, b'0', '44ebc632-e210-47f3-9b13-f7f35a649e23', NULL, 0, b'0', 'Admin', 0);

-- --------------------------------------------------------

--
-- Table structure for table `cms_core_ncc_user_permission`
--

CREATE TABLE `cms_core_ncc_user_permission` (
  `UserId` bigint(20) NOT NULL,
  `PermissionId` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_core_ncc_user_role`
--

CREATE TABLE `cms_core_ncc_user_role` (
  `UserId` bigint(20) NOT NULL,
  `RoleId` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_core_ncc_user_role`
--

INSERT INTO `cms_core_ncc_user_role` (`UserId`, `RoleId`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cms_core_ncc_web_site`
--

CREATE TABLE `cms_core_ncc_web_site` (
  `Id` bigint(20) NOT NULL,
  `AdminPageSize` int(11) NOT NULL,
  `AllowRegistration` bit(1) NOT NULL,
  `CreateBy` bigint(20) NOT NULL,
  `CreationDate` datetime(6) NOT NULL,
  `DateFormat` longtext,
  `DomainName` longtext,
  `EmailAddress` longtext,
  `EnableCache` bit(1) NOT NULL DEFAULT b'0',
  `GoogleAnalyticsId` longtext,
  `IsMultiLangual` bit(1) NOT NULL,
  `IsShowFullPost` bit(1) NOT NULL,
  `Language` longtext,
  `Metadata` longtext,
  `ModificationDate` datetime(6) NOT NULL,
  `ModifyBy` bigint(20) NOT NULL,
  `Name` longtext,
  `NewUserRole` longtext,
  `Status` int(11) NOT NULL,
  `TablePrefix` longtext,
  `TimeFormat` longtext,
  `TimeZone` longtext,
  `VersionNumber` int(11) NOT NULL,
  `WebSitePageSize` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_core_ncc_web_site`
--

INSERT INTO `cms_core_ncc_web_site` (`Id`, `AdminPageSize`, `AllowRegistration`, `CreateBy`, `CreationDate`, `DateFormat`, `DomainName`, `EmailAddress`, `EnableCache`, `GoogleAnalyticsId`, `IsMultiLangual`, `IsShowFullPost`, `Language`, `Metadata`, `ModificationDate`, `ModifyBy`, `Name`, `NewUserRole`, `Status`, `TablePrefix`, `TimeFormat`, `TimeZone`, `VersionNumber`, `WebSitePageSize`) VALUES
(1, 10, b'1', 0, '2019-05-02 11:32:47.809798', 'dd/MM/yyyy', NULL, 'admin@admin.com', b'0', NULL, b'0', b'0', 'en', '', '2019-05-02 11:32:47.809798', 0, 'nCMS', 'Subscriber', 0, 'cms_', 'hh:mm:ss', 'UTC_6', 1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `cms_core_ncc_web_site_info`
--

CREATE TABLE `cms_core_ncc_web_site_info` (
  `Id` bigint(20) NOT NULL,
  `Copyrights` longtext,
  `CreateBy` bigint(20) NOT NULL,
  `CreationDate` datetime(6) NOT NULL,
  `FaviconUrl` longtext,
  `Language` longtext,
  `Metadata` longtext,
  `ModificationDate` datetime(6) NOT NULL,
  `ModifyBy` bigint(20) NOT NULL,
  `Name` longtext,
  `NccWebSiteId` bigint(20) DEFAULT NULL,
  `PrivacyPolicyUrl` longtext,
  `SiteLogoUrl` longtext,
  `SiteTitle` longtext,
  `Status` int(11) NOT NULL,
  `Tagline` longtext,
  `TermsAndConditionsUrl` longtext,
  `VersionNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_core_ncc_web_site_info`
--

INSERT INTO `cms_core_ncc_web_site_info` (`Id`, `Copyrights`, `CreateBy`, `CreationDate`, `FaviconUrl`, `Language`, `Metadata`, `ModificationDate`, `ModifyBy`, `Name`, `NccWebSiteId`, `PrivacyPolicyUrl`, `SiteLogoUrl`, `SiteTitle`, `Status`, `Tagline`, `TermsAndConditionsUrl`, `VersionNumber`) VALUES
(1, NULL, 0, '2019-05-02 11:32:47.809448', NULL, 'en', '', '2019-05-02 11:32:47.809450', 0, 'nCMS', 1, NULL, NULL, 'nCMS', 0, 'Website tag line', NULL, 1),
(2, NULL, 0, '2019-05-02 11:32:47.809662', NULL, 'bn', '', '2019-05-02 11:32:47.809663', 0, 'nCMS', 1, NULL, NULL, 'nCMS', 0, 'Website tag line', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cms_core_ncc_web_site_widget`
--

CREATE TABLE `cms_core_ncc_web_site_widget` (
  `Id` bigint(20) NOT NULL,
  `CreateBy` bigint(20) NOT NULL,
  `CreationDate` datetime(6) NOT NULL,
  `LayoutName` longtext,
  `Metadata` longtext,
  `ModificationDate` datetime(6) NOT NULL,
  `ModifyBy` bigint(20) NOT NULL,
  `ModuleName` longtext,
  `Name` longtext,
  `Status` int(11) NOT NULL,
  `ThemeId` longtext,
  `VersionNumber` int(11) NOT NULL,
  `WebSiteId` bigint(20) DEFAULT NULL,
  `WidgetConfigJson` longtext,
  `WidgetData` longtext,
  `WidgetId` longtext,
  `WidgetOrder` int(11) NOT NULL,
  `Zone` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_core_ncc_widget`
--

CREATE TABLE `cms_core_ncc_widget` (
  `Id` bigint(20) NOT NULL,
  `Content` longblob,
  `CreateBy` bigint(20) NOT NULL,
  `CreationDate` datetime(6) NOT NULL,
  `Dependencies` longtext,
  `Description` longtext,
  `Metadata` longtext,
  `ModificationDate` datetime(6) NOT NULL,
  `ModifyBy` bigint(20) NOT NULL,
  `Name` longtext,
  `NccPluginsId` bigint(20) DEFAULT NULL,
  `NetCoreCMSVersion` longtext,
  `SortName` longtext,
  `Status` int(11) NOT NULL,
  `Title` longtext,
  `VersionNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_core_ncc_widget_section`
--

CREATE TABLE `cms_core_ncc_widget_section` (
  `Id` bigint(20) NOT NULL,
  `CreateBy` bigint(20) NOT NULL,
  `CreationDate` datetime(6) NOT NULL,
  `Dependencies` longtext,
  `Description` longtext,
  `Metadata` longtext,
  `ModificationDate` datetime(6) NOT NULL,
  `ModifyBy` bigint(20) NOT NULL,
  `Name` longtext,
  `NetCoreCMSVersion` longtext,
  `SortName` longtext,
  `Status` int(11) NOT NULL,
  `Title` longtext,
  `VersionNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_ef_identity_role_claim_1`
--

CREATE TABLE `cms_ef_identity_role_claim_1` (
  `Id` int(11) NOT NULL,
  `ClaimType` longtext,
  `ClaimValue` longtext,
  `RoleId` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_ef_identity_user_claim_1`
--

CREATE TABLE `cms_ef_identity_user_claim_1` (
  `Id` int(11) NOT NULL,
  `ClaimType` longtext,
  `ClaimValue` longtext,
  `NccUserId` bigint(20) DEFAULT NULL,
  `UserId` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_ef_identity_user_login_1`
--

CREATE TABLE `cms_ef_identity_user_login_1` (
  `LoginProvider` varchar(127) NOT NULL,
  `ProviderKey` varchar(127) NOT NULL,
  `NccUserId` bigint(20) DEFAULT NULL,
  `ProviderDisplayName` longtext,
  `UserId` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_ef_identity_user_token_1`
--

CREATE TABLE `cms_ef_identity_user_token_1` (
  `UserId` bigint(20) NOT NULL,
  `LoginProvider` varchar(127) NOT NULL,
  `Name` varchar(127) NOT NULL,
  `Value` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_ef_migration_history`
--

CREATE TABLE `cms_ef_migration_history` (
  `MigrationId` varchar(95) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_ef_migration_history`
--

INSERT INTO `cms_ef_migration_history` (`MigrationId`, `ProductVersion`) VALUES
('20171205132842_InitMySql', '2.0.1-rtm-125');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cms_core_ncc_category`
--
ALTER TABLE `cms_core_ncc_category`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_cms_core_ncc_category_ParentId` (`ParentId`);

--
-- Indexes for table `cms_core_ncc_category_details`
--
ALTER TABLE `cms_core_ncc_category_details`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_cms_core_ncc_category_details_CategoryId` (`CategoryId`);

--
-- Indexes for table `cms_core_ncc_comment`
--
ALTER TABLE `cms_core_ncc_comment`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_cms_core_ncc_comment_AuthorId` (`AuthorId`),
  ADD KEY `IX_cms_core_ncc_comment_PostId` (`PostId`);

--
-- Indexes for table `cms_core_ncc_menu`
--
ALTER TABLE `cms_core_ncc_menu`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `cms_core_ncc_menu_item`
--
ALTER TABLE `cms_core_ncc_menu_item`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_cms_core_ncc_menu_item_NccMenuId` (`NccMenuId`),
  ADD KEY `IX_cms_core_ncc_menu_item_NccMenuItemId` (`NccMenuItemId`),
  ADD KEY `IX_cms_core_ncc_menu_item_NccMenuItemId1` (`NccMenuItemId1`),
  ADD KEY `IX_cms_core_ncc_menu_item_ParentId` (`ParentId`);

--
-- Indexes for table `cms_core_ncc_module`
--
ALTER TABLE `cms_core_ncc_module`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `cms_core_ncc_module_dependency`
--
ALTER TABLE `cms_core_ncc_module_dependency`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_cms_core_ncc_module_dependency_NccModuleId` (`NccModuleId`);

--
-- Indexes for table `cms_core_ncc_page`
--
ALTER TABLE `cms_core_ncc_page`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_cms_core_ncc_page_ParentId` (`ParentId`);

--
-- Indexes for table `cms_core_ncc_page_details`
--
ALTER TABLE `cms_core_ncc_page_details`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_cms_core_ncc_page_details_PageId` (`PageId`);

--
-- Indexes for table `cms_core_ncc_page_details_history`
--
ALTER TABLE `cms_core_ncc_page_details_history`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_cms_core_ncc_page_details_history_PageHistoryId` (`PageHistoryId`);

--
-- Indexes for table `cms_core_ncc_page_history`
--
ALTER TABLE `cms_core_ncc_page_history`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_cms_core_ncc_page_history_ParentId` (`ParentId`);

--
-- Indexes for table `cms_core_ncc_permission`
--
ALTER TABLE `cms_core_ncc_permission`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `cms_core_ncc_permission_details`
--
ALTER TABLE `cms_core_ncc_permission_details`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_cms_core_ncc_permission_details_ExtraAllowUserId` (`ExtraAllowUserId`),
  ADD KEY `IX_cms_core_ncc_permission_details_ExtraDenyUserId` (`ExtraDenyUserId`),
  ADD KEY `IX_cms_core_ncc_permission_details_PermissionId` (`PermissionId`);

--
-- Indexes for table `cms_core_ncc_plugins`
--
ALTER TABLE `cms_core_ncc_plugins`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `cms_core_ncc_post`
--
ALTER TABLE `cms_core_ncc_post`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_cms_core_ncc_post_AuthorId` (`AuthorId`),
  ADD KEY `IX_cms_core_ncc_post_ParentId` (`ParentId`);

--
-- Indexes for table `cms_core_ncc_post_category`
--
ALTER TABLE `cms_core_ncc_post_category`
  ADD PRIMARY KEY (`PostId`,`CategoryId`),
  ADD KEY `IX_cms_core_ncc_post_category_CategoryId` (`CategoryId`);

--
-- Indexes for table `cms_core_ncc_post_details`
--
ALTER TABLE `cms_core_ncc_post_details`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_cms_core_ncc_post_details_PostId` (`PostId`);

--
-- Indexes for table `cms_core_ncc_post_tag`
--
ALTER TABLE `cms_core_ncc_post_tag`
  ADD PRIMARY KEY (`PostId`,`TagId`),
  ADD KEY `IX_cms_core_ncc_post_tag_TagId` (`TagId`);

--
-- Indexes for table `cms_core_ncc_role`
--
ALTER TABLE `cms_core_ncc_role`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `IX_cms_core_ncc_role_RoleNameIndex` (`NormalizedName`);

--
-- Indexes for table `cms_core_ncc_schedule_task_history`
--
ALTER TABLE `cms_core_ncc_schedule_task_history`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `cms_core_ncc_settings`
--
ALTER TABLE `cms_core_ncc_settings`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `cms_core_ncc_startup`
--
ALTER TABLE `cms_core_ncc_startup`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_cms_core_ncc_startup_PermissionId` (`PermissionId`);

--
-- Indexes for table `cms_core_ncc_tag`
--
ALTER TABLE `cms_core_ncc_tag`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `cms_core_ncc_user`
--
ALTER TABLE `cms_core_ncc_user`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `IX_cms_core_ncc_user_UserNameIndex` (`NormalizedUserName`),
  ADD KEY `IX_cms_core_ncc_user_EmailIndex` (`NormalizedEmail`);

--
-- Indexes for table `cms_core_ncc_user_permission`
--
ALTER TABLE `cms_core_ncc_user_permission`
  ADD PRIMARY KEY (`UserId`,`PermissionId`),
  ADD KEY `IX_cms_core_ncc_user_permission_PermissionId` (`PermissionId`);

--
-- Indexes for table `cms_core_ncc_user_role`
--
ALTER TABLE `cms_core_ncc_user_role`
  ADD PRIMARY KEY (`UserId`,`RoleId`),
  ADD KEY `IX_cms_core_ncc_user_role_RoleId` (`RoleId`);

--
-- Indexes for table `cms_core_ncc_web_site`
--
ALTER TABLE `cms_core_ncc_web_site`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `cms_core_ncc_web_site_info`
--
ALTER TABLE `cms_core_ncc_web_site_info`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_cms_core_ncc_web_site_info_NccWebSiteId` (`NccWebSiteId`);

--
-- Indexes for table `cms_core_ncc_web_site_widget`
--
ALTER TABLE `cms_core_ncc_web_site_widget`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_cms_core_ncc_web_site_widget_WebSiteId` (`WebSiteId`);

--
-- Indexes for table `cms_core_ncc_widget`
--
ALTER TABLE `cms_core_ncc_widget`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_cms_core_ncc_widget_NccPluginsId` (`NccPluginsId`);

--
-- Indexes for table `cms_core_ncc_widget_section`
--
ALTER TABLE `cms_core_ncc_widget_section`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `cms_ef_identity_role_claim_1`
--
ALTER TABLE `cms_ef_identity_role_claim_1`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_cms_ef_identity_role_claim_1_RoleId` (`RoleId`);

--
-- Indexes for table `cms_ef_identity_user_claim_1`
--
ALTER TABLE `cms_ef_identity_user_claim_1`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_cms_ef_identity_user_claim_1_NccUserId` (`NccUserId`),
  ADD KEY `IX_cms_ef_identity_user_claim_1_UserId` (`UserId`);

--
-- Indexes for table `cms_ef_identity_user_login_1`
--
ALTER TABLE `cms_ef_identity_user_login_1`
  ADD PRIMARY KEY (`LoginProvider`,`ProviderKey`),
  ADD KEY `IX_cms_ef_identity_user_login_1_NccUserId` (`NccUserId`),
  ADD KEY `IX_cms_ef_identity_user_login_1_UserId` (`UserId`);

--
-- Indexes for table `cms_ef_identity_user_token_1`
--
ALTER TABLE `cms_ef_identity_user_token_1`
  ADD PRIMARY KEY (`UserId`,`LoginProvider`,`Name`);

--
-- Indexes for table `cms_ef_migration_history`
--
ALTER TABLE `cms_ef_migration_history`
  ADD PRIMARY KEY (`MigrationId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cms_core_ncc_category`
--
ALTER TABLE `cms_core_ncc_category`
  MODIFY `Id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cms_core_ncc_category_details`
--
ALTER TABLE `cms_core_ncc_category_details`
  MODIFY `Id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cms_core_ncc_comment`
--
ALTER TABLE `cms_core_ncc_comment`
  MODIFY `Id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cms_core_ncc_menu`
--
ALTER TABLE `cms_core_ncc_menu`
  MODIFY `Id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cms_core_ncc_menu_item`
--
ALTER TABLE `cms_core_ncc_menu_item`
  MODIFY `Id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cms_core_ncc_module`
--
ALTER TABLE `cms_core_ncc_module`
  MODIFY `Id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cms_core_ncc_module_dependency`
--
ALTER TABLE `cms_core_ncc_module_dependency`
  MODIFY `Id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_core_ncc_page`
--
ALTER TABLE `cms_core_ncc_page`
  MODIFY `Id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cms_core_ncc_page_details`
--
ALTER TABLE `cms_core_ncc_page_details`
  MODIFY `Id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cms_core_ncc_page_details_history`
--
ALTER TABLE `cms_core_ncc_page_details_history`
  MODIFY `Id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_core_ncc_page_history`
--
ALTER TABLE `cms_core_ncc_page_history`
  MODIFY `Id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_core_ncc_permission`
--
ALTER TABLE `cms_core_ncc_permission`
  MODIFY `Id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cms_core_ncc_permission_details`
--
ALTER TABLE `cms_core_ncc_permission_details`
  MODIFY `Id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `cms_core_ncc_plugins`
--
ALTER TABLE `cms_core_ncc_plugins`
  MODIFY `Id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_core_ncc_post`
--
ALTER TABLE `cms_core_ncc_post`
  MODIFY `Id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cms_core_ncc_post_details`
--
ALTER TABLE `cms_core_ncc_post_details`
  MODIFY `Id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cms_core_ncc_role`
--
ALTER TABLE `cms_core_ncc_role`
  MODIFY `Id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cms_core_ncc_schedule_task_history`
--
ALTER TABLE `cms_core_ncc_schedule_task_history`
  MODIFY `Id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_core_ncc_settings`
--
ALTER TABLE `cms_core_ncc_settings`
  MODIFY `Id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_core_ncc_startup`
--
ALTER TABLE `cms_core_ncc_startup`
  MODIFY `Id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_core_ncc_tag`
--
ALTER TABLE `cms_core_ncc_tag`
  MODIFY `Id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_core_ncc_user`
--
ALTER TABLE `cms_core_ncc_user`
  MODIFY `Id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cms_core_ncc_web_site`
--
ALTER TABLE `cms_core_ncc_web_site`
  MODIFY `Id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cms_core_ncc_web_site_info`
--
ALTER TABLE `cms_core_ncc_web_site_info`
  MODIFY `Id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cms_core_ncc_web_site_widget`
--
ALTER TABLE `cms_core_ncc_web_site_widget`
  MODIFY `Id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_core_ncc_widget`
--
ALTER TABLE `cms_core_ncc_widget`
  MODIFY `Id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_core_ncc_widget_section`
--
ALTER TABLE `cms_core_ncc_widget_section`
  MODIFY `Id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_ef_identity_role_claim_1`
--
ALTER TABLE `cms_ef_identity_role_claim_1`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_ef_identity_user_claim_1`
--
ALTER TABLE `cms_ef_identity_user_claim_1`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cms_core_ncc_category`
--
ALTER TABLE `cms_core_ncc_category`
  ADD CONSTRAINT `FK_cms_core_ncc_category_cms_core_ncc_category_ParentId` FOREIGN KEY (`ParentId`) REFERENCES `cms_core_ncc_category` (`Id`) ON DELETE NO ACTION;

--
-- Constraints for table `cms_core_ncc_category_details`
--
ALTER TABLE `cms_core_ncc_category_details`
  ADD CONSTRAINT `FK_cms_core_ncc_category_details_cms_core_ncc_category_details_C` FOREIGN KEY (`CategoryId`) REFERENCES `cms_core_ncc_category_details` (`Id`) ON DELETE NO ACTION;

--
-- Constraints for table `cms_core_ncc_comment`
--
ALTER TABLE `cms_core_ncc_comment`
  ADD CONSTRAINT `FK_cms_core_ncc_comment_cms_core_ncc_post_PostId` FOREIGN KEY (`PostId`) REFERENCES `cms_core_ncc_post` (`Id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `FK_cms_core_ncc_comment_cms_core_ncc_user_AuthorId` FOREIGN KEY (`AuthorId`) REFERENCES `cms_core_ncc_user` (`Id`) ON DELETE NO ACTION;

--
-- Constraints for table `cms_core_ncc_menu_item`
--
ALTER TABLE `cms_core_ncc_menu_item`
  ADD CONSTRAINT `FK_cms_core_ncc_menu_item_cms_core_ncc_menu_NccMenuId` FOREIGN KEY (`NccMenuId`) REFERENCES `cms_core_ncc_menu` (`Id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `FK_cms_core_ncc_menu_item_cms_core_ncc_menu_item_NMIId` FOREIGN KEY (`NccMenuItemId`) REFERENCES `cms_core_ncc_menu_item` (`Id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `FK_cms_core_ncc_menu_item_cms_core_ncc_menu_item_NMItemId1` FOREIGN KEY (`NccMenuItemId1`) REFERENCES `cms_core_ncc_menu_item` (`Id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `FK_cms_core_ncc_menu_item_cms_core_ncc_menu_item_ParentId` FOREIGN KEY (`ParentId`) REFERENCES `cms_core_ncc_menu_item` (`Id`) ON DELETE NO ACTION;

--
-- Constraints for table `cms_core_ncc_module_dependency`
--
ALTER TABLE `cms_core_ncc_module_dependency`
  ADD CONSTRAINT `FK_cms_core_ncc_module_dependency_cms_core_ncc_module_NccModuleI` FOREIGN KEY (`NccModuleId`) REFERENCES `cms_core_ncc_module` (`Id`) ON DELETE NO ACTION;

--
-- Constraints for table `cms_core_ncc_page`
--
ALTER TABLE `cms_core_ncc_page`
  ADD CONSTRAINT `FK_cms_core_ncc_page_cms_core_ncc_page_ParentId` FOREIGN KEY (`ParentId`) REFERENCES `cms_core_ncc_page` (`Id`) ON DELETE NO ACTION;

--
-- Constraints for table `cms_core_ncc_page_details`
--
ALTER TABLE `cms_core_ncc_page_details`
  ADD CONSTRAINT `FK_cms_core_ncc_page_details_cms_core_ncc_page_PageId` FOREIGN KEY (`PageId`) REFERENCES `cms_core_ncc_page` (`Id`) ON DELETE NO ACTION;

--
-- Constraints for table `cms_core_ncc_page_details_history`
--
ALTER TABLE `cms_core_ncc_page_details_history`
  ADD CONSTRAINT `FK_cms_core_ncc_page_details_history_cms_core_ncc_page_details_h` FOREIGN KEY (`PageHistoryId`) REFERENCES `cms_core_ncc_page_details_history` (`Id`) ON DELETE NO ACTION;

--
-- Constraints for table `cms_core_ncc_page_history`
--
ALTER TABLE `cms_core_ncc_page_history`
  ADD CONSTRAINT `FK_cms_core_ncc_page_history_cms_core_ncc_page_ParentId` FOREIGN KEY (`ParentId`) REFERENCES `cms_core_ncc_page` (`Id`) ON DELETE NO ACTION;

--
-- Constraints for table `cms_core_ncc_permission_details`
--
ALTER TABLE `cms_core_ncc_permission_details`
  ADD CONSTRAINT `FK_cms_core_ncc_permission_details_cms_core_ncc_permission_Permi` FOREIGN KEY (`PermissionId`) REFERENCES `cms_core_ncc_permission` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_cms_core_ncc_permission_details_cms_core_ncc_user_ExtraAllowU` FOREIGN KEY (`ExtraAllowUserId`) REFERENCES `cms_core_ncc_user` (`Id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `FK_cms_core_ncc_permission_details_cms_core_ncc_user_ExtraDenyUs` FOREIGN KEY (`ExtraDenyUserId`) REFERENCES `cms_core_ncc_user` (`Id`) ON DELETE NO ACTION;

--
-- Constraints for table `cms_core_ncc_post`
--
ALTER TABLE `cms_core_ncc_post`
  ADD CONSTRAINT `FK_cms_core_ncc_post_cms_core_ncc_post_ParentId` FOREIGN KEY (`ParentId`) REFERENCES `cms_core_ncc_post` (`Id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `FK_cms_core_ncc_post_cms_core_ncc_user_AuthorId` FOREIGN KEY (`AuthorId`) REFERENCES `cms_core_ncc_user` (`Id`) ON DELETE NO ACTION;

--
-- Constraints for table `cms_core_ncc_post_category`
--
ALTER TABLE `cms_core_ncc_post_category`
  ADD CONSTRAINT `FK_cms_core_ncc_post_category_cms_core_ncc_category_CategoryId` FOREIGN KEY (`CategoryId`) REFERENCES `cms_core_ncc_category` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_cms_core_ncc_post_category_cms_core_ncc_post_PostId` FOREIGN KEY (`PostId`) REFERENCES `cms_core_ncc_post` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `cms_core_ncc_post_details`
--
ALTER TABLE `cms_core_ncc_post_details`
  ADD CONSTRAINT `FK_cms_core_ncc_post_details_cms_core_ncc_post_PostId` FOREIGN KEY (`PostId`) REFERENCES `cms_core_ncc_post` (`Id`) ON DELETE NO ACTION;

--
-- Constraints for table `cms_core_ncc_post_tag`
--
ALTER TABLE `cms_core_ncc_post_tag`
  ADD CONSTRAINT `FK_cms_core_ncc_post_tag_cms_core_ncc_post_PostId` FOREIGN KEY (`PostId`) REFERENCES `cms_core_ncc_post` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_cms_core_ncc_post_tag_cms_core_ncc_tag_TagId` FOREIGN KEY (`TagId`) REFERENCES `cms_core_ncc_tag` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `cms_core_ncc_startup`
--
ALTER TABLE `cms_core_ncc_startup`
  ADD CONSTRAINT `FK_cms_core_ncc_startup_cms_core_ncc_permission_PermissionId` FOREIGN KEY (`PermissionId`) REFERENCES `cms_core_ncc_permission` (`Id`) ON DELETE NO ACTION;

--
-- Constraints for table `cms_core_ncc_user_permission`
--
ALTER TABLE `cms_core_ncc_user_permission`
  ADD CONSTRAINT `FK_cms_core_ncc_user_permission_cms_core_ncc_permission_Permissi` FOREIGN KEY (`PermissionId`) REFERENCES `cms_core_ncc_permission` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_cms_core_ncc_user_permission_cms_core_ncc_user_UserId` FOREIGN KEY (`UserId`) REFERENCES `cms_core_ncc_user` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cms_core_ncc_user_role`
--
ALTER TABLE `cms_core_ncc_user_role`
  ADD CONSTRAINT `FK_cms_core_ncc_user_role_cms_core_ncc_role_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `cms_core_ncc_role` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_cms_core_ncc_user_role_cms_core_ncc_user_UserId` FOREIGN KEY (`UserId`) REFERENCES `cms_core_ncc_user` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `cms_core_ncc_web_site_info`
--
ALTER TABLE `cms_core_ncc_web_site_info`
  ADD CONSTRAINT `FK_cms_core_ncc_web_site_info_cms_core_ncc_web_site_NccWebSiteId` FOREIGN KEY (`NccWebSiteId`) REFERENCES `cms_core_ncc_web_site` (`Id`) ON DELETE NO ACTION;

--
-- Constraints for table `cms_core_ncc_web_site_widget`
--
ALTER TABLE `cms_core_ncc_web_site_widget`
  ADD CONSTRAINT `FK_cms_core_ncc_web_site_widget_cms_core_ncc_web_site_WebSiteId` FOREIGN KEY (`WebSiteId`) REFERENCES `cms_core_ncc_web_site` (`Id`) ON DELETE NO ACTION;

--
-- Constraints for table `cms_core_ncc_widget`
--
ALTER TABLE `cms_core_ncc_widget`
  ADD CONSTRAINT `FK_cms_core_ncc_widget_cms_core_ncc_plugins_NccPluginsId` FOREIGN KEY (`NccPluginsId`) REFERENCES `cms_core_ncc_plugins` (`Id`) ON DELETE NO ACTION;

--
-- Constraints for table `cms_ef_identity_role_claim_1`
--
ALTER TABLE `cms_ef_identity_role_claim_1`
  ADD CONSTRAINT `FK_cms_ef_identity_role_claim_1_cms_core_ncc_role_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `cms_core_ncc_role` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `cms_ef_identity_user_claim_1`
--
ALTER TABLE `cms_ef_identity_user_claim_1`
  ADD CONSTRAINT `FK_cms_ef_identity_user_claim_1_cms_core_ncc_user_NccUserId` FOREIGN KEY (`NccUserId`) REFERENCES `cms_core_ncc_user` (`Id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `FK_cms_ef_identity_user_claim_1_cms_core_ncc_user_UserId` FOREIGN KEY (`UserId`) REFERENCES `cms_core_ncc_user` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `cms_ef_identity_user_login_1`
--
ALTER TABLE `cms_ef_identity_user_login_1`
  ADD CONSTRAINT `FK_cms_ef_identity_user_login_1_cms_core_ncc_user_NccUserId` FOREIGN KEY (`NccUserId`) REFERENCES `cms_core_ncc_user` (`Id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `FK_cms_ef_identity_user_login_1_cms_core_ncc_user_UserId` FOREIGN KEY (`UserId`) REFERENCES `cms_core_ncc_user` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `cms_ef_identity_user_token_1`
--
ALTER TABLE `cms_ef_identity_user_token_1`
  ADD CONSTRAINT `FK_cms_ef_identity_user_token_1_cms_core_ncc_user_UserId` FOREIGN KEY (`UserId`) REFERENCES `cms_core_ncc_user` (`Id`) ON DELETE CASCADE;
