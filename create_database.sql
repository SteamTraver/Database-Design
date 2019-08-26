-- MySQL Workbench Synchronization
-- Generated: 2019-08-26 14:36
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: 24209

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `Testpro` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `Testpro`.`anju_user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键。类型为自增。',
  `countname` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL COMMENT '账户。记录账号名，长度限制在15个字符。不唯一。',
  `password` VARCHAR(15) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL COMMENT '用户密码，限制长度在15个字符。不唯一。前端需要对密码进行密码强度判断。具体强度规则暂未定下。',
  `phone` VARCHAR(15) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL COMMENT '电话号码。长度限制在15个字符。唯一。',
  `email` VARCHAR(20) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL DEFAULT 'null' COMMENT '用户邮件地址。长度限制在20个字符。唯一。',
  `create` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间。记录用户账户创建时间。类型为datetime，精确到时分秒。',
  `update` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间。记录用户账号资料更新时间，类型为datetime，精确到时分秒。',
  `sex` VARCHAR(2) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL DEFAULT '未知' COMMENT '用户性别（可选信息）。可选字符‘男’，‘女’，‘未知’。',
  `birth` DATE NULL DEFAULT '1990-1-01' COMMENT '用户生日（可选数据），类型是date，精确到年月日。',
  `circumstances` VARCHAR(15) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL DEFAULT '家用 室内' COMMENT '添加用户使用场景字段。限制长度为15个字符。',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = '用户表。数据库核心表。记录用户的相关各种信息。部分用户可以选填，部分必须填。具体看字段注释。';

CREATE TABLE IF NOT EXISTS `Testpro`.`device` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键。类型为自增。',
  `name` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL COMMENT '设备名称，长度限制在15字符。',
  `group` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL DEFAULT 'null' COMMENT '分组。mysql中只记录设备所在分组名。默认值\"null\"。',
  `model` VARCHAR(15) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL COMMENT '型号。长度限制在15字符。非空。',
  `serial` VARCHAR(20) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL COMMENT '设备序列号。长度限制在20个字符。',
  `prop` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL COMMENT '设备特性。若干表述特性的string存储在这，程序获取之后直接解析。',
  `version` VARCHAR(15) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL COMMENT '版本号。长度限制在 15字符。',
  `manual` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL DEFAULT NULL COMMENT '用户指南的url地址，可以为空。',
  `create` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间。类型为datetime,精确到时分秒。',
  `update` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间。类型为datetime,精确到时分秒。',
  `circumstance` VARCHAR(15) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL COMMENT '设备的使用场景。长度限制在个字符。',
  `anju_user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `anju_user_id`),
  INDEX `anju_user_id_to_device_idx` (`anju_user_id` ASC) VISIBLE,
  CONSTRAINT `anju_user_id_to_device`
    FOREIGN KEY (`anju_user_id`)
    REFERENCES `Testpro`.`anju_user` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_estonian_ci
COMMENT = '设备表。记录设备数据。该表和friend_has_device表是一对多的关系，和user表是多对一的关系。';

CREATE TABLE IF NOT EXISTS `Testpro`.`terminal` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键。类型为自增。',
  `name` VARCHAR(15) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL DEFAULT NULL COMMENT '终端名称，长度限制15个字符。',
  `mac` VARCHAR(20) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL DEFAULT NULL COMMENT '终端MAC地址。长度限制在20字符。',
  `ip` VARCHAR(16) NULL DEFAULT NULL COMMENT 'IP地址。长度设置为16个字符。',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = '用户终端表。记录用户所用的终端。与用户是多对多的关系。所以存在中间表：user_has_terminal。';

