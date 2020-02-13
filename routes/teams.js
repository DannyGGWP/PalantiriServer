const mysql = require('mysql');
const express = require('express'); 
const router = express.Router(); 
const mysqlCon = require('../connection'); 

router.get('/:teamNum',(req,res)=>{
    let team = req.params.teamNum
    var query = "SET @teamNum = ?; CALL get_team_results(@teamNum); CALL calc_percentiles()"
    mysqlCon.query(query,req.params.teamNum,(err,rows,fields)=>{
        if (err) throw err; 
        var headers = ["Auto Low", "Auto High", "Tele Op Low", "Tele Op High", "Auto Line", "Wheel Level 2", "Wheel Level 3", "Hang", "Balanced", "Played Defence", "Win Rate"]; 
        //console.log(rows); 
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
        res.render('teams',{
            title: "Results For Team "+team,
            team: team,
            headings: headers, 
            results: rows[1],
            teamStats: team_percentile
            }); 
    });
}); 

module.exports = router; 