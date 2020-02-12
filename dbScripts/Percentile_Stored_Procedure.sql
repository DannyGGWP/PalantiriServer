CREATE PROCEDURE `calc_percentiles` ()
BEGIN
WITH t AS (
    SELECT
        team_number,
        AVG(auto_low) auto_low,
        AVG(auto_high) auto_high,
        AVG(tele_op_low) tele_op_low,
        AVG(tele_op_high) tele_op_high,
        AVG(wheel_stage_2) wheel_stage_2, 
        AVG(wheel_stage_3) wheel_stage_3,
        AVG(hang) hang,
        AVG(balanced) balanced,
        AVG(played_defence) played_defence,
        AVG(won_match) won_match
    FROM
        match_results
    GROUP BY
        team_number
)
SELECT
    team_number,
    ROUND(
       PERCENT_RANK() OVER (
          ORDER BY auto_low
       )
    ,2)*100 pr_auto_low,
    ROUND(
       PERCENT_RANK() OVER (
          ORDER BY auto_high
       )
    ,2)*100 pr_auto_high,
    ROUND(
       PERCENT_RANK() OVER (
          ORDER BY tele_op_low
       )
    ,2)*100 pr_tele_op_low,
    ROUND(
       PERCENT_RANK() OVER (
          ORDER BY tele_op_high
       )
    ,2)*100 pr_tele_op_high,
    ROUND(
       PERCENT_RANK() OVER (
          ORDER BY wheel_stage_2
       )
    ,2)*100 pr_wheel_stage_2,
    ROUND(
       PERCENT_RANK() OVER (
          ORDER BY wheel_stage_3
       )
    ,2)*100 pr_wheel_stage_3,
    ROUND(
       PERCENT_RANK() OVER (
          ORDER BY hang
       )
    ,2)*100 pr_hang,
    ROUND(
       PERCENT_RANK() OVER (
          ORDER BY balanced
       )
    ,2)*100 pr_balanced,
    ROUND(
       PERCENT_RANK() OVER (
          ORDER BY played_defence
       )
    ,2)*100 pr_played_defence,
    ROUND(
       PERCENT_RANK() OVER (
          ORDER BY won_match
       )
    ,2)*100 pr_wins
FROM
    t; 
END
