CREATE DATABASE  IF NOT EXISTS `scouting_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;
USE `scouting_db`;
-- MySQL dump 10.13  Distrib 8.0.14, for Win64 (x86_64)
--
-- Host: localhost    Database: scouting_db
-- ------------------------------------------------------
-- Server version	8.0.14

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `best_bot_vw`
--

DROP TABLE IF EXISTS `best_bot_vw`;
/*!50001 DROP VIEW IF EXISTS `best_bot_vw`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `best_bot_vw` AS SELECT 
 1 AS `team_number`,
 1 AS `avg_low_auto`,
 1 AS `avg_low_tele`,
 1 AS `avg_high_auto`,
 1 AS `avg_high_tele`,
 1 AS `pcnt_lvl_2_hangs`,
 1 AS `pcnt_lvl_3_hangs`,
 1 AS `pcnt_lvl_4_hangs`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `best_hanger_bot`
--

DROP TABLE IF EXISTS `best_hanger_bot`;
/*!50001 DROP VIEW IF EXISTS `best_hanger_bot`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `best_hanger_bot` AS SELECT 
 1 AS `team_number`,
 1 AS `pcnt_lvl_2_hangs`,
 1 AS `pcnt_lvl_3_hangs`,
 1 AS `pcnt_lvl_4_hangs`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `best_high_goal_bots_vw`
--

DROP TABLE IF EXISTS `best_high_goal_bots_vw`;
/*!50001 DROP VIEW IF EXISTS `best_high_goal_bots_vw`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `best_high_goal_bots_vw` AS SELECT 
 1 AS `team_number`,
 1 AS `avg_high_auto`,
 1 AS `avg_high_tele`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `best_low_goal_bot`
--

DROP TABLE IF EXISTS `best_low_goal_bot`;
/*!50001 DROP VIEW IF EXISTS `best_low_goal_bot`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `best_low_goal_bot` AS SELECT 
 1 AS `team_number`,
 1 AS `avg_low_auto`,
 1 AS `avg_low_tele`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `match_results`
--

DROP TABLE IF EXISTS `match_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `match_results` (
  `result_oid` int(11) NOT NULL AUTO_INCREMENT,
  `match_number` int(11) DEFAULT NULL,
  `team_number` int(11) DEFAULT NULL,
  `alliance_station` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `auto_low` int(11) DEFAULT NULL,
  `auto_high` int(11) DEFAULT NULL,
  `tele_op_low` int(11) DEFAULT NULL,
  `tele_op_high` int(11) DEFAULT NULL,
  `auto_line` tinyint(1) DEFAULT NULL,
  `hang_1` tinyint(1) DEFAULT NULL,
  `hang_2` tinyint(1) DEFAULT NULL,
  `hang_3` tinyint(1) DEFAULT NULL,
  `hang_4` tinyint(1) DEFAULT NULL,
  `played_defence` tinyint(1) DEFAULT NULL,
  `won_match` tinyint(1) DEFAULT '0',
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `comp_loc` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`result_oid`),
  UNIQUE KEY `match_result_index` (`match_number`,`team_number`,`comp_loc`)
) ENGINE=InnoDB AUTO_INCREMENT=1517 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `match_score_vw`
--

