const mysql = require('../../mysql');
const utils = require('../../utils');

exports.cadastrarProduto = async (req, res, next) => {
    try {
        if (!req.file) {
            return res.status('406').send({mensagem: 'Produto sem imagem!'});
        }
        const resultado = await mysql.execute(`
            INSERT INTO tp04_produtos(nome, descricao, img_url, preco, id_usuario_created)
            VALUES(?, ?, ?, ?, ?)
        `, [req.body.nome, req.body.descricao, req.file.path, req.body.preco, res.locals.id_usuario]);
        return res.status(201).send({
            mensagem: 'Produto inserido com Sucesso!',
            resultado: resultado,
            path: req.file.path
        });
    } catch (error) {
        utils.getError(error);
        return res.status(500).send({ error: error.message });
    }

}