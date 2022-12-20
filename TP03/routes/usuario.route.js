const express = require('express');
const router = express.Router();

const usuarioController = require('../controllers/usuario.controller');
const login = require('../middleware/login.middleware');

router.get('/',
    login.required,
    usuarioController.getDadosUsuario,
    usuarioController.retornarDadosUsuario
);

router.post(
    '/login',
    usuarioController.verificarUsuario,
    usuarioController.getDadosUsuario,
    usuarioController.login
);

router.put(
    '/wscoins',
    login.required,
    usuarioController.verificarWSCoins,
    usuarioController.atualizarWSCoins
);

module.exports = router;