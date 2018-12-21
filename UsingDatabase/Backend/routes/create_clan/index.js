const express = require('express');
const router = express.Router();
const createClan = require('./CreateClan');

router.use('/', createClan);

module.exports = router;