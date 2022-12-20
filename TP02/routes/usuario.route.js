const express = require('express');
const router = express.Router();

const usuarioController = require('../controllers/usuario.controller');

router.post(
    '/login',
    usuarioController.verificarUsuario,
    usuarioController.getDadosUsuario,
    usuarioController.login
);

module.exports = router;