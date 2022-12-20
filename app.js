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
const tp02usuarioController = require('./TP02/routes/usuario.route');
const tp02corridaCaminhadaRoute = require('./TP02/routes/corridaCaminhada.route');

// routes-controllers TP03
const tp03usuarioRoute = require('./TP03/routes/usuario.route');

// routes-controllers TP04
const tp04usuarioRoute = require('./TP04/routes/usuario.route');
const tp04produtoRoute = require('./TP04/routes/produto.route');

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

//public images
app.use('/assets', express.static('./assets'));

// routes TP01
app.use('/tp01/usuarios', tp01usuarioRoute);
app.use('/tp01/treinos', tp01treinoRoute);
app.use('/tp01/dias_semanas', tp01diasSemanaRoute);
app.use('/tp01/treinos_semanais', tp01treinoSemanalRoute);

// routes TP02
app.use('/tp02/usuarios', tp02usuarioController);
app.use('/tp02/corridas_caminhadas', tp02corridaCaminhadaRoute);

// routes TP03
app.use('/tp03/usuarios', tp03usuarioRoute);

// routes TP04
app.use('/tp04/usuarios', tp04usuarioRoute);
app.use('/tp04/produtos', tp04produtoRoute);

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