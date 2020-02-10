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
    mysqlCon.query('SELECT match_number, team_number, auto_low, auto_high, tele_op_low, tele_op_high, auto_line, wheel_stage_2, wheel_stage_3, hang, balanced, played_defence, notes FROM match_results WHERE match_number = ?',[req.params.teamNum],(err,rows,fields)=>{
        if (err) throw err; 
        var headers = ["Match Number","Team Number", "Auto Low", "Auto High", "TeleOp Low", "TeleOp High", "Auto Line", "Wheel Stage 2", "Wheel Stage 3", "Hang", "Balanced", "Played Defence", "Notes", ]
        res.render('matches',{title:"Matches", headings: headers,json: rows});  
    })
})
router.post('/',(req,res)=>{
    let match = req.body; 
    var callAdd = "SET @match_number = ?;SET @team_number = ?;SET @allianceStation = ?;SET @auto_low_score = ?;SET @auto_high_score = ?;SET @low_score = ?;SET @high_score = ?;SET @drove_off_line = ?;SET @stage_two_wheel = ?;SET @stage_three_wheel = ?;SET @hang = ?;SET @balanced = ?;SET @played_defence = ?;SET @notes = ?;SET @compLoc = ?;CALL add_result(@match_number,@team_number,@allianceStation,@auto_low_score,@auto_high_score,@low_score,@high_score,@drove_off_line,@stage_two_wheel,@stage_three_wheel,@hang,@balanced,@played_defence,@notes,@compLoc);";
    console.log(match); 
    mysqlCon.query(callAdd, 
        [
            match.match_number,
            match.team_number,
            match.allianceStation,
            match.auto_low_score,
            match.auto_high_score,
            match.low_score,
            match.high_score,
            match.drove_off_line,
            match.stage_two_wheel,
            match.stage_three_wheel,
            match.hang,
            match.balanced,
            match.played_defence,
            match.notes,
            match.compLoc
        ],(err,rows,fields)=>{
            if (err) throw err; 
            res.send(rows); 
        })

})
module.exports = router; 