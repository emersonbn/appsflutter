const Sequelize = require('sequelize');

const userName = 'microsiga';
const password = '2019'; // update me
const hostName = 'localhost';
const sampleDbName = 'protheusTeste';

// Option 1: Passing parameters separately
//Server=DESKTOP-BLNJLVT\\SQLEXPRESS;Database=protheusTeste;User Id=microsiga;Password=2019;
//const db = new Sequelize('protheusTeste', 'microsiga', '2019', {
 module.exports = new Sequelize(sampleDbName, userName, password, {
        dialect: 'mssql',
        host: hostName,
        port: 1433, // Default port
        logging: false, // disable logging; default: console.log
    
        dialectOptions: {
            requestTimeout: 30000 // timeout = 30 seconds
        }
    });
         
   //const db = new Sequelize('mssql://DESKTOP-BLNJLVT/SQLEXPRESS:3306/protheusTeste', {})
  // mssql://[Server_Name[:Portno]]/[Database_Instance_Name]/[Database_Name]?FailoverPartner=[Partner_Server_Name]&InboundId=[Inbound_ID
   /*
    const db =new Sequelize({
    dialect: 'mssql',
    dialectModulePath: 'sequelize-msnodesqlv8',
    dialectOptions: {
        connectionString: 'Server=DESKTOP-BLNJLVT\\SQLEXPRESS;Database=protheusTeste;User Id=microsiga;Password=2019;'
    },
    });*/