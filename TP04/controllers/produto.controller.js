const mysql = require('../../mysql');
const utils = require('../../utils');

exports.cadastrarProduto = async (req, res, next) => {
    try {
        if (!req.file) {
            return res.status('406').send({ mensagem: 'Produto sem imagem!' });
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

exports.getProdutosDisponiveis = async (req, res, next) => {
    try {
        const resultado = await mysql.execute(`
            SELECT p.id_produto,
                   p.nome,
                   p.descricao,
                   p.img_url,
                   p.preco,
                   p.id_usuario_created,
                   u.nome  AS nome_usuario_created,
                   u.email AS email_usuario_created
              FROM tp04_produtos AS p
        INNER JOIN tp04_usuarios AS u
                ON p.id_usuario_created = u.id_usuario
             WHERE p.id_produto NOT IN (
                SELECT id_produto 
                  FROM tp_04_historico_compra
            );
        `);
        const urlDominio = utils.getApiConfig().url_dominio;
        resultado.map(r => r.img_url = urlDominio + r.img_url);
        return res.status(200).send({
            mensagem: 'Produtos disponíveis consultado com sucesso!',
            resultado: resultado
        });
    } catch (error) {
        utils.getError(error);
        return res.status(500).send({ error: error.message });
    }
}

exports.verificaProduto = async (req, res, next) => {
    try {
        const resultado = await mysql.execute(`
            SELECT * 
              FROM tp04_produtos 
             WHERE id_produto = ?
               AND id_produto NOT IN (
                    SELECT id_produto
                      FROM tp_04_historico_compra  
               );
        `,[req.params.id_produto]);
        if (resultado.length == 0) {
            return res.status(404).send({ mensagem: 'ID Produto não encontrado/disponível' });
        }
        next();
    } catch (error) {
        utils.getError(error);
        return res.status(500).send({ error: error });
    }
}

exports.deleteProduto = async (req, res, next) => {
    try {
        const resultado = await mysql.execute(`
            DELETE FROM tp04_produtos
             WHERE id_produto = ?;
        `, [req.params.id_produto]);
        return res.status(200).send({
            mensagem: 'Produto apagado com sucesso!',
            resultado: resultado
        });
    } catch (error) {
        utils.getError(error);
        return res.status(500).send({ error: error });
    }
}

exports.comprarProduto = async (req, res, next) => {
    try {
        if(res.locals.usuario.saldo < req.body.preco) {
            return res.status(402).send({
                mensagem: 'Saldo Insuficiente!'
            });
        }
        const resultado = await mysql.execute(`
            INSERT INTO tp_04_historico_compra(id_usuario, id_produto)
            VALUES(?, ?);

            UPDATE tp04_usuarios SET saldo = saldo - ?;
        `, [res.locals.id_usuario, req.params.id_produto, req.body.preco], mysql.pool_multi);
        return res.status(200).send({
            mensagem: 'Produto comprado com Sucesso!',
            resultado: resultado
        });
    } catch (error) {
        utils.getError(error);
        return res.status(500).send({ error: error });
    }
}