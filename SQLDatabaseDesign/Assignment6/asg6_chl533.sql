-- MySQL Script generated by MySQL Workbench
-- Wed Nov 14 18:32:58 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`division_name`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`division_name` ;

CREATE TABLE IF NOT EXISTS `mydb`.`division_name` (
  `division_name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`division_name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`division`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`division` ;

CREATE TABLE IF NOT EXISTS `mydb`.`division` (
  `division_ID` INT NOT NULL AUTO_INCREMENT,
  `division_name` VARCHAR(20) NULL,
  PRIMARY KEY (`division_ID`),
  INDEX `division_name_idx` (`division_name` ASC) VISIBLE,
  CONSTRAINT `division_name`
    FOREIGN KEY (`division_name`)
    REFERENCES `mydb`.`division_name` (`division_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`department` ;

CREATE TABLE IF NOT EXISTS `mydb`.`department` (
  `department_ID` INT NOT NULL AUTO_INCREMENT,
  `department_name` VARCHAR(45) NULL,
  `department_division_ID` INT NULL,
  PRIMARY KEY (`department_ID`),
  INDEX `school_ID_idx` (`department_division_ID` ASC) VISIBLE,
  CONSTRAINT `division_ID`
    FOREIGN KEY (`department_division_ID`)
    REFERENCES `mydb`.`division` (`division_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`instructor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`instructor` ;

CREATE TABLE IF NOT EXISTS `mydb`.`instructor` (
  `instructor_ID` INT NOT NULL AUTO_INCREMENT,
  `instructor_email` VARCHAR(30) NULL,
  `instructor_name` VARCHAR(45) NULL,
  PRIMARY KEY (`instructor_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`course` ;

CREATE TABLE IF NOT EXISTS `mydb`.`course` (
  `course_ID` VARCHAR(40) NOT NULL,
  `course_name` VARCHAR(60) NULL,
  `course_credit_hours` INT NULL,
  `course_department_ID` INT NULL,
  `course_instructor_ID` INT NULL,
  INDEX `department_ID_idx` (`course_department_ID` ASC) VISIBLE,
  INDEX `course_instructor_ID_idx` (`course_instructor_ID` ASC) VISIBLE,
  PRIMARY KEY (`course_ID`),
  CONSTRAINT `course_department_ID`
    FOREIGN KEY (`course_department_ID`)
    REFERENCES `mydb`.`department` (`department_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `course_instructor_ID`
    FOREIGN KEY (`course_instructor_ID`)
    REFERENCES `mydb`.`instructor` (`instructor_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`format`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`format` ;

CREATE TABLE IF NOT EXISTS `mydb`.`format` (
  `format_type` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`format_type`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`book`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`book` ;

CREATE TABLE IF NOT EXISTS `mydb`.`book` (
  `book_ID` INT NOT NULL AUTO_INCREMENT,
  `book_title` VARCHAR(45) NULL,
  `book_publisher` VARCHAR(30) NULL,
  `book_year_written` VARCHAR(45) NULL,
  `book_author` VARCHAR(45) NULL,
  `book_price` FLOAT NULL,
  `book_format` VARCHAR(15) NULL,
  `book_language` VARCHAR(20) NULL,
  `book_ebook_availability` TINYINT(1) NULL,
  `book_ISBN` INT NULL,
  `book_pages` INT NULL,
  PRIMARY KEY (`book_ID`),
  INDEX `book_format_idx` (`book_format` ASC) VISIBLE,
  CONSTRAINT `book_format`
    FOREIGN KEY (`book_format`)
    REFERENCES `mydb`.`format` (`format_type`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`course_books`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`course_books` ;

CREATE TABLE IF NOT EXISTS `mydb`.`course_books` (
  `course_books_ID` INT NOT NULL AUTO_INCREMENT,
  `course_books_course_ID` VARCHAR(40) NULL,
  `course_books_book_ID` INT NULL,
  `course_books_copies_requested` INT NULL,
  `course_book_necessity` VARCHAR(10) NULL,
  PRIMARY KEY (`course_books_ID`),
  INDEX `course_ID_idx` (`course_books_course_ID` ASC) VISIBLE,
  INDEX `book_ID_idx` (`course_books_book_ID` ASC) VISIBLE,
  CONSTRAINT `course_ID`
    FOREIGN KEY (`course_books_course_ID`)
    REFERENCES `mydb`.`course` (`course_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `book_ID`
    FOREIGN KEY (`course_books_book_ID`)
    REFERENCES `mydb`.`book` (`book_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
