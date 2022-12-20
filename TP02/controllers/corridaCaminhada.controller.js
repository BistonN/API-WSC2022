const mysql = require('../../mysql');
const utils = require('../../utils');

exports.cadastrarCorridaCaminhada = async (req, res, next) => {
    try {
        const resultado = await mysql.execute(`
            INSERT INTO tp02_corridas_caminhadas(data_hora, distancia, tempo, id_usuario)
            VALUES(?, ?, ?, ?);
        `, [req.body.data_hora, req.body.distancia, req.body.tempo, res.locals.id_usuario]);
        res.status(200).send({
            resultado: resultado,
            mensagem: 'Atividade cadastrada com Sucesso!'
        });
    } catch (error) {
        utils.getError(error);
        return res.status(500).send({ error: error });
    }
}