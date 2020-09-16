-- MySQL Script generated by MySQL Workbench
-- Tue Sep 15 16:51:45 2020
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
-- Table `mydb`.`room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`room` (
  `id_room` INT NOT NULL AUTO_INCREMENT,
  `public_room` TINYINT NULL,
  `name_room` VARCHAR(25) NOT NULL,
  `last_activity__room` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_room`),
  UNIQUE INDEX `name_room_UNIQUE` (`name_room` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`status` (
  `id_status` INT NOT NULL AUTO_INCREMENT,
  `name_status` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`id_status`),
  UNIQUE INDEX `name_status_UNIQUE` (`name_status` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user_right`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user_right` (
  `id_user_right` INT NOT NULL AUTO_INCREMENT,
  `date_authorized_use_right` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fkey_status_id` INT NOT NULL,
  INDEX `fk_user_right_status1_idx` (`fkey_status_id` ASC) VISIBLE,
  PRIMARY KEY (`id_user_right`),
  CONSTRAINT `fk_user_right_status1`
    FOREIGN KEY (`fkey_status_id`)
    REFERENCES `mydb`.`status` (`id_status`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `nickname_user` VARCHAR(60) NOT NULL,
  `pwd_user` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  `mail_user` VARCHAR(120) NOT NULL,
  `signup_date_user` DATETIME NOT NULL,
  `color_user` VARCHAR(45) NOT NULL,
  `confirmation_key_user` VARCHAR(60) NOT NULL,
  `validation_status_user` TINYINT NULL,
  `fkey_user_right_id` INT NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE INDEX `nickname_user_UNIQUE` (`nickname_user` ASC) VISIBLE,
  UNIQUE INDEX `mail_user_UNIQUE` (`mail_user` ASC) VISIBLE,
  UNIQUE INDEX `confirmation_key_user_UNIQUE` (`confirmation_key_user` ASC) VISIBLE,
  UNIQUE INDEX `pwd_user_UNIQUE` (`pwd_user` ASC) VISIBLE,
  INDEX `fk_user_user_right1_idx` (`fkey_user_right_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_user_right1`
    FOREIGN KEY (`fkey_user_right_id`)
    REFERENCES `mydb`.`user_right` (`id_user_right`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`message`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`message` (
  `id_message` INT NOT NULL AUTO_INCREMENT,
  `date_message` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `content_message` TINYTEXT NOT NULL,
  `archived_message` TINYINT(1) NULL,
  `fkey_user_id` INT NOT NULL,
  `fkey_room_id` INT NOT NULL,
  PRIMARY KEY (`id_message`),
  INDEX `fk_message_user1_idx` (`fkey_user_id` ASC) VISIBLE,
  INDEX `fk_message_room1_idx` (`fkey_room_id` ASC) VISIBLE,
  CONSTRAINT `fk_message_user1`
    FOREIGN KEY (`fkey_user_id`)
    REFERENCES `mydb`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_message_room1`
    FOREIGN KEY (`fkey_room_id`)
    REFERENCES `mydb`.`room` (`id_room`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`online`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`online` (
  `id_online` INT NOT NULL AUTO_INCREMENT,
  `last_activity_online` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `connected_online` TINYINT(1) NULL,
  `fkey_user_id` INT NOT NULL,
  PRIMARY KEY (`id_online`),
  INDEX `fk_online_user1_idx` (`fkey_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_online_user1`
    FOREIGN KEY (`fkey_user_id`)
    REFERENCES `mydb`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user_room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user_room` (
  `id_user_room` INT NOT NULL AUTO_INCREMENT,
  `favorite_user_room` TINYINT NULL,
  `fkey_room_id` INT NOT NULL,
  `fkey_user_id` INT NOT NULL,
  INDEX `fk_favorite_room1_idx` (`fkey_room_id` ASC) VISIBLE,
  INDEX `fk_favorite_user1_idx` (`fkey_user_id` ASC) VISIBLE,
  PRIMARY KEY (`id_user_room`),
  CONSTRAINT `fk_favorite_room1`
    FOREIGN KEY (`fkey_room_id`)
    REFERENCES `mydb`.`room` (`id_room`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_favorite_user1`
    FOREIGN KEY (`fkey_user_id`)
    REFERENCES `mydb`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`help`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`help` (
  `id_help` INT NOT NULL AUTO_INCREMENT,
  `mail_help` VARCHAR(120) NOT NULL,
  `nickname_help` VARCHAR(80) NOT NULL,
  `subject_help` VARCHAR(120) NOT NULL,
  `content_help` TINYTEXT NOT NULL,
  PRIMARY KEY (`id_help`),
  UNIQUE INDEX `mail_UNIQUE` (`mail_help` ASC) VISIBLE,
  UNIQUE INDEX `nickname_UNIQUE` (`nickname_help` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`img`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`img` (
  `id_img` INT NOT NULL AUTO_INCREMENT,
  `name_img` VARCHAR(40) NOT NULL,
  `active_img` TINYINT NULL,
  `date_img` TIMESTAMP NULL,
  PRIMARY KEY (`id_img`),
  UNIQUE INDEX `name_img_UNIQUE` (`name_img` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`category` (
  `id_category` INT NOT NULL AUTO_INCREMENT,
  `name_category` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`id_category`),
  UNIQUE INDEX `name_category_UNIQUE` (`name_category` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`reported`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`reported` (
  `id_reported` INT NOT NULL AUTO_INCREMENT,
  `inquiry_reported` TINYTEXT NULL,
  `counter_reported` INT NOT NULL,
  `fkey_category_id` INT NOT NULL,
  `fkey_message_id` INT NOT NULL,
  PRIMARY KEY (`id_reported`),
  INDEX `fk_reported_category1_idx` (`fkey_category_id` ASC) VISIBLE,
  INDEX `fk_reported_message1_idx` (`fkey_message_id` ASC) VISIBLE,
  CONSTRAINT `fk_reported_category1`
    FOREIGN KEY (`fkey_category_id`)
    REFERENCES `mydb`.`category` (`id_category`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reported_message1`
    FOREIGN KEY (`fkey_message_id`)
    REFERENCES `mydb`.`message` (`id_message`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`role` (
  `id_role` INT NOT NULL AUTO_INCREMENT,
  `name_role` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`id_role`),
  UNIQUE INDEX `name_role_UNIQUE` (`name_role` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user_has_img`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user_has_img` (
  `user_id_user` INT NOT NULL,
  `img_id_img` INT NOT NULL,
  PRIMARY KEY (`user_id_user`, `img_id_img`),
  INDEX `fk_user_has_img_img1_idx` (`img_id_img` ASC) VISIBLE,
  INDEX `fk_user_has_img_user1_idx` (`user_id_user` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_img_user1`
    FOREIGN KEY (`user_id_user`)
    REFERENCES `mydb`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_img_img1`
    FOREIGN KEY (`img_id_img`)
    REFERENCES `mydb`.`img` (`id_img`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`role_has_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`role_has_user` (
  `role_id_role` INT NOT NULL,
  `user_id_user` INT NOT NULL,
  PRIMARY KEY (`role_id_role`, `user_id_user`),
  INDEX `fk_role_has_user_user1_idx` (`user_id_user` ASC) VISIBLE,
  INDEX `fk_role_has_user_role1_idx` (`role_id_role` ASC) VISIBLE,
  CONSTRAINT `fk_role_has_user_role1`
    FOREIGN KEY (`role_id_role`)
    REFERENCES `mydb`.`role` (`id_role`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_role_has_user_user1`
    FOREIGN KEY (`user_id_user`)
    REFERENCES `mydb`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
