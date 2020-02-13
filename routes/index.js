var express = require('express');
var mysql = require('mysql');
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

module.exports = router;
