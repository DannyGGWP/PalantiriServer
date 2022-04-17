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
var express = require('express');
var mysql = require('mysql2');
var mysqlCon = require('../connection'); 
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  var query = "SET @comp_loc = ?; CALL get_comp_totals(@comp_loc); CALL get_comp_avgs(@comp_loc); ";
  mysqlCon.query(query,"",(err,rows,fields)=>{
    if (err) throw err;
    //console.log(rows)
    res.render('index', { 
      title: 'Palantir', 
      comp: '', 
      totals: rows[1][0],
      averages: rows[3][0]});
  });
});

router.get('/comp/:compLoc', function(req, res, next) {
  var query = "SET @comp_loc = ?; CALL get_comp_totals(@comp_loc); CALL get_comp_avgs(@comp_loc); ";
  mysqlCon.query(query,req.params.compLoc,(err,rows,fields)=>{
    if (err) throw err;
    //console.log(rows)
    res.render('index', { 
      title: 'Palantir', 
      comp: req.params.compLoc, 
      totals: rows[1][0],
      averages: rows[3][0]});
  });
  
});

router.get(['/config','/config/save'],function(req,res,next){
  res.render('config',{
    title: 'Configure'
  })
});
router.post('/config/save',function(req,res,next) {
  console.log(req.body)
  let blComp = req.body.blCompKey; 
  let appCompKey = req.body.appCompKey; 
  var query = "SET @bl_key = ?; SET @app_key = ?; INSERT INTO `scouting_db`.`server_settings_table`\
  ( `oid`,\
    `blue_alliance_comp_key`,\
    `scouting_app_comp_key`)\
  VALUES\
  (1,\
  @bl_key,\
  @app_key) ON DUPLICATE KEY UPDATE `blue_alliance_comp_key` = @bl_key, `scouting_app_comp_key` = @app_key;\
  "; 
  mysqlCon.query(query,[blComp,appCompKey],(err,rows,fields)=>{
    if (err) throw err; 
    res.render('config',{
      title: 'Configure'
    })
  });
}); 

module.exports = router;
