const Sequelize = require('sequelize');

const sequelize = new Sequelize('database', null, null, {
    dialect: 'mssql',

    pool: {
        max: 5,
        min: 0,
        acquire: 30000,
        idle: 10000
    }
});

module.exports = sequelize;