CREATE TABLE IF NOT EXISTS `Testpro`.`image` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键。类型为自增。',
  `url` VARCHAR(45) CHARACTER SET 'utf32' COLLATE 'utf32_general_ci' NULL DEFAULT NULL COMMENT '图片存储在服务器上的位置。长度控制在45个字符。',
  `name` VARCHAR(25) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL DEFAULT NULL COMMENT '照片名称。长度控制在25个字符。',
  `create` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间。',
  `update` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更改时间。',
  `format` VARCHAR(5) CHARACTER SET 'utf32' COLLATE 'utf32_general_ci' NULL DEFAULT NULL COMMENT '照片格式。',
  `size` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL DEFAULT NULL COMMENT '文件大小。以字符串的形式储存。',
  `anju_user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `anju_user_id`),
  INDEX `anju_user_id_to_image1_idx` (`anju_user_id` ASC) VISIBLE,
  CONSTRAINT `anju_user_id_to_image1`
    FOREIGN KEY (`anju_user_id`)
    REFERENCES `Testpro`.`anju_user` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = '图片表。记录两中图片数据：一、用户控制摄像头拍的且存储在云端的照片；二、用户头像。';

CREATE TABLE IF NOT EXISTS `Testpro`.`image_thumb` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键。类型为自增。',
  `url` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL DEFAULT NULL COMMENT '预览图在服务器上的存储位置。',
  `name` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL DEFAULT NULL COMMENT '文件名。',
  `create` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间。类型为datetime,精确到时分秒。',
  `update` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间。类型是datetime，精确到时分秒。',
  `type` VARCHAR(5) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL DEFAULT NULL COMMENT '预览图文件格式。',
  `size` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL DEFAULT NULL COMMENT '文件大小。以字符串的形式存储。',
  `image_id` INT(11) NOT NULL,
  `image_anju_user_id` INT(11) NOT NULL,
  `friend_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `image_id`, `image_anju_user_id`, `friend_id`),
  INDEX `image_id_to_image_thumb1_idx` (`image_id` ASC, `image_anju_user_id` ASC) VISIBLE,
  INDEX `friend_id_to_image_thumb1_idx` (`friend_id` ASC) VISIBLE,
  CONSTRAINT `image_id_to_image_thumb1`
    FOREIGN KEY (`image_id` , `image_anju_user_id`)
    REFERENCES `Testpro`.`image` (`id` , `anju_user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `friend_id_to_image_thumb1`
    FOREIGN KEY (`friend_id`)
    REFERENCES `Testpro`.`friend` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = '照片的预览图表。这里存储两种预览表：用户控制摄像头拍摄的照片的预览图、用户头像的缩略图。';

CREATE TABLE IF NOT EXISTS `Testpro`.`video_thumb` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键。类型为自增。',
  `url` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL DEFAULT NULL COMMENT '预览图在服务器上的存储位置。',
  `name` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL DEFAULT NULL COMMENT '文件名。',
  `create` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间。',
  `update` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间。类型为datetime，精确到时分秒。',
  `type` VARCHAR(5) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL DEFAULT NULL COMMENT '预览图文件格式。',
  `size` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL DEFAULT NULL COMMENT '文件大小。以字符串的形式存储。',
  `video_id` INT(11) NOT NULL,
  `video_user_id` VARCHAR(36) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL,
  `video_anju_user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `video_id`, `video_user_id`, `video_anju_user_id`),
  INDEX `video_id_to_video_thumb1_idx` (`video_id` ASC, `video_user_id` ASC, `video_anju_user_id` ASC) VISIBLE,
  CONSTRAINT `video_id_to_video_thumb1`
    FOREIGN KEY (`video_id` , `video_user_id` , `video_anju_user_id`)
    REFERENCES `Testpro`.`video` (`id` , `user_id` , `anju_user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = '视频缩略图表。记录用户的录像的缩略图相关信息。';

CREATE TABLE IF NOT EXISTS `Testpro`.`video` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键。类型为自增。',
  `url` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL DEFAULT NULL COMMENT '视频文件存储在服务器上的位置。',
  `name` VARCHAR(25) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL DEFAULT NULL COMMENT '视频文件名称。长度限制在25个字符。',
  `create` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '视频创建时间。',
  `update` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '视频创建时间，精确到时分秒。',
  `type` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_estonian_ci' NULL DEFAULT NULL COMMENT '视频格式。长度限制在5个字符。',
  `length` DATETIME NULL DEFAULT NULL COMMENT '视频时长。以datetime的形式存储，精确到时分秒。',
  `size` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL DEFAULT NULL COMMENT '视频文件大小，以字符串的形式存储。长度限制为10个字符。',
  `user_id` VARCHAR(36) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL COMMENT '外键。参照表为user。引用user表ID。',
  `anju_user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `user_id`, `anju_user_id`),
  INDEX `anju_user_id_to_video1_idx` (`anju_user_id` ASC) VISIBLE,
  CONSTRAINT `anju_user_id_to_video1`
    FOREIGN KEY (`anju_user_id`)
    REFERENCES `Testpro`.`anju_user` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = '视频表。存储用户录像在服务器上的信息。与用户表是多对一的关系。';

CREATE TABLE IF NOT EXISTS `Testpro`.`friend` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键。类型为自增。',
  `name` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL COMMENT '好友名称。',
  `phone` VARCHAR(15) CHARACTER SET 'utf8' COLLATE 'utf8_estonian_ci' NOT NULL COMMENT '好友手机号，必需。',
  `create` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间。类型为datetime,精确到时分秒。',
  `update` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间。类型为datetime,精确到时分秒。',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = '好友表。用户添加好友时输入对方手机号，首先在用户表里搜寻其手机号。有则说明是已经注册的用户，无则不是。不管对方有无注册，friend的主键ID一定要被创建。';

