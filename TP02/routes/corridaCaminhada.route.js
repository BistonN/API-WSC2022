const express = require('express');
const router = express.Router();
const login = require('../middleware/login.middleware');

const corridaCaminhadaController = require('../controllers/corridaCaminhada.controller');

router.post(
    '/',
    login.required,
    corridaCaminhadaController.cadastrarCorridaCaminhada
);

module.exports = router;