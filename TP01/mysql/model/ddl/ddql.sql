-- -----------------------------------------------------
-- Schema wsdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS wsdb ;

-- -----------------------------------------------------
-- Schema wsdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS wsdb DEFAULT CHARACTER SET utf8 ;
USE wsdb ;

-- -----------------------------------------------------
-- Table wsdb.usuarios
-- -----------------------------------------------------
DROP TABLE IF EXISTS wsdb.usuarios ;

CREATE TABLE IF NOT EXISTS wsdb.usuarios (
  id_usuario INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(200) NOT NULL,
  email VARCHAR(200) NOT NULL,
  senha VARCHAR(200) NOT NULL,
  saldo FLOAT NOT NULL DEFAULT 0,
  celular VARCHAR(45),
  usuario VARCHAR(45) NOT NULL,
  dt_criacao DATETIME NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (id_usuario))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table wsdb.produtos
-- -----------------------------------------------------
DROP TABLE IF EXISTS wsdb.produtos ;

CREATE TABLE IF NOT EXISTS wsdb.produtos (
  id_produto INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  descricao MEDIUMTEXT NOT NULL,
  img_url VARCHAR(200) NOT NULL,
  preco FLOAT NOT NULL,
  id_usuario_created INT NOT NULL,
  dt_criacao DATETIME NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (id_produto),
  INDEX fk_products_users1_idx (id_usuario_created ASC) VISIBLE,
  CONSTRAINT fk_products_users1
    FOREIGN KEY (id_usuario_created)
    REFERENCES wsdb.usuarios (id_usuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table wsdb.historico_compra
-- -----------------------------------------------------
DROP TABLE IF EXISTS wsdb.historico_compra ;

CREATE TABLE IF NOT EXISTS wsdb.historico_compra (
  id_historico_compra INT NOT NULL AUTO_INCREMENT,
  id_usuario INT NOT NULL,
  id_produto INT NOT NULL,
  PRIMARY KEY (id_historico_compra),
  INDEX fk_purchases_historic_users_idx (id_usuario ASC) VISIBLE,
  INDEX fk_purchases_historic_products1_idx (id_produto ASC) VISIBLE,
  CONSTRAINT fk_purchases_historic_users
    FOREIGN KEY (id_usuario)
    REFERENCES wsdb.usuarios (id_usuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_purchases_historic_products1
    FOREIGN KEY (id_produto)
    REFERENCES wsdb.produtos (id_produto)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;