DROP TABLE IF EXISTS `match_score_vw`;
/*!50001 DROP VIEW IF EXISTS `match_score_vw`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `match_score_vw` AS SELECT 
 1 AS `match_number`,
 1 AS `team_number`,
 1 AS `auto_points`,
 1 AS `tele_points`,
 1 AS `end_game_points`,
 1 AS `total_points`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `misc_stats`
--

DROP TABLE IF EXISTS `misc_stats`;
/*!50001 DROP VIEW IF EXISTS `misc_stats`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `misc_stats` AS SELECT 
 1 AS `team_number`,
 1 AS `std_auto_low`,
 1 AS `std_auto_high`,
 1 AS `std_tele_low`,
 1 AS `std_tele_high`,
 1 AS `std_hang_1`,
 1 AS `std_hang_2`,
 1 AS `std_hang_3`,
 1 AS `std_hang_4`,
 1 AS `std_auto`,
 1 AS `std_tele`,
 1 AS `std_end_game`,
 1 AS `std_total_points`,
 1 AS `var_total_points`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `money_ball_vw`
--

DROP TABLE IF EXISTS `money_ball_vw`;
/*!50001 DROP VIEW IF EXISTS `money_ball_vw`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `money_ball_vw` AS SELECT 
 1 AS `team_number`,
 1 AS `avg_auto_score`,
 1 AS `std_auto`,
 1 AS `avg_tele_score`,
 1 AS `std_tele`,
 1 AS `avg_hang_4_pts`,
 1 AS `avg_hang_3_pts`,
 1 AS `avg_hang_2_pts`,
 1 AS `avg_end_game`,
 1 AS `std_end_game`,
 1 AS `avg_total_points`,
 1 AS `std_total_points`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `server_settings_table`
--

DROP TABLE IF EXISTS `server_settings_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `server_settings_table` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `blue_alliance_comp_key` varchar(45) DEFAULT NULL,
  `scouting_app_comp_key` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `oid_UNIQUE` (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `specific_comp_match_results_vw`
--

DROP TABLE IF EXISTS `specific_comp_match_results_vw`;
/*!50001 DROP VIEW IF EXISTS `specific_comp_match_results_vw`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `specific_comp_match_results_vw` AS SELECT 
 1 AS `result_oid`,
 1 AS `match_number`,
 1 AS `team_number`,
 1 AS `alliance_station`,
 1 AS `auto_low`,
 1 AS `auto_high`,
 1 AS `tele_op_low`,
 1 AS `tele_op_high`,
 1 AS `auto_line`,
 1 AS `hang_1`,
 1 AS `hang_2`,
 1 AS `hang_3`,
 1 AS `hang_4`,
 1 AS `played_defence`,
 1 AS `won_match`,
 1 AS `notes`,
 1 AS `comp_loc`,
 1 AS `oid`,
 1 AS `blue_alliance_comp_key`,
 1 AS `scouting_app_comp_key`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'scouting_db'
--
/*!50003 DROP PROCEDURE IF EXISTS `add_result` */;
ALTER DATABASE `scouting_db` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_result`(
IN match_num INT,
IN team_num INT,
IN alliance_sation VARCHAR(45),
in auto_low INT,
in auto_high int, 
in tele_low int, 
in tele_high int, 
in auto_line boolean,
in hang_1 boolean,
in hang_2 boolean,
in hang_3 boolean,
in hang_4 boolean,
in defence boolean,
in won_match boolean,
in notes TEXT, 
in comp_loc varchar(45)
)
BEGIN
	
	INSERT INTO `scouting_db`.`match_results`
	(`match_number`,
	`team_number`,
	`alliance_station`,
	`auto_low`,
	`auto_high`,
	`tele_op_low`,
	`tele_op_high`,
	`auto_line`,
	`hang_1`,
	`hang_2`,
	`hang_3`,
	`hang_4`,
	`played_defence`,
    `won_match`,
	`notes`,
	`comp_loc`)
	VALUES
	(match_num,
	team_num,
	alliance_sation,
	auto_low,
	auto_high,
	tele_low,
	tele_high,
	auto_line,
	hang_1,
	hang_2,
	hang_3,
	hang_4,
	defence,
    won_match,
	notes,
	comp_loc) ON DUPLICATE KEY UPDATE 
    auto_low = auto_low,
    auto_high = auto_high,
    tele_op_low = tele_low,
    tele_op_high = tele_high,
    auto_line = auto_line,
	hang_1 = hang_1,
	hang_2 = hang_2,
	hang_3 = hang_3,
	hang_4 = hang_4,
	played_defence = defence,
    won_match = won_match, 
	notes = notes;
    SELECT match_num AS 'matchNum'; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `scouting_db` CHARACTER SET utf8mb4 COLLATE utf8mb4_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `calc_percentiles` */;
ALTER DATABASE `scouting_db` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `calc_percentiles`()
BEGIN
WITH t AS (
    SELECT
        team_number,
        AVG(auto_low) auto_low,
        AVG(auto_high) auto_high,
        AVG(tele_op_low) tele_op_low,
        AVG(tele_op_high) tele_op_high,
        AVG(hang_1) hang_1, 
        AVG(hang_2) hang_2,
        AVG(hang_3) hang_3,
        AVG(hang_4) hang_4,
        AVG(played_defence) played_defence,
        AVG(won_match) won_match
    FROM
        match_results 
    GROUP BY
        team_number
)
SELECT
    team_number,
    ROUND(
       PERCENT_RANK() OVER (
          ORDER BY auto_low
       )
    ,2)*100 "Auto Low Goal Score",
    ROUND(
       PERCENT_RANK() OVER (
          ORDER BY auto_high
       )
    ,2)*100 "Auto High Goal Score",
    ROUND(
       PERCENT_RANK() OVER (
          ORDER BY tele_op_low
       )
    ,2)*100 "Low Goal Score",
    ROUND(
       PERCENT_RANK() OVER (
          ORDER BY tele_op_high
       )
    ,2)*100 "High Goal Score",
    ROUND(
       PERCENT_RANK() OVER (
          ORDER BY hang_1
       )
    ,2)*100 "Hang Level 3",
    ROUND(
       PERCENT_RANK() OVER (
          ORDER BY hang_2
       )
    ,2)*100 "Hang Level 4",
    ROUND(
       PERCENT_RANK() OVER (
          ORDER BY hang_3
       )
    ,2)*100 "Hang Level 1",
    ROUND(
       PERCENT_RANK() OVER (
          ORDER BY hang_4
       )
    ,2)*100 "Hang Level 2",
    ROUND(
       PERCENT_RANK() OVER (
          ORDER BY played_defence
       )
    ,2)*100 "Defence",
    ROUND(
       PERCENT_RANK() OVER (
          ORDER BY won_match
       )
    ,2)*100 'Win'
FROM
    t; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `scouting_db` CHARACTER SET utf8mb4 COLLATE utf8mb4_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `get_comp_avgs` */;
ALTER DATABASE `scouting_db` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_comp_avgs`(IN comp_loc varchar(45))
BEGIN
	IF comp_loc = null
 THEN
	SELECT 
	AVG(auto_low), 
	AVG(auto_high), 
	AVG(tele_op_low), 
	AVG(tele_op_high),
	AVG(hang_1),
	AVG(hang_2),
	AVG(hang_3),
	AVG(hang_4)
	from match_results; 
