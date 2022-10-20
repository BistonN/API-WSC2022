# API-WSC2022
## ⌨Instalação
Cada pasta contem a API referente a um módulo da competição nascional. E antes de rodas e instalar as dependencias, necessita-se de um banco de dados MySQL.
 1. Rodar Arquivo de Criação e Abastecimento do Banco de Dados
 Rodar em 1°: `API-WSC2022/<pasta-do-módulo>/mysql/scripts/DDL.sql`
 Rodar em 2°: `API-WSC2022/<pasta-do-módulo>/mysql/scripts/DML.sql`

2. Criar um arquivo de configuração de variáveis de ambiente na raiz da pasta do módulo chamado `nodemon.json` (Ex: `API-WSC2022/<pasta-do-módulo>/nodemon.json`), onde deve estar de acordo com os atributos a seguir:
    ```json
    {
        "env" : {        
            "MYSQL_USER": "<usuario-banco-de-dados>",
            "MYSQL_PASSWORD": "<senha-bando-de-dados>",
            "MYSQL_DATABASE": "<nome-banco-de-dados>",
            "MYSQL_HOST":  "<host-banco-de-dados>"
        }
    }
    ```
Os nomes dos Bancos criados sempre são wsdb seguido do numero do módulo. Ex: `wsdb_tp01`

3. Instalar as depencias do Projeto
    ```sh
    npm install
    ```

## 🔰Inicialização
```sh
npm sstart
```