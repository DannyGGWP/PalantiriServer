/*
 *
 *   This file is part of PalantiriServer.
 *
 *    PalantiriServer is free software: you can redistribute it and/or modify
 *    it under the terms of the GNU General Public License as published by
 *    the Free Software Foundation, either version 3 of the License, or
 *    (at your option) any later version.
 *
 *    PalantiriServer is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *    GNU General Public License for more details.
 *
 *    You should have received a copy of the GNU General Public License
 *    along with PalantiriServer.  If not, see <https://www.gnu.org/licenses/>.
 *
 *    Copyright 2020 Team 237
 */
const mysql = require('mysql2');
const express = require('express'); 
const router = express.Router(); 
const mysqlCon = require('../connection'); 

router.get('/', (req,res)=>{
    mysqlCon.query("SELECT match_number, team_number, auto_low, auto_high, tele_op_low, tele_op_high, auto_line, hang_1, hang_2, hang_3, hang_4, played_defence FROM match_results ORDER BY match_number;", (err, rows, fields)=>{
        if (err) throw err;
        //console.log(rows); 
        var headers = ["Match Number","Team Number", "Auto Low", "Auto High", "TeleOp Low", "TeleOp High", "Auto Line", "Wheel Stage 2", "Wheel Stage 3", "Hang", "Balanced", "Played Defence", ]
        res.render('matches',{title:"Matches", headings: headers,json: rows});  
    }); 
})
router.get("/submit",(req,res)=>{
    res.render("submitmatch",{title:"Match Input"});
});
router.get('/:teamNum',(req,res)=>{
    mysqlCon.query('SELECT match_number, team_number, auto_low, auto_high, tele_op_low, tele_op_high, auto_line, hang_1, hang_2, hang_3, hang_4, played_defence FROM match_results WHERE match_number = ?',[req.params.teamNum],(err,rows,fields)=>{
        if (err) throw err; 
        var headers = ["Match Number","Team Number", "Auto Low", "Auto High", "TeleOp Low", "TeleOp High", "Auto Line", "Wheel Stage 2", "Wheel Stage 3", "Hang", "Balanced", "Played Defence", ]
        res.render('matches',{title:"Matches", headings: headers,json: rows});  
    })
})

router.post('/',(req,res)=>{
    let match = req.body; 
    var callAdd = "SET @match_number = ?;SET @team_number = ?;SET @allianceStation = ?;SET @auto_low_score = ?;SET @auto_high_score = ?;SET @low_score = ?;SET @high_score = ?;SET @drove_off_line = ?;SET @stage_two_wheel = ?;SET @stage_three_wheel = ?;SET @hang = ?;SET @balanced = ?;SET @played_defence = ?;SET @won_match = ?;SET @notes = ?;SET @compLoc = ?;CALL add_result(@match_number,@team_number,@allianceStation,@auto_low_score,@auto_high_score,@low_score,@high_score,@drove_off_line,@stage_two_wheel,@stage_three_wheel,@hang,@balanced,@played_defence,@won_match,@notes,@compLoc);";
    console.log(match); 
    mysqlCon.query(callAdd, 
        [
            Number(match.match_number),
            Number(match.team_number),
            match.allianceStation,
            Number(match.auto_low_score),
            Number(match.auto_high_score),
            Number(match.low_score),
            Number(match.high_score),
            Boolean(match.drove_off_line),
            Boolean(match.hang_1),
            Boolean(match.hang_2),
            Boolean(match.hang_3),
            Boolean(match.hang_4),
            Boolean(match.played_defence),
            Boolean(match.won_match),
            match.notes,
            "nedcmp"
        ],(err,rows,fields)=>{
            if (err) throw err; 
            res.writeHead(301, {'Location': '/matches/submit'});
            res.end(); 
        })

})
module.exports = router; 