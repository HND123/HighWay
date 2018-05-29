-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema highway
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema highway
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `highway` DEFAULT CHARACTER SET latin1 ;
USE `highway` ;

-- -----------------------------------------------------
-- Table `highway`.`schedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `highway`.`schedule` (
  `Bus_No` INT(11) NOT NULL,
  `entrance` VARCHAR(45) NOT NULL,
  `Time` VARCHAR(45) NULL DEFAULT NULL,
  `Ctb_Private` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Bus_No`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `highway`.`passenger`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `highway`.`passenger` (
  `User_ID` INT(11) NOT NULL,
  `Name` VARCHAR(45) NULL DEFAULT NULL,
  `Arrival` VARCHAR(45) NULL DEFAULT NULL,
  `Departure` VARCHAR(45) NULL DEFAULT NULL,
  `Time` VARCHAR(45) NULL DEFAULT NULL,
  `Ticket_Price` VARCHAR(45) NULL DEFAULT NULL,
  `schedule_Bus_No` INT(11) NOT NULL,
  PRIMARY KEY (`User_ID`),
  INDEX `fk_passenger_schedule1_idx` (`schedule_Bus_No` ASC),
  CONSTRAINT `fk_passenger_schedule1`
    FOREIGN KEY (`schedule_Bus_No`)
    REFERENCES `highway`.`schedule` (`Bus_No`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `highway`.`bus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `highway`.`bus` (
  `Bus_No` INT(11) NOT NULL,
  `Root_No` VARCHAR(45) NULL DEFAULT NULL,
  `Time` VARCHAR(45) NULL DEFAULT NULL,
  `Ticket_price` VARCHAR(45) NULL DEFAULT NULL,
  `passenger_User_ID` INT(11) NOT NULL,
  `schedule_Bus_No` INT(11) NOT NULL,
  PRIMARY KEY (`Bus_No`),
  INDEX `fk_bus_passenger_idx` (`passenger_User_ID` ASC),
  INDEX `fk_bus_schedule1_idx` (`schedule_Bus_No` ASC),
  CONSTRAINT `fk_bus_passenger`
    FOREIGN KEY (`passenger_User_ID`)
    REFERENCES `highway`.`passenger` (`User_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bus_schedule1`
    FOREIGN KEY (`schedule_Bus_No`)
    REFERENCES `highway`.`schedule` (`Bus_No`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `highway`.`bus_sheets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `highway`.`bus_sheets` (
  `Sheet_No` INT(11) NOT NULL,
  `booking` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Sheet_No`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `highway`.`other_vehicles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `highway`.`other_vehicles` (
  `Vihicle_No` INT(11) NOT NULL,
  `Ticket_price` VARCHAR(45) NULL DEFAULT NULL,
  `Vehicle_type` VARCHAR(45) NULL DEFAULT NULL,
  `Entrance` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Vihicle_No`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
