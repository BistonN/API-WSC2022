const mysql = require('../../mysql');
const utils = require('../../utils');

exports.cadastrarCorridaCaminhada = async (req, res, next) => {
    try {
        const resultado = await mysql.execute(`
            INSERT INTO corridas_caminhadas(data_hora, distancia, tempo)
            VALUES(?, ?, ?);
        `, [req.body.data_hora, req.body.distancia, req.body.tempo]);
        res.status(200).send({
            'resultado': resultado,
            mensagem: 'Atividade cadastrada com Sucesso!'
        });
    } catch (error) {
        utils.getError(error);
        return res.status(500).send({ error: error });
    }
}