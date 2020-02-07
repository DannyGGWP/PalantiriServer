CREATE TABLE `match_results` (
  `result_oid` int NOT NULL AUTO_INCREMENT,
  `match_number` int DEFAULT NULL,
  `team_number` int DEFAULT NULL,
  `alliance_station` varchar(45) DEFAULT NULL,
  `auto_low` int DEFAULT NULL,
  `auto_high` int DEFAULT NULL,
  `tele_op_low` int DEFAULT NULL,
  `tele_op_high` int DEFAULT NULL,
  `auto_line` tinyint(1) DEFAULT NULL,
  `wheel_stage_2` tinyint(1) DEFAULT NULL,
  `wheel_stage_3` tinyint(1) DEFAULT NULL,
  `hang` tinyint(1) DEFAULT NULL,
  `balanced` tinyint(1) DEFAULT NULL,
  `played_defence` tinyint(1) DEFAULT NULL,
  `notes` text,
  `comp_loc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`result_oid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

