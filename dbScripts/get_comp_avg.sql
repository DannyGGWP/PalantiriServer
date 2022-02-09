CREATE PROCEDURE `get_comp_avgs` (IN comp_loc varchar(45))
BEGIN
	IF comp_loc = null
 THEN
	SELECT 
	AVG(auto_low), 
	AVG(auto_high), 
	AVG(tele_op_low), 
	AVG(tele_op_high),
	AVG(hang_1),
	AVG(hang_2),
	AVG(hang_3),
	AVG(hang_4)
	from match_results; 
ELSE 
	SELECT 
	AVG(auto_low), 
	AVG(auto_high), 
	AVG(tele_op_low), 
	AVG(tele_op_high),
	AVG(hang_1),
	AVG(hang_2),
	AVG(hang_3),
	AVG(hang_4)
	from match_results WHERE comp_loc=comp_loc;
 END IF; 
END
