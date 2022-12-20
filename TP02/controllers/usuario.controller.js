const mysql = require('../../mysql');
const bcrypt = require('bcrypt');
const utils = require('../../utils');
const api_config = require('../../utils').getApiConfig();
const jwt = require('jsonwebtoken');

exports.verificarUsuario = async (req, res, next) => {
    try {
        const verificarUsuario = await mysql.execute(
            `SELECT id_usuario FROM tp02_usuarios WHERE usuario = ?;`,
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
                `SELECT *
                   FROM tp02_usuarios 
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
                nome: res.locals.usuario.nome,
            }, api_config.jwt_key);
            return res.status(200).send({
                message: 'Autenticado com sucesso',
                token: token,
                email: res.locals.usuario.email,
                id_usuario: res.locals.usuario.id_usuario,
                nome: res.locals.usuario.nome,
            });
        } else {
            return res.status(401).send({ message: 'Falha na autenticação' });
        }
    } catch (error) {
        utils.getError(error);
        return res.status(500).send({ error: error });
    }
}