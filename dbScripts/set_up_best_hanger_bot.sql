CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `best_hanger_bot` AS
    SELECT 
        `match_results`.`team_number` AS `team_number`,
        (AVG(`match_results`.`hang_2`) OVER (partition by team_number) * 100) AS `pcnt_lvl_2_hangs`,
        (AVG(`match_results`.`hang_3`) OVER (partition by team_number) * 100) AS `pcnt_lvl_3_hangs`,
        (AVG(`match_results`.`hang_4`) OVER (partition by team_number) * 100) AS `pcnt_lvl_4_hangs`
    FROM
        `match_results`