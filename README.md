# API-WSC2022
## ⌨Instalação
Para a criação do banco de dados:
 1. Rodar Arquivo de Criação e Abastecimento do Banco de Dados
 Rodar em 1°: `API-WSC2022/mysql/scripts/DDL.sql`
 Rodar em 2°: `API-WSC2022/mysql/scripts/DML.sql`

2. Criar um arquivo de configuração de variáveis de ambiente na raiz do projeto chamado `nodemon.json` (Ex: `API-WSC2022/nodemon.json`), onde deve estar de acordo com os atributos a seguir:
    ```json
    {
        "env" : {        
            "MYSQL_USER": "<usuario-banco-de-dados>",
            "MYSQL_PASSWORD": "<senha-bando-de-dados>",
            "MYSQL_DATABASE": "wscdb",
            "MYSQL_HOST":  "<host-banco-de-dados>",
            "JWT_KEY": "<codigo-para-jwt>",
            "URL_DOMINIO": "<host-do-servico>"
        }
    }
3. Instalar as depencias do Projeto
    ```sh
    npm install
    ```

## 🔰Inicialização
```sh
npm start
```

### Documentação:
https://documenter.getpostman.com/view/5769454/2s847PMAsU