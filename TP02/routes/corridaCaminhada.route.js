const express = require('express');
const router = express.Router();

const corridaCaminhadaController = require('../controllers/corridaCaminhada.controller');

router.post(
    '/',
    corridaCaminhadaController.cadastrarCorridaCaminhada
);

module.exports = router;