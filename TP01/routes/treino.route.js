const express = require('express');
const router = express.Router();
const login = require('../middleware/login.middleware');

const treinoController = require('../controllers/treino.controller');

router.get(
    '/',
    login.required,
    treinoController.getTiposTreinos
);

module.exports = router;