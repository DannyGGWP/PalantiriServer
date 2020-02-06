const mysql = require('mysql');
const express = require('express')
const mysqlCon = require('./connection'); 
const TeamRoutes = require("./routes/teams")

var app = express(); 
app.get("/", (req,res)=>{
    res.send("Hello World!")
})
app.use("/matches", TeamRoutes); 
app.listen(3000); 