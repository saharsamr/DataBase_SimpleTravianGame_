const Sequelize = require('sequelize');
const sequelize = require('./DBConnection');

async function createClan(clan_name, slogan, default_building, doer_username) {
    await sequelize.query("EXEC dbo.AddClan :clan_name, :slogan, :default_building, :doer",
        {
            replacements: {
                clan_name: clan_name,
                slogan: slogan,
                default_building: default_building,
                doer: doer_username
            }
        });
}

module.exports = {
    createClan: createClan,
};