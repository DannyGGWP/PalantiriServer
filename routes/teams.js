const mysql = require('mysql');
const express = require('express'); 
const router = express.Router(); 
const mysqlCon = require('../connection'); 

router.get('/:teamNum',(req,res)=>{
    let team = req.params.teamNum
    var query = "SET @teamNum = ?; CALL get_team_results(@teamNum); "
    mysqlCon.query(query,req.params.teamNum,(err,rows,fields)=>{
        if (err) throw err; 
        var headers = ["Avg Auto Low", "Avg Auto High", "Avg Tele Op Low", "Avg Tele Op High", "% Drove in Auto", "% Wheel Level 2", "% Wheel Level 3", "% Hang", "% Balanced", "% Played Defence"]; 
        console.log(rows); 
        res.render('teams',{
            title: "Results For Team "+team,
            headings: headers, 
            results: rows[1]
            }); 
    });
}); 

module.exports = router; 