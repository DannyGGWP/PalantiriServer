CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `best_hanger_bot` 
AS select distinct `specific_comp_match_results_vw`.`team_number` AS `team_number`,
(avg(`specific_comp_match_results_vw`.`hang_2`) OVER (PARTITION BY `specific_comp_match_results_vw`.`team_number` )  * 100) 
AS `pcnt_lvl_2_hangs`,(avg(`specific_comp_match_results_vw`.`hang_3`) OVER (PARTITION BY `specific_comp_match_results_vw`.`team_number` )  * 100) AS `pcnt_lvl_3_hangs`,
(avg(`specific_comp_match_results_vw`.`hang_4`) OVER (PARTITION BY `specific_comp_match_results_vw`.`team_number` )  * 100) AS `pcnt_lvl_4_hangs` from `specific_comp_match_results_vw`;
