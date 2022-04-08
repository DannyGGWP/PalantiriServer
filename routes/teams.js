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

router.get('/:teamNum',(req,res)=>{
    let team = req.params.teamNum
    var query = "SET @teamNum = ?; CALL get_team_results(@teamNum); \
    CALL calc_percentiles(); \
    SELECT notes FROM match_results WHERE team_number=@teamNum; \
    select max(auto_low) as best_auto_low, \
    max(auto_high) as best_auto_high, \
    max(tele_op_low) as best_tele_low, \
    max(tele_op_high) as best_tele_high from match_results where team_number=@teamNum; \
    select  tele_op_high from match_results where team_number=@teamNum; "
    mysqlCon.query(query,req.params.teamNum,(err,rows,fields)=>{
        if (err) throw err; 
        var headers = ["Auto Low", "Auto High", "Tele Op Low", "Tele Op High", "Auto Line", "Hang Level 3", "Hang Level 4", "Hang Level 1", "Hang Level 2", "Played Defence", "Win Rate"]; 
        console.log(rows); 
        var team_percentile; 
        for (var i = 0; i < rows.length; i++)
        {
            for (var j = 0; j<rows[i].length; j++) {
                if (rows[i][j].hasOwnProperty('team_number') && rows[i][j]['team_number']==team)
                {
                    team_percentile = rows[i][j]; 
                    //console.log(team_percentile);
                }
            }
            
        }
        var comments = []; 
        for (var ii = 0; ii < rows[rows.length-3].length; ii++ )
        {
            //console.log(rows[rows.length-1][ii]);
            comments[ii] = rows[rows.length-3][ii];
        }
        var best_match = rows[rows.length-2];

        var match_chart_data ={
            data: {
            labels: ["red", "green", "blue"],
            datasets: [{
                label: 'Points Per Match',
                data: rows[rows.length-1],
                backgroundColor: ['grey'],
                borderColor: ['white'],
                borderWidth: 1
            }]
            },
        options: {
            title: {
                display: true,
                text: "chart"
            },
            legend: {
                position: 'bottom'
            }
        }}; 

        //console.log(comments)
        res.render('teams',{
            title: "Results For Team "+team,
            team: team,
            headings: headers, 
            results: rows[1],
            teamStats: team_percentile,
            comments: comments,
            bestMatch : best_match, 
            matchData : match_chart_data
            }); 
    });
}); 

module.exports = router; 