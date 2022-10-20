const express = require('express');
const router = express.Router();
const login = require('../middleware/login.middleware');

const diasSemanasController = require('../controllers/dias_semana.controller');

router.get(
    '/',
    login.required,
    diasSemanasController.getDiasSemana
);

module.exports = router;