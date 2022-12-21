const nodemon = require("nodemon");
const { env } = require("process");

exports.getApiConfig = () => {
const envNodemon = require('./nodemon.json');

    return {
        jwt_key: envNodemon.env.JWT_KEY,
        url_dominio: envNodemon.env.URL_DOMINIO,
        port: 3000,
        web_mysql_user: envNodemon.env.MYSQL_USER,
        web_mysql_password: envNodemon.env.MYSQL_PASSWORD,
        web_mysql_database: envNodemon.env.MYSQL_DATABASE,
        web_mysql_host: envNodemon.env.MYSQL_HOST,
        mysql_port: 3306
    };
}

exports.getError = (error) => {
    if (error) {
        console.error(error);
        return true;
    }
};

exports.formatarUrl = (url) => {
    return (this.getApiConfig().url_dominio + '\\' + url).replace(/[\\"]/g, '/');
}