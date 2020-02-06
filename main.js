const MongoClient = require('mongodb').MongoClient; 
const assert = require('assert');

const url = 'mongodb://localhost:27017/scoutingdb';

MongoClient.connect(url, function(err,db){
    if (err) throw err;
    console.log('Database Created');
    db.close();
})