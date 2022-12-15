const mysql = require('../../mysql');
const utils = require('../../utils');

exports.getDiasSemana = async (req, res, next) => {
    try {
        const resultado = await mysql.execute(`
            SELECT * FROM tp01_dias_semanas;
        `);
        return res.status(200).send({resultado: resultado});
    } catch (error) {
        utils.getError(error);
        return res.status(500).send({ error: error });
    }
}