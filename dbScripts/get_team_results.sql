CREATE PROCEDURE `get_team_res` (IN team_num int)
BEGIN
	select AVG(auto_low), 
    AVG(auto_high), 
    AVG(tele_op_low), 
    AVG(tele_op_high), 
    avg (auto_line), 
    avg(wheel_stage_2), 
    avg (wheel_stage_3) , 
    avg (hang) , 
    avg(balanced) , 
    avg (played_defence)  
    FROM match_results where team_number=237; 
END
