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

var config  = {
    host: "localhost",
    user: "ScoutingAppLocal",
    password: "scouting2020",
    database: "scouting_db", 
    multipleStatements: true
}; 
var con = mysql.createConnection(config); 
con.connect((err)=>
{
    if (err) throw err; 
    console.log("Connected!")
})

module.exports = con; 