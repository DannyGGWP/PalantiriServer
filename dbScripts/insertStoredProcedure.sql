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
END

