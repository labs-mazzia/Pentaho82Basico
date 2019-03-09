-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema erp_labs_mazzia
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema erp_labs_mazzia
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `erp_labs_mazzia` DEFAULT CHARACTER SET utf8 ;
USE `erp_labs_mazzia` ;

-- -----------------------------------------------------
-- Table `erp_labs_mazzia`.`erp_cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `erp_labs_mazzia`.`erp_cidade` (
  `id_cidade` INT(11) NOT NULL,
  `cid_nome` VARCHAR(150) NULL DEFAULT NULL,
  `cid_uf` VARCHAR(2) NULL DEFAULT NULL,
  PRIMARY KEY (`id_cidade`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `erp_labs_mazzia`.`erp_paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `erp_labs_mazzia`.`erp_paciente` (
  `id_paciente` INT(11) NOT NULL,
  `pac_sexo` VARCHAR(4) NULL DEFAULT NULL,
  `pac_dt_nasc` DATE NULL DEFAULT NULL,
  `pac_tipo_sangue` VARCHAR(5) NULL DEFAULT NULL,
  `pac_nome` VARCHAR(75) NULL DEFAULT NULL,
  `pac_endereco` VARCHAR(150) NULL DEFAULT NULL,
  `id_cidade` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_paciente`),
  INDEX `fk_paciente_cidade_idx` (`id_cidade` ASC) ,
  CONSTRAINT `fk_paciente_cidade`
    FOREIGN KEY (`id_cidade`)
    REFERENCES `erp_labs_mazzia`.`erp_cidade` (`id_cidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `erp_labs_mazzia`.`erp_cid`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `erp_labs_mazzia`.`erp_cid` (
  `id_cid` VARCHAR(10) NOT NULL,
  `cid_descri` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`id_cid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `erp_labs_mazzia`.`erp_tipo_interna`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `erp_labs_mazzia`.`erp_tipo_interna` (
  `id_tipo_internacao` INT(11) NOT NULL,
  `tpint_descri` VARCHAR(75) NULL DEFAULT NULL,
  `tpint_carater` CHAR(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id_tipo_internacao`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `erp_labs_mazzia`.`erp_especialidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `erp_labs_mazzia`.`erp_especialidade` (
  `id_especialidade` INT(11) NOT NULL,
  `esp_descri` VARCHAR(35) NULL DEFAULT NULL,
  PRIMARY KEY (`id_especialidade`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `erp_labs_mazzia`.`erp_procedimento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `erp_labs_mazzia`.`erp_procedimento` (
  `id_procedimento` INT(11) NOT NULL,
  `proc_descri` VARCHAR(250) NULL DEFAULT NULL,
  PRIMARY KEY (`id_procedimento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `erp_labs_mazzia`.`erp_recepcao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `erp_labs_mazzia`.`erp_recepcao` (
  `id_recepcao` INT(11) NOT NULL,
  `rcp_descri` VARCHAR(35) NULL DEFAULT NULL,
  PRIMARY KEY (`id_recepcao`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `erp_labs_mazzia`.`erp_motivo_alta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `erp_labs_mazzia`.`erp_motivo_alta` (
  `id_motalta` INT(11) NOT NULL,
  `mtv_descri` VARCHAR(75) NULL DEFAULT NULL,
  PRIMARY KEY (`id_motalta`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `erp_labs_mazzia`.`erp_atendimento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `erp_labs_mazzia`.`erp_atendimento` (
  `id_atendimento` INT(11) NOT NULL,
  `id_paciente` INT(11) NULL DEFAULT NULL,
  `atd_data_atdto` DATE NULL DEFAULT NULL,
  `atd_atdto_mes` INT(11) NULL DEFAULT NULL,
  `atd_atdto_ano` INT(11) NULL DEFAULT NULL,
  `atd_atdto_periodo` VARCHAR(15) NULL DEFAULT NULL,
  `atd_data_alta` DATE NULL DEFAULT NULL,
  `atd_alta_mes` INT(11) NULL DEFAULT NULL,
  `atd_alta_ano` INT(11) NULL DEFAULT NULL,
  `atd_alta_periodo` VARCHAR(15) NULL DEFAULT NULL,
  `atd_dias_int` INT(11) NULL DEFAULT NULL,
  `atd_pac_idade` INT(11) NULL DEFAULT NULL,
  `id_cid` VARCHAR(10) NULL DEFAULT NULL,
  `id_tipo_interna` INT(11) NULL DEFAULT NULL,
  `id_especialidade` INT(11) NULL DEFAULT NULL,
  `id_procedimento` INT(11) NULL DEFAULT NULL,
  `id_recepcao` INT(11) NULL DEFAULT NULL,
  `atd_tipo_fatura` VARCHAR(10) NULL DEFAULT NULL,
  `id_motalta` INT(11) NULL DEFAULT NULL,
  `atd_obito` CHAR(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id_atendimento`),
  INDEX `idx_paciente` (`id_paciente` ASC) ,
  INDEX `idx_dt_atdto` (`atd_data_atdto` ASC) ,
  INDEX `idx_dt_alta` (`atd_data_alta` ASC) ,
  INDEX `idx_cid` (`id_cid` ASC) ,
  INDEX `idx_interna` (`id_tipo_interna` ASC) ,
  INDEX `idx_especialidade` (`id_especialidade` ASC) ,
  INDEX `idx_procedimento` (`id_procedimento` ASC) ,
  INDEX `idx_recepcao` (`id_recepcao` ASC) ,
  INDEX `idx_faturamento` (`atd_tipo_fatura` ASC) ,
  INDEX `idx_mot_alta` (`id_motalta` ASC) ,
  INDEX `idx_obito` (`atd_obito` ASC) ,
  INDEX `idx_ano_atd` (`atd_atdto_ano` ASC) ,
  INDEX `idx_mes_atd` (`atd_atdto_mes` ASC) ,
  INDEX `idx_periodo_atd` (`atd_atdto_periodo` ASC) ,
  INDEX `idx_ano_alta` (`atd_alta_ano` ASC) ,
  INDEX `idx_mes_alta` (`atd_alta_mes` ASC) ,
  INDEX `idx_periodo_alta` (`atd_alta_periodo` ASC) ,
  CONSTRAINT `fk_atdto_paciente`
    FOREIGN KEY (`id_paciente`)
    REFERENCES `erp_labs_mazzia`.`erp_paciente` (`id_paciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_atdto_cid`
    FOREIGN KEY (`id_cid`)
    REFERENCES `erp_labs_mazzia`.`erp_cid` (`id_cid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_atdto_tipo_interna`
    FOREIGN KEY (`id_tipo_interna`)
    REFERENCES `erp_labs_mazzia`.`erp_tipo_interna` (`id_tipo_internacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_atdto_especialidade`
    FOREIGN KEY (`id_especialidade`)
    REFERENCES `erp_labs_mazzia`.`erp_especialidade` (`id_especialidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_atdto_procedimento`
    FOREIGN KEY (`id_procedimento`)
    REFERENCES `erp_labs_mazzia`.`erp_procedimento` (`id_procedimento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_atdto_recepcao`
    FOREIGN KEY (`id_recepcao`)
    REFERENCES `erp_labs_mazzia`.`erp_recepcao` (`id_recepcao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_atdto_motivo_alta`
    FOREIGN KEY (`id_motalta`)
    REFERENCES `erp_labs_mazzia`.`erp_motivo_alta` (`id_motalta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

USE `erp_labs_mazzia` ;

-- -----------------------------------------------------
-- Placeholder table for view `erp_labs_mazzia`.`viw_atdto_completo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `erp_labs_mazzia`.`viw_atdto_completo` (`id_atendimento` INT, `id_paciente` INT, `pac_nome` INT, `pac_sexo` INT, `pac_dt_nasc` INT, `pac_tipo_sangue` INT, `pac_endereco` INT, `id_cidade` INT, `cid_nome` INT, `cid_uf` INT, `atd_data_atdto` INT, `atd_atdto_periodo` INT, `atd_atdto_ano` INT, `atd_atdto_mes` INT, `atd_data_alta` INT, `atd_alta_periodo` INT, `atd_alta_ano` INT, `atd_alta_mes` INT, `atd_dias_int` INT, `atd_pac_idade` INT, `id_cid` INT, `cid_descri` INT, `id_tipo_interna` INT, `tpint_descri` INT, `tpint_carater` INT, `id_especialidade` INT, `esp_descri` INT, `id_procedimento` INT, `proc_descri` INT, `id_recepcao` INT, `rcp_descri` INT, `atd_tipo_fatura` INT, `id_motalta` INT, `mtv_descri` INT, `atd_obito` INT);

-- -----------------------------------------------------
-- View `erp_labs_mazzia`.`viw_atdto_completo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `erp_labs_mazzia`.`viw_atdto_completo`;
USE `erp_labs_mazzia`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `erp_labs_mazzia`.`viw_atdto_completo` AS select `atd`.`id_atendimento` AS `id_atendimento`,`atd`.`id_paciente` AS `id_paciente`,`pac`.`pac_nome` AS `pac_nome`,`pac`.`pac_sexo` AS `pac_sexo`,`pac`.`pac_dt_nasc` AS `pac_dt_nasc`,`pac`.`pac_tipo_sangue` AS `pac_tipo_sangue`,`pac`.`pac_endereco` AS `pac_endereco`,`pac`.`id_cidade` AS `id_cidade`,`cdd`.`cid_nome` AS `cid_nome`,`cdd`.`cid_uf` AS `cid_uf`,`atd`.`atd_data_atdto` AS `atd_data_atdto`,`atd`.`atd_atdto_periodo` AS `atd_atdto_periodo`,`atd`.`atd_atdto_ano` AS `atd_atdto_ano`,`atd`.`atd_atdto_mes` AS `atd_atdto_mes`,`atd`.`atd_data_alta` AS `atd_data_alta`,`atd`.`atd_alta_periodo` AS `atd_alta_periodo`,`atd`.`atd_alta_ano` AS `atd_alta_ano`,`atd`.`atd_alta_mes` AS `atd_alta_mes`,`atd`.`atd_dias_int` AS `atd_dias_int`,`atd`.`atd_pac_idade` AS `atd_pac_idade`,`atd`.`id_cid` AS `id_cid`,`cid`.`cid_descri` AS `cid_descri`,`atd`.`id_tipo_interna` AS `id_tipo_interna`,`tit`.`tpint_descri` AS `tpint_descri`,`tit`.`tpint_carater` AS `tpint_carater`,`atd`.`id_especialidade` AS `id_especialidade`,`esp`.`esp_descri` AS `esp_descri`,`atd`.`id_procedimento` AS `id_procedimento`,`prc`.`proc_descri` AS `proc_descri`,`atd`.`id_recepcao` AS `id_recepcao`,`rcp`.`rcp_descri` AS `rcp_descri`,`atd`.`atd_tipo_fatura` AS `atd_tipo_fatura`,`atd`.`id_motalta` AS `id_motalta`,`mtv`.`mtv_descri` AS `mtv_descri`,`atd`.`atd_obito` AS `atd_obito` from ((((((((`erp_labs_mazzia`.`erp_atendimento` `atd` join `erp_labs_mazzia`.`erp_paciente` `pac` on((`atd`.`id_paciente` = `pac`.`id_paciente`))) join `erp_labs_mazzia`.`erp_cidade` `cdd` on((`pac`.`id_cidade` = `cdd`.`id_cidade`))) join `erp_labs_mazzia`.`erp_cid` `cid` on((`atd`.`id_cid` = `cid`.`id_cid`))) join `erp_labs_mazzia`.`erp_tipo_interna` `tit` on((`atd`.`id_tipo_interna` = `tit`.`id_tipo_internacao`))) join `erp_labs_mazzia`.`erp_especialidade` `esp` on((`atd`.`id_especialidade` = `esp`.`id_especialidade`))) join `erp_labs_mazzia`.`erp_procedimento` `prc` on((`atd`.`id_procedimento` = `prc`.`id_procedimento`))) join `erp_labs_mazzia`.`erp_recepcao` `rcp` on((`atd`.`id_recepcao` = `rcp`.`id_recepcao`))) join `erp_labs_mazzia`.`erp_motivo_alta` `mtv` on((`atd`.`id_motalta` = `mtv`.`id_motalta`)));

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
