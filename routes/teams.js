const mysql = require('mysql');
const express = require('express'); 
const router = express.Router(); 
const mysqlCon = require('../connection'); 

router.get('/:teamNum',(req,res)=>{
    let team = req.params.teamNum
    var query = "SET @teamNum = ?; CALL get_team_results(@teamNum); CALL calc_percentiles(); SELECT notes FROM match_results WHERE team_number=@teamNum;"
    mysqlCon.query(query,req.params.teamNum,(err,rows,fields)=>{
        if (err) throw err; 
        var headers = ["Auto Low", "Auto High", "Tele Op Low", "Tele Op High", "Auto Line", "Wheel Level 2", "Wheel Level 3", "Hang", "Balanced", "Played Defence", "Win Rate"]; 
        console.log(rows); 
        var team_percentile; 
        for (var i = 0; i < rows.length; i++)
        {
            for (var j = 0; j<rows[i].length; j++) {
                if (rows[i][j].hasOwnProperty('team_number') && rows[i][j]['team_number']==team)
                {
                    team_percentile = rows[i][j]; 
                    console.log(team_percentile);
                }
            }
            
        }
        var comments = []; 
        for (var ii = 0; ii < rows[rows.length-1].length; ii++ )
        {
            console.log(rows[rows.length-1][ii]);
            comments[ii] = rows[rows.length-1][ii];
        }
        console.log(comments)
        res.render('teams',{
            title: "Results For Team "+team,
            team: team,
            headings: headers, 
            results: rows[1],
            teamStats: team_percentile,
            comments: comments
            }); 
    });
}); 

module.exports = router; 