const express = require('express');
const router = express.Router();
const login = require('../middleware/login.middleware');
const multer = require('multer');

const usuarioController = require('../controllers/usuario.controller');
const produtoController = require('../controllers/produto.controller');

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
    '/',
    login.required,
    upload.single('imagem'),
    produtoController.cadastrarProduto
);

router.get(
    '/',
    login.required,
    produtoController.getProdutosDisponiveis
);

router.delete(
    '/:id_produto',
    login.required,
    produtoController.verificaProduto,
    produtoController.deleteProduto
);

router.post(
    '/comprar/:id_produto',
    login.required,
    produtoController.verificaProduto,
    usuarioController.getDadosUsuario,
    produtoController.comprarProduto
);

module.exports = router;