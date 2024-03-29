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
var createError = require('http-errors');
var express = require('express');
var path = require('path');
const mysql = require('mysql2');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var mysqlCon = require('./connection'); 

var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
var matchesRouter = require('./routes/matches'); 
var teamRouter = require('./routes/teams'); 
var rankingsRouter = require('./routes/rankings')


var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'pug');

app.use(function(req, res, next) {
  var query = "SELECT DISTINCT team_number FROM match_results order by team_number asc;";
  mysqlCon.query(query,"",(err,rows,fields)=>{
    if (err) throw err;
    res.locals['teams'] = rows; 
  });
  var matchQerry = "select DISTINCT match_number from match_results order by match_number asc;"
  mysqlCon.query(matchQerry,"",(err,rows,fields)=>{
    if (err) throw err;
    res.locals['matches'] = rows; 
  });
  next()
})

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));



app.use('/', indexRouter);
app.use('/users', usersRouter);
app.use('/matches', matchesRouter); 
app.use('/teams', teamRouter); 
app.use('/ranking',rankingsRouter);
app.use('/jquery', express.static(__dirname + '/node_modules/jquery/dist/'));



// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
  next()
});

module.exports = app;
