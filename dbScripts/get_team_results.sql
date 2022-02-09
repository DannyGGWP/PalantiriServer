CREATE DEFINER=`root`@`localhost` PROCEDURE `get_team_results`(IN team_num int)
BEGIN
	select AVG(auto_low), 
    AVG(auto_high), 
    AVG(tele_op_low), 
    AVG(tele_op_high), 
    avg (auto_line)*100, 
    avg(hang_1)*100, 
    avg (hang_2)*100 , 
    avg (hang_3)*100 , 
    avg(hang_4)*100 , 
    avg (played_defence)*100 ,
    avg (won_match)*100
    FROM match_results where team_number=team_num; 
END