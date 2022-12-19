const express = require('express');
const router = express.Router();
const login = require('../middleware/login.middleware');

const usuarioController = require('../controllers/usuario.controller');

router.post(
    '/login',
    usuarioController.verificarUsuario,
    usuarioController.getDadosUsuario,
    usuarioController.login
);

router.get(
    '/',
    login.required,
    usuarioController.getDadosUsuario,
    usuarioController.returnDados
);

module.exports = router;