const mssql = require('mssql');

const config = {
    database: 'TRAVIANS',
    server: 'localhost',
    user: 'sahar',
    password: '123'
};

mssql.connect(config, function (err) {
    if (err) console.log(err);
    var req = new mssql.Request();
    req.query('SELECT * FROM UserData')
    console.log(recordset);
});

// module.exports = sequelize;