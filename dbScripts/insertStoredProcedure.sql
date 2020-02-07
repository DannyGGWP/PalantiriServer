CREATE DEFINER=`root`@`localhost` PROCEDURE `add_result`(
IN match_num INT,
IN team_num INT,
IN alliance_sation VARCHAR(45),
in auto_low INT,
in auto_high int, 
in tele_low int, 
in tele_high int, 
in auto_line boolean,
in wheel_2 boolean,
in wheel_3 boolean,
in hang boolean,
in balanced boolean,
in defence boolean,
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
	`wheel_stage_2`,
	`wheel_stage_3`,
	`hang`,
	`balanced`,
	`played_defence`,
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
	wheel_2,
	wheel_3,
	hang,
	balanced,
	defence,
	notes,
	comp_loc);
    SELECT match_num AS 'matchNum'; 
END