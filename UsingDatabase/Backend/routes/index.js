const express = require('express');
const router = express.Router();
const createClan = require('./create_clan');

router.use('/createClan', createClan);

module.exports = router;
