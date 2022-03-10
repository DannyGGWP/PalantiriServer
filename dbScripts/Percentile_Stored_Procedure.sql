CREATE DEFINER=`root`@`localhost` PROCEDURE `calc_percentiles`()
BEGIN
WITH t AS (
    SELECT
        team_number,
        AVG(auto_low) auto_low,
        AVG(auto_high) auto_high,
        AVG(tele_op_low) tele_op_low,
        AVG(tele_op_high) tele_op_high,
        AVG(hang_1) hang_1, 
        AVG(hang_2) hang_2,
        AVG(hang_3) hang_3,
        AVG(hang_4) hang_4,
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
          ORDER BY hang_1
       )
    ,2)*100 pr_hang_1,
    ROUND(
       PERCENT_RANK() OVER (
          ORDER BY hang_2
       )
    ,2)*100 pr_hang_2,
    ROUND(
       PERCENT_RANK() OVER (
          ORDER BY hang_3
       )
    ,2)*100 pr_hang_3,
    ROUND(
       PERCENT_RANK() OVER (
          ORDER BY hang_4
       )
    ,2)*100 pr_hang_4,
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