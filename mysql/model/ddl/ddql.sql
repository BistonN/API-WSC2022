-- -----------------------------------------------------
-- Schema wsdb
-- -----------------------------------------------------
DROP DATABASE IF EXISTS wsdb;
CREATE SCHEMA IF NOT EXISTS wsdb DEFAULT CHARACTER SET utf8 ;
USE wsdb ;

-- -----------------------------------------------------
-- Table wsdb.users
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS wsdb.users (
  id_user INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(200) NOT NULL,
  email VARCHAR(200) NOT NULL,
  password VARCHAR(200) NOT NULL,
  wscoins INT NOT NULL DEFAULT 0,
  created DATETIME NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (id_user))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table wsdb.products
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS wsdb.products (
  id_product INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  description VARCHAR(200) NOT NULL,
  img_url VARCHAR(200) NOT NULL,
  created DATETIME NOT NULL DEFAULT current_timestamp(),
  id_user_created INT NOT NULL,
  PRIMARY KEY (id_product),
  INDEX fk_products_users1_idx (id_user_created ASC) ,
  CONSTRAINT fk_products_users1
    FOREIGN KEY (id_user_created)
    REFERENCES wsdb.users (id_user)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table wsdb.purchases_historic
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS wsdb.purchases_historic (
  purchase_history INT NOT NULL AUTO_INCREMENT,
  id_user INT NOT NULL,
  id_product INT NOT NULL,
  PRIMARY KEY (purchase_history),
  INDEX fk_purchases_historic_users_idx (id_user ASC) ,
  INDEX fk_purchases_historic_products1_idx (id_product ASC) ,
  CONSTRAINT fk_purchases_historic_users
    FOREIGN KEY (id_user)
    REFERENCES wsdb.users (id_user)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_purchases_historic_products1
    FOREIGN KEY (id_product)
    REFERENCES wsdb.products (id_product)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
