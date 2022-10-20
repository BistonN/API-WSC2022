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
-- Table wscdb.usuarios
-- -----------------------------------------------------
DROP TABLE IF EXISTS wscdb.usuarios ;

CREATE TABLE IF NOT EXISTS wscdb.usuarios (
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
-- Table wscdb.treinos
-- -----------------------------------------------------
DROP TABLE IF EXISTS wscdb.treinos ;

CREATE TABLE IF NOT EXISTS wscdb.treinos (
  id_treino INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_treino))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table wscdb.dias_semanas
-- -----------------------------------------------------
DROP TABLE IF EXISTS wscdb.dias_semanas ;

CREATE TABLE IF NOT EXISTS wscdb.dias_semanas (
  id_dia_semana INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  sigla CHAR(3) NOT NULL,
  codigo CHAR(1) NOT NULL,
  PRIMARY KEY (id_dia_semana))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table wscdb.treinos_semanais
-- -----------------------------------------------------
DROP TABLE IF EXISTS wscdb.treinos_semanais ;

CREATE TABLE IF NOT EXISTS wscdb.treinos_semanais (
  id_treino_semanal INT NOT NULL AUTO_INCREMENT,
  id_usuario INT NOT NULL,
  id_treino INT NOT NULL,
  id_dia_semana INT NOT NULL,
  PRIMARY KEY (id_treino_semanal),
  INDEX fk_treinos_semanais_usuarios_idx (id_usuario ASC) VISIBLE,
  INDEX fk_treinos_semanais_treinos1_idx (id_treino ASC) VISIBLE,
  INDEX fk_treinos_semanais_dias_semanas1_idx (id_dia_semana ASC) VISIBLE,
  CONSTRAINT fk_treinos_semanais_usuarios
    FOREIGN KEY (id_usuario)
    REFERENCES wscdb.usuarios (id_usuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_treinos_semanais_treinos1
    FOREIGN KEY (id_treino)
    REFERENCES wscdb.treinos (id_treino)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_treinos_semanais_dias_semanas1
    FOREIGN KEY (id_dia_semana)
    REFERENCES wscdb.dias_semanas (id_dia_semana)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;