ELSE 
	SELECT 
	AVG(auto_low), 
	AVG(auto_high), 
	AVG(tele_op_low), 
	AVG(tele_op_high),
	AVG(hang_1),
	AVG(hang_2),
	AVG(hang_3),
	AVG(hang_4)
	from match_results WHERE comp_loc=comp_loc;
 END IF; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `scouting_db` CHARACTER SET utf8mb4 COLLATE utf8mb4_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `get_comp_totals` */;
ALTER DATABASE `scouting_db` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_comp_totals`(IN comp_loc varchar(45))
BEGIN
 IF comp_loc = null
 THEN
	SELECT 
	SUM(auto_low), 
	SUM(auto_high), 
	SUM(tele_op_low), 
	SUM(tele_op_high),
	SUM(hang_1),
	SUM(hang_2),
	SUM(hang_3),
	SUM(hang_4)
	from match_results; 
ELSE 
	SELECT 
	SUM(auto_low), 
	SUM(auto_high), 
	SUM(tele_op_low), 
	SUM(tele_op_high),
	SUM(hang_1),
	SUM(hang_2),
	SUM(hang_3),
	SUM(hang_4)
	from match_results WHERE comp_loc=comp_loc;
 END IF; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `scouting_db` CHARACTER SET utf8mb4 COLLATE utf8mb4_bin ;
/*!50003 DROP PROCEDURE IF EXISTS `get_team_results` */;
ALTER DATABASE `scouting_db` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_team_results`(IN team_num int)
BEGIN
	select AVG(auto_low), 
    AVG(auto_high), 
    AVG(tele_op_low), 
    AVG(tele_op_high), 
    avg (auto_line)*100, 
    avg(hang_1)*100, 
    avg (hang_2)*100 , 
    avg (hang_3)*100 , 
    avg(hang_4)*100 , 
    avg (played_defence)*100 ,
    avg (won_match)*100
    FROM match_results where team_number=team_num; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `scouting_db` CHARACTER SET utf8mb4 COLLATE utf8mb4_bin ;

--
-- Final view structure for view `best_bot_vw`
--

