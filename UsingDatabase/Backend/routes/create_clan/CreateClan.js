const ClanUtils = require('./../../db_utils/CalnUtils');
const express = require('express');
const router = express.Router();

router.post('/', async function createClan(req, res){
    console.log(JSON.stringify(req.body));
    const doer_username = req.body.loged_in_user;
    const clan_name = req.body.clan_name;
    const slogan = req.body.slogan;
    const default_building = req.body.default_building;

    await ClanUtils.createClan(clan_name, slogan, default_building, doer_username);

    res.status(200).send('clan created');
});

module.exports = router;