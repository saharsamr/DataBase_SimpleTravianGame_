const Sequelize = require('sequelize');

var sequelize = new Sequelize('TRAVIANS', undefined, undefined, {
    dialect: 'mssql',
    host: 'DESKTOP-R0UVS7R'
});

console.log(sequelize.config);

module.exports = sequelize;