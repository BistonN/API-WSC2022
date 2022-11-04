const express = require('express');
const router = express.Router();
const login = require('../middleware/login.middleware');

const diasSemanasController = require('../controllers/diasSemana.controller');

router.get(
    '/',
    login.required,
    diasSemanasController.getDiasSemana
);

module.exports = router;