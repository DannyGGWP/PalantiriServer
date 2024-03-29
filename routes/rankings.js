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
    query = "\
    SELECT * FROM scouting_db.money_ball_vw order by avg_total_points desc; \
    SELECT * from best_high_goal_bots_vw where avg_high_tele > 0 order by avg_high_tele desc; \
    SELECT * from best_low_goal_bot where avg_low_tele > 0 order by avg_low_tele desc; \
    SELECT * from best_hanger_bot order by pcnt_lvl_4_hangs desc"
    mysqlCon.query(query, (err, rows, fields)=>{
        if (err) throw err;
        console.log(rows); 
        /// Money Ball LETS GOOOO!!!
        money_ball_header = ["Team Number", "Auto Points","+/-", "Tele Op Points","+/-", "Level 4 Points", "Level 3 Points", "Level 2 Points", "Avg End Game Points","+/-","Avg Match Points","+/-"]
        headers_high = ["Team number", "Average Auto","Average Tele Op"]
        headers_low = ["Team number", "Average Auto","Average Tele Op"]
        headers_hanger = ["Team number", "Percent of Level 2 Hangs","Percent of Level 3 Hangs", "Percent of Level 4 Hangs"]
        res.render('rankings',{title:"Rankings", headers_high: headers_high,headers_low:headers_low,headers_hanger:headers_hanger,money_ball_header:money_ball_header,money_ball:rows[0],high: rows[1],low:rows[2],hang:rows[3]});  
    }); 
}); 

module.exports = router; 