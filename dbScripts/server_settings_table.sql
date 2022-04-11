CREATE TABLE `server_settings_table` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `blue_alliance_comp_key` varchar(45) DEFAULT NULL,
  `scouting_app_comp_key` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `oid_UNIQUE` (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
