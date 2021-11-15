-- MySQL dump 10.13  Distrib 5.7.33, for linux-glibc2.12 (x86_64)
--
-- Host: 127.0.0.1    Database: archery
-- ------------------------------------------------------
-- Server version	5.7.33-log

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
INSERT INTO `sql_users` VALUES (1,'pbkdf2_sha256$216000$jLtlWA3DTCFa$8m9K5tnkBTBswnU0g3u6wSe5pINVxZafO5O35PMiyAs=','2021-10-26 13:53:44.173121',1,'test','','','test@163.com',1,1,'2021-10-09 15:37:42.000000','cehsi','','','',0,NULL),(2,'pbkdf2_sha256$216000$dQ0bQS7fpHbN$d/XcA3axE4LvDSuoB2yxysNtE/0brKpC65TebSvfDmg=',NULL,0,'yangchenzhu_01','','','',1,1,'2021-10-18 14:28:03.000000','杨晨柱市场','13611088385','','',0,NULL),(15,'pbkdf2_sha256$216000$PQ0lc45OAi61$nCOzpKF2m6Jy2WUzTXWQg4ovvU3cyE2dm2W0MC+XmD4=','2021-10-26 14:12:03.827887',0,'WuBaodong','','','',1,1,'2021-10-20 14:59:02.000000','吴保东','18610250996','test','',0,NULL),(16,'pbkdf2_sha256$216000$fVCQmR28BACW$RuIY7hqjA0UAExLSN0JUA0AFmf1xlSKG8cMSJFQDHys=',NULL,0,'YangChenzhu','','','',1,1,'2021-10-20 14:59:02.000000','杨晨柱','13611088385','test','',0,NULL),(17,'pbkdf2_sha256$216000$or8DYrkzek6x$EWin2uTFMHRDYnSfB8gCFp9tGLo0Jyi3xkPhKOY7LLA=','2021-10-26 11:36:40.027376',0,'WangGang','','','',1,1,'2021-10-20 14:59:02.000000','王刚','18752068151','test','',0,NULL),(18,'pbkdf2_sha256$216000$YkEy3ge8SJxO$/n9z4E2QSIf3h/EnosfmrZkc+uOC65FQD4AK6i4ARoQ=','2021-10-25 17:44:03.538202',0,'LouMiaomiao','','','',1,1,'2021-10-20 14:59:02.000000','娄苗苗','15033781593','test','',0,'2021-10-25 17:43:40.184126'),(19,'pbkdf2_sha256$216000$AA2u8EUO0f2M$IvSbTbFOibNvoQ5k3ghB7YE53GZqQTqy4RFKc65IqNE=','2021-10-26 13:50:13.940021',0,'LiuLulu','','','',1,1,'2021-10-20 14:59:02.000000','刘璐璐','15601647566','test','',0,'2021-10-25 17:51:40.111706'),(20,'pbkdf2_sha256$216000$zKpnmVKaGTcc$3bCkzu+6Y7r/QAf5rUuvRctuQ33fYnbyDefdMxcYKm8=','2021-10-25 17:58:46.079027',0,'zenglingquan','','','',1,1,'2021-10-20 14:59:02.000000','曾令权','18970732837','test','',0,NULL),(21,'pbkdf2_sha256$216000$7OuAJqnvDJRF$RhOIpOmvHGgrerDT6dWMUGQFsN5OhSnqzGT2UNMayWs=','2021-10-27 09:39:59.840336',0,'LianYanxin','','','',1,1,'2021-10-20 14:59:02.000000','廉彦鑫','15617111445','test','',0,'2021-10-27 09:39:47.108890'),(22,'pbkdf2_sha256$216000$0yOfxeI5sjAC$jI4ZP9X+mN7p0Uuwd1TMc5Go5iSssd+4tlsXKKBFz44=','2021-10-25 18:03:23.799432',0,'WangHuaze','','','',1,1,'2021-10-20 14:59:02.000000','王化泽','17845123658','test','',0,'2021-10-25 18:03:11.301096'),(23,'pbkdf2_sha256$216000$joutCZ94IGH4$ZJ/NAXHNdwSdzs+h4pc2sZLRVGjBCo/HaTO77oYqYh4=','2021-10-26 09:59:03.021159',0,'liuqiaomei','','','',1,1,'2021-10-20 14:59:02.000000','刘巧梅','13402083849','test','',0,'2021-10-25 18:11:40.324326'),(24,'pbkdf2_sha256$216000$FejiHai7CPvK$pA7THQuplawfXw8N5ZiYOZtJglROwWKdzuFhGGQ6aJ8=','2021-10-25 18:06:58.648525',0,'HaoLaipeng','','','',1,1,'2021-10-20 14:59:02.000000','郝来鹏','18201118627','test','',0,'2021-10-25 18:06:30.164949'),(25,'pbkdf2_sha256$216000$XMXpnihtTuoM$13qrJ9m+GXc+WtIHdRuu4YoBkh0hdui8FitvcgmEsmQ=','2021-10-25 18:08:45.507607',0,'WangJiali','','','',1,1,'2021-10-20 14:59:02.000000','王佳力','15530859864','test','',0,'2021-10-25 18:07:53.550232'),(26,'pbkdf2_sha256$216000$QBAX64zzonrU$o/JQYW+9y8hlqtvmDsx+tSmmNcyhtw9S8s0tyrkWwKk=','2021-10-25 18:09:13.318643',0,'HuangXin','','','',1,1,'2021-10-20 14:59:02.000000','黄鑫','13308075436','test','',0,NULL),(27,'pbkdf2_sha256$216000$DGMjJabDz50h$7QS11nfy+d5yPCKczwQt7krfxpYLIqgPkVMwcHxchps=','2021-10-25 17:47:59.760487',0,'BaiZhenchuan','','','',1,1,'2021-10-20 14:59:02.000000','白振川','18439493206','test','',0,NULL),(28,'pbkdf2_sha256$216000$UQ2nuUVrfAQW$ccTtONthBE+N+xJoE0801os0mHeWlHCq2regn3MWj1g=','2021-10-25 18:09:59.607390',0,'SongMei','','','',1,1,'2021-10-20 14:59:02.000000','宋美','18780125825','test','',0,'2021-10-25 18:09:36.029691'),(29,'pbkdf2_sha256$216000$Kdws4d90LdWd$fbeMG4VteXzliFQMLbfzAAKZXIqQ95DImptOmsMXfyE=','2021-10-25 18:11:04.107300',0,'ChenYu','','','',1,1,'2021-10-20 14:59:02.000000','陈宇','15862036391','test','',0,'2021-10-25 18:10:31.167980'),(30,'pbkdf2_sha256$216000$hKG45ippRXgy$bWQUnqf3gRrvc+6prZ6ZvkL7yJH3ngWhhgFVo6Fn6Q8=','2021-10-25 18:12:59.676202',0,'ZhouYang','','','',1,1,'2021-10-20 14:59:02.000000','周洋','18655104633','test','',0,'2021-10-25 18:12:41.080406'),(31,'pbkdf2_sha256$216000$zSuzHcmkNPe6$Sz3lru9hESiqpoC8dG7JpdvrX6k/BRHlK7SUHDVaDlg=','2021-10-25 18:14:51.508369',0,'LiuHonglin','','','',1,1,'2021-10-20 14:59:02.000000','刘洪林','17621220446','test','',0,'2021-10-25 18:14:44.756404'),(32,'pbkdf2_sha256$216000$CjfmNtxJMzjg$1muXPQwmKQ79uyozrrHDhGQR9kEJr4lYrTFkuZd8sqs=','2021-10-25 18:17:40.202205',0,'YanDunchao','','','',1,1,'2021-10-20 14:59:02.000000','闫敦超','15184497431','test','',0,'2021-10-25 18:17:16.375329'),(33,'pbkdf2_sha256$216000$zVi3N8kAqyxE$PW/TJReHbxMRKu939gQf6YRK7yPc7myZwSJbnzkYMxQ=','2021-10-25 18:18:57.250692',0,'SunGuoqiang','','','',1,1,'2021-10-20 14:59:02.000000','孙国强','15828102007','test','',0,'2021-10-25 18:18:00.416680'),(34,'pbkdf2_sha256$216000$k8cQWsknexxz$LZRmo3VN/otHl6cw9RWNhnvezkNjPNtP/dY+R22XDVw=','2021-10-25 18:19:49.640545',0,'QiaoLixue','','','',1,1,'2021-10-20 14:59:02.000000','乔立学','15110173959','test','',0,'2021-10-25 18:19:23.257460'),(35,'pbkdf2_sha256$216000$LFA0kvo4hnxE$BZjQMspMuDIakClyk1YlQsTsU1hZMyjJiQEfKHD1jwE=','2021-10-25 18:21:39.711859',0,'ZhangYong','','','',1,1,'2021-10-20 14:59:02.000000','张勇','18600747737','test','',0,'2021-10-25 18:20:23.089064'),(36,'pbkdf2_sha256$216000$MQp1nceZZXMW$FzkX0+sIY3T1QHXiuLgWFdZNka8/a97pd9eWDoMg/58=','2021-10-25 18:22:47.146074',0,'WangHong','','','',1,1,'2021-10-20 14:59:02.000000','王鸿','15228777400','test','',0,'2021-10-25 18:22:33.016816'),(37,'pbkdf2_sha256$216000$BJ6gQQKmoEWU$VUKMa3qPrYG5Qfifj5ybKiBaGEvMYK6TuGoPahjkx/4=','2021-10-26 09:51:37.368693',0,'linchujun','','','',1,1,'2021-10-20 14:59:02.000000','林楚竣','18583822661','test','',0,'2021-10-25 18:23:28.543320'),(38,'pbkdf2_sha256$216000$OD0Gi0u6KUai$rFKYpgUlFffezG5Ju91gsvkTAAxMBsvBjUwWJs0OBQY=','2021-10-26 09:52:08.654461',0,'ZhangXuzhou','','','',1,1,'2021-10-20 14:59:02.000000','张绪洲','17612874640','test','',0,'2021-10-25 18:25:21.126598'),(39,'pbkdf2_sha256$216000$hpu75ZwXZSuf$j6HimaFLIZS7qP/Sd7j+adVbmRri6bZ6n6k3g579jLY=','2021-10-26 09:52:24.959418',0,'ZouYiwei','','','',1,1,'2021-10-20 14:59:02.000000','邹轶维','18307610139','test','',0,NULL),(40,'pbkdf2_sha256$216000$vGQCCMslrEvD$NJuRWlHcn+CKOAvfwXPXSuzowoN/rBwHWfeLCBhSVyQ=','2021-10-26 09:53:13.085505',0,'ChenXiaolin','','','',1,1,'2021-10-20 14:59:02.000000','陈晓林','15282551021','test','',0,'2021-10-26 09:52:42.442004'),(41,'pbkdf2_sha256$216000$XatHsZfbktTH$iMsUNnfo1hXyZYHSrFcmMs6yE+K6iLw9UDcuehKSceg=','2021-10-26 09:54:06.663974',0,'ZhangZhanze','','','',1,1,'2021-10-20 14:59:02.000000','张占泽','13522479851','test','',0,'2021-10-26 09:53:44.373518'),(42,'pbkdf2_sha256$216000$kznhRMmryygT$lDj0don9vlm8n4jMzaeAXxGQvvFayt6bRo1454WD6KQ=','2021-10-26 09:55:02.973329',0,'Yanwish','','','',1,1,'2021-10-20 14:59:02.000000','严心愿','15130267433','test','',0,'2021-10-26 09:54:38.414069'),(43,'pbkdf2_sha256$216000$B5M8GQ7jOGZb$XG8l3nUEDIMmD7NyFXvb9FDb2ezecjMDaEEMcR/jHk4=','2021-10-28 15:48:30.383216',0,'yangliu','','','',1,1,'2021-10-20 14:59:02.000000','杨柳','15639801196','test','',0,NULL),(44,'pbkdf2_sha256$216000$sCAQjrYzsMPK$j6w/kALejUl6gvrTLK/EUEGGUDmNRDzjPiiYsFM/8GY=','2021-10-26 09:57:26.510027',0,'ShaoHaoyu','','','',1,1,'2021-10-20 14:59:02.000000','邵浩宇','17621448236','test','',0,'2021-10-26 09:57:07.847273'),(45,'pbkdf2_sha256$216000$oYRDsZ2iEhjr$xzKaOqOg0lkUGkkRxptRtIOyPIg8nifVzzW9QSETlSY=','2021-10-26 10:16:52.185067',0,'ChenYang','','','',1,1,'2021-10-20 14:59:02.000000','陈阳','17521053387','test','',0,'2021-10-26 09:58:06.444885'),(46,'pbkdf2_sha256$216000$D7UTRhhAmQlv$2FKRxhn1yTzlPmurmCVrdW59FlydOsoYH3S96CctZ54=',NULL,0,'DuFengchu','','','',1,1,'2021-10-20 14:59:02.000000','杜风楚','13917990509','test','',1,'2021-10-26 09:59:26.006084'),(47,'pbkdf2_sha256$216000$TDFIlIOKsn8q$Wzlz5QJj7h1qK8JFuDQahyWdCYK91SS3gwDjx10MXms=','2021-10-26 10:00:08.059535',0,'WuQiongqiong','','','',1,1,'2021-10-20 14:59:02.000000','吴琼琼','13271611205','test','',0,NULL),(48,'pbkdf2_sha256$216000$mZj2W7p0nEE1$LLROfWwdb+DXPRsuvXO+wEH68ZWtCfehQOkuhEYrRoo=',NULL,0,'LiHaifeng','','','',1,1,'2021-10-20 14:59:02.000000','李海峰','13524828443','test','',1,'2021-10-26 10:00:38.462576'),(49,'pbkdf2_sha256$216000$lIF2w4SuAhaB$qvbrEGh19eYUTIxPCuosTWmqBkUTmBDEzXfzTcQG65g=','2021-10-26 10:02:14.198281',0,'YangRui','','','',1,1,'2021-10-20 14:59:02.000000','杨瑞','杨瑞	13917499668','test','',0,'2021-10-26 10:01:50.292407'),(50,'pbkdf2_sha256$216000$u2eDb93UTSUP$gkXPR9Tb+3m9pW87HPznQlluaOndNfWbsRxHxCaC+Io=','2021-10-26 10:07:42.449026',0,'FangDan','','','',1,1,'2021-10-20 14:59:02.000000','方丹','15692012139','test','',0,'2021-10-26 10:04:48.812708'),(51,'pbkdf2_sha256$216000$Ml9For8w6k23$56jRJD9adTsreOcETVzi4vOoQRO5U41xSRErmb7eBRY=',NULL,0,'Zhangmeng','','','',1,1,'2021-10-20 14:59:02.000000','张猛','张猛	15638182012','test','',0,NULL),(52,'pbkdf2_sha256$216000$kBMN0XopMwOH$2FcnzoIAEPdgsmmbq3tncRqfI25KFKVJMz91z/Xhs+Y=','2021-10-26 10:17:11.880073',0,'LiZemin','','','',1,1,'2021-10-20 14:59:02.000000','李泽民','15045873752','test','',0,'2021-10-26 10:08:13.029928'),(53,'pbkdf2_sha256$216000$49M3xSzmCiNM$jN71taydMPBEXJkWu+bRrMIxJqlEMXy/Ib8ggsu5gvQ=',NULL,0,'GuoMao','','','',1,1,'2021-10-20 14:59:02.000000','郭茂','15824850100','test','',5,'2021-10-28 14:33:52.879522'),(54,'pbkdf2_sha256$216000$jI4JU6hkPfPv$Ea7U7G8L2C7pwXHXVCZPtjQLHbx2mSmyyhHlwYmHrng=','2021-10-26 10:17:24.813231',0,'LuoJun','','','',1,1,'2021-10-20 14:59:02.000000','罗俊','17361000501','test','',0,NULL),(55,'pbkdf2_sha256$216000$kwH8GDieGK3y$gW3P8yhV9VIxyq5fG37O/5Sj4HpV2LxYoqLtTA+iQ5s=','2021-10-26 10:17:37.173534',0,'CaoWei','','','',1,1,'2021-10-20 14:59:02.000000','曹纬','18516267531','test','',0,'2021-10-25 17:48:37.564431'),(56,'pbkdf2_sha256$216000$3gXwyBXIfUku$tVlPJ13e2QYxjdh9/o6IjxWuxXv7jSWV0isKAqdQvdo=','2021-10-26 10:17:54.799433',0,'LiuYaya','','','',1,1,'2021-10-20 14:59:02.000000','刘亚亚','13718148452','test','',0,NULL),(57,'pbkdf2_sha256$216000$aaqYcyOZvoVz$1Ri2cHBtknQA1fILWcNkL1DL7706Pz0mOVVQWwMPpkE=','2021-10-26 10:18:12.172252',0,'YangJie','','','',1,1,'2021-10-20 14:59:02.000000','杨杰','13001289532','test','',0,NULL),(58,'pbkdf2_sha256$216000$wtAQzV2D0UF9$1ayn97iZ0CSG8KAKy8UY5/3UT2EdW9lW+iXBKj18Ejc=','2021-10-26 10:18:24.653300',0,'WangYi','','','',1,1,'2021-10-20 14:59:02.000000','王怡','18200705533','test','',0,NULL),(59,'pbkdf2_sha256$216000$gP4q6zhCGA75$UWScE+Xiy38SEwoEy1E5Fur/v1r0rqvq6FtIJ8Yd/tM=','2021-10-26 10:18:38.644534',0,'WangChen','','','',1,1,'2021-10-20 14:59:02.000000','汪晨','13818667621','test','',0,NULL),(60,'pbkdf2_sha256$216000$zaZ5ntqlLtAA$f8TTJhwG8qsz5hwcyiSFLyk8WuY2DrhmXZc0i4CZRjA=','2021-10-26 10:18:54.812636',0,'ChengHao','','','',1,1,'2021-10-20 14:59:02.000000','程浩','17802146028','test','',0,NULL),(61,'pbkdf2_sha256$216000$4wyfaNYwPTCa$GqvNLO5FY4PeTEKQxTZ9bXsmxolCeEhHoh7fCRtCBNs=','2021-10-26 10:19:11.419690',0,'GuoLei','','','',1,1,'2021-10-20 14:59:02.000000','郭雷','16628556551','test','',0,NULL),(62,'pbkdf2_sha256$216000$70WwVhceWyjd$vfGZYoAQcObTG6WuQ0AZ109iT6Ni5J5LojzYWHIAp04=','2021-10-26 11:07:18.698860',0,'YinYu','','','',1,1,'2021-10-20 14:59:02.000000','殷雨','15212100779','test','',0,NULL),(63,'pbkdf2_sha256$216000$kA6CHJJai1AX$xAGxHJIyAg/jA9BJCy+LUnWnVMMckSeADIMzQieNYbM=','2021-10-26 13:09:02.130176',0,'YangJief','','','',1,1,'2021-10-20 14:59:02.000000','杨杰','1581570180','test','',0,NULL),(64,'pbkdf2_sha256$216000$xOkIkqp5pPx8$oYug0wK3GGGWnqJA/vhjspoMOyEjDEMtROmm7nXUZtY=','2021-10-26 10:19:49.485364',0,'WangWeilan','','','',1,1,'2021-10-20 14:59:02.000000','王伟兰','18861603067','test','',0,NULL),(65,'pbkdf2_sha256$216000$gvFKhkxAnbjO$0SR8x2tavBdwKCfulTilQg7lmSh6SrQGhj5abfbeUJ8=',NULL,0,'GuYibing','','','',1,1,'2021-10-20 14:59:02.000000','顾益兵','13391096132','test','',1,'2021-10-26 10:20:03.547077'),(66,'pbkdf2_sha256$216000$j7zNN6Pij5u8$3G38zOPgB3QP21OVBkRO9LTcxHhbevDv4sUnnOsaVLo=','2021-10-26 15:51:32.887608',0,'HuYong','','','',1,1,'2021-10-20 14:59:02.000000','胡勇','13916320566','test','',0,NULL),(67,'pbkdf2_sha256$216000$NRtv0vXJw5x8$V53gwkZkyWjinP87dzbe/2jjPDsV1HmGqfXw3//ji9Y=','2021-10-26 10:20:28.572789',0,'ShiMingyue','','','',1,1,'2021-10-20 14:59:02.000000','史明月','18601603060','test','',0,NULL),(68,'pbkdf2_sha256$216000$BPTPa3SwHqhj$z3/2UGJI7+qH9YOjQ0BpD+yncH7NvItcjIdcgZvckZE=','2021-10-26 16:00:13.381510',0,'GuoXiaona','','','',1,1,'2021-10-20 14:59:02.000000','郭小娜','13165575955','develop','',0,NULL),(69,'pbkdf2_sha256$216000$X4Zsv3Ymc4EL$vlEJUESnI1F1/2Fq7B5WfdpBkGAb/4P43vrC7Uxv9xw=','2021-10-26 16:00:46.872394',0,'MaYuying','','','',1,1,'2021-10-20 14:59:02.000000','马玉颖','18333185730','develop','',0,NULL),(70,'pbkdf2_sha256$216000$ayzcCU6G3iv0$5Oi/lF1Qy7cLfNWcOiGewNXAeIR3VTh4+Zb9+pjQ9CU=','2021-10-26 16:01:06.077035',0,'MaZhengyu','','','',1,1,'2021-10-20 14:59:02.000000','马征宇','15933958162','develop','',0,NULL),(71,'pbkdf2_sha256$216000$pVdrnFL1izqY$yYIQ3GVU0DsNdFafoqBgGaWHPeKOpaxT83WAKCoTT9w=','2021-10-26 16:01:30.413541',0,'TianZheng','','','',1,1,'2021-10-20 14:59:02.000000','田征','15901520470','develop','',0,NULL),(72,'pbkdf2_sha25616000/o5S0z4qLTa9Rn9eUUjiL9+1FYJkeGWp1q+mekxE=',NULL,0,'ZhangMengqiu','','','',1,0,'2021-10-20 14:59:02.000000','张孟秋','17734372396','develop','',2,'2021-10-26 16:01:52.405398'),(73,'pbkdf2_sha256$216000$MWjfMInQElKo$nCck0+RR9qN6uI+sD1wnJqWIY1s7pp8Qcq14AmCFYNM=','2021-10-26 16:02:27.040618',0,'LiZe','','','',1,1,'2021-10-20 14:59:02.000000','李泽','17601630927','develop','',0,NULL),(74,'pbkdf2_sha256$216000$pJGVv5I7eI2e$y1JF3PFI2gSi936sn38K+dN549r8BRHF91Q//LdRz9k=','2021-10-26 16:02:57.674560',0,'LiJianyong','','','',1,1,'2021-10-20 14:59:02.000000','李建勇','18222527900','develop','',0,NULL),(75,'pbkdf2_sha256$216000$38aiHObfB8Oo$EQrwKa+IhdAWGqFEMBjZxeFGRDE2VUpKY4zHAq6ir/4=','2021-10-26 16:03:18.337248',0,'HanMing','','','',1,1,'2021-10-20 14:59:02.000000','韩铭','17634402352','develop','',0,'2021-10-25 18:27:53.158677'),(76,'pbkdf2_sha256$216000$Q1Q5b5S1Le6r$6C661X+Krh2OzQVGnUjoIMy/t8vqQLab6bYLe0vzUuY=','2021-10-26 16:04:01.264699',0,'FanLixue','','','',1,1,'2021-10-20 14:59:02.000000','范李雪','15037262490','develop','',0,NULL),(77,'pbkdf2_sha256$216000$hACCgQDAKhpj$oo4pilV7dfShKVG+luCuIk2WLZ3IL9S2O1G5I42n5mk=','2021-10-26 16:04:44.970990',0,'ChenWu','','','',1,1,'2021-10-20 14:59:02.000000','陈武','15907080605','develop','',0,'2021-10-26 16:04:17.682851'),(78,'pbkdf2_sha256$216000$xLajaXcjBYy2$Zz6LePZoS9fp1cksHgT6Yj7ZvIOUXv6UvKxhpOIfTVc=','2021-10-26 16:05:31.669086',0,'WangKai','','','',1,1,'2021-10-20 14:59:02.000000','王凯','15022590152','develop','',0,NULL),(79,'pbkdf2_sha256$216000$iGxcgvnYq7sY$lhj+eXaLVtANsAr4btgzin7vGVjl0zmhlq0fhPCQn9Q=','2021-10-26 16:05:57.722446',0,'QinShaocen','','','',1,1,'2021-10-20 14:59:02.000000','秦绍岑','13079226663','develop','',0,NULL),(80,'pbkdf2_sha256$216000$b1H2UB5kZbkt$ZpuElx8D035ABn6qvui/GE31Z7821Dy8NZ+dH0judj8=','2021-10-26 16:06:16.586269',0,'WangSinan','','','',1,1,'2021-10-20 14:59:02.000000','王思南','15600581187','develop','',0,NULL),(81,'pbkdf2_sha256$216000$LNjWEFGtZI0s$uaAQvauMh/jWO9ia0TGXuAyrj/3g8lxplIkaMWrSfJM=','2021-10-26 16:06:33.802564',0,'ZhangTao','','','',1,1,'2021-10-20 14:59:02.000000','张涛','18502129886','develop','',0,NULL),(82,'pbkdf2_sha256$216000$hro8333XzZ43$q9k1ZC31DMiSjaMIIgNsvpxG41r2MQcfeJVTjBYi+qE=','2021-10-26 16:06:52.608410',0,'GuoQianqian','','','',1,1,'2021-10-20 14:59:02.000000','郭倩倩','15831522495','develop','',0,NULL),(83,'pbkdf2_sha256$216000$GVB5IGAD0Ytm$3EbQkNaWkUoIuA6yGgb/aFgYqPRKJFoirW9CroMdVa8=','2021-10-26 16:10:04.015508',0,'HouHaitao','','','',1,1,'2021-10-20 14:59:02.000000','侯海涛','15222561170','develop','',0,NULL),(84,'pbkdf2_sha256$216000$Go9nzzwq2SuV$m11B4HhaRX+i25FWTayDtSYpEkmasi5Dqfg1ctI97QY=','2021-10-26 16:10:25.009875',0,'LiYingjie','','','',1,1,'2021-10-20 14:59:02.000000','李英杰','17601235246','develop','',0,NULL),(85,'pbkdf2_sha256$216000$26UmGfMS1Art$T2OTDB3QbGAvDChHUmZjw/ELkXRY+3TEwjnZcfTVs0c=','2021-10-26 16:10:48.883890',0,'WangZhiyang','','','',1,1,'2021-10-20 14:59:02.000000','王志杨','15848116426','develop','',0,NULL),(86,'pbkdf2_sha256$216000$fM7Wmo3gIpQN$UUvhufg1KpFx+HMwR6JPK4YqCfG+5+couKL0JHSR084=','2021-10-26 16:11:09.653455',0,'ZhangZhao','','','',1,1,'2021-10-20 14:59:02.000000','张召','18616139780','develop','',0,NULL),(87,'pbkdf2_sha256$216000$wf9eiC6Vvc9B$4Z8dsO/hc9B1giOMgcAtnh8mPf0l7dPbZqIiRLtmNsM=','2021-10-26 16:11:28.627163',0,'HaoWenbin','','','',1,1,'2021-10-20 14:59:02.000000','郝文斌','18301848910','develop','',0,NULL),(88,'pbkdf2_sha256$216000$XHMbZCehLRok$XunyDjNVSt09+4IWB+3gVorYTuuHDBomT+8Fb7h+HxA=','2021-10-26 16:11:54.147151',0,'RenLiang','','','',1,1,'2021-10-20 14:59:02.000000','任亮','13402111570','develop','',0,NULL),(89,'pbkdf2_sha256$216000$BeQsvTZdZvNl$KOt1pGVQh7H+AKudGfXqzigzNHWqNoLWVx0wYMD/AFs=','2021-10-26 16:12:14.646021',0,'HuJibin','','','',1,1,'2021-10-20 14:59:02.000000','胡吉斌','13761553195','develop','',0,NULL),(90,'pbkdf2_sha256$216000$tIWNXpCXkM0g$bxEusaBaH8gIjMIXZ+jkcDGMJhcFiRfw3TCVF66blZk=','2021-10-26 16:12:38.341912',0,'JiangTao','','','',1,1,'2021-10-20 14:59:02.000000','蒋涛','17302143650','develop','',0,NULL),(91,'pbkdf2_sha256$216000$40Srpj30Sgda$lkDL+WlN/8oVnVrR8TzkYnvbAyHnLbQgklCslb477Wo=','2021-10-26 16:12:58.082756',0,'TuLujun','','','',1,1,'2021-10-20 14:59:02.000000','屠鲁俊','18829014133','develop','',0,NULL),(92,'pbkdf2_sha256$216000$6zbc7mtVfAn9$Qlbe8N3G/EdeSMGiWt4889p/cLMDMkMYiPewTxIi16w=','2021-10-26 16:13:19.457698',0,'ChenHua','','','',1,1,'2021-10-20 14:59:02.000000','陈华','15882017870','develop','',0,'2021-10-25 17:50:58.174795'),(93,'pbkdf2_sha256$216000$Z5Zgu5spdqv0$m2pJhD5f0UVVCY3LVb5gzi4Tx3eP9PNE4BFdOdIw2vc=','2021-10-26 16:13:36.666242',0,'ChenJun','','','',1,1,'2021-10-20 14:59:02.000000','陈军','18782966356','develop','',0,NULL),(94,'pbkdf2_sha256$216000$RzvKRvjbV1Zt$855vLJ7GMHk1Q75Yr3OcW7SGT4ZEADko87XD6hJEAjo=','2021-10-26 16:13:52.980678',0,'LiangXiangyang','','','',1,1,'2021-10-20 14:59:02.000000','梁向阳','15114032273','develop','',0,NULL),(95,'pbkdf2_sha256$216000$3rNDwWU9grLr$4AH5B9kvF3dT847f7TlHC7fP7YU3OWYHP3gQsWH8Kq8=','2021-10-26 16:14:10.192434',0,'WangPengju','','','',1,1,'2021-10-20 14:59:02.000000','王鹏举','13707631004','develop','',0,NULL),(96,'pbkdf2_sha256$216000$RtS3GTAo4GGU$9McsPsGQ44bnn19Q4htCQ6LGSHg3/HdB1VXaaCfCdds=','2021-10-26 16:14:26.012078',0,'LiRui','','','',1,1,'2021-10-20 14:59:02.000000','李瑞','17600760252','develop','',0,NULL),(97,'pbkdf2_sha256$216000$0ux9sr4yfmO4$ty1VeAHeshQ0XyN0mzkC/WrLXF/XqHfFcXyy84mN86o=','2021-10-26 16:14:50.484453',0,'YinHaijun','','','',1,1,'2021-10-20 14:59:02.000000','殷海军','19921545932','develop','',0,NULL),(98,'pbkdf2_sha256$216000$pPKL7o3URvDw$Y0nQCB1Eq7s6cXthkxSIZC8uqiZc/Bpxs6Pk/9QWmqA=','2021-10-26 16:15:14.956242',0,'WangWenbin','','','',1,1,'2021-10-20 14:59:02.000000','王文斌','18616395304','develop','',0,NULL),(99,'pbkdf2_sha256$216000$qi2bCMFMzjQy$Xh1wdomxCjaw7NBwQ5aU3+ssc7YFXREIGiTrSbWoBjU=','2021-10-26 16:15:36.644658',0,'JiangJianjun','','','',1,1,'2021-10-20 14:59:02.000000','江建军','15308091853','develop','',0,NULL),(100,'pbkdf2_sha256$216000$f12hDQpR76jc$5De6WRgd0Y/Iv+Q+4t2WzWKtKkqFQfVE094I+bhvMLA=','2021-10-26 16:16:12.121029',0,'XieXiang','','','',1,1,'2021-10-20 14:59:02.000000','谢翔','13688014485','develop','',0,NULL),(101,'pbkdf2_sha256$216000$aRjHGTYMmfny$7hz8QFmBfwrQ9jQE9HUZvFwDwJZWWhdualZiaHBdF00=','2021-10-28 15:48:43.494430',1,'fenglei','','','',1,1,'2021-10-25 17:03:55.794380','冯磊','','18610952933','',0,'2021-10-28 15:46:28.853598'),(102,'pbkdf2_sha256$216000$xSg12Sdaf1aN$ZwX1wgzZB3wwk/YeXJ6Zy59TQ3S5gIlRy0agDucxeOg=',NULL,0,'devlop_01','','','',0,0,'2021-10-26 14:01:20.000000','公共审核密码不许更改','','','',0,NULL),(103,'pbkdf2_sha256$216000$kSik5YOAegXH$qrTA7SAO+kQXrTipw7rvRDwgMFZV5smYy8hdHkKgCeE=','2021-10-26 14:26:42.458432',0,'shenhe','','','',1,1,'2021-10-26 14:22:58.000000','公共审核账号','','','',0,NULL),(104,'pbkdf2_sha256$216000$EuyNHcCQDa60$KGAeWZvtnnp3tNTbPZKmP7UEjN1uDb/Of2AtsvKNcOA=',NULL,0,'Liuyu','','','',0,1,'2021-10-28 15:49:35.000000','刘禹','','test','',0,NULL),(105,'pbkdf2_sha256$216000$Wdhy0cXWZYkb$oAvhmV7Q0D0Okz2xSRuuM+m3Ez6hAxIe1RU9fqFblZw=',NULL,0,'HanMingwei','','','',0,1,'2021-10-28 15:50:39.481478','韩朋伟','','','',0,NULL),(106,'pbkdf2_sha256$216000$riZgdEgUXaXA$Yt+Py9p4lB2ojmRR6e7VFM6L0/yQjgQ4ElAiJAk6vzk=',NULL,0,'Gonglong','','','',0,1,'2021-10-28 15:51:55.197141','龚龙','','test','',0,NULL);
/*!40000 ALTER TABLE `sql_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-28  7:56:57