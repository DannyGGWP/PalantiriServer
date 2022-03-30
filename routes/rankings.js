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
 *    Copyright 2022 Team 237
 */

const express = require('express'); 
const router = express.Router(); 
const mysqlCon = require('../connection'); 

router.get('/', (req,res)=>{
    query = "SELECT team_number, avg(tele_op_high) as average_score from match_results group by team_number order by average_score desc;"
    mysqlCon.query(query, (err, rows, fields)=>{
        if (err) throw err;
        console.log(rows); 
        headers = ["Team number", "Average Tele Op Shots Made"]
        res.render('rankings',{title:"Rankings", headings: headers,json: rows});  
    }); 
}); 

module.exports = router; 