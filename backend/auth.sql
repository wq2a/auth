-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'users'
-- 
-- ---

DROP TABLE IF EXISTS `users`;
		
CREATE TABLE `users` (
  `id` INTEGER AUTO_INCREMENT,
  `ip_address` VARCHAR(45) NULL DEFAULT NULL,
  `username` VARCHAR(100) NULL DEFAULT NULL,
  `password` VARCHAR(255) NULL DEFAULT NULL,
  `salt` VARCHAR(255) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `activation_code` VARCHAR(40) NULL DEFAULT NULL,
  `forgotten_password_code` VARCHAR(40) NULL DEFAULT NULL,
  `forgotten_password_time` INTEGER NULL DEFAULT NULL,
  `remember_code` VARCHAR(40) NULL DEFAULT NULL,
  `create_on` INTEGER NULL DEFAULT NULL,
  `last_login` INTEGER NULL DEFAULT NULL,
  `active` TINYINT NULL DEFAULT NULL,
  `first_name` VARCHAR(50) NULL DEFAULT NULL,
  `last_name` VARCHAR(50) NULL DEFAULT NULL,
  `company` VARCHAR(100) NULL DEFAULT NULL,
  `phone` VARCHAR(20) NULL DEFAULT NULL,
  `create_by_user_id` INTEGER NULL DEFAULT NULL,
  `create_date` TIMESTAMP NULL DEFAULT NULL,
  `modified_by_user_id` INTEGER NULL DEFAULT NULL,
  `modified_date` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'roles'
-- 
-- ---

DROP TABLE IF EXISTS `roles`;
		
CREATE TABLE `roles` (
  `id` INTEGER AUTO_INCREMENT,
  `name` VARCHAR(20) NULL DEFAULT NULL,
  `description` VARCHAR(100) NULL DEFAULT NULL,
  `create_by_user_id` INTEGER NULL DEFAULT NULL,
  `create_date` TIMESTAMP NULL DEFAULT NULL,
  `modified_by_user_id` INTEGER NULL DEFAULT NULL,
  `modified_date` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'users_roles_projects'
-- 
-- ---

DROP TABLE IF EXISTS `users_roles_projects`;
		
CREATE TABLE `users_roles_projects` (
  `id` INTEGER AUTO_INCREMENT,
  `user_id` INTEGER NULL DEFAULT NULL,
  `role_id` INTEGER NULL DEFAULT NULL,
  `project_id` INTEGER NULL DEFAULT NULL,
  `begin_date` TIMESTAMP NULL DEFAULT NULL,
  `end_date` TIMESTAMP NULL DEFAULT NULL,
  `create_by_user_id` INTEGER NULL DEFAULT NULL,
  `create_date` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'projects'
-- 
-- ---

DROP TABLE IF EXISTS `projects`;
		
CREATE TABLE `projects` (
  `id` INTEGER AUTO_INCREMENT,
  `name` VARCHAR(20) NULL DEFAULT NULL,
  `description` VARCHAR(100) NULL DEFAULT NULL,
  `create_by_user_id` INTEGER NULL DEFAULT NULL,
  `create_date` TIMESTAMP NULL DEFAULT NULL,
  `modified_by_user_id` INTEGER NULL DEFAULT NULL,
  `modified_date` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `roles` ADD FOREIGN KEY (create_by_user_id) REFERENCES `users` (`id`);
ALTER TABLE `roles` ADD FOREIGN KEY (modified_by_user_id) REFERENCES `users` (`id`);
ALTER TABLE `users_roles_projects` ADD FOREIGN KEY (user_id) REFERENCES `users` (`id`);
ALTER TABLE `users_roles_projects` ADD FOREIGN KEY (role_id) REFERENCES `roles` (`id`);
ALTER TABLE `users_roles_projects` ADD FOREIGN KEY (project_id) REFERENCES `projects` (`id`);
ALTER TABLE `users_roles_projects` ADD FOREIGN KEY (create_by_user_id) REFERENCES `users` (`id`);
ALTER TABLE `projects` ADD FOREIGN KEY (create_by_user_id) REFERENCES `users` (`id`);
ALTER TABLE `projects` ADD FOREIGN KEY (modified_by_user_id) REFERENCES `users` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `users` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `roles` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `users_roles_projects` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `projects` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `users` (`id`,`ip_address`,`username`,`password`,`salt`,`email`,`activation_code`,`forgotten_password_code`,`forgotten_password_time`,`remember_code`,`create_on`,`last_login`,`active`,`first_name`,`last_name`,`company`,`phone`,`create_by_user_id`,`create_date`,`modified_by_user_id`,`modified_date`) VALUES
-- ('','','','','','','','','','','','','','','','','','','','','');
-- INSERT INTO `roles` (`id`,`name`,`description`,`create_by_user_id`,`create_date`,`modified_by_user_id`,`modified_date`) VALUES
-- ('','','','','','','');
-- INSERT INTO `users_roles_projects` (`id`,`user_id`,`role_id`,`project_id`,`begin_date`,`end_date`,`create_by_user_id`,`create_date`) VALUES
-- ('','','','','','','','');
-- INSERT INTO `projects` (`id`,`name`,`description`,`create_by_user_id`,`create_date`,`modified_by_user_id`,`modified_date`) VALUES
-- ('','','','','','','');
