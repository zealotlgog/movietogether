SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `weibomovie` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `weibomovie` ;

-- -----------------------------------------------------
-- Table `weibomovie`.`User`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `weibomovie`.`User` (
  `userid` INT NOT NULL ,
  `Userweiboid` INT NOT NULL ,
  `username` VARCHAR(45) NOT NULL ,
  `userweibourl` VARCHAR(100) NOT NULL ,
  `address` VARCHAR(200) NULL ,
  PRIMARY KEY (`userid`) ,
  UNIQUE INDEX `id_UNIQUE` (`userid` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `weibomovie`.`cinema`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `weibomovie`.`cinema` (
  `cinemaid` INT NOT NULL ,
  `country` VARCHAR(45) NOT NULL ,
  `city` VARCHAR(45) NOT NULL ,
  `district` VARCHAR(45) NOT NULL ,
  `name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`cinemaid`) ,
  UNIQUE INDEX `id_UNIQUE` (`cinemaid` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `weibomovie`.`movie`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `weibomovie`.`movie` (
  `movieid` INT NOT NULL ,
  `name` VARCHAR(45) NOT NULL ,
  `posterurl` VARCHAR(200) NOT NULL ,
  `introduction` VARCHAR(300) NULL ,
  PRIMARY KEY (`movieid`) ,
  UNIQUE INDEX `idmovie_UNIQUE` (`movieid` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `weibomovie`.`tickets`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `weibomovie`.`tickets` (
  `ticketsid` INT NOT NULL ,
  `userid` INT NOT NULL ,
  `cinemaid` INT NOT NULL ,
  `date` DATETIME NOT NULL ,
  `partner` VARCHAR(45) NOT NULL ,
  `movieid` INT NOT NULL ,
  PRIMARY KEY (`ticketsid`) ,
  UNIQUE INDEX `idtickets_UNIQUE` (`ticketsid` ASC) ,
  INDEX `userid_idx` (`userid` ASC) ,
  INDEX `cinemaid_idx` (`cinemaid` ASC) ,
  INDEX `movieid_idx` (`movieid` ASC) ,
  CONSTRAINT `userid`
    FOREIGN KEY (`userid` )
    REFERENCES `weibomovie`.`User` (`userid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cinemaid`
    FOREIGN KEY (`cinemaid` )
    REFERENCES `weibomovie`.`cinema` (`cinemaid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `movieid`
    FOREIGN KEY (`movieid` )
    REFERENCES `weibomovie`.`movie` (`movieid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `weibomovie` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
