const mysql = require('mysql');
const express = require('express'); 
const router = express.Router(); 
const mysqlCon = require('../connection'); 

router.get('/', (req,res)=>{
    mysqlCon.query("SELECT * FROM match_results", (err, rows, fields)=>{
        if (err) throw err;
        res.send(rows);  
    }); 
})

router.get('/:teamNum',(req,res)=>{
    mysqlCon.query('SELECT * FROM match_results WHERE team_number = ?',[req.params.teamNum],(err,rows,fields)=>{
        if (err) throw err; 
        res.send(rows); 
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