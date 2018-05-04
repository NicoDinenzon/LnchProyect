SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Local`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Local` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Local` (
  `idLocal` INT NOT NULL AUTO_INCREMENT,
  `TipoC` VARCHAR(45) NOT NULL,
  `NombreLocal` VARCHAR(45) NOT NULL,
  `Telefono` INT NULL,
  `Lat` DOUBLE NULL,
  `Lng` DOUBLE NULL,
  PRIMARY KEY (`idLocal`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Valoracion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Valoracion` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Valoracion` (
  `IdValoracion` INT NOT NULL AUTO_INCREMENT,
  `IdLocal` VARCHAR(45) NOT NULL,
  `IdUsuario` INT NOT NULL,
  `Valoracion` INT NULL,
  `Comentario` VARCHAR(500) NULL,
  `Local_idLocal` INT NOT NULL,
  PRIMARY KEY (`IdValoracion`),
  INDEX `fk_Valoracion_Local1_idx` (`Local_idLocal` ASC),
  CONSTRAINT `fk_Valoracion_Local1`
    FOREIGN KEY (`Local_idLocal`)
    REFERENCES `mydb`.`Local` (`idLocal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Usuario` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Usuario` (
  `idUsuariocol` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(50) NOT NULL,
  `Contrasena` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Admin` VARCHAR(45) NULL,
  `Valoracion_IdValoracion` INT NOT NULL,
  PRIMARY KEY (`idUsuariocol`),
  INDEX `fk_Usuario_Valoracion1_idx` (`Valoracion_IdValoracion` ASC),
  CONSTRAINT `fk_Usuario_Valoracion1`
    FOREIGN KEY (`Valoracion_IdValoracion`)
    REFERENCES `mydb`.`Valoracion` (`IdValoracion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TipoComida`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`TipoComida` ;

CREATE TABLE IF NOT EXISTS `mydb`.`TipoComida` (
  `IdTipoC` INT NOT NULL AUTO_INCREMENT,
  `Descripcion` VARCHAR(400) NULL,
  PRIMARY KEY (`IdTipoC`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TipoComidaxLocal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`TipoComidaxLocal` ;

CREATE TABLE IF NOT EXISTS `mydb`.`TipoComidaxLocal` (
  `IdTCxL` INT NOT NULL AUTO_INCREMENT,
  `IdLocal` VARCHAR(45) NOT NULL,
  `IdTipoC` VARCHAR(45) NOT NULL,
  `Local_idLocal` INT NOT NULL,
  `TipoComida_IdTipoC` INT NOT NULL,
  PRIMARY KEY (`IdTCxL`, `Local_idLocal`),
  INDEX `fk_TipoComidaxLocal_Local1_idx` (`Local_idLocal` ASC),
  INDEX `fk_TipoComidaxLocal_TipoComida1_idx` (`TipoComida_IdTipoC` ASC),
  CONSTRAINT `fk_TipoComidaxLocal_Local1`
    FOREIGN KEY (`Local_idLocal`)
    REFERENCES `mydb`.`Local` (`idLocal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TipoComidaxLocal_TipoComida1`
    FOREIGN KEY (`TipoComida_IdTipoC`)
    REFERENCES `mydb`.`TipoComida` (`IdTipoC`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`FotoComentario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`FotoComentario` ;

CREATE TABLE IF NOT EXISTS `mydb`.`FotoComentario` (
  `IdFotoComentario` INT NOT NULL AUTO_INCREMENT,
  `IdValoracion` VARCHAR(45) NOT NULL,
  `Foto` VARCHAR(100) NULL,
  `Comentario` VARCHAR(500) NULL,
  `Valoracion_IdValoracion` INT NOT NULL,
  PRIMARY KEY (`IdFotoComentario`),
  INDEX `fk_FotoComentario_Valoracion1_idx` (`Valoracion_IdValoracion` ASC),
  CONSTRAINT `fk_FotoComentario_Valoracion1`
    FOREIGN KEY (`Valoracion_IdValoracion`)
    REFERENCES `mydb`.`Valoracion` (`IdValoracion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`user` ;

CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `username` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(32) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
