const express = require('express');
const app = express();
const morgan = require('morgan');
const bodyParser = require('body-parser');
const helmet = require('helmet');

// routes-controllers TP01
const tp01usuarioRoute = require('./TP01/routes/usuario.route');
const tp01treinoRoute = require('./TP01/routes/treino.route');
const tp01diasSemanaRoute = require('./TP01/routes/diasSemana.route');
const tp01treinoSemanalRoute = require('./TP01/routes/treinosSemanal.route');

// routes-controllers TP02
const corridaCaminhadaRoute = require('./TP02/routes/corridaCaminhada.route');

// routes-controllers TP03
const tp03usuarioRoute = require('./TP03/routes/usuario.route');

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
app.use('/tp01/usuario', tp01usuarioRoute);
app.use('/tp01/treino', tp01treinoRoute);
app.use('/tp01/dia_semana', tp01diasSemanaRoute);
app.use('/tp01/treino_semanal', tp01treinoSemanalRoute);


// routes TP02
app.use('tp02/corrida_caminhada', corridaCaminhadaRoute);

// routes TP02
app.use('/tp03/usuario', tp03usuarioRoute);

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