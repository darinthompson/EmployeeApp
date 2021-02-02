-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema employeeDB
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `employeeDB` ;

-- -----------------------------------------------------
-- Schema employeeDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `employeeDB` ;
USE `employeeDB` ;

-- -----------------------------------------------------
-- Table `employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `employee` ;

CREATE TABLE IF NOT EXISTS `employee` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `location` ;

CREATE TABLE IF NOT EXISTS `location` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `location` VARCHAR(45) NOT NULL,
  `description` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `job`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `job` ;

CREATE TABLE IF NOT EXISTS `job` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(45) NOT NULL,
  `created_date` DATETIME NOT NULL,
  `modified_date` DATETIME NOT NULL,
  `employee_id` INT NOT NULL,
  `location_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_job_employee1_idx` (`employee_id` ASC) VISIBLE,
  INDEX `fk_job_location1_idx` (`location_id` ASC) VISIBLE,
  CONSTRAINT `fk_job_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_job_location1`
    FOREIGN KEY (`location_id`)
    REFERENCES `location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `role` ;

CREATE TABLE IF NOT EXISTS `role` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `role` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `account` ;

CREATE TABLE IF NOT EXISTS `account` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `role_id` INT NOT NULL,
  `employee_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_account_role_idx` (`role_id` ASC) VISIBLE,
  INDEX `fk_account_employee1_idx` (`employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_account_role`
    FOREIGN KEY (`role_id`)
    REFERENCES `role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_account_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `employee`
-- -----------------------------------------------------
START TRANSACTION;
USE `employeeDB`;
INSERT INTO `employee` (`id`, `first_name`, `last_name`, `email`) VALUES (1, 'darin', 'thompson', 'darint07@gmail.com');
INSERT INTO `employee` (`id`, `first_name`, `last_name`, `email`) VALUES (2, 'shane', 'duncan', 'email@email.com');

COMMIT;


-- -----------------------------------------------------
-- Data for table `location`
-- -----------------------------------------------------
START TRANSACTION;
USE `employeeDB`;
INSERT INTO `location` (`id`, `location`, `description`) VALUES (1, 'Horse Farm', 'Where the horses are dummy');
INSERT INTO `location` (`id`, `location`, `description`) VALUES (2, 'Main Office', 'Where the office is dummy');

COMMIT;


-- -----------------------------------------------------
-- Data for table `job`
-- -----------------------------------------------------
START TRANSACTION;
USE `employeeDB`;
INSERT INTO `job` (`id`, `description`, `created_date`, `modified_date`, `employee_id`, `location_id`) VALUES (1, 'Clean up debris from storm', '2021-01-14 02:36:54.480', '2021-01-15 02:36:54.480', 1, 1);
INSERT INTO `job` (`id`, `description`, `created_date`, `modified_date`, `employee_id`, `location_id`) VALUES (2, 'Admin Paperwork', '2021-01-14 02:40:54.480', '2021-01-15 02:36:54.480', 2, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `role`
-- -----------------------------------------------------
START TRANSACTION;
USE `employeeDB`;
INSERT INTO `role` (`id`, `role`, `description`) VALUES (1, 'employee', 'standard run of the mill employee');
INSERT INTO `role` (`id`, `role`, `description`) VALUES (2, 'admin', 'El Jefe');

COMMIT;


-- -----------------------------------------------------
-- Data for table `account`
-- -----------------------------------------------------
START TRANSACTION;
USE `employeeDB`;
INSERT INTO `account` (`id`, `username`, `password`, `role_id`, `employee_id`) VALUES (1, 'darinthompson', 'password', 1, 1);
INSERT INTO `account` (`id`, `username`, `password`, `role_id`, `employee_id`) VALUES (2, 'shaneduncan', 'password2', 2, 2);

COMMIT;

