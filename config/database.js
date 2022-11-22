const Sequelize = require("sequelize");

//Connect to db
const sequelize = new Sequelize(
    'sdev265',
    'root',
    'password',
     {
       host: '127.0.0.1',
       dialect: 'mysql'
     }
);

 module.exports = sequelize;