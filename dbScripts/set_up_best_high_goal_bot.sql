CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `best_high_goal_bots_vw` AS select `match_results`.`team_number` AS `team_number`,avg(`match_results`.`auto_high`) OVER (PARTITION BY `match_results`.`team_number` )  AS `avg_high_auto`,avg(`match_results`.`tele_op_high`) OVER (PARTITION BY `match_results`.`team_number` )  AS `avg_high_tele` from `match_results`