-- MySQL Script generated by MySQL Workbench
-- Thu Oct 12 14:22:51 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema speechtherapyapplication
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema speechtherapyapplication
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `speechtherapyapplication` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `speechtherapyapplication` ;

-- -----------------------------------------------------
-- Table `speechtherapyapplication`.`doctor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `speechtherapyapplication`.`doctor` (
  `doctorid` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`doctorid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `speechtherapyapplication`.`patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `speechtherapyapplication`.`patient` (
  `patientid` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `dob` DATETIME NOT NULL,
  PRIMARY KEY (`patientid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `speechtherapyapplication`.`assessment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `speechtherapyapplication`.`assessment` (
  `assessmentID` INT NOT NULL,
  `doctorID` INT NOT NULL,
  `patientID` INT NOT NULL,
  PRIMARY KEY (`assessmentID`),
  INDEX `assessmentPatient_idx` (`patientID` ASC) VISIBLE,
  INDEX `assessmentDoctor_idx` (`doctorID` ASC) VISIBLE,
  CONSTRAINT `assessmentDoctor`
    FOREIGN KEY (`doctorID`)
    REFERENCES `speechtherapyapplication`.`doctor` (`doctorid`),
  CONSTRAINT `assessmentPatient`
    FOREIGN KEY (`patientID`)
    REFERENCES `speechtherapyapplication`.`patient` (`patientid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `speechtherapyapplication`.`card`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `speechtherapyapplication`.`card` (
  `cardID` INT NOT NULL,
  `cardImg` VARCHAR(45) NOT NULL,
  `cardAudio` VARCHAR(45) NOT NULL,
  `mainCategory` VARCHAR(45) NOT NULL,
  `subCategory` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cardID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `speechtherapyapplication`.`assign`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `speechtherapyapplication`.`assign` (
  `patientID` INT NOT NULL,
  `cardID` INT NOT NULL,
  INDEX `assignPatient_idx` (`patientID` ASC) VISIBLE,
  INDEX `assignCard_idx` (`cardID` ASC) VISIBLE,
  CONSTRAINT `assignCard`
    FOREIGN KEY (`cardID`)
    REFERENCES `speechtherapyapplication`.`card` (`cardID`),
  CONSTRAINT `assignPatient`
    FOREIGN KEY (`patientID`)
    REFERENCES `speechtherapyapplication`.`patient` (`patientid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `speechtherapyapplication`.`diagnosis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `speechtherapyapplication`.`diagnosis` (
  `doctorID` INT NOT NULL,
  `patientID` INT NOT NULL,
  INDEX `diaDoctor_idx` (`doctorID` ASC) VISIBLE,
  INDEX `diaPatient_idx` (`patientID` ASC) VISIBLE,
  CONSTRAINT `diaDoctor`
    FOREIGN KEY (`doctorID`)
    REFERENCES `speechtherapyapplication`.`doctor` (`doctorid`),
  CONSTRAINT `diaPatient`
    FOREIGN KEY (`patientID`)
    REFERENCES `speechtherapyapplication`.`patient` (`patientid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `speechtherapyapplication`.`progress`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `speechtherapyapplication`.`progress` (
  `patientID` INT NOT NULL,
  `assessmentID` INT NOT NULL,
  `score` INT NOT NULL,
  `submitDate` DATE NOT NULL,
  PRIMARY KEY (`patientID`),
  INDEX `progressAssessment_idx` (`assessmentID` ASC) VISIBLE,
  CONSTRAINT `progressAssessment`
    FOREIGN KEY (`assessmentID`)
    REFERENCES `speechtherapyapplication`.`assessment` (`assessmentID`),
  CONSTRAINT `progressPatient`
    FOREIGN KEY (`patientID`)
    REFERENCES `speechtherapyapplication`.`patient` (`patientid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