/*!50001 DROP VIEW IF EXISTS `best_bot_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `best_bot_vw` AS select `specific_comp_match_results_vw`.`team_number` AS `team_number`,avg(`specific_comp_match_results_vw`.`auto_low`) AS `avg_low_auto`,avg(`specific_comp_match_results_vw`.`tele_op_low`) AS `avg_low_tele`,avg(`specific_comp_match_results_vw`.`auto_high`) AS `avg_high_auto`,avg(`specific_comp_match_results_vw`.`tele_op_high`) AS `avg_high_tele`,(avg(`specific_comp_match_results_vw`.`hang_2`) * 100) AS `pcnt_lvl_2_hangs`,(avg(`specific_comp_match_results_vw`.`hang_3`) * 100) AS `pcnt_lvl_3_hangs`,(avg(`specific_comp_match_results_vw`.`hang_4`) * 100) AS `pcnt_lvl_4_hangs` from `specific_comp_match_results_vw` group by `specific_comp_match_results_vw`.`team_number` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `best_hanger_bot`
--

/*!50001 DROP VIEW IF EXISTS `best_hanger_bot`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `best_hanger_bot` AS select distinct `specific_comp_match_results_vw`.`team_number` AS `team_number`,(avg(`specific_comp_match_results_vw`.`hang_2`) OVER (PARTITION BY `specific_comp_match_results_vw`.`team_number` )  * 100) AS `pcnt_lvl_2_hangs`,(avg(`specific_comp_match_results_vw`.`hang_3`) OVER (PARTITION BY `specific_comp_match_results_vw`.`team_number` )  * 100) AS `pcnt_lvl_3_hangs`,(avg(`specific_comp_match_results_vw`.`hang_4`) OVER (PARTITION BY `specific_comp_match_results_vw`.`team_number` )  * 100) AS `pcnt_lvl_4_hangs` from `specific_comp_match_results_vw` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `best_high_goal_bots_vw`
--

/*!50001 DROP VIEW IF EXISTS `best_high_goal_bots_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `best_high_goal_bots_vw` AS select distinct `specific_comp_match_results_vw`.`team_number` AS `team_number`,avg(`specific_comp_match_results_vw`.`auto_high`) OVER (PARTITION BY `specific_comp_match_results_vw`.`team_number` )  AS `avg_high_auto`,avg(`specific_comp_match_results_vw`.`tele_op_high`) OVER (PARTITION BY `specific_comp_match_results_vw`.`team_number` )  AS `avg_high_tele` from `specific_comp_match_results_vw` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `best_low_goal_bot`
--

/*!50001 DROP VIEW IF EXISTS `best_low_goal_bot`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `best_low_goal_bot` AS select distinct `specific_comp_match_results_vw`.`team_number` AS `team_number`,avg(`specific_comp_match_results_vw`.`auto_low`) OVER (PARTITION BY `specific_comp_match_results_vw`.`team_number` )  AS `avg_low_auto`,avg(`specific_comp_match_results_vw`.`tele_op_low`) OVER (PARTITION BY `specific_comp_match_results_vw`.`team_number` )  AS `avg_low_tele` from `specific_comp_match_results_vw` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `match_score_vw`
--

/*!50001 DROP VIEW IF EXISTS `match_score_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `match_score_vw` AS select `specific_comp_match_results_vw`.`match_number` AS `match_number`,`specific_comp_match_results_vw`.`team_number` AS `team_number`,((`specific_comp_match_results_vw`.`auto_low` * 2) + (`specific_comp_match_results_vw`.`auto_high` * 4)) AS `auto_points`,(`specific_comp_match_results_vw`.`tele_op_low` + (`specific_comp_match_results_vw`.`tele_op_high` * 2)) AS `tele_points`,greatest(`specific_comp_match_results_vw`.`hang_1`,(`specific_comp_match_results_vw`.`hang_2` * 6),(`specific_comp_match_results_vw`.`hang_3` * 10),(`specific_comp_match_results_vw`.`hang_4` * 15)) AS `end_game_points`,(((`specific_comp_match_results_vw`.`auto_low` * 2) + (`specific_comp_match_results_vw`.`auto_high` * 4)) + ((`specific_comp_match_results_vw`.`tele_op_low` + (`specific_comp_match_results_vw`.`tele_op_high` * 2)) + greatest(`specific_comp_match_results_vw`.`hang_1`,(`specific_comp_match_results_vw`.`hang_2` * 6),(`specific_comp_match_results_vw`.`hang_3` * 10),(`specific_comp_match_results_vw`.`hang_4` * 15)))) AS `total_points` from `specific_comp_match_results_vw` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `misc_stats`
--

/*!50001 DROP VIEW IF EXISTS `misc_stats`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `misc_stats` AS select `specific_comp_match_results_vw`.`team_number` AS `team_number`,std((`specific_comp_match_results_vw`.`auto_low` * 2)) AS `std_auto_low`,std((`specific_comp_match_results_vw`.`auto_high` * 4)) AS `std_auto_high`,std(`specific_comp_match_results_vw`.`tele_op_low`) AS `std_tele_low`,std((`specific_comp_match_results_vw`.`tele_op_high` * 2)) AS `std_tele_high`,std((`specific_comp_match_results_vw`.`hang_1` * 1)) AS `std_hang_1`,std((`specific_comp_match_results_vw`.`hang_2` * 6)) AS `std_hang_2`,std((`specific_comp_match_results_vw`.`hang_3` * 10)) AS `std_hang_3`,std((`specific_comp_match_results_vw`.`hang_4` * 15)) AS `std_hang_4`,std(`match_score_vw`.`auto_points`) AS `std_auto`,std(`match_score_vw`.`tele_points`) AS `std_tele`,std(`match_score_vw`.`end_game_points`) AS `std_end_game`,std(`match_score_vw`.`total_points`) AS `std_total_points`,var_samp(`match_score_vw`.`total_points`) AS `var_total_points` from (`specific_comp_match_results_vw` join `match_score_vw` on((`specific_comp_match_results_vw`.`match_number` = `match_score_vw`.`match_number`))) group by `specific_comp_match_results_vw`.`team_number` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `money_ball_vw`
--

/*!50001 DROP VIEW IF EXISTS `money_ball_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `money_ball_vw` AS select `match_score_vw`.`team_number` AS `team_number`,avg(`match_score_vw`.`auto_points`) AS `avg_auto_score`,std(`match_score_vw`.`auto_points`) AS `std_auto`,avg(`match_score_vw`.`tele_points`) AS `avg_tele_score`,std(`match_score_vw`.`tele_points`) AS `std_tele`,(`best_bot_vw`.`pcnt_lvl_4_hangs` / 100) AS `avg_hang_4_pts`,(`best_bot_vw`.`pcnt_lvl_3_hangs` / 100) AS `avg_hang_3_pts`,(`best_bot_vw`.`pcnt_lvl_2_hangs` / 100) AS `avg_hang_2_pts`,avg(`match_score_vw`.`end_game_points`) AS `avg_end_game`,std(`match_score_vw`.`end_game_points`) AS `std_end_game`,avg(`match_score_vw`.`total_points`) AS `avg_total_points`,std(`match_score_vw`.`total_points`) AS `std_total_points` from (`match_score_vw` join `best_bot_vw` on((`best_bot_vw`.`team_number` = `match_score_vw`.`team_number`))) group by `match_score_vw`.`team_number` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `specific_comp_match_results_vw`
--

/*!50001 DROP VIEW IF EXISTS `specific_comp_match_results_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `specific_comp_match_results_vw` AS select `match_results`.`result_oid` AS `result_oid`,`match_results`.`match_number` AS `match_number`,`match_results`.`team_number` AS `team_number`,`match_results`.`alliance_station` AS `alliance_station`,`match_results`.`auto_low` AS `auto_low`,`match_results`.`auto_high` AS `auto_high`,`match_results`.`tele_op_low` AS `tele_op_low`,`match_results`.`tele_op_high` AS `tele_op_high`,`match_results`.`auto_line` AS `auto_line`,`match_results`.`hang_1` AS `hang_1`,`match_results`.`hang_2` AS `hang_2`,`match_results`.`hang_3` AS `hang_3`,`match_results`.`hang_4` AS `hang_4`,`match_results`.`played_defence` AS `played_defence`,`match_results`.`won_match` AS `won_match`,`match_results`.`notes` AS `notes`,`match_results`.`comp_loc` AS `comp_loc`,`server_settings_table`.`oid` AS `oid`,`server_settings_table`.`blue_alliance_comp_key` AS `blue_alliance_comp_key`,`server_settings_table`.`scouting_app_comp_key` AS `scouting_app_comp_key` from (`match_results` join `server_settings_table` on((convert(`match_results`.`comp_loc` using utf8mb4) = `server_settings_table`.`scouting_app_comp_key`))) */;
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

-- Dump completed on 2022-04-17 11:04:21
