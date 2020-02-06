const mysql = require('mysql');
const express = require('express')
const router = express.Router(); 
const mysqlCon = require('../connection'); 

router.get('/', (req,res)=>{
    mysqlCon.query("SELECT * FROM match_results", (err, rows, fields)=>{
        if (err) throw err;
        res.send(rows);  
    }); 
})

module.exports = router; 