const mysql = require('mysql');
const express = require('express'); 
const router = express.Router(); 
const mysqlCon = require('../connection'); 

router.get('/', (req,res)=>{
    mysqlCon.query("SELECT match_number, team_number, auto_low, auto_high, tele_op_low, tele_op_high, auto_line, wheel_stage_2, wheel_stage_3, hang, balanced, played_defence, notes FROM match_results;", (err, rows, fields)=>{
        if (err) throw err;
        //console.log(rows); 
        var headers = ["Match Number","Team Number", "Auto Low", "Auto High", "TeleOp Low", "TeleOp High", "Auto Line", "Wheel Stage 2", "Wheel Stage 3", "Hang", "Balanced", "Played Defence", "Notes", ]
        res.render('matches',{title:"Matches", headings: headers,json: rows});  
    }); 
})

router.get('/:teamNum',(req,res)=>{
    mysqlCon.query('SELECT match_number, team_number, auto_low, auto_high, tele_op_low, tele_op_high, auto_line, wheel_stage_2, wheel_stage_3, hang, balanced, played_defence, notes FROM match_results WHERE team_number = ?',[req.params.teamNum],(err,rows,fields)=>{
        if (err) throw err; 
        var headers = ["Match Number","Team Number", "Auto Low", "Auto High", "TeleOp Low", "TeleOp High", "Auto Line", "Wheel Stage 2", "Wheel Stage 3", "Hang", "Balanced", "Played Defence", "Notes", ]
        res.render('matches',{title:"Matches", headings: headers,json: rows});  
    })
})
router.post('/',(req,res)=>{
    let match = req.body; 
    var callAdd = "SET @matchNum = ?;SET @teamNum = ?;SET @allianceStation = ?;SET @autoLow = ?;SET @autoHigh = ?;SET @teleLow = ?;SET @teleHigh = ?;SET @autoLine = ?;SET @wheelTwo = ?;SET @wheelThree = ?;SET @hang = ?;SET @balanced = ?;SET @defence = ?;SET @notes = ?;SET @compLoc = ?;CALL add_result(@matchNum,@teamNum,@allianceStation,@autoLow,@autoHigh,@teleLow,@teleHigh,@autoLine,@wheelTwo,@wheelThree,@hang,@balanced,@defence,@notes,@compLoc);";
    console.log(callAdd); 
    mysqlCon.query(callAdd, 
        [
            match.matchNum,
            match.teamNum,
            match.allianceStation,
            match.autoLow,
            match.autoHigh,
            match.teleLow,
            match.teleHigh,
            match.autoLine,
            match.wheelTwo,
            match.wheelThree,
            match.hang,
            match.balanced,
            match.defence,
            match.notes,
            match.compLoc
        ],(err,rows,fields)=>{
            if (err) throw err; 
            res.send(rows); 
        })

})
module.exports = router; 