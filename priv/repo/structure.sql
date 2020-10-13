-- MySQL dump 10.13  Distrib 5.6.43, for osx10.15 (x86_64)
--
-- Host: localhost    Database: bookstore_prod_20191018
-- ------------------------------------------------------
-- Server version	5.6.43

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
-- Table structure for table `action_fields`
--

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

--
-- Table structure for table `activity_books`
--

DROP TABLE IF EXISTS `activity_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `avoid_duplicated_book_at_same_activity` (`activity_id`,`book_id`),
  KEY `index_activity_books_on_activity_id` (`activity_id`),
  KEY `index_activity_books_on_book_id` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2392 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `activity_exam_questions`
--

DROP TABLE IF EXISTS `activity_exam_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_exam_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL,
  `exam_question_id` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_activity_exam_questions` (`activity_id`,`exam_question_id`),
  KEY `index_activity_exam_questions_on_activity_id` (`activity_id`),
  KEY `index_activity_exam_questions_on_exam_question_id` (`exam_question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6808 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `activity_general_skills`
--

DROP TABLE IF EXISTS `activity_general_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_general_skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL,
  `general_skill_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `avoid_duplicated_general_skill_at_activity` (`activity_id`,`general_skill_id`),
  KEY `index_activity_general_skills_on_activity_id` (`activity_id`),
  KEY `index_activity_general_skills_on_general_skill_id` (`general_skill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ahoy_events`
--

DROP TABLE IF EXISTS `ahoy_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ahoy_events` (
  `id` binary(16) NOT NULL,
  `visit_id` binary(16) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `properties` text,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_ahoy_events_on_visit_id` (`visit_id`),
  KEY `index_ahoy_events_on_user_id` (`user_id`),
  KEY `index_ahoy_events_on_time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `alternative_question_answereds`
--

DROP TABLE IF EXISTS `alternative_question_answereds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alternative_question_answereds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_answered_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `question_alternative_answered_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_alternative_question_answereds_on_survey_answered_id` (`survey_answered_id`),
  KEY `index_alternative_question_answereds_on_question_id` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34411 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `annotations`
--

DROP TABLE IF EXISTS `annotations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `annotations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `page` int(11) DEFAULT NULL,
  `msg` text,
  `filter` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_annotations_on_user_id` (`user_id`),
  KEY `index_annotations_on_book_id` (`book_id`),
  KEY `index_annotations_on_entity_id` (`entity_id`),
  KEY `index_annotations_on_page` (`page`)
) ENGINE=InnoDB AUTO_INCREMENT=118067 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applied_activity_answer_id` int(11) DEFAULT NULL,
  `exam_question_id` int(11) DEFAULT NULL,
  `answer_discursive` text,
  `grade` varchar(255) DEFAULT NULL,
  `teacher_comments` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `answer_choice_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `avoid_duplicated_answer_for_same_question` (`applied_activity_answer_id`,`exam_question_id`),
  KEY `index_answers_on_applied_activity_answer_id` (`applied_activity_answer_id`),
  KEY `index_answers_on_exam_question_id` (`exam_question_id`),
  KEY `index_answers_on_answer_choice_id` (`answer_choice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=113344 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_versions`
--

DROP TABLE IF EXISTS `app_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_versions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `os` varchar(255) DEFAULT NULL,
  `force_upgrade` tinyint(1) DEFAULT '0',
  `version` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_versions_os_index` (`os`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `applied_activities`
--

DROP TABLE IF EXISTS `applied_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applied_activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_activity_id` int(11) DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `reader_id` int(11) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_applied_activity_for_reader` (`custom_activity_id`,`reader_id`),
  UNIQUE KEY `unique_applied_activity_for_entity` (`custom_activity_id`,`entity_id`),
  KEY `index_applied_activities_on_custom_activity_id` (`custom_activity_id`),
  KEY `index_applied_activities_on_entity_id` (`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3823 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `applied_activity_answers`
--

DROP TABLE IF EXISTS `applied_activity_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applied_activity_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reader_id` int(11) DEFAULT NULL,
  `applied_activity_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `final_grade` varchar(255) DEFAULT NULL,
  `final_comment` text,
  `custom_start_date` datetime DEFAULT NULL,
  `custom_end_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `avoid_duplicated_answer_for_same_reader` (`applied_activity_id`,`reader_id`),
  KEY `index_applied_activity_answers_on_applied_activity_id` (`applied_activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41610 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `applied_surveys`
--

DROP TABLE IF EXISTS `applied_surveys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applied_surveys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_applied_surveys_on_survey_id` (`survey_id`),
  KEY `index_applied_surveys_on_entity_id` (`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1338 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `arvore_caches`
--

DROP TABLE IF EXISTS `arvore_caches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arvore_caches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyname` varchar(255) DEFAULT NULL,
  `lastcache` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `b2b_platform_accounts`
--

DROP TABLE IF EXISTS `b2b_platform_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b2b_platform_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logo_url` varchar(255) DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_b2b_platform_accounts_on_entity_id` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `b2b_subscription_accounts`
--

DROP TABLE IF EXISTS `b2b_subscription_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b2b_subscription_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `pilot` tinyint(1) DEFAULT NULL,
  `public` tinyint(1) DEFAULT '0',
  `premium` tinyint(1) DEFAULT '0',
  `logo_url` varchar(255) DEFAULT NULL,
  `description` mediumtext,
  `smartlab` tinyint(1) DEFAULT NULL,
  `smartlab_id` int(11) DEFAULT NULL,
  `api_partner_id` int(11) DEFAULT NULL,
  `desativated` tinyint(1) DEFAULT '0',
  `maratona` tinyint(1) DEFAULT NULL,
  `acervo_type` varchar(255) DEFAULT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `reader_limit` int(11) DEFAULT NULL,
  `teacher_limit` int(11) DEFAULT NULL,
  `school_structure` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_b2b_subscription_accounts_on_entity_id` (`entity_id`),
  KEY `index_b2b_subscription_accounts_on_pilot` (`pilot`),
  KEY `index_b2b_subscription_accounts_on_public` (`public`),
  KEY `index_b2b_subscription_accounts_on_premium` (`premium`),
  KEY `index_b2b_subscription_accounts_on_smartlab_id` (`smartlab_id`),
  KEY `index_b2b_subscription_accounts_on_api_partner_id` (`api_partner_id`),
  KEY `index_b2b_subscription_accounts_on_acervo_type` (`acervo_type`),
  KEY `index_b2b_subscription_accounts_on_school_structure` (`school_structure`)
) ENGINE=InnoDB AUTO_INCREMENT=47972 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bad_fitnesses`
--

DROP TABLE IF EXISTS `bad_fitnesses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bad_fitnesses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `not_fitted_for_id` int(11) DEFAULT NULL,
  `population_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_bad_fitnesses_on_not_fitted_for_id` (`not_fitted_for_id`),
  KEY `index_bad_fitnesses_on_population_id` (`population_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_type` varchar(255) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `user_scope` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_banners_on_user_scope` (`user_scope`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `base_texts`
--

DROP TABLE IF EXISTS `base_texts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `base_texts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `statement` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `best_cost_books`
--

DROP TABLE IF EXISTS `best_cost_books`;
/*!50001 DROP VIEW IF EXISTS `best_cost_books`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `best_cost_books` AS SELECT 
 1 AS `id`,
 1 AS `book_id`,
 1 AS `slug`,
 1 AS `degree`,
 1 AS `publisher_id`,
 1 AS `name`,
 1 AS `reads_count_over_10p`,
 1 AS `avg_total_time_spent_in_hours`,
 1 AS `avg_effective_percentage`,
 1 AS `price_per_hour`,
 1 AS `total_paid`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `bisacs`
--

DROP TABLE IF EXISTS `bisacs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bisacs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `ancestry` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_bisacs_on_code` (`code`),
  KEY `index_bisacs_on_ancestry` (`ancestry`)
) ENGINE=InnoDB AUTO_INCREMENT=4751 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `black_list_books`
--

DROP TABLE IF EXISTS `black_list_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `black_list_books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `account_type` varchar(255) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_blb_for_account` (`book_id`,`account_id`),
  KEY `index_black_list_books_on_book_id` (`book_id`),
  KEY `index_black_list_books_on_account_type` (`account_type`),
  KEY `index_black_list_books_on_account_id` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57174 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bncc_abilities`
--

DROP TABLE IF EXISTS `bncc_abilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bncc_abilities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `description` text,
  `practice_object_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `degree_range` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_bncc_abilities_on_code` (`code`),
  KEY `index_bncc_abilities_on_practice_object_id` (`practice_object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=392 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bncc_ability_exam_questions`
--

DROP TABLE IF EXISTS `bncc_ability_exam_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bncc_ability_exam_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bncc_ability_id` int(11) DEFAULT NULL,
  `exam_question_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_bncc_ability_exam_questions` (`bncc_ability_id`,`exam_question_id`),
  KEY `index_bncc_ability_exam_questions_on_bncc_ability_id` (`bncc_ability_id`),
  KEY `index_bncc_ability_exam_questions_on_exam_question_id` (`exam_question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bncc_competencies`
--

DROP TABLE IF EXISTS `bncc_competencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bncc_competencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `visible_in_list` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bncc_competency_books`
--

DROP TABLE IF EXISTS `bncc_competency_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bncc_competency_books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `bncc_competency_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_bncc_competency_books` (`book_id`,`bncc_competency_id`),
  KEY `index_bncc_competency_books_on_book_id` (`book_id`),
  KEY `index_bncc_competency_books_on_bncc_competency_id` (`bncc_competency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25992 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bncc_degrees`
--

DROP TABLE IF EXISTS `bncc_degrees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bncc_degrees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `degree` varchar(255) DEFAULT NULL,
  `didactic_sequence_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_bncc_degrees_on_degree_and_didactic_sequence_id` (`degree`,`didactic_sequence_id`),
  KEY `index_bncc_degrees_on_didactic_sequence_id` (`didactic_sequence_id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bncc_tags`
--

DROP TABLE IF EXISTS `bncc_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bncc_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_bncc_tags_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=300 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `book_authorships`
--

DROP TABLE IF EXISTS `book_authorships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_authorships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `authorship_type` varchar(255) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_book_authorships_on_book_id` (`book_id`),
  KEY `index_book_authorships_on_authorship_type` (`authorship_type`)
) ENGINE=InnoDB AUTO_INCREMENT=14485 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `book_bisacs`
--

DROP TABLE IF EXISTS `book_bisacs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_bisacs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `bisac_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `book_bisac_avoid_duplications` (`book_id`,`bisac_id`),
  KEY `index_book_bisacs_on_book_id` (`book_id`),
  KEY `index_book_bisacs_on_bisac_id` (`bisac_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33715 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `book_characteristics`
--

DROP TABLE IF EXISTS `book_characteristics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_characteristics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `characteristic_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_book_characteristics_on_characteristic_id_and_book_id` (`characteristic_id`,`book_id`),
  KEY `index_book_characteristics_on_book_id` (`book_id`),
  KEY `index_book_characteristics_on_characteristic_id` (`characteristic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46510 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `book_collaborators`
--

DROP TABLE IF EXISTS `book_collaborators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_collaborators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_book_collaborators_on_book_id` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `book_comments`
--

DROP TABLE IF EXISTS `book_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `starts` int(11) DEFAULT NULL,
  `comment` mediumtext,
  `book_id` int(11) DEFAULT NULL,
  `profilable_id` int(11) DEFAULT NULL,
  `profilable_type` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_book_comments_on_book_id` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `book_copies`
--

DROP TABLE IF EXISTS `book_copies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_copies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `price` decimal(6,2) DEFAULT '0.00',
  `pilot` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `in_use` tinyint(1) DEFAULT '0',
  `uses` int(11) DEFAULT NULL,
  `max_uses` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_book_copies_on_book_id` (`book_id`),
  KEY `index_book_copies_on_pilot` (`pilot`),
  KEY `index_book_copies_on_in_use` (`in_use`)
) ENGINE=InnoDB AUTO_INCREMENT=296342 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `book_degrees`
--

DROP TABLE IF EXISTS `book_degrees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_degrees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `degree` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_book_degrees_on_degree_and_book_id` (`degree`,`book_id`),
  KEY `index_book_degrees_on_book_id` (`book_id`),
  KEY `index_book_degrees_on_degree` (`degree`)
) ENGINE=InnoDB AUTO_INCREMENT=59803 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `book_degrees_backup`
--

DROP TABLE IF EXISTS `book_degrees_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_degrees_backup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `degree` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_book_degrees_on_degree_and_book_id` (`degree`,`book_id`),
  KEY `index_book_degrees_on_book_id` (`book_id`),
  KEY `index_book_degrees_on_degree` (`degree`)
) ENGINE=InnoDB AUTO_INCREMENT=34828 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `book_images`
--

DROP TABLE IF EXISTS `book_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_book_images_on_book_id` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=323457 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `book_ocr_pages`
--

DROP TABLE IF EXISTS `book_ocr_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_ocr_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `page` int(11) NOT NULL,
  `words` int(11) NOT NULL,
  `status` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_book_ocr_pages_on_book_id_and_page` (`book_id`,`page`),
  KEY `index_book_ocr_pages_on_book_id` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=412463 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `book_prices`
--

DROP TABLE IF EXISTS `book_prices`;
/*!50001 DROP VIEW IF EXISTS `book_prices`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `book_prices` AS SELECT 
 1 AS `id`,
 1 AS `slug`,
 1 AS `degree`,
 1 AS `isbn`,
 1 AS `publisher_id`,
 1 AS `name`,
 1 AS `discount`,
 1 AS `price`,
 1 AS `price_with_discount`,
 1 AS `price_per_use_with_discount`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `book_ratings`
--

DROP TABLE IF EXISTS `book_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `reader_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_book_rating_by_reader` (`book_id`,`reader_id`),
  KEY `index_book_ratings_on_reader_id` (`reader_id`),
  KEY `index_book_ratings_on_book_id` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `book_rents`
--

DROP TABLE IF EXISTS `book_rents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_rents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_type` varchar(255) DEFAULT NULL,
  `profile_id` int(11) DEFAULT NULL,
  `book_copy_id` int(11) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `return_date` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_book_rents_on_book_copy_id` (`book_copy_id`),
  KEY `index_book_rents_on_profile_type` (`profile_type`),
  KEY `index_book_rents_on_profile_id` (`profile_id`),
  KEY `index_book_rents_on_active` (`active`),
  KEY `index_book_rents_on_token` (`token`),
  KEY `index_book_rents_on_book_id` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3371056 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `book_shelf_items`
--

DROP TABLE IF EXISTS `book_shelf_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_shelf_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_shelf_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `mascot` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `avoid_same_book_at_same_shelf` (`book_shelf_id`,`book_id`),
  KEY `index_book_shelf_items_on_book_shelf_id` (`book_shelf_id`),
  KEY `index_book_shelf_items_on_book_id` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3024 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `book_shelves`
--

DROP TABLE IF EXISTS `book_shelves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_shelves` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `degree_range` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `order_priority` int(11) DEFAULT NULL,
  `is_highlight` tinyint(1) DEFAULT NULL,
  `acervo_type` varchar(255) DEFAULT NULL,
  `is_shuffle` tinyint(1) DEFAULT '0',
  `active` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_book_shelves_on_name_acervo_type_and_degree` (`name`,`acervo_type`,`degree_range`),
  KEY `index_book_shelves_on_degree_range` (`degree_range`),
  KEY `index_book_shelves_on_order_priority` (`order_priority`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `book_tags`
--

DROP TABLE IF EXISTS `book_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_book_tags_on_tag_id_and_book_id` (`tag_id`,`book_id`),
  KEY `index_book_tags_on_tag_id` (`tag_id`),
  KEY `index_book_tags_on_book_id` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=422933 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `book_themes`
--

DROP TABLE IF EXISTS `book_themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_themes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `theme_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_book_themes_on_theme_id_and_book_id` (`theme_id`,`book_id`),
  KEY `index_book_themes_on_theme_id` (`theme_id`),
  KEY `index_book_themes_on_book_id` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=96834 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `book_upload_informations`
--

DROP TABLE IF EXISTS `book_upload_informations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_upload_informations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `isbn` varchar(255) DEFAULT NULL,
  `publisher` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `s3_path` varchar(255) DEFAULT NULL,
  `publisher_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `state` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `book_utilization_reports`
--

DROP TABLE IF EXISTS `book_utilization_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_utilization_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `viewed_book_id` int(11) DEFAULT NULL,
  `book_copy_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_book_utilization_reports_on_viewed_book_id` (`viewed_book_id`),
  KEY `index_book_utilization_reports_on_book_copy_id` (`book_copy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `book_validation_sessions`
--

DROP TABLE IF EXISTS `book_validation_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_validation_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `verification_name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `last_book_verified_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_book_validation_sessions_on_verification_name` (`verification_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `book_validations`
--

DROP TABLE IF EXISTS `book_validations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_validations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `verification_name` varchar(255) DEFAULT NULL,
  `pending` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `book_format_at_verification` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_book_validations_on_book_id` (`book_id`),
  KEY `index_book_validations_on_verification_name` (`verification_name`),
  KEY `index_book_validations_on_book_format_at_verification` (`book_format_at_verification`)
) ENGINE=InnoDB AUTO_INCREMENT=30786 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bookmarks`
--

DROP TABLE IF EXISTS `bookmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookmarks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subscription_reader_profile_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `percentage` decimal(10,0) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_bookmarks_on_subscription_reader_profile_id` (`subscription_reader_profile_id`),
  KEY `index_bookmarks_on_book_id` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` mediumtext,
  `caterogy_id` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `editor` varchar(255) DEFAULT NULL,
  `isbn` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `quantity_per_copy` int(11) DEFAULT NULL,
  `price` decimal(6,2) DEFAULT '0.00',
  `offer` decimal(4,2) DEFAULT NULL,
  `minimum_age` int(11) DEFAULT NULL,
  `publisher_id` int(11) DEFAULT NULL,
  `activated` tinyint(1) DEFAULT NULL,
  `fixed_layout` tinyint(1) DEFAULT NULL,
  `free_to_use` tinyint(1) DEFAULT NULL,
  `publisher_category` varchar(255) DEFAULT NULL,
  `free` tinyint(1) DEFAULT '0',
  `slug` varchar(255) DEFAULT NULL,
  `bisac_id` int(11) DEFAULT NULL,
  `image_optimized` tinyint(1) DEFAULT NULL,
  `viewed_count` int(11) DEFAULT NULL,
  `classification` varchar(255) DEFAULT NULL,
  `pdf` tinyint(1) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `censured` tinyint(1) DEFAULT NULL,
  `layout` varchar(255) DEFAULT NULL,
  `degree` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `static_bar` tinyint(1) DEFAULT NULL,
  `smartlab` tinyint(1) DEFAULT NULL,
  `bisac2` varchar(255) DEFAULT NULL,
  `bisac3` varchar(255) DEFAULT NULL,
  `volume` varchar(255) DEFAULT NULL,
  `series` varchar(255) DEFAULT NULL,
  `edition` varchar(255) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `rights` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `imprint` varchar(255) DEFAULT NULL,
  `old_link_url` varchar(255) DEFAULT NULL,
  `pages` int(11) DEFAULT NULL,
  `v2ready` tinyint(1) DEFAULT NULL,
  `external` tinyint(1) DEFAULT NULL,
  `legacy_layout` varchar(255) DEFAULT NULL,
  `manual_info_checked` tinyint(1) DEFAULT '0',
  `book_problem` tinyint(1) DEFAULT NULL,
  `activity_proposal` text,
  `publication_place` varchar(255) DEFAULT NULL,
  `reading_level` int(11) DEFAULT NULL,
  `literary_universe_segmentation` varchar(255) DEFAULT NULL,
  `publication_year` int(11) DEFAULT NULL,
  `bookwire` tinyint(1) DEFAULT '0',
  `max_uses` int(11) DEFAULT NULL,
  `note` text,
  `written_type` varchar(255) DEFAULT NULL,
  `processing_problem` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_books_on_slug` (`slug`),
  KEY `index_books_on_caterogy_id` (`caterogy_id`),
  KEY `index_books_on_publisher_id` (`publisher_id`),
  KEY `index_books_on_free` (`free`),
  KEY `index_books_on_bisac_id` (`bisac_id`),
  KEY `index_books_on_token` (`token`),
  KEY `index_books_on_censured` (`censured`),
  KEY `index_books_on_degree` (`degree`),
  KEY `index_books_on_smartlab` (`smartlab`),
  KEY `index_books_on_literary_universe_segmentation` (`literary_universe_segmentation`),
  KEY `index_books_on_bookwire` (`bookwire`)
) ENGINE=InnoDB AUTO_INCREMENT=35393 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `books_backup`
--

DROP TABLE IF EXISTS `books_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books_backup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` mediumtext,
  `caterogy_id` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `editor` varchar(255) DEFAULT NULL,
  `isbn` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `quantity_per_copy` int(11) DEFAULT NULL,
  `price` decimal(6,2) DEFAULT '0.00',
  `offer` decimal(4,2) DEFAULT NULL,
  `minimum_age` int(11) DEFAULT NULL,
  `publisher_id` int(11) DEFAULT NULL,
  `activated` tinyint(1) DEFAULT NULL,
  `fixed_layout` tinyint(1) DEFAULT NULL,
  `free_to_use` tinyint(1) DEFAULT NULL,
  `publisher_category` varchar(255) DEFAULT NULL,
  `free` tinyint(1) DEFAULT '0',
  `slug` varchar(255) DEFAULT NULL,
  `bisac_id` int(11) DEFAULT NULL,
  `image_optimized` tinyint(1) DEFAULT NULL,
  `viewed_count` int(11) DEFAULT NULL,
  `classification` varchar(255) DEFAULT NULL,
  `pdf` tinyint(1) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `censured` tinyint(1) DEFAULT NULL,
  `layout` varchar(255) DEFAULT NULL,
  `degree` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `static_bar` tinyint(1) DEFAULT NULL,
  `smartlab` tinyint(1) DEFAULT NULL,
  `bisac2` varchar(255) DEFAULT NULL,
  `bisac3` varchar(255) DEFAULT NULL,
  `volume` varchar(255) DEFAULT NULL,
  `series` varchar(255) DEFAULT NULL,
  `edition` varchar(255) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `rights` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `imprint` varchar(255) DEFAULT NULL,
  `old_link_url` varchar(255) DEFAULT NULL,
  `pages` int(11) DEFAULT NULL,
  `v2ready` tinyint(1) DEFAULT NULL,
  `external` tinyint(1) DEFAULT NULL,
  `legacy_layout` varchar(255) DEFAULT NULL,
  `manual_info_checked` tinyint(1) DEFAULT '0',
  `book_problem` tinyint(1) DEFAULT NULL,
  `activity_proposal` text,
  `publication_place` varchar(255) DEFAULT NULL,
  `reading_level` int(11) DEFAULT NULL,
  `literary_universe_segmentation` varchar(255) DEFAULT NULL,
  `publication_year` int(11) DEFAULT NULL,
  `bookwire` tinyint(1) DEFAULT '0',
  `max_uses` int(11) DEFAULT NULL,
  `note` text,
  `written_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_books_on_slug` (`slug`),
  KEY `index_books_on_caterogy_id` (`caterogy_id`),
  KEY `index_books_on_publisher_id` (`publisher_id`),
  KEY `index_books_on_free` (`free`),
  KEY `index_books_on_bisac_id` (`bisac_id`),
  KEY `index_books_on_token` (`token`),
  KEY `index_books_on_censured` (`censured`),
  KEY `index_books_on_degree` (`degree`),
  KEY `index_books_on_smartlab` (`smartlab`),
  KEY `index_books_on_literary_universe_segmentation` (`literary_universe_segmentation`),
  KEY `index_books_on_bookwire` (`bookwire`)
) ENGINE=InnoDB AUTO_INCREMENT=30955 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_creations`
--

DROP TABLE IF EXISTS `cache_creations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_creations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_cache_creations_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_reading_history_compilations`
--

DROP TABLE IF EXISTS `cache_reading_history_compilations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_reading_history_compilations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reader_id` int(11) DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `root_id` int(11) DEFAULT NULL,
  `time_read` int(11) DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `period_type` varchar(255) DEFAULT NULL,
  `period_value` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_cache_reading_history_compilations_on_reader_id` (`reader_id`),
  KEY `index_cache_reading_history_compilations_on_entity_id` (`entity_id`),
  KEY `index_cache_reading_history_compilations_on_root_id` (`root_id`),
  KEY `index_cache_reading_history_compilations_on_period_type` (`period_type`)
) ENGINE=InnoDB AUTO_INCREMENT=608452 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `visible_in_list` tinyint(1) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_categories_on_slug` (`slug`),
  KEY `index_categories_on_visible_in_list` (`visible_in_list`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `category_books`
--

DROP TABLE IF EXISTS `category_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_category_books_on_category_id_and_book_id` (`category_id`,`book_id`),
  KEY `index_category_books_on_category_id` (`category_id`),
  KEY `index_category_books_on_book_id` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44993 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `championship_repositionings`
--

DROP TABLE IF EXISTS `championship_repositionings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `championship_repositionings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reader_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `season_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `tier` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_championship_repositionings_on_season_id` (`season_id`),
  KEY `index_championship_repositionings_on_reader_id` (`reader_id`),
  KEY `index_championship_repositionings_on_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=914 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `championship_seasons`
--

DROP TABLE IF EXISTS `championship_seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `championship_seasons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `championship_id` int(11) DEFAULT NULL,
  `season` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_championship_seasons_on_championship_id` (`championship_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `championship_subscriptions`
--

DROP TABLE IF EXISTS `championship_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `championship_subscriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subscription_reader_id` varchar(255) DEFAULT NULL,
  `scoped_torney_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_championship_subscriptions_on_scoped_torney_id` (`scoped_torney_id`),
  KEY `index_championship_subscriptions_on_subscription_reader_id` (`subscription_reader_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1602 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `characteristics`
--

DROP TABLE IF EXISTS `characteristics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `characteristics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_cities_on_name` (`name`),
  KEY `index_cities_on_state_id` (`state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `classifications`
--

DROP TABLE IF EXISTS `classifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collab_filterings`
--

DROP TABLE IF EXISTS `collab_filterings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collab_filterings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reader_id` int(11) DEFAULT NULL,
  `recommendations` text,
  PRIMARY KEY (`id`),
  KEY `collab_filterings_reader_id_index` (`reader_id`)
) ENGINE=InnoDB AUTO_INCREMENT=90835 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contributors`
--

DROP TABLE IF EXISTS `contributors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contributors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `contribution_type` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_contributors_on_name` (`name`),
  KEY `index_contributors_on_book_id` (`book_id`),
  KEY `index_contributors_on_contribution_type` (`contribution_type`)
) ENGINE=InnoDB AUTO_INCREMENT=740 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `custom_activities`
--

DROP TABLE IF EXISTS `custom_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `message` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_custom_activities_on_activity_id` (`activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1941 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecated_books`
--

DROP TABLE IF EXISTS `deprecated_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deprecated_books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_deprecated_books_on_book_id` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecated_publishers`
--

DROP TABLE IF EXISTS `deprecated_publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deprecated_publishers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `publisher_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_deprecated_publishers_on_publisher_id` (`publisher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `didactic_sequence_bncc_abilities`
--

DROP TABLE IF EXISTS `didactic_sequence_bncc_abilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `didactic_sequence_bncc_abilities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `didactic_sequence_id` int(11) DEFAULT NULL,
  `bncc_ability_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_ability_didactic_sequence` (`didactic_sequence_id`,`bncc_ability_id`),
  KEY `index_didactic_sequence_bncc_abilities_on_didactic_sequence_id` (`didactic_sequence_id`),
  KEY `index_didactic_sequence_bncc_abilities_on_bncc_ability_id` (`bncc_ability_id`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `didactic_sequence_bncc_tags`
--

DROP TABLE IF EXISTS `didactic_sequence_bncc_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `didactic_sequence_bncc_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bncc_tag_id` int(11) DEFAULT NULL,
  `didactic_sequence_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_bncc_tag_didactic_sequence_uniq` (`bncc_tag_id`,`didactic_sequence_id`),
  KEY `index_didactic_sequence_bncc_tags_on_bncc_tag_id` (`bncc_tag_id`),
  KEY `index_didactic_sequence_bncc_tags_on_didactic_sequence_id` (`didactic_sequence_id`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `didactic_sequence_books`
--

DROP TABLE IF EXISTS `didactic_sequence_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `didactic_sequence_books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `didactic_sequence_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_didactic_sequence_book` (`book_id`,`didactic_sequence_id`),
  KEY `index_didactic_sequence_books_on_book_id` (`book_id`),
  KEY `index_didactic_sequence_books_on_didactic_sequence_id` (`didactic_sequence_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `didactic_sequence_specific_skills`
--

DROP TABLE IF EXISTS `didactic_sequence_specific_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `didactic_sequence_specific_skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `didactic_sequence_id` int(11) DEFAULT NULL,
  `specific_skill_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_specific_skills_didactic_sequence` (`didactic_sequence_id`,`specific_skill_id`),
  KEY `index_didactic_sequence_specific_skills_on_didactic_sequence_id` (`didactic_sequence_id`),
  KEY `index_didactic_sequence_specific_skills_on_specific_skill_id` (`specific_skill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `didactic_sequence_textual_genres`
--

DROP TABLE IF EXISTS `didactic_sequence_textual_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `didactic_sequence_textual_genres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `didactic_sequence_id` int(11) DEFAULT NULL,
  `textual_genre_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_didactic_sequence_textual_genre` (`didactic_sequence_id`,`textual_genre_id`),
  KEY `index_didactic_sequence_textual_genres_on_didactic_sequence_id` (`didactic_sequence_id`),
  KEY `index_didactic_sequence_textual_genres_on_textual_genre_id` (`textual_genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `didactic_sequences`
--

DROP TABLE IF EXISTS `didactic_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `didactic_sequences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `arvore_id` varchar(255) DEFAULT NULL,
  `summary` text,
  `purposes` text,
  `evaluation` text,
  `is_ready` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `contents` text,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_didactic_sequences_on_deleted` (`deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discursive_question_answereds`
--

DROP TABLE IF EXISTS `discursive_question_answereds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discursive_question_answereds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_answered_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `answer` mediumtext,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_discursive_question_answereds_on_survey_answered_id` (`survey_answered_id`),
  KEY `index_discursive_question_answereds_on_question_id` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29943 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discursive_question_correcteds`
--

DROP TABLE IF EXISTS `discursive_question_correcteds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discursive_question_correcteds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discursive_question_answered_id` int(11) DEFAULT NULL,
  `avaliation` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21940 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `effetive_readings`
--

DROP TABLE IF EXISTS `effetive_readings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `effetive_readings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `viewed_book_id` int(11) DEFAULT NULL,
  `piece` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_effetive_readings_on_viewed_book_id` (`viewed_book_id`),
  KEY `index_effetive_readings_on_piece` (`piece`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enem_cities`
--

DROP TABLE IF EXISTS `enem_cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enem_cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enem_schools`
--

DROP TABLE IF EXISTS `enem_schools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enem_schools` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `enem_city_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_enem_schools_on_enem_city_id` (`enem_city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entities`
--

DROP TABLE IF EXISTS `entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `ancestry` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `library_kind` varchar(255) DEFAULT NULL,
  `degree` varchar(255) DEFAULT NULL,
  `require_payment` tinyint(1) DEFAULT NULL,
  `partner_id` int(11) DEFAULT NULL,
  `legacy_id` varchar(255) DEFAULT NULL,
  `inep` varchar(255) DEFAULT NULL,
  `site` varchar(255) DEFAULT NULL,
  `responsible_user_id` int(11) DEFAULT NULL,
  `entity_type` varchar(255) DEFAULT NULL,
  `permissions` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `index_entities_on_ancestry` (`ancestry`),
  KEY `index_entities_on_degree` (`degree`),
  KEY `index_entities_on_partner_id` (`partner_id`),
  KEY `index_entities_on_legacy_id` (`legacy_id`),
  KEY `index_entities_on_entity_type` (`entity_type`)
) ENGINE=InnoDB AUTO_INCREMENT=76488 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entity_pre_registers`
--

DROP TABLE IF EXISTS `entity_pre_registers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_pre_registers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `student_list` text,
  `degree` varchar(255) DEFAULT NULL,
  `root_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_entity_pre_registers_on_degree` (`degree`),
  KEY `index_entity_pre_registers_on_root_id` (`root_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1654 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_generals`
--

DROP TABLE IF EXISTS `event_generals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_generals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_name` varchar(255) DEFAULT NULL,
  `reader_id` int(11) DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `root_id` int(11) DEFAULT NULL,
  `event_value` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `event_float_value` float DEFAULT NULL,
  `event_integer_value` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_event_generals_on_event_name` (`event_name`),
  KEY `index_event_generals_on_reader_id` (`reader_id`),
  KEY `index_event_generals_on_entity_id` (`entity_id`),
  KEY `index_event_generals_on_school_id` (`school_id`),
  KEY `index_event_generals_on_root_id` (`root_id`),
  KEY `index_event_generals_on_event_value` (`event_value`),
  KEY `index_event_generals_on_event_integer_value` (`event_integer_value`),
  KEY `index_event_generals_on_created_at` (`created_at`),
  KEY `index_event_generals_on_event_integer_value_and_event_name` (`event_integer_value`,`event_name`),
  KEY `index_event_generals_on_event_value_and_event_name` (`event_value`,`event_name`),
  KEY `index_event_generals_on_user_id` (`user_id`),
  KEY `index_event_generals_on_teacher_id` (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exam_question_books`
--

DROP TABLE IF EXISTS `exam_question_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_question_books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_question_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_exam_question_books` (`exam_question_id`,`book_id`),
  KEY `index_exam_question_books_on_exam_question_id` (`exam_question_id`),
  KEY `index_exam_question_books_on_book_id` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exam_question_choices`
--

DROP TABLE IF EXISTS `exam_question_choices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_question_choices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `statement` text,
  `is_correct` tinyint(1) NOT NULL DEFAULT '0',
  `exam_question_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_exam_question_choices_on_exam_question_id` (`exam_question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7979 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exam_questions`
--

DROP TABLE IF EXISTS `exam_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `statement` text,
  `commented_answer` text,
  `type` varchar(255) DEFAULT NULL,
  `base_text_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_exam_questions_on_base_text_id` (`base_text_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6808 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `favorite_didactic_sequences`
--

DROP TABLE IF EXISTS `favorite_didactic_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorite_didactic_sequences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subscription_group_admin_profile_id` int(11) DEFAULT NULL,
  `didactic_sequence_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_favorite_didactic_sequences` (`subscription_group_admin_profile_id`,`didactic_sequence_id`),
  KEY `index_favorite_ds_on_subscription_group_admin_profile_id` (`subscription_group_admin_profile_id`),
  KEY `index_favorite_ds_on_didactic_sequence_id` (`didactic_sequence_id`)
) ENGINE=InnoDB AUTO_INCREMENT=394 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `profile_id` int(11) DEFAULT NULL,
  `profile_type` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_favorites_on_book_id` (`book_id`),
  KEY `index_favorites_on_profile_id` (`profile_id`),
  KEY `index_favorites_on_profile_type` (`profile_type`)
) ENGINE=InnoDB AUTO_INCREMENT=905560 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `field_practices`
--

DROP TABLE IF EXISTS `field_practices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_practices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `action_field_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_field_practices_on_name_and_action_field_id` (`name`,`action_field_id`),
  KEY `index_field_practices_on_action_field_id` (`action_field_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fitnesses`
--

DROP TABLE IF EXISTS `fitnesses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fitnesses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fitted_for_id` int(11) DEFAULT NULL,
  `population_id` int(11) DEFAULT NULL,
  `gene_id` int(11) DEFAULT NULL,
  `ranking` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_fitnesses_on_fitted_for_id` (`fitted_for_id`),
  KEY `index_fitnesses_on_population_id` (`population_id`),
  KEY `index_fitnesses_on_gene_id` (`gene_id`),
  KEY `index_fitnesses_on_ranking` (`ranking`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `free_roles`
--

DROP TABLE IF EXISTS `free_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `free_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `enem_city_id` int(11) DEFAULT NULL,
  `enem_school_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_free_roles_on_user_id` (`user_id`),
  KEY `index_free_roles_on_enem_city_id` (`enem_city_id`),
  KEY `index_free_roles_on_enem_school_id` (`enem_school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `friendly_id_slugs`
--

DROP TABLE IF EXISTS `friendly_id_slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friendly_id_slugs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `sluggable_id` int(11) NOT NULL,
  `sluggable_type` varchar(50) DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope` (`slug`,`sluggable_type`,`scope`),
  KEY `index_friendly_id_slugs_on_sluggable_id` (`sluggable_id`),
  KEY `index_friendly_id_slugs_on_slug_and_sluggable_type` (`slug`,`sluggable_type`),
  KEY `index_friendly_id_slugs_on_sluggable_type` (`sluggable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_ottos`
--

DROP TABLE IF EXISTS `game_ottos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_ottos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_game_ottos_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3853 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `general_reports`
--

DROP TABLE IF EXISTS `general_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `general_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `value` decimal(10,0) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `general_skills`
--

DROP TABLE IF EXISTS `general_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `general_skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `genetic_fitnesses`
--

DROP TABLE IF EXISTS `genetic_fitnesses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genetic_fitnesses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fitted_for_id` int(11) DEFAULT NULL,
  `population_id` int(11) DEFAULT NULL,
  `gene_id` int(11) DEFAULT NULL,
  `ranking` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_genetic_fitnesses_on_fitted_for_id` (`fitted_for_id`),
  KEY `index_genetic_fitnesses_on_population_id` (`population_id`),
  KEY `index_genetic_fitnesses_on_gene_id` (`gene_id`),
  KEY `index_genetic_fitnesses_on_ranking` (`ranking`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `genetic_populations`
--

DROP TABLE IF EXISTS `genetic_populations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genetic_populations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `genes_ids` varchar(255) DEFAULT NULL,
  `cache_visualization_count` int(11) DEFAULT NULL,
  `cache_points` int(11) DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_genetic_populations_on_scope` (`scope`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group_schools`
--

DROP TABLE IF EXISTS `group_schools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_schools` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `indication_from_readers`
--

DROP TABLE IF EXISTS `indication_from_readers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indication_from_readers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reader_indicator_id` int(11) DEFAULT NULL,
  `reader_target_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_indication_readers_on_book_indicator_target` (`book_id`,`reader_indicator_id`,`reader_target_id`),
  KEY `index_indication_from_readers_on_book_id` (`book_id`),
  KEY `index_indication_from_readers_on_reader_indicator_id` (`reader_indicator_id`),
  KEY `index_indication_from_readers_on_reader_target_id` (`reader_target_id`)
) ENGINE=InnoDB AUTO_INCREMENT=370161 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `indications`
--

DROP TABLE IF EXISTS `indications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `profilable_id` int(11) DEFAULT NULL,
  `profilable_type` varchar(255) DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deadline_date` date DEFAULT NULL,
  `reader_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_indications_on_book_id` (`book_id`),
  KEY `index_indications_on_profilable_id_and_profilable_type` (`profilable_id`,`profilable_type`),
  KEY `index_indications_on_entity_id` (`entity_id`),
  KEY `index_indications_on_reader_id` (`reader_id`)
) ENGINE=InnoDB AUTO_INCREMENT=95314 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `knowledge_areas`
--

DROP TABLE IF EXISTS `knowledge_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `knowledge_areas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_knowledge_areas_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `leitura3300`
--

DROP TABLE IF EXISTS `leitura3300`;
/*!50001 DROP VIEW IF EXISTS `leitura3300`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `leitura3300` AS SELECT 
 1 AS `start_range`,
 1 AS `end_range`,
 1 AS `profile_id`,
 1 AS `book_id`,
 1 AS `sum(r0.``time_spent``)`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `leitura3300vb`
--

DROP TABLE IF EXISTS `leitura3300vb`;
/*!50001 DROP VIEW IF EXISTS `leitura3300vb`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `leitura3300vb` AS SELECT 
 1 AS `id`,
 1 AS `book_id`,
 1 AS `profile_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `lessons`
--

DROP TABLE IF EXISTS `lessons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lessons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text,
  `didactic_sequence_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_lessons_on_didactic_sequence_id` (`didactic_sequence_id`)
) ENGINE=InnoDB AUTO_INCREMENT=268 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `maratona_user_surveys`
--

DROP TABLE IF EXISTS `maratona_user_surveys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maratona_user_surveys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subscription_reader_profile_id` int(11) DEFAULT NULL,
  `cool` int(11) DEFAULT NULL,
  `liked_books` int(11) DEFAULT NULL,
  `easy` int(11) DEFAULT NULL,
  `activities` int(11) DEFAULT NULL,
  `keep_using` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=942 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notification_messages`
--

DROP TABLE IF EXISTS `notification_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `checked` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `notification_message_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_notifications_on_user_id` (`user_id`),
  KEY `index_notifications_on_checked` (`checked`),
  KEY `index_notifications_on_notification_message_id` (`notification_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nps_scores`
--

DROP TABLE IF EXISTS `nps_scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nps_scores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `score` int(11) NOT NULL,
  `source` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_nps_scores_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oauth_users`
--

DROP TABLE IF EXISTS `oauth_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `oauth_token` varchar(255) DEFAULT NULL,
  `oauth_expires_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_oauth_users_on_user_id` (`user_id`),
  KEY `index_oauth_users_on_oauth_token` (`oauth_token`)
) ENGINE=InnoDB AUTO_INCREMENT=13426 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `offline_book_readers`
--

DROP TABLE IF EXISTS `offline_book_readers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_book_readers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `reader_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_offline_book_readers_on_book_id` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=318696 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_id` int(11) DEFAULT NULL,
  `root_id` int(11) DEFAULT NULL,
  `reader_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `degree` varchar(255) DEFAULT NULL,
  `time_spent` int(11) DEFAULT NULL,
  `initial_percentage` decimal(4,1) DEFAULT '0.0',
  `final_percentage` decimal(4,1) DEFAULT '0.0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_pages_on_entity_id` (`entity_id`),
  KEY `index_pages_on_root_id` (`root_id`),
  KEY `index_pages_on_reader_id` (`reader_id`),
  KEY `index_pages_on_time_spent` (`time_spent`),
  KEY `index_pages_on_book_id` (`book_id`),
  KEY `index_pages_on_degree` (`degree`),
  KEY `index_pages_on_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pages_syncs`
--

DROP TABLE IF EXISTS `pages_syncs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages_syncs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_fetched_page_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10802 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `parents`
--

DROP TABLE IF EXISTS `parents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `cpf` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `cellphone` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `paid_date` date DEFAULT NULL,
  `payment_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1318 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `parentships`
--

DROP TABLE IF EXISTS `parentships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parentships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_parentships_on_parent_id` (`parent_id`),
  KEY `index_parentships_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1316 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `partners`
--

DROP TABLE IF EXISTS `partners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `platform_buy_orders`
--

DROP TABLE IF EXISTS `platform_buy_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `platform_buy_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `b2b_platform_account_id` int(11) DEFAULT NULL,
  `aprooved` tinyint(1) DEFAULT '0',
  `denied` tinyint(1) DEFAULT '0',
  `pending` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_platform_buy_orders_on_b2b_platform_account_id` (`b2b_platform_account_id`),
  KEY `index_platform_buy_orders_on_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `platform_checkouts`
--

DROP TABLE IF EXISTS `platform_checkouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `platform_checkouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `b2b_platform_account_id` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `platform_buy_order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_platform_checkouts_on_book_id` (`book_id`),
  KEY `index_platform_checkouts_on_b2b_platform_account_id` (`b2b_platform_account_id`),
  KEY `index_platform_checkouts_on_platform_buy_order_id` (`platform_buy_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `platform_virtual_book_copies`
--

DROP TABLE IF EXISTS `platform_virtual_book_copies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `platform_virtual_book_copies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(6,2) DEFAULT '0.00',
  `code` varchar(255) DEFAULT NULL,
  `uses` int(11) DEFAULT '0',
  `max_uses` int(11) DEFAULT '100',
  `account_id` int(11) DEFAULT NULL,
  `account_type` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_platform_virtual_book_copies_on_account_id` (`account_id`),
  KEY `index_platform_virtual_book_copies_on_account_type` (`account_type`),
  KEY `index_platform_virtual_book_copies_on_book_id` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `polemic_books`
--

DROP TABLE IF EXISTS `polemic_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `polemic_books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `polemic_theme_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_polemic_books_on_book_id` (`book_id`),
  KEY `index_polemic_books_on_polemic_theme_id` (`polemic_theme_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1277 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `polemic_themes`
--

DROP TABLE IF EXISTS `polemic_themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `polemic_themes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_polemic_themes_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `practice_objects`
--

DROP TABLE IF EXISTS `practice_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `practice_objects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `field_practice_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_practice_objects_on_name_and_field_practice_id` (`name`,`field_practice_id`),
  KEY `index_practice_objects_on_field_practice_id` (`field_practice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `processed_viewed_book_july`
--

DROP TABLE IF EXISTS `processed_viewed_book_july`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `processed_viewed_book_july` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `effective_percentage` decimal(10,0) DEFAULT NULL,
  `profile_id` int(11) DEFAULT NULL,
  `total_time_spent` int(11) DEFAULT NULL,
  `root_id` int(11) DEFAULT NULL,
  `reader_id` int(11) DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `degree` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_processed_viewed_book_july_on_book_id` (`book_id`),
  KEY `index_processed_viewed_book_july_on_profile_id` (`profile_id`),
  KEY `index_processed_viewed_book_july_on_root_id` (`root_id`),
  KEY `index_processed_viewed_book_july_on_reader_id` (`reader_id`),
  KEY `index_processed_viewed_book_july_on_entity_id` (`entity_id`),
  KEY `index_processed_viewed_book_july_on_degree` (`degree`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `processed_viewed_books`
--

DROP TABLE IF EXISTS `processed_viewed_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `processed_viewed_books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `effective_percentage` decimal(5,2) DEFAULT NULL,
  `profile_id` int(11) DEFAULT NULL,
  `total_time_spent` int(11) DEFAULT NULL,
  `root_id` int(11) DEFAULT NULL,
  `reader_id` int(11) DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `degree` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_tmp_processed_viewed_books_on_book_id` (`book_id`),
  KEY `index_tmp_processed_viewed_books_on_profile_id` (`profile_id`),
  KEY `index_tmp_processed_viewed_books_on_root_id` (`root_id`),
  KEY `index_tmp_processed_viewed_books_on_reader_id` (`reader_id`),
  KEY `index_tmp_processed_viewed_books_on_entity_id` (`entity_id`),
  KEY `index_tmp_processed_viewed_books_on_degree` (`degree`)
) ENGINE=InnoDB AUTO_INCREMENT=3179372 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_refusals`
--

DROP TABLE IF EXISTS `project_refusals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_refusals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL,
  `msg` text,
  `viewed_by_user` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_project_refusals_on_activity_id` (`activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=475 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `public_data_activities`
--

DROP TABLE IF EXISTS `public_data_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `public_data_activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_activity_id` int(11) DEFAULT NULL,
  `public_activity_id` int(11) DEFAULT NULL,
  `objective` text,
  `degree_range` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `school` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `curation_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `avoid_duplicated_data_at_same_activity` (`source_activity_id`,`public_activity_id`),
  KEY `index_public_data_activities_on_curation_status` (`curation_status`)
) ENGINE=InnoDB AUTO_INCREMENT=329 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `public_data_activity_general_skills`
--

DROP TABLE IF EXISTS `public_data_activity_general_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `public_data_activity_general_skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `public_data_activity_id` int(11) DEFAULT NULL,
  `general_skill_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `avoid_dup_gen_skill_at_publ_data_activity` (`public_data_activity_id`,`general_skill_id`),
  KEY `index_publ_activity_gen_skills_on_publ_data_activity_id` (`public_data_activity_id`),
  KEY `index_publ_activity_gen_skills_on_gen_skill_id` (`general_skill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `public_data_activity_tags`
--

DROP TABLE IF EXISTS `public_data_activity_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `public_data_activity_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `public_data_activity_id` int(11) DEFAULT NULL,
  `bncc_tag_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `avoid_duplicated_tag_at_same_public_data` (`public_data_activity_id`,`bncc_tag_id`),
  KEY `index_public_data_activity_tags_on_public_data_activity_id` (`public_data_activity_id`),
  KEY `index_public_data_activity_tags_on_bncc_tag_id` (`bncc_tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=390 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `public_data_activity_textual_genres`
--

DROP TABLE IF EXISTS `public_data_activity_textual_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `public_data_activity_textual_genres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `public_data_activity_id` int(11) DEFAULT NULL,
  `textual_genre_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `avoid_duplicated_textual_genre_same_activity` (`public_data_activity_id`,`textual_genre_id`),
  KEY `index_public_data_activity_textual_genres_on_textual_genre_id` (`textual_genre_id`),
  KEY `index_pdatg_to_public_data_activity` (`public_data_activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `publisher_groups`
--

DROP TABLE IF EXISTS `publisher_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `publisher_id` int(11) DEFAULT NULL,
  `publisher_slug_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_publisher_groups_on_publisher_id_and_publisher_slug_id` (`publisher_id`,`publisher_slug_id`),
  KEY `index_publisher_groups_on_publisher_id` (`publisher_id`),
  KEY `index_publisher_groups_on_publisher_slug_id` (`publisher_slug_id`)
) ENGINE=InnoDB AUTO_INCREMENT=585 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `publisher_slugs`
--

DROP TABLE IF EXISTS `publisher_slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher_slugs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `publisher_group_id` int(11) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_publisher_slugs_and_groups` (`publisher_group_id`,`slug`),
  KEY `index_publisher_slugs_on_publisher_group_id` (`publisher_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=441 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `publisher_user_profiles`
--

DROP TABLE IF EXISTS `publisher_user_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher_user_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `publisher_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_publisher_user_profiles_on_publisher_id` (`publisher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `publishers`
--

DROP TABLE IF EXISTS `publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publishers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `paid_first_copy` tinyint(1) DEFAULT '1',
  `discount` decimal(3,2) DEFAULT '0.00',
  `max_uses` int(11) DEFAULT '100',
  `allow_simultaneous` tinyint(1) DEFAULT NULL,
  `bookwire` tinyint(1) DEFAULT '0',
  `desativated` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_publishers_on_bookwire` (`bookwire`)
) ENGINE=InnoDB AUTO_INCREMENT=710 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `question_alternatives`
--

DROP TABLE IF EXISTS `question_alternatives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_alternatives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) DEFAULT NULL,
  `correct` tinyint(1) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_question_alternatives_on_question_id` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4476 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` mediumtext,
  `discursive` tinyint(1) DEFAULT NULL,
  `survey_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_questions_on_survey_id` (`survey_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2907 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `range_values`
--

DROP TABLE IF EXISTS `range_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `range_values` (
  `start_range` int(11) DEFAULT NULL,
  `end_range` int(11) DEFAULT NULL,
  KEY `index_start` (`start_range`) USING BTREE,
  KEY `index2` (`end_range`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `range_values_5`
--

DROP TABLE IF EXISTS `range_values_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `range_values_5` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_range` int(11) DEFAULT NULL,
  `end_range` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ranking_caches`
--

DROP TABLE IF EXISTS `ranking_caches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ranking_caches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reader_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `root_id` int(11) DEFAULT NULL,
  `time_spent` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_ranking_caches_on_reader_id` (`reader_id`),
  KEY `index_ranking_caches_on_position` (`position`)
) ENGINE=InnoDB AUTO_INCREMENT=93552 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ranking_histories`
--

DROP TABLE IF EXISTS `ranking_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ranking_histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reader_id` int(11) DEFAULT NULL,
  `degree` varchar(255) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `rank_position` int(11) DEFAULT NULL,
  `tier` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_ranking_history_reader_year_month` (`reader_id`,`year`,`month`)
) ENGINE=InnoDB AUTO_INCREMENT=370221 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rankings`
--

DROP TABLE IF EXISTS `rankings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rankings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_id` int(11) DEFAULT NULL,
  `root_id` int(11) DEFAULT NULL,
  `reader_id` int(11) DEFAULT NULL,
  `reader_name` varchar(255) DEFAULT NULL,
  `entity_name` varchar(255) DEFAULT NULL,
  `root_name` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `time_spent` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_rankings_on_entity_id` (`entity_id`),
  KEY `index_rankings_on_root_id` (`root_id`),
  KEY `index_rankings_on_reader_id` (`reader_id`),
  KEY `index_rankings_on_position` (`position`)
) ENGINE=InnoDB AUTO_INCREMENT=97041615 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reader_entity_histories`
--

DROP TABLE IF EXISTS `reader_entity_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reader_entity_histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subscription_reader_profile_id` int(11) DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `old_entity_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_reader_entity_histories_on_subscription_reader_profile_id` (`subscription_reader_profile_id`),
  KEY `index_reader_entity_histories_on_entity_id` (`entity_id`),
  KEY `index_reader_entity_histories_on_old_entity_id` (`old_entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10907 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reading_histories`
--

DROP TABLE IF EXISTS `reading_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reading_histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `initial_percentage` decimal(7,5) DEFAULT NULL,
  `final_percentage` decimal(7,5) DEFAULT NULL,
  `viewed_book_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `time_spent` int(11) DEFAULT NULL,
  `wpm` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `avoid_duplications` (`viewed_book_id`,`initial_percentage`,`final_percentage`,`time_spent`),
  KEY `index_reading_histories_on_viewed_book_id` (`viewed_book_id`),
  KEY `index_reading_histories_on_created_at` (`created_at`),
  KEY `index_reading_histories_on_wpm` (`wpm`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `root_payments`
--

DROP TABLE IF EXISTS `root_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `root_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_id` int(11) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `discount` decimal(3,2) NOT NULL DEFAULT '0.00',
  `discount_due_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_root_payments_on_entity_id` (`entity_id`),
  KEY `index_root_payments_on_slug` (`slug`),
  KEY `index_root_payments_on_token` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `satisfaction_surveys`
--

DROP TABLE IF EXISTS `satisfaction_surveys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `satisfaction_surveys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `target_audience` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  `inserted_at` datetime DEFAULT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `school_class_teachers`
--

DROP TABLE IF EXISTS `school_class_teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `school_class_teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_class_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_school_class_teachers_on_school_class_id` (`school_class_id`),
  KEY `index_school_class_teachers_on_teacher_id` (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `school_classes`
--

DROP TABLE IF EXISTS `school_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `school_classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_school_classes_on_school_id` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `school_teachers`
--

DROP TABLE IF EXISTS `school_teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `school_teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_school_teachers_on_school_id` (`school_id`),
  KEY `index_school_teachers_on_teacher_id` (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schools`
--

DROP TABLE IF EXISTS `schools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schools` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_school_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `image_link` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_schools_on_group_school_id` (`group_school_id`),
  KEY `index_schools_on_city_id` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scoped_torneys`
--

DROP TABLE IF EXISTS `scoped_torneys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scoped_torneys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tier` int(11) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `championship_season_id` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `users_count` int(11) DEFAULT '0',
  `snapshot_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_scoped_torneys_on_championship_season_id` (`championship_season_id`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sent_projects`
--

DROP TABLE IF EXISTS `sent_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sent_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `activity_id` int(11) DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `approved` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sent_projects_on_entity_id` (`entity_id`),
  KEY `index_sent_projects_on_activity_id` (`activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6009 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slas`
--

DROP TABLE IF EXISTS `slas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `result` float DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `model_type` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_slas_on_model_id` (`model_id`),
  KEY `index_slas_on_model_type` (`model_type`)
) ENGINE=InnoDB AUTO_INCREMENT=22353795 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smartlab_entities`
--

DROP TABLE IF EXISTS `smartlab_entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smartlab_entities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `stage` varchar(255) DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `id_school_official` int(11) DEFAULT NULL,
  `partner_id` int(11) DEFAULT NULL,
  `partner_entity_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_smartlab_entities_on_entity_id` (`entity_id`),
  KEY `index_smartlab_entities_on_partner_id` (`partner_id`),
  KEY `index_smartlab_entities_on_partner_entity_id` (`partner_entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1468 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smartlab_teacher_classes`
--

DROP TABLE IF EXISTS `smartlab_teacher_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smartlab_teacher_classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `smartlab_user_id` int(11) DEFAULT NULL,
  `smartlab_entity_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `partner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_smartlab_teacher_classes_on_smartlab_user_id` (`smartlab_user_id`),
  KEY `index_smartlab_teacher_classes_on_smartlab_entity_id` (`smartlab_entity_id`),
  KEY `index_smartlab_teacher_classes_on_partner_id` (`partner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smartlab_users`
--

DROP TABLE IF EXISTS `smartlab_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smartlab_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `smartlab_entities_id` int(11) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `sur_name` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `partner_id` int(11) DEFAULT NULL,
  `smartlab_user_id` int(11) DEFAULT NULL,
  `ra` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_smartlab_users_on_smartlab_entities_id` (`smartlab_entities_id`),
  KEY `index_smartlab_users_on_user_id` (`user_id`),
  KEY `index_smartlab_users_on_account_id` (`account_id`),
  KEY `index_smartlab_users_on_partner_id` (`partner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52114 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `snapshot_contenders`
--

DROP TABLE IF EXISTS `snapshot_contenders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snapshot_contenders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scoped_torney_id` int(11) DEFAULT NULL,
  `subscription_reader_id_id` int(11) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `snapshot_index` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_snapshot_contenders_on_scoped_torney_id` (`scoped_torney_id`),
  KEY `index_snapshot_contenders_on_subscription_reader_id_id` (`subscription_reader_id_id`),
  KEY `index_snapshot_contenders_on_snapshot_index` (`snapshot_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sp_answers`
--

DROP TABLE IF EXISTS `sp_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sp_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `answer_number` int(11) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sp_answers_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21483 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `specific_skills`
--

DROP TABLE IF EXISTS `specific_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specific_skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text,
  `knowledge_area_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_specific_skills_on_knowledge_area_id` (`knowledge_area_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_states_on_region_id` (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stddev_books`
--

DROP TABLE IF EXISTS `stddev_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stddev_books` (
  `avg` float DEFAULT NULL,
  `end_range` int(11) DEFAULT NULL,
  `start_range` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `stddev` float DEFAULT NULL,
  KEY `index1` (`avg`),
  KEY `index2` (`end_range`),
  KEY `index3` (`start_range`) USING BTREE,
  KEY `index4` (`book_id`),
  KEY `index5` (`stddev`),
  KEY `index6` (`end_range`,`start_range`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `store_ratings`
--

DROP TABLE IF EXISTS `store_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `rating` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_store_ratings_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15264 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subscription_group_admin_profiles`
--

DROP TABLE IF EXISTS `subscription_group_admin_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription_group_admin_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_id` int(11) DEFAULT NULL,
  `root_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `reader_id` int(11) DEFAULT NULL,
  `reader_mode` tinyint(1) DEFAULT NULL,
  `desativated` tinyint(1) DEFAULT '0',
  `permissions` varchar(255) DEFAULT NULL,
  `partner_id` int(11) DEFAULT NULL,
  `legacy_id` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_subscription_group_admin_profiles_on_entity_id` (`entity_id`),
  KEY `index_subscription_group_admin_profiles_on_root_id` (`root_id`),
  KEY `index_subscription_group_admin_profiles_on_user_id` (`user_id`),
  KEY `index_subscription_group_admin_profiles_on_reader_id` (`reader_id`),
  KEY `index_subscription_group_admin_profiles_on_desativated` (`desativated`),
  KEY `index_subscription_group_admin_profiles_on_partner_id` (`partner_id`),
  KEY `index_subscription_group_admin_profiles_on_legacy_id` (`legacy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44861 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subscription_reader_profiles`
--

DROP TABLE IF EXISTS `subscription_reader_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription_reader_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_id` int(11) DEFAULT NULL,
  `root_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `last_indication_view_date` datetime DEFAULT NULL,
  `desativated` tinyint(1) DEFAULT '0',
  `payment_date` date DEFAULT NULL,
  `school_registration_code` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `partner_id` int(11) DEFAULT NULL,
  `legacy_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_subscription_reader_profiles_on_entity_id` (`entity_id`),
  KEY `index_subscription_reader_profiles_on_root_id` (`root_id`),
  KEY `index_subscription_reader_profiles_on_user_id` (`user_id`),
  KEY `index_subscription_reader_profiles_on_desativated` (`desativated`),
  KEY `index_subscription_reader_profiles_on_partner_id` (`partner_id`),
  KEY `index_subscription_reader_profiles_on_legacy_id` (`legacy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=545502 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `survey_answereds`
--

DROP TABLE IF EXISTS `survey_answereds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_answereds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profilable_id` int(11) DEFAULT NULL,
  `profilable_type` varchar(255) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `applied_survey_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_survey_answereds_on_profilable_id` (`profilable_id`),
  KEY `index_survey_answereds_on_profilable_type` (`profilable_type`),
  KEY `index_survey_answereds_on_applied_survey_id` (`applied_survey_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13002 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `survey_question_answers`
--

DROP TABLE IF EXISTS `survey_question_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_question_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_teacher` tinyint(1) DEFAULT NULL,
  `other_answer` text,
  `survey_question_id` int(11) DEFAULT NULL,
  `survey_question_choice_id` int(11) DEFAULT NULL,
  `reader_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_survey_question_id_reader_id` (`survey_question_id`,`reader_id`),
  KEY `index_survey_question_answers_on_survey_question_id` (`survey_question_id`),
  KEY `index_survey_question_answers_on_survey_question_choice_id` (`survey_question_choice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `survey_question_choices`
--

DROP TABLE IF EXISTS `survey_question_choices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_question_choices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text,
  `type` varchar(255) DEFAULT NULL,
  `survey_question_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_survey_question_choices_on_survey_question_id` (`survey_question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `survey_questions`
--

DROP TABLE IF EXISTS `survey_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `statement` text,
  `satisfaction_survey_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_survey_questions_on_satisfaction_survey_id` (`satisfaction_survey_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `surveys`
--

DROP TABLE IF EXISTS `surveys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surveys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `profilable_type` varchar(255) DEFAULT NULL,
  `profilable_id` int(11) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_surveys_on_book_id` (`book_id`),
  KEY `index_surveys_on_entity_id` (`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=799 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_tags_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=102954 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teacher_classes`
--

DROP TABLE IF EXISTS `teacher_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher_classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `avoid_duplicated_teacher_at_same_class` (`teacher_id`,`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27956 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teacher_entities`
--

DROP TABLE IF EXISTS `teacher_entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher_entities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `avoid_duplicated_teacher_at_same_entity` (`teacher_id`,`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=547 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teacher_subjects`
--

DROP TABLE IF EXISTS `teacher_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher_subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `avoid_duplicated_teacher_at_same_subject` (`teacher_id`,`subject`)
) ENGINE=InnoDB AUTO_INCREMENT=3387 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temporarily_books`
--

DROP TABLE IF EXISTS `temporarily_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temporarily_books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `deadline_date` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `avoid_duplicated_book_and_entity` (`book_id`,`entity_id`),
  KEY `index_temporarily_books_on_book_id` (`book_id`),
  KEY `index_temporarily_books_on_teacher_id` (`teacher_id`),
  KEY `index_temporarily_books_on_entity_id` (`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temporary_links`
--

DROP TABLE IF EXISTS `temporary_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temporary_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) DEFAULT NULL,
  `redirect_url` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `textual_genres`
--

DROP TABLE IF EXISTS `textual_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `textual_genres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_textual_genres_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `themes`
--

DROP TABLE IF EXISTS `themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `themes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=707 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_processed_viewed_book_july`
--

DROP TABLE IF EXISTS `tmp_processed_viewed_book_july`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_processed_viewed_book_july` (
  `id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `effective_percentage` double DEFAULT NULL,
  `profile_id` int(11) DEFAULT NULL,
  `total_time_spent` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `root_id` int(11) DEFAULT NULL,
  `reader_id` int(11) DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `degree` text,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_processed_viewed_books`
--

DROP TABLE IF EXISTS `tmp_processed_viewed_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_processed_viewed_books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `effective_percentage` decimal(5,2) DEFAULT NULL,
  `profile_id` int(11) DEFAULT NULL,
  `total_time_spent` int(11) DEFAULT NULL,
  `root_id` int(11) DEFAULT NULL,
  `reader_id` int(11) DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `degree` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_processed_viewed_books_on_book_id` (`book_id`),
  KEY `index_processed_viewed_books_on_profile_id` (`profile_id`),
  KEY `index_processed_viewed_books_on_root_id` (`root_id`),
  KEY `index_processed_viewed_books_on_reader_id` (`reader_id`),
  KEY `index_processed_viewed_books_on_entity_id` (`entity_id`),
  KEY `index_processed_viewed_books_on_degree` (`degree`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `torney_caches`
--

DROP TABLE IF EXISTS `torney_caches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `torney_caches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `torney_id` int(11) DEFAULT NULL,
  `subscription_reader_profile_id` int(11) DEFAULT NULL,
  `time_spent` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_torney_caches_on_torney_id` (`torney_id`),
  KEY `index_torney_caches_on_subscription_reader_profile_id` (`subscription_reader_profile_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1158 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_activities`
--

DROP TABLE IF EXISTS `user_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_activities_on_user_id` (`user_id`),
  KEY `index_user_activities_on_book_id` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_books`
--

DROP TABLE IF EXISTS `user_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_books_on_user_id` (`user_id`),
  KEY `index_user_books_on_book_id` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_sessions`
--

DROP TABLE IF EXISTS `user_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_user_sessions_on_user_id` (`user_id`),
  KEY `index_user_sessions_on_token` (`token`),
  KEY `index_user_sessions_on_type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_teacher` tinyint(1) DEFAULT NULL,
  `is_editor` tinyint(1) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `referee_id` int(11) DEFAULT NULL,
  `referee_type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `school_id_denormalized` int(11) DEFAULT NULL,
  `group_school_id` int(11) DEFAULT NULL,
  `unique_session_id` varchar(20) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT NULL,
  `user_kind_id` int(11) DEFAULT NULL,
  `user_kind_type` varchar(255) DEFAULT NULL,
  `changed_password` tinyint(1) DEFAULT NULL,
  `born_date` date DEFAULT NULL,
  `special_needs` tinyint(1) DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `unconfirmed_email` varchar(255) DEFAULT NULL,
  `authentication_token` varchar(255) DEFAULT NULL,
  `api_token` varchar(255) DEFAULT NULL,
  `legacy_email` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `second_email` varchar(255) DEFAULT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`),
  UNIQUE KEY `index_users_on_username` (`username`),
  UNIQUE KEY `index_users_on_access_token` (`access_token`),
  KEY `index_users_on_teacher_id` (`teacher_id`),
  KEY `index_users_on_referee_id` (`referee_id`),
  KEY `index_users_on_referee_type` (`referee_type`),
  KEY `index_users_on_school_id_denormalized` (`school_id_denormalized`),
  KEY `index_users_on_group_school_id` (`group_school_id`),
  KEY `index_users_on_user_kind_id` (`user_kind_id`),
  KEY `index_users_on_user_kind_type` (`user_kind_type`),
  KEY `index_users_on_confirmation_token` (`confirmation_token`),
  KEY `index_users_on_authentication_token` (`authentication_token`),
  KEY `index_users_on_api_token` (`api_token`)
) ENGINE=InnoDB AUTO_INCREMENT=568645 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_type` varchar(255) NOT NULL,
  `item_id` int(11) NOT NULL,
  `event` varchar(255) NOT NULL,
  `whodunnit` varchar(255) DEFAULT NULL,
  `object` longtext,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_versions_on_item_type_and_item_id` (`item_type`,`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `viewed_book_painel`
--

DROP TABLE IF EXISTS `viewed_book_painel`;
/*!50001 DROP VIEW IF EXISTS `viewed_book_painel`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `viewed_book_painel` AS SELECT 
 1 AS `id`,
 1 AS `total_time_spent`,
 1 AS `effective_percentage`,
 1 AS `book_id`,
 1 AS `slug`,
 1 AS `root_id`,
 1 AS `root_name`,
 1 AS `entity_id`,
 1 AS `entity_name`,
 1 AS `reader_id`,
 1 AS `user_id`,
 1 AS `user_name`,
 1 AS `user_access_token`,
 1 AS `entity_degree`,
 1 AS `book_degree`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `viewed_books`
--

DROP TABLE IF EXISTS `viewed_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viewed_books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) DEFAULT NULL,
  `profile_type` varchar(255) DEFAULT NULL,
  `percentage` decimal(5,3) DEFAULT '0.000',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `resume_element_id` int(11) DEFAULT NULL,
  `resume_element_doc` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_viewed_books_on_profile_id` (`profile_id`),
  KEY `index_viewed_books_on_profile_type` (`profile_type`),
  KEY `index_viewed_books_on_book_id` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3179383 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `visit_reports`
--

DROP TABLE IF EXISTS `visit_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visit_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `admin_profile` int(11) DEFAULT NULL,
  `reader_profile` int(11) DEFAULT NULL,
  `page` varchar(255) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_visit_reports_on_user_id` (`user_id`),
  KEY `index_visit_reports_on_admin_profile` (`admin_profile`),
  KEY `index_visit_reports_on_reader_profile` (`reader_profile`),
  KEY `index_visit_reports_on_page` (`page`),
  KEY `index_visit_reports_on_detail` (`detail`)
) ENGINE=InnoDB AUTO_INCREMENT=44730 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `visits`
--

DROP TABLE IF EXISTS `visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visits` (
  `id` binary(16) NOT NULL,
  `visitor_id` binary(16) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `user_agent` text,
  `referrer` text,
  `landing_page` text,
  `user_id` int(11) DEFAULT NULL,
  `referring_domain` varchar(255) DEFAULT NULL,
  `search_keyword` varchar(255) DEFAULT NULL,
  `browser` varchar(255) DEFAULT NULL,
  `os` varchar(255) DEFAULT NULL,
  `device_type` varchar(255) DEFAULT NULL,
  `screen_height` int(11) DEFAULT NULL,
  `screen_width` int(11) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `latitude` decimal(10,0) DEFAULT NULL,
  `longitude` decimal(10,0) DEFAULT NULL,
  `utm_source` varchar(255) DEFAULT NULL,
  `utm_medium` varchar(255) DEFAULT NULL,
  `utm_term` varchar(255) DEFAULT NULL,
  `utm_content` varchar(255) DEFAULT NULL,
  `utm_campaign` varchar(255) DEFAULT NULL,
  `started_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_visits_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'bookstore_prod_20191018'
--

--
-- Final view structure for view `best_cost_books`
--

/*!50001 DROP VIEW IF EXISTS `best_cost_books`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`andrelip`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `best_cost_books` AS select `b1`.`id` AS `id`,`b1`.`id` AS `book_id`,`b1`.`slug` AS `slug`,`b1`.`degree` AS `degree`,`b1`.`publisher_id` AS `publisher_id`,`b1`.`name` AS `name`,count(`p0`.`book_id`) AS `reads_count_over_10p`,(avg(`p0`.`total_time_spent`) / 3600) AS `avg_total_time_spent_in_hours`,avg(`p0`.`effective_percentage`) AS `avg_effective_percentage`,(avg(`b1`.`price_per_use_with_discount`) / (avg(`p0`.`total_time_spent`) / 3600)) AS `price_per_hour`,(((avg(`b1`.`price_per_use_with_discount`) / (avg(`p0`.`total_time_spent`) / 3600)) * count(`p0`.`book_id`)) * (avg(`p0`.`total_time_spent`) / 3600)) AS `total_paid` from (`processed_viewed_books` `p0` join `book_prices` `b1` on((`b1`.`id` = `p0`.`book_id`))) where (`p0`.`effective_percentage` > 10) group by `p0`.`book_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `book_prices`
--

/*!50001 DROP VIEW IF EXISTS `book_prices`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`andrelip`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `book_prices` AS select `b0`.`id` AS `id`,`b0`.`slug` AS `slug`,`b0`.`degree` AS `degree`,`b0`.`isbn` AS `isbn`,`b0`.`publisher_id` AS `publisher_id`,`p1`.`name` AS `name`,`p1`.`discount` AS `discount`,`b0`.`price` AS `price`,(`b0`.`price` * (1 - `p1`.`discount`)) AS `price_with_discount`,((`b0`.`price` * (1 / `p1`.`max_uses`)) * (1 - `p1`.`discount`)) AS `price_per_use_with_discount` from (`books` `b0` join `publishers` `p1` on((`p1`.`id` = `b0`.`publisher_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `leitura3300`
--

/*!50001 DROP VIEW IF EXISTS `leitura3300`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`andrelip`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `leitura3300` AS select `r2`.`start_range` AS `start_range`,`r2`.`end_range` AS `end_range`,`l1`.`profile_id` AS `profile_id`,`l1`.`book_id` AS `book_id`,sum(`r0`.`time_spent`) AS `sum(r0.``time_spent``)` from ((`reading_histories` `r0` join `leitura3300vb` `l1` on((`l1`.`id` = `r0`.`viewed_book_id`))) join `range_values` `r2` on(((`r0`.`initial_percentage` >= `r2`.`start_range`) and (`r0`.`initial_percentage` <= `r2`.`end_range`)))) group by `r2`.`start_range`,`r2`.`end_range`,`l1`.`profile_id` having (sum(`r0`.`time_spent`) < 1000) order by `r2`.`start_range`,sum(`r0`.`time_spent`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `leitura3300vb`
--

/*!50001 DROP VIEW IF EXISTS `leitura3300vb`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`andrelip`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `leitura3300vb` AS select `v0`.`id` AS `id`,`v0`.`book_id` AS `book_id`,`v0`.`profile_id` AS `profile_id` from (`viewed_books` `v0` join `processed_viewed_books` `p1` on((`p1`.`id` = `v0`.`id`))) where ((`p1`.`effective_percentage` >= 90) and (`v0`.`book_id` = 3425)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewed_book_painel`
--

/*!50001 DROP VIEW IF EXISTS `viewed_book_painel`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`andrelip`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `viewed_book_painel` AS select `p0`.`id` AS `id`,`p0`.`total_time_spent` AS `total_time_spent`,`p0`.`effective_percentage` AS `effective_percentage`,`b1`.`id` AS `book_id`,`b1`.`slug` AS `slug`,`e3`.`id` AS `root_id`,`e3`.`name` AS `root_name`,`e2`.`id` AS `entity_id`,`e2`.`name` AS `entity_name`,`s4`.`id` AS `reader_id`,`u5`.`id` AS `user_id`,`u5`.`name` AS `user_name`,`u5`.`access_token` AS `user_access_token`,`e3`.`degree` AS `entity_degree`,`b1`.`degree` AS `book_degree` from (((((`processed_viewed_books` `p0` join `books` `b1` on((`b1`.`id` = `p0`.`book_id`))) join `entities` `e2` on((`e2`.`id` = `p0`.`root_id`))) join `entities` `e3` on((`e3`.`id` = `p0`.`entity_id`))) join `subscription_reader_profiles` `s4` on((`s4`.`id` = `p0`.`profile_id`))) join `users` `u5` on((`u5`.`id` = `s4`.`user_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-26 13:38:47
INSERT INTO `schema_migrations` (version) VALUES (20130912195704), (20130912195727), (20130913005459), (20130913005946), (20130923144504), (20130924174905), (20130924175252), (20130926051053), (20130930114706), (20130930114757), (20131004200100), (20131004200133), (20131004200215), (20131024170701), (20131122024637), (20131122031250), (20131122031630), (20131122123629), (20131125092525), (20131127115743), (20131128091759), (20131128153026), (20131201192736), (20140102035652), (20140102040552), (20140102040748), (20140102041941), (20140102042210), (20140107130202), (20140107141732), (20140107161953), (20140110132036), (20140110132056), (20140113184748), (20140113184830), (20140129150752), (20140213173337), (20140213175030), (20140213180139), (20140213183120), (20140219130341), (20140220214818), (20140220222213), (20140307171612), (20140307185744), (20140312215847), (20140313213152), (20140324192551), (20140324193238), (20140325184915), (20140327204637), (20140327205903), (20140328155451), (20140328155751), (20140401141901), (20140401201612), (20140404184145), (20140404184914), (20140415150259), (20140508144150), (20140508144554), (20140508152855), (20140509180025), (20140509191020), (20140509191342), (20140509194206), (20140509200808), (20140509204041), (20140509210513), (20140513072028), (20140513074603), (20140513141436), (20140519152336), (20140522172558), (20140522175448), (20140522180153), (20140522181226), (20140523205444), (20140526211421), (20140526211448), (20140526212115), (20140529173756), (20140529174420), (20140606185049), (20140613183401), (20140616175350), (20140616183536), (20140616184828), (20140620170043), (20140620201903), (20140620204717), (20140620205123), (20140620205424), (20140624175011), (20140627151618), (20140703215024), (20140707173543), (20140718145823), (20140718155244), (20140721203718), (20140721203910), (20140722215358), (20140722215432), (20140723115624), (20140804184458), (20140805170239), (20140805174312), (20140811165936), (20140818164827), (20140902195026), (20140905210839), (20141003124404), (20141003132200), (20141013205620), (20141013211122), (20141015190039), (20141015190157), (20141015190235), (20141015191211), (20141023182701), (20141023201037), (20141023201107), (20141023211905), (20141031142257), (20141031204110), (20141114201936), (20141210174300), (20150109183318), (20150115131959), (20150129193114), (20150130135028), (20150209154557), (20150209170910), (20150413183026), (20150414214213), (20150416174301), (20150420141141), (20150420184106), (20150528183142), (20150616183015), (20150709050248), (20150709050249), (20150709205815), (20150713203435), (20150713233102), (20150714003725), (20150831184219), (20150831184308), (20150916210226), (20151013055333), (20151013055656), (20151013055912), (20151015125032), (20151021152929), (20151104193816), (20151106200755), (20151106200859), (20151112184326), (20151124160637), (20151124191948), (20160118194541), (20160118195554), (20160118195936), (20160118200048), (20160119170226), (20160119172718), (20160121182042), (20160121200759), (20160122170309), (20160128124954), (20160129201125), (20160204134029), (20160216155946), (20160216205443), (20160217182101), (20160217192309), (20160222194555), (20160223062206), (20160315124750), (20160315130005), (20160315191156), (20160315191222), (20160324125024), (20160324185303), (20160328170041), (20160328180402), (20160328180435), (20160328182325), (20160328194308), (20160331143020), (20160406195450), (20160530195240), (20160531180304), (20160531195330), (20160601194309), (20160601195102), (20160601204131), (20160601204634), (20160601205946), (20160609201526), (20160617205257), (20160701213025), (20160706192211), (20160728203520), (20160728203656), (20160728203808), (20160728205409), (20160728205437), (20160728205521), (20160808005056), (20160816171438), (20160906181308), (20160914211355), (20161010175203), (20161123200339), (20161123200837), (20161123200852), (20161123201050), (20161123201146), (20161125043044), (20161125044224), (20161128175640), (20161128190030), (20161128190044), (20161212060743), (20161219183348), (20161219184609), (20170111192328), (20170111192545), (20170119024854), (20170124212014), (20170126113012), (20170126191025), (20170215165453), (20170220173159), (20170304022559), (20170312234303), (20170322184155), (20170323142230), (20170323185939), (20170328200004), (20170508200254), (20170515053547), (20170516225359), (20170516225436), (20170517154512), (20170517171348), (20170529170614), (20170529203652), (20170608154240), (20170612143500), (20170613161656), (20170710171030), (20170719164006), (20170828191027), (20170830190332), (20170831195519), (20170831195651), (20170904183553), (20171011005326), (20171011005454), (20171015173646), (20171023230708), (20171122165838), (20171122170419), (20171122180430), (20171127175931), (20171128155718), (20171128163258), (20171128163320), (20171128163405), (20171128163418), (20171128163538), (20171128163558), (20171128163605), (20171128163617), (20171204120001), (20171205194413), (20171206125838), (20180116194109), (20180122131106), (20180215213420), (20180227111218), (20180312020226), (20180312020554), (20180321193041), (20180511233809), (20180511233904), (20180524141651), (20180524141735), (20180530131737), (20180620152909), (20180620173224), (20180620173305), (20180807162435), (20180813141721), (20180821190045), (20180821194140), (20180822053146), (20180827171053), (20180830160541), (20180830160811), (20180830161130), (20180830161237), (20180830162725), (20180830163857), (20180830164111), (20180830164147), (20180830165024), (20180830165216), (20180830165327), (20180830165423), (20180830165529), (20180830165643), (20180830170458), (20180830171129), (20180830183613), (20180830190850), (20180905171606), (20180917163820), (20180918193901), (20180920143025), (20180920143902), (20180920145814), (20180920150707), (20180920151603), (20180920152239), (20180920153000), (20180924192700), (20181008162821), (20181008164316), (20181008170422), (20181008224750), (20181009015655), (20181009021834), (20181009024748), (20181009030229), (20181009032342), (20181009032536), (20181009123308), (20181010191600), (20181010191802), (20181011144709), (20181018174842), (20181018175557), (20181018175959), (20181018180254), (20181023235242), (20181023235300), (20181026191449), (20181105170252), (20181113111006), (20181113112642), (20181122023045), (20181122143620), (20181126064944), (20181204044105), (20181204044712), (20181211160035), (20181212152111), (20181212160026), (20181218201820), (20181225130044), (20181226002207), (20181226002832), (20190115172100), (20190115184155), (20190115184411), (20190115220057), (20190117182923), (20190117224349), (20190118184857), (20190120233031), (20190120233055), (20190125164654), (20190128153757), (20190128153813), (20190131135517), (20190131153423), (20190206172757), (20190214124607), (20190218170510), (20190218170551), (20190218171521), (20190218173907), (20190222191044), (20190224011248), (20190224220843), (20190224221039), (20190225183737), (20190227204238), (20190315020842), (20190402014949), (20190404204708), (20190415024033), (20190415024628), (20190415040135), (20190415040440), (20190417183931), (20190422192057), (20190429201857), (20190429202113), (20190502192720), (20190507203227), (20190507203359), (20190507204028), (20190508150940), (20190509191649), (20190515195017), (20190516152044), (20190520200849), (20190528192305), (20190531143024), (20190604144643), (20190605164518), (20190607155105), (20190710092125), (20190712194614), (20190715175542), (20190718194759), (20190804221151), (20190809171917), (20190812163415), (20190906154906), (20190917174132), (20191015213951), (20191017204415), (20191125201922);

