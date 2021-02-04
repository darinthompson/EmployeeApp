-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema employee_db
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema employeedb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema employeedb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `employeedb` DEFAULT CHARACTER SET utf8 ;
USE `employeedb` ;

-- -----------------------------------------------------
-- Table `employeedb`.`EMPLOYEE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `employeedb`.`EMPLOYEE` ;

CREATE TABLE IF NOT EXISTS `employeedb`.`EMPLOYEE` (
  `ID` INT(11) NOT NULL,
  `FIRST_NAME` VARCHAR(45) NOT NULL,
  `LAST_NAME` VARCHAR(45) NOT NULL,
  `EMAIL` VARCHAR(100) NOT NULL,
  `ACTIVE_YN` VARCHAR(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `employeedb`.`ROLE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `employeedb`.`ROLE` ;

CREATE TABLE IF NOT EXISTS `employeedb`.`ROLE` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `ROLE` VARCHAR(45) NOT NULL,
  `DESCRIPTION` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `employeedb`.`ACCOUNT`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `employeedb`.`ACCOUNT` ;

CREATE TABLE IF NOT EXISTS `employeedb`.`ACCOUNT` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `USERNAME` VARCHAR(45) NOT NULL,
  `PASSWORD` VARCHAR(100) NOT NULL,
  `ROLE_ID` INT(11) NOT NULL,
  `EMPLOYEE_ID` INT(11) NOT NULL,
  `ACTIVE_YN` VARCHAR(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  INDEX `fk_account_role_idx` (`ROLE_ID` ASC),
  INDEX `fk_account_employee1_idx` (`EMPLOYEE_ID` ASC),
  CONSTRAINT `fk_account_employee1`
    FOREIGN KEY (`EMPLOYEE_ID`)
    REFERENCES `employeedb`.`EMPLOYEE` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_account_role`
    FOREIGN KEY (`ROLE_ID`)
    REFERENCES `employeedb`.`ROLE` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `employeedb`.`LOCATION`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `employeedb`.`LOCATION` ;

CREATE TABLE IF NOT EXISTS `employeedb`.`LOCATION` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `LOCATION` VARCHAR(45) NOT NULL,
  `DESCRIPTION` VARCHAR(500) NOT NULL,
  `ACTIVE_YN` VARCHAR(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `employeedb`.`JOB`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `employeedb`.`JOB` ;

CREATE TABLE IF NOT EXISTS `employeedb`.`JOB` (
  `ID` INT(11) NOT NULL,
  `DESCRIPTION` VARCHAR(45) NOT NULL,
  `CREATED_DATE` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `MODIFIED_DATE` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `EMPLOYEE_ID` INT(11) NOT NULL,
  `LOCATION_ID` INT(11) NOT NULL,
  `COMPLETED_YN` VARCHAR(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  INDEX `fk_job_employee1_idx` (`EMPLOYEE_ID` ASC),
  INDEX `fk_job_location1_idx` (`LOCATION_ID` ASC),
  CONSTRAINT `fk_job_employee1`
    FOREIGN KEY (`EMPLOYEE_ID`)
    REFERENCES `employeedb`.`EMPLOYEE` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_job_location1`
    FOREIGN KEY (`LOCATION_ID`)
    REFERENCES `employeedb`.`LOCATION` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
