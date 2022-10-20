const mysql = require('../mysql');
const utils = require('./utils.controller');

exports.getTiposTreinos = async (req, res, next) => {
    try {
        const resultado = await mysql.execute(`SELECT * FROM treinos`);
        return res.status(200).send({resultado: resultado })
    } catch (error) {
        utils.getError(error);
        return res.status(500).send({ error: error });
    }
}