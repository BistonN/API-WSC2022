const mysql = require('../../mysql');
const utils = require('../../utils');
const bcrypt = require('bcrypt');
const api_config = require('../../utils').getApiConfig();
const jwt = require('jsonwebtoken');

exports.atualizarWSCoins = async (req, res, next) => {
    try {
        const resultado = await mysql.execute(`
            UPDATE tp03_usuarios
               SET wscoins       = wscoins + ?
             WHERE id_usuario    = ?;
        `, [req.body.wscoins, res.locals.id_usuario]);
        return res.status(200).send({resultado: resultado, mensagem: 'WSCoins atualizado com sucesso!'});
    } catch (error) {
        utils.getError(error);
        return res.status(500).send({ error: error });
    }
}

exports.verificarUsuario = async (req, res, next) => {
    try {
        const verificarUsuario = await mysql.execute(
            `SELECT id_usuario FROM tp03_usuarios WHERE usuario = ?;`,
            [req.body.usuario]
        );
        if (verificarUsuario.length >= 1) {
            res.locals.id_usuario = verificarUsuario[0].id_usuario;
        }
        next();
    } catch (error) {
        utils.getError(error);
        return res.status(500).send({ error: error });
    }
}


exports.getDadosUsuario = async (req, res, next) => {
    try {
        if (res.locals.id_usuario) {
            const dadosUsuarios = await mysql.execute(
                `SELECT id_usuario, 
                    usuario, 
                    email, 
                    wscoins,
                    senha
               FROM tp03_usuarios 
              WHERE id_usuario = ?`,
                [res.locals.id_usuario]
            );
            res.locals.usuario = dadosUsuarios[0];
            next();
        } else {
            return res.status(404).send({ mensagem: 'Usuário não encontrado!' });
        }
    } catch (error) {
        utils.getError(error);
        return res.status(500).send({ error: error });
    }
}

exports.login = async (req, res) => {
    if (res.locals.usuario.length < 1) {
        return res.status(401).send({ message: 'Usuário não cadastrado' });
    }
    try {
        const match = await bcrypt.compare(req.body.senha, res.locals.usuario.senha)
        if (match) {
            const token = jwt.sign({
                email: res.locals.usuario.email,
                id_usuario: res.locals.usuario.id_usuario,
                nome: res.locals.usuario.usuario,
            }, api_config.jwt_key);
            return res.status(200).send({
                message: 'Autenticado com sucesso',
                token: token,
                email: res.locals.usuario.email,
                id_usuario: res.locals.usuario.id_usuario,
                nome: res.locals.usuario.usuario,
            });
        } else {
            return res.status(401).send({ message: 'Falha na autenticação' });
        }
    } catch (error) {
        utils.getError(error);
        return res.status(500).send({ error: error });
    }
}

exports.verificarWSCoins = async (req, res, next) => {
    try {
        const resultado = await mysql.execute(`SELECT wscoins FROM tp03_usuarios WHERE id_usuario = ?`,
        [res.locals.id_usuario]);
        res.locals.wscoins = resultado[0].wscoins;
        if (res.locals.wscoins + req.body.wscoins < 0) {
            return res.status(406).send({mensagem: `Saldo Insuficiente para Operação!\n Saldo atual: ${res.locals.wscoins}`});
        }
        next();
    } catch (error) {
        utils.getError(error);
        return res.status(500).send({ error: error });
    }
}

exports.retornarDadosUsuario = (req, res, next) => {
    delete res.locals.usuario['senha'];
    try {
        return res.status(200).send({usuario: res.locals.usuario});
    } catch (error) {
        utils.getError(error);
        return res.status(500).send({ error: error }); 
    }
}