CREATE TABLE IF NOT EXISTS `Testpro`.`user_has_terminal` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键。类型为自增。',
  `terminal_id` INT(11) NOT NULL,
  `anju_user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `terminal_id`, `anju_user_id`),
  INDEX `terminal_id_to_user_has_terminal1_idx` (`terminal_id` ASC) VISIBLE,
  INDEX `anju_user_id_to_user_has_terminal1_idx` (`anju_user_id` ASC) VISIBLE,
  CONSTRAINT `terminal_id_to_user_has_terminal1`
    FOREIGN KEY (`terminal_id`)
    REFERENCES `Testpro`.`terminal` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `anju_user_id_to_user_has_terminal1`
    FOREIGN KEY (`anju_user_id`)
    REFERENCES `Testpro`.`anju_user` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = '作为user表和terminal表的中间表。便于查询。';

CREATE TABLE IF NOT EXISTS `Testpro`.`user_has_friend` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键。类型为自增。',
  `create` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间。类型为datetime,精确到时分秒。',
  `update` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间。类型为datetime,精确到时分秒。',
  `anju_user_id` INT(11) NOT NULL,
  `friend_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `anju_user_id`, `friend_id`),
  INDEX `anju_user_id_to_user_has_friend1_idx` (`anju_user_id` ASC) VISIBLE,
  INDEX `friend_id_to_user_has_friend1_idx` (`friend_id` ASC) VISIBLE,
  CONSTRAINT `anju_user_id_to_user_has_friend1`
    FOREIGN KEY (`anju_user_id`)
    REFERENCES `Testpro`.`anju_user` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `friend_id_to_user_has_friend1`
    FOREIGN KEY (`friend_id`)
    REFERENCES `Testpro`.`friend` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = '用户——好友表。因为用户与好友是多对多的关系。所以让此表作为中间表便于查询。';

CREATE TABLE IF NOT EXISTS `Testpro`.`friend_has_device` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键。类型为自增。',
  `create` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，类型为datetime，精确到时分秒。',
  `update` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间，类型为datetime，精确到时分秒。',
  `friend_id` INT(11) NOT NULL,
  `device_id` INT(11) NOT NULL,
  `device_anju_user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `friend_id`, `device_id`, `device_anju_user_id`),
  INDEX `friend_id_to_friend_has_device1_idx` (`friend_id` ASC) VISIBLE,
  INDEX `device_id_to_friend_has_device1_idx` (`device_id` ASC, `device_anju_user_id` ASC) VISIBLE,
  CONSTRAINT `friend_id_to_friend_has_device1`
    FOREIGN KEY (`friend_id`)
    REFERENCES `Testpro`.`friend` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `device_id_to_friend_has_device1`
    FOREIGN KEY (`device_id` , `device_anju_user_id`)
    REFERENCES `Testpro`.`device` (`id` , `anju_user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = '设备共享表。存储设备被共享时的信息表。与好友是多对一的关系，与用户是多对一的关系。';

CREATE TABLE IF NOT EXISTS `Testpro`.`signin` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键。类型为自增。',
  `create` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登陆时间。类型为datetime,精确到时分秒。',
  `update` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间。类型为datetime,精确到时分秒。',
  `terminal_id` INT(11) NOT NULL,
  `anju_user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `terminal_id`, `anju_user_id`),
  INDEX `terminal_id_to_signin1_idx` (`terminal_id` ASC) VISIBLE,
  INDEX `anju_user_id_to_signin1_idx` (`anju_user_id` ASC) VISIBLE,
  CONSTRAINT `terminal_id_to_signin1`
    FOREIGN KEY (`terminal_id`)
    REFERENCES `Testpro`.`terminal` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `anju_user_id_to_signin1`
    FOREIGN KEY (`anju_user_id`)
    REFERENCES `Testpro`.`anju_user` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_estonian_ci
COMMENT = '登录日志表。记录用户的登录动作。与用户表是多对一的关系。与终端表terminal是多对一的关系。';

CREATE TABLE IF NOT EXISTS `Testpro`.`operationlog` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键。类型为自增。',
  `log` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL DEFAULT NULL COMMENT '操作日志文本存档。存储为VARCHAR。最大为10个字符。',
  `create` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间。',
  `update` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间。',
  `anju_user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `anju_user_id`),
  INDEX `anju_user_id_to_operationlog1_idx` (`anju_user_id` ASC) VISIBLE,
  CONSTRAINT `anju_user_id_to_operationlog1`
    FOREIGN KEY (`anju_user_id`)
    REFERENCES `Testpro`.`anju_user` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = '操作日志表。表中字段tinytext记录具体的用户操作。tinytext的内容由程序自动生成，记录用户的关键操作。例如登录、注销、解除设备绑定等等。随着时间的推移。此表的大小会越来越大。所以应该对每个用户设定查看日期，只存储N日的操作日志。具体方式还没定下来。';

CREATE TABLE IF NOT EXISTS `Testpro`.`closed_account` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键。类型为自增。',
  `create` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注销时间。类型是datetime，精确到时分秒。',
  `update` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间，类型是datetime，精确到时分秒。',
  `phone` VARCHAR(15) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL COMMENT '用户手机号。保存用户注销时的手机号。',
  `anju_user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `anju_user_id`),
  INDEX `anju_user_id_to_closed_account1_idx` (`anju_user_id` ASC) VISIBLE,
  CONSTRAINT `anju_user_id_to_closed_account1`
    FOREIGN KEY (`anju_user_id`)
    REFERENCES `Testpro`.`anju_user` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = '注销表。记录注销用户的用户ID。注销逻辑：一个用户注销，那么他的ID就记录在这。同时相关数据被删除或者保留。但是用户可以使用同一个手机号再次注册。再次注册的话即是往user表里添加数据，同时从closed_account表中删除该用户的过去的ID。';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
