-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: ibot_cluster
-- ------------------------------------------------------
-- Server version	5.1.73

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_address_restrict`
--

DROP TABLE IF EXISTS `auth_address_restrict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_address_restrict` (
  `ID` varchar(32) NOT NULL,
  `PATTERN` varchar(64) NOT NULL,
  `TYPE` smallint(6) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_address_restrict`
--

LOCK TABLES `auth_address_restrict` WRITE;
/*!40000 ALTER TABLE `auth_address_restrict` DISABLE KEYS */;
INSERT INTO `auth_address_restrict` VALUES ('100200303248003c0132480045de000a','.*',1),('100200303248003c0132480045de000b','.*',2);
/*!40000 ALTER TABLE `auth_address_restrict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_perm`
--

DROP TABLE IF EXISTS `auth_perm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_perm` (
  `ID` varchar(32) NOT NULL,
  `DESC_NAME` varchar(100) NOT NULL,
  `NAME` varchar(32) NOT NULL,
  `CATE_ID` varchar(32) NOT NULL,
  `REF_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_perm`
--

LOCK TABLES `auth_perm` WRITE;
/*!40000 ALTER TABLE `auth_perm` DISABLE KEYS */;
INSERT INTO `auth_perm` VALUES ('4028819f2f2a14f4012f2a1a017e0002','添加','C','4028819f2f2a14f4012f2a1909fe0001',NULL),('4028819f2f2a14f4012f2a1a32520003','删除','D','4028819f2f2a14f4012f2a1909fe0001',NULL),('4028819f2f2a14f4012f2a1a554b0004','修改','M','4028819f2f2a14f4012f2a1909fe0001',NULL),('4028819f2f2a14f4012f2a1a8beb0005','浏览','R','4028819f2f2a14f4012f2a1909fe0001',NULL),('4028819f2f4e3006012f4e3f13cf0001','同步','S','4028819f2f2a14f4012f2a1909fe0001',NULL),('4028819f2f4e3006012f4e51c7f40004','导入','IMP','4028819f2f2a14f4012f2a1909fe0001',NULL),('4028819f2f4e3006012f4e5200c70005','导出','EXP','4028819f2f2a14f4012f2a1909fe0001',NULL),('4028819f2f4e3006012f4e526ec30006','审核','AUD','4028819f2f2a14f4012f2a1909fe0001',NULL),('4028819f324c0a0801324cae0de40006','所有维度','ALLDIM','4028829f2f63913f012f63c43db10001',NULL);
/*!40000 ALTER TABLE `auth_perm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_perm_cate`
--

DROP TABLE IF EXISTS `auth_perm_cate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_perm_cate` (
  `ID` varchar(32) NOT NULL,
  `DESC_NAME` varchar(128) NOT NULL,
  `NAME` varchar(32) NOT NULL,
  `PARENT_ID` varchar(32) DEFAULT NULL,
  `BH` varchar(100) DEFAULT NULL,
  `TYPE` decimal(22,0) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_perm_cate`
--

LOCK TABLES `auth_perm_cate` WRITE;
/*!40000 ALTER TABLE `auth_perm_cate` DISABLE KEYS */;
INSERT INTO `auth_perm_cate` VALUES ('4028819f2f293805012f293e7eab0001','知识管理','kb',NULL,'1008','0'),('4028819f2f293805012f294a026c0002','知识库管理','obj','4028819f2f293805012f293e7eab0001','1008.1002','0'),('4028819f2f293805012f295599760004','本体类管理','cls','4028819f2f293805012f293e7eab0001','1008.1000L','0'),('4028819f2f293805012f2955d5c40005','词类管理','word','4028819f2f293805012f293e7eab0001','1008.1004L','0'),('4028819f2f293805012f2956469e0006','辅助功能管理','misc','4028819f2f293805012f293e7eab0001','1008.1001','0'),('4028819f2f2a14f4012f2a1909fe0001','默认权限','DEF',NULL,'1000L','1'),('4028819f2f3852cf012f38f1dbf10060','权限管理','op','4028829f2f251760012f252c48550002','1001.1000L','0'),('4028819f2f3852cf012f38f270320061','用户管理','usr','4028829f2f251760012f252c48550002','1001.1006L','0'),('4028819f2f3852cf012f38f2c69f0062','角色管理','role','4028829f2f251760012f252c48550002','1001.1003L','0'),('4028819f2f3852cf012f38f58fe10063','资源管理','perm','4028829f2f251760012f252c48550002','1001.1001L','0'),('4028819f2f39109a012f392e42490003','AI虚拟终端','aiconsole','4028819f2f293805012f2956469e0006','1008.1001.1000L','0'),('4028819f2f39109a012f392e89540004','上下文反问','ctx','4028819f2f293805012f2956469e0006','1008.1001.1004','0'),('4028819f2f39109a012f3930a7fe0006','规则管理','rule','4028819f2f39109a012f392e89540004','1008.1001.1004.1001L','0'),('4028819f2f39109a012f3930c6f00007','节点管理','node','4028819f2f39109a012f392e89540004','1008.1001.1004.1000L','0'),('4028819f2f39109a012f39324a150008','指令管理','ins','4028819f2f293805012f2956469e0006','1008.1001.1006L','0'),('4028819f2f39109a012f39328cac0009','维度管理','dim','4028819f2f293805012f2956469e0006','1008.1001.1005L','0'),('4028819f2f39109a012f3932ddba000a','停词管理','stopword','4028819f2f293805012f2956469e0006','1008.1001.1009L','0'),('4028819f2f39109a012f3933a6b7000b','前后缀管理','presuffix','4028819f2f293805012f2956469e0006','1008.1001.1008L','0'),('4028819f2f39109a012f3934daa3000c','模块管理','module','4028819f2f293805012f2956469e0006','1008.1001.1007L','0'),('4028819f2f39960e012f399a85ad0001','渠道管理','bot',NULL,'1002','0'),('4028819f2f39960e012f399b8b270002','运维管理','om',NULL,'1010','0'),('4028819f2f39960e012f399bade10003','服务管理','mkt',NULL,'1009','0'),('4028819f2f430f26012f435b833b0001','统计报表','stat','4028819f2f293805012f293e7eab0001','1008.1003L','0'),('4028819f2f4e3006012f4e50fdaf0003','实例管理','instance','4028819f2f293805012f294a026c0002','1008.1002.1002L','0'),('4028819f2f51c804012f51d105b70001','逻辑分类管理','catecontent','4028819f2f293805012f294a026c0002','1008.1002.1000','0'),('4028819f2fb4f6b8012fb5275fc3000b','知识点分类根节点','0','4028819f2f51c804012f51d105b70001','1008.1002.1000.1000L','0'),('4028819f3eef1ba9013eef1bb5fd0002','基本对话','4028819f3eef1ba9013eef1bb53d0001','4028819f2f51c804012f51d105b70001','1008.1002.1000.1001L','0'),('4028819f3eef1ba9013eef1bb6410004','专业知识点','4028819f3eef1ba9013eef1bb6180003','4028819f2f51c804012f51d105b70001','1008.1002.1000.1002L','0'),('4028819f3eef1ba9013eef1bb6870006','公用对话','4028819f3eef1ba9013eef1bb6550005','4028819f2f51c804012f51d105b70001','1008.1002.1000.1003L','0'),('4028819f3eef1ba9013eef1bb6cf0008','公用知识点','4028819f3eef1ba9013eef1bb69e0007','4028819f2f51c804012f51d105b70001','1008.1002.1000.1004L','0'),('4028819f3f5a5c32013f5b0d94ee0001','应用管理','c_app',NULL,'1003L','0'),('4028819f3f5a5c32013f5b0e19020002','预设配置管理','c_preset',NULL,'1007L','0'),('4028819f3f5a5c32013f5b0e96440003','公共库管理','c_common',NULL,'1005L','0'),('4028819f3f5a5c32013f5b0f23f10004','应用监控','c_monitor',NULL,'1006L','0'),('402881ab334896b801334898ffe60005','会话日志明细','sess','402881dc2f708729012f70b62d100001','1010.1001.1006L','0'),('402881ab334896b80133489dba590006','自动问答明细','ask','402881dc2f708729012f70b62d100001','1010.1001.1001L','0'),('402881ab334896b80133489e4b3f0007','人工客服明细','acs','402881dc2f708729012f70b62d100001','1010.1001.1000L','0'),('402881ab334896b80133489ea6cc0008','操作日志明细','op','402881dc2f708729012f70b62d100001','1010.1001.1005L','0'),('402881ab334896b80133489fc1060009','用户留言明细','lw','402881dc2f708729012f70b62d100001','1010.1001.1003L','0'),('402881ab334896b80133489ff2f3000a','征名活动明细','nc','402881dc2f708729012f70b62d100001','1010.1001.1004L','0'),('402881ab334896b8013348a3d3cf000b','访问数据统计(时间)','tv','402881dc2f71f43a012f71f708680001','1010.1002.1005L','0'),('402881ab334896b8013348a4a306000c','访问数据统计(维度)','dv','402881dc2f71f43a012f71f708680001','1010.1002.1000L','0'),('402881ab334896b8013348a52bdd000d','知识点调查统计','ki','402881dc2f71f43a012f71f708680001','1010.1002.1001L','0'),('402881ab334896b8013348a576b2000e','满意度调查统计','si','402881dc2f71f43a012f71f708680001','1010.1002.1003L','0'),('402881ab334896b8013348a6905f000f','知识点排名统计','kr','402881dc2f71f43a012f71f708680001','1010.1002.1002L','0'),('402881ab334896b8013348a886910010','未匹配问题统计','uq','402881dc2f71f43a012f71f708680001','1010.1002.1006L','0'),('402881ab334896b8013348b3d8750012','签名活动管理','sig','4028819f2f39960e012f399bade10003','1009.1007L','0'),('402881ab334896b8013348b416870013','调查投票管理','vote','4028819f2f39960e012f399bade10003','1009.1009L','0'),('402881ab334896b8013348b441120014','动态菜单管理','dm','4028819f2f39960e012f399bade10003','1009.1000L','0'),('402881ab334896b8013348b4e65b0016','消息推送管理','push','4028819f2f39960e012f399bade10003','1009.1005','0'),('402881ab334896b8013348b5299d0017','消息列表','list','402881ab334896b8013348b4e65b0016','1009.1005.1001L','0'),('402881ab334896b8013348b55dfc0018','推送历史','his','402881ab334896b8013348b4e65b0016','1009.1005.1000L','0'),('402881ab334896b8013348b584cd0019','热点问题管理','hq','4028819f2f39960e012f399bade10003','1009.1001','0'),('402881ab334896b8013348b5bcd5001a','定制热点问题','cus','402881ab334896b8013348b584cd0019','1009.1001.1001L','0'),('402881ab334896b8013348b5dfce001b','动态热点问题','auto','402881ab334896b8013348b584cd0019','1009.1001.1000L','0'),('402881ab334896b8013348b62d90001c','公告内容管理','ntc','4028819f2f39960e012f399bade10003','1009.1004L','0'),('402881ab33bf15490133bf1760ba0001','账号列表管理','acc','4028819f2f39960e012f399a85ad0001','1002.1000L','0'),('402881ab33bf15490133bf17ab020002','自定义表情管理','emot','4028819f2f39960e012f399a85ad0001','1002.1003L','0'),('402881ab33bf80530133bf81b1b50001','知识库跑错','chkw','4028819f2f293805012f2956469e0006','1008.1001.1002L','0'),('402881ab33bf80530133bf81e2c80002','基础词管理','bword','4028819f2f293805012f2956469e0006','1008.1001.1001L','0'),('402881ab33bf80530133bf8223f70003','通用聊天管理','commchat','4028819f2f293805012f2956469e0006','1008.1001.1003L','0'),('402881b53dfd3569013dfd3e1b3f0005','语音管理','rs',NULL,'1011','0'),('402881b53dfd3569013dfd5313590006','语音语料管理','sentence','402881b53dfd3569013dfd3e1b3f0005','1011.1002L','0'),('402881b53dfd3569013dfd5497880007','语音词类管理','word','402881b53dfd3569013dfd3e1b3f0005','1011.1003','0'),('402881b53dfd3569013dfd5686a60008','词典功能管理','dict','402881b53dfd3569013dfd3e1b3f0005','1011.1000','0'),('402881b53dfd3569013dfd5744970009','语音识别测试','reco','402881b53dfd3569013dfd3e1b3f0005','1011.1001','0'),('402881b53dfd3569013dfd59eb1f000a','语音词类','speech','402881b53dfd3569013dfd5497880007','1011.1003.1001L','0'),('402881b53dfd3569013dfd5a7c14000b','迷你词类','mini','402881b53dfd3569013dfd5497880007','1011.1003.1000L','0'),('402881b53dfd3569013dfd618b45000c','语音发音词典','pron','402881b53dfd3569013dfd5686a60008','1011.1000.1002L','0'),('402881b53dfd3569013dfd622c86000d','发音辅助工具','speech_assist','402881b53dfd3569013dfd5686a60008','1011.1000.1003L','0'),('402881b53dfd3569013dfd62863f000e','语音测试工具','speech_test','402881b53dfd3569013dfd5686a60008','1011.1000.1004L','0'),('402881b53dfd3569013dfd62cae9000f','常用英文缩写','eng_abb','402881b53dfd3569013dfd5686a60008','1011.1000.1000L','0'),('402881b53dfd3569013dfd6322ad0010','常用英文单词','eng_word','402881b53dfd3569013dfd5686a60008','1011.1000.1001L','0'),('402881b53dfd3569013dfd65290d0011','语音样例管理','sample','402881b53dfd3569013dfd5744970009','1011.1001.1000L','0'),('402881b53dfd3569013dfd658db20012','识别结果统计','stat','402881b53dfd3569013dfd5744970009','1011.1001.1001L','0'),('402881dc2f708729012f70b62d100001','日志管理','log','4028819f2f39960e012f399b8b270002','1010.1001','0'),('402881dc2f71f43a012f71f708680001','统计分析管理','stat','4028819f2f39960e012f399b8b270002','1010.1002','0'),('4028829f2f251760012f252c48550002','系统管理','auth',NULL,'1001','0'),('4028829f2f63913f012f63c43db10001','实例维度管理','dim','4028819f2f293805012f294a026c0002','1008.1002.1001L','0'),('ff8080813e118854013e118cdc4d0016','服务参数配置','msgr','4028819f2f39960e012f399bade10003','1009.1003L','0'),('ff8080813e118854013e118d7fb60017','对话预处理','sdlg','4028819f2f39960e012f399bade10003','1009.1006L','0'),('ff8080813e118854013e118e31170018','形象套装设置','adv','4028819f2f39960e012f399a85ad0001','1002.1001L','0'),('ff8080813e118854013e118eb0a40019','web模板管理','tpl','4028819f2f39960e012f399a85ad0001','1002.1005L','0'),('ff8080813e118854013e118f4ff8001a','黑名单管理','blst','4028819f2f39960e012f399a85ad0001','1002.1002L','0'),('ff8080813e118854013e118f4ff8001b','平台扩展接口','sdlg','4028819f2f39960e012f399a85ad0001','1002.1004L','0'),('ff8080813e118854013e119020e4001b','系统参数管理','sysp','4028829f2f251760012f252c48550002','1001.1005L','0'),('ff8080813e118854013e1190605f001c','接口权限管理','rapi','4028829f2f251760012f252c48550002','1001.1002L','0'),('ff8080813e118854013e11908411001d','系统监控管理','sysinfo','4028829f2f251760012f252c48550002','1001.1004L','0'),('ff8080813e118854013e119129c2001e','特殊欢迎语配置','welr','4028819f2f39960e012f399bade10003','1009.1010L','0'),('ff8080813e118854013e119169b6001f','二次开发管理','lib','4028819f2f39960e012f399bade10003','1009.1002L','0'),('ff8080813e118854013e119292540020','系统服务管理','svc','4028819f2f39960e012f399bade10003','1009.1008L','0'),('ff8080813e118854013e11935e3c0021','服务日志明细','svc','402881dc2f708729012f70b62d100001','1010.1001.1007L','0'),('ff8080813e118854013e1193b5190022','未解决问答明细','fv','402881dc2f708729012f70b62d100001','1010.1001.1002L','0'),('ff8080813e118854013e1193ff020023','服务日志统计','svc','402881dc2f71f43a012f71f708680001','1010.1002.1004L','0'),('ff8080813e118854013e11be33a40024','其他运维管理','custom','4028819f2f39960e012f399b8b270002','1010.1000L','0');
/*!40000 ALTER TABLE `auth_perm_cate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_perm_cate_to_perm`
--

DROP TABLE IF EXISTS `auth_perm_cate_to_perm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_perm_cate_to_perm` (
  `CATE_ID` varchar(32) NOT NULL,
  `PERM_ID` varchar(32) NOT NULL,
  PRIMARY KEY (`CATE_ID`,`PERM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_perm_cate_to_perm`
--

LOCK TABLES `auth_perm_cate_to_perm` WRITE;
/*!40000 ALTER TABLE `auth_perm_cate_to_perm` DISABLE KEYS */;
INSERT INTO `auth_perm_cate_to_perm` VALUES ('4028819f2f4e3006012f4e50fdaf0003','4028819f2f2a14f4012f2a1a017e0002'),('4028819f2f4e3006012f4e50fdaf0003','4028819f2f2a14f4012f2a1a32520003'),('4028819f2f4e3006012f4e50fdaf0003','4028819f2f2a14f4012f2a1a554b0004'),('4028819f2f4e3006012f4e50fdaf0003','4028819f2f2a14f4012f2a1a8beb0005'),('4028819f2f4e3006012f4e50fdaf0003','4028819f2f4e3006012f4e3f13cf0001'),('4028819f2f4e3006012f4e50fdaf0003','4028819f2f4e3006012f4e526ec30006'),('4028819f2fb4f6b8012fb5275fc3000b','4028819f2f2a14f4012f2a1a017e0002'),('4028819f2fb4f6b8012fb5275fc3000b','4028819f2f2a14f4012f2a1a32520003'),('4028819f2fb4f6b8012fb5275fc3000b','4028819f2f2a14f4012f2a1a554b0004'),('4028819f2fb4f6b8012fb5275fc3000b','4028819f2f2a14f4012f2a1a8beb0005'),('4028819f2fb4f6b8012fb5275fc3000b','4028819f2f4e3006012f4e3f13cf0001'),('4028819f2fb4f6b8012fb5275fc3000b','4028819f2f4e3006012f4e51c7f40004'),('4028819f2fb4f6b8012fb5275fc3000b','4028819f2f4e3006012f4e5200c70005'),('4028819f2fb4f6b8012fb5275fc3000b','4028819f2f4e3006012f4e526ec30006'),('4028819f3eef1ba9013eef1bb5fd0002','4028819f2f2a14f4012f2a1a017e0002'),('4028819f3eef1ba9013eef1bb5fd0002','4028819f2f2a14f4012f2a1a32520003'),('4028819f3eef1ba9013eef1bb5fd0002','4028819f2f2a14f4012f2a1a554b0004'),('4028819f3eef1ba9013eef1bb5fd0002','4028819f2f2a14f4012f2a1a8beb0005'),('4028819f3eef1ba9013eef1bb5fd0002','4028819f2f4e3006012f4e3f13cf0001'),('4028819f3eef1ba9013eef1bb5fd0002','4028819f2f4e3006012f4e51c7f40004'),('4028819f3eef1ba9013eef1bb5fd0002','4028819f2f4e3006012f4e5200c70005'),('4028819f3eef1ba9013eef1bb5fd0002','4028819f2f4e3006012f4e526ec30006'),('4028819f3eef1ba9013eef1bb6410004','4028819f2f2a14f4012f2a1a017e0002'),('4028819f3eef1ba9013eef1bb6410004','4028819f2f2a14f4012f2a1a32520003'),('4028819f3eef1ba9013eef1bb6410004','4028819f2f2a14f4012f2a1a554b0004'),('4028819f3eef1ba9013eef1bb6410004','4028819f2f2a14f4012f2a1a8beb0005'),('4028819f3eef1ba9013eef1bb6410004','4028819f2f4e3006012f4e3f13cf0001'),('4028819f3eef1ba9013eef1bb6410004','4028819f2f4e3006012f4e51c7f40004'),('4028819f3eef1ba9013eef1bb6410004','4028819f2f4e3006012f4e5200c70005'),('4028819f3eef1ba9013eef1bb6410004','4028819f2f4e3006012f4e526ec30006'),('4028819f3eef1ba9013eef1bb6870006','4028819f2f2a14f4012f2a1a017e0002'),('4028819f3eef1ba9013eef1bb6870006','4028819f2f2a14f4012f2a1a32520003'),('4028819f3eef1ba9013eef1bb6870006','4028819f2f2a14f4012f2a1a554b0004'),('4028819f3eef1ba9013eef1bb6870006','4028819f2f2a14f4012f2a1a8beb0005'),('4028819f3eef1ba9013eef1bb6870006','4028819f2f4e3006012f4e3f13cf0001'),('4028819f3eef1ba9013eef1bb6870006','4028819f2f4e3006012f4e51c7f40004'),('4028819f3eef1ba9013eef1bb6870006','4028819f2f4e3006012f4e5200c70005'),('4028819f3eef1ba9013eef1bb6870006','4028819f2f4e3006012f4e526ec30006'),('4028819f3eef1ba9013eef1bb6cf0008','4028819f2f2a14f4012f2a1a017e0002'),('4028819f3eef1ba9013eef1bb6cf0008','4028819f2f2a14f4012f2a1a32520003'),('4028819f3eef1ba9013eef1bb6cf0008','4028819f2f2a14f4012f2a1a554b0004'),('4028819f3eef1ba9013eef1bb6cf0008','4028819f2f2a14f4012f2a1a8beb0005'),('4028819f3eef1ba9013eef1bb6cf0008','4028819f2f4e3006012f4e3f13cf0001'),('4028819f3eef1ba9013eef1bb6cf0008','4028819f2f4e3006012f4e51c7f40004'),('4028819f3eef1ba9013eef1bb6cf0008','4028819f2f4e3006012f4e5200c70005'),('4028819f3eef1ba9013eef1bb6cf0008','4028819f2f4e3006012f4e526ec30006');
/*!40000 ALTER TABLE `auth_perm_cate_to_perm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_role`
--

DROP TABLE IF EXISTS `auth_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_role` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `DESC_CONTENT` varchar(100) DEFAULT NULL,
  `DISABLED` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_role`
--

LOCK TABLES `auth_role` WRITE;
/*!40000 ALTER TABLE `auth_role` DISABLE KEYS */;
INSERT INTO `auth_role` VALUES ('4028819f2f0f9eed012f0feb1f80002d','管理员','管理员',0);
/*!40000 ALTER TABLE `auth_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_role_perm`
--

DROP TABLE IF EXISTS `auth_role_perm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_role_perm` (
  `ROLE_ID` varchar(32) NOT NULL,
  `PERM_ID` varchar(32) DEFAULT NULL,
  `CATE_ID` varchar(32) DEFAULT NULL,
  `ID` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_role_perm`
--

LOCK TABLES `auth_role_perm` WRITE;
/*!40000 ALTER TABLE `auth_role_perm` DISABLE KEYS */;
INSERT INTO `auth_role_perm` VALUES ('4028819f2f0f9eed012f0feb1f80002d',NULL,'4028829f2f251760012f252c48550002','ff808081400ad8cd01400f1e62b2001d'),('4028819f2f0f9eed012f0feb1f80002d',NULL,'4028819f3f5a5c32013f5b0e19020002','ff808081400ad8cd01400f1e62b3001e'),('4028819f2f0f9eed012f0feb1f80002d',NULL,'4028819f3f5a5c32013f5b0f23f10004','ff808081400ad8cd01400f1e62b4001f'),('4028819f2f0f9eed012f0feb1f80002d',NULL,'4028819f3f5a5c32013f5b0d94ee0001','ff808081400ad8cd01400f1e62b50020'),('4028819f2f0f9eed012f0feb1f80002d',NULL,'4028819f2f39960e012f399a85ad0001','ff808081400ad8cd01400f1e62b60021');
/*!40000 ALTER TABLE `auth_role_perm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_task`
--

DROP TABLE IF EXISTS `auth_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_task` (
  `ID` varchar(100) NOT NULL,
  `TASK_NAME` varchar(100) NOT NULL,
  `ADMIN_NAME` varchar(50) DEFAULT NULL,
  `CREATE_TIME` timestamp NULL DEFAULT NULL,
  `TASK_URL` varchar(200) NOT NULL,
  `LOCATION` varchar(100) DEFAULT NULL,
  `PLATFORM` varchar(100) DEFAULT NULL,
  `ITEM_TYPE` varchar(100) DEFAULT NULL,
  `EXECUTE_TIME` timestamp NULL DEFAULT NULL,
  `TIMER` varchar(100) DEFAULT NULL,
  `TIME_INTERVAL` varchar(100) DEFAULT NULL,
  `EMAILS` varchar(2000) DEFAULT NULL,
  `PROJECT_ID` varchar(100) DEFAULT NULL,
  `MATCHING_EXPRESSION` varchar(2000) DEFAULT NULL,
  `BRAND` varchar(100) DEFAULT NULL,
  `CUSTOM_PARAMS_STR` varchar(2000) DEFAULT NULL,
  `TASK_TYPE` varchar(100) DEFAULT NULL,
  `CONTAIN_ANSWER` varchar(1000) DEFAULT NULL,
  `MODULE_ID` varchar(100) DEFAULT NULL,
  `COMMAND` varchar(100) DEFAULT NULL,
  `MULTIPLE` int(11) NOT NULL DEFAULT '1',
  `TASK_SWITCH` int(11) NOT NULL DEFAULT '0',
  `MAIN_MULTIPLE` int(11) NOT NULL DEFAULT '1',
  `LAST_EXECUTE_TIME` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_task`
--

LOCK TABLES `auth_task` WRITE;
/*!40000 ALTER TABLE `auth_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_task_knowledge`
--

DROP TABLE IF EXISTS `auth_task_knowledge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_task_knowledge` (
  `ID` varchar(100) NOT NULL,
  `TASK_ID` varchar(100) NOT NULL,
  `QUESTION` varchar(1000) DEFAULT NULL,
  `TEST_QUESTION` varchar(1000) DEFAULT NULL,
  `ANSWER` varchar(2000) DEFAULT NULL,
  `SORT_ID` int(11) DEFAULT '0',
  `CREATE_TIME` timestamp NULL DEFAULT NULL,
  `CASES_COLUMN` varchar(3000) DEFAULT NULL,
  `WORD` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_task_knowledge`
--

LOCK TABLES `auth_task_knowledge` WRITE;
/*!40000 ALTER TABLE `auth_task_knowledge` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_task_knowledge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_task_result`
--

DROP TABLE IF EXISTS `auth_task_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_task_result` (
  `ID` varchar(100) NOT NULL,
  `TASK_ID` varchar(100) NOT NULL,
  `TK_ID` varchar(100) NOT NULL,
  `T_QUESTION` varchar(1000) DEFAULT NULL,
  `T_ANSWER` varchar(4000) DEFAULT NULL,
  `T_ANSWER_TYPE` varchar(10) DEFAULT NULL,
  `IS_RIGHT` varchar(10) DEFAULT NULL,
  `TASK_TIME` timestamp NULL DEFAULT NULL,
  `IS_CONTAIN_QUESTION` varchar(10) DEFAULT NULL,
  `TASK_DATE` varchar(10) DEFAULT '',
  `RELATE_QUESTIONS` varchar(1000) DEFAULT NULL,
  `RESULT_XML` varchar(4000) DEFAULT NULL,
  `MATCHING_EXPRESSION_ON_RUNTIME` varchar(1000) DEFAULT NULL,
  `TRIGGER_MODULE_ID` varchar(200) DEFAULT NULL,
  `TRIGGER_COMMAND` varchar(200) DEFAULT NULL,
  `TRIGGER_ANSWER` varchar(3000) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_task_result`
--

LOCK TABLES `auth_task_result` WRITE;
/*!40000 ALTER TABLE `auth_task_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_task_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `ID` varchar(32) NOT NULL,
  `USERNAME` varchar(100) NOT NULL,
  `PASSWORD` varchar(256) NOT NULL,
  `REMARKS` varchar(200) DEFAULT NULL,
  `STATUS` int(11) NOT NULL DEFAULT '8',
  `EXPIRATION` varchar(32) DEFAULT NULL,
  `REGEX_IP` varchar(64) DEFAULT NULL,
  `PWD_EDIT_DATE` timestamp NULL DEFAULT NULL,
  `PWD_EXPIRE_DAY` int(11) DEFAULT NULL,
  `STATUS_AUDIT` int(11) DEFAULT '0',
  `TYPE_AUDIT` varchar(200) DEFAULT NULL,
  `TASKINFO_AUDIT` varchar(500) DEFAULT NULL,
  `ASSIGNEE_AUDIT` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES ('4028819f2f44297c012f445105540001','admin','admin',NULL,8,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_role`
--

DROP TABLE IF EXISTS `auth_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_role` (
  `USER_ID` varchar(32) NOT NULL,
  `ROLE_ID` varchar(32) NOT NULL,
  PRIMARY KEY (`USER_ID`,`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_role`
--

LOCK TABLES `auth_user_role` WRITE;
/*!40000 ALTER TABLE `auth_user_role` DISABLE KEYS */;
INSERT INTO `auth_user_role` VALUES ('4028819f2f44297c012f445105540001','4028819f2f0f9eed012f0feb1f80002d');
/*!40000 ALTER TABLE `auth_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_web_access`
--

DROP TABLE IF EXISTS `auth_web_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_web_access` (
  `ID` varchar(32) NOT NULL,
  `COMPANY_NAME` varchar(50) DEFAULT NULL,
  `WINDOWS_COLOR` varchar(50) DEFAULT NULL,
  `HEAD_ICON_FORMAT` varchar(255) DEFAULT NULL,
  `HEAD_ICON` mediumblob,
  `CHAT_POSITION` varchar(255) DEFAULT NULL,
  `CREATE_TIME` varchar(255) DEFAULT NULL,
  `UPDATE_TIME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_web_access`
--

LOCK TABLES `auth_web_access` WRITE;
/*!40000 ALTER TABLE `auth_web_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_web_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_cfg_entry`
--

DROP TABLE IF EXISTS `c_cfg_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_cfg_entry` (
  `ID` varchar(32) NOT NULL,
  `APP_ID` varchar(32) DEFAULT NULL,
  `PROPKEY` varchar(100) DEFAULT NULL,
  `PROPVALUE` varchar(4000) DEFAULT NULL,
  `PST_CFG_ENTRY_ID` varchar(32) DEFAULT NULL,
  `PST_CFG_CATE_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_cfg_entry`
--

LOCK TABLES `c_cfg_entry` WRITE;
/*!40000 ALTER TABLE `c_cfg_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_cfg_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_mgrapp`
--

DROP TABLE IF EXISTS `c_mgrapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_mgrapp` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `CREATE_TIME` timestamp NULL DEFAULT NULL,
  `CATE_ID` varchar(32) DEFAULT NULL,
  `URI` varchar(30) DEFAULT NULL,
  `PRIORITY` int(11) NOT NULL DEFAULT '0',
  `DISABLED` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_mgrapp`
--

LOCK TABLES `c_mgrapp` WRITE;
/*!40000 ALTER TABLE `c_mgrapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_mgrapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_mgrapp_cate`
--

DROP TABLE IF EXISTS `c_mgrapp_cate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_mgrapp_cate` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `PRIORITY` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_mgrapp_cate`
--

LOCK TABLES `c_mgrapp_cate` WRITE;
/*!40000 ALTER TABLE `c_mgrapp_cate` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_mgrapp_cate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_preset_cfg_cate`
--

DROP TABLE IF EXISTS `c_preset_cfg_cate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_preset_cfg_cate` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `CATE_ID` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_preset_cfg_cate`
--

LOCK TABLES `c_preset_cfg_cate` WRITE;
/*!40000 ALTER TABLE `c_preset_cfg_cate` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_preset_cfg_cate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_preset_cfg_entry`
--

DROP TABLE IF EXISTS `c_preset_cfg_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_preset_cfg_entry` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `PROPKEY` varchar(100) DEFAULT NULL,
  `PROPVALUE` varchar(4000) DEFAULT NULL,
  `PRESET_CATE_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_preset_cfg_entry`
--

LOCK TABLES `c_preset_cfg_entry` WRITE;
/*!40000 ALTER TABLE `c_preset_cfg_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_preset_cfg_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `om_log_system`
--

DROP TABLE IF EXISTS `om_log_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `om_log_system` (
  `ID` varchar(32) NOT NULL,
  `MODULE` varchar(32) DEFAULT NULL,
  `TYPE` decimal(10,0) DEFAULT NULL,
  `CONTENT` varchar(4000) DEFAULT NULL,
  `USER_NAME` varchar(64) DEFAULT NULL,
  `USER_IP` varchar(32) DEFAULT NULL,
  `OPERATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `om_log_system`
--

LOCK TABLES `om_log_system` WRITE;
/*!40000 ALTER TABLE `om_log_system` DISABLE KEYS */;
/*!40000 ALTER TABLE `om_log_system` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-12 19:51:04