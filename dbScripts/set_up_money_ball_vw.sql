CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `money_ball_vw` AS select `best_bot_vw`.`team_number` AS `team_number`,((`best_bot_vw`.`avg_low_auto` * 2) + (`best_bot_vw`.`avg_high_auto` * 4)) AS `avg_auto_score`,(`best_bot_vw`.`avg_low_auto` + (`best_bot_vw`.`avg_high_tele` * 2)) AS `avg_tele_score`,((`best_bot_vw`.`pcnt_lvl_4_hangs` * 15) / 100) AS `avg_hang_4_pts`,((`best_bot_vw`.`pcnt_lvl_3_hangs` * 10) / 100) AS `avg_hang_3_pts`,((`best_bot_vw`.`pcnt_lvl_2_hangs` * 6) / 100) AS `avg_hang_2_pts` from `best_bot_vw`;