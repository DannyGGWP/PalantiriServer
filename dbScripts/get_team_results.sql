CREATE DEFINER=`root`@`localhost` PROCEDURE `get_team_results`(IN team_num int)
BEGIN
	select AVG(auto_low), 
    AVG(auto_high), 
    AVG(tele_op_low), 
    AVG(tele_op_high), 
    avg (auto_line)*100, 
    avg(wheel_stage_2)*100, 
    avg (wheel_stage_3)*100 , 
    avg (hang)*100 , 
    avg(balanced)*100 , 
    avg (played_defence)*100  
    FROM match_results where team_number=team_num; 
END