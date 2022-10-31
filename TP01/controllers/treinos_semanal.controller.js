const mysql = require('../../mysql');
const utils = require('./utils.controller');

exports.cadastrarTreinoSemanal = async (req, res, next) => {
    try {
        const resultado = await mysql.execute(`
            INSERT INTO treinos_semanais(
                id_usuario, 
                id_treino, 
                id_dia_semana
            ) VALUES(
                ?,
                (SELECT id_treino FROM treinos WHERE nome LIKE ?),
                (SELECT id_dia_semana FROM dias_semanas WHERE nome LIKE ?)
            );
        `, [res.locals.id_usuario, req.params.nome_treino, req.body.nome_dia_semana]);
        return res.status(200).send({ resultado: resultado, mensagem: 'Treino Inserido com Sucesso!' });
    } catch (error) {
        utils.getError(error);
        return res.status(500).send({ error: error });
    }
}