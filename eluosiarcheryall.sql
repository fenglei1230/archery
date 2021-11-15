-- MySQL dump 10.13  Distrib 5.7.34, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: archery
-- ------------------------------------------------------
-- Server version	5.7.34-log

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
-- Table structure for table `aliyun_rds_config`
--

DROP TABLE IF EXISTS `aliyun_rds_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aliyun_rds_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rds_dbinstanceid` varchar(100) NOT NULL,
  `is_enable` tinyint(1) NOT NULL,
  `ak_id` int(11) NOT NULL,
  `instance_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `instance_id` (`instance_id`) USING BTREE,
  KEY `aliyun_rds_config_ak_id_d150152f_fk_cloud_access_key_id` (`ak_id`) USING BTREE,
  CONSTRAINT `aliyun_rds_config_ak_id_d150152f_fk_cloud_access_key_id` FOREIGN KEY (`ak_id`) REFERENCES `cloud_access_key` (`id`),
  CONSTRAINT `aliyun_rds_config_instance_id_4ad756cc_fk_sql_instance_id` FOREIGN KEY (`instance_id`) REFERENCES `sql_instance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aliyun_rds_config`
--

LOCK TABLES `aliyun_rds_config` WRITE;
/*!40000 ALTER TABLE `aliyun_rds_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `aliyun_rds_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archive_config`
--

DROP TABLE IF EXISTS `archive_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archive_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `audit_auth_groups` varchar(255) NOT NULL,
  `src_db_name` varchar(64) NOT NULL,
  `src_table_name` varchar(64) NOT NULL,
  `dest_db_name` varchar(64) DEFAULT NULL,
  `dest_table_name` varchar(64) DEFAULT NULL,
  `condition` varchar(1000) NOT NULL,
  `mode` varchar(10) NOT NULL,
  `no_delete` tinyint(1) NOT NULL,
  `sleep` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `user_display` varchar(50) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `last_archive_time` datetime(6) DEFAULT NULL,
  `sys_time` datetime(6) NOT NULL,
  `dest_instance_id` int(11) DEFAULT NULL,
  `resource_group_id` int(11) NOT NULL,
  `src_instance_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `archive_config_dest_instance_id_0806c7bb_fk_sql_instance_id` (`dest_instance_id`) USING BTREE,
  KEY `archive_config_resource_group_id_f39b0042_fk_resource_` (`resource_group_id`) USING BTREE,
  KEY `archive_config_src_instance_id_4dd96d4d_fk_sql_instance_id` (`src_instance_id`) USING BTREE,
  CONSTRAINT `archive_config_dest_instance_id_0806c7bb_fk_sql_instance_id` FOREIGN KEY (`dest_instance_id`) REFERENCES `sql_instance` (`id`),
  CONSTRAINT `archive_config_resource_group_id_f39b0042_fk_resource_` FOREIGN KEY (`resource_group_id`) REFERENCES `resource_group` (`group_id`),
  CONSTRAINT `archive_config_src_instance_id_4dd96d4d_fk_sql_instance_id` FOREIGN KEY (`src_instance_id`) REFERENCES `sql_instance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archive_config`
--

