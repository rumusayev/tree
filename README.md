# Installation and Usage guide

### Installation
For installation of this project you should run install.sql file.  
This will create database with table and data in it.  
Then you should write correct Database credentials in index.php file.  

    const USERNAME = 'tree';
    const PASSWORD = 'tree';
    const HOST = 'localhost';
    const DB = 'tree';
    
After the Database configuration you should upload index.php file to server.

installation is done!

### API Usage
Fore retrieving categories data you should write correct API call:  

    URL: http://yourserver.com/?module=category&action=gettree
    Request type: GET
    Module: category
    Action: gettree

API will response with JSON data.  
If Module of Action will not exist then API will return you error code:  

    "error code" => 400,
    "message" => "Module not found"
      
               OR
                
    "error code" => 400,
    "message" => "Action not found"