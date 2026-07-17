/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-12.3.2-MariaDB, for osx10.17 (x86_64)
--
-- Host: localhost    Database: itrix_local
-- ------------------------------------------------------
-- Server version	12.3.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `admin_timeline`
--

DROP TABLE IF EXISTS `admin_timeline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_timeline` (
  `timeline_uid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `process` text NOT NULL,
  `job` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `staff` int(11) NOT NULL,
  `remark` varchar(1000) NOT NULL,
  PRIMARY KEY (`timeline_uid`),
  KEY `idx_timeline_job_time` (`job`,`time`),
  KEY `idx_timeline_time` (`time`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_timeline`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `admin_timeline` WRITE;
/*!40000 ALTER TABLE `admin_timeline` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_timeline` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `app_audit_log`
--

DROP TABLE IF EXISTS `app_audit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_audit_log` (
  `audit_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(80) NOT NULL,
  `entity_type` varchar(80) NOT NULL,
  `entity_id` varchar(80) NOT NULL,
  `staff_username` varchar(80) NOT NULL,
  `details` mediumtext NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`audit_id`),
  KEY `idx_audit_entity` (`entity_type`,`entity_id`),
  KEY `idx_audit_created` (`created_at`),
  KEY `idx_audit_staff_created` (`staff_username`,`created_at`),
  KEY `idx_audit_action_created` (`action`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_audit_log`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `app_audit_log` WRITE;
/*!40000 ALTER TABLE `app_audit_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_audit_log` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `app_settings`
--

DROP TABLE IF EXISTS `app_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_settings` (
  `setting_key` varchar(120) NOT NULL,
  `setting_value` text NOT NULL,
  `updated_by` varchar(80) NOT NULL DEFAULT '',
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`setting_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_settings`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `app_settings` WRITE;
/*!40000 ALTER TABLE `app_settings` DISABLE KEYS */;
INSERT INTO `app_settings` VALUES
('attendance_qr_code','2178A289','admin','2026-07-13 21:12:40'),
('attendance_qr_date','2026-07-13','admin','2026-07-13 21:12:40');
/*!40000 ALTER TABLE `app_settings` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `checking_info`
--

DROP TABLE IF EXISTS `checking_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `checking_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `screen` text NOT NULL,
  `battery` text NOT NULL,
  `wifi` text NOT NULL,
  `keyboard` text NOT NULL,
  `sound` text NOT NULL,
  `cd_drive` text NOT NULL,
  `touchpad` text NOT NULL,
  `os` text NOT NULL,
  `camera` text NOT NULL,
  `mic` text NOT NULL,
  `cpufan` text NOT NULL,
  `usb` text NOT NULL,
  `vga` text NOT NULL,
  `hdmi` text NOT NULL,
  `headphone` text NOT NULL,
  `others` text NOT NULL,
  `completed_job` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checking_info`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `checking_info` WRITE;
/*!40000 ALTER TABLE `checking_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `checking_info` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `customer_ledger_adjustments`
--

DROP TABLE IF EXISTS `customer_ledger_adjustments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_ledger_adjustments` (
  `adjustment_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `adjustment_date` date NOT NULL,
  `entry_type` enum('opening','debit','credit') NOT NULL DEFAULT 'debit',
  `amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `narration` varchar(500) NOT NULL DEFAULT '',
  `created_by` varchar(80) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`adjustment_id`),
  KEY `idx_customer_adjustments` (`customer_id`,`adjustment_date`),
  KEY `idx_ledger_adjustments_date` (`adjustment_date`,`status`),
  KEY `idx_ledger_customer_status_type` (`customer_id`,`status`,`entry_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_ledger_adjustments`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `customer_ledger_adjustments` WRITE;
/*!40000 ALTER TABLE `customer_ledger_adjustments` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_ledger_adjustments` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `job_communication_log`
--

DROP TABLE IF EXISTS `job_communication_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_communication_log` (
  `communication_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT 0,
  `communication_type` varchar(60) NOT NULL,
  `note` varchar(1000) NOT NULL DEFAULT '',
  `staff_id` int(11) NOT NULL DEFAULT 0,
  `staff_username` varchar(80) NOT NULL DEFAULT '',
  `receiver_staff_id` int(11) NOT NULL DEFAULT 0,
  `receiver_staff_name` varchar(120) NOT NULL DEFAULT '',
  `receiver_read_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`communication_id`),
  KEY `idx_comm_job_created` (`job_id`,`created_at`),
  KEY `idx_comm_customer_created` (`customer_id`,`created_at`),
  KEY `idx_comm_type_created` (`communication_type`,`created_at`),
  KEY `idx_comm_staff_created` (`staff_id`,`created_at`),
  KEY `idx_comm_receiver_created` (`receiver_staff_id`,`created_at`),
  KEY `idx_comm_receiver_unread` (`receiver_staff_id`,`receiver_read_at`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_communication_log`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `job_communication_log` WRITE;
/*!40000 ALTER TABLE `job_communication_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_communication_log` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `job_part_usage`
--

DROP TABLE IF EXISTS `job_part_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_part_usage` (
  `usage_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `source_type` enum('stock','non_stock') NOT NULL DEFAULT 'stock',
  `stock_part_order_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `part_name` varchar(180) NOT NULL DEFAULT '',
  `quantity` decimal(10,2) NOT NULL DEFAULT 1.00,
  `unit_cost` decimal(12,2) NOT NULL DEFAULT 0.00,
  `remark` varchar(1000) NOT NULL DEFAULT '',
  `used_by` varchar(80) NOT NULL DEFAULT '',
  `used_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_by` varchar(80) NOT NULL DEFAULT '',
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`usage_id`),
  KEY `idx_usage_job` (`job_id`,`status`,`used_at`),
  KEY `idx_usage_stock` (`stock_part_order_id`,`status`),
  KEY `idx_usage_part` (`part_name`),
  KEY `idx_usage_job_status` (`job_id`,`status`,`used_at`),
  KEY `idx_usage_stock_status` (`stock_part_order_id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_part_usage`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `job_part_usage` WRITE;
/*!40000 ALTER TABLE `job_part_usage` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_part_usage` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `job_photos`
--

DROP TABLE IF EXISTS `job_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `photo_key` varchar(40) NOT NULL,
  `label` varchar(80) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `original_name` varchar(255) NOT NULL,
  `mime_type` varchar(80) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_photos`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `job_photos` WRITE;
/*!40000 ALTER TABLE `job_photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_photos` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `job_work_updates`
--

DROP TABLE IF EXISTS `job_work_updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_work_updates` (
  `work_update_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `timeline_uid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `status_id` varchar(20) NOT NULL DEFAULT '',
  `material_source` enum('none','stock','non_stock') NOT NULL DEFAULT 'none',
  `stock_part_order_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `material_name` varchar(180) NOT NULL DEFAULT '',
  `material_quantity` decimal(10,2) NOT NULL DEFAULT 0.00,
  `material_remark` varchar(1000) NOT NULL DEFAULT '',
  `risk_note` varchar(1000) NOT NULL DEFAULT '',
  `customer_permission` enum('not_required','pending','approved','declined') NOT NULL DEFAULT 'not_required',
  `permission_note` varchar(500) NOT NULL DEFAULT '',
  `estimated_repair_time` varchar(120) NOT NULL DEFAULT '',
  `repair_priority` enum('normal','priority','urgent') NOT NULL DEFAULT 'normal',
  `repairability` enum('repairable','non_repairable','needs_diagnosis') NOT NULL DEFAULT 'needs_diagnosis',
  `created_by` varchar(80) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`work_update_id`),
  KEY `idx_work_job_created` (`job_id`,`created_at`),
  KEY `idx_work_timeline` (`timeline_uid`),
  KEY `idx_work_stock_part` (`stock_part_order_id`),
  KEY `idx_work_priority` (`repair_priority`,`repairability`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_work_updates`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `job_work_updates` WRITE;
/*!40000 ALTER TABLE `job_work_updates` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_work_updates` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `login_history`
--

DROP TABLE IF EXISTS `login_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `process` varchar(10) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_history`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `login_history` WRITE;
/*!40000 ALTER TABLE `login_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_history` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `outside_repair_events`
--

DROP TABLE IF EXISTS `outside_repair_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `outside_repair_events` (
  `event_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `outside_repair_id` bigint(20) unsigned NOT NULL,
  `job_id` int(11) NOT NULL,
  `event_type` varchar(50) NOT NULL,
  `note` varchar(1000) NOT NULL DEFAULT '',
  `staff_username` varchar(80) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`event_id`),
  KEY `idx_outside_events_repair` (`outside_repair_id`,`created_at`),
  KEY `idx_outside_events_job` (`job_id`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outside_repair_events`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `outside_repair_events` WRITE;
/*!40000 ALTER TABLE `outside_repair_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `outside_repair_events` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `outside_repairs`
--

DROP TABLE IF EXISTS `outside_repairs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `outside_repairs` (
  `outside_repair_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `repair_center_name` varchar(180) NOT NULL,
  `contact_person` varchar(120) NOT NULL DEFAULT '',
  `contact_phone` varchar(40) NOT NULL DEFAULT '',
  `sent_date` date NOT NULL,
  `expected_return_date` date DEFAULT NULL,
  `returned_date` date DEFAULT NULL,
  `issue_details` varchar(1000) NOT NULL DEFAULT '',
  `outside_estimate` decimal(12,2) NOT NULL DEFAULT 0.00,
  `outside_cost` decimal(12,2) NOT NULL DEFAULT 0.00,
  `status` varchar(40) NOT NULL DEFAULT 'sent',
  `priority` varchar(20) NOT NULL DEFAULT 'normal',
  `followup_note` varchar(1000) NOT NULL DEFAULT '',
  `created_by` varchar(80) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_by` varchar(80) NOT NULL DEFAULT '',
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`outside_repair_id`),
  KEY `idx_outside_job_status` (`job_id`,`status`),
  KEY `idx_outside_status_expected` (`status`,`expected_return_date`),
  KEY `idx_outside_center` (`repair_center_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outside_repairs`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `outside_repairs` WRITE;
/*!40000 ALTER TABLE `outside_repairs` DISABLE KEYS */;
/*!40000 ALTER TABLE `outside_repairs` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `part_order_events`
--

DROP TABLE IF EXISTS `part_order_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `part_order_events` (
  `event_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `part_order_id` bigint(20) unsigned NOT NULL,
  `job_id` int(11) NOT NULL DEFAULT 0,
  `event_type` varchar(50) NOT NULL,
  `note` varchar(1000) NOT NULL DEFAULT '',
  `staff_username` varchar(80) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`event_id`),
  KEY `idx_part_events_order` (`part_order_id`,`created_at`),
  KEY `idx_part_events_job` (`job_id`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_order_events`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `part_order_events` WRITE;
/*!40000 ALTER TABLE `part_order_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `part_order_events` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `part_orders`
--

DROP TABLE IF EXISTS `part_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `part_orders` (
  `part_order_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_scope` enum('job','stock') NOT NULL DEFAULT 'job',
  `job_id` int(11) NOT NULL DEFAULT 0,
  `part_name` varchar(160) NOT NULL,
  `part_details` varchar(1000) NOT NULL DEFAULT '',
  `vendor_name` varchar(160) NOT NULL DEFAULT '',
  `vendor_phone` varchar(40) NOT NULL DEFAULT '',
  `order_date` date NOT NULL,
  `expected_date` date DEFAULT NULL,
  `received_date` date DEFAULT NULL,
  `assigned_date` date DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `reorder_level` decimal(10,2) NOT NULL DEFAULT 1.00,
  `unit_cost` decimal(12,2) NOT NULL DEFAULT 0.00,
  `status` varchar(30) NOT NULL DEFAULT 'requested',
  `priority` varchar(20) NOT NULL DEFAULT 'normal',
  `remarks` varchar(1000) NOT NULL DEFAULT '',
  `created_by` varchar(80) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_by` varchar(80) NOT NULL DEFAULT '',
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`part_order_id`),
  KEY `idx_parts_job_status` (`job_id`,`status`),
  KEY `idx_parts_status_date` (`status`,`order_date`),
  KEY `idx_parts_scope_status` (`order_scope`,`status`),
  KEY `idx_parts_vendor` (`vendor_name`),
  KEY `idx_parts_scope_qty_reorder` (`order_scope`,`status`,`quantity`,`reorder_level`),
  KEY `idx_parts_job_scope_status` (`job_id`,`order_scope`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_orders`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `part_orders` WRITE;
/*!40000 ALTER TABLE `part_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `part_orders` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `staff_attendance`
--

DROP TABLE IF EXISTS `staff_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_attendance` (
  `attendance_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL,
  `attendance_date` date NOT NULL,
  `check_in` datetime DEFAULT NULL,
  `check_out` datetime DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'present',
  `hours_worked` decimal(6,2) NOT NULL DEFAULT 0.00,
  `job_id` int(11) NOT NULL DEFAULT 0,
  `piece_qty` decimal(10,2) NOT NULL DEFAULT 0.00,
  `piece_note` varchar(255) NOT NULL DEFAULT '',
  `remarks` varchar(500) NOT NULL DEFAULT '',
  `marked_by` varchar(80) NOT NULL DEFAULT '',
  `mark_ip` varchar(80) NOT NULL DEFAULT '',
  `user_agent` varchar(255) NOT NULL DEFAULT '',
  `qr_code` varchar(80) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`attendance_id`),
  UNIQUE KEY `uq_staff_attendance_day` (`staff_id`,`attendance_date`),
  KEY `idx_attendance_date_staff` (`attendance_date`,`staff_id`),
  KEY `idx_attendance_job` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_attendance`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `staff_attendance` WRITE;
/*!40000 ALTER TABLE `staff_attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_attendance` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `staff_payroll_ledger`
--

DROP TABLE IF EXISTS `staff_payroll_ledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_payroll_ledger` (
  `ledger_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL,
  `entry_date` date NOT NULL,
  `entry_type` varchar(30) NOT NULL,
  `amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `payroll_period_from` date DEFAULT NULL,
  `payroll_period_to` date DEFAULT NULL,
  `narration` varchar(500) NOT NULL DEFAULT '',
  `created_by` varchar(80) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ledger_id`),
  KEY `idx_staff_payroll_staff_date` (`staff_id`,`entry_date`),
  KEY `idx_staff_payroll_type_date` (`entry_type`,`entry_date`),
  KEY `idx_staff_payroll_period` (`payroll_period_from`,`payroll_period_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_payroll_ledger`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `staff_payroll_ledger` WRITE;
/*!40000 ALTER TABLE `staff_payroll_ledger` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_payroll_ledger` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `staff_payroll_profiles`
--

DROP TABLE IF EXISTS `staff_payroll_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_payroll_profiles` (
  `staff_id` int(11) NOT NULL,
  `pay_model` varchar(20) NOT NULL DEFAULT 'monthly',
  `rate` decimal(12,2) NOT NULL DEFAULT 0.00,
  `standard_hours` decimal(6,2) NOT NULL DEFAULT 8.00,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `updated_by` varchar(80) NOT NULL DEFAULT '',
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_payroll_profiles`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `staff_payroll_profiles` WRITE;
/*!40000 ALTER TABLE `staff_payroll_profiles` DISABLE KEYS */;
INSERT INTO `staff_payroll_profiles` VALUES
(2,'monthly',20000.00,8.00,1,'admin','2026-07-13 20:20:26');
/*!40000 ALTER TABLE `staff_payroll_profiles` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `status_updation`
--

DROP TABLE IF EXISTS `status_updation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_updation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `status` text NOT NULL,
  `remarks` text NOT NULL,
  `time_stamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_updation`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `status_updation` WRITE;
/*!40000 ALTER TABLE `status_updation` DISABLE KEYS */;
/*!40000 ALTER TABLE `status_updation` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `table_brand`
--

DROP TABLE IF EXISTS `table_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_brand` (
  `brand_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(40) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_time` datetime NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`brand_id`),
  KEY `idx_brand_name` (`brand_name`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_brand`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `table_brand` WRITE;
/*!40000 ALTER TABLE `table_brand` DISABLE KEYS */;
INSERT INTO `table_brand` VALUES
(1,'Hp',0,'2021-07-21 00:00:00',0),
(2,'Acer',0,'2021-07-21 00:00:00',0),
(3,'Lenovo',0,'2021-07-21 00:00:00',0),
(4,'Dell',0,'2021-07-21 00:00:00',0),
(5,'Toshiba',0,'2021-07-21 00:00:00',0),
(6,'Compaq',0,'2021-07-21 00:00:00',0),
(7,'Sony',0,'2021-07-21 00:00:00',0),
(8,'Asus',0,'2021-07-21 00:00:00',0),
(9,'Samsung',0,'2021-07-21 00:00:00',0),
(10,'Ibm',0,'2021-07-22 00:00:00',0),
(11,'Benq',0,'2021-07-22 00:00:00',0),
(12,'Not found',0,'2021-07-22 00:00:00',0),
(13,'N/A',0,'2021-07-22 00:00:00',0),
(14,'Apple',0,'2021-07-23 00:00:00',0),
(15,'Msi',0,'2021-07-29 00:00:00',0),
(16,'Zed',0,'2021-07-29 00:00:00',0),
(17,'I ball',0,'2021-07-29 00:00:00',0),
(18,'fujistu',0,'2021-07-29 00:00:00',0),
(19,'Pakard bell',0,'2021-07-29 00:00:00',0),
(20,'Gateway',0,'2021-07-29 00:00:00',0),
(21,'Lg',0,'2021-08-02 00:00:00',0),
(22,'HCL',0,'2021-10-07 00:00:00',0),
(23,'Viewsonic',0,'2021-11-25 00:00:00',0),
(24,'Panasonic',0,'2021-11-29 00:00:00',0),
(25,'e machine',0,'2021-12-13 00:00:00',0),
(26,'EPSON',0,'2023-11-07 00:00:00',0),
(27,'Intel',0,'2025-01-24 00:00:00',0),
(28,'Nuc',0,'2025-01-24 00:00:00',0),
(29,'Optoma',0,'2025-01-29 00:00:00',0),
(30,'Mi',0,'2025-01-29 00:00:00',0);
/*!40000 ALTER TABLE `table_brand` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `table_customer_type`
--

DROP TABLE IF EXISTS `table_customer_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_customer_type` (
  `customer_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_type_name` varchar(40) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_time` datetime NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`customer_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_customer_type`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `table_customer_type` WRITE;
/*!40000 ALTER TABLE `table_customer_type` DISABLE KEYS */;
INSERT INTO `table_customer_type` VALUES
(1,'Walk In',0,'2021-07-21 00:00:00',0),
(2,'Direct dealer',0,'2021-07-21 00:00:00',0),
(3,'Remote Dealer',0,'2021-07-21 00:00:00',0),
(4,'Freelance',0,'2021-07-23 00:00:00',0),
(5,'Apple',0,'2021-07-23 00:00:00',1);
/*!40000 ALTER TABLE `table_customer_type` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `table_customers`
--

DROP TABLE IF EXISTS `table_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_customers` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `mail_id` varchar(30) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `alternate_no` varchar(10) NOT NULL,
  `address` text NOT NULL,
  `customer_type` int(11) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `total_amount` text NOT NULL,
  `total_paid` text NOT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `idx_customers_phone` (`phone`),
  KEY `idx_customers_alternate` (`alternate_no`),
  KEY `idx_customers_name` (`customer_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_customers`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `table_customers` WRITE;
/*!40000 ALTER TABLE `table_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `table_customers` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `table_history`
--

DROP TABLE IF EXISTS `table_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_history` (
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `done_by` int(11) NOT NULL,
  `process_done` varchar(100) NOT NULL,
  `time` datetime NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_history`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `table_history` WRITE;
/*!40000 ALTER TABLE `table_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `table_history` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `table_invoice`
--

DROP TABLE IF EXISTS `table_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_invoice` (
  `invoice_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `amount` float NOT NULL,
  `date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  PRIMARY KEY (`invoice_id`),
  KEY `idx_invoice_job` (`job_id`),
  KEY `idx_invoice_customer_date` (`customer_id`,`date`),
  KEY `idx_invoice_date` (`date`),
  KEY `idx_invoice_date_id` (`date`,`invoice_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_invoice`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `table_invoice` WRITE;
/*!40000 ALTER TABLE `table_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `table_invoice` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `table_item_type`
--

DROP TABLE IF EXISTS `table_item_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_item_type` (
  `item_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_type_name` varchar(40) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_time` datetime NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`item_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_item_type`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `table_item_type` WRITE;
/*!40000 ALTER TABLE `table_item_type` DISABLE KEYS */;
INSERT INTO `table_item_type` VALUES
(1,'Laptop',0,'2021-07-21 00:00:00',0),
(2,'Projector',0,'2021-07-21 00:00:00',0),
(3,'Laptop Motherboard',0,'2021-07-21 00:00:00',0),
(4,'All In One Pc',0,'2021-07-21 00:00:00',0),
(5,'desktop mother board',0,'2021-08-31 00:00:00',0),
(6,'Mini pc',0,'2022-08-08 00:00:00',0),
(7,'Thin client',0,'2022-08-08 00:00:00',0);
/*!40000 ALTER TABLE `table_item_type` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `table_job`
--

DROP TABLE IF EXISTS `table_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_job` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT,
  `seriel_no` varchar(50) NOT NULL,
  `prbc` text NOT NULL,
  `accessories_given` varchar(250) NOT NULL,
  `model_no` varchar(50) NOT NULL,
  `symptom_type` int(11) NOT NULL,
  `dealers_customer_name` varchar(40) NOT NULL,
  `remarks` varchar(250) NOT NULL,
  `job_type` int(11) NOT NULL,
  `customer_type` int(11) NOT NULL,
  `created_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `received_tru` int(11) NOT NULL,
  `advance_amount` decimal(20,0) NOT NULL,
  `transaction_type` int(11) NOT NULL,
  `sent_sms` tinyint(1) NOT NULL,
  `delivery_status` text NOT NULL,
  `status` int(11) NOT NULL,
  `current_status` varchar(40) NOT NULL,
  `assigned_staff` int(11) DEFAULT NULL,
  `assigned_time` datetime DEFAULT NULL,
  `started_time` datetime DEFAULT NULL,
  `completed_time` datetime DEFAULT NULL,
  `invoice` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `estimate_amt` decimal(10,0) NOT NULL,
  `user_password` varchar(10) DEFAULT NULL,
  `created_staff` int(11) NOT NULL,
  `delivered_staff` int(11) NOT NULL,
  `delivered_time` datetime DEFAULT NULL,
  `last_updated_date` date DEFAULT NULL,
  `customer_call` varchar(1) NOT NULL DEFAULT 'N',
  `call_time` bigint(20) NOT NULL,
  `call_staff` int(11) NOT NULL,
  PRIMARY KEY (`job_id`),
  KEY `idx_job_status_staff` (`status`,`current_status`,`assigned_staff`),
  KEY `idx_job_customer_created` (`customer_id`,`created_time`),
  KEY `idx_job_status_created` (`status`,`current_status`,`created_time`),
  KEY `idx_job_assigned_status_time` (`assigned_staff`,`status`,`current_status`,`assigned_time`),
  KEY `idx_job_serial` (`seriel_no`),
  KEY `idx_job_model` (`model_no`),
  KEY `idx_job_created_id` (`created_time`,`job_id`),
  KEY `idx_job_delivered` (`delivered_time`,`current_status`),
  KEY `idx_job_invoice_status` (`invoice`,`current_status`,`status`)
) ENGINE=MyISAM AUTO_INCREMENT=34000 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_job`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `table_job` WRITE;
/*!40000 ALTER TABLE `table_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `table_job` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `table_job_status`
--

DROP TABLE IF EXISTS `table_job_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_job_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(100) NOT NULL,
  `is_active` varchar(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_job_status`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `table_job_status` WRITE;
/*!40000 ALTER TABLE `table_job_status` DISABLE KEYS */;
INSERT INTO `table_job_status` VALUES
(1,'New Job','Y'),
(2,'Assigned','Y'),
(3,'Under Process','Y'),
(4,'Part Wait','Y'),
(5,'Waiting For Approval','Y'),
(6,'Approved','Y'),
(7,'Under Observation','Y'),
(8,'Completed','Y'),
(9,'Return','Y'),
(10,'Delivered','Y'),
(11,'Reassigned','Y'),
(12,'Not Approved','Y'),
(13,'Add Invoice','Y'),
(14,'Noticed','Y');
/*!40000 ALTER TABLE `table_job_status` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `table_job_type`
--

DROP TABLE IF EXISTS `table_job_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_job_type` (
  `job_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_type_name` varchar(40) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_time` datetime NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`job_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_job_type`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `table_job_type` WRITE;
/*!40000 ALTER TABLE `table_job_type` DISABLE KEYS */;
INSERT INTO `table_job_type` VALUES
(1,'Repeat',0,'2021-07-21 00:00:00',0),
(2,'New Job',0,'2021-07-21 00:00:00',0);
/*!40000 ALTER TABLE `table_job_type` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `table_models`
--

DROP TABLE IF EXISTS `table_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_models` (
  `model_id` int(11) NOT NULL AUTO_INCREMENT,
  `model_name` text NOT NULL,
  `created` datetime NOT NULL,
  `brand` int(11) NOT NULL,
  `item_type` int(11) NOT NULL,
  PRIMARY KEY (`model_id`),
  KEY `idx_models_name` (`model_name`(100)),
  KEY `idx_models_brand_type` (`brand`,`item_type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_models`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `table_models` WRITE;
/*!40000 ALTER TABLE `table_models` DISABLE KEYS */;
/*!40000 ALTER TABLE `table_models` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `table_payment_method`
--

DROP TABLE IF EXISTS `table_payment_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_payment_method` (
  `payment_method_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_method_name` varchar(40) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_time` datetime NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`payment_method_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_payment_method`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `table_payment_method` WRITE;
/*!40000 ALTER TABLE `table_payment_method` DISABLE KEYS */;
INSERT INTO `table_payment_method` VALUES
(1,'Cash',0,'2021-07-21 00:00:00',0),
(2,'Gpay',0,'2021-07-21 00:00:00',0),
(3,'Bank Trasfer',0,'2021-07-21 00:00:00',0),
(4,'Refund',0,'2021-10-26 00:00:00',0);
/*!40000 ALTER TABLE `table_payment_method` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `table_payment_type`
--

DROP TABLE IF EXISTS `table_payment_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_payment_type` (
  `payment_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_type_name` varchar(40) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_time` datetime NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`payment_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_payment_type`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `table_payment_type` WRITE;
/*!40000 ALTER TABLE `table_payment_type` DISABLE KEYS */;
INSERT INTO `table_payment_type` VALUES
(1,'Advance',0,'2021-07-21 00:00:00',0),
(2,'Regular',0,'2021-07-21 00:00:00',0);
/*!40000 ALTER TABLE `table_payment_type` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `table_purchase_item`
--

DROP TABLE IF EXISTS `table_purchase_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_purchase_item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_no` varchar(40) NOT NULL,
  `vendor` varchar(40) NOT NULL,
  `item` varchar(40) NOT NULL,
  `quantity` int(11) NOT NULL,
  `purchase_date` varchar(10) NOT NULL,
  `customer_phone_no` varchar(10) NOT NULL,
  `customer_name` varchar(40) NOT NULL,
  `warranty_left` varchar(40) NOT NULL,
  `defects` varchar(100) NOT NULL,
  `send_tru` varchar(40) NOT NULL,
  `docket_no` varchar(40) NOT NULL,
  `date` varchar(10) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_purchase_item`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `table_purchase_item` WRITE;
/*!40000 ALTER TABLE `table_purchase_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `table_purchase_item` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `table_receipt`
--

DROP TABLE IF EXISTS `table_receipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_receipt` (
  `receipt_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `amount` varchar(100) NOT NULL,
  `date_created` date NOT NULL,
  `payment_type` int(11) NOT NULL,
  `payment_method` int(11) NOT NULL,
  `received_staff` int(11) NOT NULL DEFAULT 0,
  `receipt_job_id` int(11) NOT NULL DEFAULT 0,
  `narration` text NOT NULL,
  PRIMARY KEY (`receipt_id`),
  KEY `idx_receipt_customer_date` (`customer_id`,`date_created`),
  KEY `idx_receipt_date` (`date_created`),
  KEY `idx_receipt_date_id` (`date_created`,`receipt_id`),
  KEY `idx_receipt_job_date` (`receipt_job_id`,`date_created`),
  KEY `idx_receipt_staff_date` (`received_staff`,`date_created`),
  KEY `idx_receipt_type_date` (`payment_type`,`date_created`),
  KEY `idx_receipt_method_date` (`payment_method`,`date_created`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_receipt`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `table_receipt` WRITE;
/*!40000 ALTER TABLE `table_receipt` DISABLE KEYS */;
/*!40000 ALTER TABLE `table_receipt` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `table_receipt_method`
--

DROP TABLE IF EXISTS `table_receipt_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_receipt_method` (
  `receipt_method_id` int(11) NOT NULL AUTO_INCREMENT,
  `receipt_method_name` varchar(40) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_time` datetime NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`receipt_method_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_receipt_method`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `table_receipt_method` WRITE;
/*!40000 ALTER TABLE `table_receipt_method` DISABLE KEYS */;
INSERT INTO `table_receipt_method` VALUES
(1,'Type1',0,'2021-07-19 00:00:00',0);
/*!40000 ALTER TABLE `table_receipt_method` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `table_receipt_type`
--

DROP TABLE IF EXISTS `table_receipt_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_receipt_type` (
  `receipt_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `receipt_type_name` varchar(40) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_time` datetime NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`receipt_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_receipt_type`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `table_receipt_type` WRITE;
/*!40000 ALTER TABLE `table_receipt_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `table_receipt_type` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `table_received_tru`
--

DROP TABLE IF EXISTS `table_received_tru`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_received_tru` (
  `received_tru_id` int(11) NOT NULL AUTO_INCREMENT,
  `received_tru_name` varchar(40) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_time` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`received_tru_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_received_tru`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `table_received_tru` WRITE;
/*!40000 ALTER TABLE `table_received_tru` DISABLE KEYS */;
INSERT INTO `table_received_tru` VALUES
(1,'By Hand',0,2021,0),
(2,'By Auto',0,2021,0),
(3,'By Buss',0,2021,0),
(4,'By Courier',0,2021,0);
/*!40000 ALTER TABLE `table_received_tru` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `table_role`
--

DROP TABLE IF EXISTS `table_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_role` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_role`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `table_role` WRITE;
/*!40000 ALTER TABLE `table_role` DISABLE KEYS */;
INSERT INTO `table_role` VALUES
(2,'front_office_staff'),
(3,'staff'),
(1,'admin');
/*!40000 ALTER TABLE `table_role` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `table_staffs`
--

DROP TABLE IF EXISTS `table_staffs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_staffs` (
  `staff_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_name` varchar(40) NOT NULL,
  `phone_no` varchar(10) NOT NULL,
  `role` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `jobs` varchar(100) DEFAULT NULL,
  `history` text DEFAULT NULL,
  `total_jobs` int(11) DEFAULT NULL,
  `total_completed` int(11) DEFAULT NULL,
  `deleted` int(11) NOT NULL,
  PRIMARY KEY (`staff_id`),
  KEY `idx_staffs_phone_status` (`phone_no`,`deleted`,`status`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_staffs`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `table_staffs` WRITE;
/*!40000 ALTER TABLE `table_staffs` DISABLE KEYS */;
INSERT INTO `table_staffs` VALUES
(1,'Sharath','9895554039',2,4,0,NULL,NULL,NULL,NULL,0),
(2,'Jithin','7902274719',4,5,0,NULL,NULL,NULL,NULL,0),
(4,'Shinil','9633956605',2,7,0,NULL,NULL,NULL,NULL,0),
(5,'shibilv','9526134134',2,6,0,NULL,NULL,NULL,NULL,0),
(6,'Pavan lal','9633858953',2,9,0,NULL,NULL,NULL,NULL,0),
(7,'workshop','9207134134',2,10,0,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `table_staffs` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `table_symptom_type`
--

DROP TABLE IF EXISTS `table_symptom_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_symptom_type` (
  `symptom_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `symptom_type_name` varchar(40) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_time` datetime NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`symptom_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_symptom_type`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `table_symptom_type` WRITE;
/*!40000 ALTER TABLE `table_symptom_type` DISABLE KEYS */;
INSERT INTO `table_symptom_type` VALUES
(1,'Not charging',0,'2021-07-21 00:00:00',0),
(2,'Not working',0,'2021-07-21 00:00:00',0),
(3,'No display',0,'2021-07-21 00:00:00',0),
(4,'Sometimes Working',0,'2021-07-21 00:00:00',0),
(5,'Auto Off',0,'2021-07-21 00:00:00',0),
(6,'Over Heating',0,'2021-07-21 00:00:00',0),
(7,'No Backlight',0,'2021-07-21 00:00:00',0),
(8,'Adapter off',0,'2021-07-21 00:00:00',0),
(9,'o.s reinstall',0,'2021-07-22 00:00:00',0),
(10,'driver Update',0,'2021-07-22 00:00:00',0),
(11,'no sound',0,'2021-07-22 00:00:00',0),
(12,'Keyboard on/off issue',0,'2021-07-28 00:00:00',0),
(13,'White Display',0,'2021-07-28 00:00:00',0),
(14,'K/B change',0,'2021-07-28 00:00:00',0),
(15,'1 beep error',0,'2021-07-28 00:00:00',0),
(16,'2 beep error',0,'2021-07-28 00:00:00',0),
(17,'3 beep error',0,'2021-07-28 00:00:00',0),
(18,'4 beep error',0,'2021-07-28 00:00:00',0),
(19,'5 beep error',0,'2021-07-28 00:00:00',0),
(20,'6 beep error',0,'2021-07-28 00:00:00',0),
(21,'7 beep error',0,'2021-07-28 00:00:00',0),
(22,'8 beep error',0,'2021-07-28 00:00:00',0),
(23,'Unable to install o.S',0,'2021-07-29 00:00:00',0),
(24,'Display change',0,'2021-08-06 00:00:00',0),
(25,'Hdd change',0,'2021-08-06 00:00:00',0),
(26,'Battery change',0,'2021-08-06 00:00:00',0),
(27,'Body rework',0,'2021-08-06 00:00:00',0),
(28,'Cover replace',0,'2021-08-06 00:00:00',0),
(29,'usb port broken',0,'2021-08-14 00:00:00',0),
(30,'usb not working',0,'2021-08-14 00:00:00',0),
(31,'mother board change',0,'2021-08-26 00:00:00',0),
(32,'hard disk not dectecting',0,'2021-08-26 00:00:00',0),
(33,'mic not working',0,'2021-09-03 00:00:00',0),
(34,'camera not working',0,'2021-10-28 00:00:00',0),
(35,'fan change',0,'2021-11-18 00:00:00',0),
(36,'Touchpad not working',0,'2021-11-19 00:00:00',0),
(37,'Keyboard warrenty',0,'2021-11-19 00:00:00',0),
(38,'Screen warrenty',0,'2021-11-19 00:00:00',0),
(39,'Other',0,'2021-11-19 00:00:00',0),
(40,'cpu fan issue',0,'2021-12-13 00:00:00',0),
(41,'some times working',0,'2021-12-13 00:00:00',0),
(42,'broken case',0,'2021-12-13 00:00:00',0),
(43,'camera not working',0,'2021-12-13 00:00:00',0),
(44,'windows activation issue',0,'2021-12-13 00:00:00',0),
(45,'anti visrus install',0,'2021-12-13 00:00:00',0),
(46,'Blue screen ',0,'2022-08-08 00:00:00',0),
(47,'Battery not dectecting',0,'2022-08-08 00:00:00',0),
(48,'Os Stuck',0,'2022-08-08 00:00:00',0),
(49,'Speaker change ',0,'2022-08-08 00:00:00',0),
(50,'Time and date error',0,'2022-08-08 00:00:00',0),
(51,'System stuck',0,'2022-09-20 00:00:00',0),
(52,'System slow',0,'2022-09-20 00:00:00',0),
(53,'bios issue',0,'2023-11-01 00:00:00',0),
(54,'memory upgrade',0,'2023-11-01 00:00:00',0),
(55,'DC jack broken',0,'2023-11-22 00:00:00',0),
(56,'ome time on',0,'2026-07-04 11:47:58',0),
(57,'new y ptom',0,'2026-07-15 10:44:31',0);
/*!40000 ALTER TABLE `table_symptom_type` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `table_users`
--

DROP TABLE IF EXISTS `table_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(40) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `login` longtext NOT NULL,
  `logout` longtext NOT NULL,
  `role_id` int(11) NOT NULL,
  `access_level` varchar(30) NOT NULL DEFAULT '',
  `permissions` longtext NOT NULL,
  `process` varchar(40) NOT NULL,
  `process_operation` varchar(40) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `role_id` (`role_id`),
  KEY `idx_users_username_status` (`user_name`,`status`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_users`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `table_users` WRITE;
/*!40000 ALTER TABLE `table_users` DISABLE KEYS */;
INSERT INTO `table_users` VALUES
(1,'admin','0ff5dc4117bb379032c49376d3355f6b','2026-07-01 15:11:28','0','0',1,'super-admin','[\"permission_set\",\"customer_modify\",\"staff_modify\",\"receipt_modify\",\"invoice_modify\",\"job_details_edit\",\"job_status_edit\",\"invoice_create\",\"receipt_create\",\"settings_fields\"]','2','2',0),
(4,'9895554039','81dc9bdb52d04dc20036dbd8313ed055','2021-10-20 14:45:44','','',2,'','','','',0),
(5,'7902274719','81dc9bdb52d04dc20036dbd8313ed055','2026-07-15 13:42:15','','',4,'technician','[\"job_details_edit\",\"job_status_edit\"]','','',0),
(6,'9526134134','21232f297a57a5a743894a0e4a801fc3','2026-07-01 15:21:10','','',2,'admin','[\"customer_modify\",\"staff_modify\",\"receipt_modify\",\"invoice_modify\",\"job_details_edit\",\"job_status_edit\",\"invoice_create\",\"receipt_create\",\"settings_fields\"]','','',0),
(7,'9633956605','81dc9bdb52d04dc20036dbd8313ed055','2021-07-21 05:35:04','','',2,'','','','',0),
(8,'9526134134','21232f297a57a5a743894a0e4a801fc3','2026-07-06 10:53:05','','',2,'','','','',1),
(9,'9633858953','827ccb0eea8a706c4c34a16891f84e7b','2024-01-22 05:06:52','','',2,'','','','',1),
(10,'9207134134','81dc9bdb52d04dc20036dbd8313ed055','2025-07-21 11:31:56','','',2,'','','','',0);
/*!40000 ALTER TABLE `table_users` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `tbl_invoce_details`
--

DROP TABLE IF EXISTS `tbl_invoce_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_invoce_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `details` varchar(500) NOT NULL,
  `amount` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_invoice_details_invoice_status` (`invoice_id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_invoce_details`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `tbl_invoce_details` WRITE;
/*!40000 ALTER TABLE `tbl_invoce_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_invoce_details` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `timeline_photos`
--

DROP TABLE IF EXISTS `timeline_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `timeline_photos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `timeline_uid` bigint(20) unsigned NOT NULL,
  `job_id` int(11) NOT NULL,
  `category` varchar(80) NOT NULL DEFAULT '',
  `label` varchar(100) NOT NULL DEFAULT '',
  `file_path` varchar(255) NOT NULL,
  `original_name` varchar(255) NOT NULL DEFAULT '',
  `mime_type` varchar(80) NOT NULL DEFAULT '',
  `uploaded_by` varchar(80) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_timeline_photos_timeline` (`timeline_uid`),
  KEY `idx_timeline_photos_job` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timeline_photos`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `timeline_photos` WRITE;
/*!40000 ALTER TABLE `timeline_photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `timeline_photos` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `transaction_history`
--

DROP TABLE IF EXISTS `transaction_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `amount` text NOT NULL,
  `type` varchar(1) NOT NULL,
  `element_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `payment_type` int(11) NOT NULL,
  `payment_method` int(11) NOT NULL,
  `job` int(11) NOT NULL,
  `narration` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_history`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `transaction_history` WRITE;
/*!40000 ALTER TABLE `transaction_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_history` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `user_timeline`
--

DROP TABLE IF EXISTS `user_timeline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_timeline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff` int(11) NOT NULL,
  `process` text NOT NULL,
  `job` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_timeline`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `user_timeline` WRITE;
/*!40000 ALTER TABLE `user_timeline` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_timeline` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(80) NOT NULL,
  `fname` varchar(60) NOT NULL,
  `lname` varchar(60) NOT NULL,
  `email` varchar(80) NOT NULL,
  `age` int(11) NOT NULL,
  `salary` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Dumping routines for database 'itrix_local'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-07-17  9:24:54