LOCK TABLES `archive_config` WRITE;
/*!40000 ALTER TABLE `archive_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `archive_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archive_log`
--

DROP TABLE IF EXISTS `archive_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archive_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cmd` varchar(2000) NOT NULL,
  `condition` varchar(1000) NOT NULL,
  `mode` varchar(10) NOT NULL,
  `no_delete` tinyint(1) NOT NULL,
  `sleep` int(11) NOT NULL,
  `select_cnt` int(11) NOT NULL,
  `insert_cnt` int(11) NOT NULL,
  `delete_cnt` int(11) NOT NULL,
  `statistics` longtext NOT NULL,
  `success` tinyint(1) NOT NULL,
  `error_info` longtext NOT NULL,
  `start_time` datetime(6) NOT NULL,
  `end_time` datetime(6) NOT NULL,
  `sys_time` datetime(6) NOT NULL,
  `archive_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `archive_log_archive_id_e35eacdf_fk_archive_config_id` (`archive_id`) USING BTREE,
  CONSTRAINT `archive_log_archive_id_e35eacdf_fk_archive_config_id` FOREIGN KEY (`archive_id`) REFERENCES `archive_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archive_log`
--

LOCK TABLES `archive_log` WRITE;
/*!40000 ALTER TABLE `archive_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `archive_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (3,'DBA'),(8,'develop'),(4,'PM'),(5,'QA'),(9,'test');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`) USING BTREE,
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=432 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (280,3,1),(281,3,2),(282,3,3),(283,3,4),(284,3,5),(285,3,6),(286,3,7),(287,3,8),(288,3,9),(289,3,10),(290,3,11),(291,3,12),(292,3,13),(293,3,14),(294,3,15),(295,3,16),(296,3,17),(297,3,18),(298,3,19),(299,3,20),(300,3,21),(301,3,22),(302,3,23),(303,3,24),(304,3,25),(305,3,26),(306,3,27),(307,3,28),(308,3,29),(309,3,30),(310,3,31),(311,3,32),(312,3,33),(313,3,34),(314,3,35),(315,3,36),(316,3,37),(317,3,38),(318,3,39),(319,3,40),(320,3,41),(321,3,42),(322,3,43),(323,3,44),(324,3,45),(325,3,46),(326,3,47),(327,3,48),(328,3,49),(329,3,50),(330,3,51),(331,3,52),(332,3,53),(333,3,54),(334,3,55),(335,3,56),(336,3,57),(337,3,58),(338,3,59),(339,3,60),(340,3,61),(341,3,62),(342,3,63),(343,3,64),(344,3,65),(345,3,66),(346,3,67),(347,3,68),(348,3,69),(349,3,70),(350,3,71),(351,3,72),(352,3,73),(353,3,74),(354,3,75),(355,3,76),(46,3,77),(61,3,78),(64,3,79),(60,3,80),(55,3,81),(63,3,82),(56,3,83),(62,3,84),(59,3,85),(58,3,86),(51,3,87),(53,3,88),(49,3,89),(47,3,90),(52,3,91),(54,3,92),(48,3,93),(66,3,94),(44,3,95),(45,3,96),(57,3,97),(65,3,98),(50,3,99),(84,3,100),(83,3,101),(82,3,102),(81,3,103),(80,3,104),(68,3,105),(69,3,106),(67,3,107),(75,3,108),(76,3,109),(78,3,110),(79,3,111),(74,3,112),(77,3,113),(73,3,114),(72,3,115),(85,3,116),(87,3,117),(86,3,118),(43,3,119),(71,3,120),(70,3,121),(42,3,122),(39,3,123),(41,3,124),(40,3,125),(356,3,126),(357,3,127),(358,3,128),(359,3,129),(360,3,130),(361,3,131),(362,3,132),(363,3,133),(364,3,134),(365,3,135),(366,3,136),(367,3,137),(368,3,138),(369,3,139),(370,3,140),(371,3,141),(372,3,142),(373,3,143),(374,3,144),(375,3,145),(376,3,146),(377,3,147),(378,3,148),(379,3,149),(380,3,150),(381,3,151),(382,3,152),(383,3,153),(384,3,154),(385,3,155),(386,3,156),(387,3,157),(388,3,158),(389,3,159),(390,3,160),(391,3,161),(392,3,162),(393,3,163),(394,3,164),(395,3,165),(396,3,166),(397,3,167),(398,3,168),(399,3,169),(400,3,170),(401,3,171),(402,3,172),(403,3,173),(404,3,174),(405,3,175),(406,3,176),(407,3,177),(408,3,178),(409,3,179),(410,3,180),(411,3,181),(412,3,182),(413,3,183),(414,3,184),(415,3,185),(416,3,186),(417,3,187),(418,3,188),(419,3,189),(420,3,190),(421,3,191),(422,3,192),(423,3,193),(424,3,194),(425,3,195),(426,3,196),(427,3,197),(428,3,198),(429,3,199),(430,3,200),(431,3,201),(105,4,77),(113,4,78),(116,4,79),(112,4,80),(108,4,81),(115,4,82),(109,4,83),(114,4,84),(111,4,85),(110,4,86),(106,4,93),(117,4,94),(104,4,95),(107,4,99),(127,4,100),(126,4,101),(125,4,102),(124,4,103),(123,4,104),(119,4,105),(118,4,107),(120,4,108),(121,4,110),(122,4,111),(102,4,123),(103,4,124),(133,5,77),(138,5,78),(140,5,79),(136,5,81),(139,5,82),(137,5,83),(134,5,93),(135,5,99),(144,5,100),(143,5,103),(141,5,108),(142,5,111),(189,8,41),(210,8,77),(211,8,78),(212,8,79),(213,8,80),(214,8,81),(215,8,82),(217,8,84),(220,8,85),(219,8,86),(223,8,93),(224,8,94),(208,8,96),(209,8,97),(190,8,100),(191,8,101),(192,8,102),(193,8,103),(194,8,104),(195,8,105),(196,8,106),(197,8,107),(198,8,108),(199,8,110),(200,8,111),(201,8,112),(216,8,113),(202,8,114),(203,8,115),(204,8,116),(205,8,117),(206,8,118),(221,8,120),(207,8,123),(222,8,124),(218,8,125),(182,8,128),(183,8,129),(184,8,137),(185,8,145),(186,8,148),(187,8,149),(188,8,161),(237,9,41),(238,9,77),(239,9,78),(240,9,79),(241,9,80),(242,9,81),(243,9,82),(244,9,84),(245,9,85),(246,9,86),(247,9,93),(248,9,94),(249,9,96),(250,9,97),(251,9,100),(252,9,101),(253,9,102),(254,9,103),(255,9,104),(256,9,105),(257,9,106),(258,9,107),(259,9,108),(260,9,110),(261,9,111),(262,9,112),(263,9,113),(264,9,114),(265,9,115),(266,9,116),(267,9,117),(268,9,118),(269,9,120),(270,9,123),(271,9,124),(272,9,125),(273,9,128),(274,9,129),(275,9,137),(276,9,145),(277,9,148),(278,9,149),(279,9,161);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add Scheduled task',6,'add_schedule'),(22,'Can change Scheduled task',6,'change_schedule'),(23,'Can delete Scheduled task',6,'delete_schedule'),(24,'Can view Scheduled task',6,'view_schedule'),(25,'Can add task',7,'add_task'),(26,'Can change task',7,'change_task'),(27,'Can delete task',7,'delete_task'),(28,'Can view task',7,'view_task'),(29,'Can add Failed task',8,'add_failure'),(30,'Can change Failed task',8,'change_failure'),(31,'Can delete Failed task',8,'delete_failure'),(32,'Can view Failed task',8,'view_failure'),(33,'Can add Successful task',9,'add_success'),(34,'Can change Successful task',9,'change_success'),(35,'Can delete Successful task',9,'delete_success'),(36,'Can view Successful task',9,'view_success'),(37,'Can add Queued task',10,'add_ormq'),(38,'Can change Queued task',10,'change_ormq'),(39,'Can delete Queued task',10,'delete_ormq'),(40,'Can view Queued task',10,'view_ormq'),(41,'Can add 慢日志统计',11,'add_slowquery'),(42,'Can change 慢日志统计',11,'change_slowquery'),(43,'Can delete 慢日志统计',11,'delete_slowquery'),(44,'Can view 慢日志统计',11,'view_slowquery'),(45,'Can add 慢日志明细',12,'add_slowqueryhistory'),(46,'Can change 慢日志明细',12,'change_slowqueryhistory'),(47,'Can delete 慢日志明细',12,'delete_slowqueryhistory'),(48,'Can view 慢日志明细',12,'view_slowqueryhistory'),(49,'Can add 归档配置表',13,'add_archiveconfig'),(50,'Can change 归档配置表',13,'change_archiveconfig'),(51,'Can delete 归档配置表',13,'delete_archiveconfig'),(52,'Can view 归档配置表',13,'view_archiveconfig'),(53,'Can add 云服务认证信息配置',14,'add_cloudaccesskey'),(54,'Can change 云服务认证信息配置',14,'change_cloudaccesskey'),(55,'Can delete 云服务认证信息配置',14,'delete_cloudaccesskey'),(56,'Can view 云服务认证信息配置',14,'view_cloudaccesskey'),(57,'Can add 系统配置',15,'add_config'),(58,'Can change 系统配置',15,'change_config'),(59,'Can delete 系统配置',15,'delete_config'),(60,'Can view 系统配置',15,'view_config'),(61,'Can add 脱敏规则配置',16,'add_datamaskingrules'),(62,'Can change 脱敏规则配置',16,'change_datamaskingrules'),(63,'Can delete 脱敏规则配置',16,'delete_datamaskingrules'),(64,'Can view 脱敏规则配置',16,'view_datamaskingrules'),(65,'Can add 实例配置',17,'add_instance'),(66,'Can change 实例配置',17,'change_instance'),(67,'Can delete 实例配置',17,'delete_instance'),(68,'Can view 实例配置',17,'view_instance'),(69,'Can add 实例标签',18,'add_instancetag'),(70,'Can change 实例标签',18,'change_instancetag'),(71,'Can delete 实例标签',18,'delete_instancetag'),(72,'Can view 实例标签',18,'view_instancetag'),(73,'Can add permission',19,'add_permission'),(74,'Can change permission',19,'change_permission'),(75,'Can delete permission',19,'delete_permission'),(76,'Can view permission',19,'view_permission'),(77,'菜单 Dashboard',19,'menu_dashboard'),(78,'菜单 SQL审核',19,'menu_sqlcheck'),(79,'菜单 SQL上线',19,'menu_sqlworkflow'),(80,'菜单 SQL分析',19,'menu_sqlanalyze'),(81,'菜单 SQL查询',19,'menu_query'),(82,'菜单 在线查询',19,'menu_sqlquery'),(83,'菜单 权限管理',19,'menu_queryapplylist'),(84,'菜单 SQL优化',19,'menu_sqloptimize'),(85,'菜单 优化工具',19,'menu_sqladvisor'),(86,'菜单 慢查日志',19,'menu_slowquery'),(87,'菜单 实例管理',19,'menu_instance'),(88,'菜单 实例列表',19,'menu_instance_list'),(89,'菜单 会话管理',19,'menu_dbdiagnostic'),(90,'菜单 数据库管理',19,'menu_database'),(91,'菜单 实例账号管理',19,'menu_instance_account'),(92,'菜单 参数配置',19,'menu_param'),(93,'菜单 数据字典',19,'menu_data_dictionary'),(94,'菜单 工具插件',19,'menu_tools'),(95,'菜单 数据归档',19,'menu_archive'),(96,'菜单 Binlog2SQL',19,'menu_binlog2sql'),(97,'菜单 SchemaSync',19,'menu_schemasync'),(98,'菜单 系统管理',19,'menu_system'),(99,'菜单 相关文档',19,'menu_document'),(100,'提交SQL上线工单',19,'sql_submit'),(101,'审核SQL上线工单',19,'sql_review'),(102,'执行SQL上线工单(资源组粒度)',19,'sql_execute_for_resource_group'),(103,'执行SQL上线工单(仅自己提交的)',19,'sql_execute'),(104,'执行SQL分析',19,'sql_analyze'),(105,'执行SQLAdvisor',19,'optimize_sqladvisor'),(106,'执行SQLTuning',19,'optimize_sqltuning'),(107,'执行SOAR',19,'optimize_soar'),(108,'申请查询权限',19,'query_applypriv'),(109,'管理查询权限',19,'query_mgtpriv'),(110,'审核查询权限',19,'query_review'),(111,'提交SQL查询',19,'query_submit'),(112,'可查询所有实例',19,'query_all_instances'),(113,'可查询所在资源组内的所有实例',19,'query_resource_group_instance'),(114,'查看会话',19,'process_view'),(115,'终止会话',19,'process_kill'),(116,'查看表空间',19,'tablespace_view'),(117,'查看事务信息',19,'trx_view'),(118,'查看锁信息',19,'trxandlocks_view'),(119,'管理实例账号',19,'instance_account_manage'),(120,'查看实例参数列表',19,'param_view'),(121,'修改实例参数',19,'param_edit'),(122,'导出数据字典',19,'data_dictionary_export'),(123,'提交归档申请',19,'archive_apply'),(124,'审核归档申请',19,'archive_review'),(125,'管理归档申请',19,'archive_mgt'),(126,'Can add 查询日志',20,'add_querylog'),(127,'Can change 查询日志',20,'change_querylog'),(128,'Can delete 查询日志',20,'delete_querylog'),(129,'Can view 查询日志',20,'view_querylog'),(130,'Can add 资源组管理',21,'add_resourcegroup'),(131,'Can change 资源组管理',21,'change_resourcegroup'),(132,'Can delete 资源组管理',21,'delete_resourcegroup'),(133,'Can view 资源组管理',21,'view_resourcegroup'),(134,'Can add SQL工单',22,'add_sqlworkflow'),(135,'Can change SQL工单',22,'change_sqlworkflow'),(136,'Can delete SQL工单',22,'delete_sqlworkflow'),(137,'Can view SQL工单',22,'view_sqlworkflow'),(138,'Can add 隧道配置',23,'add_tunnel'),(139,'Can change 隧道配置',23,'change_tunnel'),(140,'Can delete 隧道配置',23,'delete_tunnel'),(141,'Can view 隧道配置',23,'view_tunnel'),(142,'Can add 工作流审批明细',24,'add_workflowauditdetail'),(143,'Can change 工作流审批明细',24,'change_workflowauditdetail'),(144,'Can delete 工作流审批明细',24,'delete_workflowauditdetail'),(145,'Can view 工作流审批明细',24,'view_workflowauditdetail'),(146,'Can add 工作流日志',25,'add_workflowlog'),(147,'Can change 工作流日志',25,'change_workflowlog'),(148,'Can delete 工作流日志',25,'delete_workflowlog'),(149,'Can view 工作流日志',25,'view_workflowlog'),(150,'Can add 审批流程配置',26,'add_workflowauditsetting'),(151,'Can change 审批流程配置',26,'change_workflowauditsetting'),(152,'Can delete 审批流程配置',26,'delete_workflowauditsetting'),(153,'Can view 审批流程配置',26,'view_workflowauditsetting'),(154,'Can add 工作流审批列表',27,'add_workflowaudit'),(155,'Can change 工作流审批列表',27,'change_workflowaudit'),(156,'Can delete 工作流审批列表',27,'delete_workflowaudit'),(157,'Can view 工作流审批列表',27,'view_workflowaudit'),(158,'Can add SQL工单内容',28,'add_sqlworkflowcontent'),(159,'Can change SQL工单内容',28,'change_sqlworkflowcontent'),(160,'Can delete SQL工单内容',28,'delete_sqlworkflowcontent'),(161,'Can view SQL工单内容',28,'view_sqlworkflowcontent'),(162,'Can add 查询权限申请记录表',29,'add_queryprivilegesapply'),(163,'Can change 查询权限申请记录表',29,'change_queryprivilegesapply'),(164,'Can delete 查询权限申请记录表',29,'delete_queryprivilegesapply'),(165,'Can view 查询权限申请记录表',29,'view_queryprivilegesapply'),(166,'Can add 实例参数模板配置',30,'add_paramtemplate'),(167,'Can change 实例参数模板配置',30,'change_paramtemplate'),(168,'Can delete 实例参数模板配置',30,'delete_paramtemplate'),(169,'Can view 实例参数模板配置',30,'view_paramtemplate'),(170,'Can add 实例参数修改历史',31,'add_paramhistory'),(171,'Can change 实例参数修改历史',31,'change_paramhistory'),(172,'Can delete 实例参数修改历史',31,'delete_paramhistory'),(173,'Can view 实例参数修改历史',31,'view_paramhistory'),(174,'Can add 脱敏字段配置',32,'add_datamaskingcolumns'),(175,'Can change 脱敏字段配置',32,'change_datamaskingcolumns'),(176,'Can delete 脱敏字段配置',32,'delete_datamaskingcolumns'),(177,'Can view 脱敏字段配置',32,'view_datamaskingcolumns'),(178,'Can add 归档日志表',33,'add_archivelog'),(179,'Can change 归档日志表',33,'change_archivelog'),(180,'Can delete 归档日志表',33,'delete_archivelog'),(181,'Can view 归档日志表',33,'view_archivelog'),(182,'Can add 阿里云rds配置',34,'add_aliyunrdsconfig'),(183,'Can change 阿里云rds配置',34,'change_aliyunrdsconfig'),(184,'Can delete 阿里云rds配置',34,'delete_aliyunrdsconfig'),(185,'Can view 阿里云rds配置',34,'view_aliyunrdsconfig'),(186,'Can add 用户管理',35,'add_users'),(187,'Can change 用户管理',35,'change_users'),(188,'Can delete 用户管理',35,'delete_users'),(189,'Can view 用户管理',35,'view_users'),(190,'Can add 查询权限记录',36,'add_queryprivileges'),(191,'Can change 查询权限记录',36,'change_queryprivileges'),(192,'Can delete 查询权限记录',36,'delete_queryprivileges'),(193,'Can view 查询权限记录',36,'view_queryprivileges'),(194,'Can add 实例数据库',37,'add_instancedatabase'),(195,'Can change 实例数据库',37,'change_instancedatabase'),(196,'Can delete 实例数据库',37,'delete_instancedatabase'),(197,'Can view 实例数据库',37,'view_instancedatabase'),(198,'Can add 实例账号列表',38,'add_instanceaccount'),(199,'Can change 实例账号列表',38,'change_instanceaccount'),(200,'Can delete 实例账号列表',38,'delete_instanceaccount'),(201,'Can view 实例账号列表',38,'view_instanceaccount');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cloud_access_key`
--

DROP TABLE IF EXISTS `cloud_access_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cloud_access_key` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `key_id` varchar(200) NOT NULL,
  `key_secret` varchar(200) NOT NULL,
  `remark` varchar(50) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cloud_access_key`
--

LOCK TABLES `cloud_access_key` WRITE;
/*!40000 ALTER TABLE `cloud_access_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_access_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_masking_columns`
--

DROP TABLE IF EXISTS `data_masking_columns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_masking_columns` (
  `column_id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_type` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `table_schema` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `column_name` varchar(64) NOT NULL,
  `column_comment` varchar(1024) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `sys_time` datetime(6) NOT NULL,
  `instance_id` int(11) NOT NULL,
  PRIMARY KEY (`column_id`) USING BTREE,
  KEY `data_masking_columns_instance_id_470661d3_fk_sql_instance_id` (`instance_id`) USING BTREE,
  CONSTRAINT `data_masking_columns_instance_id_470661d3_fk_sql_instance_id` FOREIGN KEY (`instance_id`) REFERENCES `sql_instance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_masking_columns`
--

LOCK TABLES `data_masking_columns` WRITE;
/*!40000 ALTER TABLE `data_masking_columns` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_masking_columns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_masking_rules`
--

DROP TABLE IF EXISTS `data_masking_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_masking_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_type` int(11) NOT NULL,
  `rule_regex` varchar(255) NOT NULL,
  `hide_group` int(11) NOT NULL,
  `rule_desc` varchar(100) NOT NULL,
  `sys_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `rule_type` (`rule_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_masking_rules`
--

LOCK TABLES `data_masking_rules` WRITE;
/*!40000 ALTER TABLE `data_masking_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_masking_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`) USING BTREE,
  KEY `django_admin_log_user_id_c564eba6_fk_sql_users_id` (`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_sql_users_id` FOREIGN KEY (`user_id`) REFERENCES `sql_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-05-07 19:56:19.401714','1','俄罗斯腾讯云测试环境',1,'[{\"added\": {}}]',21,1),(2,'2021-05-07 20:00:38.567891','6','A组（审核组）',1,'[{\"added\": {}}]',3,1),(3,'2021-05-07 20:03:50.237553','7','A组（普通用户）',1,'[{\"added\": {}}]',3,1),(4,'2021-05-11 10:17:24.698526','1','腾讯测试',1,'[{\"added\": {}}]',17,1),(5,'2021-05-11 10:28:36.584142','1','腾讯测试',2,'[{\"changed\": {\"fields\": [\"\\u7528\\u6237\\u540d\", \"\\u5bc6\\u7801\"]}}]',17,1),(6,'2021-05-11 10:29:26.287134','1','腾讯测试',2,'[]',17,1),(7,'2021-05-11 10:34:49.396189','1','支持上线',2,'[]',18,1),(8,'2021-05-11 10:34:49.544691','1','支持上线',2,'[]',18,1),(9,'2021-05-11 10:38:19.521761','7','A组（普通用户）',2,'[]',3,1),(10,'2021-05-11 10:38:31.319784','7','A组（普通用户）',2,'[]',3,1),(11,'2021-05-11 10:38:43.225270','4','PM',2,'[]',3,1),(12,'2021-05-11 11:15:51.186816','1','腾讯测试MySQL5.7',2,'[{\"changed\": {\"fields\": [\"\\u5b9e\\u4f8b\\u540d\\u79f0\"]}}]',17,1),(13,'2021-05-11 14:04:09.116994','1','腾讯测试MySQL5.7',3,'',17,1),(14,'2021-05-12 09:23:06.842876','3','运营',1,'[{\"added\": {}}]',35,2),(15,'2021-05-12 09:24:11.183728','4','倪守环',1,'[{\"added\": {}}]',35,2),(16,'2021-05-12 15:39:20.268082','2','MySQL腾讯测试',1,'[{\"added\": {}}]',17,1),(17,'2021-05-12 15:44:36.221930','2','MySQL腾讯测试',2,'[{\"changed\": {\"fields\": [\"\\u7528\\u6237\\u540d\", \"\\u5bc6\\u7801\"]}}]',17,1),(18,'2021-05-12 15:45:23.786761','2','MySQL腾讯测试',2,'[]',17,1),(19,'2021-05-12 17:30:40.357326','2','MySQL腾讯测试',2,'[{\"changed\": {\"fields\": [\"\\u7528\\u6237\\u540d\", \"\\u5bc6\\u7801\"]}}]',17,1),(20,'2021-05-12 17:32:33.314367','2','MySQL腾讯测试',2,'[{\"changed\": {\"fields\": [\"\\u7528\\u6237\\u540d\"]}}]',17,1),(21,'2021-05-12 17:38:14.411660','2','MySQL腾讯测试',2,'[{\"changed\": {\"fields\": [\"\\u7528\\u6237\\u540d\", \"\\u5bc6\\u7801\"]}}]',17,1),(22,'2021-05-12 18:25:18.548993','4','倪守环',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',35,1),(23,'2021-05-12 18:25:18.562311','4','倪守环',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',35,1),(24,'2021-05-12 18:30:15.562993','5','王文斌',1,'[{\"added\": {}}]',35,1),(25,'2021-05-13 09:33:59.484750','5','王文斌',3,'',35,1),(26,'2021-05-13 10:55:34.295322','8','develop',1,'[{\"added\": {}}]',3,1),(27,'2021-05-13 10:55:56.463041','8','develop',2,'[]',3,1),(28,'2021-05-13 10:58:47.228600','8','develop',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,1),(29,'2021-05-13 10:58:47.256937','8','develop',2,'[]',3,1),(30,'2021-05-13 11:08:49.485402','8','屠鲁俊',1,'[{\"added\": {}}]',35,1),(31,'2021-05-13 11:19:01.215772','8','屠鲁俊',2,'[{\"changed\": {\"fields\": [\"Staff status\"]}}]',35,1),(32,'2021-05-13 17:09:13.416865','6','A组（审核组）',3,'',3,1),(33,'2021-05-13 17:09:13.427283','7','A组（普通用户）',3,'',3,1),(34,'2021-05-13 17:09:13.433304','1','Default',3,'',3,1),(35,'2021-05-13 17:09:13.439239','2','RD',3,'',3,1),(36,'2021-05-13 17:53:07.873302','9','testing',2,'[]',3,1),(37,'2021-05-13 17:53:23.812861','3','DBA',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,1),(38,'2021-05-13 18:10:04.900119','8','赵本山和玛丽联梦路',2,'[{\"changed\": {\"fields\": [\"\\u663e\\u793a\\u7684\\u4e2d\\u6587\\u540d\"]}}]',35,1),(39,'2021-05-13 18:10:26.809482','8','赵本山和玛丽联梦路',2,'[{\"changed\": {\"fields\": [\"Username\"]}}]',35,1),(40,'2021-05-13 18:10:59.337017','4','倪守环',3,'',35,1),(41,'2021-05-14 09:38:26.483718','9','ghl',3,'',35,1),(42,'2021-05-14 09:38:42.697318','3','运营',3,'',35,1),(43,'2021-05-14 09:38:42.708293','8','赵本山和玛丽联梦路',3,'',35,1),(44,'2021-05-14 09:43:01.465397','3','腾讯测试redis',1,'[{\"added\": {}}]',17,1),(45,'2021-05-14 09:53:02.684058','3','腾讯测试redis',2,'[]',17,1),(46,'2021-06-25 17:34:34.304141','4','Mongot腾讯测试',1,'[{\"added\": {}}]',17,1),(47,'2021-06-25 17:40:53.885591','4','Mongot腾讯测试',2,'[{\"changed\": {\"fields\": [\"\\u7528\\u6237\\u540d\", \"\\u5bc6\\u7801\"]}}]',17,1),(48,'2021-06-25 17:47:20.979495','4','Mongot腾讯测试10.35.1.6',2,'[{\"changed\": {\"fields\": [\"\\u5b9e\\u4f8b\\u540d\\u79f0\", \"\\u5b9e\\u4f8b\\u8fde\\u63a5\", \"\\u7528\\u6237\\u540d\", \"\\u5bc6\\u7801\"]}}]',17,1),(49,'2021-06-25 17:48:55.695428','4','Mongot腾讯测试10.35.1.6',2,'[{\"changed\": {\"fields\": [\"\\u7528\\u6237\\u540d\", \"\\u5bc6\\u7801\"]}}]',17,1),(50,'2021-06-25 17:52:06.288457','4','Mongot腾讯测试10.35.1.6',2,'[{\"changed\": {\"fields\": [\"\\u7528\\u6237\\u540d\", \"\\u5bc6\\u7801\", \"\\u6570\\u636e\\u5e93\"]}}]',17,1),(51,'2021-06-25 17:52:49.568771','4','Mongot腾讯测试10.35.1.6',2,'[{\"changed\": {\"fields\": [\"\\u5b9e\\u4f8b\\u6807\\u7b7e\"]}}]',17,1),(52,'2021-09-28 11:12:41.727976','8','develop',2,'[]',3,1),(53,'2021-09-28 11:12:56.928409','3','DBA',2,'[]',3,1),(54,'2021-09-28 11:13:13.801210','8','develop',2,'[]',3,1),(55,'2021-09-28 11:13:21.513808','5','QA',2,'[]',3,1),(56,'2021-09-28 11:13:32.704796','9','testing',2,'[]',3,1),(57,'2021-09-28 11:19:39.341489','2','MySQL腾讯测试',2,'[{\"changed\": {\"fields\": [\"\\u7528\\u6237\\u540d\", \"\\u5bc6\\u7801\"]}}]',17,1),(58,'2021-10-20 14:59:02.341841','14','test123456',1,'[{\"added\": {}}]',35,1),(59,'2021-10-21 10:24:58.449553','14','test123456中文名',2,'[{\"changed\": {\"fields\": [\"\\u663e\\u793a\\u7684\\u4e2d\\u6587\\u540d\", \"\\u9489\\u9489UserID\"]}}]',35,1),(60,'2021-10-21 11:37:36.187945','15','吴保东',2,'[{\"changed\": {\"fields\": [\"Groups\", \"\\u8d44\\u6e90\\u7ec4\"]}}]',35,1),(61,'2021-10-21 11:37:50.965686','16','杨晨柱',2,'[{\"changed\": {\"fields\": [\"Groups\", \"\\u8d44\\u6e90\\u7ec4\"]}}]',35,1),(62,'2021-10-21 11:38:14.964446','17','王刚',2,'[{\"changed\": {\"fields\": [\"Groups\", \"\\u8d44\\u6e90\\u7ec4\"]}}]',35,1),(63,'2021-10-21 11:38:25.296842','17','王刚',2,'[]',35,1),(64,'2021-10-21 11:38:59.125906','14','test123456中文名',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"\\u8d44\\u6e90\\u7ec4\"]}}]',35,1),(65,'2021-10-27 09:48:52.903148','67','史明月',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',35,1),(66,'2021-10-27 09:49:08.262359','101','冯磊',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',35,1),(67,'2021-10-27 09:49:19.320996','1','cehsi',2,'[{\"changed\": {\"fields\": [\"Groups\", \"User permissions\"]}}]',35,1),(68,'2021-10-27 09:49:31.432194','103','公共审核账号',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',35,1),(69,'2021-10-27 09:50:00.541162','1','cehsi',2,'[{\"changed\": {\"fields\": [\"Superuser status\", \"Active\", \"Staff status\"]}}]',35,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(8,'django_q','failure'),(10,'django_q','ormq'),(6,'django_q','schedule'),(9,'django_q','success'),(7,'django_q','task'),(5,'sessions','session'),(34,'sql','aliyunrdsconfig'),(13,'sql','archiveconfig'),(33,'sql','archivelog'),(14,'sql','cloudaccesskey'),(15,'sql','config'),(32,'sql','datamaskingcolumns'),(16,'sql','datamaskingrules'),(17,'sql','instance'),(38,'sql','instanceaccount'),(37,'sql','instancedatabase'),(18,'sql','instancetag'),(31,'sql','paramhistory'),(30,'sql','paramtemplate'),(19,'sql','permission'),(20,'sql','querylog'),(36,'sql','queryprivileges'),(29,'sql','queryprivilegesapply'),(21,'sql','resourcegroup'),(11,'sql','slowquery'),(12,'sql','slowqueryhistory'),(22,'sql','sqlworkflow'),(28,'sql','sqlworkflowcontent'),(23,'sql','tunnel'),(35,'sql','users'),(27,'sql','workflowaudit'),(24,'sql','workflowauditdetail'),(26,'sql','workflowauditsetting'),(25,'sql','workflowlog');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-05-07 19:50:44.964324'),(2,'contenttypes','0002_remove_content_type_name','2021-05-07 19:50:45.065765'),(3,'auth','0001_initial','2021-05-07 19:50:45.160550'),(4,'auth','0002_alter_permission_name_max_length','2021-05-07 19:50:45.413066'),(5,'auth','0003_alter_user_email_max_length','2021-05-07 19:50:45.423955'),(6,'auth','0004_alter_user_username_opts','2021-05-07 19:50:45.434450'),(7,'auth','0005_alter_user_last_login_null','2021-05-07 19:50:45.444857'),(8,'auth','0006_require_contenttypes_0002','2021-05-07 19:50:45.450896'),(9,'auth','0007_alter_validators_add_error_messages','2021-05-07 19:50:45.461125'),(10,'auth','0008_alter_user_username_max_length','2021-05-07 19:50:45.471375'),(11,'auth','0009_alter_user_last_name_max_length','2021-05-07 19:50:45.481289'),(12,'auth','0010_alter_group_name_max_length','2021-05-07 19:50:45.540969'),(13,'auth','0011_update_proxy_permissions','2021-05-07 19:50:45.552582'),(14,'auth','0012_alter_user_first_name_max_length','2021-05-07 19:50:45.562434'),(15,'sql','0001_initial','2021-05-07 19:50:47.439109'),(16,'admin','0001_initial','2021-05-07 19:50:49.005995'),(17,'admin','0002_logentry_remove_auto_add','2021-05-07 19:50:49.141954'),(18,'admin','0003_logentry_add_action_flag_choices','2021-05-07 19:50:49.158921'),(19,'django_q','0001_initial','2021-05-07 19:50:49.231368'),(20,'django_q','0002_auto_20150630_1624','2021-05-07 19:50:49.344675'),(21,'django_q','0003_auto_20150708_1326','2021-05-07 19:50:49.455381'),(22,'django_q','0004_auto_20150710_1043','2021-05-07 19:50:49.470326'),(23,'django_q','0005_auto_20150718_1506','2021-05-07 19:50:49.564518'),(24,'django_q','0006_auto_20150805_1817','2021-05-07 19:50:49.616178'),(25,'django_q','0007_ormq','2021-05-07 19:50:49.649340'),(26,'django_q','0008_auto_20160224_1026','2021-05-07 19:50:49.658970'),(27,'django_q','0009_auto_20171009_0915','2021-05-07 19:50:49.720981'),(28,'django_q','0010_auto_20200610_0856','2021-05-07 19:50:49.739814'),(29,'django_q','0011_auto_20200628_1055','2021-05-07 19:50:49.839719'),(30,'django_q','0012_auto_20200702_1608','2021-05-07 19:50:49.849624'),(31,'django_q','0013_task_attempt_count','2021-05-07 19:50:49.901225'),(32,'sessions','0001_initial','2021-05-07 19:50:49.933427');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_q_ormq`
--

DROP TABLE IF EXISTS `django_q_ormq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_q_ormq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(100) NOT NULL,
  `payload` longtext NOT NULL,
  `lock` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_q_ormq`
--

LOCK TABLES `django_q_ormq` WRITE;
/*!40000 ALTER TABLE `django_q_ormq` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_q_ormq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_q_schedule`
--

DROP TABLE IF EXISTS `django_q_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_q_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `func` varchar(256) NOT NULL,
  `hook` varchar(256) DEFAULT NULL,
  `args` longtext,
  `kwargs` longtext,
  `schedule_type` varchar(1) NOT NULL,
  `repeats` int(11) NOT NULL,
  `next_run` datetime(6) DEFAULT NULL,
  `task` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `minutes` smallint(5) unsigned DEFAULT NULL,
  `cron` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_q_schedule`
--

LOCK TABLES `django_q_schedule` WRITE;
/*!40000 ALTER TABLE `django_q_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_q_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_q_task`
--

DROP TABLE IF EXISTS `django_q_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_q_task` (
  `name` varchar(100) NOT NULL,
  `func` varchar(256) NOT NULL,
  `hook` varchar(256) DEFAULT NULL,
  `args` longtext,
  `kwargs` longtext,
  `result` longtext,
  `started` datetime(6) NOT NULL,
  `stopped` datetime(6) NOT NULL,
  `success` tinyint(1) NOT NULL,
  `id` varchar(32) NOT NULL,
  `group` varchar(100) DEFAULT NULL,
  `attempt_count` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_q_task`
--

LOCK TABLES `django_q_task` WRITE;
/*!40000 ALTER TABLE `django_q_task` DISABLE KEYS */;
INSERT INTO `django_q_task` VALUES ('sqlreview-submit-16','<function notify_for_audit at 0x7f0f9e8d7c10>',NULL,'gAUpLg==','gAWVHwAAAAAAAAB9lCiMCGF1ZGl0X2lklEsKjAhjY191c2Vyc5RdlHUu',NULL,'2021-09-28 10:39:01.650369','2021-09-28 10:39:01.932779',1,'0456d7451fd54e49af4e01a8f2d91d87',NULL,1),('sqlreview-pass-4','<function notify_for_audit at 0x7fdbe0934950>',NULL,'gASVAgAAAAAAAAApLg==','gASVJAAAAAAAAAB9lCiMCGF1ZGl0X2lklEsCjAxhdWRpdF9yZW1hcmuUjACUdS4=',NULL,'2021-05-11 11:14:03.569442','2021-05-12 15:29:06.750903',1,'091d9f0b0e3f4319a23ec44e27d095c6',NULL,1),('sqlreview-pass-3','<function notify_for_audit at 0x7fdbe0934950>',NULL,'gASVAgAAAAAAAAApLg==','gASVJAAAAAAAAAB9lCiMCGF1ZGl0X2lklEsBjAxhdWRpdF9yZW1hcmuUjACUdS4=',NULL,'2021-05-11 11:07:21.762273','2021-05-12 15:29:06.730756',1,'11258c225b5f48b3b72be96dde0c224a',NULL,1),('sqlreview-submit-12','<function notify_for_audit at 0x7fb91554ca60>',NULL,'gAUpLg==','gAWVHwAAAAAAAAB9lCiMCGF1ZGl0X2lklEsIjAhjY191c2Vyc5RdlHUu',NULL,'2021-05-13 18:14:46.599156','2021-05-13 18:14:46.608155',1,'14aa17e164c544e5829cdec70c94b145',NULL,1),('sqlreview-pass-8','<function notify_for_audit at 0x7fdbe0934950>',NULL,'gASVAgAAAAAAAAApLg==','gASVJAAAAAAAAAB9lCiMCGF1ZGl0X2lklEsEjAxhdWRpdF9yZW1hcmuUjACUdS4=',NULL,'2021-05-12 17:40:23.885996','2021-05-12 17:40:23.893678',1,'18999b5725734499af7d614de2381822',NULL,1),('sqlreview-execute-3','sql.utils.execute_sql.execute','sql.utils.execute_sql.execute_callback','gASVRgIAAAAAAABLA4wVZGphbmdvLmRiLm1vZGVscy5iYXNllIwObW9kZWxfdW5waWNrbGWUk5SMA3NxbJSMBVVzZXJzlIaUhZRSlH2UKIwGX3N0YXRllGgAjApNb2RlbFN0YXRllJOUKYGUfZQojAZhZGRpbmeUiYwCZGKUjAdkZWZhdWx0lIwMZmllbGRzX2NhY2hllH2UdWKMAmlklEsBjAhwYXNzd29yZJSMTnBia2RmMl9zaGEyNTYkMjE2MDAwJDBYNWRTZjQwejdzRiR5YlFlN3MwdHhXanA4aUhmbjUwVWVhMG1qbnlsOVpKbWpIRTRpeldqZVNZPZSMCmxhc3RfbG9naW6UjAhkYXRldGltZZSMCGRhdGV0aW1llJOUQwoH5QULCiUABPPtlIWUUpSMDGlzX3N1cGVydXNlcpSIjAh1c2VybmFtZZSMBWFkbWlulIwKZmlyc3RfbmFtZZSMAJSMCWxhc3RfbmFtZZRoIYwFZW1haWyUjApoaEAxNjMuY29tlIwIaXNfc3RhZmaUiIwJaXNfYWN0aXZllIiMC2RhdGVfam9pbmVklGgZQwoH5QUHEzQxCsQPlIWUUpSMB2Rpc3BsYXmUaCGMDGRpbmdfdXNlcl9pZJRoIYwKd3hfdXNlcl9pZJRoIYwOZmVpc2h1X29wZW5faWSUaCGMEmZhaWxlZF9sb2dpbl9jb3VudJRLAIwUbGFzdF9sb2dpbl9mYWlsZWRfYXSUTowPX2RqYW5nb192ZXJzaW9ulIwFMy4xLjKUdWKGlC4=','gASVAwAAAAAAAAB9lC4=','gASVRgIAAAAAAABYPwIAAFNxbFdvcmtmbG93IG1hdGNoaW5nIHF1ZXJ5IGRvZXMgbm90IGV4aXN0LiA6IFRyYWNlYmFjayAobW9zdCByZWNlbnQgY2FsbCBsYXN0KToKICBGaWxlICIvdXNyL2xvY2FsL2xpYi9weXRob24zLjYvc2l0ZS1wYWNrYWdlcy9kamFuZ29fcS9jbHVzdGVyLnB5IiwgbGluZSA0MzYsIGluIHdvcmtlcgogICAgcmVzID0gZigqdGFza1siYXJncyJdLCAqKnRhc2tbImt3YXJncyJdKQogIEZpbGUgIi9vcHQvYXJjaGVyeS0xLjguMC9zcWwvdXRpbHMvZXhlY3V0ZV9zcWwucHkiLCBsaW5lIDE3LCBpbiBleGVjdXRlCiAgICB3b3JrZmxvd19kZXRhaWwgPSBTcWxXb3JrZmxvdy5vYmplY3RzLnNlbGVjdF9mb3JfdXBkYXRlKCkuZ2V0KGlkPXdvcmtmbG93X2lkKQogIEZpbGUgIi91c3IvbG9jYWwvbGliL3B5dGhvbjMuNi9zaXRlLXBhY2thZ2VzL2RqYW5nby9kYi9tb2RlbHMvcXVlcnkucHkiLCBsaW5lIDQzMSwgaW4gZ2V0CiAgICBzZWxmLm1vZGVsLl9tZXRhLm9iamVjdF9uYW1lCnNxbC5tb2RlbHMuU3FsV29ya2Zsb3cuRG9lc05vdEV4aXN0OiBTcWxXb3JrZmxvdyBtYXRjaGluZyBxdWVyeSBkb2VzIG5vdCBleGlzdC4KlC4=','2021-05-11 11:07:31.268709','2021-05-12 15:29:06.755037',0,'2627b229c8214023a7b4d67e23505537',NULL,1),('sqlreview-execute-9','sql.utils.execute_sql.execute','sql.utils.execute_sql.execute_callback','gASVWAIAAAAAAABLCYwVZGphbmdvLmRiLm1vZGVscy5iYXNllIwObW9kZWxfdW5waWNrbGWUk5SMA3NxbJSMBVVzZXJzlIaUhZRSlH2UKIwGX3N0YXRllGgAjApNb2RlbFN0YXRllJOUKYGUfZQojAZhZGRpbmeUiYwCZGKUjAdkZWZhdWx0lIwMZmllbGRzX2NhY2hllH2UdWKMAmlklEsBjAhwYXNzd29yZJSMTnBia2RmMl9zaGEyNTYkMjE2MDAwJDlZV1Bpb0NYbVpqMSRUVzZMT2wvbEl5VXRmSkwzWVE2RWxMUjdTZHdOUmtacXpFbU9ya1JhM2xrPZSMCmxhc3RfbG9naW6UjAhkYXRldGltZZSMCGRhdGV0aW1llJOUQwoH5QUNCxEIBLwLlIWUUpSMDGlzX3N1cGVydXNlcpSIjAh1c2VybmFtZZSMBWFkbWlulIwKZmlyc3RfbmFtZZSMAJSMCWxhc3RfbmFtZZRoIYwFZW1haWyUjApoaEAxNjMuY29tlIwIaXNfc3RhZmaUiIwJaXNfYWN0aXZllIiMC2RhdGVfam9pbmVklGgZQwoH5QUHEzQxCsQPlIWUUpSMB2Rpc3BsYXmUaCGMDGRpbmdfdXNlcl9pZJRoIYwKd3hfdXNlcl9pZJRoIYwOZmVpc2h1X29wZW5faWSUaCGMEmZhaWxlZF9sb2dpbl9jb3VudJRLAIwUbGFzdF9sb2dpbl9mYWlsZWRfYXSUaBlDCgflBQwRMwoM3QmUhZRSlIwPX2RqYW5nb192ZXJzaW9ulIwFMy4xLjKUdWKGlC4=','gASVAwAAAAAAAAB9lC4=','gASVDQgAAAAAAACMEnNxbC5lbmdpbmVzLm1vZGVsc5SMCVJldmlld1NldJSTlCmBlH2UKIwIZnVsbF9zcWyUWMQCAABDUkVBVEUgVEFCTEUgYGFjaGVyeXRlc3RgICgNCmBpZGAgaW50KDEwKSBOT1QgTlVMTCwNCmBjYXRlZ29yeV9uYW1lYCB2YXJjaGFyKDUwMCkgREVGQVVMVCBOVUxMIENPTU1FTlQgJ+exu+ebruWQjScsDQpgY2F0ZWdvcnlfdmFsdWVgIHZhcmNoYXIoNTAwKSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn57G755uu5YC8JywNCmByZW1hcmtgIHZhcmNoYXIoNTAwKSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn5aSH5rOoJywNCmBjcmVhdGVkX2F0YCBkYXRldGltZSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn5Yib5bu65pe26Ze0JywNCmBjcmVhdGVkX2J5YCB2YXJjaGFyKDQ1KSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn5Yib5bu65Lq6JywNCmBtb2RpZmllZF9hdGAgZGF0ZXRpbWUgREVGQVVMVCBOVUxMIENPTU1FTlQgJ+abtOaWsOaXtumXtCcsDQpgbW9kaWZpZWRfYnlgIHZhcmNoYXIoNDUpIERFRkFVTFQgTlVMTCBDT01NRU5UICfmm7TmlrDkuronLA0KYGlzX2RlbGV0ZWRgIHRpbnlpbnQoMSkgREVGQVVMVCAnMCcgQ09NTUVOVCAn5piv5ZCm5Yig6ZmkJywNCmBkZWxldGVkX2F0YCBkYXRldGltZSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn5Yig6Zmk5pe26Ze0JywNCmBkZWxldGVkX2J5YCB2YXJjaGFyKDQ1KSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn5Yig6Zmk5Lq6JywNClBSSU1BUlkgS0VZIChgaWRgKSBVU0lORyBCVFJFRQ0KKSBFTkdJTkUgPSBJbm5vREKUjAppc19leGVjdXRllImMB2NoZWNrZWSUTowHd2FybmluZ5ROjAVlcnJvcpROjA13YXJuaW5nX2NvdW50lEsAjAtlcnJvcl9jb3VudJRLAIwLaXNfY3JpdGljYWyUiYwLc3ludGF4X3R5cGWUSwCMBHJvd3OUXZQoaACMDFJldmlld1Jlc3VsdJSTlCmBlH2UKIwCaWSUSwGMBXN0YWdllIwIRVhFQ1VURUSUjAhlcnJsZXZlbJRLAIwLc3RhZ2VzdGF0dXOUjBRFeGVjdXRlIFN1Y2Nlc3NmdWxseZSMDGVycm9ybWVzc2FnZZSMAJSMA3NxbJSMEXVzZSBgYXBwX2FwaV9iYWtglIwNYWZmZWN0ZWRfcm93c5RLAIwIc2VxdWVuY2WUjBwxNjIwODc1OTczXzE2NzkzODgxXzAwMDAwMDAwlIwNYmFja3VwX2RibmFtZZRoHIwMZXhlY3V0ZV90aW1llIwFMC4wMDCUjAdzcWxzaGExlGgcjAtiYWNrdXBfdGltZZSMATCUjBRhY3R1YWxfYWZmZWN0ZWRfcm93c5RoHHViaBIpgZR9lChoFUsCaBaMCEVYRUNVVEVElGgYSwBoGYwURXhlY3V0ZSBTdWNjZXNzZnVsbHmUaBtoHGgdWMQCAABDUkVBVEUgVEFCTEUgYGFjaGVyeXRlc3RgICgNCmBpZGAgaW50KDEwKSBOT1QgTlVMTCwNCmBjYXRlZ29yeV9uYW1lYCB2YXJjaGFyKDUwMCkgREVGQVVMVCBOVUxMIENPTU1FTlQgJ+exu+ebruWQjScsDQpgY2F0ZWdvcnlfdmFsdWVgIHZhcmNoYXIoNTAwKSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn57G755uu5YC8JywNCmByZW1hcmtgIHZhcmNoYXIoNTAwKSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn5aSH5rOoJywNCmBjcmVhdGVkX2F0YCBkYXRldGltZSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn5Yib5bu65pe26Ze0JywNCmBjcmVhdGVkX2J5YCB2YXJjaGFyKDQ1KSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn5Yib5bu65Lq6JywNCmBtb2RpZmllZF9hdGAgZGF0ZXRpbWUgREVGQVVMVCBOVUxMIENPTU1FTlQgJ+abtOaWsOaXtumXtCcsDQpgbW9kaWZpZWRfYnlgIHZhcmNoYXIoNDUpIERFRkFVTFQgTlVMTCBDT01NRU5UICfmm7TmlrDkuronLA0KYGlzX2RlbGV0ZWRgIHRpbnlpbnQoMSkgREVGQVVMVCAnMCcgQ09NTUVOVCAn5piv5ZCm5Yig6ZmkJywNCmBkZWxldGVkX2F0YCBkYXRldGltZSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn5Yig6Zmk5pe26Ze0JywNCmBkZWxldGVkX2J5YCB2YXJjaGFyKDQ1KSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn5Yig6Zmk5Lq6JywNClBSSU1BUlkgS0VZIChgaWRgKSBVU0lORyBCVFJFRQ0KKSBFTkdJTkUgPSBJbm5vREKUaB9LAGggjBwxNjIwODc1OTczXzE2NzkzODgxXzAwMDAwMDAxlGgiaBxoI4wFMC4wMTGUaCVoHGgmaCdoKGgcdWJljAtjb2x1bW5fbGlzdJROjAZzdGF0dXOUTmgfSwB1Yi4=','2021-05-13 11:19:33.213666','2021-05-13 11:19:33.497265',1,'3bb97ebea3364908939117ba8db462a6',NULL,1),('sqlreview-execute-4','sql.utils.execute_sql.execute','sql.utils.execute_sql.execute_callback','gASVRgIAAAAAAABLBIwVZGphbmdvLmRiLm1vZGVscy5iYXNllIwObW9kZWxfdW5waWNrbGWUk5SMA3NxbJSMBVVzZXJzlIaUhZRSlH2UKIwGX3N0YXRllGgAjApNb2RlbFN0YXRllJOUKYGUfZQojAZhZGRpbmeUiYwCZGKUjAdkZWZhdWx0lIwMZmllbGRzX2NhY2hllH2UdWKMAmlklEsBjAhwYXNzd29yZJSMTnBia2RmMl9zaGEyNTYkMjE2MDAwJDBYNWRTZjQwejdzRiR5YlFlN3MwdHhXanA4aUhmbjUwVWVhMG1qbnlsOVpKbWpIRTRpeldqZVNZPZSMCmxhc3RfbG9naW6UjAhkYXRldGltZZSMCGRhdGV0aW1llJOUQwoH5QULCiUABPPtlIWUUpSMDGlzX3N1cGVydXNlcpSIjAh1c2VybmFtZZSMBWFkbWlulIwKZmlyc3RfbmFtZZSMAJSMCWxhc3RfbmFtZZRoIYwFZW1haWyUjApoaEAxNjMuY29tlIwIaXNfc3RhZmaUiIwJaXNfYWN0aXZllIiMC2RhdGVfam9pbmVklGgZQwoH5QUHEzQxCsQPlIWUUpSMB2Rpc3BsYXmUaCGMDGRpbmdfdXNlcl9pZJRoIYwKd3hfdXNlcl9pZJRoIYwOZmVpc2h1X29wZW5faWSUaCGMEmZhaWxlZF9sb2dpbl9jb3VudJRLAIwUbGFzdF9sb2dpbl9mYWlsZWRfYXSUTowPX2RqYW5nb192ZXJzaW9ulIwFMy4xLjKUdWKGlC4=','gASVAwAAAAAAAAB9lC4=','gASVRgIAAAAAAABYPwIAAFNxbFdvcmtmbG93IG1hdGNoaW5nIHF1ZXJ5IGRvZXMgbm90IGV4aXN0LiA6IFRyYWNlYmFjayAobW9zdCByZWNlbnQgY2FsbCBsYXN0KToKICBGaWxlICIvdXNyL2xvY2FsL2xpYi9weXRob24zLjYvc2l0ZS1wYWNrYWdlcy9kamFuZ29fcS9jbHVzdGVyLnB5IiwgbGluZSA0MzYsIGluIHdvcmtlcgogICAgcmVzID0gZigqdGFza1siYXJncyJdLCAqKnRhc2tbImt3YXJncyJdKQogIEZpbGUgIi9vcHQvYXJjaGVyeS0xLjguMC9zcWwvdXRpbHMvZXhlY3V0ZV9zcWwucHkiLCBsaW5lIDE3LCBpbiBleGVjdXRlCiAgICB3b3JrZmxvd19kZXRhaWwgPSBTcWxXb3JrZmxvdy5vYmplY3RzLnNlbGVjdF9mb3JfdXBkYXRlKCkuZ2V0KGlkPXdvcmtmbG93X2lkKQogIEZpbGUgIi91c3IvbG9jYWwvbGliL3B5dGhvbjMuNi9zaXRlLXBhY2thZ2VzL2RqYW5nby9kYi9tb2RlbHMvcXVlcnkucHkiLCBsaW5lIDQzMSwgaW4gZ2V0CiAgICBzZWxmLm1vZGVsLl9tZXRhLm9iamVjdF9uYW1lCnNxbC5tb2RlbHMuU3FsV29ya2Zsb3cuRG9lc05vdEV4aXN0OiBTcWxXb3JrZmxvdyBtYXRjaGluZyBxdWVyeSBkb2VzIG5vdCBleGlzdC4KlC4=','2021-05-11 11:14:17.335015','2021-05-12 15:29:06.769069',0,'3c7e997e191b44c38252004bfe090c7a',NULL,1),('sqlreview-submit-4','<function notify_for_audit at 0x7fdbe0934950>',NULL,'gASVAgAAAAAAAAApLg==','gASVHwAAAAAAAAB9lCiMCGF1ZGl0X2lklEsCjAhjY191c2Vyc5RdlHUu',NULL,'2021-05-11 11:13:55.543362','2021-05-12 15:29:06.757554',1,'4482d747449d446f9b44e0fcb40a7f8f',NULL,1),('sqlreview-submit-19','<function notify_for_audit at 0x7f0f9e8d7c10>',NULL,'gAUpLg==','gAWVHwAAAAAAAAB9lCiMCGF1ZGl0X2lklEsNjAhjY191c2Vyc5RdlHUu',NULL,'2021-09-28 11:50:35.889681','2021-09-28 11:50:35.907660',1,'44abafc73c164073af62c93d446bcf95',NULL,1),('sqlreview-submit-17','<function notify_for_audit at 0x7f0f9e8d7c10>',NULL,'gAUpLg==','gAWVHwAAAAAAAAB9lCiMCGF1ZGl0X2lklEsLjAhjY191c2Vyc5RdlHUu',NULL,'2021-09-28 11:49:01.472537','2021-09-28 11:49:01.491335',1,'47cf930802c04cb09388ed5e9a173474',NULL,1),('sqlreview-submit-14','<function notify_for_audit at 0x7fecbfdf4a60>',NULL,'gAUpLg==','gAWVHwAAAAAAAAB9lCiMCGF1ZGl0X2lklEsJjAhjY191c2Vyc5RdlHUu',NULL,'2021-05-18 11:37:02.690167','2021-05-18 11:37:02.709006',1,'519cca06f826465ab2ed64ff18d05fb8',NULL,1),('sqlreview-pass-6','<function notify_for_audit at 0x7fdbe0934950>',NULL,'gASVAgAAAAAAAAApLg==','gASVJAAAAAAAAAB9lCiMCGF1ZGl0X2lklEsDjAxhdWRpdF9yZW1hcmuUjACUdS4=',NULL,'2021-05-12 15:48:19.987447','2021-05-12 15:48:19.994451',1,'5864547752d74b52a6bb9d9bc2500674',NULL,1),('sqlreview-pass-4','<function notify_for_audit at 0x7fdbe0934950>',NULL,'gASVAgAAAAAAAAApLg==','gASVJAAAAAAAAAB9lCiMCGF1ZGl0X2lklEsCjAxhdWRpdF9yZW1hcmuUjACUdS4=',NULL,'2021-05-11 11:14:11.678754','2021-05-12 15:29:06.762804',1,'58781349d11d4b9d99de65be639bf89a',NULL,1),('sqlreview-submit-9','<function notify_for_audit at 0x7fdbe0934950>',NULL,'gASVAgAAAAAAAAApLg==','gASVHwAAAAAAAAB9lCiMCGF1ZGl0X2lklEsFjAhjY191c2Vyc5RdlHUu',NULL,'2021-05-13 11:14:02.060327','2021-05-13 11:14:02.067825',1,'6681335ebe30481bb81b71ed6e27e7ad',NULL,1),('sqlreview-submit-11','<function notify_for_audit at 0x7fb91554ca60>',NULL,'gAUpLg==','gAWVHwAAAAAAAAB9lCiMCGF1ZGl0X2lklEsHjAhjY191c2Vyc5RdlHUu',NULL,'2021-05-13 18:06:37.100654','2021-05-13 18:06:37.119194',1,'70c47c0943ef4258b369b4fbd9011287',NULL,1),('sqlreview-execute-10','sql.utils.execute_sql.execute','sql.utils.execute_sql.execute_callback','gAWVWAIAAAAAAABLCowVZGphbmdvLmRiLm1vZGVscy5iYXNllIwObW9kZWxfdW5waWNrbGWUk5SMA3NxbJSMBVVzZXJzlIaUhZRSlH2UKIwGX3N0YXRllGgAjApNb2RlbFN0YXRllJOUKYGUfZQojAZhZGRpbmeUiYwCZGKUjAdkZWZhdWx0lIwMZmllbGRzX2NhY2hllH2UdWKMAmlklEsBjAhwYXNzd29yZJSMTnBia2RmMl9zaGEyNTYkMjE2MDAwJDlZV1Bpb0NYbVpqMSRUVzZMT2wvbEl5VXRmSkwzWVE2RWxMUjdTZHdOUmtacXpFbU9ya1JhM2xrPZSMCmxhc3RfbG9naW6UjAhkYXRldGltZZSMCGRhdGV0aW1llJOUQwoH5QUNEQIyC2rvlIWUUpSMDGlzX3N1cGVydXNlcpSIjAh1c2VybmFtZZSMBWFkbWlulIwKZmlyc3RfbmFtZZSMAJSMCWxhc3RfbmFtZZRoIYwFZW1haWyUjApoaEAxNjMuY29tlIwIaXNfc3RhZmaUiIwJaXNfYWN0aXZllIiMC2RhdGVfam9pbmVklGgZQwoH5QUHEzQxCsQPlIWUUpSMB2Rpc3BsYXmUaCGMDGRpbmdfdXNlcl9pZJRoIYwKd3hfdXNlcl9pZJRoIYwOZmVpc2h1X29wZW5faWSUaCGMEmZhaWxlZF9sb2dpbl9jb3VudJRLAIwUbGFzdF9sb2dpbl9mYWlsZWRfYXSUaBlDCgflBQwRMwoM3QmUhZRSlIwPX2RqYW5nb192ZXJzaW9ulIwFMy4xLjaUdWKGlC4=','gAV9lC4=','gAWVDQgAAAAAAACMEnNxbC5lbmdpbmVzLm1vZGVsc5SMCVJldmlld1NldJSTlCmBlH2UKIwIZnVsbF9zcWyUWMQCAABDUkVBVEUgVEFCTEUgYGFjaGVyeTExMTFgICgNCmBpZGAgaW50KDEwKSBOT1QgTlVMTCwNCmBjYXRlZ29yeV9uYW1lYCB2YXJjaGFyKDUwMCkgREVGQVVMVCBOVUxMIENPTU1FTlQgJ+exu+ebruWQjScsDQpgY2F0ZWdvcnlfdmFsdWVgIHZhcmNoYXIoNTAwKSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn57G755uu5YC8JywNCmByZW1hcmtgIHZhcmNoYXIoNTAwKSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn5aSH5rOoJywNCmBjcmVhdGVkX2F0YCBkYXRldGltZSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn5Yib5bu65pe26Ze0JywNCmBjcmVhdGVkX2J5YCB2YXJjaGFyKDQ1KSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn5Yib5bu65Lq6JywNCmBtb2RpZmllZF9hdGAgZGF0ZXRpbWUgREVGQVVMVCBOVUxMIENPTU1FTlQgJ+abtOaWsOaXtumXtCcsDQpgbW9kaWZpZWRfYnlgIHZhcmNoYXIoNDUpIERFRkFVTFQgTlVMTCBDT01NRU5UICfmm7TmlrDkuronLA0KYGlzX2RlbGV0ZWRgIHRpbnlpbnQoMSkgREVGQVVMVCAnMCcgQ09NTUVOVCAn5piv5ZCm5Yig6ZmkJywNCmBkZWxldGVkX2F0YCBkYXRldGltZSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn5Yig6Zmk5pe26Ze0JywNCmBkZWxldGVkX2J5YCB2YXJjaGFyKDQ1KSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn5Yig6Zmk5Lq6JywNClBSSU1BUlkgS0VZIChgaWRgKSBVU0lORyBCVFJFRQ0KKSBFTkdJTkUgPSBJbm5vREKUjAppc19leGVjdXRllImMB2NoZWNrZWSUTowHd2FybmluZ5ROjAVlcnJvcpROjA13YXJuaW5nX2NvdW50lEsAjAtlcnJvcl9jb3VudJRLAIwLaXNfY3JpdGljYWyUiYwLc3ludGF4X3R5cGWUSwCMBHJvd3OUXZQoaACMDFJldmlld1Jlc3VsdJSTlCmBlH2UKIwCaWSUSwGMBXN0YWdllIwIRVhFQ1VURUSUjAhlcnJsZXZlbJRLAIwLc3RhZ2VzdGF0dXOUjBRFeGVjdXRlIFN1Y2Nlc3NmdWxseZSMDGVycm9ybWVzc2FnZZSMAJSMA3NxbJSMEXVzZSBgYXBwX2FwaV9iYWtglIwNYWZmZWN0ZWRfcm93c5RLAIwIc2VxdWVuY2WUjBwxNjIwOTAwMDg0XzE2ODI0MTQ5XzAwMDAwMDAwlIwNYmFja3VwX2RibmFtZZRoHIwMZXhlY3V0ZV90aW1llIwFMC4wMDCUjAdzcWxzaGExlGgcjAtiYWNrdXBfdGltZZSMATCUjBRhY3R1YWxfYWZmZWN0ZWRfcm93c5RoHHViaBIpgZR9lChoFUsCaBaMCEVYRUNVVEVElGgYSwBoGYwURXhlY3V0ZSBTdWNjZXNzZnVsbHmUaBtoHGgdWMQCAABDUkVBVEUgVEFCTEUgYGFjaGVyeTExMTFgICgNCmBpZGAgaW50KDEwKSBOT1QgTlVMTCwNCmBjYXRlZ29yeV9uYW1lYCB2YXJjaGFyKDUwMCkgREVGQVVMVCBOVUxMIENPTU1FTlQgJ+exu+ebruWQjScsDQpgY2F0ZWdvcnlfdmFsdWVgIHZhcmNoYXIoNTAwKSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn57G755uu5YC8JywNCmByZW1hcmtgIHZhcmNoYXIoNTAwKSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn5aSH5rOoJywNCmBjcmVhdGVkX2F0YCBkYXRldGltZSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn5Yib5bu65pe26Ze0JywNCmBjcmVhdGVkX2J5YCB2YXJjaGFyKDQ1KSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn5Yib5bu65Lq6JywNCmBtb2RpZmllZF9hdGAgZGF0ZXRpbWUgREVGQVVMVCBOVUxMIENPTU1FTlQgJ+abtOaWsOaXtumXtCcsDQpgbW9kaWZpZWRfYnlgIHZhcmNoYXIoNDUpIERFRkFVTFQgTlVMTCBDT01NRU5UICfmm7TmlrDkuronLA0KYGlzX2RlbGV0ZWRgIHRpbnlpbnQoMSkgREVGQVVMVCAnMCcgQ09NTUVOVCAn5piv5ZCm5Yig6ZmkJywNCmBkZWxldGVkX2F0YCBkYXRldGltZSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn5Yig6Zmk5pe26Ze0JywNCmBkZWxldGVkX2J5YCB2YXJjaGFyKDQ1KSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn5Yig6Zmk5Lq6JywNClBSSU1BUlkgS0VZIChgaWRgKSBVU0lORyBCVFJFRQ0KKSBFTkdJTkUgPSBJbm5vREKUaB9LAGggjBwxNjIwOTAwMDg0XzE2ODI0MTQ5XzAwMDAwMDAxlGgiaBxoI4wFMC4wMDmUaCVoHGgmaCdoKGgcdWJljAtjb2x1bW5fbGlzdJROjAZzdGF0dXOUTmgfSwB1Yi4=','2021-05-13 18:01:24.571117','2021-05-13 18:01:24.858259',1,'751000cb6b7042bc9fd618f4115304e7',NULL,1),('sqlreview-pass-9','<function notify_for_audit at 0x7fdbe0934950>',NULL,'gASVAgAAAAAAAAApLg==','gASVJAAAAAAAAAB9lCiMCGF1ZGl0X2lklEsFjAxhdWRpdF9yZW1hcmuUjACUdS4=',NULL,'2021-05-13 11:19:24.305159','2021-05-13 11:19:24.312441',1,'7639d87ddfb340e39f809ef9f4d77f90',NULL,1),('sqlreview-execute-12','sql.utils.execute_sql.execute','sql.utils.execute_sql.execute_callback','gAWVmwYAAAAAAABLDIwVZGphbmdvLmRiLm1vZGVscy5iYXNllIwObW9kZWxfdW5waWNrbGWUk5SMA3NxbJSMBVVzZXJzlIaUhZRSlH2UKIwGX3N0YXRllGgAjApNb2RlbFN0YXRllJOUKYGUfZQojAZhZGRpbmeUiYwCZGKUjAdkZWZhdWx0lIwMZmllbGRzX2NhY2hllH2UdWKMAmlklEsJjAhwYXNzd29yZJSMTnBia2RmMl9zaGEyNTYkMjE2MDAwJElzVzdDU1dVSENiaCRXY3FCKzd1ZHJid2F6V1NJTEtBUjVGamFKUGlIekJHd2pkcnZYUW81K1g4PZSMCmxhc3RfbG9naW6UjAhkYXRldGltZZSMCGRhdGV0aW1llJOUQwoH5QUNEgw2A48XlIWUUpSMDGlzX3N1cGVydXNlcpSJjAh1c2VybmFtZZSMCWdobDkwMDIyNpSMCmZpcnN0X25hbWWUjACUjAlsYXN0X25hbWWUaCGMBWVtYWlslIwRZ2hsOTAwMjI2QDE2My5jb22UjAhpc19zdGFmZpSIjAlpc19hY3RpdmWUiIwLZGF0ZV9qb2luZWSUaBlDCgflBQ0SDB4NusGUhZRSlIwHZGlzcGxheZSMA2dobJSMDGRpbmdfdXNlcl9pZJRoIYwKd3hfdXNlcl9pZJRoIYwOZmVpc2h1X29wZW5faWSUaCGMEmZhaWxlZF9sb2dpbl9jb3VudJRLAIwUbGFzdF9sb2dpbl9mYWlsZWRfYXSUTowQX3VzZXJfcGVybV9jYWNoZZSPlIwRX2dyb3VwX3Blcm1fY2FjaGWUj5QojBFzcWwuYXJjaGl2ZV9hcHBseZSMD3NxbC5hcmNoaXZlX21ndJSMFHNxbC50cnhhbmRsb2Nrc192aWV3lIwYc3FsLm1lbnVfZGF0YV9kaWN0aW9uYXJ5lIwRc3FsLm1lbnVfc3FscXVlcnmUjBNzcWwubWVudV9iaW5sb2cyc3FslIwUc3FsLm1lbnVfc3Fsb3B0aW1pemWUjBdzcWwub3B0aW1pemVfc3FsYWR2aXNvcpSME3NxbC5kZWxldGVfcXVlcnlsb2eUjBJzcWwuYXJjaGl2ZV9yZXZpZXeUjBRzcWwudmlld19zcWx3b3JrZmxvd5SMEHNxbC5wcm9jZXNzX3ZpZXeUjA5zcWwuc3FsX3Jldmlld5SMEHNxbC5xdWVyeV9zdWJtaXSUjBJzcWwubWVudV9kYXNoYm9hcmSUjBFzcWwubWVudV9zcWxjaGVja5SMEHNxbC5xdWVyeV9yZXZpZXeUjCJzcWwuc3FsX2V4ZWN1dGVfZm9yX3Jlc291cmNlX2dyb3VwlIwTc3FsLm1lbnVfc3FsYWR2aXNvcpSMFnNxbC5vcHRpbWl6ZV9zcWx0dW5pbmeUjA5zcWwubWVudV9xdWVyeZSMFnNxbC5kZWxldGVfd29ya2Zsb3dsb2eUjCFzcWwucXVlcnlfcmVzb3VyY2VfZ3JvdXBfaW5zdGFuY2WUjBRzcWwudmlld193b3JrZmxvd2xvZ5SMD3NxbC5zcWxfYW5hbHl6ZZSME3NxbC5xdWVyeV9hcHBseXByaXaUjBFzcWwuYWRkX3Nsb3dxdWVyeZSMEXNxbC5vcHRpbWl6ZV9zb2FylIwMc3FsLnRyeF92aWV3lIwOc3FsLnBhcmFtX3ZpZXeUjBBzcWwucHJvY2Vzc19raWxslIwTc3FsLnRhYmxlc3BhY2Vfdmlld5SME3NxbC5tZW51X3NjaGVtYXN5bmOUjA5zcWwuc3FsX3N1Ym1pdJSMHHNxbC52aWV3X3dvcmtmbG93YXVkaXRkZXRhaWyUjBFzcWwudmlld19xdWVyeWxvZ5SMFHNxbC5tZW51X3NxbHdvcmtmbG93lIwSc3FsLm1lbnVfc2xvd3F1ZXJ5lIwbc3FsLnZpZXdfc3Fsd29ya2Zsb3djb250ZW50lIwTc3FsLm1lbnVfc3FsYW5hbHl6ZZSMDnNxbC5tZW51X3Rvb2xzlIwPc3FsLnNxbF9leGVjdXRllIwXc3FsLnF1ZXJ5X2FsbF9pbnN0YW5jZXOUkIwLX3Blcm1fY2FjaGWUj5QoaDZoN2g4aDloOmg7aDxoPWg+aD9oQGhBaEJoQ2hEaEVoRmhHaEhoSWhKaEtoTGhNaE5oT2hQaFFoUmhTaFRoVWhWaFdoWGhZaFpoW2hcaF1oXmhfaGCQjA9fZGphbmdvX3ZlcnNpb26UjAUzLjEuNpR1YoaULg==','gAV9lC4=','gAWVDQgAAAAAAACMEnNxbC5lbmdpbmVzLm1vZGVsc5SMCVJldmlld1NldJSTlCmBlH2UKIwIZnVsbF9zcWyUWMQCAABDUkVBVEUgVEFCTEUgYGFjaGVyeTQ0NDRgICgNCmBpZGAgaW50KDEwKSBOT1QgTlVMTCwNCmBjYXRlZ29yeV9uYW1lYCB2YXJjaGFyKDUwMCkgREVGQVVMVCBOVUxMIENPTU1FTlQgJ+exu+ebruWQjScsDQpgY2F0ZWdvcnlfdmFsdWVgIHZhcmNoYXIoNTAwKSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn57G755uu5YC8JywNCmByZW1hcmtgIHZhcmNoYXIoNTAwKSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn5aSH5rOoJywNCmBjcmVhdGVkX2F0YCBkYXRldGltZSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn5Yib5bu65pe26Ze0JywNCmBjcmVhdGVkX2J5YCB2YXJjaGFyKDQ1KSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn5Yib5bu65Lq6JywNCmBtb2RpZmllZF9hdGAgZGF0ZXRpbWUgREVGQVVMVCBOVUxMIENPTU1FTlQgJ+abtOaWsOaXtumXtCcsDQpgbW9kaWZpZWRfYnlgIHZhcmNoYXIoNDUpIERFRkFVTFQgTlVMTCBDT01NRU5UICfmm7TmlrDkuronLA0KYGlzX2RlbGV0ZWRgIHRpbnlpbnQoMSkgREVGQVVMVCAnMCcgQ09NTUVOVCAn5piv5ZCm5Yig6ZmkJywNCmBkZWxldGVkX2F0YCBkYXRldGltZSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn5Yig6Zmk5pe26Ze0JywNCmBkZWxldGVkX2J5YCB2YXJjaGFyKDQ1KSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn5Yig6Zmk5Lq6JywNClBSSU1BUlkgS0VZIChgaWRgKSBVU0lORyBCVFJFRQ0KKSBFTkdJTkUgPSBJbm5vREKUjAppc19leGVjdXRllImMB2NoZWNrZWSUTowHd2FybmluZ5ROjAVlcnJvcpROjA13YXJuaW5nX2NvdW50lEsAjAtlcnJvcl9jb3VudJRLAIwLaXNfY3JpdGljYWyUiYwLc3ludGF4X3R5cGWUSwCMBHJvd3OUXZQoaACMDFJldmlld1Jlc3VsdJSTlCmBlH2UKIwCaWSUSwGMBXN0YWdllIwIRVhFQ1VURUSUjAhlcnJsZXZlbJRLAIwLc3RhZ2VzdGF0dXOUjBRFeGVjdXRlIFN1Y2Nlc3NmdWxseZSMDGVycm9ybWVzc2FnZZSMAJSMA3NxbJSMEXVzZSBgYXBwX2FwaV9iYWtglIwNYWZmZWN0ZWRfcm93c5RLAIwIc2VxdWVuY2WUjBwxNjIwOTAwODkxXzE2ODI1MTg1XzAwMDAwMDAwlIwNYmFja3VwX2RibmFtZZRoHIwMZXhlY3V0ZV90aW1llIwFMC4wMDCUjAdzcWxzaGExlGgcjAtiYWNrdXBfdGltZZSMATCUjBRhY3R1YWxfYWZmZWN0ZWRfcm93c5RoHHViaBIpgZR9lChoFUsCaBaMCEVYRUNVVEVElGgYSwBoGYwURXhlY3V0ZSBTdWNjZXNzZnVsbHmUaBtoHGgdWMQCAABDUkVBVEUgVEFCTEUgYGFjaGVyeTQ0NDRgICgNCmBpZGAgaW50KDEwKSBOT1QgTlVMTCwNCmBjYXRlZ29yeV9uYW1lYCB2YXJjaGFyKDUwMCkgREVGQVVMVCBOVUxMIENPTU1FTlQgJ+exu+ebruWQjScsDQpgY2F0ZWdvcnlfdmFsdWVgIHZhcmNoYXIoNTAwKSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn57G755uu5YC8JywNCmByZW1hcmtgIHZhcmNoYXIoNTAwKSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn5aSH5rOoJywNCmBjcmVhdGVkX2F0YCBkYXRldGltZSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn5Yib5bu65pe26Ze0JywNCmBjcmVhdGVkX2J5YCB2YXJjaGFyKDQ1KSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn5Yib5bu65Lq6JywNCmBtb2RpZmllZF9hdGAgZGF0ZXRpbWUgREVGQVVMVCBOVUxMIENPTU1FTlQgJ+abtOaWsOaXtumXtCcsDQpgbW9kaWZpZWRfYnlgIHZhcmNoYXIoNDUpIERFRkFVTFQgTlVMTCBDT01NRU5UICfmm7TmlrDkuronLA0KYGlzX2RlbGV0ZWRgIHRpbnlpbnQoMSkgREVGQVVMVCAnMCcgQ09NTUVOVCAn5piv5ZCm5Yig6ZmkJywNCmBkZWxldGVkX2F0YCBkYXRldGltZSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn5Yig6Zmk5pe26Ze0JywNCmBkZWxldGVkX2J5YCB2YXJjaGFyKDQ1KSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn5Yig6Zmk5Lq6JywNClBSSU1BUlkgS0VZIChgaWRgKSBVU0lORyBCVFJFRQ0KKSBFTkdJTkUgPSBJbm5vREKUaB9LAGggjBwxNjIwOTAwODkxXzE2ODI1MTg1XzAwMDAwMDAxlGgiaBxoI4wFMC4wMTCUaCVoHGgmaCdoKGgcdWJljAtjb2x1bW5fbGlzdJROjAZzdGF0dXOUTmgfSwB1Yi4=','2021-05-13 18:14:51.493881','2021-05-13 18:14:51.752623',1,'838ddf1aa5dc4536aaa8900eb5195f96',NULL,1),('sqlreview-execute-19','sql.utils.execute_sql.execute','sql.utils.execute_sql.execute_callback','gAWVmwYAAAAAAABLE4wVZGphbmdvLmRiLm1vZGVscy5iYXNllIwObW9kZWxfdW5waWNrbGWUk5SMA3NxbJSMBVVzZXJzlIaUhZRSlH2UKIwGX3N0YXRllGgAjApNb2RlbFN0YXRllJOUKYGUfZQojAZhZGRpbmeUiYwCZGKUjAdkZWZhdWx0lIwMZmllbGRzX2NhY2hllH2UdWKMAmlklEsNjAhwYXNzd29yZJSMTnBia2RmMl9zaGEyNTYkMjE2MDAwJFR3Mm9mRmhxa1QyQyRyckt4ZGlRejYvZFlQQ1FDTXVhSmpORlMxb2pnWEF1SkFYS0M2STFWMVZzPZSMCmxhc3RfbG9naW6UjAhkYXRldGltZZSMCGRhdGV0aW1llJOUQwoH5QkcCy80BaChlIWUUpSMDGlzX3N1cGVydXNlcpSJjAh1c2VybmFtZZSMBXVzZXIxlIwKZmlyc3RfbmFtZZSMAJSMCWxhc3RfbmFtZZRoIYwFZW1haWyUjBEyNzk1NTE4NjQ2QHFxLmNvbZSMCGlzX3N0YWZmlIiMCWlzX2FjdGl2ZZSIjAtkYXRlX2pvaW5lZJRoGUMKB+UJHAsmNwfpWpSFlFKUjAdkaXNwbGF5lIwHZmVuZ2xlaZSMDGRpbmdfdXNlcl9pZJRoIYwKd3hfdXNlcl9pZJRoIYwOZmVpc2h1X29wZW5faWSUaCGMEmZhaWxlZF9sb2dpbl9jb3VudJRLAIwUbGFzdF9sb2dpbl9mYWlsZWRfYXSUTowQX3VzZXJfcGVybV9jYWNoZZSPlIwRX2dyb3VwX3Blcm1fY2FjaGWUj5QojA9zcWwuYXJjaGl2ZV9tZ3SUjBNzcWwucXVlcnlfYXBwbHlwcml2lIwOc3FsLnNxbF9yZXZpZXeUjBNzcWwudGFibGVzcGFjZV92aWV3lIwhc3FsLnF1ZXJ5X3Jlc291cmNlX2dyb3VwX2luc3RhbmNllIwQc3FsLnF1ZXJ5X3Jldmlld5SMDHNxbC50cnhfdmlld5SMEnNxbC5tZW51X2Rhc2hib2FyZJSME3NxbC5tZW51X2JpbmxvZzJzcWyUjBxzcWwudmlld193b3JrZmxvd2F1ZGl0ZGV0YWlslIwRc3FsLmFyY2hpdmVfYXBwbHmUjBZzcWwuZGVsZXRlX3dvcmtmbG93bG9nlIwXc3FsLm9wdGltaXplX3NxbGFkdmlzb3KUjA9zcWwuc3FsX2V4ZWN1dGWUjBhzcWwubWVudV9kYXRhX2RpY3Rpb25hcnmUjA5zcWwubWVudV90b29sc5SMEHNxbC5wcm9jZXNzX3ZpZXeUjBJzcWwuYXJjaGl2ZV9yZXZpZXeUjBFzcWwubWVudV9zcWxxdWVyeZSMEHNxbC5xdWVyeV9zdWJtaXSUjBRzcWwudHJ4YW5kbG9ja3Nfdmlld5SMEXNxbC5hZGRfc2xvd3F1ZXJ5lIwUc3FsLm1lbnVfc3Fsb3B0aW1pemWUjBZzcWwub3B0aW1pemVfc3FsdHVuaW5nlIwSc3FsLm1lbnVfc2xvd3F1ZXJ5lIwTc3FsLm1lbnVfc2NoZW1hc3luY5SMDnNxbC5wYXJhbV92aWV3lIwUc3FsLm1lbnVfc3Fsd29ya2Zsb3eUjA5zcWwubWVudV9xdWVyeZSMEXNxbC52aWV3X3F1ZXJ5bG9nlIwbc3FsLnZpZXdfc3Fsd29ya2Zsb3djb250ZW50lIwQc3FsLnByb2Nlc3Nfa2lsbJSMEXNxbC5tZW51X3NxbGNoZWNrlIwTc3FsLm1lbnVfc3FsYWR2aXNvcpSME3NxbC5tZW51X3NxbGFuYWx5emWUjBNzcWwuZGVsZXRlX3F1ZXJ5bG9nlIwic3FsLnNxbF9leGVjdXRlX2Zvcl9yZXNvdXJjZV9ncm91cJSMDnNxbC5zcWxfc3VibWl0lIwUc3FsLnZpZXdfd29ya2Zsb3dsb2eUjBdzcWwucXVlcnlfYWxsX2luc3RhbmNlc5SMD3NxbC5zcWxfYW5hbHl6ZZSMEXNxbC5vcHRpbWl6ZV9zb2FylIwUc3FsLnZpZXdfc3Fsd29ya2Zsb3eUkIwLX3Blcm1fY2FjaGWUj5QoaDZoN2g4aDloOmg7aDxoPWg+aD9oQGhBaEJoQ2hEaEVoRmhHaEhoSWhKaEtoTGhNaE5oT2hQaFFoUmhTaFRoVWhWaFdoWGhZaFpoW2hcaF1oXmhfaGCQjA9fZGphbmdvX3ZlcnNpb26UjAUzLjEuNpR1YoaULg==','gAV9lC4=','gAWV4AMAAAAAAACMEnNxbC5lbmdpbmVzLm1vZGVsc5SMCVJldmlld1NldJSTlCmBlH2UKIwIZnVsbF9zcWyUjLNDUkVBVEUgVEFCTEUgYG9mZ3JvdXBgICAoDQogIGBncm91cE5hbWVgIHZhcmNoYXIoNTApICBOT1QgTlVMTCwNCiAgYGRlc2NyaXB0aW9uYCB2YXJjaGFyKDI1NSkgREVGQVVMVCBOVUxMLA0KICBQUklNQVJZIEtFWSAoYGdyb3VwTmFtZWApIA0KKSBFTkdJTkUgPSBJbm5vREIgIFJPV19GT1JNQVQgPSBEeW5hbWljO5SMCmlzX2V4ZWN1dGWUiYwHY2hlY2tlZJROjAd3YXJuaW5nlE6MBWVycm9ylE6MDXdhcm5pbmdfY291bnSUSwCMC2Vycm9yX2NvdW50lEsAjAtpc19jcml0aWNhbJSJjAtzeW50YXhfdHlwZZRLAIwEcm93c5RdlChoAIwMUmV2aWV3UmVzdWx0lJOUKYGUfZQojAJpZJRLAYwFc3RhZ2WUjAhFWEVDVVRFRJSMCGVycmxldmVslEsAjAtzdGFnZXN0YXR1c5SMFEV4ZWN1dGUgU3VjY2Vzc2Z1bGx5lIwMZXJyb3JtZXNzYWdllIwAlIwDc3FslIwNdXNlIGBhcmNocmV5YJSMDWFmZmVjdGVkX3Jvd3OUSwCMCHNlcXVlbmNllIwcMTYzMjgwMTAzOV8zMDQyMjk5N18wMDAwMDAwMJSMDWJhY2t1cF9kYm5hbWWUaByMDGV4ZWN1dGVfdGltZZSMBTAuMDAwlIwHc3Fsc2hhMZRoHIwLYmFja3VwX3RpbWWUjAEwlIwUYWN0dWFsX2FmZmVjdGVkX3Jvd3OUaBx1YmgSKYGUfZQoaBVLAmgWjAhFWEVDVVRFRJRoGEsAaBmMFEV4ZWN1dGUgU3VjY2Vzc2Z1bGx5lGgbaBxoHYyyQ1JFQVRFIFRBQkxFIGBvZmdyb3VwYCAgKA0KICBgZ3JvdXBOYW1lYCB2YXJjaGFyKDUwKSAgTk9UIE5VTEwsDQogIGBkZXNjcmlwdGlvbmAgdmFyY2hhcigyNTUpIERFRkFVTFQgTlVMTCwNCiAgUFJJTUFSWSBLRVkgKGBncm91cE5hbWVgKSANCikgRU5HSU5FID0gSW5ub0RCICBST1dfRk9STUFUID0gRHluYW1pY5RoH0sAaCCMHDE2MzI4MDEwMzlfMzA0MjI5OTdfMDAwMDAwMDGUaCJoHGgjjAUwLjAwN5RoJWgcaCZoJ2goaBx1YmWMC2NvbHVtbl9saXN0lE6MBnN0YXR1c5ROaB9LAHViLg==','2021-09-28 11:50:39.093579','2021-09-28 11:50:39.384975',1,'85c63fa4edeb4d30b0bd29273478d641',NULL,1),('sqlreview-execute-6','sql.utils.execute_sql.execute','sql.utils.execute_sql.execute_callback','gASVWAIAAAAAAABLBowVZGphbmdvLmRiLm1vZGVscy5iYXNllIwObW9kZWxfdW5waWNrbGWUk5SMA3NxbJSMBVVzZXJzlIaUhZRSlH2UKIwGX3N0YXRllGgAjApNb2RlbFN0YXRllJOUKYGUfZQojAZhZGRpbmeUiYwCZGKUjAdkZWZhdWx0lIwMZmllbGRzX2NhY2hllH2UdWKMAmlklEsBjAhwYXNzd29yZJSMTnBia2RmMl9zaGEyNTYkMjE2MDAwJDBYNWRTZjQwejdzRiR5YlFlN3MwdHhXanA4aUhmbjUwVWVhMG1qbnlsOVpKbWpIRTRpeldqZVNZPZSMCmxhc3RfbG9naW6UjAhkYXRldGltZZSMCGRhdGV0aW1llJOUQwoH5QUMDwAOBw29lIWUUpSMDGlzX3N1cGVydXNlcpSIjAh1c2VybmFtZZSMBWFkbWlulIwKZmlyc3RfbmFtZZSMAJSMCWxhc3RfbmFtZZRoIYwFZW1haWyUjApoaEAxNjMuY29tlIwIaXNfc3RhZmaUiIwJaXNfYWN0aXZllIiMC2RhdGVfam9pbmVklGgZQwoH5QUHEzQxCsQPlIWUUpSMB2Rpc3BsYXmUaCGMDGRpbmdfdXNlcl9pZJRoIYwKd3hfdXNlcl9pZJRoIYwOZmVpc2h1X29wZW5faWSUaCGMEmZhaWxlZF9sb2dpbl9jb3VudJRLAIwUbGFzdF9sb2dpbl9mYWlsZWRfYXSUaBlDCgflBQwJDTMHvnWUhZRSlIwPX2RqYW5nb192ZXJzaW9ulIwFMy4xLjKUdWKGlC4=','gASVAwAAAAAAAAB9lC4=','gASVAQgAAAAAAACMEnNxbC5lbmdpbmVzLm1vZGVsc5SMCVJldmlld1NldJSTlCmBlH2UKIwIZnVsbF9zcWyUWMACAABDUkVBVEUgVEFCTEUgYGFjaGVyeWAgKA0KYGlkYCBpbnQoMTApIE5PVCBOVUxMLA0KYGNhdGVnb3J5X25hbWVgIHZhcmNoYXIoNTAwKSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn57G755uu5ZCNJywNCmBjYXRlZ29yeV92YWx1ZWAgdmFyY2hhcig1MDApIERFRkFVTFQgTlVMTCBDT01NRU5UICfnsbvnm67lgLwnLA0KYHJlbWFya2AgdmFyY2hhcig1MDApIERFRkFVTFQgTlVMTCBDT01NRU5UICflpIfms6gnLA0KYGNyZWF0ZWRfYXRgIGRhdGV0aW1lIERFRkFVTFQgTlVMTCBDT01NRU5UICfliJvlu7rml7bpl7QnLA0KYGNyZWF0ZWRfYnlgIHZhcmNoYXIoNDUpIERFRkFVTFQgTlVMTCBDT01NRU5UICfliJvlu7rkuronLA0KYG1vZGlmaWVkX2F0YCBkYXRldGltZSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn5pu05paw5pe26Ze0JywNCmBtb2RpZmllZF9ieWAgdmFyY2hhcig0NSkgREVGQVVMVCBOVUxMIENPTU1FTlQgJ+abtOaWsOS6uicsDQpgaXNfZGVsZXRlZGAgdGlueWludCgxKSBERUZBVUxUICcwJyBDT01NRU5UICfmmK/lkKbliKDpmaQnLA0KYGRlbGV0ZWRfYXRgIGRhdGV0aW1lIERFRkFVTFQgTlVMTCBDT01NRU5UICfliKDpmaTml7bpl7QnLA0KYGRlbGV0ZWRfYnlgIHZhcmNoYXIoNDUpIERFRkFVTFQgTlVMTCBDT01NRU5UICfliKDpmaTkuronLA0KUFJJTUFSWSBLRVkgKGBpZGApIFVTSU5HIEJUUkVFDQopIEVOR0lORSA9IElubm9EQpSMCmlzX2V4ZWN1dGWUiYwHY2hlY2tlZJROjAd3YXJuaW5nlE6MBWVycm9ylE6MDXdhcm5pbmdfY291bnSUSwCMC2Vycm9yX2NvdW50lEsAjAtpc19jcml0aWNhbJSJjAtzeW50YXhfdHlwZZRLAIwEcm93c5RdlChoAIwMUmV2aWV3UmVzdWx0lJOUKYGUfZQojAJpZJRLAYwFc3RhZ2WUjAhFWEVDVVRFRJSMCGVycmxldmVslEsAjAtzdGFnZXN0YXR1c5SMFEV4ZWN1dGUgU3VjY2Vzc2Z1bGx5lIwMZXJyb3JtZXNzYWdllIwAlIwDc3FslIwNdXNlIGBhcHBfYXBpYJSMDWFmZmVjdGVkX3Jvd3OUSwCMCHNlcXVlbmNllIwcMTYyMDgwNTcwN18xNjcwMjMzNV8wMDAwMDAwMJSMDWJhY2t1cF9kYm5hbWWUaByMDGV4ZWN1dGVfdGltZZSMBTAuMDAwlIwHc3Fsc2hhMZRoHIwLYmFja3VwX3RpbWWUjAEwlIwUYWN0dWFsX2FmZmVjdGVkX3Jvd3OUaBx1YmgSKYGUfZQoaBVLAmgWjAhFWEVDVVRFRJRoGEsAaBmMFEV4ZWN1dGUgU3VjY2Vzc2Z1bGx5lGgbaBxoHVjAAgAAQ1JFQVRFIFRBQkxFIGBhY2hlcnlgICgNCmBpZGAgaW50KDEwKSBOT1QgTlVMTCwNCmBjYXRlZ29yeV9uYW1lYCB2YXJjaGFyKDUwMCkgREVGQVVMVCBOVUxMIENPTU1FTlQgJ+exu+ebruWQjScsDQpgY2F0ZWdvcnlfdmFsdWVgIHZhcmNoYXIoNTAwKSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn57G755uu5YC8JywNCmByZW1hcmtgIHZhcmNoYXIoNTAwKSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn5aSH5rOoJywNCmBjcmVhdGVkX2F0YCBkYXRldGltZSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn5Yib5bu65pe26Ze0JywNCmBjcmVhdGVkX2J5YCB2YXJjaGFyKDQ1KSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn5Yib5bu65Lq6JywNCmBtb2RpZmllZF9hdGAgZGF0ZXRpbWUgREVGQVVMVCBOVUxMIENPTU1FTlQgJ+abtOaWsOaXtumXtCcsDQpgbW9kaWZpZWRfYnlgIHZhcmNoYXIoNDUpIERFRkFVTFQgTlVMTCBDT01NRU5UICfmm7TmlrDkuronLA0KYGlzX2RlbGV0ZWRgIHRpbnlpbnQoMSkgREVGQVVMVCAnMCcgQ09NTUVOVCAn5piv5ZCm5Yig6ZmkJywNCmBkZWxldGVkX2F0YCBkYXRldGltZSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn5Yig6Zmk5pe26Ze0JywNCmBkZWxldGVkX2J5YCB2YXJjaGFyKDQ1KSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn5Yig6Zmk5Lq6JywNClBSSU1BUlkgS0VZIChgaWRgKSBVU0lORyBCVFJFRQ0KKSBFTkdJTkUgPSBJbm5vREKUaB9LAGggjBwxNjIwODA1NzA3XzE2NzAyMzM1XzAwMDAwMDAxlGgiaBxoI4wFMC4wMTCUaCVoHGgmaCdoKGgcdWJljAtjb2x1bW5fbGlzdJROjAZzdGF0dXOUTmgfSwB1Yi4=','2021-05-12 15:48:27.583604','2021-05-12 15:48:27.854552',1,'8dd27b718d0e49598ea6a852371ced65',NULL,1),('sqlreview-pass-3','<function notify_for_audit at 0x7fdbe0934950>',NULL,'gASVAgAAAAAAAAApLg==','gASVJAAAAAAAAAB9lCiMCGF1ZGl0X2lklEsBjAxhdWRpdF9yZW1hcmuUjACUdS4=',NULL,'2021-05-11 11:07:13.760683','2021-05-12 15:29:06.727457',1,'90f8d1be88f9468380b762d919eb88d3',NULL,1),('sqlreview-pass-6','<function notify_for_audit at 0x7fdbe0934950>',NULL,'gASVAgAAAAAAAAApLg==','gASVJAAAAAAAAAB9lCiMCGF1ZGl0X2lklEsDjAxhdWRpdF9yZW1hcmuUjACUdS4=',NULL,'2021-05-12 15:48:23.884068','2021-05-12 15:48:23.893713',1,'ad5c21f11a9c4e739293115788b55023',NULL,1),('sqlreview-execute-8','sql.utils.execute_sql.execute','sql.utils.execute_sql.execute_callback','gASVWAIAAAAAAABLCIwVZGphbmdvLmRiLm1vZGVscy5iYXNllIwObW9kZWxfdW5waWNrbGWUk5SMA3NxbJSMBVVzZXJzlIaUhZRSlH2UKIwGX3N0YXRllGgAjApNb2RlbFN0YXRllJOUKYGUfZQojAZhZGRpbmeUiYwCZGKUjAdkZWZhdWx0lIwMZmllbGRzX2NhY2hllH2UdWKMAmlklEsBjAhwYXNzd29yZJSMTnBia2RmMl9zaGEyNTYkMjE2MDAwJDBYNWRTZjQwejdzRiR5YlFlN3MwdHhXanA4aUhmbjUwVWVhMG1qbnlsOVpKbWpIRTRpeldqZVNZPZSMCmxhc3RfbG9naW6UjAhkYXRldGltZZSMCGRhdGV0aW1llJOUQwoH5QUMDwAOBw29lIWUUpSMDGlzX3N1cGVydXNlcpSIjAh1c2VybmFtZZSMBWFkbWlulIwKZmlyc3RfbmFtZZSMAJSMCWxhc3RfbmFtZZRoIYwFZW1haWyUjApoaEAxNjMuY29tlIwIaXNfc3RhZmaUiIwJaXNfYWN0aXZllIiMC2RhdGVfam9pbmVklGgZQwoH5QUHEzQxCsQPlIWUUpSMB2Rpc3BsYXmUaCGMDGRpbmdfdXNlcl9pZJRoIYwKd3hfdXNlcl9pZJRoIYwOZmVpc2h1X29wZW5faWSUaCGMEmZhaWxlZF9sb2dpbl9jb3VudJRLAIwUbGFzdF9sb2dpbl9mYWlsZWRfYXSUaBlDCgflBQwJDTMHvnWUhZRSlIwPX2RqYW5nb192ZXJzaW9ulIwFMy4xLjKUdWKGlC4=','gASVAwAAAAAAAAB9lC4=','gASV9wcAAAAAAACMEnNxbC5lbmdpbmVzLm1vZGVsc5SMCVJldmlld1NldJSTlCmBlH2UKIwIZnVsbF9zcWyUWLsCAABDUkVBVEUgVEFCTEUgYDFgICgNCmBpZGAgaW50KDEwKSBOT1QgTlVMTCwNCmBjYXRlZ29yeV9uYW1lYCB2YXJjaGFyKDUwMCkgREVGQVVMVCBOVUxMIENPTU1FTlQgJ+exu+ebruWQjScsDQpgY2F0ZWdvcnlfdmFsdWVgIHZhcmNoYXIoNTAwKSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn57G755uu5YC8JywNCmByZW1hcmtgIHZhcmNoYXIoNTAwKSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn5aSH5rOoJywNCmBjcmVhdGVkX2F0YCBkYXRldGltZSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn5Yib5bu65pe26Ze0JywNCmBjcmVhdGVkX2J5YCB2YXJjaGFyKDQ1KSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn5Yib5bu65Lq6JywNCmBtb2RpZmllZF9hdGAgZGF0ZXRpbWUgREVGQVVMVCBOVUxMIENPTU1FTlQgJ+abtOaWsOaXtumXtCcsDQpgbW9kaWZpZWRfYnlgIHZhcmNoYXIoNDUpIERFRkFVTFQgTlVMTCBDT01NRU5UICfmm7TmlrDkuronLA0KYGlzX2RlbGV0ZWRgIHRpbnlpbnQoMSkgREVGQVVMVCAnMCcgQ09NTUVOVCAn5piv5ZCm5Yig6ZmkJywNCmBkZWxldGVkX2F0YCBkYXRldGltZSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn5Yig6Zmk5pe26Ze0JywNCmBkZWxldGVkX2J5YCB2YXJjaGFyKDQ1KSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn5Yig6Zmk5Lq6JywNClBSSU1BUlkgS0VZIChgaWRgKSBVU0lORyBCVFJFRQ0KKSBFTkdJTkUgPSBJbm5vREKUjAppc19leGVjdXRllImMB2NoZWNrZWSUTowHd2FybmluZ5ROjAVlcnJvcpROjA13YXJuaW5nX2NvdW50lEsAjAtlcnJvcl9jb3VudJRLAIwLaXNfY3JpdGljYWyUiYwLc3ludGF4X3R5cGWUSwCMBHJvd3OUXZQoaACMDFJldmlld1Jlc3VsdJSTlCmBlH2UKIwCaWSUSwGMBXN0YWdllIwIRVhFQ1VURUSUjAhlcnJsZXZlbJRLAIwLc3RhZ2VzdGF0dXOUjBRFeGVjdXRlIFN1Y2Nlc3NmdWxseZSMDGVycm9ybWVzc2FnZZSMAJSMA3NxbJSMDXVzZSBgYXBwX2FwaWCUjA1hZmZlY3RlZF9yb3dzlEsAjAhzZXF1ZW5jZZSMHDE2MjA4MTI0MzlfMTY3MTEyNTJfMDAwMDAwMDCUjA1iYWNrdXBfZGJuYW1llGgcjAxleGVjdXRlX3RpbWWUjAUwLjAwMJSMB3NxbHNoYTGUaByMC2JhY2t1cF90aW1llIwBMJSMFGFjdHVhbF9hZmZlY3RlZF9yb3dzlGgcdWJoEimBlH2UKGgVSwJoFowIRVhFQ1VURUSUaBhLAGgZjBRFeGVjdXRlIFN1Y2Nlc3NmdWxseZRoG2gcaB1YuwIAAENSRUFURSBUQUJMRSBgMWAgKA0KYGlkYCBpbnQoMTApIE5PVCBOVUxMLA0KYGNhdGVnb3J5X25hbWVgIHZhcmNoYXIoNTAwKSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn57G755uu5ZCNJywNCmBjYXRlZ29yeV92YWx1ZWAgdmFyY2hhcig1MDApIERFRkFVTFQgTlVMTCBDT01NRU5UICfnsbvnm67lgLwnLA0KYHJlbWFya2AgdmFyY2hhcig1MDApIERFRkFVTFQgTlVMTCBDT01NRU5UICflpIfms6gnLA0KYGNyZWF0ZWRfYXRgIGRhdGV0aW1lIERFRkFVTFQgTlVMTCBDT01NRU5UICfliJvlu7rml7bpl7QnLA0KYGNyZWF0ZWRfYnlgIHZhcmNoYXIoNDUpIERFRkFVTFQgTlVMTCBDT01NRU5UICfliJvlu7rkuronLA0KYG1vZGlmaWVkX2F0YCBkYXRldGltZSBERUZBVUxUIE5VTEwgQ09NTUVOVCAn5pu05paw5pe26Ze0JywNCmBtb2RpZmllZF9ieWAgdmFyY2hhcig0NSkgREVGQVVMVCBOVUxMIENPTU1FTlQgJ+abtOaWsOS6uicsDQpgaXNfZGVsZXRlZGAgdGlueWludCgxKSBERUZBVUxUICcwJyBDT01NRU5UICfmmK/lkKbliKDpmaQnLA0KYGRlbGV0ZWRfYXRgIGRhdGV0aW1lIERFRkFVTFQgTlVMTCBDT01NRU5UICfliKDpmaTml7bpl7QnLA0KYGRlbGV0ZWRfYnlgIHZhcmNoYXIoNDUpIERFRkFVTFQgTlVMTCBDT01NRU5UICfliKDpmaTkuronLA0KUFJJTUFSWSBLRVkgKGBpZGApIFVTSU5HIEJUUkVFDQopIEVOR0lORSA9IElubm9EQpRoH0sAaCCMHDE2MjA4MTI0MzlfMTY3MTEyNTJfMDAwMDAwMDGUaCJoHGgjjAUwLjAwOZRoJWgcaCZoJ2goaBx1YmWMC2NvbHVtbl9saXN0lE6MBnN0YXR1c5ROaB9LAHViLg==','2021-05-12 17:40:38.998681','2021-05-12 17:40:39.252751',1,'bcccb76e392b48fd9e22e6a87a67d629',NULL,1),('sqlreview-pass-8','<function notify_for_audit at 0x7fdbe0934950>',NULL,'gASVAgAAAAAAAAApLg==','gASVJAAAAAAAAAB9lCiMCGF1ZGl0X2lklEsEjAxhdWRpdF9yZW1hcmuUjACUdS4=',NULL,'2021-05-12 17:40:28.003078','2021-05-12 17:40:28.010426',1,'be37bd99f71a4cdf9530ac250355b92b',NULL,1),('sqlreview-submit-10','<function notify_for_audit at 0x7fb91554ca60>',NULL,'gAUpLg==','gAWVHwAAAAAAAAB9lCiMCGF1ZGl0X2lklEsGjAhjY191c2Vyc5RdlHUu',NULL,'2021-05-13 18:01:12.367360','2021-05-13 18:01:12.395371',1,'c66ef7aa383547918b5e87c6b5a3b088',NULL,1),('sqlreview-submit-3','<function notify_for_audit at 0x7fdbe0934950>',NULL,'gASVAgAAAAAAAAApLg==','gASVHwAAAAAAAAB9lCiMCGF1ZGl0X2lklEsBjAhjY191c2Vyc5RdlHUu',NULL,'2021-05-11 11:06:44.768650','2021-05-12 15:29:06.717792',1,'cfc3437912e245a3bd2c7a023381ae3d',NULL,1),('sqlreview-execute-11','sql.utils.execute_sql.execute','sql.utils.execute_sql.execute_callback','gAWVWAIAAAAAAABLC4wVZGphbmdvLmRiLm1vZGVscy5iYXNllIwObW9kZWxfdW5waWNrbGWUk5SMA3NxbJSMBVVzZXJzlIaUhZRSlH2UKIwGX3N0YXRllGgAjApNb2RlbFN0YXRllJOUKYGUfZQojAZhZGRpbmeUiYwCZGKUjAdkZWZhdWx0lIwMZmllbGRzX2NhY2hllH2UdWKMAmlklEsBjAhwYXNzd29yZJSMTnBia2RmMl9zaGEyNTYkMjE2MDAwJDlZV1Bpb0NYbVpqMSRUVzZMT2wvbEl5VXRmSkwzWVE2RWxMUjdTZHdOUmtacXpFbU9ya1JhM2xrPZSMCmxhc3RfbG9naW6UjAhkYXRldGltZZSMCGRhdGV0aW1llJOUQwoH5QUNEQIyC2rvlIWUUpSMDGlzX3N1cGVydXNlcpSIjAh1c2VybmFtZZSMBWFkbWlulIwKZmlyc3RfbmFtZZSMAJSMCWxhc3RfbmFtZZRoIYwFZW1haWyUjApoaEAxNjMuY29tlIwIaXNfc3RhZmaUiIwJaXNfYWN0aXZllIiMC2RhdGVfam9pbmVklGgZQwoH5QUHEzQxCsQPlIWUUpSMB2Rpc3BsYXmUaCGMDGRpbmdfdXNlcl9pZJRoIYwKd3hfdXNlcl9pZJRoIYwOZmVpc2h1X29wZW5faWSUaCGMEmZhaWxlZF9sb2dpbl9jb3VudJRLAIwUbGFzdF9sb2dpbl9mYWlsZWRfYXSUaBlDCgflBQwRMwoM3QmUhZRSlIwPX2RqYW5nb192ZXJzaW9ulIwFMy4xLjaUdWKGlC4=','gAV9lC4=','gAWVqwIAAAAAAACMEnNxbC5lbmdpbmVzLm1vZGVsc5SMCVJldmlld1NldJSTlCmBlH2UKIwIZnVsbF9zcWyUjBZkZWxldGUgZnJvbSBhY2hlcnkxMTExlIwKaXNfZXhlY3V0ZZSJjAdjaGVja2VklE6MB3dhcm5pbmeUTowFZXJyb3KUTowNd2FybmluZ19jb3VudJRLAIwLZXJyb3JfY291bnSUSwCMC2lzX2NyaXRpY2FslImMC3N5bnRheF90eXBllEsAjARyb3dzlF2UKGgAjAxSZXZpZXdSZXN1bHSUk5QpgZR9lCiMAmlklEsBjAVzdGFnZZSMCEVYRUNVVEVElIwIZXJybGV2ZWyUSwCMC3N0YWdlc3RhdHVzlIwURXhlY3V0ZSBTdWNjZXNzZnVsbHmUjAxlcnJvcm1lc3NhZ2WUjACUjANzcWyUjBF1c2UgYGFwcF9hcGlfYmFrYJSMDWFmZmVjdGVkX3Jvd3OUSwCMCHNlcXVlbmNllIwcMTYyMDkwMDQwOF8xNjgyNDU1OF8wMDAwMDAwMJSMDWJhY2t1cF9kYm5hbWWUaByMDGV4ZWN1dGVfdGltZZSMBTAuMDAwlIwHc3Fsc2hhMZRoHIwLYmFja3VwX3RpbWWUjAEwlIwUYWN0dWFsX2FmZmVjdGVkX3Jvd3OUaBx1YmgSKYGUfZQoaBVLAmgWjAhFWEVDVVRFRJRoGEsAaBmMFEV4ZWN1dGUgU3VjY2Vzc2Z1bGx5lGgbaBxoHYwWZGVsZXRlIGZyb20gYWNoZXJ5MTExMZRoH0sAaCCMHDE2MjA5MDA0MDhfMTY4MjQ1NThfMDAwMDAwMDGUaCJoHGgjjAUwLjAwMZRoJWgcaCZoJ2goaBx1YmWMC2NvbHVtbl9saXN0lE6MBnN0YXR1c5ROaB9LAHViLg==','2021-05-13 18:06:48.051147','2021-05-13 18:06:48.325608',1,'e06eb912c8fe4100a3715d5233bd2485',NULL,1),('sqlreview-submit-18','<function notify_for_audit at 0x7f0f9e8d7c10>',NULL,'gAUpLg==','gAWVHwAAAAAAAAB9lCiMCGF1ZGl0X2lklEsMjAhjY191c2Vyc5RdlHUu',NULL,'2021-09-28 11:49:52.404761','2021-09-28 11:49:52.422218',1,'e6fecf69c660414aa3fb7f65da97efe6',NULL,1),('sqlreview-submit-8','<function notify_for_audit at 0x7fdbe0934950>',NULL,'gASVAgAAAAAAAAApLg==','gASVHwAAAAAAAAB9lCiMCGF1ZGl0X2lklEsEjAhjY191c2Vyc5RdlHUu',NULL,'2021-05-12 17:40:18.982285','2021-05-12 17:40:18.989820',1,'ecb0345c0d8a41d29fa505cdd3cee9c7',NULL,1),('sqlreview-submit-6','<function notify_for_audit at 0x7fdbe0934950>',NULL,'gASVAgAAAAAAAAApLg==','gASVHwAAAAAAAAB9lCiMCGF1ZGl0X2lklEsDjAhjY191c2Vyc5RdlHUu',NULL,'2021-05-12 15:48:16.040522','2021-05-12 15:48:16.048217',1,'f1ba211353ce4460b0b46dfdd6f7e3e6',NULL,1);
/*!40000 ALTER TABLE `django_q_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  KEY `django_session_expire_date_a5c62663` (`expire_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1fvhxlpns4k86jit38u562d4tz9zr0io','.eJxVjL0OwjAQg98lM4ryQ9LAyN5niC53F1JAqdS0E-LdSaUOMHiwP9tvEWFbS9waL3EicRVanH6zBPjkugN6QL3PEue6LlOSe0UetMlxJn7dju7fQYFW-lpBtmB8UIbtYC9KQ3Le-WwInc5d2gRjCelMmAbLzEjdBxWCxwwsPl_ZHDhR:1lgllI:srpGqTpnLlOwqGF2s7VJKejvt4gUw79PMdGkB5TJNjA','2021-05-12 23:06:40.491666'),('3yos4uh2p0z4e1jeyztyn4rb6qhglamo','.eJxVjMsOwiAUBf-FtSEXCggu3fcbyH1QqZo2Ke3K-O_apAvdnpk5L5VxW2veWlnyKOqijDr9boT8KNMO5I7TbdY8T-sykt4VfdCm-1nK83q4fwcVW_3WTFbAo00WQJIDATKWLMOZwQViF4OhLmLoSBKQpxQZBhFHnlPAQb0_1-Q4DQ:1lglTt:BwKYuq4YhG5p7hOgOAWPCs29IIVBbTPOC9Kj4pGj1wg','2021-05-12 22:48:41.737631'),('4drzkqm4erhd5ai8ymxu1cc4xhx9z6rz','.eJxVjEEOwiAQRe_C2hBgSqe6dN8zkGFgpGpoUtqV8e7apAvd_vfef6lA21rC1vISpqQuyqrT7xaJH7nuIN2p3mbNc12XKepd0QdtepxTfl4P9--gUCvfGj1Ash5YjJE4YKIzS0QSdEPuAbIDtF4su45ZeotknBMfxQuygU69P-eaN_o:1lh8V2:UjPbWQCvE56cMdmJ-6mQTRxw8V98G_li6IKUHKxxMQk','2021-05-13 23:23:24.991885'),('4iqt3ns4sqrm0zb5js6djy9z05nx7vyy','.eJxVjDsOwjAQBe_iGln-xR9Kes5g2btrHEC2FCcV4u4QKQW0b2bei8W0rTVug5Y4IzuzwE6_W07woLYDvKd26xx6W5c5813hBx382pGel8P9O6hp1G_tVZHeGkBAG5JVBK5QkeQMOeX1pJwSumTjhccMVnonAAUWjZinYDN7fwDxRDhK:1lh8Mp:dRhIdeKEh93jlBRnNWTtmBeuggXR0WN83yyLc_JskVQ','2021-05-13 23:14:55.825229'),('4s5rwgunuj1vd9tojcznabihk20p3tp2','.eJxVjMsOwiAQRf-FtSHA8HTp3m8gwDBSNTQp7cr479qkC93ec859sZi2tcVt1CVOyM5MstPvllN51L4DvKd-m3mZ-7pMme8KP-jg1xnr83K4fwctjfatMwYvXCmkjHWWrCevLWTtKigXJFYHophA2ougBSlwASkklIZsUQDs_QHRdDc7:1mevmK:8YWvsZImOl8uBaDFnpvcFECe2Lqdz8aG__dKLFpJPoI','2021-10-25 21:56:24.375867'),('58015n0mfqdxvn0jhdve975br8wqc44h','.eJxVjMsOwiAUBf-FtSEXCggu3fcbyH1QqZo2Ke3K-O_apAvdnpk5L5VxW2veWlnyKOqijDr9boT8KNMO5I7TbdY8T-sykt4VfdCm-1nK83q4fwcVW_3WTFbAo00WQJIDATKWLMOZwQViF4OhLmLoSBKQpxQZBhFHnlPAQb0_1-Q4DQ:1lgP6y:T3UwPLmrhLLLmIVlAr0A7A2uF9OJtd_swUpuuXSYmZ8','2021-05-11 22:55:32.378953'),('6yt3l6qua5f9vwat7g7dafzgayxb45d7','.eJxVjDsOwjAQBe_iGlkb_2JT0nMGa9dr4wBypDipEHeHSCmgfTPzXiLitta49bzEicVZKHH63QjTI7cd8B3bbZZpbusykdwVedAurzPn5-Vw_w4q9vqtLYURULGzYNiiU8YHIo9BsacUHJTADHpMoI0bAmhIaGxx5D2WrAfx_gDQNzdz:1lgdbf:Ctc6SGaIBtq_WZ1wV4L8O-cIP0WiFcQrt07wa75H1e0','2021-05-12 14:24:11.830039'),('7cjtive6ttt94q6yvt0lcdzc01e2p9ps','.eJxVjEEOwiAQRe_C2pChFOm4dN8zkIEZbNVAUtqV8e7apAvd_vfef6lA2zqFrckSZlYXZdTpd4uUHlJ2wHcqt6pTLesyR70r-qBNj5XleT3cv4OJ2vStezuAE4AsiM6yJbTO-JgNg_TQ-Q7Au-QZeoeGB8TcMQqfAZ0kIlLvD7dWN0U:1lgGVp:3wMGVlWThcFnQ3YA-pmK3nv8lOzI_2_ph43A0ohoL0s','2021-05-11 13:44:37.081667'),('7rb83ecqs9yp7ro0y7z1r3vxllk8x4mf','.eJxVjEEOwiAQRe_C2hBgSqe6dN8zkGFgpGpoUtqV8e7apAvd_vfef6lA21rC1vISpqQuyqrT7xaJH7nuIN2p3mbNc12XKepd0QdtepxTfl4P9--gUCvfGj1Ash5YjJE4YKIzS0QSdEPuAbIDtF4su45ZeotknBMfxQuygU69P-eaN_o:1lh0G7:Gpryd2kD5pBBdTsz9IlE8MslEvLfK3rM-EOLZu4bKus','2021-05-13 14:35:27.568639'),('7scmz4okb1bw0lae2v5aupl6iyuxj0hq','.eJxVjDsOwyAQBe9CHaHlj1Om9xnQAuvgJALJ2FWUu0dILpL2zcx7s4DHXsLRaQtrZlcm2OV3i5ieVAfID6z3xlOr-7ZGPhR-0s7nlul1O92_g4K9jNrDgtlKP0VICCkZ5whM1ORBZBu1w0UrcqCkkD560tIo0k5pJIsTss8X6c83xg:1lgIGC:HpmROcik-CfiHJi0LGWSVZM2CIl09vlII7crYg0rRxY','2021-05-11 15:36:36.995710'),('8u141nls8hzccqwpi2ghui5f4g61gj70','.eJxVjEEOwiAQRe_C2hAQyoBL9z0DYWaoVA0kpV0Z765NutDtf-_9l4hpW0vcel7izOIivDj9bpjokesO-J7qrUlqdV1mlLsiD9rl2Dg_r4f7d1BSL9_a-USEYM8GbWalB1ZWDQqNB2XJa0CNXjvLMKGzBHnSQCFwcGZQEzjx_gDWtzdN:1lh1wB:60B0XWDPNdB8PB-6ycxOjzsI0VyZcl8bgSdobhM3_Fw','2021-05-13 16:22:59.910908'),('b1wik1s2oumfyr2uk1dky5tev6ti3ypn','.eJxVjM0OwiAQhN-FsyGwZUE9eu8zkF1-pGogKe3J-O62SQ96m8z3zbyFp3Upfu1p9lMUV6G1OP2WTOGZ6k7ig-q9ydDqMk8sd0UetMuxxfS6He7fQaFetjWjA0RMSSFpQuTIYBTbLasQMoA1JoPJRivO1gFxPONFDWZgtoN14vMF-us3gw:1lwhze:rCQaNAZCUyd9v1Oy6vlSIUxMwi6HP0opghRV_zkHS9A','2021-06-25 22:19:22.393174'),('be2q8i3mpi44qjguy1ad26tugro10oyn','.eJxVjEEOwiAQRe_C2pChFOm4dN8zkIEZbNVAUtqV8e7apAvd_vfef6lA2zqFrckSZlYXZdTpd4uUHlJ2wHcqt6pTLesyR70r-qBNj5XleT3cv4OJ2vStezuAE4AsiM6yJbTO-JgNg_TQ-Q7Au-QZeoeGB8TcMQqfAZ0kIlLvD7dWN0U:1lezbr:5IV4-sy3SQke95_WNpao7E86logT29SajWWlsRH5ukM','2021-05-08 01:29:35.536099'),('bypbej6oh8ceigge0r9due6w2u2dk1ia','.eJxVjMsOwiAUBf-FtSEXCggu3fcbyH1QqZo2Ke3K-O_apAvdnpk5L5VxW2veWlnyKOqijDr9boT8KNMO5I7TbdY8T-sykt4VfdCm-1nK83q4fwcVW_3WTFbAo00WQJIDATKWLMOZwQViF4OhLmLoSBKQpxQZBhFHnlPAQb0_1-Q4DQ:1lglVB:3TO-jKuLxT_Y210QqLkSrdRujLHJY3nsckdCrKLEEe8','2021-05-12 22:50:01.381818'),('c6j064vesfzrj57pqcltyfp8jz1mjckq','.eJxVjEEOwiAQRe_C2hCYMhRcuvcMZGDAVg0kpV0Z765NutDtf-_9lwi0rVPYel7CzOIstNLi9LtGSo9cd8R3qrcmU6vrMke5K_KgXV4b5-flcP8OJurTt07RI7By1ma0I0VfYCigHZDnVIyOjG4oCp13RNr50RszAKqCkBgJxPsDIPs3tA:1mffKu:7K8L5YkhGAbqee4auQA2ewPSq_OTe8klZDIfdzO9yPc','2021-10-27 22:35:08.580240'),('c8s2sf8yhpyl3bc8ktvb39z89e56gh6t','.eJxVjEEOwiAQRe_C2hCYMhRcuvcMZGDAVg0kpV0Z765NutDtf-_9lwi0rVPYel7CzOIstNLi9LtGSo9cd8R3qrcmU6vrMke5K_KgXV4b5-flcP8OJurTt07RI7By1ma0I0VfYCigHZDnVIyOjG4oCp13RNr50RszAKqCkBgJxPsDIPs3tA:1mfv1m:xmtqSnubRhmsGYoS9nQ31x_8c10KilMRCZ1btOGIK1w','2021-10-28 15:20:26.372210'),('di8ur2981rn7hnnsgk4kp897nuh5r4a4','.eJxVjEEOwiAQRe_C2hBgSqe6dN8zkGFgpGpoUtqV8e7apAvd_vfef6lA21rC1vISpqQuyqrT7xaJH7nuIN2p3mbNc12XKepd0QdtepxTfl4P9--gUCvfGj1Ash5YjJE4YKIzS0QSdEPuAbIDtF4su45ZeotknBMfxQuygU69P-eaN_o:1lhMtp:8DsuAI7MxU9zk38vaGocoCsnmKjWcc6248-IOMfL1-o','2021-05-14 14:45:57.648705'),('fat4tztnkbfzfxwz2zul1amuz7q5wqu7','.eJxVjEEOwiAQRe_C2hBgSqe6dN8zkGFgpGpoUtqV8e7apAvd_vfef6lA21rC1vISpqQuyqrT7xaJH7nuIN2p3mbNc12XKepd0QdtepxTfl4P9--gUCvfGj1Ash5YjJE4YKIzS0QSdEPuAbIDtF4su45ZeotknBMfxQuygU69P-eaN_o:1mdP6x:YTtameqLDWM7Rcf-hH9H_7AkVx8WBHBInXiRDLZVwpw','2021-10-21 16:51:23.249614'),('g001pwdv5xrayfbkltfcz9ss3tetfgwq','.eJxVjM0OwiAQhN-FsyGwZUE9eu8zkF1-pGogKe3J-O62SQ96m8z3zbyFp3Upfu1p9lMUV6G1OP2WTOGZ6k7ig-q9ydDqMk8sd0UetMuxxfS6He7fQaFetjWjA0RMSSFpQuTIYBTbLasQMoA1JoPJRivO1gFxPONFDWZgtoN14vMF-us3gw:1m3atc:MGP0GIiM-7If9HBx7MYs1a2EbqdzAgq9XKbNEAutDyY','2021-07-14 22:09:36.150808'),('gt62kupo2wjcp94pq4rkiv7xggsexn0a','.eJxVjEEOgjAQRe_StWloaYfBpXvP0MxMp4IaSCisjHdXEha6_e-9_zKJtnVIW9UljdmcjfPm9DsyyUOnneQ7TbfZyjyty8h2V-xBq73OWZ-Xw_07GKgO37rDtnd9QI8uRuQgoohFwQdQHxtlKcAsUjxjbHtoNJMyYEdtiRDIvD_3TjhQ:1mQ7Ll:vRVQ39_HteVailIXSvyJJvk179Y4_Aty_xEksxbPO8A','2021-09-15 01:15:45.530963'),('h30nztpwpe5ij5ith8h7345b5ap4ouvj','.eJxVjEEOwiAQRe_C2hBgSqe6dN8zkGFgpGpoUtqV8e7apAvd_vfef6lA21rC1vISpqQuyqrT7xaJH7nuIN2p3mbNc12XKepd0QdtepxTfl4P9--gUCvfGj1Ash5YjJE4YKIzS0QSdEPuAbIDtF4su45ZeotknBMfxQuygU69P-eaN_o:1mV3jo:1ncqXqVA-3kuSkKXDoEJphG42-chZErPaW0jNR1xKa8','2021-09-28 16:25:00.064232'),('jm6txbhpcr5vblh61973z1ccil8ol4we','.eJxVjMsOwiAUBf-FtSEXCggu3fcbyH1QqZo2Ke3K-O_apAvdnpk5L5VxW2veWlnyKOqijDr9boT8KNMO5I7TbdY8T-sykt4VfdCm-1nK83q4fwcVW_3WTFbAo00WQJIDATKWLMOZwQViF4OhLmLoSBKQpxQZBhFHnlPAQb0_1-Q4DQ:1lgJA2:lhTaPqK30jlpcDSgsNN6IMvwyeN84aZejpI7lZhc3YE','2021-05-11 16:34:18.105745'),('kjxvwz1vapzpa4ejvo0cy8w7pk5qn6rq','.eJxVjMsOwiAUBf-FtSEXCggu3fcbyH1QqZo2Ke3K-O_apAvdnpk5L5VxW2veWlnyKOqijDr9boT8KNMO5I7TbdY8T-sykt4VfdCm-1nK83q4fwcVW_3WTFbAo00WQJIDATKWLMOZwQViF4OhLmLoSBKQpxQZBhFHnlPAQb0_1-Q4DQ:1lgiWY:kS38w9yfn1LPJex85ZA5xsVZJjvdO8bw3dDMjH9ZsO8','2021-05-12 19:39:14.010979'),('ldkwcl80r022i8omw89sv8kpgetinyxq','.eJxVjEEOwiAQRe_C2pChFOm4dN8zkIEZbNVAUtqV8e7apAvd_vfef6lA2zqFrckSZlYXZdTpd4uUHlJ2wHcqt6pTLesyR70r-qBNj5XleT3cv4OJ2vStezuAE4AsiM6yJbTO-JgNg_TQ-Q7Au-QZeoeGB8TcMQqfAZ0kIlLvD7dWN0U:1lfCjo:HxAN3nLYKAFRGaqvouFWGNmDrsa18u3HCq91k18dSi4','2021-05-08 15:30:40.191119'),('lox1lhuj6gbre83yuj9bnksvxw4rly21','.eJxVjEEOwiAQRe_C2hBgSqe6dN8zkGFgpGpoUtqV8e7apAvd_vfef6lA21rC1vISpqQuyqrT7xaJH7nuIN2p3mbNc12XKepd0QdtepxTfl4P9--gUCvfGj1Ash5YjJE4YKIzS0QSdEPuAbIDtF4su45ZeotknBMfxQuygU69P-eaN_o:1lisdW:tbKsstR1pANrx93S6D1-XsE0Sq4EAKN9YNVuonXUHSU','2021-05-18 18:51:22.180155'),('m5rcjgf43f2gbkwhjimy4jw95fbpv7o6','.eJxVjEEOwiAQRe_C2pChFOm4dN8zkIEZbNVAUtqV8e7apAvd_vfef6lA2zqFrckSZlYXZdTpd4uUHlJ2wHcqt6pTLesyR70r-qBNj5XleT3cv4OJ2vStezuAE4AsiM6yJbTO-JgNg_TQ-Q7Au-QZeoeGB8TcMQqfAZ0kIlLvD7dWN0U:1lezoK:2fMY1A7eXCi4uIst9MNxAwCEIem1EdtaxWrp1NUHYAw','2021-05-08 01:42:28.095527'),('mjx4ckn4k4ngloyhfek326pgy6nsac6i','.eJxVjMsOwiAUBf-FtSEXCggu3fcbyH1QqZo2Ke3K-O_apAvdnpk5L5VxW2veWlnyKOqijDr9boT8KNMO5I7TbdY8T-sykt4VfdCm-1nK83q4fwcVW_3WTFbAo00WQJIDATKWLMOZwQViF4OhLmLoSBKQpxQZBhFHnlPAQb0_1-Q4DQ:1lgIw3:Fa_2ytd2Zp7Qtn5gOTqePcP-4XIUWcCmW7IrYBnt-ks','2021-05-11 16:19:51.822566'),('mm7ioju5meu1yy2oze86bvba9w1dqheh','.eJxVjEEOwiAQRe_C2hBgSqe6dN8zkGFgpGpoUtqV8e7apAvd_vfef6lA21rC1vISpqQuyqrT7xaJH7nuIN2p3mbNc12XKepd0QdtepxTfl4P9--gUCvfGj1Ash5YjJE4YKIzS0QSdEPuAbIDtF4su45ZeotknBMfxQuygU69P-eaN_o:1mV8Kb:JULAxl01WfGMRHn8oL4-V2Icmd8sv8mh8-FLXuF9qRM','2021-09-28 21:19:17.179647'),('n0lyq4yzwy33ffu3pmlepmu7s1dlcj73','.eJxVjEEOwiAQRe_C2hCYMhRcuvcMZGDAVg0kpV0Z765NutDtf-_9lwi0rVPYel7CzOIstNLi9LtGSo9cd8R3qrcmU6vrMke5K_KgXV4b5-flcP8OJurTt07RI7By1ma0I0VfYCigHZDnVIyOjG4oCp13RNr50RszAKqCkBgJxPsDIPs3tA:1mfY5D:OiZk2PrVpO1ENNGTtPgEJ1rEyBPWTa7hBLhgDCovs20','2021-10-27 14:50:27.465524'),('nt1j2a8ey5b25blod7jlo2mvib87yhak','.eJxVjEEOwiAQRe_C2hCYMhRcuvcMZGDAVg0kpV0Z765NutDtf-_9lwi0rVPYel7CzOIstNLi9LtGSo9cd8R3qrcmU6vrMke5K_KgXV4b5-flcP8OJurTt07RI7By1ma0I0VfYCigHZDnVIyOjG4oCp13RNr50RszAKqCkBgJxPsDIPs3tA:1mfeg9:vimJ3WxJxlfQjwiGQO2plC1HH7WqelYAihvxiDoq_ao','2021-10-27 21:53:01.510958'),('pvdpav9m8ai5385vq6wblg0s15menjq7','.eJxVjEEOwiAQRe_C2hBgSqe6dN8zkGFgpGpoUtqV8e7apAvd_vfef6lA21rC1vISpqQuyqrT7xaJH7nuIN2p3mbNc12XKepd0QdtepxTfl4P9--gUCvfGj1Ash5YjJE4YKIzS0QSdEPuAbIDtF4su45ZeotknBMfxQuygU69P-eaN_o:1lx1Kb:vw3EVh5uMs0PqiTqZ4Djjm0nWu-e9clf4ks970YQ4a8','2021-06-26 18:58:17.617669'),('rn2qtafs8ioaaqbnx0zn1baiajw7ksic','.eJxVjEEOwiAQRe_C2hBgSqe6dN8zkGFgpGpoUtqV8e7apAvd_vfef6lA21rC1vISpqQuyqrT7xaJH7nuIN2p3mbNc12XKepd0QdtepxTfl4P9--gUCvfGj1Ash5YjJE4YKIzS0QSdEPuAbIDtF4su45ZeotknBMfxQuygU69P-eaN_o:1md5dO:PjgD_EO7mtXoL14mT0Cu2O6_Z8PN_7iwaxYurv8Bh4c','2021-10-20 20:03:34.661088'),('seua2i7lycwyl8q0m2e95a4wbpdyyrcc','.eJxVjEEOwiAQRe_C2hCYMhRcuvcMZGDAVg0kpV0Z765NutDtf-_9lwi0rVPYel7CzOIstNLi9LtGSo9cd8R3qrcmU6vrMke5K_KgXV4b5-flcP8OJurTt07RI7By1ma0I0VfYCigHZDnVIyOjG4oCp13RNr50RszAKqCkBgJxPsDIPs3tA:1mfuuN:UVEvQ5Kivt8fFukx6vD3dkiFb79oGIWfKzaX2m3sT-s','2021-10-28 15:12:47.399867'),('tym6a7hkowx9hf7exyznf2yqqq94ksif','.eJxVjMsOwiAQRf-FtSE8Zgpx6d5vIAMMUjWQlHZl_Hdt0oVu7znnvkSgba1hG7yEOYuz0EqcfsdI6cFtJ_lO7dZl6m1d5ih3RR50yGvP_Lwc7t9BpVG_NRQCDYVNdODZIUxkMRdKaJOZQCEhJZUtOvYY0VtdioPkSSs2JpJ4fwAItDgj:1lhAEE:dwUPTk3qBvWDMp28U7YMhPVgFq0Dr1-rMH0E1jQvfRI','2021-05-14 01:14:10.615686'),('ul1t8hsmgcpc2augt1crh483mn8p1rg5','.eJxVjEEOwiAQRe_C2hBgSqe6dN8zkGFgpGpoUtqV8e7apAvd_vfef6lA21rC1vISpqQuyqrT7xaJH7nuIN2p3mbNc12XKepd0QdtepxTfl4P9--gUCvfGj1Ash5YjJE4YKIzS0QSdEPuAbIDtF4su45ZeotknBMfxQuygU69P-eaN_o:1lgmA3:Ty4bhpAvc4Di_H5uaShWy51_sHRmjAiQT5UJiwOPe6I','2021-05-12 23:32:15.373093'),('uorve2gvshuy6sxtzvdtznv31iwavl5q','.eJxVjEEOwiAQRe_C2hBgSqe6dN8zkGFgpGpoUtqV8e7apAvd_vfef6lA21rC1vISpqQuyqrT7xaJH7nuIN2p3mbNc12XKepd0QdtepxTfl4P9--gUCvfGj1Ash5YjJE4YKIzS0QSdEPuAbIDtF4su45ZeotknBMfxQuygU69P-eaN_o:1ma72i:nWVpU911OnoNkoRK2IEsZQ2UXjxNupvG7MyNjMsmUb4','2021-10-12 14:57:24.119881'),('v5facynv92mbvb8d8dci4rgt9745nwys','.eJxVjEEOwiAQRe_C2hBgSqe6dN8zkGFgpGpoUtqV8e7apAvd_vfef6lA21rC1vISpqQuyqrT7xaJH7nuIN2p3mbNc12XKepd0QdtepxTfl4P9--gUCvfGj1Ash5YjJE4YKIzS0QSdEPuAbIDtF4su45ZeotknBMfxQuygU69P-eaN_o:1lhSHW:GrXTOzxlVacQdECL2mVwz-aFXFgz9uRNXgf4cScy990','2021-05-14 20:30:46.218243'),('vdrsxgcbboowij45o8b6febl02m6uja4','.eJxVjEEOwiAQRe_C2hCYMhRcuvcMZGDAVg0kpV0Z765NutDtf-_9lwi0rVPYel7CzOIstNLi9LtGSo9cd8R3qrcmU6vrMke5K_KgXV4b5-flcP8OJurTt07RI7By1ma0I0VfYCigHZDnVIyOjG4oCp13RNr50RszAKqCkBgJxPsDIPs3tA:1mfYMw:jMAXxGtoyCwnTOVyKEX_QIp7T2uw9XZMB9C5K5kLxYA','2021-10-27 15:08:46.975558'),('vnsl4d3nygzromibft7o5ow41c26movw','.eJxVjEEOwiAQRe_C2hCYMhRcuvcMZGDAVg0kpV0Z765NutDtf-_9lwi0rVPYel7CzOIstNLi9LtGSo9cd8R3qrcmU6vrMke5K_KgXV4b5-flcP8OJurTt07RI7By1ma0I0VfYCigHZDnVIyOjG4oCp13RNr50RszAKqCkBgJxPsDIPs3tA:1mfgBR:3YQ-YOZI9KBtbij4YmqXzn-Vw_gX5GFUcnKvp-aUCiU','2021-10-27 23:29:25.595827'),('vsbnd7fian9bnx08hl7grcgxqn9g6ggf','.eJxVjEEOwiAQRe_C2hBgSqe6dN8zkGFgpGpoUtqV8e7apAvd_vfef6lA21rC1vISpqQuyqrT7xaJH7nuIN2p3mbNc12XKepd0QdtepxTfl4P9--gUCvfGj1Ash5YjJE4YKIzS0QSdEPuAbIDtF4su45ZeotknBMfxQuygU69P-eaN_o:1lwiWL:uiF5ke_gUQC8eAXYU6yVMrcPo4gI1qZ_Ya154HMVNiE','2021-06-25 22:53:09.541031'),('xngfn2wbjqr2zaadlhac4ng42upohhle','.eJxVjEEOwiAQRe_C2pARCrYu3fcMZGBmpGogKe3KeHfbpAvd_vfef6uA65LD2ngOE6mrsur0u0VMTy47oAeWe9WplmWeot4VfdCmx0r8uh3u30HGlrcaEYjAgneO0iCC514odsCGvDgxFgUkyUUYo0VIG_MgXSTTD-wNqM8XH8s5aw:1lgdxW:sSyBH19Um6mwc7GhbcHygzIpxsz8IVybnSnNa8bgkXE','2021-05-12 14:46:46.477794');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instance_account`
--

DROP TABLE IF EXISTS `instance_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(128) NOT NULL,
  `host` varchar(64) NOT NULL,
  `password` varchar(128) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `sys_time` datetime(6) NOT NULL,
  `instance_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `instance_account_instance_id_user_host_514c1ac6_uniq` (`instance_id`,`user`,`host`) USING BTREE,
  CONSTRAINT `instance_account_instance_id_53a7a305_fk_sql_instance_id` FOREIGN KEY (`instance_id`) REFERENCES `sql_instance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instance_account`
--

LOCK TABLES `instance_account` WRITE;
/*!40000 ALTER TABLE `instance_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `instance_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instance_database`
--

DROP TABLE IF EXISTS `instance_database`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance_database` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db_name` varchar(128) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `owner_display` varchar(50) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `sys_time` datetime(6) NOT NULL,
  `instance_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `instance_database_instance_id_db_name_d8700935_uniq` (`instance_id`,`db_name`) USING BTREE,
  CONSTRAINT `instance_database_instance_id_22c69243_fk_sql_instance_id` FOREIGN KEY (`instance_id`) REFERENCES `sql_instance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instance_database`
--

LOCK TABLES `instance_database` WRITE;
/*!40000 ALTER TABLE `instance_database` DISABLE KEYS */;
/*!40000 ALTER TABLE `instance_database` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mysql_slow_query_review`
--

DROP TABLE IF EXISTS `mysql_slow_query_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mysql_slow_query_review` (
  `checksum` char(32) NOT NULL,
  `fingerprint` longtext NOT NULL,
  `sample` longtext NOT NULL,
  `first_seen` datetime(6) DEFAULT NULL,
  `last_seen` datetime(6) DEFAULT NULL,
  `reviewed_by` varchar(20) DEFAULT NULL,
  `reviewed_on` datetime(6) DEFAULT NULL,
  `comments` longtext,
  `reviewed_status` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`checksum`) USING BTREE,
  KEY `idx_last_seen` (`last_seen`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mysql_slow_query_review`
--

LOCK TABLES `mysql_slow_query_review` WRITE;
/*!40000 ALTER TABLE `mysql_slow_query_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `mysql_slow_query_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mysql_slow_query_review_history`
--

DROP TABLE IF EXISTS `mysql_slow_query_review_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mysql_slow_query_review_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname_max` varchar(64) NOT NULL,
  `client_max` varchar(64) DEFAULT NULL,
  `user_max` varchar(64) NOT NULL,
  `db_max` varchar(64) DEFAULT NULL,
  `checksum` char(32) NOT NULL,
  `sample` longtext NOT NULL,
  `ts_min` datetime(6) NOT NULL,
  `ts_max` datetime(6) NOT NULL,
  `ts_cnt` float DEFAULT NULL,
  `Query_time_sum` float DEFAULT NULL,
  `Query_time_min` float DEFAULT NULL,
  `Query_time_max` float DEFAULT NULL,
  `Query_time_pct_95` float DEFAULT NULL,
  `Query_time_stddev` float DEFAULT NULL,
  `Query_time_median` float DEFAULT NULL,
  `Lock_time_sum` float DEFAULT NULL,
  `Lock_time_min` float DEFAULT NULL,
  `Lock_time_max` float DEFAULT NULL,
  `Lock_time_pct_95` float DEFAULT NULL,
  `Lock_time_stddev` float DEFAULT NULL,
  `Lock_time_median` float DEFAULT NULL,
  `Rows_sent_sum` float DEFAULT NULL,
  `Rows_sent_min` float DEFAULT NULL,
  `Rows_sent_max` float DEFAULT NULL,
  `Rows_sent_pct_95` float DEFAULT NULL,
  `Rows_sent_stddev` float DEFAULT NULL,
  `Rows_sent_median` float DEFAULT NULL,
  `Rows_examined_sum` float DEFAULT NULL,
  `Rows_examined_min` float DEFAULT NULL,
  `Rows_examined_max` float DEFAULT NULL,
  `Rows_examined_pct_95` float DEFAULT NULL,
  `Rows_examined_stddev` float DEFAULT NULL,
  `Rows_examined_median` float DEFAULT NULL,
  `Rows_affected_sum` float DEFAULT NULL,
  `Rows_affected_min` float DEFAULT NULL,
  `Rows_affected_max` float DEFAULT NULL,
  `Rows_affected_pct_95` float DEFAULT NULL,
  `Rows_affected_stddev` float DEFAULT NULL,
  `Rows_affected_median` float DEFAULT NULL,
  `Rows_read_sum` float DEFAULT NULL,
  `Rows_read_min` float DEFAULT NULL,
  `Rows_read_max` float DEFAULT NULL,
  `Rows_read_pct_95` float DEFAULT NULL,
  `Rows_read_stddev` float DEFAULT NULL,
  `Rows_read_median` float DEFAULT NULL,
  `Merge_passes_sum` float DEFAULT NULL,
  `Merge_passes_min` float DEFAULT NULL,
  `Merge_passes_max` float DEFAULT NULL,
  `Merge_passes_pct_95` float DEFAULT NULL,
  `Merge_passes_stddev` float DEFAULT NULL,
  `Merge_passes_median` float DEFAULT NULL,
  `InnoDB_IO_r_ops_min` float DEFAULT NULL,
  `InnoDB_IO_r_ops_max` float DEFAULT NULL,
  `InnoDB_IO_r_ops_pct_95` float DEFAULT NULL,
  `InnoDB_IO_r_ops_stddev` float DEFAULT NULL,
  `InnoDB_IO_r_ops_median` float DEFAULT NULL,
  `InnoDB_IO_r_bytes_min` float DEFAULT NULL,
  `InnoDB_IO_r_bytes_max` float DEFAULT NULL,
  `InnoDB_IO_r_bytes_pct_95` float DEFAULT NULL,
  `InnoDB_IO_r_bytes_stddev` float DEFAULT NULL,
  `InnoDB_IO_r_bytes_median` float DEFAULT NULL,
  `InnoDB_IO_r_wait_min` float DEFAULT NULL,
  `InnoDB_IO_r_wait_max` float DEFAULT NULL,
  `InnoDB_IO_r_wait_pct_95` float DEFAULT NULL,
  `InnoDB_IO_r_wait_stddev` float DEFAULT NULL,
  `InnoDB_IO_r_wait_median` float DEFAULT NULL,
  `InnoDB_rec_lock_wait_min` float DEFAULT NULL,
  `InnoDB_rec_lock_wait_max` float DEFAULT NULL,
  `InnoDB_rec_lock_wait_pct_95` float DEFAULT NULL,
  `InnoDB_rec_lock_wait_stddev` float DEFAULT NULL,
  `InnoDB_rec_lock_wait_median` float DEFAULT NULL,
  `InnoDB_queue_wait_min` float DEFAULT NULL,
  `InnoDB_queue_wait_max` float DEFAULT NULL,
  `InnoDB_queue_wait_pct_95` float DEFAULT NULL,
  `InnoDB_queue_wait_stddev` float DEFAULT NULL,
  `InnoDB_queue_wait_median` float DEFAULT NULL,
  `InnoDB_pages_distinct_min` float DEFAULT NULL,
  `InnoDB_pages_distinct_max` float DEFAULT NULL,
  `InnoDB_pages_distinct_pct_95` float DEFAULT NULL,
  `InnoDB_pages_distinct_stddev` float DEFAULT NULL,
  `InnoDB_pages_distinct_median` float DEFAULT NULL,
  `QC_Hit_cnt` float DEFAULT NULL,
  `QC_Hit_sum` float DEFAULT NULL,
  `Full_scan_cnt` float DEFAULT NULL,
  `Full_scan_sum` float DEFAULT NULL,
  `Full_join_cnt` float DEFAULT NULL,
  `Full_join_sum` float DEFAULT NULL,
  `Tmp_table_cnt` float DEFAULT NULL,
  `Tmp_table_sum` float DEFAULT NULL,
  `Tmp_table_on_disk_cnt` float DEFAULT NULL,
  `Tmp_table_on_disk_sum` float DEFAULT NULL,
  `Filesort_cnt` float DEFAULT NULL,
  `Filesort_sum` float DEFAULT NULL,
  `Filesort_on_disk_cnt` float DEFAULT NULL,
  `Filesort_on_disk_sum` float DEFAULT NULL,
  `Bytes_sum` float DEFAULT NULL,
  `Bytes_min` float DEFAULT NULL,
  `Bytes_max` float DEFAULT NULL,
  `Bytes_pct_95` float DEFAULT NULL,
  `Bytes_stddev` float DEFAULT NULL,
  `Bytes_median` float DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `checksum` (`checksum`,`ts_min`,`ts_max`) USING BTREE,
  KEY `idx_hostname_max_ts_min` (`hostname_max`,`ts_min`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mysql_slow_query_review_history`
--

LOCK TABLES `mysql_slow_query_review_history` WRITE;
/*!40000 ALTER TABLE `mysql_slow_query_review_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mysql_slow_query_review_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `param_history`
--

DROP TABLE IF EXISTS `param_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `param_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variable_name` varchar(64) NOT NULL,
  `old_var` varchar(1024) NOT NULL,
  `new_var` varchar(1024) NOT NULL,
  `set_sql` varchar(1024) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `user_display` varchar(50) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `instance_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `param_history_instance_id_601e8d3f_fk_sql_instance_id` (`instance_id`) USING BTREE,
  CONSTRAINT `param_history_instance_id_601e8d3f_fk_sql_instance_id` FOREIGN KEY (`instance_id`) REFERENCES `sql_instance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `param_history`
--

LOCK TABLES `param_history` WRITE;
/*!40000 ALTER TABLE `param_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `param_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `param_template`
--

DROP TABLE IF EXISTS `param_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `param_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db_type` varchar(20) NOT NULL,
  `variable_name` varchar(64) NOT NULL,
  `default_value` varchar(1024) NOT NULL,
  `editable` tinyint(1) NOT NULL,
  `valid_values` varchar(1024) NOT NULL,
  `description` varchar(1024) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `sys_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `param_template_db_type_variable_name_139c76a6_uniq` (`db_type`,`variable_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `param_template`
--

LOCK TABLES `param_template` WRITE;
/*!40000 ALTER TABLE `param_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `param_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `query_log`
--

DROP TABLE IF EXISTS `query_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `query_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instance_name` varchar(50) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `sqllog` longtext NOT NULL,
  `effect_row` bigint(20) NOT NULL,
  `cost_time` varchar(10) NOT NULL,
  `username` varchar(30) NOT NULL,
  `user_display` varchar(50) NOT NULL,
  `priv_check` tinyint(1) NOT NULL,
  `hit_rule` tinyint(1) NOT NULL,
  `masking` tinyint(1) NOT NULL,
  `favorite` tinyint(1) NOT NULL,
  `alias` varchar(64) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `sys_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `query_log`
--

LOCK TABLES `query_log` WRITE;
/*!40000 ALTER TABLE `query_log` DISABLE KEYS */;
INSERT INTO `query_log` VALUES (1,'腾讯测试','activity_center_manage','explain select\n  id ,activity_id\nfrom\n  acquire_coupon_record\nlimit\n  10;',1,'0.001866','admin','',1,0,0,0,'','2021-05-11 10:49:58.266134','2021-05-11 10:49:58.266152'),(2,'腾讯测试','activity_center_manage','explain select\n  id ,activity_id\nfrom\n  acquire_coupon_record\nlimit\n  10;',1,'0.001938','admin','',1,0,0,0,'','2021-05-11 10:50:11.594101','2021-05-11 10:50:11.594119'),(3,'腾讯测试','app_api','select\n  *\nfrom\n account_vehicle\nlimit 10;',10,'0.002129','admin','',1,0,0,0,'','2021-05-11 10:53:20.739855','2021-05-11 10:53:20.739883'),(4,'腾讯测试','app_api','explain select\n  *\nfrom\n account_vehicle\nlimit\n  10;',1,'0.001823','admin','',1,0,0,0,'','2021-05-11 10:53:42.747492','2021-05-11 10:53:42.747511'),(5,'腾讯测试','app_api','select\n  *\nfrom\n  account_vehicle\nlimit 10;',10,'0.002774','admin','',1,0,0,0,'','2021-05-11 10:53:46.491798','2021-05-11 10:53:46.491817'),(6,'MySQL腾讯测试','vcd','select * FROM tm_vehicle limit 100;',100,'0.005136','tulj','屠鲁俊',1,0,0,0,'','2021-05-13 20:12:52.503427','2021-05-13 20:12:52.503449'),(7,'MySQL腾讯测试','app_api_bak','explain select * from appraise_item;',1,'0.0031','admin','',1,0,0,0,'','2021-05-18 11:43:37.709059','2021-05-18 11:43:37.709096'),(8,'MySQL腾讯测试','operation_detection_service','explain select * from detection_record;',1,'0.092796','liujj','刘晋京',1,0,0,0,'','2021-09-14 19:27:32.260121','2021-09-14 19:27:32.260151'),(9,'MySQL腾讯测试','operation_detection_service','select * from detection_record limit 100;',100,'0.007065','liujj','刘晋京',1,0,0,0,'','2021-09-14 19:27:37.598220','2021-09-14 19:27:37.598246');
/*!40000 ALTER TABLE `query_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `query_privileges`
--

DROP TABLE IF EXISTS `query_privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `query_privileges` (
  `privilege_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) NOT NULL,
  `user_display` varchar(50) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `valid_date` date NOT NULL,
  `limit_num` int(11) NOT NULL,
  `priv_type` int(11) NOT NULL,
  `is_deleted` int(11) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `sys_time` datetime(6) NOT NULL,
  `instance_id` int(11) NOT NULL,
  PRIMARY KEY (`privilege_id`) USING BTREE,
  KEY `query_privileges_instance_id_047fcde2_fk_sql_instance_id` (`instance_id`) USING BTREE,
  KEY `query_privileges_user_name_instance_id_db__ed2ad8a3_idx` (`user_name`,`instance_id`,`db_name`,`valid_date`) USING BTREE,
  CONSTRAINT `query_privileges_instance_id_047fcde2_fk_sql_instance_id` FOREIGN KEY (`instance_id`) REFERENCES `sql_instance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `query_privileges`
--

LOCK TABLES `query_privileges` WRITE;
/*!40000 ALTER TABLE `query_privileges` DISABLE KEYS */;
/*!40000 ALTER TABLE `query_privileges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `query_privileges_apply`
--

DROP TABLE IF EXISTS `query_privileges_apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `query_privileges_apply` (
  `apply_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `group_name` varchar(100) NOT NULL,
  `title` varchar(50) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `user_display` varchar(50) NOT NULL,
  `db_list` longtext NOT NULL,
  `table_list` longtext NOT NULL,
  `valid_date` date NOT NULL,
  `limit_num` int(11) NOT NULL,
  `priv_type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `audit_auth_groups` varchar(255) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `sys_time` datetime(6) NOT NULL,
  `instance_id` int(11) NOT NULL,
  PRIMARY KEY (`apply_id`) USING BTREE,
  KEY `query_privileges_apply_instance_id_bc03347f_fk_sql_instance_id` (`instance_id`) USING BTREE,
  CONSTRAINT `query_privileges_apply_instance_id_bc03347f_fk_sql_instance_id` FOREIGN KEY (`instance_id`) REFERENCES `sql_instance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `query_privileges_apply`
--

LOCK TABLES `query_privileges_apply` WRITE;
/*!40000 ALTER TABLE `query_privileges_apply` DISABLE KEYS */;
/*!40000 ALTER TABLE `query_privileges_apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_group`
--

DROP TABLE IF EXISTS `resource_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) NOT NULL,
  `group_parent_id` bigint(20) NOT NULL,
  `group_sort` int(11) NOT NULL,
  `group_level` int(11) NOT NULL,
  `ding_webhook` varchar(255) NOT NULL,
  `feishu_webhook` varchar(255) NOT NULL,
  `qywx_webhook` varchar(255) NOT NULL,
  `is_deleted` int(11) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `sys_time` datetime(6) NOT NULL,
  PRIMARY KEY (`group_id`) USING BTREE,
  UNIQUE KEY `group_name` (`group_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_group`
--

LOCK TABLES `resource_group` WRITE;
/*!40000 ALTER TABLE `resource_group` DISABLE KEYS */;
INSERT INTO `resource_group` VALUES (1,'俄罗斯腾讯云测试环境',0,1,1,'','','',0,'2021-05-07 19:56:19.400734','2021-05-07 19:56:19.400759');
/*!40000 ALTER TABLE `resource_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sql_config`
--

DROP TABLE IF EXISTS `sql_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sql_config` (
  `item` varchar(200) NOT NULL,
  `value` varchar(500) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`item`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sql_config`
--

LOCK TABLES `sql_config` WRITE;
/*!40000 ALTER TABLE `sql_config` DISABLE KEYS */;
INSERT INTO `sql_config` VALUES ('admin_query_limit','2WoAv5elmS4RuVQMAbzFnw==',''),('archery_base_url','BnJSUXJxlgf5K8lnvoXrLg==',''),('auto_review','vFO44abhNH4MJdz3j7GvdA==',''),('auto_review_max_update_rows','2WoAv5elmS4RuVQMAbzFnw==',''),('auto_review_regex','a97iReog855EER-wzmIsQebm4jxJO8hJD7MK-HHF87o=',''),('auto_review_tag','1LveBD3dNPFM-wbUjCQa_g==',''),('auto_review_wrong','suwCkkNSpbcRAXNtf2cZ6g==',''),('binlog2sql','BnJSUXJxlgf5K8lnvoXrLg==',''),('critical_ddl_regex','a97iReog855EER-wzmIsQebm4jxJO8hJD7MK-HHF87o=',''),('data_masking','P5RfC56v4fDTr-ZDK1lSUQ==',''),('ddl_notify_auth_group','BnJSUXJxlgf5K8lnvoXrLg==',''),('default_auth_group','-UMzqg6gCBt6UopG4QyGzg==',''),('default_resource_group','8bw5eTwE8fgz3Ltl6-3Gz97oR6VE_qR3OIxGJUKQOeE=',''),('ding','P5RfC56v4fDTr-ZDK1lSUQ==',''),('ding_agent_id','BnJSUXJxlgf5K8lnvoXrLg==',''),('ding_app_key','BnJSUXJxlgf5K8lnvoXrLg==',''),('ding_app_secret','BnJSUXJxlgf5K8lnvoXrLg==',''),('ding_archery_username','BnJSUXJxlgf5K8lnvoXrLg==',''),('ding_dept_ids','BnJSUXJxlgf5K8lnvoXrLg==',''),('ding_to_person','BnJSUXJxlgf5K8lnvoXrLg==',''),('disable_star','P5RfC56v4fDTr-ZDK1lSUQ==',''),('enable_backup_switch','vFO44abhNH4MJdz3j7GvdA==',''),('feishu','BnJSUXJxlgf5K8lnvoXrLg==',''),('feishu_appid','BnJSUXJxlgf5K8lnvoXrLg==',''),('feishu_app_secret','BnJSUXJxlgf5K8lnvoXrLg==',''),('feishu_webhook','BnJSUXJxlgf5K8lnvoXrLg==',''),('go_inception_host','uzdEXfir7gsQYZajIGWxyA==',''),('go_inception_port','D_iAIoesr7mmjPtiaS5Qeg==',''),('inception_host','3KgiIN957lI2CYEkUwgCVA==',''),('inception_port','m_r65OyTgjNCnwfBdaER4Q==',''),('inception_remote_backup_host','uzdEXfir7gsQYZajIGWxyA==',''),('inception_remote_backup_password','qiEtMuSKxT4G9ynhuU9prQ==',''),('inception_remote_backup_port','gzj9jvgRHy5zl-GMtpamug==',''),('inception_remote_backup_user','mgc-Oh9sGUWwSFhtQFio4A==',''),('index_path_url','BnJSUXJxlgf5K8lnvoXrLg==',''),('lock_cnt_threshold','-NYUknD73AiYxOd8wLRrUA==',''),('lock_time_threshold','-NYUknD73AiYxOd8wLRrUA==',''),('mail','P5RfC56v4fDTr-ZDK1lSUQ==',''),('mail_smtp_password','BnJSUXJxlgf5K8lnvoXrLg==',''),('mail_smtp_port','BnJSUXJxlgf5K8lnvoXrLg==',''),('mail_smtp_server','BnJSUXJxlgf5K8lnvoXrLg==',''),('mail_smtp_user','BnJSUXJxlgf5K8lnvoXrLg==',''),('mail_ssl','P5RfC56v4fDTr-ZDK1lSUQ==',''),('manual','P5RfC56v4fDTr-ZDK1lSUQ==',''),('max_execution_time','11yHgkZr8RmMlbmKo6SvIw==',''),('query_check','P5RfC56v4fDTr-ZDK1lSUQ==',''),('qywx_webhook','BnJSUXJxlgf5K8lnvoXrLg==',''),('sign_up_enabled','vFO44abhNH4MJdz3j7GvdA==',''),('soar','q8e6-_vUJSOu1mDqHKuKD4MrGzLDgsG0j2oG8Heh0Ys=',''),('soar_test_dsn','0D6pHX2tpv_vCcBOmvMwQQ==',''),('sqladvisor','q8e6-_vUJSOu1mDqHKuKD50fEFljmKzQHV_zlYmII2N5fE2MkhmzjPVSKFaA2hK0',''),('wx','BnJSUXJxlgf5K8lnvoXrLg==',''),('wx_agent_id','BnJSUXJxlgf5K8lnvoXrLg==',''),('wx_app_secret','BnJSUXJxlgf5K8lnvoXrLg==',''),('wx_corpid','BnJSUXJxlgf5K8lnvoXrLg==','');
/*!40000 ALTER TABLE `sql_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sql_instance`
--

DROP TABLE IF EXISTS `sql_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sql_instance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instance_name` varchar(50) NOT NULL,
  `type` varchar(6) NOT NULL,
  `db_type` varchar(20) NOT NULL,
  `host` varchar(200) NOT NULL,
  `port` int(11) NOT NULL,
  `user` varchar(200) NOT NULL,
  `password` varchar(300) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `charset` varchar(20) NOT NULL,
  `service_name` varchar(50) DEFAULT NULL,
  `sid` varchar(50) DEFAULT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `tunnel_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `instance_name` (`instance_name`) USING BTREE,
  KEY `sql_instance_tunnel_id_99377638_fk_ssh_tunnel_id` (`tunnel_id`) USING BTREE,
  CONSTRAINT `sql_instance_tunnel_id_99377638_fk_ssh_tunnel_id` FOREIGN KEY (`tunnel_id`) REFERENCES `ssh_tunnel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sql_instance`
--

LOCK TABLES `sql_instance` WRITE;
/*!40000 ALTER TABLE `sql_instance` DISABLE KEYS */;
INSERT INTO `sql_instance` VALUES (2,'MySQL腾讯测试','master','mysql','10.35.1.4',3306,'mgc-Oh9sGUWwSFhtQFio4A==','hSDhxRcgOGJe6htOkGtDXP1ekm7yohh644sPIoGIfZQ=','','',NULL,NULL,'2021-05-12 15:39:20.258484','2021-09-28 11:19:39.337211',NULL),(3,'腾讯测试redis','master','redis','10.35.1.7',27017,'BnJSUXJxlgf5K8lnvoXrLg==','txW2U0ga5SWiTptw_h5WP8crvM4RPXHO7LgMylmrPFU=','','',NULL,NULL,'2021-05-14 09:43:01.452081','2021-05-14 09:53:02.679372',NULL),(4,'Mongot腾讯测试10.35.1.6','master','mongo','10.35.1.6',27017,'DXbfnpkXhu91QoP0S8KT9A==','dvTz6tTiyzmxeEdtT9spjQ==','admin','',NULL,NULL,'2021-06-25 17:34:34.287671','2021-06-25 17:52:49.563734',NULL);
/*!40000 ALTER TABLE `sql_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sql_instance_instance_tag`
--

DROP TABLE IF EXISTS `sql_instance_instance_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sql_instance_instance_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instance_id` int(11) NOT NULL,
  `instancetag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `sql_instance_instance_ta_instance_id_instancetag__2797cd96_uniq` (`instance_id`,`instancetag_id`) USING BTREE,
  KEY `sql_instance_instanc_instancetag_id_d18b0067_fk_sql_insta` (`instancetag_id`) USING BTREE,
  CONSTRAINT `sql_instance_instanc_instance_id_35a5a19d_fk_sql_insta` FOREIGN KEY (`instance_id`) REFERENCES `sql_instance` (`id`),
  CONSTRAINT `sql_instance_instanc_instancetag_id_d18b0067_fk_sql_insta` FOREIGN KEY (`instancetag_id`) REFERENCES `sql_instance_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sql_instance_instance_tag`
--

LOCK TABLES `sql_instance_instance_tag` WRITE;
/*!40000 ALTER TABLE `sql_instance_instance_tag` DISABLE KEYS */;
INSERT INTO `sql_instance_instance_tag` VALUES (3,2,1),(4,2,2),(5,3,1),(6,3,2),(8,4,2);
/*!40000 ALTER TABLE `sql_instance_instance_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sql_instance_resource_group`
--

DROP TABLE IF EXISTS `sql_instance_resource_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sql_instance_resource_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instance_id` int(11) NOT NULL,
  `resourcegroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `sql_instance_resource_gr_instance_id_resourcegrou_0dbfb149_uniq` (`instance_id`,`resourcegroup_id`) USING BTREE,
  KEY `sql_instance_resourc_resourcegroup_id_1903be9b_fk_resource_` (`resourcegroup_id`) USING BTREE,
  CONSTRAINT `sql_instance_resourc_instance_id_30cfcc32_fk_sql_insta` FOREIGN KEY (`instance_id`) REFERENCES `sql_instance` (`id`),
  CONSTRAINT `sql_instance_resourc_resourcegroup_id_1903be9b_fk_resource_` FOREIGN KEY (`resourcegroup_id`) REFERENCES `resource_group` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sql_instance_resource_group`
--

LOCK TABLES `sql_instance_resource_group` WRITE;
/*!40000 ALTER TABLE `sql_instance_resource_group` DISABLE KEYS */;
INSERT INTO `sql_instance_resource_group` VALUES (2,2,1),(3,3,1),(4,4,1);
/*!40000 ALTER TABLE `sql_instance_resource_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sql_instance_tag`
--

DROP TABLE IF EXISTS `sql_instance_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sql_instance_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_code` varchar(20) NOT NULL,
  `tag_name` varchar(20) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `tag_code` (`tag_code`) USING BTREE,
  UNIQUE KEY `tag_name` (`tag_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sql_instance_tag`
--

LOCK TABLES `sql_instance_tag` WRITE;
/*!40000 ALTER TABLE `sql_instance_tag` DISABLE KEYS */;
INSERT INTO `sql_instance_tag` VALUES (1,'can_write','支持上线',1,'2021-05-07 19:51:49.000000'),(2,'can_read','支持查询',1,'2021-05-07 19:51:49.000000');
/*!40000 ALTER TABLE `sql_instance_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sql_permission`
--

DROP TABLE IF EXISTS `sql_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sql_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sql_permission`
--

LOCK TABLES `sql_permission` WRITE;
/*!40000 ALTER TABLE `sql_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `sql_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sql_users`
--

DROP TABLE IF EXISTS `sql_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sql_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `display` varchar(50) NOT NULL,
  `ding_user_id` varchar(64) NOT NULL,
  `wx_user_id` varchar(64) NOT NULL,
  `feishu_open_id` varchar(64) NOT NULL,
  `failed_login_count` int(11) NOT NULL,
  `last_login_failed_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sql_users`
--

LOCK TABLES `sql_users` WRITE;
/*!40000 ALTER TABLE `sql_users` DISABLE KEYS */;
INSERT INTO `sql_users` VALUES (1,'pbkdf2_sha256$216000$jLtlWA3DTCFa$8m9K5tnkBTBswnU0g3u6wSe5pINVxZafO5O35PMiyAs=','2021-10-27 09:43:27.500300',0,'test','','','test@163.com',0,0,'2021-10-09 15:37:42.000000','cehsi','','','',2,'2021-10-27 17:34:42.472005'),(2,'pbkdf2_sha256$216000$dQ0bQS7fpHbN$d/XcA3axE4LvDSuoB2yxysNtE/0brKpC65TebSvfDmg=',NULL,0,'yangchenzhu_01','','','',1,1,'2021-10-18 14:28:03.000000','杨晨柱市场','13611088385','','',0,NULL),(15,'pbkdf2_sha256$216000$PQ0lc45OAi61$nCOzpKF2m6Jy2WUzTXWQg4ovvU3cyE2dm2W0MC+XmD4=','2021-10-26 14:12:03.827887',0,'WuBaodong','','','',1,1,'2021-10-20 14:59:02.000000','吴保东','18610250996','test','',0,NULL),(16,'pbkdf2_sha256$216000$fVCQmR28BACW$RuIY7hqjA0UAExLSN0JUA0AFmf1xlSKG8cMSJFQDHys=',NULL,0,'YangChenzhu','','','',1,1,'2021-10-20 14:59:02.000000','杨晨柱','13611088385','test','',0,NULL),(17,'pbkdf2_sha256$216000$or8DYrkzek6x$EWin2uTFMHRDYnSfB8gCFp9tGLo0Jyi3xkPhKOY7LLA=','2021-10-26 11:36:40.027376',0,'WangGang','','','',1,1,'2021-10-20 14:59:02.000000','王刚','18752068151','test','',0,NULL),(18,'pbkdf2_sha256$216000$YkEy3ge8SJxO$/n9z4E2QSIf3h/EnosfmrZkc+uOC65FQD4AK6i4ARoQ=','2021-10-25 17:44:03.538202',0,'LouMiaomiao','','','',1,1,'2021-10-20 14:59:02.000000','娄苗苗','15033781593','test','',0,'2021-10-25 17:43:40.184126'),(19,'pbkdf2_sha256$216000$AA2u8EUO0f2M$IvSbTbFOibNvoQ5k3ghB7YE53GZqQTqy4RFKc65IqNE=','2021-10-26 13:50:13.940021',0,'LiuLulu','','','',1,1,'2021-10-20 14:59:02.000000','刘璐璐','15601647566','test','',0,'2021-10-25 17:51:40.111706'),(20,'pbkdf2_sha256$216000$zKpnmVKaGTcc$3bCkzu+6Y7r/QAf5rUuvRctuQ33fYnbyDefdMxcYKm8=','2021-10-25 17:58:46.079027',0,'zenglingquan','','','',1,1,'2021-10-20 14:59:02.000000','曾令权','18970732837','test','',0,NULL),(21,'pbkdf2_sha256$216000$leMFFKui9Sno$1vKeL4bUezX9vWvORA8aM9KsP0eaEDuGehzsDgXXsPk=','2021-10-26 09:58:47.304750',0,'LianYanxin','','','',1,1,'2021-10-20 14:59:02.000000','廉彦鑫','15617111445','test','',0,NULL),(22,'pbkdf2_sha256$216000$0yOfxeI5sjAC$jI4ZP9X+mN7p0Uuwd1TMc5Go5iSssd+4tlsXKKBFz44=','2021-10-25 18:03:23.799432',0,'WangHuaze','','','',1,1,'2021-10-20 14:59:02.000000','王化泽','17845123658','test','',0,'2021-10-25 18:03:11.301096'),(23,'pbkdf2_sha256$216000$joutCZ94IGH4$ZJ/NAXHNdwSdzs+h4pc2sZLRVGjBCo/HaTO77oYqYh4=','2021-10-26 09:59:03.021159',0,'liuqiaomei','','','',1,1,'2021-10-20 14:59:02.000000','刘巧梅','13402083849','test','',0,'2021-10-25 18:11:40.324326'),(24,'pbkdf2_sha256$216000$FejiHai7CPvK$pA7THQuplawfXw8N5ZiYOZtJglROwWKdzuFhGGQ6aJ8=','2021-10-25 18:06:58.648525',0,'HaoLaipeng','','','',1,1,'2021-10-20 14:59:02.000000','郝来鹏','18201118627','test','',0,'2021-10-25 18:06:30.164949'),(25,'pbkdf2_sha256$216000$XMXpnihtTuoM$13qrJ9m+GXc+WtIHdRuu4YoBkh0hdui8FitvcgmEsmQ=','2021-10-25 18:08:45.507607',0,'WangJiali','','','',1,1,'2021-10-20 14:59:02.000000','王佳力','15530859864','test','',0,'2021-10-25 18:07:53.550232'),(26,'pbkdf2_sha256$216000$QBAX64zzonrU$o/JQYW+9y8hlqtvmDsx+tSmmNcyhtw9S8s0tyrkWwKk=','2021-10-25 18:09:13.318643',0,'HuangXin','','','',1,1,'2021-10-20 14:59:02.000000','黄鑫','13308075436','test','',0,NULL),(27,'pbkdf2_sha256$216000$DGMjJabDz50h$7QS11nfy+d5yPCKczwQt7krfxpYLIqgPkVMwcHxchps=','2021-10-25 17:47:59.760487',0,'BaiZhenchuan','','','',1,1,'2021-10-20 14:59:02.000000','白振川','18439493206','test','',0,NULL),(28,'pbkdf2_sha256$216000$UQ2nuUVrfAQW$ccTtONthBE+N+xJoE0801os0mHeWlHCq2regn3MWj1g=','2021-10-25 18:09:59.607390',0,'SongMei','','','',1,1,'2021-10-20 14:59:02.000000','宋美','18780125825','test','',0,'2021-10-25 18:09:36.029691'),(29,'pbkdf2_sha256$216000$Kdws4d90LdWd$fbeMG4VteXzliFQMLbfzAAKZXIqQ95DImptOmsMXfyE=','2021-10-25 18:11:04.107300',0,'ChenYu','','','',1,1,'2021-10-20 14:59:02.000000','陈宇','15862036391','test','',0,'2021-10-25 18:10:31.167980'),(30,'pbkdf2_sha256$216000$hKG45ippRXgy$bWQUnqf3gRrvc+6prZ6ZvkL7yJH3ngWhhgFVo6Fn6Q8=','2021-10-25 18:12:59.676202',0,'ZhouYang','','','',1,1,'2021-10-20 14:59:02.000000','周洋','18655104633','test','',0,'2021-10-25 18:12:41.080406'),(31,'pbkdf2_sha256$216000$zSuzHcmkNPe6$Sz3lru9hESiqpoC8dG7JpdvrX6k/BRHlK7SUHDVaDlg=','2021-10-25 18:14:51.508369',0,'LiuHonglin','','','',1,1,'2021-10-20 14:59:02.000000','刘洪林','17621220446','test','',0,'2021-10-25 18:14:44.756404'),(32,'pbkdf2_sha256$216000$CjfmNtxJMzjg$1muXPQwmKQ79uyozrrHDhGQR9kEJr4lYrTFkuZd8sqs=','2021-10-25 18:17:40.202205',0,'YanDunchao','','','',1,1,'2021-10-20 14:59:02.000000','闫敦超','15184497431','test','',0,'2021-10-25 18:17:16.375329'),(33,'pbkdf2_sha256$216000$zVi3N8kAqyxE$PW/TJReHbxMRKu939gQf6YRK7yPc7myZwSJbnzkYMxQ=','2021-10-25 18:18:57.250692',0,'SunGuoqiang','','','',1,1,'2021-10-20 14:59:02.000000','孙国强','15828102007','test','',0,'2021-10-25 18:18:00.416680'),(34,'pbkdf2_sha256$216000$k8cQWsknexxz$LZRmo3VN/otHl6cw9RWNhnvezkNjPNtP/dY+R22XDVw=','2021-10-25 18:19:49.640545',0,'QiaoLixue','','','',1,1,'2021-10-20 14:59:02.000000','乔立学','15110173959','test','',0,'2021-10-25 18:19:23.257460'),(35,'pbkdf2_sha256$216000$LFA0kvo4hnxE$BZjQMspMuDIakClyk1YlQsTsU1hZMyjJiQEfKHD1jwE=','2021-10-25 18:21:39.711859',0,'ZhangYong','','','',1,1,'2021-10-20 14:59:02.000000','张勇','18600747737','test','',0,'2021-10-25 18:20:23.089064'),(36,'pbkdf2_sha256$216000$MQp1nceZZXMW$FzkX0+sIY3T1QHXiuLgWFdZNka8/a97pd9eWDoMg/58=','2021-10-25 18:22:47.146074',0,'WangHong','','','',1,1,'2021-10-20 14:59:02.000000','王鸿','15228777400','test','',0,'2021-10-25 18:22:33.016816'),(37,'pbkdf2_sha256$216000$BJ6gQQKmoEWU$VUKMa3qPrYG5Qfifj5ybKiBaGEvMYK6TuGoPahjkx/4=','2021-10-26 09:51:37.368693',0,'linchujun','','','',1,1,'2021-10-20 14:59:02.000000','林楚竣','18583822661','test','',0,'2021-10-25 18:23:28.543320'),(38,'pbkdf2_sha256$216000$OD0Gi0u6KUai$rFKYpgUlFffezG5Ju91gsvkTAAxMBsvBjUwWJs0OBQY=','2021-10-26 09:52:08.654461',0,'ZhangXuzhou','','','',1,1,'2021-10-20 14:59:02.000000','张绪洲','17612874640','test','',0,'2021-10-25 18:25:21.126598'),(39,'pbkdf2_sha256$216000$hpu75ZwXZSuf$j6HimaFLIZS7qP/Sd7j+adVbmRri6bZ6n6k3g579jLY=','2021-10-26 09:52:24.959418',0,'ZouYiwei','','','',1,1,'2021-10-20 14:59:02.000000','邹轶维','18307610139','test','',0,NULL),(40,'pbkdf2_sha256$216000$vGQCCMslrEvD$NJuRWlHcn+CKOAvfwXPXSuzowoN/rBwHWfeLCBhSVyQ=','2021-10-26 09:53:13.085505',0,'ChenXiaolin','','','',1,1,'2021-10-20 14:59:02.000000','陈晓林','15282551021','test','',0,'2021-10-26 09:52:42.442004'),(41,'pbkdf2_sha256$216000$XatHsZfbktTH$iMsUNnfo1hXyZYHSrFcmMs6yE+K6iLw9UDcuehKSceg=','2021-10-26 09:54:06.663974',0,'ZhangZhanze','','','',1,1,'2021-10-20 14:59:02.000000','张占泽','13522479851','test','',0,'2021-10-26 09:53:44.373518'),(42,'pbkdf2_sha256$216000$kznhRMmryygT$lDj0don9vlm8n4jMzaeAXxGQvvFayt6bRo1454WD6KQ=','2021-10-26 09:55:02.973329',0,'Yanwish','','','',1,1,'2021-10-20 14:59:02.000000','严心愿','15130267433','test','',0,'2021-10-26 09:54:38.414069'),(43,'pbkdf2_sha256$216000$Iw5AqCDjVwN9$s45FlIpeS5qCcNlegJaszBBUWzwcl355Wd3D1PkhrFc=','2021-10-26 09:56:52.045007',0,'yanglu','','','',1,1,'2021-10-20 14:59:02.000000','杨柳','15639801196','test','',0,NULL),(44,'pbkdf2_sha256$216000$sCAQjrYzsMPK$j6w/kALejUl6gvrTLK/EUEGGUDmNRDzjPiiYsFM/8GY=','2021-10-26 09:57:26.510027',0,'ShaoHaoyu','','','',1,1,'2021-10-20 14:59:02.000000','邵浩宇','17621448236','test','',0,'2021-10-26 09:57:07.847273'),(45,'pbkdf2_sha256$216000$oYRDsZ2iEhjr$xzKaOqOg0lkUGkkRxptRtIOyPIg8nifVzzW9QSETlSY=','2021-10-26 10:16:52.185067',0,'ChenYang','','','',1,1,'2021-10-20 14:59:02.000000','陈阳','17521053387','test','',0,'2021-10-26 09:58:06.444885'),(46,'pbkdf2_sha256$216000$D7UTRhhAmQlv$2FKRxhn1yTzlPmurmCVrdW59FlydOsoYH3S96CctZ54=',NULL,0,'DuFengchu','','','',1,1,'2021-10-20 14:59:02.000000','杜风楚','13917990509','test','',1,'2021-10-26 09:59:26.006084'),(47,'pbkdf2_sha256$216000$TDFIlIOKsn8q$Wzlz5QJj7h1qK8JFuDQahyWdCYK91SS3gwDjx10MXms=','2021-10-26 10:00:08.059535',0,'WuQiongqiong','','','',1,1,'2021-10-20 14:59:02.000000','吴琼琼','13271611205','test','',0,NULL),(48,'pbkdf2_sha256$216000$mZj2W7p0nEE1$LLROfWwdb+DXPRsuvXO+wEH68ZWtCfehQOkuhEYrRoo=',NULL,0,'LiHaifeng','','','',1,1,'2021-10-20 14:59:02.000000','李海峰','13524828443','test','',1,'2021-10-26 10:00:38.462576'),(49,'pbkdf2_sha256$216000$lIF2w4SuAhaB$qvbrEGh19eYUTIxPCuosTWmqBkUTmBDEzXfzTcQG65g=','2021-10-26 10:02:14.198281',0,'YangRui','','','',1,1,'2021-10-20 14:59:02.000000','杨瑞','杨瑞	13917499668','test','',0,'2021-10-26 10:01:50.292407'),(50,'pbkdf2_sha256$216000$u2eDb93UTSUP$gkXPR9Tb+3m9pW87HPznQlluaOndNfWbsRxHxCaC+Io=','2021-10-26 10:07:42.449026',0,'FangDan','','','',1,1,'2021-10-20 14:59:02.000000','方丹','15692012139','test','',0,'2021-10-26 10:04:48.812708'),(51,'pbkdf2_sha256$216000$Ml9For8w6k23$56jRJD9adTsreOcETVzi4vOoQRO5U41xSRErmb7eBRY=',NULL,0,'Zhangmeng','','','',1,1,'2021-10-20 14:59:02.000000','张猛','张猛	15638182012','test','',0,NULL),(52,'pbkdf2_sha256$216000$kBMN0XopMwOH$2FcnzoIAEPdgsmmbq3tncRqfI25KFKVJMz91z/Xhs+Y=','2021-10-26 10:17:11.880073',0,'LiZemin','','','',1,1,'2021-10-20 14:59:02.000000','李泽民','15045873752','test','',0,'2021-10-26 10:08:13.029928'),(53,'pbkdf2_sha256$216000$49M3xSzmCiNM$jN71taydMPBEXJkWu+bRrMIxJqlEMXy/Ib8ggsu5gvQ=',NULL,0,'GuoMao','','','',1,1,'2021-10-20 14:59:02.000000','郭茂','15824850100','test','',1,'2021-10-26 10:09:06.016928'),(54,'pbkdf2_sha256$216000$jI4JU6hkPfPv$Ea7U7G8L2C7pwXHXVCZPtjQLHbx2mSmyyhHlwYmHrng=','2021-10-26 10:17:24.813231',0,'LuoJun','','','',1,1,'2021-10-20 14:59:02.000000','罗俊','17361000501','test','',0,NULL),(55,'pbkdf2_sha256$216000$kwH8GDieGK3y$gW3P8yhV9VIxyq5fG37O/5Sj4HpV2LxYoqLtTA+iQ5s=','2021-10-26 10:17:37.173534',0,'CaoWei','','','',1,1,'2021-10-20 14:59:02.000000','曹纬','18516267531','test','',0,'2021-10-25 17:48:37.564431'),(56,'pbkdf2_sha256$216000$3gXwyBXIfUku$tVlPJ13e2QYxjdh9/o6IjxWuxXv7jSWV0isKAqdQvdo=','2021-10-26 10:17:54.799433',0,'LiuYaya','','','',1,1,'2021-10-20 14:59:02.000000','刘亚亚','13718148452','test','',0,NULL),(57,'pbkdf2_sha256$216000$aaqYcyOZvoVz$1Ri2cHBtknQA1fILWcNkL1DL7706Pz0mOVVQWwMPpkE=','2021-10-26 10:18:12.172252',0,'YangJie','','','',1,1,'2021-10-20 14:59:02.000000','杨杰','13001289532','test','',0,NULL),(58,'pbkdf2_sha256$216000$wtAQzV2D0UF9$1ayn97iZ0CSG8KAKy8UY5/3UT2EdW9lW+iXBKj18Ejc=','2021-10-26 10:18:24.653300',0,'WangYi','','','',1,1,'2021-10-20 14:59:02.000000','王怡','18200705533','test','',0,NULL),(59,'pbkdf2_sha256$216000$gP4q6zhCGA75$UWScE+Xiy38SEwoEy1E5Fur/v1r0rqvq6FtIJ8Yd/tM=','2021-10-26 10:18:38.644534',0,'WangChen','','','',1,1,'2021-10-20 14:59:02.000000','汪晨','13818667621','test','',0,NULL),(60,'pbkdf2_sha256$216000$zaZ5ntqlLtAA$f8TTJhwG8qsz5hwcyiSFLyk8WuY2DrhmXZc0i4CZRjA=','2021-10-26 10:18:54.812636',0,'ChengHao','','','',1,1,'2021-10-20 14:59:02.000000','程浩','17802146028','test','',0,NULL),(61,'pbkdf2_sha256$216000$4wyfaNYwPTCa$GqvNLO5FY4PeTEKQxTZ9bXsmxolCeEhHoh7fCRtCBNs=','2021-10-26 10:19:11.419690',0,'GuoLei','','','',1,1,'2021-10-20 14:59:02.000000','郭雷','16628556551','test','',0,NULL),(62,'pbkdf2_sha256$216000$70WwVhceWyjd$vfGZYoAQcObTG6WuQ0AZ109iT6Ni5J5LojzYWHIAp04=','2021-10-26 11:07:18.698860',0,'YinYu','','','',1,1,'2021-10-20 14:59:02.000000','殷雨','15212100779','test','',0,NULL),(63,'pbkdf2_sha256$216000$kA6CHJJai1AX$xAGxHJIyAg/jA9BJCy+LUnWnVMMckSeADIMzQieNYbM=','2021-10-26 13:09:02.130176',0,'YangJief','','','',1,1,'2021-10-20 14:59:02.000000','杨杰','1581570180','test','',0,NULL),(64,'pbkdf2_sha256$216000$xOkIkqp5pPx8$oYug0wK3GGGWnqJA/vhjspoMOyEjDEMtROmm7nXUZtY=','2021-10-26 10:19:49.485364',0,'WangWeilan','','','',1,1,'2021-10-20 14:59:02.000000','王伟兰','18861603067','test','',0,NULL),(65,'pbkdf2_sha256$216000$gvFKhkxAnbjO$0SR8x2tavBdwKCfulTilQg7lmSh6SrQGhj5abfbeUJ8=',NULL,0,'GuYibing','','','',1,1,'2021-10-20 14:59:02.000000','顾益兵','13391096132','test','',1,'2021-10-26 10:20:03.547077'),(66,'pbkdf2_sha256$216000$j7zNN6Pij5u8$3G38zOPgB3QP21OVBkRO9LTcxHhbevDv4sUnnOsaVLo=','2021-10-26 10:20:13.769629',0,'HuYong','','','',1,1,'2021-10-20 14:59:02.000000','胡勇','13916320566','test','',0,NULL),(67,'pbkdf2_sha256$216000$NRtv0vXJw5x8$V53gwkZkyWjinP87dzbe/2jjPDsV1HmGqfXw3//ji9Y=','2021-10-26 10:20:28.572789',0,'ShiMingyue','','','',1,1,'2021-10-20 14:59:02.000000','史明月','18601603060','test','',0,NULL),(68,'pbkdf2_sha256$216000$BPTPa3SwHqhj$z3/2UGJI7+qH9YOjQ0BpD+yncH7NvItcjIdcgZvckZE=',NULL,0,'GuoXiaona','','','',1,1,'2021-10-20 14:59:02.000000','郭小娜','13165575955','develop','',0,NULL),(69,'pbkdf2_sha256$216000$X4Zsv3Ymc4EL$vlEJUESnI1F1/2Fq7B5WfdpBkGAb/4P43vrC7Uxv9xw=',NULL,0,'MaYuying','','','',1,1,'2021-10-20 14:59:02.000000','马玉颖','18333185730','develop','',0,NULL),(70,'pbkdf2_sha256$216000$ayzcCU6G3iv0$5Oi/lF1Qy7cLfNWcOiGewNXAeIR3VTh4+Zb9+pjQ9CU=',NULL,0,'MaZhengyu','','','',1,1,'2021-10-20 14:59:02.000000','马征宇','15933958162','develop','',0,NULL),(71,'pbkdf2_sha256$216000$pVdrnFL1izqY$yYIQ3GVU0DsNdFafoqBgGaWHPeKOpaxT83WAKCoTT9w=',NULL,0,'TianZheng','','','',1,1,'2021-10-20 14:59:02.000000','田征','15901520470','develop','',0,NULL),(72,'pbkdf2_sha25616000/o5S0z4qLTa9Rn9eUUjiL9+1FYJkeGWp1q+mekxE=',NULL,0,'ZhangMengqiu','','','',1,0,'2021-10-20 14:59:02.000000','张孟秋','17734372396','develop','',0,NULL),(73,'pbkdf2_sha256$216000$MWjfMInQElKo$nCck0+RR9qN6uI+sD1wnJqWIY1s7pp8Qcq14AmCFYNM=',NULL,0,'LiZe','','','',1,1,'2021-10-20 14:59:02.000000','李泽','17601630927','develop','',0,NULL),(74,'pbkdf2_sha256$216000$pJGVv5I7eI2e$y1JF3PFI2gSi936sn38K+dN549r8BRHF91Q//LdRz9k=',NULL,0,'LiJianyong','','','',1,1,'2021-10-20 14:59:02.000000','李建勇','18222527900','develop','',0,NULL),(75,'pbkdf2_sha256$216000$38aiHObfB8Oo$EQrwKa+IhdAWGqFEMBjZxeFGRDE2VUpKY4zHAq6ir/4=',NULL,0,'HanMing','','','',1,1,'2021-10-20 14:59:02.000000','韩铭','17634402352','develop','',1,'2021-10-25 18:27:53.158677'),(76,'pbkdf2_sha256$216000$Q1Q5b5S1Le6r$6C661X+Krh2OzQVGnUjoIMy/t8vqQLab6bYLe0vzUuY=',NULL,0,'FanLixue','','','',1,1,'2021-10-20 14:59:02.000000','范李雪','15037262490','develop','',0,NULL),(77,'pbkdf2_sha256$216000$6iaxYJlCfMxl$MIzIWKJIJS5F0Aal5m/5MXypj54MtdpCBs34yOjVLQI=',NULL,0,'ChenWu','','','',1,1,'2021-10-20 14:59:02.000000','陈武','15907080605','develop','',0,NULL),(78,'pbkdf2_sha256$216000$xLajaXcjBYy2$Zz6LePZoS9fp1cksHgT6Yj7ZvIOUXv6UvKxhpOIfTVc=',NULL,0,'WangKai','','','',1,1,'2021-10-20 14:59:02.000000','王凯','15022590152','develop','',0,NULL),(79,'pbkdf2_sha256$216000$iGxcgvnYq7sY$lhj+eXaLVtANsAr4btgzin7vGVjl0zmhlq0fhPCQn9Q=',NULL,0,'QinShaocen','','','',1,1,'2021-10-20 14:59:02.000000','秦绍岑','13079226663','develop','',0,NULL),(80,'pbkdf2_sha256$216000$b1H2UB5kZbkt$ZpuElx8D035ABn6qvui/GE31Z7821Dy8NZ+dH0judj8=',NULL,0,'WangSinan','','','',1,1,'2021-10-20 14:59:02.000000','王思南','15600581187','develop','',0,NULL),(81,'pbkdf2_sha256$216000$LNjWEFGtZI0s$uaAQvauMh/jWO9ia0TGXuAyrj/3g8lxplIkaMWrSfJM=',NULL,0,'ZhangTao','','','',1,1,'2021-10-20 14:59:02.000000','张涛','18502129886','develop','',0,NULL),(82,'pbkdf2_sha256$216000$hro8333XzZ43$q9k1ZC31DMiSjaMIIgNsvpxG41r2MQcfeJVTjBYi+qE=',NULL,0,'GuoQianqian','','','',1,1,'2021-10-20 14:59:02.000000','郭倩倩','15831522495','develop','',0,NULL),(83,'pbkdf2_sha256$216000$GVB5IGAD0Ytm$3EbQkNaWkUoIuA6yGgb/aFgYqPRKJFoirW9CroMdVa8=',NULL,0,'HouHaitao','','','',1,1,'2021-10-20 14:59:02.000000','侯海涛','15222561170','develop','',0,NULL),(84,'pbkdf2_sha256$216000$Go9nzzwq2SuV$m11B4HhaRX+i25FWTayDtSYpEkmasi5Dqfg1ctI97QY=',NULL,0,'LiYingjie','','','',1,1,'2021-10-20 14:59:02.000000','李英杰','17601235246','develop','',0,NULL),(85,'pbkdf2_sha256$216000$26UmGfMS1Art$T2OTDB3QbGAvDChHUmZjw/ELkXRY+3TEwjnZcfTVs0c=',NULL,0,'WangZhiyang','','','',1,1,'2021-10-20 14:59:02.000000','王志杨','15848116426','develop','',0,NULL),(86,'pbkdf2_sha256$216000$fM7Wmo3gIpQN$UUvhufg1KpFx+HMwR6JPK4YqCfG+5+couKL0JHSR084=',NULL,0,'ZhangZhao','','','',1,1,'2021-10-20 14:59:02.000000','张召','18616139780','develop','',0,NULL),(87,'pbkdf2_sha256$216000$wf9eiC6Vvc9B$4Z8dsO/hc9B1giOMgcAtnh8mPf0l7dPbZqIiRLtmNsM=',NULL,0,'HaoWenbin','','','',1,1,'2021-10-20 14:59:02.000000','郝文斌','18301848910','develop','',0,NULL),(88,'pbkdf2_sha256$216000$XHMbZCehLRok$XunyDjNVSt09+4IWB+3gVorYTuuHDBomT+8Fb7h+HxA=',NULL,0,'RenLiang','','','',1,1,'2021-10-20 14:59:02.000000','任亮','13402111570','develop','',0,NULL),(89,'pbkdf2_sha256$216000$BeQsvTZdZvNl$KOt1pGVQh7H+AKudGfXqzigzNHWqNoLWVx0wYMD/AFs=',NULL,0,'HuJibin','','','',1,1,'2021-10-20 14:59:02.000000','胡吉斌','13761553195','develop','',0,NULL),(90,'pbkdf2_sha256$216000$tIWNXpCXkM0g$bxEusaBaH8gIjMIXZ+jkcDGMJhcFiRfw3TCVF66blZk=',NULL,0,'JiangTao','','','',1,1,'2021-10-20 14:59:02.000000','蒋涛','17302143650','develop','',0,NULL),(91,'pbkdf2_sha256$216000$40Srpj30Sgda$lkDL+WlN/8oVnVrR8TzkYnvbAyHnLbQgklCslb477Wo=',NULL,0,'TuLujun','','','',1,1,'2021-10-20 14:59:02.000000','屠鲁俊','18829014133','develop','',0,NULL),(92,'pbkdf2_sha256$216000$6zbc7mtVfAn9$Qlbe8N3G/EdeSMGiWt4889p/cLMDMkMYiPewTxIi16w=',NULL,0,'ChenHua','','','',1,1,'2021-10-20 14:59:02.000000','陈华','15882017870','develop','',4,'2021-10-25 17:50:58.174795'),(93,'pbkdf2_sha256$216000$Z5Zgu5spdqv0$m2pJhD5f0UVVCY3LVb5gzi4Tx3eP9PNE4BFdOdIw2vc=',NULL,0,'ChenJun','','','',1,1,'2021-10-20 14:59:02.000000','陈军','18782966356','develop','',0,NULL),(94,'pbkdf2_sha256$216000$RzvKRvjbV1Zt$855vLJ7GMHk1Q75Yr3OcW7SGT4ZEADko87XD6hJEAjo=',NULL,0,'LiangXiangyang','','','',1,1,'2021-10-20 14:59:02.000000','梁向阳','15114032273','develop','',0,NULL),(95,'pbkdf2_sha256$216000$3rNDwWU9grLr$4AH5B9kvF3dT847f7TlHC7fP7YU3OWYHP3gQsWH8Kq8=',NULL,0,'WangPengju','','','',1,1,'2021-10-20 14:59:02.000000','王鹏举','13707631004','develop','',0,NULL),(96,'pbkdf2_sha256$216000$RtS3GTAo4GGU$9McsPsGQ44bnn19Q4htCQ6LGSHg3/HdB1VXaaCfCdds=',NULL,0,'LiRui','','','',1,1,'2021-10-20 14:59:02.000000','李瑞','17600760252','develop','',0,NULL),(97,'pbkdf2_sha256$216000$0ux9sr4yfmO4$ty1VeAHeshQ0XyN0mzkC/WrLXF/XqHfFcXyy84mN86o=',NULL,0,'YinHaijun','','','',1,1,'2021-10-20 14:59:02.000000','殷海军','19921545932','develop','',0,NULL),(98,'pbkdf2_sha256$216000$pPKL7o3URvDw$Y0nQCB1Eq7s6cXthkxSIZC8uqiZc/Bpxs6Pk/9QWmqA=',NULL,0,'WangWenbin','','','',1,1,'2021-10-20 14:59:02.000000','王文斌','18616395304','develop','',0,NULL),(99,'pbkdf2_sha256$216000$qi2bCMFMzjQy$Xh1wdomxCjaw7NBwQ5aU3+ssc7YFXREIGiTrSbWoBjU=',NULL,0,'JiangJianjun','','','',1,1,'2021-10-20 14:59:02.000000','江建军','15308091853','develop','',0,NULL),(100,'pbkdf2_sha256$216000$f12hDQpR76jc$5De6WRgd0Y/Iv+Q+4t2WzWKtKkqFQfVE094I+bhvMLA=',NULL,0,'XieXiang','','','',1,1,'2021-10-20 14:59:02.000000','谢翔','13688014485','develop','',0,NULL),(101,'pbkdf2_sha256$216000$aRjHGTYMmfny$7hz8QFmBfwrQ9jQE9HUZvFwDwJZWWhdualZiaHBdF00=','2021-10-28 10:12:22.059754',1,'fenglei','','','',1,1,'2021-10-25 17:03:55.000000','冯磊','','18610952933','',0,NULL),(102,'pbkdf2_sha256$216000$xSg12Sdaf1aN$ZwX1wgzZB3wwk/YeXJ6Zy59TQ3S5gIlRy0agDucxeOg=',NULL,0,'devlop_01','','','',0,0,'2021-10-26 14:01:20.000000','公共审核密码不许更改','','','',0,NULL),(103,'pbkdf2_sha256$216000$kSik5YOAegXH$qrTA7SAO+kQXrTipw7rvRDwgMFZV5smYy8hdHkKgCeE=','2021-10-26 14:26:42.458432',0,'shenhe','','','',1,1,'2021-10-26 14:22:58.000000','公共审核账号','','','',0,NULL),(104,'pbkdf2_sha256$216000$EuyNHcCQDa60$KGAeWZvtnnp3tNTbPZKmP7UEjN1uDb/Of2AtsvKNcOA=',NULL,0,'Liuyu','','','',0,1,'2021-10-28 15:49:35.000000','刘禹','','test','',0,NULL),(105,'pbkdf2_sha256$216000$Wdhy0cXWZYkb$oAvhmV7Q0D0Okz2xSRuuM+m3Ez6hAxIe1RU9fqFblZw=',NULL,0,'HanPengwei','','','',0,1,'2021-10-28 15:50:39.481478','韩朋伟','','','',0,NULL),(106,'pbkdf2_sha256$216000$riZgdEgUXaXA$Yt+Py9p4lB2ojmRR6e7VFM6L0/yQjgQ4ElAiJAk6vzk=',NULL,0,'Gonglong','','','',0,1,'2021-10-28 15:51:55.197141','龚龙','','test','',0,NULL);
/*!40000 ALTER TABLE `sql_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sql_users_groups`
--

DROP TABLE IF EXISTS `sql_users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sql_users_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sql_users_groups_users_id_group_id_4540dddc_uniq` (`users_id`,`group_id`),
  KEY `sql_users_groups_group_id_d572a82e_fk_auth_group_id` (`group_id`),
  CONSTRAINT `sql_users_groups_group_id_d572a82e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `sql_users_groups_users_id_d674bacf_fk_sql_users_id` FOREIGN KEY (`users_id`) REFERENCES `sql_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sql_users_groups`
--

LOCK TABLES `sql_users_groups` WRITE;
/*!40000 ALTER TABLE `sql_users_groups` DISABLE KEYS */;
INSERT INTO `sql_users_groups` VALUES (87,1,2),(93,1,3),(1,2,1),(20,15,9),(21,17,9),(22,18,9),(2,19,9),(88,20,9),(3,21,9),(4,22,9),(5,23,9),(6,24,9),(7,25,9),(8,26,9),(9,27,9),(10,28,9),(11,29,9),(12,30,9),(13,31,9),(14,32,9),(15,33,9),(16,34,9),(85,35,9),(17,36,9),(18,37,9),(83,38,9),(84,39,9),(19,40,9),(82,42,9),(81,43,9),(23,44,9),(24,45,9),(25,46,9),(26,47,9),(27,48,9),(28,49,9),(29,50,9),(30,51,9),(31,52,9),(32,53,9),(33,54,9),(34,55,9),(35,56,9),(36,57,9),(37,58,9),(38,59,9),(39,60,9),(40,61,9),(41,62,9),(42,63,9),(43,64,9),(44,65,9),(45,66,9),(91,67,9),(47,68,8),(48,69,8),(49,70,8),(50,71,8),(51,72,8),(52,73,8),(53,74,8),(54,75,8),(55,76,8),(56,77,8),(57,78,8),(58,79,8),(59,80,8),(60,81,8),(61,82,8),(62,83,8),(63,84,8),(64,85,8),(65,86,8),(66,87,8),(67,88,8),(68,89,8),(69,90,8),(70,91,8),(71,92,8),(72,93,8),(73,94,8),(74,95,8),(75,96,8),(76,97,8),(77,98,8),(78,99,8),(79,100,8),(92,101,3),(89,102,8),(90,103,8);
/*!40000 ALTER TABLE `sql_users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sql_users_resource_group`
--

DROP TABLE IF EXISTS `sql_users_resource_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sql_users_resource_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `resourcegroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sql_users_resource_group_users_id_resourcegroup_id_304d8421_uniq` (`users_id`,`resourcegroup_id`),
  KEY `sql_users_resource_g_resourcegroup_id_0738ff9d_fk_resource_` (`resourcegroup_id`),
  CONSTRAINT `sql_users_resource_g_resourcegroup_id_0738ff9d_fk_resource_` FOREIGN KEY (`resourcegroup_id`) REFERENCES `resource_group` (`group_id`),
  CONSTRAINT `sql_users_resource_group_users_id_fe4a5def_fk_sql_users_id` FOREIGN KEY (`users_id`) REFERENCES `sql_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sql_users_resource_group`
--

LOCK TABLES `sql_users_resource_group` WRITE;
/*!40000 ALTER TABLE `sql_users_resource_group` DISABLE KEYS */;
INSERT INTO `sql_users_resource_group` VALUES (86,1,1),(19,2,1),(20,15,1),(21,17,1),(22,18,1),(1,19,1),(87,20,1),(2,21,1),(3,22,1),(4,23,1),(5,24,1),(6,25,1),(7,26,1),(8,27,1),(9,28,1),(10,29,1),(11,30,1),(12,31,1),(13,32,1),(14,33,1),(15,34,1),(84,35,1),(16,36,1),(17,37,1),(82,38,1),(83,39,1),(18,40,1),(81,42,1),(80,43,1),(23,44,1),(24,45,1),(25,46,1),(26,47,1),(27,48,1),(28,49,1),(29,50,1),(30,51,1),(31,52,1),(32,53,1),(33,54,1),(34,55,1),(35,56,1),(36,57,1),(37,58,1),(38,59,1),(39,60,1),(40,61,1),(41,62,1),(42,63,1),(43,64,1),(44,65,1),(45,66,1),(46,67,1),(47,68,1),(48,69,1),(49,70,1),(50,71,1),(51,72,1),(52,73,1),(53,74,1),(54,75,1),(55,76,1),(56,77,1),(57,78,1),(58,79,1),(59,80,1),(60,81,1),(61,82,1),(62,83,1),(63,84,1),(64,85,1),(65,86,1),(66,87,1),(67,88,1),(68,89,1),(69,90,1),(70,91,1),(71,92,1),(72,93,1),(73,94,1),(74,95,1),(75,96,1),(76,97,1),(77,98,1),(78,99,1),(79,100,1),(85,101,1),(88,102,1),(89,103,1);
/*!40000 ALTER TABLE `sql_users_resource_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sql_users_user_permissions`
--

DROP TABLE IF EXISTS `sql_users_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sql_users_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `sql_users_user_permissions_users_id_permission_id_5fffb2bb_uniq` (`users_id`,`permission_id`) USING BTREE,
  KEY `sql_users_user_permi_permission_id_e990caab_fk_auth_perm` (`permission_id`) USING BTREE,
  CONSTRAINT `sql_users_user_permi_permission_id_e990caab_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `sql_users_user_permissions_users_id_efad14b0_fk_sql_users_id` FOREIGN KEY (`users_id`) REFERENCES `sql_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=403 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sql_users_user_permissions`
--

LOCK TABLES `sql_users_user_permissions` WRITE;
/*!40000 ALTER TABLE `sql_users_user_permissions` DISABLE KEYS */;
INSERT INTO `sql_users_user_permissions` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20),(21,1,21),(22,1,22),(23,1,23),(24,1,24),(25,1,25),(26,1,26),(27,1,27),(28,1,28),(29,1,29),(30,1,30),(31,1,31),(32,1,32),(33,1,33),(34,1,34),(35,1,35),(36,1,36),(37,1,37),(38,1,38),(39,1,39),(40,1,40),(41,1,41),(42,1,42),(43,1,43),(44,1,44),(45,1,45),(46,1,46),(47,1,47),(48,1,48),(49,1,49),(50,1,50),(51,1,51),(52,1,52),(53,1,53),(54,1,54),(55,1,55),(56,1,56),(57,1,57),(58,1,58),(59,1,59),(60,1,60),(61,1,61),(62,1,62),(63,1,63),(64,1,64),(65,1,65),(66,1,66),(67,1,67),(68,1,68),(69,1,69),(70,1,70),(71,1,71),(72,1,72),(73,1,73),(74,1,74),(75,1,75),(76,1,76),(77,1,77),(78,1,78),(79,1,79),(80,1,80),(81,1,81),(82,1,82),(83,1,83),(84,1,84),(85,1,85),(86,1,86),(87,1,87),(88,1,88),(89,1,89),(90,1,90),(91,1,91),(92,1,92),(93,1,93),(94,1,94),(95,1,95),(96,1,96),(97,1,97),(98,1,98),(99,1,99),(100,1,100),(101,1,101),(102,1,102),(103,1,103),(104,1,104),(105,1,105),(106,1,106),(107,1,107),(108,1,108),(109,1,109),(110,1,110),(111,1,111),(112,1,112),(113,1,113),(114,1,114),(115,1,115),(116,1,116),(117,1,117),(118,1,118),(119,1,119),(120,1,120),(121,1,121),(122,1,122),(123,1,123),(124,1,124),(125,1,125),(126,1,126),(127,1,127),(128,1,128),(129,1,129),(130,1,130),(131,1,131),(132,1,132),(133,1,133),(134,1,134),(135,1,135),(136,1,136),(137,1,137),(138,1,138),(139,1,139),(140,1,140),(141,1,141),(142,1,142),(143,1,143),(144,1,144),(145,1,145),(146,1,146),(147,1,147),(148,1,148),(149,1,149),(150,1,150),(151,1,151),(152,1,152),(153,1,153),(154,1,154),(155,1,155),(156,1,156),(157,1,157),(158,1,158),(159,1,159),(160,1,160),(161,1,161),(162,1,162),(163,1,163),(164,1,164),(165,1,165),(166,1,166),(167,1,167),(168,1,168),(169,1,169),(170,1,170),(171,1,171),(172,1,172),(173,1,173),(174,1,174),(175,1,175),(176,1,176),(177,1,177),(178,1,178),(179,1,179),(180,1,180),(181,1,181),(182,1,182),(183,1,183),(184,1,184),(185,1,185),(186,1,186),(187,1,187),(188,1,188),(189,1,189),(190,1,190),(191,1,191),(192,1,192),(193,1,193),(194,1,194),(195,1,195),(196,1,196),(197,1,197),(198,1,198),(199,1,199),(200,1,200),(201,1,201),(202,103,1),(203,103,2),(204,103,3),(205,103,4),(206,103,5),(207,103,6),(208,103,7),(209,103,8),(210,103,9),(211,103,10),(212,103,11),(213,103,12),(214,103,13),(215,103,14),(216,103,15),(217,103,16),(218,103,17),(219,103,18),(220,103,19),(221,103,20),(222,103,21),(223,103,22),(224,103,23),(225,103,24),(226,103,25),(227,103,26),(228,103,27),(229,103,28),(230,103,29),(231,103,30),(232,103,31),(233,103,32),(234,103,33),(235,103,34),(236,103,35),(237,103,36),(238,103,37),(239,103,38),(240,103,39),(241,103,40),(242,103,41),(243,103,42),(244,103,43),(245,103,44),(246,103,45),(247,103,46),(248,103,47),(249,103,48),(250,103,49),(251,103,50),(252,103,51),(253,103,52),(254,103,53),(255,103,54),(256,103,55),(257,103,56),(258,103,57),(259,103,58),(260,103,59),(261,103,60),(262,103,61),(263,103,62),(264,103,63),(265,103,64),(266,103,65),(267,103,66),(268,103,67),(269,103,68),(270,103,69),(271,103,70),(272,103,71),(273,103,72),(274,103,73),(275,103,74),(276,103,75),(277,103,76),(278,103,77),(279,103,78),(280,103,79),(281,103,80),(282,103,81),(283,103,82),(284,103,83),(285,103,84),(286,103,85),(287,103,86),(288,103,87),(289,103,88),(290,103,89),(291,103,90),(292,103,91),(293,103,92),(294,103,93),(295,103,94),(296,103,95),(297,103,96),(298,103,97),(299,103,98),(300,103,99),(301,103,100),(302,103,101),(303,103,102),(304,103,103),(305,103,104),(306,103,105),(307,103,106),(308,103,107),(309,103,108),(310,103,109),(311,103,110),(312,103,111),(313,103,112),(314,103,113),(315,103,114),(316,103,115),(317,103,116),(318,103,117),(319,103,118),(320,103,119),(321,103,120),(322,103,121),(323,103,122),(324,103,123),(325,103,124),(326,103,125),(327,103,126),(328,103,127),(329,103,128),(330,103,129),(331,103,130),(332,103,131),(333,103,132),(334,103,133),(335,103,134),(336,103,135),(337,103,136),(338,103,137),(339,103,138),(340,103,139),(341,103,140),(342,103,141),(343,103,142),(344,103,143),(345,103,144),(346,103,145),(347,103,146),(348,103,147),(349,103,148),(350,103,149),(351,103,150),(352,103,151),(353,103,152),(354,103,153),(355,103,154),(356,103,155),(357,103,156),(358,103,157),(359,103,158),(360,103,159),(361,103,160),(362,103,161),(363,103,162),(364,103,163),(365,103,164),(366,103,165),(367,103,166),(368,103,167),(369,103,168),(370,103,169),(371,103,170),(372,103,171),(373,103,172),(374,103,173),(375,103,174),(376,103,175),(377,103,176),(378,103,177),(379,103,178),(380,103,179),(381,103,180),(382,103,181),(383,103,182),(384,103,183),(385,103,184),(386,103,185),(387,103,186),(388,103,187),(389,103,188),(390,103,189),(391,103,190),(392,103,191),(393,103,192),(394,103,193),(395,103,194),(396,103,195),(397,103,196),(398,103,197),(399,103,198),(400,103,199),(401,103,200),(402,103,201);
/*!40000 ALTER TABLE `sql_users_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sql_workflow`
--

DROP TABLE IF EXISTS `sql_workflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sql_workflow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_name` varchar(50) NOT NULL,
  `demand_url` varchar(500) NOT NULL,
  `group_id` int(11) NOT NULL,
  `group_name` varchar(100) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `syntax_type` int(11) NOT NULL,
  `is_backup` tinyint(1) NOT NULL,
  `engineer` varchar(30) NOT NULL,
  `engineer_display` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `audit_auth_groups` varchar(255) NOT NULL,
  `run_date_start` datetime(6) DEFAULT NULL,
  `run_date_end` datetime(6) DEFAULT NULL,
  `create_time` datetime(6) NOT NULL,
  `finish_time` datetime(6) DEFAULT NULL,
  `is_manual` int(11) NOT NULL,
  `instance_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sql_workflow_instance_id_ad34809b_fk_sql_instance_id` (`instance_id`) USING BTREE,
  CONSTRAINT `sql_workflow_instance_id_ad34809b_fk_sql_instance_id` FOREIGN KEY (`instance_id`) REFERENCES `sql_instance` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sql_workflow`
--

LOCK TABLES `sql_workflow` WRITE;
/*!40000 ALTER TABLE `sql_workflow` DISABLE KEYS */;
INSERT INTO `sql_workflow` VALUES (5,'我未完成','',1,'俄罗斯腾讯云测试环境','app_api',1,0,'admin','','workflow_autoreviewwrong','7,3',NULL,NULL,'2021-05-12 15:46:33.457776',NULL,0,2),(6,'我未完成','',1,'俄罗斯腾讯云测试环境','app_api',1,0,'admin','','workflow_finish','7,3',NULL,NULL,'2021-05-12 15:48:16.014187','2021-05-12 15:48:27.854552',0,2),(7,'擦擦擦','',1,'俄罗斯腾讯云测试环境','app_api',1,0,'admin','','workflow_autoreviewwrong','7,3',NULL,NULL,'2021-05-12 17:39:58.377825',NULL,0,2),(8,'擦擦擦','',1,'俄罗斯腾讯云测试环境','app_api',1,0,'admin','','workflow_finish','7,3',NULL,NULL,'2021-05-12 17:40:18.948838','2021-05-12 17:40:39.252751',0,2),(9,'test01t','',1,'俄罗斯腾讯云测试环境','app_api_bak',1,0,'toniy_tu01','屠鲁俊','workflow_finish','2',NULL,NULL,'2021-05-13 11:14:02.040275','2021-05-13 11:19:33.497265',0,2),(10,'test','',1,'俄罗斯腾讯云测试环境','app_api_bak',1,0,'admin','','workflow_finish','无需审批',NULL,NULL,'2021-05-13 18:01:12.321241','2021-05-13 18:01:24.858259',0,2),(11,'杀杀杀','',1,'俄罗斯腾讯云测试环境','app_api_bak',2,0,'admin','','workflow_finish','无需审批',NULL,NULL,'2021-05-13 18:06:37.062368','2021-05-13 18:06:48.325608',0,2),(12,'i0u0','',1,'俄罗斯腾讯云测试环境','app_api_bak',1,0,'ghl900226','ghl','workflow_finish','无需审批',NULL,NULL,'2021-05-13 18:14:46.562498','2021-05-13 18:14:51.752623',0,2),(13,'项目名111','可以空可以jira地址',1,'俄罗斯腾讯云测试环境','app_api_bak',1,1,'admin','','workflow_autoreviewwrong','8',NULL,NULL,'2021-05-18 11:33:37.480393',NULL,0,2),(14,'项目名111','可以空可以jira地址',1,'俄罗斯腾讯云测试环境','app_api_bak',1,1,'admin','','workflow_review_pass','无需审批',NULL,NULL,'2021-05-18 11:37:02.620325',NULL,0,2),(15,'app_api','',1,'俄罗斯腾讯云测试环境','app_api',1,0,'admin','','workflow_autoreviewwrong','8','2021-09-28 10:34:00.000000','2021-09-28 11:34:00.000000','2021-09-28 10:35:47.736458',NULL,0,2),(16,'app_api','',1,'俄罗斯腾讯云测试环境','app_api',1,0,'admin','','workflow_review_pass','无需审批',NULL,NULL,'2021-09-28 10:39:01.588530',NULL,0,2),(17,'hop[kl','',1,'俄罗斯腾讯云测试环境','archrey',1,0,'user1','fenglei','workflow_review_pass','无需审批','2021-09-29 11:48:00.000000','2021-10-25 11:48:00.000000','2021-09-28 11:49:01.422621',NULL,0,2),(18,'hop[kl','',1,'俄罗斯腾讯云测试环境','archrey',1,0,'user1','fenglei','workflow_review_pass','无需审批','2021-09-28 11:49:00.000000','2021-09-28 11:49:00.000000','2021-09-28 11:49:52.370724',NULL,0,2),(19,'hop[kl','',1,'俄罗斯腾讯云测试环境','archrey',1,0,'user1','fenglei','workflow_finish','无需审批','2021-09-28 11:50:00.000000','2021-10-28 11:50:00.000000','2021-09-28 11:50:35.859212','2021-09-28 11:50:39.384975',0,2);
/*!40000 ALTER TABLE `sql_workflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sql_workflow_content`
--

DROP TABLE IF EXISTS `sql_workflow_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sql_workflow_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sql_content` longtext NOT NULL,
  `review_content` longtext NOT NULL,
  `execute_result` longtext NOT NULL,
  `workflow_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `workflow_id` (`workflow_id`) USING BTREE,
  CONSTRAINT `sql_workflow_content_workflow_id_3af79b62_fk_sql_workflow_id` FOREIGN KEY (`workflow_id`) REFERENCES `sql_workflow` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sql_workflow_content`
--

LOCK TABLES `sql_workflow_content` WRITE;
/*!40000 ALTER TABLE `sql_workflow_content` DISABLE KEYS */;
INSERT INTO `sql_workflow_content` VALUES (5,'CREATE TABLE `achery` (\r\n`id` int(10) NOT NULL,\r\n`category_name` varchar(500) DEFAULT NULL COMMENT \'类目名\',\r\n`category_value` varchar(500) DEFAULT NULL COMMENT \'类目值\',\r\n`remark` varchar(500) DEFAULT NULL COMMENT \'备注\',\r\n`created_at` datetime DEFAULT NULL COMMENT \'创建时间\',\r\n`created_by` varchar(45) DEFAULT NULL COMMENT \'创建人\',\r\n`modified_at` datetime DEFAULT NULL COMMENT \'更新时间\',\r\n`modified_by` varchar(45) DEFAULT NULL COMMENT \'更新人\',\r\n`is_deleted` tinyint(1) DEFAULT \'0\' COMMENT \'是否删除\',\r\n`deleted_at` datetime DEFAULT NULL COMMENT \'删除时间\',\r\n`deleted_by` varchar(45) DEFAULT NULL COMMENT \'删除人\',\r\nPRIMARY KEY (`id`) USING BTREE\r\n) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 ROW_FORMAT = DYNAMIC COMMENT = \'类目表\'','[{\"id\": 1, \"stage\": \"CHECKED\", \"errlevel\": 0, \"stagestatus\": \"Audit Completed\", \"errormessage\": \"\", \"sql\": \"use `app_api`\", \"affected_rows\": 0, \"sequence\": \"0_0_00000000\", \"backup_dbname\": \"\", \"execute_time\": \"0\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}, {\"id\": 2, \"stage\": \"CHECKED\", \"errlevel\": 1, \"stagestatus\": \"Audit Completed\", \"errormessage\": \"Not allowed set charset for table \'achery\'.\", \"sql\": \"CREATE TABLE `achery` (\\r\\n`id` int(10) NOT NULL,\\r\\n`category_name` varchar(500) DEFAULT NULL COMMENT \'\\u7c7b\\u76ee\\u540d\',\\r\\n`category_value` varchar(500) DEFAULT NULL COMMENT \'\\u7c7b\\u76ee\\u503c\',\\r\\n`remark` varchar(500) DEFAULT NULL COMMENT \'\\u5907\\u6ce8\',\\r\\n`created_at` datetime DEFAULT NULL COMMENT \'\\u521b\\u5efa\\u65f6\\u95f4\',\\r\\n`created_by` varchar(45) DEFAULT NULL COMMENT \'\\u521b\\u5efa\\u4eba\',\\r\\n`modified_at` datetime DEFAULT NULL COMMENT \'\\u66f4\\u65b0\\u65f6\\u95f4\',\\r\\n`modified_by` varchar(45) DEFAULT NULL COMMENT \'\\u66f4\\u65b0\\u4eba\',\\r\\n`is_deleted` tinyint(1) DEFAULT \'0\' COMMENT \'\\u662f\\u5426\\u5220\\u9664\',\\r\\n`deleted_at` datetime DEFAULT NULL COMMENT \'\\u5220\\u9664\\u65f6\\u95f4\',\\r\\n`deleted_by` varchar(45) DEFAULT NULL COMMENT \'\\u5220\\u9664\\u4eba\',\\r\\nPRIMARY KEY (`id`) USING BTREE\\r\\n) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 ROW_FORMAT = DYNAMIC COMMENT = \'\\u7c7b\\u76ee\\u8868\'\", \"affected_rows\": 0, \"sequence\": \"0_0_00000001\", \"backup_dbname\": \"\", \"execute_time\": \"0\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}]','',5),(6,'CREATE TABLE `achery` (\r\n`id` int(10) NOT NULL,\r\n`category_name` varchar(500) DEFAULT NULL COMMENT \'类目名\',\r\n`category_value` varchar(500) DEFAULT NULL COMMENT \'类目值\',\r\n`remark` varchar(500) DEFAULT NULL COMMENT \'备注\',\r\n`created_at` datetime DEFAULT NULL COMMENT \'创建时间\',\r\n`created_by` varchar(45) DEFAULT NULL COMMENT \'创建人\',\r\n`modified_at` datetime DEFAULT NULL COMMENT \'更新时间\',\r\n`modified_by` varchar(45) DEFAULT NULL COMMENT \'更新人\',\r\n`is_deleted` tinyint(1) DEFAULT \'0\' COMMENT \'是否删除\',\r\n`deleted_at` datetime DEFAULT NULL COMMENT \'删除时间\',\r\n`deleted_by` varchar(45) DEFAULT NULL COMMENT \'删除人\',\r\nPRIMARY KEY (`id`) USING BTREE\r\n) ENGINE = InnoDB','[{\"id\": 1, \"stage\": \"CHECKED\", \"errlevel\": 0, \"stagestatus\": \"Audit Completed\", \"errormessage\": \"\", \"sql\": \"use `app_api`\", \"affected_rows\": 0, \"sequence\": \"0_0_00000000\", \"backup_dbname\": \"\", \"execute_time\": \"0\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}, {\"id\": 2, \"stage\": \"CHECKED\", \"errlevel\": 0, \"stagestatus\": \"Audit Completed\", \"errormessage\": \"\", \"sql\": \"CREATE TABLE `achery` (\\r\\n`id` int(10) NOT NULL,\\r\\n`category_name` varchar(500) DEFAULT NULL COMMENT \'\\u7c7b\\u76ee\\u540d\',\\r\\n`category_value` varchar(500) DEFAULT NULL COMMENT \'\\u7c7b\\u76ee\\u503c\',\\r\\n`remark` varchar(500) DEFAULT NULL COMMENT \'\\u5907\\u6ce8\',\\r\\n`created_at` datetime DEFAULT NULL COMMENT \'\\u521b\\u5efa\\u65f6\\u95f4\',\\r\\n`created_by` varchar(45) DEFAULT NULL COMMENT \'\\u521b\\u5efa\\u4eba\',\\r\\n`modified_at` datetime DEFAULT NULL COMMENT \'\\u66f4\\u65b0\\u65f6\\u95f4\',\\r\\n`modified_by` varchar(45) DEFAULT NULL COMMENT \'\\u66f4\\u65b0\\u4eba\',\\r\\n`is_deleted` tinyint(1) DEFAULT \'0\' COMMENT \'\\u662f\\u5426\\u5220\\u9664\',\\r\\n`deleted_at` datetime DEFAULT NULL COMMENT \'\\u5220\\u9664\\u65f6\\u95f4\',\\r\\n`deleted_by` varchar(45) DEFAULT NULL COMMENT \'\\u5220\\u9664\\u4eba\',\\r\\nPRIMARY KEY (`id`) USING BTREE\\r\\n) ENGINE = InnoDB\", \"affected_rows\": 0, \"sequence\": \"0_0_00000001\", \"backup_dbname\": \"\", \"execute_time\": \"0\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}]','[{\"id\": 1, \"stage\": \"EXECUTED\", \"errlevel\": 0, \"stagestatus\": \"Execute Successfully\", \"errormessage\": \"\", \"sql\": \"use `app_api`\", \"affected_rows\": 0, \"sequence\": \"1620805707_16702335_00000000\", \"backup_dbname\": \"\", \"execute_time\": \"0.000\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}, {\"id\": 2, \"stage\": \"EXECUTED\", \"errlevel\": 0, \"stagestatus\": \"Execute Successfully\", \"errormessage\": \"\", \"sql\": \"CREATE TABLE `achery` (\\r\\n`id` int(10) NOT NULL,\\r\\n`category_name` varchar(500) DEFAULT NULL COMMENT \'\\u7c7b\\u76ee\\u540d\',\\r\\n`category_value` varchar(500) DEFAULT NULL COMMENT \'\\u7c7b\\u76ee\\u503c\',\\r\\n`remark` varchar(500) DEFAULT NULL COMMENT \'\\u5907\\u6ce8\',\\r\\n`created_at` datetime DEFAULT NULL COMMENT \'\\u521b\\u5efa\\u65f6\\u95f4\',\\r\\n`created_by` varchar(45) DEFAULT NULL COMMENT \'\\u521b\\u5efa\\u4eba\',\\r\\n`modified_at` datetime DEFAULT NULL COMMENT \'\\u66f4\\u65b0\\u65f6\\u95f4\',\\r\\n`modified_by` varchar(45) DEFAULT NULL COMMENT \'\\u66f4\\u65b0\\u4eba\',\\r\\n`is_deleted` tinyint(1) DEFAULT \'0\' COMMENT \'\\u662f\\u5426\\u5220\\u9664\',\\r\\n`deleted_at` datetime DEFAULT NULL COMMENT \'\\u5220\\u9664\\u65f6\\u95f4\',\\r\\n`deleted_by` varchar(45) DEFAULT NULL COMMENT \'\\u5220\\u9664\\u4eba\',\\r\\nPRIMARY KEY (`id`) USING BTREE\\r\\n) ENGINE = InnoDB\", \"affected_rows\": 0, \"sequence\": \"1620805707_16702335_00000001\", \"backup_dbname\": \"\", \"execute_time\": \"0.010\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}]',6),(7,'CREATE TABLE `1` (\r\n`id` int(10) NOT NULL,\r\n`category_name` varchar(500) DEFAULT NULL COMMENT \'类目名\',\r\n`category_value` varchar(500) DEFAULT NULL COMMENT \'类目值\',\r\n`remark` varchar(500) DEFAULT NULL COMMENT \'备注\',\r\n`created_at` datetime DEFAULT NULL COMMENT \'创建时间\',\r\n`created_by` varchar(45) DEFAULT NULL COMMENT \'创建人\',\r\n`modified_at` datetime DEFAULT NULL COMMENT \'更新时间\',\r\n`modified_by` varchar(45) DEFAULT NULL COMMENT \'更新人\',\r\n`is_deleted` tinyint(1) DEFAULT \'0\' COMMENT \'是否删除\',\r\n`deleted_at` datetime DEFAULT NULL COMMENT \'删除时间\',\r\n`deleted_by` varchar(45) DEFAULT NULL COMMENT \'删除人\',\r\nPRIMARY KEY (`id`) USING BTREE\r\n) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 ROW_FORMAT = DYNAMIC COMMENT = \'类目表\'','[{\"id\": 1, \"stage\": \"CHECKED\", \"errlevel\": 0, \"stagestatus\": \"Audit Completed\", \"errormessage\": \"\", \"sql\": \"use `app_api`\", \"affected_rows\": 0, \"sequence\": \"0_0_00000000\", \"backup_dbname\": \"\", \"execute_time\": \"0\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}, {\"id\": 2, \"stage\": \"CHECKED\", \"errlevel\": 1, \"stagestatus\": \"Audit Completed\", \"errormessage\": \"Not allowed set charset for table \'1\'.\", \"sql\": \"CREATE TABLE `1` (\\r\\n`id` int(10) NOT NULL,\\r\\n`category_name` varchar(500) DEFAULT NULL COMMENT \'\\u7c7b\\u76ee\\u540d\',\\r\\n`category_value` varchar(500) DEFAULT NULL COMMENT \'\\u7c7b\\u76ee\\u503c\',\\r\\n`remark` varchar(500) DEFAULT NULL COMMENT \'\\u5907\\u6ce8\',\\r\\n`created_at` datetime DEFAULT NULL COMMENT \'\\u521b\\u5efa\\u65f6\\u95f4\',\\r\\n`created_by` varchar(45) DEFAULT NULL COMMENT \'\\u521b\\u5efa\\u4eba\',\\r\\n`modified_at` datetime DEFAULT NULL COMMENT \'\\u66f4\\u65b0\\u65f6\\u95f4\',\\r\\n`modified_by` varchar(45) DEFAULT NULL COMMENT \'\\u66f4\\u65b0\\u4eba\',\\r\\n`is_deleted` tinyint(1) DEFAULT \'0\' COMMENT \'\\u662f\\u5426\\u5220\\u9664\',\\r\\n`deleted_at` datetime DEFAULT NULL COMMENT \'\\u5220\\u9664\\u65f6\\u95f4\',\\r\\n`deleted_by` varchar(45) DEFAULT NULL COMMENT \'\\u5220\\u9664\\u4eba\',\\r\\nPRIMARY KEY (`id`) USING BTREE\\r\\n) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 ROW_FORMAT = DYNAMIC COMMENT = \'\\u7c7b\\u76ee\\u8868\'\", \"affected_rows\": 0, \"sequence\": \"0_0_00000001\", \"backup_dbname\": \"\", \"execute_time\": \"0\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}]','',7),(8,'CREATE TABLE `1` (\r\n`id` int(10) NOT NULL,\r\n`category_name` varchar(500) DEFAULT NULL COMMENT \'类目名\',\r\n`category_value` varchar(500) DEFAULT NULL COMMENT \'类目值\',\r\n`remark` varchar(500) DEFAULT NULL COMMENT \'备注\',\r\n`created_at` datetime DEFAULT NULL COMMENT \'创建时间\',\r\n`created_by` varchar(45) DEFAULT NULL COMMENT \'创建人\',\r\n`modified_at` datetime DEFAULT NULL COMMENT \'更新时间\',\r\n`modified_by` varchar(45) DEFAULT NULL COMMENT \'更新人\',\r\n`is_deleted` tinyint(1) DEFAULT \'0\' COMMENT \'是否删除\',\r\n`deleted_at` datetime DEFAULT NULL COMMENT \'删除时间\',\r\n`deleted_by` varchar(45) DEFAULT NULL COMMENT \'删除人\',\r\nPRIMARY KEY (`id`) USING BTREE\r\n) ENGINE = InnoDB','[{\"id\": 1, \"stage\": \"CHECKED\", \"errlevel\": 0, \"stagestatus\": \"Audit Completed\", \"errormessage\": \"\", \"sql\": \"use `app_api`\", \"affected_rows\": 0, \"sequence\": \"0_0_00000000\", \"backup_dbname\": \"\", \"execute_time\": \"0\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}, {\"id\": 2, \"stage\": \"CHECKED\", \"errlevel\": 0, \"stagestatus\": \"Audit Completed\", \"errormessage\": \"\", \"sql\": \"CREATE TABLE `1` (\\r\\n`id` int(10) NOT NULL,\\r\\n`category_name` varchar(500) DEFAULT NULL COMMENT \'\\u7c7b\\u76ee\\u540d\',\\r\\n`category_value` varchar(500) DEFAULT NULL COMMENT \'\\u7c7b\\u76ee\\u503c\',\\r\\n`remark` varchar(500) DEFAULT NULL COMMENT \'\\u5907\\u6ce8\',\\r\\n`created_at` datetime DEFAULT NULL COMMENT \'\\u521b\\u5efa\\u65f6\\u95f4\',\\r\\n`created_by` varchar(45) DEFAULT NULL COMMENT \'\\u521b\\u5efa\\u4eba\',\\r\\n`modified_at` datetime DEFAULT NULL COMMENT \'\\u66f4\\u65b0\\u65f6\\u95f4\',\\r\\n`modified_by` varchar(45) DEFAULT NULL COMMENT \'\\u66f4\\u65b0\\u4eba\',\\r\\n`is_deleted` tinyint(1) DEFAULT \'0\' COMMENT \'\\u662f\\u5426\\u5220\\u9664\',\\r\\n`deleted_at` datetime DEFAULT NULL COMMENT \'\\u5220\\u9664\\u65f6\\u95f4\',\\r\\n`deleted_by` varchar(45) DEFAULT NULL COMMENT \'\\u5220\\u9664\\u4eba\',\\r\\nPRIMARY KEY (`id`) USING BTREE\\r\\n) ENGINE = InnoDB\", \"affected_rows\": 0, \"sequence\": \"0_0_00000001\", \"backup_dbname\": \"\", \"execute_time\": \"0\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}]','[{\"id\": 1, \"stage\": \"EXECUTED\", \"errlevel\": 0, \"stagestatus\": \"Execute Successfully\", \"errormessage\": \"\", \"sql\": \"use `app_api`\", \"affected_rows\": 0, \"sequence\": \"1620812439_16711252_00000000\", \"backup_dbname\": \"\", \"execute_time\": \"0.000\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}, {\"id\": 2, \"stage\": \"EXECUTED\", \"errlevel\": 0, \"stagestatus\": \"Execute Successfully\", \"errormessage\": \"\", \"sql\": \"CREATE TABLE `1` (\\r\\n`id` int(10) NOT NULL,\\r\\n`category_name` varchar(500) DEFAULT NULL COMMENT \'\\u7c7b\\u76ee\\u540d\',\\r\\n`category_value` varchar(500) DEFAULT NULL COMMENT \'\\u7c7b\\u76ee\\u503c\',\\r\\n`remark` varchar(500) DEFAULT NULL COMMENT \'\\u5907\\u6ce8\',\\r\\n`created_at` datetime DEFAULT NULL COMMENT \'\\u521b\\u5efa\\u65f6\\u95f4\',\\r\\n`created_by` varchar(45) DEFAULT NULL COMMENT \'\\u521b\\u5efa\\u4eba\',\\r\\n`modified_at` datetime DEFAULT NULL COMMENT \'\\u66f4\\u65b0\\u65f6\\u95f4\',\\r\\n`modified_by` varchar(45) DEFAULT NULL COMMENT \'\\u66f4\\u65b0\\u4eba\',\\r\\n`is_deleted` tinyint(1) DEFAULT \'0\' COMMENT \'\\u662f\\u5426\\u5220\\u9664\',\\r\\n`deleted_at` datetime DEFAULT NULL COMMENT \'\\u5220\\u9664\\u65f6\\u95f4\',\\r\\n`deleted_by` varchar(45) DEFAULT NULL COMMENT \'\\u5220\\u9664\\u4eba\',\\r\\nPRIMARY KEY (`id`) USING BTREE\\r\\n) ENGINE = InnoDB\", \"affected_rows\": 0, \"sequence\": \"1620812439_16711252_00000001\", \"backup_dbname\": \"\", \"execute_time\": \"0.009\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}]',8),(9,'CREATE TABLE `acherytest` (\r\n`id` int(10) NOT NULL,\r\n`category_name` varchar(500) DEFAULT NULL COMMENT \'类目名\',\r\n`category_value` varchar(500) DEFAULT NULL COMMENT \'类目值\',\r\n`remark` varchar(500) DEFAULT NULL COMMENT \'备注\',\r\n`created_at` datetime DEFAULT NULL COMMENT \'创建时间\',\r\n`created_by` varchar(45) DEFAULT NULL COMMENT \'创建人\',\r\n`modified_at` datetime DEFAULT NULL COMMENT \'更新时间\',\r\n`modified_by` varchar(45) DEFAULT NULL COMMENT \'更新人\',\r\n`is_deleted` tinyint(1) DEFAULT \'0\' COMMENT \'是否删除\',\r\n`deleted_at` datetime DEFAULT NULL COMMENT \'删除时间\',\r\n`deleted_by` varchar(45) DEFAULT NULL COMMENT \'删除人\',\r\nPRIMARY KEY (`id`) USING BTREE\r\n) ENGINE = InnoDB','[{\"id\": 1, \"stage\": \"CHECKED\", \"errlevel\": 0, \"stagestatus\": \"Audit Completed\", \"errormessage\": \"\", \"sql\": \"use `app_api_bak`\", \"affected_rows\": 0, \"sequence\": \"0_0_00000000\", \"backup_dbname\": \"\", \"execute_time\": \"0\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}, {\"id\": 2, \"stage\": \"CHECKED\", \"errlevel\": 0, \"stagestatus\": \"Audit Completed\", \"errormessage\": \"\", \"sql\": \"CREATE TABLE `acherytest` (\\r\\n`id` int(10) NOT NULL,\\r\\n`category_name` varchar(500) DEFAULT NULL COMMENT \'\\u7c7b\\u76ee\\u540d\',\\r\\n`category_value` varchar(500) DEFAULT NULL COMMENT \'\\u7c7b\\u76ee\\u503c\',\\r\\n`remark` varchar(500) DEFAULT NULL COMMENT \'\\u5907\\u6ce8\',\\r\\n`created_at` datetime DEFAULT NULL COMMENT \'\\u521b\\u5efa\\u65f6\\u95f4\',\\r\\n`created_by` varchar(45) DEFAULT NULL COMMENT \'\\u521b\\u5efa\\u4eba\',\\r\\n`modified_at` datetime DEFAULT NULL COMMENT \'\\u66f4\\u65b0\\u65f6\\u95f4\',\\r\\n`modified_by` varchar(45) DEFAULT NULL COMMENT \'\\u66f4\\u65b0\\u4eba\',\\r\\n`is_deleted` tinyint(1) DEFAULT \'0\' COMMENT \'\\u662f\\u5426\\u5220\\u9664\',\\r\\n`deleted_at` datetime DEFAULT NULL COMMENT \'\\u5220\\u9664\\u65f6\\u95f4\',\\r\\n`deleted_by` varchar(45) DEFAULT NULL COMMENT \'\\u5220\\u9664\\u4eba\',\\r\\nPRIMARY KEY (`id`) USING BTREE\\r\\n) ENGINE = InnoDB\", \"affected_rows\": 0, \"sequence\": \"0_0_00000001\", \"backup_dbname\": \"\", \"execute_time\": \"0\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}]','[{\"id\": 1, \"stage\": \"EXECUTED\", \"errlevel\": 0, \"stagestatus\": \"Execute Successfully\", \"errormessage\": \"\", \"sql\": \"use `app_api_bak`\", \"affected_rows\": 0, \"sequence\": \"1620875973_16793881_00000000\", \"backup_dbname\": \"\", \"execute_time\": \"0.000\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}, {\"id\": 2, \"stage\": \"EXECUTED\", \"errlevel\": 0, \"stagestatus\": \"Execute Successfully\", \"errormessage\": \"\", \"sql\": \"CREATE TABLE `acherytest` (\\r\\n`id` int(10) NOT NULL,\\r\\n`category_name` varchar(500) DEFAULT NULL COMMENT \'\\u7c7b\\u76ee\\u540d\',\\r\\n`category_value` varchar(500) DEFAULT NULL COMMENT \'\\u7c7b\\u76ee\\u503c\',\\r\\n`remark` varchar(500) DEFAULT NULL COMMENT \'\\u5907\\u6ce8\',\\r\\n`created_at` datetime DEFAULT NULL COMMENT \'\\u521b\\u5efa\\u65f6\\u95f4\',\\r\\n`created_by` varchar(45) DEFAULT NULL COMMENT \'\\u521b\\u5efa\\u4eba\',\\r\\n`modified_at` datetime DEFAULT NULL COMMENT \'\\u66f4\\u65b0\\u65f6\\u95f4\',\\r\\n`modified_by` varchar(45) DEFAULT NULL COMMENT \'\\u66f4\\u65b0\\u4eba\',\\r\\n`is_deleted` tinyint(1) DEFAULT \'0\' COMMENT \'\\u662f\\u5426\\u5220\\u9664\',\\r\\n`deleted_at` datetime DEFAULT NULL COMMENT \'\\u5220\\u9664\\u65f6\\u95f4\',\\r\\n`deleted_by` varchar(45) DEFAULT NULL COMMENT \'\\u5220\\u9664\\u4eba\',\\r\\nPRIMARY KEY (`id`) USING BTREE\\r\\n) ENGINE = InnoDB\", \"affected_rows\": 0, \"sequence\": \"1620875973_16793881_00000001\", \"backup_dbname\": \"\", \"execute_time\": \"0.011\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}]',9),(10,'CREATE TABLE `achery1111` (\r\n`id` int(10) NOT NULL,\r\n`category_name` varchar(500) DEFAULT NULL COMMENT \'类目名\',\r\n`category_value` varchar(500) DEFAULT NULL COMMENT \'类目值\',\r\n`remark` varchar(500) DEFAULT NULL COMMENT \'备注\',\r\n`created_at` datetime DEFAULT NULL COMMENT \'创建时间\',\r\n`created_by` varchar(45) DEFAULT NULL COMMENT \'创建人\',\r\n`modified_at` datetime DEFAULT NULL COMMENT \'更新时间\',\r\n`modified_by` varchar(45) DEFAULT NULL COMMENT \'更新人\',\r\n`is_deleted` tinyint(1) DEFAULT \'0\' COMMENT \'是否删除\',\r\n`deleted_at` datetime DEFAULT NULL COMMENT \'删除时间\',\r\n`deleted_by` varchar(45) DEFAULT NULL COMMENT \'删除人\',\r\nPRIMARY KEY (`id`) USING BTREE\r\n) ENGINE = InnoDB','[{\"id\": 1, \"stage\": \"CHECKED\", \"errlevel\": 0, \"stagestatus\": \"Audit Completed\", \"errormessage\": \"\", \"sql\": \"use `app_api_bak`\", \"affected_rows\": 0, \"sequence\": \"0_0_00000000\", \"backup_dbname\": \"\", \"execute_time\": \"0\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}, {\"id\": 2, \"stage\": \"CHECKED\", \"errlevel\": 0, \"stagestatus\": \"Audit Completed\", \"errormessage\": \"\", \"sql\": \"CREATE TABLE `achery1111` (\\r\\n`id` int(10) NOT NULL,\\r\\n`category_name` varchar(500) DEFAULT NULL COMMENT \'\\u7c7b\\u76ee\\u540d\',\\r\\n`category_value` varchar(500) DEFAULT NULL COMMENT \'\\u7c7b\\u76ee\\u503c\',\\r\\n`remark` varchar(500) DEFAULT NULL COMMENT \'\\u5907\\u6ce8\',\\r\\n`created_at` datetime DEFAULT NULL COMMENT \'\\u521b\\u5efa\\u65f6\\u95f4\',\\r\\n`created_by` varchar(45) DEFAULT NULL COMMENT \'\\u521b\\u5efa\\u4eba\',\\r\\n`modified_at` datetime DEFAULT NULL COMMENT \'\\u66f4\\u65b0\\u65f6\\u95f4\',\\r\\n`modified_by` varchar(45) DEFAULT NULL COMMENT \'\\u66f4\\u65b0\\u4eba\',\\r\\n`is_deleted` tinyint(1) DEFAULT \'0\' COMMENT \'\\u662f\\u5426\\u5220\\u9664\',\\r\\n`deleted_at` datetime DEFAULT NULL COMMENT \'\\u5220\\u9664\\u65f6\\u95f4\',\\r\\n`deleted_by` varchar(45) DEFAULT NULL COMMENT \'\\u5220\\u9664\\u4eba\',\\r\\nPRIMARY KEY (`id`) USING BTREE\\r\\n) ENGINE = InnoDB\", \"affected_rows\": 0, \"sequence\": \"0_0_00000001\", \"backup_dbname\": \"\", \"execute_time\": \"0\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}]','[{\"id\": 1, \"stage\": \"EXECUTED\", \"errlevel\": 0, \"stagestatus\": \"Execute Successfully\", \"errormessage\": \"\", \"sql\": \"use `app_api_bak`\", \"affected_rows\": 0, \"sequence\": \"1620900084_16824149_00000000\", \"backup_dbname\": \"\", \"execute_time\": \"0.000\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}, {\"id\": 2, \"stage\": \"EXECUTED\", \"errlevel\": 0, \"stagestatus\": \"Execute Successfully\", \"errormessage\": \"\", \"sql\": \"CREATE TABLE `achery1111` (\\r\\n`id` int(10) NOT NULL,\\r\\n`category_name` varchar(500) DEFAULT NULL COMMENT \'\\u7c7b\\u76ee\\u540d\',\\r\\n`category_value` varchar(500) DEFAULT NULL COMMENT \'\\u7c7b\\u76ee\\u503c\',\\r\\n`remark` varchar(500) DEFAULT NULL COMMENT \'\\u5907\\u6ce8\',\\r\\n`created_at` datetime DEFAULT NULL COMMENT \'\\u521b\\u5efa\\u65f6\\u95f4\',\\r\\n`created_by` varchar(45) DEFAULT NULL COMMENT \'\\u521b\\u5efa\\u4eba\',\\r\\n`modified_at` datetime DEFAULT NULL COMMENT \'\\u66f4\\u65b0\\u65f6\\u95f4\',\\r\\n`modified_by` varchar(45) DEFAULT NULL COMMENT \'\\u66f4\\u65b0\\u4eba\',\\r\\n`is_deleted` tinyint(1) DEFAULT \'0\' COMMENT \'\\u662f\\u5426\\u5220\\u9664\',\\r\\n`deleted_at` datetime DEFAULT NULL COMMENT \'\\u5220\\u9664\\u65f6\\u95f4\',\\r\\n`deleted_by` varchar(45) DEFAULT NULL COMMENT \'\\u5220\\u9664\\u4eba\',\\r\\nPRIMARY KEY (`id`) USING BTREE\\r\\n) ENGINE = InnoDB\", \"affected_rows\": 0, \"sequence\": \"1620900084_16824149_00000001\", \"backup_dbname\": \"\", \"execute_time\": \"0.009\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}]',10),(11,'delete from achery1111','[{\"id\": 1, \"stage\": \"CHECKED\", \"errlevel\": 0, \"stagestatus\": \"Audit Completed\", \"errormessage\": \"\", \"sql\": \"use `app_api_bak`\", \"affected_rows\": 0, \"sequence\": \"0_0_00000000\", \"backup_dbname\": \"\", \"execute_time\": \"0\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}, {\"id\": 2, \"stage\": \"CHECKED\", \"errlevel\": 0, \"stagestatus\": \"Audit Completed\", \"errormessage\": \"\", \"sql\": \"delete from achery1111\", \"affected_rows\": 1, \"sequence\": \"0_0_00000001\", \"backup_dbname\": \"\", \"execute_time\": \"0\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}]','[{\"id\": 1, \"stage\": \"EXECUTED\", \"errlevel\": 0, \"stagestatus\": \"Execute Successfully\", \"errormessage\": \"\", \"sql\": \"use `app_api_bak`\", \"affected_rows\": 0, \"sequence\": \"1620900408_16824558_00000000\", \"backup_dbname\": \"\", \"execute_time\": \"0.000\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}, {\"id\": 2, \"stage\": \"EXECUTED\", \"errlevel\": 0, \"stagestatus\": \"Execute Successfully\", \"errormessage\": \"\", \"sql\": \"delete from achery1111\", \"affected_rows\": 0, \"sequence\": \"1620900408_16824558_00000001\", \"backup_dbname\": \"\", \"execute_time\": \"0.001\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}]',11),(12,'CREATE TABLE `achery4444` (\r\n`id` int(10) NOT NULL,\r\n`category_name` varchar(500) DEFAULT NULL COMMENT \'类目名\',\r\n`category_value` varchar(500) DEFAULT NULL COMMENT \'类目值\',\r\n`remark` varchar(500) DEFAULT NULL COMMENT \'备注\',\r\n`created_at` datetime DEFAULT NULL COMMENT \'创建时间\',\r\n`created_by` varchar(45) DEFAULT NULL COMMENT \'创建人\',\r\n`modified_at` datetime DEFAULT NULL COMMENT \'更新时间\',\r\n`modified_by` varchar(45) DEFAULT NULL COMMENT \'更新人\',\r\n`is_deleted` tinyint(1) DEFAULT \'0\' COMMENT \'是否删除\',\r\n`deleted_at` datetime DEFAULT NULL COMMENT \'删除时间\',\r\n`deleted_by` varchar(45) DEFAULT NULL COMMENT \'删除人\',\r\nPRIMARY KEY (`id`) USING BTREE\r\n) ENGINE = InnoDB','[{\"id\": 1, \"stage\": \"CHECKED\", \"errlevel\": 0, \"stagestatus\": \"Audit Completed\", \"errormessage\": \"\", \"sql\": \"use `app_api_bak`\", \"affected_rows\": 0, \"sequence\": \"0_0_00000000\", \"backup_dbname\": \"\", \"execute_time\": \"0\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}, {\"id\": 2, \"stage\": \"CHECKED\", \"errlevel\": 0, \"stagestatus\": \"Audit Completed\", \"errormessage\": \"\", \"sql\": \"CREATE TABLE `achery4444` (\\r\\n`id` int(10) NOT NULL,\\r\\n`category_name` varchar(500) DEFAULT NULL COMMENT \'\\u7c7b\\u76ee\\u540d\',\\r\\n`category_value` varchar(500) DEFAULT NULL COMMENT \'\\u7c7b\\u76ee\\u503c\',\\r\\n`remark` varchar(500) DEFAULT NULL COMMENT \'\\u5907\\u6ce8\',\\r\\n`created_at` datetime DEFAULT NULL COMMENT \'\\u521b\\u5efa\\u65f6\\u95f4\',\\r\\n`created_by` varchar(45) DEFAULT NULL COMMENT \'\\u521b\\u5efa\\u4eba\',\\r\\n`modified_at` datetime DEFAULT NULL COMMENT \'\\u66f4\\u65b0\\u65f6\\u95f4\',\\r\\n`modified_by` varchar(45) DEFAULT NULL COMMENT \'\\u66f4\\u65b0\\u4eba\',\\r\\n`is_deleted` tinyint(1) DEFAULT \'0\' COMMENT \'\\u662f\\u5426\\u5220\\u9664\',\\r\\n`deleted_at` datetime DEFAULT NULL COMMENT \'\\u5220\\u9664\\u65f6\\u95f4\',\\r\\n`deleted_by` varchar(45) DEFAULT NULL COMMENT \'\\u5220\\u9664\\u4eba\',\\r\\nPRIMARY KEY (`id`) USING BTREE\\r\\n) ENGINE = InnoDB\", \"affected_rows\": 0, \"sequence\": \"0_0_00000001\", \"backup_dbname\": \"\", \"execute_time\": \"0\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}]','[{\"id\": 1, \"stage\": \"EXECUTED\", \"errlevel\": 0, \"stagestatus\": \"Execute Successfully\", \"errormessage\": \"\", \"sql\": \"use `app_api_bak`\", \"affected_rows\": 0, \"sequence\": \"1620900891_16825185_00000000\", \"backup_dbname\": \"\", \"execute_time\": \"0.000\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}, {\"id\": 2, \"stage\": \"EXECUTED\", \"errlevel\": 0, \"stagestatus\": \"Execute Successfully\", \"errormessage\": \"\", \"sql\": \"CREATE TABLE `achery4444` (\\r\\n`id` int(10) NOT NULL,\\r\\n`category_name` varchar(500) DEFAULT NULL COMMENT \'\\u7c7b\\u76ee\\u540d\',\\r\\n`category_value` varchar(500) DEFAULT NULL COMMENT \'\\u7c7b\\u76ee\\u503c\',\\r\\n`remark` varchar(500) DEFAULT NULL COMMENT \'\\u5907\\u6ce8\',\\r\\n`created_at` datetime DEFAULT NULL COMMENT \'\\u521b\\u5efa\\u65f6\\u95f4\',\\r\\n`created_by` varchar(45) DEFAULT NULL COMMENT \'\\u521b\\u5efa\\u4eba\',\\r\\n`modified_at` datetime DEFAULT NULL COMMENT \'\\u66f4\\u65b0\\u65f6\\u95f4\',\\r\\n`modified_by` varchar(45) DEFAULT NULL COMMENT \'\\u66f4\\u65b0\\u4eba\',\\r\\n`is_deleted` tinyint(1) DEFAULT \'0\' COMMENT \'\\u662f\\u5426\\u5220\\u9664\',\\r\\n`deleted_at` datetime DEFAULT NULL COMMENT \'\\u5220\\u9664\\u65f6\\u95f4\',\\r\\n`deleted_by` varchar(45) DEFAULT NULL COMMENT \'\\u5220\\u9664\\u4eba\',\\r\\nPRIMARY KEY (`id`) USING BTREE\\r\\n) ENGINE = InnoDB\", \"affected_rows\": 0, \"sequence\": \"1620900891_16825185_00000001\", \"backup_dbname\": \"\", \"execute_time\": \"0.010\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}]',12),(13,'CREATE TABLE `api_item_we` (\r\n`id` int(10) NOT NULL,\r\n`category_name` varchar(500) DEFAULT NULL COMMENT \'类目名\',\r\n`category_value` varchar(500) DEFAULT NULL COMMENT \'类目值\',\r\n`remark` varchar(500) DEFAULT NULL COMMENT \'备注\',\r\n`created_at` datetime DEFAULT NULL COMMENT \'创建时间\',\r\n`created_by` varchar(45) DEFAULT NULL COMMENT \'创建人\',\r\n`modified_at` datetime DEFAULT NULL COMMENT \'更新时间\',\r\n`modified_by` varchar(45) DEFAULT NULL COMMENT \'更新人\',\r\n`ystem` tinyint(1) DEFAULT \'0\' COMMENT \'是否删除\',\r\n`deleted_at` datetime DEFAULT NULL COMMENT \'删除时间\',\r\n`deleted_by` varchar(45) DEFAULT NULL COMMENT \'删除人\',\r\nPRIMARY KEY (`id`) USING BTREE\r\n) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 ROW_FORMAT = DYNAMIC COMMENT = \'类目表\'','[{\"id\": 1, \"stage\": \"CHECKED\", \"errlevel\": 0, \"stagestatus\": \"Audit Completed\", \"errormessage\": \"\", \"sql\": \"use `app_api_bak`\", \"affected_rows\": 0, \"sequence\": \"0_0_00000000\", \"backup_dbname\": \"\", \"execute_time\": \"0\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}, {\"id\": 2, \"stage\": \"CHECKED\", \"errlevel\": 1, \"stagestatus\": \"Audit Completed\", \"errormessage\": \"Not allowed set charset for table \'api_item_we\'.\", \"sql\": \"CREATE TABLE `api_item_we` (\\r\\n`id` int(10) NOT NULL,\\r\\n`category_name` varchar(500) DEFAULT NULL COMMENT \'\\u7c7b\\u76ee\\u540d\',\\r\\n`category_value` varchar(500) DEFAULT NULL COMMENT \'\\u7c7b\\u76ee\\u503c\',\\r\\n`remark` varchar(500) DEFAULT NULL COMMENT \'\\u5907\\u6ce8\',\\r\\n`created_at` datetime DEFAULT NULL COMMENT \'\\u521b\\u5efa\\u65f6\\u95f4\',\\r\\n`created_by` varchar(45) DEFAULT NULL COMMENT \'\\u521b\\u5efa\\u4eba\',\\r\\n`modified_at` datetime DEFAULT NULL COMMENT \'\\u66f4\\u65b0\\u65f6\\u95f4\',\\r\\n`modified_by` varchar(45) DEFAULT NULL COMMENT \'\\u66f4\\u65b0\\u4eba\',\\r\\n`ystem` tinyint(1) DEFAULT \'0\' COMMENT \'\\u662f\\u5426\\u5220\\u9664\',\\r\\n`deleted_at` datetime DEFAULT NULL COMMENT \'\\u5220\\u9664\\u65f6\\u95f4\',\\r\\n`deleted_by` varchar(45) DEFAULT NULL COMMENT \'\\u5220\\u9664\\u4eba\',\\r\\nPRIMARY KEY (`id`) USING BTREE\\r\\n) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 ROW_FORMAT = DYNAMIC COMMENT = \'\\u7c7b\\u76ee\\u8868\'\", \"affected_rows\": 0, \"sequence\": \"0_0_00000001\", \"backup_dbname\": \"\", \"execute_time\": \"0\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}]','',13),(14,'CREATE TABLE card_coupons_manage_bak11 (\r\n`id` int(10) NOT NULL,\r\n`category_name` varchar(500) DEFAULT NULL COMMENT \'类目名\',\r\n`category_value` varchar(500) DEFAULT NULL COMMENT \'类目值\',\r\n`remark` varchar(500) DEFAULT NULL COMMENT \'备注\',\r\n`created_at` datetime DEFAULT NULL COMMENT \'创建时间\',\r\n`created_by` varchar(45) DEFAULT NULL COMMENT \'创建人\',\r\n`modified_at` datetime DEFAULT NULL COMMENT \'更新时间\',\r\n`modified_by` varchar(45) DEFAULT NULL COMMENT \'更新人\',\r\n`ystem` tinyint(1) DEFAULT \'0\' COMMENT \'是否删除\',\r\n`deleted_at` datetime DEFAULT NULL COMMENT \'删除时间\',\r\n`deleted_by` varchar(45) DEFAULT NULL COMMENT \'删除人\',\r\nPRIMARY KEY (`id`) USING BTREE\r\n) ENGINE = InnoDB  ROW_FORMAT = DYNAMIC COMMENT = \'类目表\'','[{\"id\": 1, \"stage\": \"CHECKED\", \"errlevel\": 0, \"stagestatus\": \"Audit Completed\", \"errormessage\": \"\", \"sql\": \"use `app_api_bak`\", \"affected_rows\": 0, \"sequence\": \"0_0_00000000\", \"backup_dbname\": \"\", \"execute_time\": \"0\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}, {\"id\": 2, \"stage\": \"CHECKED\", \"errlevel\": 0, \"stagestatus\": \"Audit Completed\", \"errormessage\": \"\", \"sql\": \"CREATE TABLE card_coupons_manage_bak11 (\\r\\n`id` int(10) NOT NULL,\\r\\n`category_name` varchar(500) DEFAULT NULL COMMENT \'\\u7c7b\\u76ee\\u540d\',\\r\\n`category_value` varchar(500) DEFAULT NULL COMMENT \'\\u7c7b\\u76ee\\u503c\',\\r\\n`remark` varchar(500) DEFAULT NULL COMMENT \'\\u5907\\u6ce8\',\\r\\n`created_at` datetime DEFAULT NULL COMMENT \'\\u521b\\u5efa\\u65f6\\u95f4\',\\r\\n`created_by` varchar(45) DEFAULT NULL COMMENT \'\\u521b\\u5efa\\u4eba\',\\r\\n`modified_at` datetime DEFAULT NULL COMMENT \'\\u66f4\\u65b0\\u65f6\\u95f4\',\\r\\n`modified_by` varchar(45) DEFAULT NULL COMMENT \'\\u66f4\\u65b0\\u4eba\',\\r\\n`ystem` tinyint(1) DEFAULT \'0\' COMMENT \'\\u662f\\u5426\\u5220\\u9664\',\\r\\n`deleted_at` datetime DEFAULT NULL COMMENT \'\\u5220\\u9664\\u65f6\\u95f4\',\\r\\n`deleted_by` varchar(45) DEFAULT NULL COMMENT \'\\u5220\\u9664\\u4eba\',\\r\\nPRIMARY KEY (`id`) USING BTREE\\r\\n) ENGINE = InnoDB  ROW_FORMAT = DYNAMIC COMMENT = \'\\u7c7b\\u76ee\\u8868\'\", \"affected_rows\": 0, \"sequence\": \"0_0_00000001\", \"backup_dbname\": \"\", \"execute_time\": \"0\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}]','',14),(15,'-- 请在此输入SQL，以分号结尾，仅支持DML和DDL语句，查询语句请使用SQL查询功能。\r\nCREATE TABLE `ofextcomponentconf`  (\r\n  `subdomain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,\r\n  `wildcard` tinyint(4) NOT NULL,\r\n  `secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,\r\n  `permission` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,\r\n  PRIMARY KEY (`subdomain`) USING BTREE\r\n) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;','[{\"id\": 1, \"stage\": \"CHECKED\", \"errlevel\": 0, \"stagestatus\": \"Audit Completed\", \"errormessage\": \"\", \"sql\": \"use `app_api`\", \"affected_rows\": 0, \"sequence\": \"0_0_00000000\", \"backup_dbname\": \"\", \"execute_time\": \"0\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}, {\"id\": 2, \"stage\": \"CHECKED\", \"errlevel\": 1, \"stagestatus\": \"Audit Completed\", \"errormessage\": \"Not allowed set charset for table \'ofextcomponentconf\'.\\nNot allowed set collation for table \'ofextcomponentconf\'.\\nNot Allowed set charset for column \'ofextcomponentconf.subdomain\'.\\nNot Allowed set charset for column \'ofextcomponentconf.subdomain\'.\\nNot Allowed set charset for column \'ofextcomponentconf.secret\'.\\nNot Allowed set charset for column \'ofextcomponentconf.secret\'.\\nNot Allowed set charset for column \'ofextcomponentconf.permission\'.\\nNot Allowed set charset for column \'ofextcomponentconf.permission\'.\", \"sql\": \"-- \\u8bf7\\u5728\\u6b64\\u8f93\\u5165SQL\\uff0c\\u4ee5\\u5206\\u53f7\\u7ed3\\u5c3e\\uff0c\\u4ec5\\u652f\\u6301DML\\u548cDDL\\u8bed\\u53e5\\uff0c\\u67e5\\u8be2\\u8bed\\u53e5\\u8bf7\\u4f7f\\u7528SQL\\u67e5\\u8be2\\u529f\\u80fd\\u3002\\r\\nCREATE TABLE `ofextcomponentconf`  (\\r\\n  `subdomain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,\\r\\n  `wildcard` tinyint(4) NOT NULL,\\r\\n  `secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,\\r\\n  `permission` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,\\r\\n  PRIMARY KEY (`subdomain`) USING BTREE\\r\\n) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic\", \"affected_rows\": 0, \"sequence\": \"0_0_00000001\", \"backup_dbname\": \"\", \"execute_time\": \"0\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}]','',15),(16,'CREATE TABLE ofecomponentconf (\r\n  `subdomain` varchar(255)  NOT NULL,\r\n  `wildcard` tinyint(4) NOT NULL,\r\n  `secret` varchar(255) DEFAULT NULL,\r\n  `permission` varchar(10)  NOT NULL,\r\n  PRIMARY KEY (`subdomain`) USING BTREE\r\n) ENGINE = InnoDB  ROW_FORMAT = Dynamic;','[{\"id\": 1, \"stage\": \"CHECKED\", \"errlevel\": 0, \"stagestatus\": \"Audit Completed\", \"errormessage\": \"\", \"sql\": \"use `app_api`\", \"affected_rows\": 0, \"sequence\": \"0_0_00000000\", \"backup_dbname\": \"\", \"execute_time\": \"0\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}, {\"id\": 2, \"stage\": \"CHECKED\", \"errlevel\": 0, \"stagestatus\": \"Audit Completed\", \"errormessage\": \"\", \"sql\": \"CREATE TABLE ofecomponentconf (\\r\\n  `subdomain` varchar(255)  NOT NULL,\\r\\n  `wildcard` tinyint(4) NOT NULL,\\r\\n  `secret` varchar(255) DEFAULT NULL,\\r\\n  `permission` varchar(10)  NOT NULL,\\r\\n  PRIMARY KEY (`subdomain`) USING BTREE\\r\\n) ENGINE = InnoDB  ROW_FORMAT = Dynamic\", \"affected_rows\": 0, \"sequence\": \"0_0_00000001\", \"backup_dbname\": \"\", \"execute_time\": \"0\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}]','',16),(17,'CREATE TABLE `ofgroup`  (\r\n  `groupName` varchar(50)  NOT NULL,\r\n  `description` varchar(255) DEFAULT NULL,\r\n  PRIMARY KEY (`groupName`) \r\n) ENGINE = InnoDB  ROW_FORMAT = Dynamic;','[{\"id\": 1, \"stage\": \"CHECKED\", \"errlevel\": 0, \"stagestatus\": \"Audit Completed\", \"errormessage\": \"\", \"sql\": \"use `archrey`\", \"affected_rows\": 0, \"sequence\": \"0_0_00000000\", \"backup_dbname\": \"\", \"execute_time\": \"0\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}, {\"id\": 2, \"stage\": \"CHECKED\", \"errlevel\": 0, \"stagestatus\": \"Audit Completed\", \"errormessage\": \"\", \"sql\": \"CREATE TABLE `ofgroup`  (\\r\\n  `groupName` varchar(50)  NOT NULL,\\r\\n  `description` varchar(255) DEFAULT NULL,\\r\\n  PRIMARY KEY (`groupName`) \\r\\n) ENGINE = InnoDB  ROW_FORMAT = Dynamic\", \"affected_rows\": 0, \"sequence\": \"0_0_00000001\", \"backup_dbname\": \"\", \"execute_time\": \"0\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}]','',17),(18,'CREATE TABLE `ofgroup`  (\r\n  `groupName` varchar(50)  NOT NULL,\r\n  `description` varchar(255) DEFAULT NULL,\r\n  PRIMARY KEY (`groupName`) \r\n) ENGINE = InnoDB  ROW_FORMAT = Dynamic;','[{\"id\": 1, \"stage\": \"CHECKED\", \"errlevel\": 0, \"stagestatus\": \"Audit Completed\", \"errormessage\": \"\", \"sql\": \"use `archrey`\", \"affected_rows\": 0, \"sequence\": \"0_0_00000000\", \"backup_dbname\": \"\", \"execute_time\": \"0\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}, {\"id\": 2, \"stage\": \"CHECKED\", \"errlevel\": 0, \"stagestatus\": \"Audit Completed\", \"errormessage\": \"\", \"sql\": \"CREATE TABLE `ofgroup`  (\\r\\n  `groupName` varchar(50)  NOT NULL,\\r\\n  `description` varchar(255) DEFAULT NULL,\\r\\n  PRIMARY KEY (`groupName`) \\r\\n) ENGINE = InnoDB  ROW_FORMAT = Dynamic\", \"affected_rows\": 0, \"sequence\": \"0_0_00000001\", \"backup_dbname\": \"\", \"execute_time\": \"0\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}]','',18),(19,'CREATE TABLE `ofgroup`  (\r\n  `groupName` varchar(50)  NOT NULL,\r\n  `description` varchar(255) DEFAULT NULL,\r\n  PRIMARY KEY (`groupName`) \r\n) ENGINE = InnoDB  ROW_FORMAT = Dynamic;','[{\"id\": 1, \"stage\": \"CHECKED\", \"errlevel\": 0, \"stagestatus\": \"Audit Completed\", \"errormessage\": \"\", \"sql\": \"use `archrey`\", \"affected_rows\": 0, \"sequence\": \"0_0_00000000\", \"backup_dbname\": \"\", \"execute_time\": \"0\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}, {\"id\": 2, \"stage\": \"CHECKED\", \"errlevel\": 0, \"stagestatus\": \"Audit Completed\", \"errormessage\": \"\", \"sql\": \"CREATE TABLE `ofgroup`  (\\r\\n  `groupName` varchar(50)  NOT NULL,\\r\\n  `description` varchar(255) DEFAULT NULL,\\r\\n  PRIMARY KEY (`groupName`) \\r\\n) ENGINE = InnoDB  ROW_FORMAT = Dynamic\", \"affected_rows\": 0, \"sequence\": \"0_0_00000001\", \"backup_dbname\": \"\", \"execute_time\": \"0\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}]','[{\"id\": 1, \"stage\": \"EXECUTED\", \"errlevel\": 0, \"stagestatus\": \"Execute Successfully\", \"errormessage\": \"\", \"sql\": \"use `archrey`\", \"affected_rows\": 0, \"sequence\": \"1632801039_30422997_00000000\", \"backup_dbname\": \"\", \"execute_time\": \"0.000\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}, {\"id\": 2, \"stage\": \"EXECUTED\", \"errlevel\": 0, \"stagestatus\": \"Execute Successfully\", \"errormessage\": \"\", \"sql\": \"CREATE TABLE `ofgroup`  (\\r\\n  `groupName` varchar(50)  NOT NULL,\\r\\n  `description` varchar(255) DEFAULT NULL,\\r\\n  PRIMARY KEY (`groupName`) \\r\\n) ENGINE = InnoDB  ROW_FORMAT = Dynamic\", \"affected_rows\": 0, \"sequence\": \"1632801039_30422997_00000001\", \"backup_dbname\": \"\", \"execute_time\": \"0.007\", \"sqlsha1\": \"\", \"backup_time\": \"0\", \"actual_affected_rows\": \"\"}]',19);
/*!40000 ALTER TABLE `sql_workflow_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ssh_tunnel`
--

DROP TABLE IF EXISTS `ssh_tunnel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ssh_tunnel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tunnel_name` varchar(50) NOT NULL,
  `host` varchar(200) NOT NULL,
  `port` int(11) NOT NULL,
  `user` varchar(200) DEFAULT NULL,
  `password` varchar(300) DEFAULT NULL,
  `pkey_path` varchar(300) DEFAULT NULL,
  `pkey_password` varchar(300) DEFAULT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `tunnel_name` (`tunnel_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ssh_tunnel`
--

LOCK TABLES `ssh_tunnel` WRITE;
/*!40000 ALTER TABLE `ssh_tunnel` DISABLE KEYS */;
/*!40000 ALTER TABLE `ssh_tunnel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_audit`
--

DROP TABLE IF EXISTS `workflow_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_audit` (
  `audit_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `group_name` varchar(100) NOT NULL,
  `workflow_id` bigint(20) NOT NULL,
  `workflow_type` int(11) NOT NULL,
  `workflow_title` varchar(50) NOT NULL,
  `workflow_remark` varchar(140) NOT NULL,
  `audit_auth_groups` varchar(255) NOT NULL,
  `current_audit` varchar(20) NOT NULL,
  `next_audit` varchar(20) NOT NULL,
  `current_status` int(11) NOT NULL,
  `create_user` varchar(30) NOT NULL,
  `create_user_display` varchar(50) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `sys_time` datetime(6) NOT NULL,
  PRIMARY KEY (`audit_id`) USING BTREE,
  UNIQUE KEY `workflow_audit_workflow_id_workflow_type_14044a22_uniq` (`workflow_id`,`workflow_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_audit`
--

LOCK TABLES `workflow_audit` WRITE;
/*!40000 ALTER TABLE `workflow_audit` DISABLE KEYS */;
INSERT INTO `workflow_audit` VALUES (1,1,'俄罗斯腾讯云测试环境',3,2,'aaa','','7,3','-1','-1',1,'admin','','2021-05-11 11:06:44.756435','2021-05-11 11:06:44.756456'),(2,1,'俄罗斯腾讯云测试环境',4,2,'bbb','','7,3','-1','-1',1,'admin','','2021-05-11 11:13:55.530940','2021-05-11 11:13:55.530961'),(3,1,'俄罗斯腾讯云测试环境',6,2,'我未完成','','7,3','-1','-1',1,'admin','','2021-05-12 15:48:16.028635','2021-05-12 15:48:16.028658'),(4,1,'俄罗斯腾讯云测试环境',8,2,'擦擦擦','','7,3','-1','-1',1,'admin','','2021-05-12 17:40:18.962563','2021-05-12 17:40:18.962586'),(5,1,'俄罗斯腾讯云测试环境',9,2,'test01t','','2','-1','-1',1,'toniy_tu01','屠鲁俊','2021-05-13 11:14:02.048232','2021-05-13 11:14:02.048253'),(6,1,'俄罗斯腾讯云测试环境',10,2,'test','','','-1','-1',1,'admin','','2021-05-13 18:01:12.356675','2021-05-13 18:01:12.356704'),(7,1,'俄罗斯腾讯云测试环境',11,2,'杀杀杀','','','-1','-1',1,'admin','','2021-05-13 18:06:37.091337','2021-05-13 18:06:37.091357'),(8,1,'俄罗斯腾讯云测试环境',12,2,'i0u0','','','-1','-1',1,'ghl900226','ghl','2021-05-13 18:14:46.588833','2021-05-13 18:14:46.588853'),(9,1,'俄罗斯腾讯云测试环境',14,2,'项目名111','','','-1','-1',1,'admin','','2021-05-18 11:37:02.674425','2021-05-18 11:37:02.674450'),(10,1,'俄罗斯腾讯云测试环境',16,2,'app_api','','','-1','-1',1,'admin','','2021-09-28 10:39:01.611669','2021-09-28 10:39:01.611689'),(11,1,'俄罗斯腾讯云测试环境',17,2,'hop[kl','','','-1','-1',1,'user1','fenglei','2021-09-28 11:49:01.455469','2021-09-28 11:49:01.455494'),(12,1,'俄罗斯腾讯云测试环境',18,2,'hop[kl','','','-1','-1',1,'user1','fenglei','2021-09-28 11:49:52.394938','2021-09-28 11:49:52.394964'),(13,1,'俄罗斯腾讯云测试环境',19,2,'hop[kl','','','-1','-1',1,'user1','fenglei','2021-09-28 11:50:35.880836','2021-09-28 11:50:35.880858');
/*!40000 ALTER TABLE `workflow_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_audit_detail`
--

DROP TABLE IF EXISTS `workflow_audit_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_audit_detail` (
  `audit_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `audit_id` int(11) NOT NULL,
  `audit_user` varchar(30) NOT NULL,
  `audit_time` datetime(6) NOT NULL,
  `audit_status` int(11) NOT NULL,
  `remark` varchar(1000) NOT NULL,
  `sys_time` datetime(6) NOT NULL,
  PRIMARY KEY (`audit_detail_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_audit_detail`
--

LOCK TABLES `workflow_audit_detail` WRITE;
/*!40000 ALTER TABLE `workflow_audit_detail` DISABLE KEYS */;
INSERT INTO `workflow_audit_detail` VALUES (1,1,'admin','2021-05-11 11:07:13.746155',1,'','2021-05-11 11:07:13.746407'),(2,1,'admin','2021-05-11 11:07:21.748869',1,'','2021-05-11 11:07:21.749086'),(3,2,'admin','2021-05-11 11:14:03.554404',1,'','2021-05-11 11:14:03.554639'),(4,2,'admin','2021-05-11 11:14:11.664811',1,'','2021-05-11 11:14:11.665031'),(5,3,'admin','2021-05-12 15:48:19.973991',1,'','2021-05-12 15:48:19.974268'),(6,3,'admin','2021-05-12 15:48:23.864539',1,'','2021-05-12 15:48:23.864768'),(7,4,'admin','2021-05-12 17:40:23.873798',1,'','2021-05-12 17:40:23.874019'),(8,4,'admin','2021-05-12 17:40:27.986060',1,'','2021-05-12 17:40:27.986316'),(9,5,'admin','2021-05-13 11:19:24.292336',1,'','2021-05-13 11:19:24.292553');
/*!40000 ALTER TABLE `workflow_audit_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_audit_setting`
--

DROP TABLE IF EXISTS `workflow_audit_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_audit_setting` (
  `audit_setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `group_name` varchar(100) NOT NULL,
  `workflow_type` int(11) NOT NULL,
  `audit_auth_groups` varchar(255) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `sys_time` datetime(6) NOT NULL,
  PRIMARY KEY (`audit_setting_id`) USING BTREE,
  UNIQUE KEY `workflow_audit_setting_group_id_workflow_type_5884053a_uniq` (`group_id`,`workflow_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_audit_setting`
--

LOCK TABLES `workflow_audit_setting` WRITE;
/*!40000 ALTER TABLE `workflow_audit_setting` DISABLE KEYS */;
INSERT INTO `workflow_audit_setting` VALUES (1,1,'俄罗斯腾讯云测试环境',2,'8','2021-05-07 20:04:26.249376','2021-05-07 20:04:26.249399'),(2,1,'俄罗斯腾讯云测试环境',1,'7,3','2021-05-07 20:04:35.754642','2021-05-07 20:04:35.754665');
/*!40000 ALTER TABLE `workflow_audit_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_log`
--

DROP TABLE IF EXISTS `workflow_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `audit_id` int(11) NOT NULL,
  `operation_type` smallint(6) NOT NULL,
  `operation_type_desc` varchar(10) NOT NULL,
  `operation_info` varchar(1000) NOT NULL,
  `operator` varchar(30) NOT NULL,
  `operator_display` varchar(50) NOT NULL,
  `operation_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `workflow_log_audit_id_71ad84b7` (`audit_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_log`
--

LOCK TABLES `workflow_log` WRITE;
/*!40000 ALTER TABLE `workflow_log` DISABLE KEYS */;
INSERT INTO `workflow_log` VALUES (1,1,0,'提交','等待审批，审批流程：A组（普通用户）->DBA','admin','','2021-05-11 11:06:44.760290'),(2,1,1,'审批通过','审批备注：，下级审批：DBA','admin','','2021-05-11 11:07:13.751239'),(3,1,1,'审批通过','审批备注：，下级审批：None','admin','','2021-05-11 11:07:21.755744'),(4,1,5,'执行工单','工单执行排队中','admin','','2021-05-11 11:07:31.269448'),(5,2,0,'提交','等待审批，审批流程：A组（普通用户）->DBA','admin','','2021-05-11 11:13:55.535375'),(6,2,1,'审批通过','审批备注：，下级审批：DBA','admin','','2021-05-11 11:14:03.559481'),(7,2,1,'审批通过','审批备注：，下级审批：None','admin','','2021-05-11 11:14:11.669031'),(8,2,5,'执行工单','工单执行排队中','admin','','2021-05-11 11:14:17.335751'),(9,3,0,'提交','等待审批，审批流程：A组（普通用户）->DBA','admin','','2021-05-12 15:48:16.032647'),(10,3,1,'审批通过','审批备注：，下级审批：DBA','admin','','2021-05-12 15:48:19.979135'),(11,3,1,'审批通过','审批备注：，下级审批：None','admin','','2021-05-12 15:48:23.872170'),(12,3,5,'执行工单','工单执行排队中','admin','','2021-05-12 15:48:27.584493'),(13,3,5,'执行工单','工单开始执行','admin','','2021-05-12 15:48:27.596689'),(14,3,6,'执行结束','执行结果：已正常结束','','系统','2021-05-12 15:48:27.883889'),(15,4,0,'提交','等待审批，审批流程：A组（普通用户）->DBA','admin','','2021-05-12 17:40:18.967768'),(16,4,1,'审批通过','审批备注：，下级审批：DBA','admin','','2021-05-12 17:40:23.878806'),(17,4,1,'审批通过','审批备注：，下级审批：None','admin','','2021-05-12 17:40:27.990390'),(18,4,5,'执行工单','工单执行排队中','admin','','2021-05-12 17:40:38.999561'),(19,4,5,'执行工单','工单开始执行','admin','','2021-05-12 17:40:39.011259'),(20,4,6,'执行结束','执行结果：已正常结束','','系统','2021-05-12 17:40:39.278871'),(21,5,0,'提交','等待审批，审批流程：RD','toniy_tu01','屠鲁俊','2021-05-13 11:14:02.051350'),(22,5,1,'审批通过','审批备注：，下级审批：None','admin','','2021-05-13 11:19:24.296085'),(23,5,5,'执行工单','工单执行排队中','admin','','2021-05-13 11:19:33.214548'),(24,5,5,'执行工单','工单开始执行','admin','','2021-05-13 11:19:33.226574'),(25,5,6,'执行结束','执行结果：已正常结束','','系统','2021-05-13 11:19:33.528128'),(26,6,0,'提交','无需审批，系统直接审核通过','admin','','2021-05-13 18:01:12.357771'),(27,6,5,'执行工单','工单执行排队中','admin','','2021-05-13 18:01:24.572783'),(28,6,5,'执行工单','工单开始执行','admin','','2021-05-13 18:01:24.598758'),(29,6,6,'执行结束','执行结果：已正常结束','','系统','2021-05-13 18:01:24.895440'),(30,7,0,'提交','无需审批，系统直接审核通过','admin','','2021-05-13 18:06:37.091995'),(31,7,5,'执行工单','工单执行排队中','admin','','2021-05-13 18:06:48.052714'),(32,7,5,'执行工单','工单开始执行','admin','','2021-05-13 18:06:48.076715'),(33,7,6,'执行结束','执行结果：已正常结束','','系统','2021-05-13 18:06:48.354087'),(34,8,0,'提交','无需审批，系统直接审核通过','ghl900226','ghl','2021-05-13 18:14:46.589448'),(35,8,5,'执行工单','工单执行排队中','ghl900226','ghl','2021-05-13 18:14:51.495382'),(36,8,5,'执行工单','工单开始执行','ghl900226','ghl','2021-05-13 18:14:51.507309'),(37,8,6,'执行结束','执行结果：已正常结束','','系统','2021-05-13 18:14:51.785313'),(38,9,0,'提交','无需审批，系统直接审核通过','admin','','2021-05-18 11:37:02.675155'),(39,10,0,'提交','无需审批，系统直接审核通过','admin','','2021-09-28 10:39:01.612251'),(40,11,0,'提交','无需审批，系统直接审核通过','user1','fenglei','2021-09-28 11:49:01.456218'),(41,12,0,'提交','无需审批，系统直接审核通过','user1','fenglei','2021-09-28 11:49:52.395579'),(42,13,0,'提交','无需审批，系统直接审核通过','user1','fenglei','2021-09-28 11:50:35.881495'),(43,13,5,'执行工单','工单执行排队中','user1','fenglei','2021-09-28 11:50:39.095187'),(44,13,5,'执行工单','工单开始执行','user1','fenglei','2021-09-28 11:50:39.124105'),(45,13,6,'执行结束','执行结果：已正常结束','','系统','2021-09-28 11:50:39.434535');
/*!40000 ALTER TABLE `workflow_log` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-29 14:26:46
