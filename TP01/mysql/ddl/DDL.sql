-- -----------------------------------------------------
-- Schema wsdb_tp01
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS wsdb_tp01 ;

-- -----------------------------------------------------
-- Schema wsdb_tp01
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS wsdb_tp01 DEFAULT CHARACTER SET utf8 ;
USE wsdb_tp01 ;

-- -----------------------------------------------------
-- Table wsdb_tp01.usuarios
-- -----------------------------------------------------
DROP TABLE IF EXISTS wsdb_tp01.usuarios ;

CREATE TABLE IF NOT EXISTS wsdb_tp01.usuarios (
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
-- Table wsdb_tp01.treinos
-- -----------------------------------------------------
DROP TABLE IF EXISTS wsdb_tp01.treinos ;

CREATE TABLE IF NOT EXISTS wsdb_tp01.treinos (
  id_treino INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_treino))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table wsdb_tp01.dias_semanas
-- -----------------------------------------------------
DROP TABLE IF EXISTS wsdb_tp01.dias_semanas ;

CREATE TABLE IF NOT EXISTS wsdb_tp01.dias_semanas (
  id_dia_semana INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  sigla CHAR(3) NOT NULL,
  codigo CHAR(1) NOT NULL,
  PRIMARY KEY (id_dia_semana))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table wsdb_tp01.treinos_semanais
-- -----------------------------------------------------
DROP TABLE IF EXISTS wsdb_tp01.treinos_semanais ;

CREATE TABLE IF NOT EXISTS wsdb_tp01.treinos_semanais (
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
    REFERENCES wsdb_tp01.usuarios (id_usuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_treinos_semanais_treinos1
    FOREIGN KEY (id_treino)
    REFERENCES wsdb_tp01.treinos (id_treino)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_treinos_semanais_dias_semanas1
    FOREIGN KEY (id_dia_semana)
    REFERENCES wsdb_tp01.dias_semanas (id_dia_semana)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;