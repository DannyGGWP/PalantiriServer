# PalantiriServer
This is a NodeJS and MySQL Data Aggrigation app for scouting FIRST Robotics Competions. This was designed for the 2022 Game Rapid React. 

## Requiremnts 
- NodeJS 
- MySQL 
- MySQL Workbench
### Optional 
- VS Code or other IDE

## Installation 
### Set Up Server
Begin by cloning the repository into a Folder. 

`git clone https://github.com/DannyGGWP/PalantiriServer.git`

Next Install the required Packages 

`npm install` 
### Set up Database
Open MySQL work bench and import the Database file in the repository using "Server->Data Import" and select the file /dbScripts/setup_scouting_db_20XX.sql 

Or run the following MySQL command from the MySql Shell 
`mysql scouting_db < /dbScripts/setup_scouting_db_20XX.sql`

Where XX is the current Year. 

Next Set up a User in MySql for the node JS application to use. Provide it with the Privleges to 
- DELETE
- INSERT 
- UPDATE 
- SELECT 
- SHOW VIEW
- EXECUTE
- CREATE TEMPORARY TABLES 

Be sure to modify the User in the Config object in the connections.js file The Default configuration is listed below. You should use a different password then the example provided. 

```
var config  = {
    host: "localhost",
    user: "ScoutingAppLocal",
    password: "scouting2020",
    database: "scouting_db", 
    multipleStatements: true,
    charset: 'utf8'
}; 
```

### Run the Server 
Run the Server by typing the following in a terminal 
`node app.js` 

Check if the app is running by navigating to http://localhost:3000/ 
