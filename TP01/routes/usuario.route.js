const express = require('express');
const router = express.Router();
const multer = require('multer');

const login = require('../middleware/login.middleware');
const usuarioController = require('../controllers/usuario.controller');

const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, './assets');
    },
    filename: (req, file, cb) => {
        cb(null, new Date().getTime() + '-' + file.originalname);
    }
});
const upload = multer({
    storage: storage
});

router.post(
    '/cadastro',
    usuarioController.verificarUsuario,
    upload.single('imagem'),
    usuarioController.registrarUsuario
);

router.post(
    '/login',
    usuarioController.verificarUsuario,
    usuarioController.getDadosUsuario,
    usuarioController.login
);

router.put(
    '/',
    login.required,
    usuarioController.atualizarDadosUsuario
);

router.get(
    '/',
    login.required,
    usuarioController.getDadosUsuario,
    usuarioController.returnDadosUsuario
);

module.exports = router;