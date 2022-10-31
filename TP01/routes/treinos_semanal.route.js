const express = require('express');
const router = express.Router();
const login = require('../middleware/login.middleware');

const treinoSemanalController = require('../controllers/treinos_semanal.controller');

router.post(
    '/:nome_treino',
    login.required,
    treinoSemanalController.cadastrarTreinoSemanal
);

module.exports = router;