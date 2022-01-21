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
END