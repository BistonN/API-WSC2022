const express = require('express');
const app = express();
const morgan = require('morgan');
const bodyParser = require('body-parser');
const helmet = require('helmet');

// routes-controllers TP01
const usuarioRoute = require('./TP01/routes/usuario.route');
const treinoRoute = require('./TP01/routes/treino.route');
const diasSemanaRoute = require('./TP01/routes/diasSemana.route');
const treinoSemanalRoute = require('./TP01/routes/treinosSemanal.route');

// routes-controllers TP02
// const corridaCaminhadaRoute = require('./TP01 copy/routes/corridaCaminhada.route');

app.use(morgan('dev'));

app.use(helmet());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.use((req, res, next) => {
    res.header('Access-Control-Allow-Origin', '*'); 
    res.header(
        'Access-Control-Allow-Headers',
        'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    );

    if (req.method === 'OPTIONS') {
        res.header('Access-Control-Allow-Methods', 'PUT, POST, PATCH, DELETE, GET');
        return res.status(200).json({});
    }
    next();
});

// routes TP01
app.use('/usuario', usuarioRoute);
app.use('/treino', treinoRoute);
app.use('/dia_semana', diasSemanaRoute);
app.use('/treino_semanal', treinoSemanalRoute);

// routes TP02
// app.use('/corrida_caminhada', corridaCaminhadaRoute);

app.use((req, res, next) => {
    const error = new Error('Not found...');
    error.status = 404;
    next(error);
});

app.use((error, req, res) => {
    res.status(error.status || 500);
    res.json({
        error: {
            message: error.message
        }
    });
});

module.exports = app;