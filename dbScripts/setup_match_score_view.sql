CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `match_score_vw` AS select `specific_comp_match_results_vw`.`match_number` AS `match_number`,`specific_comp_match_results_vw`.`team_number` AS `team_number`,((`specific_comp_match_results_vw`.`auto_low` * 2) + (`specific_comp_match_results_vw`.`auto_high` * 4)) AS `auto_points`,(`specific_comp_match_results_vw`.`tele_op_low` + (`specific_comp_match_results_vw`.`tele_op_high` * 2)) AS `tele_points`,greatest(`specific_comp_match_results_vw`.`hang_1`,(`specific_comp_match_results_vw`.`hang_2` * 6),(`specific_comp_match_results_vw`.`hang_3` * 10),(`specific_comp_match_results_vw`.`hang_4` * 15)) AS `end_game_points`,(((`specific_comp_match_results_vw`.`auto_low` * 2) + (`specific_comp_match_results_vw`.`auto_high` * 4)) + ((`specific_comp_match_results_vw`.`tele_op_low` + (`specific_comp_match_results_vw`.`tele_op_high` * 2)) + greatest(`specific_comp_match_results_vw`.`hang_1`,(`specific_comp_match_results_vw`.`hang_2` * 6),(`specific_comp_match_results_vw`.`hang_3` * 10),(`specific_comp_match_results_vw`.`hang_4` * 15)))) AS `total_points` from `specific_comp_match_results_vw`;