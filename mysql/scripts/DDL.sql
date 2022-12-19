-- -----------------------------------------------------
-- Schema wscdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS wscdb ;

-- -----------------------------------------------------
-- Schema wscdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS wscdb DEFAULT CHARACTER SET utf8 ;
USE wscdb ;

-- -----------------------------------------------------
-- Table wscdb.tp01_usuarios
-- -----------------------------------------------------
DROP TABLE IF EXISTS wscdb.tp01_usuarios ;

-- TP01

CREATE TABLE IF NOT EXISTS wscdb.tp01_usuarios (
  id_usuario INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(200) NOT NULL,
  email VARCHAR(200) NOT NULL,
  usuario VARCHAR(200) NOT NULL,
  senha VARCHAR(200) NOT NULL,
  celular VARCHAR(45) NOT NULL,
  dt_nascimento DATE NULL,
  peso FLOAT NULL,
  altura FLOAT NULL,
  dt_criacao DATETIME NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (id_usuario))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table wscdb.tp01_treinos
-- -----------------------------------------------------
DROP TABLE IF EXISTS wscdb.tp01_treinos ;

CREATE TABLE IF NOT EXISTS wscdb.tp01_treinos (
  id_treino INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_treino))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table wscdb.tp01_dias_semanas
-- -----------------------------------------------------
DROP TABLE IF EXISTS wscdb.tp01_dias_semanas ;

CREATE TABLE IF NOT EXISTS wscdb.tp01_dias_semanas (
  id_dia_semana INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  sigla CHAR(3) NOT NULL,
  codigo CHAR(1) NOT NULL,
  PRIMARY KEY (id_dia_semana))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table wscdb.tp01_treinos_semanais
-- -----------------------------------------------------
DROP TABLE IF EXISTS wscdb.tp01_treinos_semanais ;

CREATE TABLE IF NOT EXISTS wscdb.tp01_treinos_semanais (
  id_treino_semanal INT NOT NULL AUTO_INCREMENT,
  id_usuario INT NOT NULL,
  id_treino INT NOT NULL,
  id_dia_semana INT NOT NULL,
  PRIMARY KEY (id_treino_semanal),
  INDEX fk_treinos_semanais_tp01_usuarios_idx (id_usuario ASC) VISIBLE,
  INDEX fk_treinos_semanais_treinos1_idx (id_treino ASC) VISIBLE,
  INDEX fk_treinos_semanais_dias_semanas1_idx (id_dia_semana ASC) VISIBLE,
  CONSTRAINT fk_treinos_semanais_tp01_usuarios
    FOREIGN KEY (id_usuario)
    REFERENCES wscdb.tp01_usuarios (id_usuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_treinos_semanais_treinos1
    FOREIGN KEY (id_treino)
    REFERENCES wscdb.tp01_treinos (id_treino)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_treinos_semanais_dias_semanas1
    FOREIGN KEY (id_dia_semana)
    REFERENCES wscdb.tp01_dias_semanas (id_dia_semana)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- TP02

CREATE TABLE IF NOT EXISTS wscdb.tp02_corridas_caminhadas (
  id_corrida_caminhada INT NOT NULL AUTO_INCREMENT,
  data_hora DATETIME NOT NULL,
  distancia FLOAT NOT NULL,
  tempo TIME NOT NULL,
  criado DATETIME NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (id_corrida_caminhada))
ENGINE = InnoDB;

-- TP03

-- -----------------------------------------------------
-- Table wscdb.tp03_usuarios
-- -----------------------------------------------------
DROP TABLE IF EXISTS wscdb.tp03_usuarios ;

CREATE TABLE IF NOT EXISTS wscdb.tp03_usuarios (
  id_usuario INT NOT NULL AUTO_INCREMENT,
  email VARCHAR(200) NOT NULL,
  usuario VARCHAR(200) NOT NULL,
  senha VARCHAR(200) NOT NULL,
  wscoins FLOAT NOT NULL DEFAULT 0,
  PRIMARY KEY (id_usuario))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table wscdb.tp04_usuarios
-- -----------------------------------------------------
DROP TABLE IF EXISTS wscdb.tp04_usuarios ;

CREATE TABLE IF NOT EXISTS wscdb.tp04_usuarios (
  id_usuario INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(200) NOT NULL,
  email VARCHAR(200) NOT NULL,
  senha VARCHAR(200) NOT NULL,
  saldo FLOAT NOT NULL DEFAULT 0,
  dt_criacao DATETIME NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (id_usuario))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table wscdb.tp04_produtos
-- -----------------------------------------------------
DROP TABLE IF EXISTS wscdb.tp04_produtos ;

CREATE TABLE IF NOT EXISTS wscdb.tp04_produtos (
  id_produto INT NOT NULL AUTO_INCREMENT,
  nome MEDIUMTEXT NOT NULL,
  descricao LONGTEXT NOT NULL,
  img_url VARCHAR(200) NOT NULL,
  preco FLOAT NOT NULL,
  id_usuario_created INT NOT NULL,
  dt_criacao DATETIME NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (id_produto),
  INDEX fk_products_users1_idx (id_usuario_created ASC) VISIBLE,
  CONSTRAINT fk_products_users1
    FOREIGN KEY (id_usuario_created)
    REFERENCES wscdb.tp04_usuarios (id_usuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table wscdb.tp_04_historico_compra
-- -----------------------------------------------------
DROP TABLE IF EXISTS wscdb.tp_04_historico_compra ;

CREATE TABLE IF NOT EXISTS wscdb.tp_04_historico_compra (
  id_historico_compra INT NOT NULL AUTO_INCREMENT,
  id_usuario INT NOT NULL,
  id_produto INT NOT NULL,
  PRIMARY KEY (id_historico_compra),
  INDEX fk_purchases_historic_users_idx (id_usuario ASC) VISIBLE,
  INDEX fk_purchases_historic_products1_idx (id_produto ASC) VISIBLE,
  CONSTRAINT fk_purchases_historic_users
    FOREIGN KEY (id_usuario)
    REFERENCES wscdb.tp04_usuarios (id_usuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_purchases_historic_products1
    FOREIGN KEY (id_produto)
    REFERENCES wscdb.tp04_produtos (id_produto)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;