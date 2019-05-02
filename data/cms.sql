-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 02, 2019 at 11:06 AM
-- Server version: 5.7.23
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `cms__AliasPartIndex`
--

CREATE TABLE `cms__AliasPartIndex` (
  `Id` int(11) NOT NULL,
  `DocumentId` int(11) DEFAULT NULL,
  `Alias` varchar(64) DEFAULT NULL,
  `ContentItemId` varchar(26) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms__AliasPartIndex`
--

INSERT INTO `cms__AliasPartIndex` (`Id`, `DocumentId`, `Alias`, `ContentItemId`) VALUES
(1, 45, 'main-menu', '4cy6ryt8t7jygwhad0v17jxjca');

-- --------------------------------------------------------

--
-- Table structure for table `cms__AutoroutePartIndex`
--

CREATE TABLE `cms__AutoroutePartIndex` (
  `Id` int(11) NOT NULL,
  `DocumentId` int(11) DEFAULT NULL,
  `ContentItemId` varchar(26) DEFAULT NULL,
  `Path` varchar(1024) DEFAULT NULL,
  `Published` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms__AutoroutePartIndex`
--

INSERT INTO `cms__AutoroutePartIndex` (`Id`, `DocumentId`, `ContentItemId`, `Path`, `Published`) VALUES
(1, 46, '4h7sq49zw10jtyras1100g694n', 'home-page', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `cms__ContainedPartIndex`
--

CREATE TABLE `cms__ContainedPartIndex` (
  `Id` int(11) NOT NULL,
  `DocumentId` int(11) DEFAULT NULL,
  `ListContentItemId` varchar(26) DEFAULT NULL,
  `Order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms__ContentItemIndex`
--

CREATE TABLE `cms__ContentItemIndex` (
  `Id` int(11) NOT NULL,
  `DocumentId` int(11) DEFAULT NULL,
  `ContentItemId` varchar(26) DEFAULT NULL,
  `ContentItemVersionId` varchar(26) DEFAULT NULL,
  `Latest` bit(1) DEFAULT NULL,
  `Published` bit(1) DEFAULT NULL,
  `ContentType` varchar(255) DEFAULT NULL,
  `ModifiedUtc` datetime DEFAULT NULL,
  `PublishedUtc` datetime DEFAULT NULL,
  `CreatedUtc` datetime DEFAULT NULL,
  `Owner` varchar(255) DEFAULT NULL,
  `Author` varchar(255) DEFAULT NULL,
  `DisplayText` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms__ContentItemIndex`
--

INSERT INTO `cms__ContentItemIndex` (`Id`, `DocumentId`, `ContentItemId`, `ContentItemVersionId`, `Latest`, `Published`, `ContentType`, `ModifiedUtc`, `PublishedUtc`, `CreatedUtc`, `Owner`, `Author`, `DisplayText`) VALUES
(1, 43, '4z1be9j6ej9fmvqn0zyt9j2f5t', '4yw56kjfn3zdwshzpa2dzkq7w3', b'1', b'1', 'HtmlWidget', '2019-05-02 16:06:03', '2019-05-02 16:06:03', '2019-05-02 16:06:03', 'admin', 'admin', 'Footer'),
(2, 45, '4cy6ryt8t7jygwhad0v17jxjca', '4wbv2t03ejqqexxhfvn2j6sfxv', b'1', b'1', 'Menu', '2019-05-02 16:06:03', '2019-05-02 16:06:03', '2019-05-02 16:06:03', 'admin', 'admin', 'Main Menu'),
(3, 46, '4h7sq49zw10jtyras1100g694n', '4p7xe8kvk8hn022gnjxyvpydmt', b'1', b'1', 'LandingPage', '2019-05-02 16:06:03', '2019-05-02 16:06:03', '2019-05-02 16:06:03', 'admin', 'admin', 'NetCMS');

-- --------------------------------------------------------

--
-- Table structure for table `cms__DeploymentPlanIndex`
--

CREATE TABLE `cms__DeploymentPlanIndex` (
  `Id` int(11) NOT NULL,
  `DocumentId` int(11) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms__Document`
--

CREATE TABLE `cms__Document` (
  `Id` int(11) NOT NULL,
  `Type` varchar(255) NOT NULL,
  `Content` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms__Document`
--

INSERT INTO `cms__Document` (`Id`, `Type`, `Content`) VALUES
(1, 'OrchardCore.Environment.Shell.Descriptor.Models.ShellDescriptor, OrchardCore.Abstractions', '{\"Id\":1,\"SerialNumber\":2,\"Features\":[{\"Id\":\"OrchardCore.Cms.Web\",\"AlwaysEnabled\":true},{\"Id\":\"OrchardCore.Features\",\"AlwaysEnabled\":false},{\"Id\":\"OrchardCore.Scripting\",\"AlwaysEnabled\":false},{\"Id\":\"OrchardCore.Recipes\",\"AlwaysEnabled\":false},{\"Id\":\"OrchardCore.Settings\",\"AlwaysEnabled\":false},{\"Id\":\"OrchardCore.Admin\",\"AlwaysEnabled\":false},{\"Id\":\"OrchardCore.Liquid\",\"AlwaysEnabled\":false},{\"Id\":\"OrchardCore.Contents\",\"AlwaysEnabled\":false},{\"Id\":\"OrchardCore.ContentTypes\",\"AlwaysEnabled\":false},{\"Id\":\"OrchardCore.Alias\",\"AlwaysEnabled\":false},{\"Id\":\"OrchardCore.Autoroute\",\"AlwaysEnabled\":false},{\"Id\":\"OrchardCore.ContentFields\",\"AlwaysEnabled\":false},{\"Id\":\"OrchardCore.ContentPreview\",\"AlwaysEnabled\":false},{\"Id\":\"OrchardCore.Contents.FileContentDefinition\",\"AlwaysEnabled\":false},{\"Id\":\"OrchardCore.CustomSettings\",\"AlwaysEnabled\":false},{\"Id\":\"OrchardCore.Deployment\",\"AlwaysEnabled\":false},{\"Id\":\"OrchardCore.Deployment.Remote\",\"AlwaysEnabled\":false},{\"Id\":\"OrchardCore.Diagnostics\",\"AlwaysEnabled\":false},{\"Id\":\"OrchardCore.DynamicCache\",\"AlwaysEnabled\":false},{\"Id\":\"OrchardCore.Resources\",\"AlwaysEnabled\":false},{\"Id\":\"OrchardCore.Feeds\",\"AlwaysEnabled\":false},{\"Id\":\"OrchardCore.Widgets\",\"AlwaysEnabled\":false},{\"Id\":\"OrchardCore.Flows\",\"AlwaysEnabled\":false},{\"Id\":\"OrchardCore.HomeRoute\",\"AlwaysEnabled\":false},{\"Id\":\"OrchardCore.Html\",\"AlwaysEnabled\":false},{\"Id\":\"OrchardCore.Layers\",\"AlwaysEnabled\":false},{\"Id\":\"OrchardCore.Lists\",\"AlwaysEnabled\":false},{\"Id\":\"OrchardCore.Markdown\",\"AlwaysEnabled\":false},{\"Id\":\"OrchardCore.Media\",\"AlwaysEnabled\":false},{\"Id\":\"OrchardCore.Title\",\"AlwaysEnabled\":false},{\"Id\":\"OrchardCore.Menu\",\"AlwaysEnabled\":false},{\"Id\":\"OrchardCore.Navigation\",\"AlwaysEnabled\":false},{\"Id\":\"OrchardCore.Queries\",\"AlwaysEnabled\":false},{\"Id\":\"OrchardCore.Users\",\"AlwaysEnabled\":false},{\"Id\":\"OrchardCore.Roles\",\"AlwaysEnabled\":false},{\"Id\":\"OrchardCore.Templates\",\"AlwaysEnabled\":false},{\"Id\":\"OrchardCore.Themes\",\"AlwaysEnabled\":false},{\"Id\":\"SafeMode\",\"AlwaysEnabled\":false},{\"Id\":\"TheAdmin\",\"AlwaysEnabled\":false},{\"Id\":\"TheAgencyTheme\",\"AlwaysEnabled\":false}],\"Parameters\":[]}'),
(2, 'OrchardCore.Environment.Shell.State.ShellState, OrchardCore.Abstractions', '{\"Features\":[{\"Id\":\"OrchardCore.Cms.Web\",\"InstallState\":\"Up\",\"EnableState\":\"Up\"},{\"Id\":\"OrchardCore.Features\",\"InstallState\":\"Up\",\"EnableState\":\"Up\"},{\"Id\":\"OrchardCore.Scripting\",\"InstallState\":\"Up\",\"EnableState\":\"Up\"},{\"Id\":\"OrchardCore.Recipes\",\"InstallState\":\"Up\",\"EnableState\":\"Up\"},{\"Id\":\"OrchardCore.Settings\",\"InstallState\":\"Up\",\"EnableState\":\"Up\"},{\"Id\":\"OrchardCore.Admin\",\"InstallState\":\"Up\",\"EnableState\":\"Up\"},{\"Id\":\"OrchardCore.Liquid\",\"InstallState\":\"Up\",\"EnableState\":\"Up\"},{\"Id\":\"OrchardCore.Contents\",\"InstallState\":\"Up\",\"EnableState\":\"Up\"},{\"Id\":\"OrchardCore.ContentTypes\",\"InstallState\":\"Up\",\"EnableState\":\"Up\"},{\"Id\":\"OrchardCore.Alias\",\"InstallState\":\"Up\",\"EnableState\":\"Up\"},{\"Id\":\"OrchardCore.Autoroute\",\"InstallState\":\"Up\",\"EnableState\":\"Up\"},{\"Id\":\"OrchardCore.ContentFields\",\"InstallState\":\"Up\",\"EnableState\":\"Up\"},{\"Id\":\"OrchardCore.ContentPreview\",\"InstallState\":\"Up\",\"EnableState\":\"Up\"},{\"Id\":\"OrchardCore.Contents.FileContentDefinition\",\"InstallState\":\"Up\",\"EnableState\":\"Up\"},{\"Id\":\"OrchardCore.CustomSettings\",\"InstallState\":\"Up\",\"EnableState\":\"Up\"},{\"Id\":\"OrchardCore.Deployment\",\"InstallState\":\"Up\",\"EnableState\":\"Up\"},{\"Id\":\"OrchardCore.Deployment.Remote\",\"InstallState\":\"Up\",\"EnableState\":\"Up\"},{\"Id\":\"OrchardCore.Diagnostics\",\"InstallState\":\"Up\",\"EnableState\":\"Up\"},{\"Id\":\"OrchardCore.DynamicCache\",\"InstallState\":\"Up\",\"EnableState\":\"Up\"},{\"Id\":\"OrchardCore.Resources\",\"InstallState\":\"Up\",\"EnableState\":\"Up\"},{\"Id\":\"OrchardCore.Feeds\",\"InstallState\":\"Up\",\"EnableState\":\"Up\"},{\"Id\":\"OrchardCore.Widgets\",\"InstallState\":\"Up\",\"EnableState\":\"Up\"},{\"Id\":\"OrchardCore.Flows\",\"InstallState\":\"Up\",\"EnableState\":\"Up\"},{\"Id\":\"OrchardCore.HomeRoute\",\"InstallState\":\"Up\",\"EnableState\":\"Up\"},{\"Id\":\"OrchardCore.Html\",\"InstallState\":\"Up\",\"EnableState\":\"Up\"},{\"Id\":\"OrchardCore.Layers\",\"InstallState\":\"Up\",\"EnableState\":\"Up\"},{\"Id\":\"OrchardCore.Lists\",\"InstallState\":\"Up\",\"EnableState\":\"Up\"},{\"Id\":\"OrchardCore.Markdown\",\"InstallState\":\"Up\",\"EnableState\":\"Up\"},{\"Id\":\"OrchardCore.Media\",\"InstallState\":\"Up\",\"EnableState\":\"Up\"},{\"Id\":\"OrchardCore.Title\",\"InstallState\":\"Up\",\"EnableState\":\"Up\"},{\"Id\":\"OrchardCore.Menu\",\"InstallState\":\"Up\",\"EnableState\":\"Up\"},{\"Id\":\"OrchardCore.Navigation\",\"InstallState\":\"Up\",\"EnableState\":\"Up\"},{\"Id\":\"OrchardCore.Queries\",\"InstallState\":\"Up\",\"EnableState\":\"Up\"},{\"Id\":\"OrchardCore.Users\",\"InstallState\":\"Up\",\"EnableState\":\"Up\"},{\"Id\":\"OrchardCore.Roles\",\"InstallState\":\"Up\",\"EnableState\":\"Up\"},{\"Id\":\"OrchardCore.Templates\",\"InstallState\":\"Up\",\"EnableState\":\"Up\"},{\"Id\":\"OrchardCore.Themes\",\"InstallState\":\"Up\",\"EnableState\":\"Up\"},{\"Id\":\"SafeMode\",\"InstallState\":\"Up\",\"EnableState\":\"Up\"},{\"Id\":\"TheAdmin\",\"InstallState\":\"Up\",\"EnableState\":\"Up\"},{\"Id\":\"TheAgencyTheme\",\"InstallState\":\"Up\",\"EnableState\":\"Up\"}]}'),
(21, 'OrchardCore.Data.Migration.Records.DataMigrationRecord, OrchardCore.Data', '{\"Id\":21,\"DataMigrations\":[{\"DataMigrationClass\":\"OrchardCore.ContentManagement.Records.Migrations\",\"Version\":3},{\"DataMigrationClass\":\"OrchardCore.Contents.Migrations\",\"Version\":1},{\"DataMigrationClass\":\"OrchardCore.Liquid.Migrations\",\"Version\":1},{\"DataMigrationClass\":\"OrchardCore.Alias.Migrations\",\"Version\":1},{\"DataMigrationClass\":\"OrchardCore.Autoroute.Migrations\",\"Version\":1},{\"DataMigrationClass\":\"OrchardCore.Deployment.Migrations\",\"Version\":1},{\"DataMigrationClass\":\"OrchardCore.Widgets.Migrations\",\"Version\":1},{\"DataMigrationClass\":\"OrchardCore.Flows.Migrations\",\"Version\":2},{\"DataMigrationClass\":\"OrchardCore.Html.Migrations\",\"Version\":4},{\"DataMigrationClass\":\"OrchardCore.Layers.Migrations\",\"Version\":1},{\"DataMigrationClass\":\"OrchardCore.Lists.Migrations\",\"Version\":1},{\"DataMigrationClass\":\"OrchardCore.Markdown.Migrations\",\"Version\":1},{\"DataMigrationClass\":\"OrchardCore.Title.Migrations\",\"Version\":2},{\"DataMigrationClass\":\"OrchardCore.Menu.Migrations\",\"Version\":1},{\"DataMigrationClass\":\"OrchardCore.Users.Migrations\",\"Version\":2}]}'),
(41, 'OrchardCore.Roles.Models.RolesDocument, OrchardCore.Roles', '{\"Id\":41,\"Roles\":[{\"RoleName\":\"Moderator\",\"NormalizedRoleName\":\"MODERATOR\",\"RoleClaims\":[{\"ClaimType\":\"Permission\",\"ClaimValue\":\"AccessAdminPanel\"}]},{\"RoleName\":\"Authenticated\",\"NormalizedRoleName\":\"AUTHENTICATED\",\"RoleClaims\":[{\"ClaimType\":\"Permission\",\"ClaimValue\":\"ViewContent\"}]},{\"RoleName\":\"Anonymous\",\"NormalizedRoleName\":\"ANONYMOUS\",\"RoleClaims\":[{\"ClaimType\":\"Permission\",\"ClaimValue\":\"ViewContent\"}]},{\"RoleName\":\"Author\",\"NormalizedRoleName\":\"AUTHOR\",\"RoleClaims\":[{\"ClaimType\":\"Permission\",\"ClaimValue\":\"AccessAdminPanel\"},{\"ClaimType\":\"Permission\",\"ClaimValue\":\"PublishOwnContent\"},{\"ClaimType\":\"Permission\",\"ClaimValue\":\"EditOwnContent\"},{\"ClaimType\":\"Permission\",\"ClaimValue\":\"DeleteOwnContent\"},{\"ClaimType\":\"Permission\",\"ClaimValue\":\"PreviewOwnContent\"},{\"ClaimType\":\"Permission\",\"ClaimValue\":\"ManageOwnMedia\"}]},{\"RoleName\":\"Contributor\",\"NormalizedRoleName\":\"CONTRIBUTOR\",\"RoleClaims\":[{\"ClaimType\":\"Permission\",\"ClaimValue\":\"AccessAdminPanel\"},{\"ClaimType\":\"Permission\",\"ClaimValue\":\"EditOwnContent\"},{\"ClaimType\":\"Permission\",\"ClaimValue\":\"PreviewOwnContent\"},{\"ClaimType\":\"Permission\",\"ClaimValue\":\"ManageOwnMedia\"}]},{\"RoleName\":\"Editor\",\"NormalizedRoleName\":\"EDITOR\",\"RoleClaims\":[{\"ClaimType\":\"Permission\",\"ClaimValue\":\"AccessAdminPanel\"},{\"ClaimType\":\"Permission\",\"ClaimValue\":\"PublishContent\"},{\"ClaimType\":\"Permission\",\"ClaimValue\":\"EditContent\"},{\"ClaimType\":\"Permission\",\"ClaimValue\":\"DeleteContent\"},{\"ClaimType\":\"Permission\",\"ClaimValue\":\"PreviewContent\"},{\"ClaimType\":\"Permission\",\"ClaimValue\":\"ManageMediaContent\"},{\"ClaimType\":\"Permission\",\"ClaimValue\":\"ManageQueries\"},{\"ClaimType\":\"Permission\",\"ClaimValue\":\"ManageTemplates\"}]},{\"RoleName\":\"Administrator\",\"NormalizedRoleName\":\"ADMINISTRATOR\",\"RoleClaims\":[{\"ClaimType\":\"Permission\",\"ClaimValue\":\"ManageSettings\"},{\"ClaimType\":\"Permission\",\"ClaimValue\":\"AccessAdminPanel\"},{\"ClaimType\":\"Permission\",\"ClaimValue\":\"PublishContent\"},{\"ClaimType\":\"Permission\",\"ClaimValue\":\"EditContent\"},{\"ClaimType\":\"Permission\",\"ClaimValue\":\"DeleteContent\"},{\"ClaimType\":\"Permission\",\"ClaimValue\":\"PreviewContent\"},{\"ClaimType\":\"Permission\",\"ClaimValue\":\"ViewContentTypes\"},{\"ClaimType\":\"Permission\",\"ClaimValue\":\"EditContentTypes\"},{\"ClaimType\":\"Permission\",\"ClaimValue\":\"SetHomepage\"},{\"ClaimType\":\"Permission\",\"ClaimValue\":\"ContentPreview\"},{\"ClaimType\":\"Permission\",\"ClaimValue\":\"Import\"},{\"ClaimType\":\"Permission\",\"ClaimValue\":\"Export\"},{\"ClaimType\":\"Permission\",\"ClaimValue\":\"ManageLayers\"},{\"ClaimType\":\"Permission\",\"ClaimValue\":\"ManageMediaContent\"},{\"ClaimType\":\"Permission\",\"ClaimValue\":\"ManageMenu\"},{\"ClaimType\":\"Permission\",\"ClaimValue\":\"ManageQueries\"},{\"ClaimType\":\"Permission\",\"ClaimValue\":\"ManageUsers\"},{\"ClaimType\":\"Permission\",\"ClaimValue\":\"ManageRoles\"},{\"ClaimType\":\"Permission\",\"ClaimValue\":\"AssignRoles\"},{\"ClaimType\":\"Permission\",\"ClaimValue\":\"SiteOwner\"},{\"ClaimType\":\"Permission\",\"ClaimValue\":\"ManageTemplates\"},{\"ClaimType\":\"Permission\",\"ClaimValue\":\"ApplyTheme\"}]}],\"Serial\":50}'),
(42, 'OrchardCore.Settings.SiteSettings, OrchardCore.Settings', '{\"Id\":42,\"BaseUrl\":null,\"Calendar\":null,\"Culture\":\"\",\"SupportedCultures\":[],\"MaxPagedCount\":0,\"MaxPageSize\":100,\"PageSize\":10,\"TimeZoneId\":\"America/Chicago\",\"ResourceDebugMode\":0,\"SiteName\":\"NetCMS\",\"SiteSalt\":\"9ff16b1cbb284326ace65ba1ef1b5f38\",\"SuperUser\":\"admin\",\"UseCdn\":false,\"HomeRoute\":{\"action\":\"Display\",\"controller\":\"Item\",\"area\":\"OrchardCore.Contents\",\"contentItemId\":\"4h7sq49zw10jtyras1100g694n\"},\"Properties\":{\"CurrentThemeName\":\"TheAgencyTheme\",\"CurrentAdminThemeName\":\"TheAdmin\",\"name\":\"settings\",\"LayerSettings\":{\"Zones\":[\"Footer\"]}}}'),
(43, 'OrchardCore.ContentManagement.ContentItem, OrchardCore.ContentManagement.Abstractions', '{\"ContentItemId\":\"4z1be9j6ej9fmvqn0zyt9j2f5t\",\"ContentItemVersionId\":\"4yw56kjfn3zdwshzpa2dzkq7w3\",\"ContentType\":\"HtmlWidget\",\"DisplayText\":\"Footer\",\"Latest\":true,\"Published\":true,\"ModifiedUtc\":\"2019-05-02T16:06:02.962724Z\",\"PublishedUtc\":\"2019-05-02T16:06:02.976922Z\",\"CreatedUtc\":\"2019-05-02T16:06:02.976922Z\",\"Owner\":\"admin\",\"Author\":\"admin\",\"LayerMetadata\":{\"Layer\":\"Always\",\"Zone\":\"Footer\",\"RenderTitle\":false,\"Position\":10},\"HtmlWidget\":{\"Content\":{\"Html\":\"<!-- Footer -->\\n<footer>\\n    <div class=\\\"container\\\">\\n        <div class=\\\"row\\\">\\n            <div class=\\\"col-md-4\\\">\\n                <span class=\\\"copyright\\\">Copyright &copy; Your Website 2018</span>\\n            </div>\\n            <div class=\\\"col-md-4\\\">\\n                <ul class=\\\"list-inline social-buttons\\\">\\n                    <li class=\\\"list-inline-item\\\">\\n                        <a href=\\\"#\\\">\\n                            <i class=\\\"fab fa-twitter\\\"></i>\\n                        </a>\\n                    </li>\\n                    <li class=\\\"list-inline-item\\\">\\n                        <a href=\\\"#\\\">\\n                            <i class=\\\"fab fa-facebook\\\"></i>\\n                        </a>\\n                    </li>\\n                    <li class=\\\"list-inline-item\\\">\\n                        <a href=\\\"#\\\">\\n                            <i class=\\\"fab fa-linkedin\\\"></i>\\n                        </a>\\n                    </li>\\n                </ul>\\n            </div>\\n            <div class=\\\"col-md-4\\\">\\n                <ul class=\\\"list-inline quicklinks\\\">\\n                    <li class=\\\"list-inline-item\\\">\\n                        <a href=\\\"#\\\">Privacy Policy</a>\\n                    </li>\\n                    <li class=\\\"list-inline-item\\\">\\n                        <a href=\\\"#\\\">Terms of Use</a>\\n                    </li>\\n                </ul>\\n            </div>\\n        </div>\\n    </div>\\n</footer>\"}}}'),
(44, 'OrchardCore.Layers.Models.LayersDocument, OrchardCore.Layers', '{\"Id\":44,\"Layers\":[{\"Name\":\"Always\",\"Rule\":\"true\",\"Description\":\"The widgets in this layer are displayed on any page of this site.\"},{\"Name\":\"Homepage\",\"Rule\":\"isHomepage()\",\"Description\":\"The widgets in this layer are only displayed on the homepage.\"}]}'),
(45, 'OrchardCore.ContentManagement.ContentItem, OrchardCore.ContentManagement.Abstractions', '{\"ContentItemId\":\"4cy6ryt8t7jygwhad0v17jxjca\",\"ContentItemVersionId\":\"4wbv2t03ejqqexxhfvn2j6sfxv\",\"ContentType\":\"Menu\",\"DisplayText\":\"Main Menu\",\"Latest\":true,\"Published\":true,\"ModifiedUtc\":\"2019-05-02T16:06:03.093374Z\",\"PublishedUtc\":\"2019-05-02T16:06:03.099624Z\",\"CreatedUtc\":\"2019-05-02T16:06:03.099624Z\",\"Owner\":\"admin\",\"Author\":\"admin\",\"MenuPart\":{},\"TitlePart\":{\"Title\":\"Main Menu\"},\"MenuItemsListPart\":{\"MenuItems\":[{\"ContentType\":\"LinkMenuItem\",\"ContentItemId\":\"43t7be3ytv6z63g448jec2d257\",\"LinkMenuItemPart\":{\"Name\":\"Services\",\"Url\":\"~/#services\"}},{\"ContentType\":\"LinkMenuItem\",\"ContentItemId\":\"4qrms5ss12w977yq35j4brm1xp\",\"LinkMenuItemPart\":{\"Name\":\"Portfolio\",\"Url\":\"~/#portfolio\"}},{\"ContentType\":\"LinkMenuItem\",\"ContentItemId\":\"4yssmhpnabhwy40qfgc7hjmr5d\",\"LinkMenuItemPart\":{\"Name\":\"About\",\"Url\":\"~/#about\"}},{\"ContentType\":\"LinkMenuItem\",\"ContentItemId\":\"48skprhewkdv8sazsjp4cx6856\",\"LinkMenuItemPart\":{\"Name\":\"Team\",\"Url\":\"~/#team\"}},{\"ContentType\":\"LinkMenuItem\",\"ContentItemId\":\"4f4m3kw9w68jq2ajkxjqyejbma\",\"LinkMenuItemPart\":{\"Name\":\"Contact\",\"Url\":\"~/#contact\"}}]},\"AliasPart\":{\"Alias\":\"main-menu\"}}'),
(46, 'OrchardCore.ContentManagement.ContentItem, OrchardCore.ContentManagement.Abstractions', '{\"ContentItemId\":\"4h7sq49zw10jtyras1100g694n\",\"ContentItemVersionId\":\"4p7xe8kvk8hn022gnjxyvpydmt\",\"ContentType\":\"LandingPage\",\"DisplayText\":\"NetCMS\",\"Latest\":true,\"Published\":true,\"ModifiedUtc\":\"2019-05-02T16:06:03.105062Z\",\"PublishedUtc\":\"2019-05-02T16:06:03.10803Z\",\"CreatedUtc\":\"2019-05-02T16:06:03.10803Z\",\"Owner\":\"admin\",\"Author\":\"admin\",\"LandingPage\":{},\"AutoroutePart\":{\"Path\":\"home-page\",\"SetHomepage\":true},\"TitlePart\":{\"Title\":\"NetCMS\"},\"Services\":{\"ContentItems\":[{\"ContentItemId\":\"4s6sh8vpp07c8wb31j9ng8ypmw\",\"ContentItemVersionId\":\"46nf8p8s1fqgw5jgbc9f7g42cc\",\"ContentType\":\"Service\",\"DisplayText\":\"E-Commerce\",\"Latest\":false,\"Published\":false,\"Owner\":null,\"Author\":\"admin\",\"Service\":{\"IconClass\":{\"Text\":\"fa-shopping-cart\"}},\"HtmlBodyPart\":{\"Html\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.\"},\"TitlePart\":{\"Title\":\"E-Commerce\"}},{\"ContentItemId\":\"4djv0a5j9a6ghsg38agvn25hnv\",\"ContentItemVersionId\":\"46xddbn5a8v9hsh11d6g26w7wj\",\"ContentType\":\"Service\",\"DisplayText\":\"Responsive Design\",\"Latest\":false,\"Published\":false,\"Owner\":null,\"Author\":\"admin\",\"Service\":{\"IconClass\":{\"Text\":\"fa-laptop\"}},\"HtmlBodyPart\":{\"Html\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.\"},\"TitlePart\":{\"Title\":\"Responsive Design\"}},{\"ContentItemId\":\"4ndzx7gs5h58d4y0zyehsxxm45\",\"ContentItemVersionId\":\"49k0vzftyynj0v36vcg9rz3tw5\",\"ContentType\":\"Service\",\"DisplayText\":\"Web Security\",\"Latest\":false,\"Published\":false,\"Owner\":null,\"Author\":\"admin\",\"Service\":{\"IconClass\":{\"Text\":\"fa-lock\"}},\"HtmlBodyPart\":{\"Html\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.\"},\"TitlePart\":{\"Title\":\"Web Security\"}}]},\"Portfolio\":{\"ContentItems\":[{\"ContentItemId\":\"475prqf5fmncd31be6m4dg10x6\",\"ContentItemVersionId\":\"4c0kv2bqzx5bwwxk7p1dtm5x4n\",\"ContentType\":\"Project\",\"DisplayText\":\"Threads\",\"Latest\":false,\"Published\":false,\"Owner\":null,\"Author\":\"admin\",\"Project\":{\"Image\":{\"Paths\":[\"/portfolio/01-full.jpg\"]},\"Category\":{\"Text\":\"Illustrations\"}},\"HtmlBodyPart\":{\"Html\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!\"},\"TitlePart\":{\"Title\":\"Threads\"}},{\"ContentItemId\":\"45jbhqstk5zsktmac17a8nksm9\",\"ContentItemVersionId\":\"4bzme57b3y7xc7vgyjygdf8a4m\",\"ContentType\":\"Project\",\"DisplayText\":\"Explore\",\"Latest\":false,\"Published\":false,\"Owner\":null,\"Author\":\"admin\",\"Project\":{\"Image\":{\"Paths\":[\"/portfolio/02-full.jpg\"]},\"Category\":{\"Text\":\"Graphic Design\"}},\"HtmlBodyPart\":{\"Html\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!\"},\"TitlePart\":{\"Title\":\"Explore\"}},{\"ContentItemId\":\"47kcc5r9hxc4ew7j81r51c7kmx\",\"ContentItemVersionId\":\"4t92an915txp4ycy7kxsa13mw3\",\"ContentType\":\"Project\",\"DisplayText\":\"Finish\",\"Latest\":false,\"Published\":false,\"Owner\":null,\"Author\":\"admin\",\"Project\":{\"Image\":{\"Paths\":[\"/portfolio/03-full.jpg\"]},\"Category\":{\"Text\":\"Identity\"}},\"HtmlBodyPart\":{\"Html\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!\"},\"TitlePart\":{\"Title\":\"Finish\"}},{\"ContentItemId\":\"4cszbyzxzty6s27xkn0r9vrfc9\",\"ContentItemVersionId\":\"4c9w10wsgj5583ce8y1hkces4j\",\"ContentType\":\"Project\",\"DisplayText\":\"Lines\",\"Latest\":false,\"Published\":false,\"Owner\":null,\"Author\":\"admin\",\"Project\":{\"Image\":{\"Paths\":[\"/portfolio/04-full.jpg\"]},\"Category\":{\"Text\":\"Branding\"}},\"HtmlBodyPart\":{\"Html\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!\"},\"TitlePart\":{\"Title\":\"Lines\"}},{\"ContentItemId\":\"4k9jnzn25r0kvy4qkvqevxdywh\",\"ContentItemVersionId\":\"40npav4ev2p7b20500adyd51m3\",\"ContentType\":\"Project\",\"DisplayText\":\"Southwest\",\"Latest\":false,\"Published\":false,\"Owner\":null,\"Author\":\"admin\",\"Project\":{\"Image\":{\"Paths\":[\"/portfolio/05-full.jpg\"]},\"Category\":{\"Text\":\"Web Design\"}},\"HtmlBodyPart\":{\"Html\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!\"},\"TitlePart\":{\"Title\":\"Southwest\"}},{\"ContentItemId\":\"4bfpjcjwnj3yktjnybycqygvc8\",\"ContentItemVersionId\":\"47hw2fbk7g3x5zbmcy7vfxwdwt\",\"ContentType\":\"Project\",\"DisplayText\":\"Window\",\"Latest\":false,\"Published\":false,\"Owner\":null,\"Author\":\"admin\",\"Project\":{\"Image\":{\"Paths\":[\"/portfolio/06-full.jpg\"]},\"Category\":{\"Text\":\"Photography\"}},\"HtmlBodyPart\":{\"Html\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!\"},\"TitlePart\":{\"Title\":\"Window\"}}]},\"About\":{\"ContentItems\":[{\"ContentItemId\":\"4zgyftag1mqqe4k4bavtnpg0d6\",\"ContentItemVersionId\":\"4byecc5dkg06mzcd1c74mhstmn\",\"ContentType\":\"Milestone\",\"DisplayText\":\"Our Humble Beginnings\",\"Latest\":false,\"Published\":false,\"Owner\":null,\"Author\":\"admin\",\"Milestone\":{\"Date\":{\"Text\":\"2009-2011\"},\"Image\":{\"Paths\":[\"/about/1.jpg\"]}},\"HtmlBodyPart\":{\"Html\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!\"},\"TitlePart\":{\"Title\":\"Our Humble Beginnings\"}},{\"ContentItemId\":\"4112aacarjwn83s9q0djwvd15b\",\"ContentItemVersionId\":\"4e2hzbjc3kms1sdmmb9w8t25c9\",\"ContentType\":\"Milestone\",\"DisplayText\":\"An Agency is Born\",\"Latest\":false,\"Published\":false,\"Owner\":null,\"Author\":\"admin\",\"Milestone\":{\"Date\":{\"Text\":\"MARCH 2011\"},\"Image\":{\"Paths\":[\"/about/2.jpg\"]}},\"HtmlBodyPart\":{\"Html\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!\\r\\n\"},\"TitlePart\":{\"Title\":\"An Agency is Born\"}},{\"ContentItemId\":\"4bg9hpds3jgkz5xqsfagjsd4mv\",\"ContentItemVersionId\":\"440658442akzftch73xyj0nk4p\",\"ContentType\":\"Milestone\",\"DisplayText\":\"Transition to Full Service\",\"Latest\":false,\"Published\":false,\"Owner\":null,\"Author\":\"admin\",\"Milestone\":{\"Date\":{\"Text\":\"DECEMBER 2012\"},\"Image\":{\"Paths\":[\"/about/3.jpg\"]}},\"HtmlBodyPart\":{\"Html\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!\"},\"TitlePart\":{\"Title\":\"Transition to Full Service\"}},{\"ContentItemId\":\"4a1zasw2g9f7fvrzah8ehv7p4k\",\"ContentItemVersionId\":\"45x84za4ar21mwxc3ywcc337m1\",\"ContentType\":\"Milestone\",\"DisplayText\":\"Phase Two Expansion\",\"Latest\":false,\"Published\":false,\"Owner\":null,\"Author\":\"admin\",\"Milestone\":{\"Date\":{\"Text\":\"JULY 2014\"},\"Image\":{\"Paths\":[\"/about/4.jpg\"]}},\"HtmlBodyPart\":{\"Html\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!\\r\\n\"},\"TitlePart\":{\"Title\":\"Phase Two Expansion\"}}]},\"Team\":{\"ContentItems\":[{\"ContentItemId\":\"4xej84v702r8art137fjh80z5q\",\"ContentItemVersionId\":\"4npaqtb9fbsm2xaad5dhxa1tdm\",\"ContentType\":\"TeamMember\",\"DisplayText\":\"Kay Garland\",\"Latest\":false,\"Published\":false,\"Owner\":null,\"Author\":\"admin\",\"TeamMember\":{\"Occupation\":{\"Text\":\"Lead Designer\"},\"Picture\":{\"Paths\":[\"/team/1.jpg\"]},\"Twitter\":{\"Text\":\"@BillGates\"},\"Facebook\":{\"Text\":\"BillGates\"},\"LinkedIn\":{\"Text\":\"williamhgates\"}},\"TitlePart\":{\"Title\":\"Kay Garland\"}},{\"ContentItemId\":\"47rybse5yxe2bzhq5jc4hw15nf\",\"ContentItemVersionId\":\"4d5ma1wk6dd1w46g5pfq824nwg\",\"ContentType\":\"TeamMember\",\"DisplayText\":\"Larry Parker\",\"Latest\":false,\"Published\":false,\"Owner\":null,\"Author\":\"admin\",\"TeamMember\":{\"Occupation\":{\"Text\":\"Lead Marketer\"},\"Picture\":{\"Paths\":[\"/team/2.jpg\"]},\"Twitter\":{\"Text\":\"@BillGates\"},\"Facebook\":{\"Text\":\"BillGates\"},\"LinkedIn\":{\"Text\":\"williamhgates\"}},\"TitlePart\":{\"Title\":\"Larry Parker\"}},{\"ContentItemId\":\"4g2c2q7qn4ww8zp01xn80kfv4s\",\"ContentItemVersionId\":\"4p47bas9ysmbg00tb2f0bmp2xt\",\"ContentType\":\"TeamMember\",\"DisplayText\":\"Diana Pertersen\",\"Latest\":false,\"Published\":false,\"Owner\":null,\"Author\":\"admin\",\"TeamMember\":{\"Occupation\":{\"Text\":\"Lead Developer\"},\"Picture\":{\"Paths\":[\"/team/3.jpg\"]},\"Twitter\":{\"Text\":\"@BillGates\"},\"Facebook\":{\"Text\":\"BillGates\"},\"LinkedIn\":{\"Text\":\"williamhgates\"}},\"TitlePart\":{\"Title\":\"Diana Pertersen\"}}]},\"Clients\":{\"ContentItems\":[{\"ContentItemId\":\"4vcknr3c4qr1xy7xjfmkqy5cm7\",\"ContentItemVersionId\":\"4zcvhj9t09tydt5v2wa5nd2bxe\",\"ContentType\":\"Client\",\"DisplayText\":\"Envato\",\"Latest\":false,\"Published\":false,\"Owner\":null,\"Author\":\"admin\",\"Client\":{\"Logo\":{\"Paths\":[\"/logos/envato.jpg\"]},\"Url\":{\"Text\":\"#\"}},\"TitlePart\":{\"Title\":\"Envato\"}},{\"ContentItemId\":\"4w5gyzg55dm6nxzss2cts43sdb\",\"ContentItemVersionId\":\"45015yfe8x99r74gf9bpfgz7wd\",\"ContentType\":\"Client\",\"DisplayText\":\"Design Moto\",\"Latest\":false,\"Published\":false,\"Owner\":null,\"Author\":\"admin\",\"Client\":{\"Logo\":{\"Paths\":[\"/logos/designmodo.jpg\"]},\"Url\":{\"Text\":\"#\"}},\"TitlePart\":{\"Title\":\"Design Moto\"}},{\"ContentItemId\":\"4vabagvcyawb87vw1nxxq6zaxa\",\"ContentItemVersionId\":\"4yecfe4yt7a47v2xyyepn9f048\",\"ContentType\":\"Client\",\"DisplayText\":\"ThemeForest\",\"Latest\":false,\"Published\":false,\"Owner\":null,\"Author\":\"admin\",\"Client\":{\"Logo\":{\"Paths\":[\"/logos/themeforest.jpg\"]},\"Url\":{\"Text\":\"#\"}},\"TitlePart\":{\"Title\":\"ThemeForest\"}},{\"ContentItemId\":\"4vg29h76e5sz5645gzq7r0myn6\",\"ContentItemVersionId\":\"4ndh46ddhvb1h3zazfghx432d4\",\"ContentType\":\"Client\",\"DisplayText\":\"Creative\",\"Latest\":false,\"Published\":false,\"Owner\":null,\"Author\":\"admin\",\"Client\":{\"Logo\":{\"Paths\":[\"/logos/creative-market.jpg\"]},\"Url\":{\"Text\":\"#\"}},\"TitlePart\":{\"Title\":\"Creative\"}}]}}'),
(47, 'OrchardCore.Templates.Models.TemplatesDocument, OrchardCore.Templates', '{\"Id\":47,\"Templates\":{\"Content__LandingPage\":{\"Content\":\"{% zone \\\"Header\\\" %}\\n<!-- Header -->\\n<header class=\\\"masthead\\\">\\n    <div class=\\\"container\\\">\\n        <div class=\\\"intro-text\\\">\\n            <div class=\\\"intro-lead-in\\\">Welcome To Our Studio!</div>\\n            <div class=\\\"intro-heading text-uppercase\\\">It\'s Nice To Meet You</div>\\n            <a class=\\\"btn btn-primary btn-xl text-uppercase js-scroll-trigger\\\" href=\\\"#services\\\">Tell Me More</a>\\n        </div>\\n    </div>\\n</header>\\n{% endzone %}\\n\\n{% if Model.ContentItem.Content.Services.ContentItems.size > 0 %}\\n<!-- Services -->\\n<section id=\\\"services\\\">\\n    <div class=\\\"container\\\">\\n        <div class=\\\"row\\\">\\n            <div class=\\\"col-lg-12 text-center\\\">\\n                <h2 class=\\\"section-heading text-uppercase\\\">Services</h2>\\n                <h3 class=\\\"section-subheading text-muted\\\">Lorem ipsum dolor sit amet consectetur.</h3>\\n            </div>\\n        </div>\\n        <div class=\\\"row text-center\\\">\\n            {% for service in Model.ContentItem.Content.Services.ContentItems %}\\n            <div class=\\\"col-md-4\\\">\\n                <span class=\\\"fa-stack fa-4x\\\">\\n                    <i class=\\\"fas fa-circle fa-stack-2x text-primary\\\"></i>\\n                    <i class=\\\"fas {{ service.Service.IconClass.Text }} fa-stack-1x fa-inverse\\\"></i>\\n                </span>\\n                <h4 class=\\\"service-heading\\\">{{ service.DisplayText }}</h4>\\n                <p class=\\\"text-muted\\\">{{ service.HtmlBodyPart.Html | raw }}</p>\\n            </div>\\n            {% endfor %}\\n        </div>\\n    </div>\\n</section>\\n{% endif %}\\n\\n{% if Model.ContentItem.Content.Portfolio.ContentItems.size > 0 %}\\n<!-- Portfolio Grid -->\\n<section class=\\\"bg-light\\\" id=\\\"portfolio\\\">\\n    <div class=\\\"container\\\">\\n        <div class=\\\"row\\\">\\n            <div class=\\\"col-lg-12 text-center\\\">\\n                <h2 class=\\\"section-heading text-uppercase\\\">Portfolio</h2>\\n                <h3 class=\\\"section-subheading text-muted\\\">Lorem ipsum dolor sit amet consectetur.</h3>\\n            </div>\\n        </div>\\n        <div class=\\\"row\\\">\\n            {% for project in Model.ContentItem.Content.Portfolio.ContentItems %}\\n            <div class=\\\"col-md-4 col-sm-6 portfolio-item\\\">\\n                <div class=\\\"portfolio-link\\\" data-toggle=\\\"modal\\\" href=\\\"#portfolioModal{{ forloop.index }}\\\">\\n                    <div class=\\\"portfolio-hover\\\">\\n                        <div class=\\\"portfolio-hover-content\\\">\\n                            <i class=\\\"fas fa-plus fa-3x\\\"></i>\\n                        </div>\\n                    </div>\\n                    <img class=\\\"img-fluid\\\" src=\\\"{{ project.Project.Image.Paths.first | asset_url | resize_url: width:480, height: 480, mode: \'stretch\' }}\\\" alt=\\\"{{ project.DisplayText }}\\\">\\n                </div>\\n                <div class=\\\"portfolio-caption\\\">\\n                    <h4>{{ project.DisplayText }}</h4>\\n                    <p class=\\\"text-muted\\\">{{ project.Project.Category.Text }}</p>\\n                </div>\\n            </div>\\n            {% endfor %}\\n        </div>\\n    </div>\\n</section>\\n{% endif %}\\n\\n{% if Model.ContentItem.Content.About.ContentItems.size > 0 %}\\n<!-- About -->\\n<section id=\\\"about\\\">\\n    <div class=\\\"container\\\">\\n        <div class=\\\"row\\\">\\n            <div class=\\\"col-lg-12 text-center\\\">\\n                <h2 class=\\\"section-heading text-uppercase\\\">About</h2>\\n                <h3 class=\\\"section-subheading text-muted\\\">Lorem ipsum dolor sit amet consectetur.</h3>\\n            </div>\\n        </div>\\n        <div class=\\\"row\\\">\\n            <div class=\\\"col-lg-12\\\">\\n                <ul class=\\\"timeline\\\">\\n                    {% for milestone in Model.ContentItem.Content.About.ContentItems %}\\n                    <li class=\\\"{% cycle \'\', \'timeline-inverted\' %}\\\">\\n                        <div class=\\\"timeline-image\\\">\\n                            <img class=\\\"rounded-circle img-fluid\\\" src=\\\"{{ milestone.Milestone.Image.Paths.first | asset_url | resize_url: width:160, height: 160, mode: \'stretch\' }}\\\" alt=\\\"\\\">\\n                        </div>\\n                        <div class=\\\"timeline-panel\\\">\\n                            <div class=\\\"timeline-heading\\\">\\n                                <h4>{{ milestone.Milestone.Date.Text }}</h4>\\n                                <h4 class=\\\"subheading\\\">{{ milestone.DisplayText }}</h4>\\n                            </div>\\n                            <div class=\\\"timeline-body\\\">\\n                                <p class=\\\"text-muted\\\">{{ milestone.HtmlBodyPart.Html }}</p>\\n                            </div>\\n                        </div>\\n                    </li>\\n                    {% endfor %}\\n                    <li class=\\\"timeline-inverted\\\">\\n                        <div class=\\\"timeline-image\\\">\\n                            <h4>\\n                                Be Part\\n                                <br>Of Our\\n                                <br>Story!\\n                            </h4>\\n                        </div>\\n                    </li>\\n                </ul>\\n            </div>\\n        </div>\\n    </div>\\n</section>\\n{% endif %}\\n\\n{% if Model.ContentItem.Content.Team.ContentItems.size > 0 %}\\n<!-- Team -->\\n<section class=\\\"bg-light\\\" id=\\\"team\\\">\\n    <div class=\\\"container\\\">\\n        <div class=\\\"row\\\">\\n            <div class=\\\"col-lg-12 text-center\\\">\\n                <h2 class=\\\"section-heading text-uppercase\\\">Our Amazing Team</h2>\\n                <h3 class=\\\"section-subheading text-muted\\\">Lorem ipsum dolor sit amet consectetur.</h3>\\n            </div>\\n        </div>\\n        <div class=\\\"row\\\">\\n            {% for member in Model.ContentItem.Content.Team.ContentItems %}\\n            <div class=\\\"col-sm-4\\\">\\n                <div class=\\\"team-member\\\">\\n                    <img class=\\\"mx-auto rounded-circle\\\" src=\\\"{{ member.TeamMember.Picture.Paths.first | asset_url | resize_url: width:240, height: 240, mode: \'stretch\' }}\\\" alt=\\\"\\\">\\n                    <h4>{{ member.DisplayText }}</h4>\\n                    <p class=\\\"text-muted\\\">{{ member.TeamMember.Occupation.Text }}</p>\\n                    <ul class=\\\"list-inline social-buttons\\\">\\n                        {% if member.TeamMember.Twitter.Text.size > 0 %}\\n                        <li class=\\\"list-inline-item\\\">\\n                            <a href=\\\"https://www.twitter.com/{{ member.TeamMember.Twitter.Text }}\\\">\\n                                <i class=\\\"fab fa-twitter\\\"></i>\\n                            </a>\\n                        </li>\\n                        {% endif %}\\n                        {% if member.TeamMember.Facebook.Text.size > 0 %}\\n                        <li class=\\\"list-inline-item\\\">\\n                            <a href=\\\"https://www.facebook.com/{{ member.TeamMember.Facebook.Text }}\\\">\\n                                <i class=\\\"fab fa-facebook\\\"></i>\\n                            </a>\\n                        </li>\\n                        {% endif %}\\n                        {% if member.TeamMember.LinkedIn.Text.size > 0 %}\\n                        <li class=\\\"list-inline-item\\\">\\n                            <a href=\\\"https://www.linkedin.com/in/{{ member.TeamMember.LinkedIn.Text }}\\\">\\n                                <i class=\\\"fab fa-linkedin\\\"></i>\\n                            </a>\\n                        </li>\\n                        {% endif %}\\n                    </ul>\\n                </div>\\n            </div>\\n            {% endfor %}\\n        </div>\\n        <div class=\\\"row\\\">\\n            <div class=\\\"col-lg-8 mx-auto text-center\\\">\\n                <p class=\\\"large text-muted\\\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut eaque, laboriosam veritatis, quos non quis ad perspiciatis, totam corporis ea, alias ut unde.</p>\\n            </div>\\n        </div>\\n    </div>\\n</section>\\n{% endif %}\\n\\n{% if Model.ContentItem.Content.Clients.ContentItems.size > 0 %}\\n<!-- Clients -->\\n<section class=\\\"py-5\\\">\\n    <div class=\\\"container\\\">\\n        <div class=\\\"row\\\">\\n            {% for client in Model.ContentItem.Content.Clients.ContentItems %}\\n            <div class=\\\"col-md-3 col-sm-6\\\">\\n                <a href=\\\"{{ client.Client.Url.Text }}\\\">\\n                    <img class=\\\"img-fluid d-block mx-auto\\\" src=\\\"{{ client.Client.Logo.Paths.first | asset_url }}\\\" alt=\\\"\\\">\\n                </a>\\n            </div>\\n            {% endfor %}\\n        </div>\\n    </div>\\n</section>\\n{% endif %}\\n\\n<!-- Contact -->\\n<section id=\\\"contact\\\">\\n    <div class=\\\"container\\\">\\n        <div class=\\\"row\\\">\\n            <div class=\\\"col-lg-12 text-center\\\">\\n                <h2 class=\\\"section-heading text-uppercase\\\">Contact Us</h2>\\n                <h3 class=\\\"section-subheading text-muted\\\">Lorem ipsum dolor sit amet consectetur.</h3>\\n            </div>\\n        </div>\\n        <div class=\\\"row\\\">\\n            <div class=\\\"col-lg-12\\\">\\n                <form id=\\\"contactForm\\\" name=\\\"sentMessage\\\" novalidate>\\n                    <div class=\\\"row\\\">\\n                        <div class=\\\"col-md-6\\\">\\n                            <div class=\\\"form-group\\\">\\n                                <input class=\\\"form-control\\\" id=\\\"name\\\" type=\\\"text\\\" placeholder=\\\"Your Name *\\\" required data-validation-required-message=\\\"Please enter your name.\\\">\\n                                <p class=\\\"help-block text-danger\\\"></p>\\n                            </div>\\n                            <div class=\\\"form-group\\\">\\n                                <input class=\\\"form-control\\\" id=\\\"email\\\" type=\\\"email\\\" placeholder=\\\"Your Email *\\\" required data-validation-required-message=\\\"Please enter your email address.\\\">\\n                                <p class=\\\"help-block text-danger\\\"></p>\\n                            </div>\\n                            <div class=\\\"form-group\\\">\\n                                <input class=\\\"form-control\\\" id=\\\"phone\\\" type=\\\"tel\\\" placeholder=\\\"Your Phone *\\\" required data-validation-required-message=\\\"Please enter your phone number.\\\">\\n                                <p class=\\\"help-block text-danger\\\"></p>\\n                            </div>\\n                        </div>\\n                        <div class=\\\"col-md-6\\\">\\n                            <div class=\\\"form-group\\\">\\n                                <textarea class=\\\"form-control\\\" id=\\\"message\\\" placeholder=\\\"Your Message *\\\" required data-validation-required-message=\\\"Please enter a message.\\\"></textarea>\\n                                <p class=\\\"help-block text-danger\\\"></p>\\n                            </div>\\n                        </div>\\n                        <div class=\\\"clearfix\\\"></div>\\n                        <div class=\\\"col-lg-12 text-center\\\">\\n                            <div id=\\\"success\\\"></div>\\n                            <button id=\\\"sendMessageButton\\\" class=\\\"btn btn-primary btn-xl text-uppercase\\\" type=\\\"submit\\\">Send Message</button>\\n                        </div>\\n                    </div>\\n                </form>\\n            </div>\\n        </div>\\n    </div>\\n</section>\\n\\n<!-- Modals -->\\n{% for project in Model.ContentItem.Content.Portfolio.ContentItems %}\\n<div class=\\\"portfolio-modal modal fade\\\" id=\\\"portfolioModal{{ forloop.index }}\\\" tabindex=\\\"-1\\\" role=\\\"dialog\\\" aria-hidden=\\\"true\\\">\\n    <div class=\\\"modal-dialog\\\">\\n        <div class=\\\"modal-content\\\">\\n            <div class=\\\"close-modal\\\" data-dismiss=\\\"modal\\\">\\n                <div class=\\\"lr\\\">\\n                    <div class=\\\"rl\\\"></div>\\n                </div>\\n            </div>\\n            <div class=\\\"container\\\">\\n                <div class=\\\"row\\\">\\n                    <div class=\\\"col-lg-8 mx-auto\\\">\\n                        <div class=\\\"modal-body\\\">\\n                            <!-- Project Details Go Here -->\\n                            <h2 class=\\\"text-uppercase\\\">{{ project.DisplayText }}</h2>\\n                            <p class=\\\"item-intro text-muted\\\">{{ project.Project.Category.Text }}</p>\\n                            <img class=\\\"img-fluid d-block mx-auto\\\" src=\\\"{{ project.Project.Image.Paths.first | asset_url | resize_url: width:480, height: 480, mode: \'max\' }}\\\" alt=\\\"{{ project.DisplayText }}\\\">\\n                            <p>{{ project.HtmlBodyPart.Html | raw }}</p>\\n                            {% comment %}\\n                            <ul class=\\\"list-inline\\\">\\n                                <li>Date: January 2017</li>\\n                                <li>Client: Threads</li>\\n                                <li>Category: Illustration</li>\\n                            </ul>\\n                            {% endcomment %}\\n                            <button class=\\\"btn btn-primary\\\" data-dismiss=\\\"modal\\\" type=\\\"button\\\">\\n                                <i class=\\\"fa fa-times\\\"></i>\\n                                Close Project\\n                            </button>\\n                        </div>\\n                    </div>\\n                </div>\\n            </div>\\n        </div>\\n    </div>\\n</div>\\n{% endfor %}\",\"Description\":\"A template for the Landing Page content type\"}}}'),
(61, 'OrchardCore.Users.Models.User, OrchardCore.Users.Core', '{\"Id\":61,\"UserName\":\"admin\",\"NormalizedUserName\":\"ADMIN\",\"Email\":\"admin@admin.com\",\"NormalizedEmail\":\"ADMIN@ADMIN.COM\",\"PasswordHash\":\"AQAAAAEAACcQAAAAEMQ2OmcaWQvknPqU/S2bj63QBPFEUcJFusHtyUHtpQc+kgfVnJ33cFGlHDHsY3WZPA==\",\"SecurityStamp\":\"7YLZHKPOVYQ6WBINOQZKS22OCDMNS5SQ\",\"EmailConfirmed\":true,\"ResetToken\":null,\"RoleNames\":{\"$type\":\"System.String[], System.Private.CoreLib\",\"$values\":[\"Administrator\"]},\"LoginInfos\":[],\"Properties\":{}}');

-- --------------------------------------------------------

--
-- Table structure for table `cms__Identifiers`
--

CREATE TABLE `cms__Identifiers` (
  `dimension` varchar(255) NOT NULL,
  `nextval` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms__Identifiers`
--

INSERT INTO `cms__Identifiers` (`dimension`, `nextval`) VALUES
('', 81);

-- --------------------------------------------------------

--
-- Table structure for table `cms__LayerMetadataIndex`
--

CREATE TABLE `cms__LayerMetadataIndex` (
  `Id` int(11) NOT NULL,
  `DocumentId` int(11) DEFAULT NULL,
  `Zone` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms__LayerMetadataIndex`
--

INSERT INTO `cms__LayerMetadataIndex` (`Id`, `DocumentId`, `Zone`) VALUES
(1, 43, 'Footer');

-- --------------------------------------------------------

--
-- Table structure for table `cms__UserByLoginInfoIndex`
--

CREATE TABLE `cms__UserByLoginInfoIndex` (
  `Id` int(11) NOT NULL,
  `DocumentId` int(11) DEFAULT NULL,
  `LoginProvider` varchar(255) DEFAULT NULL,
  `ProviderKey` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms__UserByRoleNameIndex`
--

CREATE TABLE `cms__UserByRoleNameIndex` (
  `Id` int(11) NOT NULL,
  `RoleName` varchar(255) DEFAULT NULL,
  `Count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms__UserByRoleNameIndex`
--

INSERT INTO `cms__UserByRoleNameIndex` (`Id`, `RoleName`, `Count`) VALUES
(1, 'ADMINISTRATOR', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cms__UserByRoleNameIndex_Document`
--

CREATE TABLE `cms__UserByRoleNameIndex_Document` (
  `UserByRoleNameIndexId` int(11) NOT NULL,
  `DocumentId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms__UserByRoleNameIndex_Document`
--

INSERT INTO `cms__UserByRoleNameIndex_Document` (`UserByRoleNameIndexId`, `DocumentId`) VALUES
(1, 61);

-- --------------------------------------------------------

--
-- Table structure for table `cms__UserIndex`
--

CREATE TABLE `cms__UserIndex` (
  `Id` int(11) NOT NULL,
  `DocumentId` int(11) DEFAULT NULL,
  `NormalizedUserName` varchar(255) DEFAULT NULL,
  `NormalizedEmail` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms__UserIndex`
--

INSERT INTO `cms__UserIndex` (`Id`, `DocumentId`, `NormalizedUserName`, `NormalizedEmail`) VALUES
(1, 61, 'ADMIN', 'ADMIN@ADMIN.COM');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cms__AliasPartIndex`
--
ALTER TABLE `cms__AliasPartIndex`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `cms__FK_AliasPartIndex` (`DocumentId`),
  ADD KEY `IDX_AliasPartIndex_Alias` (`Alias`);

--
-- Indexes for table `cms__AutoroutePartIndex`
--
ALTER TABLE `cms__AutoroutePartIndex`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `cms__FK_AutoroutePartIndex` (`DocumentId`),
  ADD KEY `IDX_AutoroutePartIndex_ContentItemId` (`ContentItemId`);

--
-- Indexes for table `cms__ContainedPartIndex`
--
ALTER TABLE `cms__ContainedPartIndex`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `cms__FK_ContainedPartIndex` (`DocumentId`),
  ADD KEY `IDX_ContainedPartIndex_ListContentItemId` (`ListContentItemId`);

--
-- Indexes for table `cms__ContentItemIndex`
--
ALTER TABLE `cms__ContentItemIndex`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `cms__FK_ContentItemIndex` (`DocumentId`),
  ADD KEY `IDX_ContentItemIndex_ContentItemId` (`ContentItemId`,`Latest`,`Published`,`CreatedUtc`),
  ADD KEY `IDX_ContentItemIndex_ContentItemVersionId` (`ContentItemVersionId`),
  ADD KEY `IDX_ContentItemIndex_DisplayText` (`DisplayText`);

--
-- Indexes for table `cms__DeploymentPlanIndex`
--
ALTER TABLE `cms__DeploymentPlanIndex`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `cms__FK_DeploymentPlanIndex` (`DocumentId`);

--
-- Indexes for table `cms__Document`
--
ALTER TABLE `cms__Document`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_Document_Type` (`Type`);

--
-- Indexes for table `cms__Identifiers`
--
ALTER TABLE `cms__Identifiers`
  ADD PRIMARY KEY (`dimension`),
  ADD KEY `IX_Dimension` (`dimension`);

--
-- Indexes for table `cms__LayerMetadataIndex`
--
ALTER TABLE `cms__LayerMetadataIndex`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `cms__FK_LayerMetadataIndex` (`DocumentId`);

--
-- Indexes for table `cms__UserByLoginInfoIndex`
--
ALTER TABLE `cms__UserByLoginInfoIndex`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `cms__FK_UserByLoginInfoIndex` (`DocumentId`);

--
-- Indexes for table `cms__UserByRoleNameIndex`
--
ALTER TABLE `cms__UserByRoleNameIndex`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `cms__UserByRoleNameIndex_Document`
--
ALTER TABLE `cms__UserByRoleNameIndex_Document`
  ADD KEY `cms__FK_UserByRoleNameIndex_Document_Id` (`UserByRoleNameIndexId`),
  ADD KEY `cms__FK_UserByRoleNameIndex_Document_DocumentId` (`DocumentId`);

--
-- Indexes for table `cms__UserIndex`
--
ALTER TABLE `cms__UserIndex`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `cms__FK_UserIndex` (`DocumentId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cms__AliasPartIndex`
--
ALTER TABLE `cms__AliasPartIndex`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cms__AutoroutePartIndex`
--
ALTER TABLE `cms__AutoroutePartIndex`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cms__ContainedPartIndex`
--
ALTER TABLE `cms__ContainedPartIndex`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms__ContentItemIndex`
--
ALTER TABLE `cms__ContentItemIndex`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cms__DeploymentPlanIndex`
--
ALTER TABLE `cms__DeploymentPlanIndex`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms__LayerMetadataIndex`
--
ALTER TABLE `cms__LayerMetadataIndex`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cms__UserByLoginInfoIndex`
--
ALTER TABLE `cms__UserByLoginInfoIndex`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms__UserByRoleNameIndex`
--
ALTER TABLE `cms__UserByRoleNameIndex`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cms__UserIndex`
--
ALTER TABLE `cms__UserIndex`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cms__AliasPartIndex`
--
ALTER TABLE `cms__AliasPartIndex`
  ADD CONSTRAINT `cms__FK_AliasPartIndex` FOREIGN KEY (`DocumentId`) REFERENCES `cms__Document` (`Id`);

--
-- Constraints for table `cms__AutoroutePartIndex`
--
ALTER TABLE `cms__AutoroutePartIndex`
  ADD CONSTRAINT `cms__FK_AutoroutePartIndex` FOREIGN KEY (`DocumentId`) REFERENCES `cms__Document` (`Id`);

--
-- Constraints for table `cms__ContainedPartIndex`
--
ALTER TABLE `cms__ContainedPartIndex`
  ADD CONSTRAINT `cms__FK_ContainedPartIndex` FOREIGN KEY (`DocumentId`) REFERENCES `cms__Document` (`Id`);

--
-- Constraints for table `cms__ContentItemIndex`
--
ALTER TABLE `cms__ContentItemIndex`
  ADD CONSTRAINT `cms__FK_ContentItemIndex` FOREIGN KEY (`DocumentId`) REFERENCES `cms__Document` (`Id`);

--
-- Constraints for table `cms__DeploymentPlanIndex`
--
ALTER TABLE `cms__DeploymentPlanIndex`
  ADD CONSTRAINT `cms__FK_DeploymentPlanIndex` FOREIGN KEY (`DocumentId`) REFERENCES `cms__Document` (`Id`);

--
-- Constraints for table `cms__LayerMetadataIndex`
--
ALTER TABLE `cms__LayerMetadataIndex`
  ADD CONSTRAINT `cms__FK_LayerMetadataIndex` FOREIGN KEY (`DocumentId`) REFERENCES `cms__Document` (`Id`);

--
-- Constraints for table `cms__UserByLoginInfoIndex`
--
ALTER TABLE `cms__UserByLoginInfoIndex`
  ADD CONSTRAINT `cms__FK_UserByLoginInfoIndex` FOREIGN KEY (`DocumentId`) REFERENCES `cms__Document` (`Id`);

--
-- Constraints for table `cms__UserByRoleNameIndex_Document`
--
ALTER TABLE `cms__UserByRoleNameIndex_Document`
  ADD CONSTRAINT `cms__FK_UserByRoleNameIndex_Document_DocumentId` FOREIGN KEY (`DocumentId`) REFERENCES `cms__Document` (`Id`),
  ADD CONSTRAINT `cms__FK_UserByRoleNameIndex_Document_Id` FOREIGN KEY (`UserByRoleNameIndexId`) REFERENCES `cms__UserByRoleNameIndex` (`Id`);

--
-- Constraints for table `cms__UserIndex`
--
ALTER TABLE `cms__UserIndex`
  ADD CONSTRAINT `cms__FK_UserIndex` FOREIGN KEY (`DocumentId`) REFERENCES `cms__Document` (`Id`);
