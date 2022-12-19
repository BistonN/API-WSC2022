const express = require('express');
const router = express.Router();
const login = require('../middleware/login.middleware');
const multer = require('multer');

const produtorController = require('../controllers/produto.controller');

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
    produtorController.cadastrarProduto
)

module.exports = router;