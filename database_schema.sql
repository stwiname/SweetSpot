CREATE TABLE  `sweet_spot_test`.`client` (
`rowid` INT NOT NULL DEFAULT NULL AUTO_INCREMENT PRIMARY KEY ,
`name` TEXT NOT NULL ,
`email` TEXT NOT NULL ,
`password` TEXT NOT NULL ,
`phone` INT NOT NULL ,
`join_date` DATETIME NOT NULL
) ENGINE = INNODB;

CREATE TABLE  `sweet_spot_test`.`tier` (
`rowid` INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
`tier_number` INT NOT NULL,
`name` TEXT NOT NULL ,
`price` DECIMAL NOT NULL ,
`tier_date` DATE NOT NULL ,
`in_use` BOOL NOT NULL,
`spaces_used` INT NOT NULL DAFAULT '0',
`city` TEXT NOT NULL,
UNIQUE (`tier_number`, `tier_date`)
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS `event` (
  `rowid` INT NOT NULL AUTO_INCREMENT,
  `name` TEXT NOT NULL,
  `image` TEXT NOT NULL COMMENT 'is a path_name',
  `event_time` datetime NOT NULL,
  `description` TEXT NOT NULL,
  `region` TEXT NOT NULL,
  `address` TEXT NOT NULL,
  `attendees` INT NOT NULL DEFAULT '0',
  `client` INT NOT NULL,
  `tier` INT NOT NULL,
  PRIMARY KEY (`rowid`),
  CONSTRAINT event_client FOREIGN KEY (`client`) REFERENCES `client` (`rowid`),
  CONSTRAINT event_tier FOREIGN KEY (`tier`) REFERENCES `tier` (`rowid`)
) ENGINE=InnoDB;
