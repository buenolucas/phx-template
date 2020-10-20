
DROP TABLE IF EXISTS `action_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `action_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `knowledge_area_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_action_fields_on_name_and_knowledge_area_id` (`name`,`knowledge_area_id`),
  KEY `index_action_fields_on_knowledge_area_id` (`knowledge_area_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `didactic_sequence_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_bncc` tinyint(1) NOT NULL DEFAULT '0',
  `description` text,
  `teacher_id` int(11) DEFAULT NULL,
  `submitted_to_public` tinyint(1) DEFAULT '0',
  `approved_for_public` tinyint(1) DEFAULT '0',
  `is_ready` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_activities_on_didactic_sequence_id` (`didactic_sequence_id`),
  KEY `index_activities_on_teacher_id` (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2661 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


