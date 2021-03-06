-- MySQL Script generated by MySQL Workbench
-- 01/04/17 15:49:13
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema db14438496
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db14438496
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db14438496` DEFAULT CHARACTER SET latin1 ;
USE `db14438496` ;

-- -----------------------------------------------------
-- Table `db14438496`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db14438496`.`staff` (
  `staffid` INT(11) NOT NULL AUTO_INCREMENT,
  `role` VARCHAR(45) NOT NULL,
  `fname` VARCHAR(45) NOT NULL,
  `sname` VARCHAR(45) NOT NULL,
  `gender` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(15) NOT NULL,
  `dob` DATE NOT NULL,
  `address` VARCHAR(255) NULL DEFAULT NULL,
  `city` VARCHAR(45) NULL DEFAULT NULL,
  `country` VARCHAR(45) NULL DEFAULT 'UK',
  `postcode` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`staffid`))
ENGINE = InnoDB
AUTO_INCREMENT = 85923865
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `db14438496`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db14438496`.`cars` (
  `reg` VARCHAR(10) NOT NULL,
  `make` VARCHAR(50) NULL DEFAULT NULL,
  `model` VARCHAR(50) NULL DEFAULT NULL,
  `staffid` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`reg`),
  INDEX `staffid_idx` (`staffid` ASC),
  CONSTRAINT `staffid`
    FOREIGN KEY (`staffid`)
    REFERENCES `db14438496`.`staff` (`staffid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `db14438496`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db14438496`.`clients` (
  `clientid` INT(11) NOT NULL AUTO_INCREMENT,
  `fname` VARCHAR(45) NULL DEFAULT NULL,
  `sname` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `phone` VARCHAR(45) NULL DEFAULT NULL,
  `address` VARCHAR(255) NULL DEFAULT NULL,
  `city` VARCHAR(45) NULL DEFAULT NULL,
  `country` VARCHAR(45) NULL DEFAULT 'UK',
  `postcode` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`clientid`))
ENGINE = InnoDB
AUTO_INCREMENT = 83454357
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `db14438496`.`faults`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db14438496`.`faults` (
  `faultid` INT(11) NOT NULL AUTO_INCREMENT,
  `reg` VARCHAR(10) NOT NULL,
  `description` VARCHAR(1000) NOT NULL,
  PRIMARY KEY (`faultid`),
  INDEX `fk_flaws_cars1` (`reg` ASC),
  CONSTRAINT `fk_flaws_cars1`
    FOREIGN KEY (`reg`)
    REFERENCES `db14438496`.`cars` (`reg`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `db14438496`.`meetings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db14438496`.`meetings` (
  `meetingid` INT(11) NOT NULL AUTO_INCREMENT,
  `datetime` DATETIME NOT NULL,
  `clientid` INT(11) NOT NULL,
  `staffid` INT(11) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`meetingid`),
  INDEX `fk_meeting_clients1_idx` (`clientid` ASC),
  INDEX `fk_meeting_staff1_idx` (`staffid` ASC),
  CONSTRAINT `fk_meeting_clients1`
    FOREIGN KEY (`clientid`)
    REFERENCES `db14438496`.`clients` (`clientid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_meeting_staff1`
    FOREIGN KEY (`staffid`)
    REFERENCES `db14438496`.`staff` (`staffid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 12312362
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `db14438496`.`interviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db14438496`.`interviews` (
  `interviewid` INT(11) NOT NULL,
  `notes` VARCHAR(500) NULL DEFAULT NULL,
  `provisional_license` VARCHAR(1) NULL DEFAULT NULL,
  PRIMARY KEY (`interviewid`),
  INDEX `fk_interviews_meeting1_idx` (`interviewid` ASC),
  CONSTRAINT `fk_interviews_meeting1`
    FOREIGN KEY (`interviewid`)
    REFERENCES `db14438496`.`meetings` (`meetingid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `db14438496`.`lessons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db14438496`.`lessons` (
  `lessonid` INT(11) NOT NULL,
  `miles_driven` DOUBLE NULL DEFAULT NULL,
  `notes` VARCHAR(500) NULL DEFAULT NULL,
  PRIMARY KEY (`lessonid`),
  INDEX `fk_lessons_meeting1_idx` (`lessonid` ASC),
  CONSTRAINT `fk_lessons_meeting1`
    FOREIGN KEY (`lessonid`)
    REFERENCES `db14438496`.`meetings` (`meetingid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `db14438496`.`offices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db14438496`.`offices` (
  `officeid` INT(11) NOT NULL AUTO_INCREMENT,
  `managerid` INT(11) NOT NULL,
  `office_name` VARCHAR(45) NULL DEFAULT NULL,
  `address` VARCHAR(255) NULL DEFAULT NULL,
  `city` VARCHAR(45) NULL DEFAULT NULL,
  `country` VARCHAR(45) NULL DEFAULT 'UK',
  `postcode` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`officeid`),
  INDEX `fk_office_staff1_idx` (`managerid` ASC),
  CONSTRAINT `fk_office_staff1`
    FOREIGN KEY (`managerid`)
    REFERENCES `db14438496`.`staff` (`staffid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 10000002
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `db14438496`.`office_staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db14438496`.`office_staff` (
  `officeid` INT(11) NOT NULL,
  `staffid` INT(11) NOT NULL,
  PRIMARY KEY (`officeid`, `staffid`),
  INDEX `fk_office_staff_offices2_idx` (`officeid` ASC),
  INDEX `fk_office_staff_staff2_idx` (`staffid` ASC),
  CONSTRAINT `fk_office_staff_offices2`
    FOREIGN KEY (`officeid`)
    REFERENCES `db14438496`.`offices` (`officeid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_office_staff_staff2`
    FOREIGN KEY (`staffid`)
    REFERENCES `db14438496`.`staff` (`staffid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;
ALTER TABLE `db14438496`.`office_staff` 
ADD UNIQUE INDEX `staffid_UNIQUE` (`staffid` ASC);

-- -----------------------------------------------------
-- Table `db14438496`.`tests`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db14438496`.`tests` (
  `result` VARCHAR(4) NULL DEFAULT NULL,
  `testid` INT(11) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `note` VARCHAR(500) NULL DEFAULT NULL,
  PRIMARY KEY (`testid`),
  INDEX `fk_tests_meeting1_idx` (`testid` ASC),
  CONSTRAINT `fk_tests_meeting1`
    FOREIGN KEY (`testid`)
    REFERENCES `db14438496`.`meetings` (`meetingid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

USE `db14438496` ;

-- -----------------------------------------------------
-- Placeholder table for view `db14438496`.`avg_miles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db14438496`.`avg_miles` (`AVG(miles_driven)` INT);

-- -----------------------------------------------------
-- Placeholder table for view `db14438496`.`faultless_cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db14438496`.`faultless_cars` (`reg` INT, `make` INT, `model` INT);

-- -----------------------------------------------------
-- Placeholder table for view `db14438496`.`instructors_over_55`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db14438496`.`instructors_over_55` (`staffid` INT, `fname` INT, `sname` INT, `age` INT, `phone` INT);

-- -----------------------------------------------------
-- Placeholder table for view `db14438496`.`office_managers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db14438496`.`office_managers` (`officeid` INT, `office_name` INT, `fname` INT, `sname` INT, `phone` INT);

-- -----------------------------------------------------
-- Placeholder table for view `db14438496`.`total_staff_per_office`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db14438496`.`total_staff_per_office` (`officeid` INT, `office_name` INT, `COUNT(s.staffid)` INT);

-- -----------------------------------------------------
-- procedure check_client_availability
-- -----------------------------------------------------

DELIMITER $$
USE `db14438496`$$
CREATE DEFINER=`s14438496`@`%` PROCEDURE `check_client_availability`(
IN id INT,
IN date_time DATETIME,
IN new_type VARCHAR(20),
OUT available BOOLEAN)
BEGIN

	DECLARE done BOOLEAN DEFAULT 0;
    DECLARE time_holder DATETIME;
    DECLARE meeting_type VARCHAR(20);
    
    DECLARE times CURSOR FOR
	SELECT m.datetime, m.type
	FROM meetings m
	WHERE clientid = id;
	
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET
	done=1;
    
    SET available = true;
    
	OPEN times;
		the_loop: LOOP
			IF done THEN LEAVE the_loop; END IF;
			FETCH times INTO time_holder, meeting_type;
			IF date_diff(date_time, time_holder, meeting_type, new_type) = false THEN
				SET available = false;
			END IF;
        END LOOP;
    CLOSE times;
    
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure check_client_availability_update
-- -----------------------------------------------------

DELIMITER $$
USE `db14438496`$$
CREATE DEFINER=`s14438496`@`%` PROCEDURE `check_client_availability_update`(
IN id INT,
IN date_time DATETIME,
IN new_type VARCHAR(20),
IN meeting_id INT,
OUT available BOOLEAN)
BEGIN

	DECLARE done BOOLEAN DEFAULT 0;
    DECLARE time_holder DATETIME;
    DECLARE meeting_type VARCHAR(20);
    
    DECLARE times CURSOR FOR
	SELECT m.datetime, m.type
	FROM meetings m
	WHERE clientid = id
    AND m.meetingid != meeting_id;
	
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET
	done=1;
    
    SET available = true;
    
	OPEN times;
		the_loop: LOOP
			IF done THEN LEAVE the_loop; END IF;
			FETCH times INTO time_holder, meeting_type;
			IF date_diff(date_time, time_holder, meeting_type, new_type) = false THEN
				SET available = false;
			END IF;
        END LOOP;
    CLOSE times;
    
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure check_staff_availability
-- -----------------------------------------------------

DELIMITER $$
USE `db14438496`$$
CREATE DEFINER=`s14438496`@`%` PROCEDURE `check_staff_availability`(
IN id INT,
IN date_time DATETIME,
IN new_type VARCHAR(20),
OUT available BOOLEAN)
BEGIN

	DECLARE done BOOLEAN DEFAULT 0;
    DECLARE time_holder DATETIME;
    DECLARE meeting_type VARCHAR(20);
    
    DECLARE times CURSOR FOR
	SELECT m.datetime, m.type
	FROM meetings m
	WHERE staffid = id;
	
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET
	done=1;
    
    SET available = true;
    
	OPEN times;
		the_loop: LOOP
			IF done THEN LEAVE the_loop; END IF;
			FETCH times INTO time_holder, meeting_type;
			IF date_diff(date_time, time_holder, meeting_type, new_type) = false THEN
				SET available = false;
			END IF;
        END LOOP;
    CLOSE times;
    
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure check_staff_availability_update
-- -----------------------------------------------------

DELIMITER $$
USE `db14438496`$$
CREATE DEFINER=`s14438496`@`%` PROCEDURE `check_staff_availability_update`(
IN staff_id INT,
IN date_time DATETIME,
IN new_type VARCHAR(20),
IN meeting_id INT,
OUT available BOOLEAN)
BEGIN

	DECLARE done BOOLEAN DEFAULT 0;
    DECLARE time_holder DATETIME;
    DECLARE meeting_type VARCHAR(20);
    
    DECLARE times CURSOR FOR
	SELECT m.datetime, m.type
	FROM meetings m
	WHERE staffid = staff_id
    AND m.meetingid != meeting_id;
	
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET
	done=1;
    
    SET available = true;
    
	OPEN times;
		the_loop: LOOP
			IF done THEN LEAVE the_loop; END IF;
			FETCH times INTO time_holder, meeting_type;
			IF date_diff(date_time, time_holder, meeting_type, new_type) = false THEN
				SET available = false;
			END IF;
        END LOOP;
    CLOSE times;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- function date_diff
-- -----------------------------------------------------

DELIMITER $$
USE `db14438496`$$
CREATE DEFINER=`s14438496`@`%` FUNCTION `date_diff`(new_time DATETIME,old_time DATETIME, old_type VARCHAR(20), new_type VARCHAR(20)) RETURNS tinyint(1)
BEGIN
	DECLARE difference INT; 
    DECLARE available BOOLEAN; 
    DECLARE pre_threshold INT; 
    DECLARE post_threshold INT; 
    SET difference = TIMESTAMPDIFF(MINUTE,new_time,old_time);
	SET available = true;
    
    IF new_type = 'pre test meeting' OR new_type = 'post test meeting' THEN
		SET pre_threshold = 10;
    ELSE
		SET pre_threshold = 60;
	END IF;
    
    IF old_type = 'pre test meeting' OR old_type = 'post test meeting' THEN
		SET post_threshold = -10;
        
	ELSE
		SET post_threshold = -60;
	END IF;
    
    IF difference < pre_threshold AND difference > post_threshold THEN 
		SET available = false;
	END IF;
    
	RETURN available;
    
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure females_in_office
-- -----------------------------------------------------

DELIMITER $$
USE `db14438496`$$
CREATE DEFINER=`s14438496`@`%` PROCEDURE `females_in_office`(
IN officeid INT)
BEGIN
	SELECT s.fname, s.sname, s.gender
	FROM staff s
    JOIN office_staff os
    ON s.staffid = os.staffid
	WHERE os.officeid = officeid
	AND s.gender = 'female';
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure find_meeting_id
-- -----------------------------------------------------

DELIMITER $$
USE `db14438496`$$
CREATE DEFINER=`s14438496`@`%` PROCEDURE `find_meeting_id`(
IN date_time DATETIME,
IN staff_id INT,
OUT found_id INT)
BEGIN
	DECLARE fetch_id CURSOR FOR
    SELECT meetingid FROM meetings WHERE datetime = date_time AND staffid = staff_id;
    
    OPEN fetch_id;
    FETCH fetch_id INTO found_id;
    CLOSE fetch_id;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure interviews_conducted
-- -----------------------------------------------------

DELIMITER $$
USE `db14438496`$$
CREATE DEFINER=`s14438496`@`%` PROCEDURE `interviews_conducted`(
IN staffid INT)
BEGIN
	SELECT s.staffid, s.fname, s.sname, m.datetime, i.interviewid, i.notes, i.provisional_license
	FROM staff s
	JOIN meetings m
	ON s.staffid = m.staffid
	JOIN interviews i
	ON m.meetingid = i.interviewid
	WHERE s.staffid = staffid
    AND m.datetime < CURRENT_DATE();
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure passes_in_month
-- -----------------------------------------------------

DELIMITER $$
USE `db14438496`$$
CREATE DEFINER=`s14438496`@`%` PROCEDURE `passes_in_month`(
IN mnth INT,
IN yr INT)
BEGIN
	SELECT c.fname, c.sname
	FROM clients c
	JOIN meetings m
	ON m.clientid = c.clientid
	JOIN tests t
	ON t.testid = m.meetingid
	WHERE MONTH(m.datetime) = mnth
	AND YEAR(m.datetime) = yr
	AND t.result = 'pass'
    AND t.type = 'driving';
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure schedule_test
-- -----------------------------------------------------

DELIMITER $$
USE `db14438496`$$
CREATE DEFINER=`s14438496`@`%` PROCEDURE `schedule_test`(
IN client_id INT,
IN tester_id INT,
IN instructor_id INT,
IN date_time DATETIME,
IN test_type VARCHAR(10)
)
BEGIN
	DECLARE id_holder INT DEFAULT 0; 
    
    INSERT INTO meetings(datetime, clientid, staffid, type) 
	VALUES (date_time, client_id, tester_id, 'test');
    
    CALL find_meeting_id(date_time, tester_id, id_holder);
    
    IF id_holder != 0 THEN
		INSERT INTO tests(testid, type) 
		VALUES (id_holder, test_type);
		
		INSERT INTO meetings(datetime, staffid, clientid, type) 
		VALUES (ADDTIME(date_time, '01:00:00'),instructor_id, client_id, 'post test meeting');
		
		INSERT INTO meetings(datetime, staffid, clientid, type) 
		VALUES (DATE_SUB(date_time,INTERVAL 10 MINUTE), instructor_id, client_id, 'pre test meeting');
    END IF;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure staff_meetings_in_next_week
-- -----------------------------------------------------

DELIMITER $$
USE `db14438496`$$
CREATE DEFINER=`s14438496`@`%` PROCEDURE `staff_meetings_in_next_week`(
	IN staff_id INT
)
BEGIN
	SELECT s.staffid, s.fname, s.sname, m.datetime, m.type
	FROM staff s
	JOIN meetings m
	ON s.staffid = m.staffid
	WHERE TIMESTAMPDIFF(DAY,NOW(), m.datetime) BETWEEN 7 AND 14
	AND s.staffid = staff_id;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure triple_fail_check
-- -----------------------------------------------------

DELIMITER $$
USE `db14438496`$$
CREATE DEFINER=`s14438496`@`%` PROCEDURE `triple_fail_check`()
BEGIN
	DECLARE done BOOLEAN DEFAULT 0;
    DECLARE newid INT DEFAULT 1;
    DECLARE cid INT;
    DECLARE cfname VARCHAR(50);
    DECLARE csname VARCHAR(50);
    DECLARE cfails INT;
    
	DECLARE fails CURSOR FOR
	SELECT c.clientid, c.fname, c.sname, COUNT(*) as fails
	FROM clients c
	JOIN meetings m
	ON c.clientid = m.clientid
	JOIN tests t
	ON t.testid = m.meetingid
	WHERE t.result = 'fail'
    AND t.type = 'driving'
	AND c.clientid NOT IN(
		SELECT c.clientid
		FROM clients c
		JOIN meetings m
		ON c.clientid = m.clientid
		JOIN tests t
		ON t.testid = m.meetingid
		WHERE t.result = 'pass'
        AND t.type = 'driving')
	GROUP BY c.fname;
    
    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET
	done=1;
    
	CREATE TEMPORARY TABLE `temp` (
  `id` INT NOT NULL,
  `cid` INT NOT NULL,
  `firstname` VARCHAR(50) NULL,
  `surname` VARCHAR(50) NULL,
  `fails` INT NULL,
  PRIMARY KEY (`id`));
    
    OPEN fails;
		the_loop: LOOP
		IF done THEN LEAVE the_loop; END IF;
		FETCH fails INTO cid, cfname, csname, cfails;
        IF cfails > 3 THEN INSERT INTO temp VALUES (newid, cid, cfname, csname, cfails); end if;
        SET newid = newid + 1;
        END LOOP;
    CLOSE fails;
    
    SELECT * FROM temp
    GROUP BY cid;
    
	DROP TABLE temp;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- View `db14438496`.`avg_miles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db14438496`.`avg_miles`;
USE `db14438496`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`s14438496`@`%` SQL SECURITY DEFINER VIEW `db14438496`.`avg_miles` AS select avg(`db14438496`.`lessons`.`miles_driven`) AS `AVG(miles_driven)` from `db14438496`.`lessons`;

-- -----------------------------------------------------
-- View `db14438496`.`faultless_cars`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db14438496`.`faultless_cars`;
USE `db14438496`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`s14438496`@`%` SQL SECURITY DEFINER VIEW `db14438496`.`faultless_cars` AS select `db14438496`.`cars`.`reg` AS `reg`,`db14438496`.`cars`.`make` AS `make`,`db14438496`.`cars`.`model` AS `model` from `db14438496`.`cars` where (not(`db14438496`.`cars`.`reg` in (select `db14438496`.`faults`.`reg` from `db14438496`.`faults`)));

-- -----------------------------------------------------
-- View `db14438496`.`instructors_over_55`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db14438496`.`instructors_over_55`;
USE `db14438496`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`s14438496`@`%` SQL SECURITY DEFINER VIEW `db14438496`.`instructors_over_55` AS select `db14438496`.`staff`.`staffid` AS `staffid`,`db14438496`.`staff`.`fname` AS `fname`,`db14438496`.`staff`.`sname` AS `sname`,((year(curdate()) - year(`db14438496`.`staff`.`dob`)) - (date_format(curdate(),'00-%m-%d') < date_format(`db14438496`.`staff`.`dob`,'00-%m-%d'))) AS `age`,`db14438496`.`staff`.`phone` AS `phone` from `db14438496`.`staff` where ((`db14438496`.`staff`.`role` like '%instructor') and (((year(curdate()) - year(`db14438496`.`staff`.`dob`)) - (date_format(curdate(),'00-%m-%d') < date_format(`db14438496`.`staff`.`dob`,'00-%m-%d'))) > 55));

-- -----------------------------------------------------
-- View `db14438496`.`office_managers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db14438496`.`office_managers`;
USE `db14438496`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`s14438496`@`%` SQL SECURITY DEFINER VIEW `db14438496`.`office_managers` AS select `o`.`officeid` AS `officeid`,`o`.`office_name` AS `office_name`,`s`.`fname` AS `fname`,`s`.`sname` AS `sname`,`s`.`phone` AS `phone` from (`db14438496`.`staff` `s` join `db14438496`.`offices` `o` on((`s`.`staffid` = `o`.`managerid`))) where (`s`.`staffid` = `o`.`managerid`);

-- -----------------------------------------------------
-- View `db14438496`.`total_staff_per_office`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db14438496`.`total_staff_per_office`;
USE `db14438496`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`s14438496`@`%` SQL SECURITY DEFINER VIEW `db14438496`.`total_staff_per_office` AS select `o`.`officeid` AS `officeid`,`o`.`office_name` AS `office_name`,count(`s`.`staffid`) AS `COUNT(s.staffid)` from ((`db14438496`.`offices` `o` join `db14438496`.`office_staff` `os` on((`o`.`officeid` = `os`.`officeid`))) join `db14438496`.`staff` `s` on((`os`.`staffid` = `s`.`staffid`))) group by `o`.`officeid`;
USE `db14438496`;

DELIMITER $$
USE `db14438496`$$
CREATE
DEFINER=`s14438496`@`%`
TRIGGER `db14438496`.`faults_BEFORE_INSERT`
BEFORE INSERT ON `db14438496`.`faults`
FOR EACH ROW
BEGIN
	IF new.reg NOT IN (SELECT reg FROM cars) THEN
		SIGNAL SQLSTATE '45000' SET message_text =	'Not a recognised car. Add the car to the list of registered cars first.';
	END IF;
END$$

USE `db14438496`$$
CREATE
DEFINER=`s14438496`@`%`
TRIGGER `db14438496`.`faults_BEFORE_UPDATE`
BEFORE UPDATE ON `db14438496`.`faults`
FOR EACH ROW
BEGIN
	IF new.reg NOT IN (SELECT reg FROM cars) THEN
		SIGNAL SQLSTATE '45000' SET message_text =	'Not a recognised car. Add the car to the list of registered cars first.';
	END IF;
END$$

USE `db14438496`$$
CREATE
DEFINER=`s14438496`@`%`
TRIGGER `db14438496`.`meetings_BEFORE_INSERT`
BEFORE INSERT ON `db14438496`.`meetings`
FOR EACH ROW
BEGIN
	DECLARE available BOOLEAN;

	CALL check_staff_availability(new.staffid, new.datetime, new.type, available);
	
	IF available = false THEN
		SIGNAL SQLSTATE '45000' SET message_text =	'Instructor is busy at that time.';
	END IF;
	
	CALL check_client_availability(new.clientid, new.datetime, new.type, available);
    
	IF available = false THEN
		SIGNAL SQLSTATE '45000' SET message_text =	'Client is already booked in at that time.';
	END IF;
	
    IF new.type != 'lesson' AND new.type != 'test' AND new.type != 'interview' AND new.type != 'pre test meeting' AND new.type != 'post test meeting' THEN
		SIGNAL SQLSTATE '45000' SET message_text =	'Invalid meeting type';
	END IF;
    
    IF new.staffid NOT IN (SELECT staffid FROM staff) THEN
		SIGNAL SQLSTATE '45000' SET message_text =	'Not a recognised staff ID';
	END IF;
    
    IF new.clientid NOT IN (SELECT clientid FROM clients) THEN
		SIGNAL SQLSTATE '45000' SET message_text =	'Not a recognised client ID';
	END IF;
END$$

USE `db14438496`$$
CREATE
DEFINER=`s14438496`@`%`
TRIGGER `db14438496`.`meetings_BEFORE_UPDATE`
BEFORE UPDATE ON `db14438496`.`meetings`
FOR EACH ROW
BEGIN
	DECLARE available BOOLEAN;
    
    IF TIMESTAMPDIFF(MINUTE, NEW.datetime, OLD.datetime) != 0 THEN
		CALL check_staff_availability_update(new.staffid, new.datetime, new.type, old.meetingid, available);
		
		IF available = false THEN
			SIGNAL SQLSTATE '45000' SET message_text =	'Instructor is busy at that time.';
		END IF;
		
		CALL check_client_availability_update(new.clientid, new.datetime, new.type, old.meetingid, available);
        
		IF available = false THEN
			SIGNAL SQLSTATE '45000' SET message_text =	'Client is already booked in at that time.';
		END IF;
	END IF;
        
    IF new.type != 'lesson' AND new.type != 'test' AND new.type != 'interview' AND new.type != 'pre-test meeting' AND new.type != 'post-test meeting' THEN
		SIGNAL SQLSTATE '45000' SET message_text =	'Invalid meeting type';
	END IF;
    
	IF new.staffid NOT IN (SELECT staffid FROM staff) THEN
		SIGNAL SQLSTATE '45000' SET message_text =	'Not a recognised staff ID';
	END IF;
    
    IF new.clientid NOT IN (SELECT clientid FROM clients) THEN
		SIGNAL SQLSTATE '45000' SET message_text =	'Not a recognised client ID';
	END IF;
    
END$$

USE `db14438496`$$
CREATE
DEFINER=`s14438496`@`%`
TRIGGER `db14438496`.`meetings_BEFORE_DELETE`
BEFORE DELETE ON `db14438496`.`meetings`
FOR EACH ROW
BEGIN
	IF old.type = 'lesson' THEN
		DELETE FROM lessons WHERE lessonid = old.meetingid;
    END IF;
    
    IF old.type = 'interview' THEN
		DELETE FROM interviews WHERE interviewid = old.meetingid;
    END IF;
    
    IF old.type = 'test' THEN
		DELETE FROM tests WHERE testid = old.meetingid;
    END IF;
END$$

USE `db14438496`$$
CREATE
DEFINER=`s14438496`@`%`
TRIGGER `db14438496`.`interviews_BEFORE_INSERT`
BEFORE INSERT ON `db14438496`.`interviews`
FOR EACH ROW
BEGIN
	IF new.provisional_license != 'y' AND new.provisional_license != 'n' THEN
		SIGNAL SQLSTATE '45000' SET message_text =	'Invalid input for provisional license. Valid inputs are "y" or "n".';
	END IF;
    IF new.interviewid NOT IN (SELECT meetingid FROM meetings) THEN
		SIGNAL SQLSTATE '45000' SET message_text =	'Not a recognised meeting.';
	END IF;
END$$

USE `db14438496`$$
CREATE
DEFINER=`s14438496`@`%`
TRIGGER `db14438496`.`interviews_BEFORE_UPDATE`
BEFORE UPDATE ON `db14438496`.`interviews`
FOR EACH ROW
BEGIN
	IF new.provisional_license != 'y' AND new.provisional_license != 'n' THEN
		SIGNAL SQLSTATE '45000' SET message_text =	'Invalid input for provisional license. Valid inputs are "y" or "n".';
	END IF;
    IF new.interviewid NOT IN (SELECT meetingid FROM meetings) THEN
		SIGNAL SQLSTATE '45000' SET message_text =	'Not a recognised meeting.';
	END IF;
END$$

USE `db14438496`$$
CREATE
DEFINER=`s14438496`@`%`
TRIGGER `db14438496`.`lessons_BEFORE_INSERT`
BEFORE INSERT ON `db14438496`.`lessons`
FOR EACH ROW
BEGIN
	IF new.lessonid NOT IN (SELECT meetingid FROM meetings) THEN
		SIGNAL SQLSTATE '45000' SET message_text =	'Not a recognised meeting.';
	END IF;
END$$

USE `db14438496`$$
CREATE
DEFINER=`s14438496`@`%`
TRIGGER `db14438496`.`lessons_BEFORE_UPDATE`
BEFORE UPDATE ON `db14438496`.`lessons`
FOR EACH ROW
BEGIN
	IF new.lessonid NOT IN (SELECT meetingid FROM meetings) THEN
		SIGNAL SQLSTATE '45000' SET message_text =	'Not a recognised meeting.';
	END IF;
END$$

USE `db14438496`$$
CREATE
DEFINER=`s14438496`@`%`
TRIGGER `db14438496`.`tests_BEFORE_INSERT`
BEFORE INSERT ON `db14438496`.`tests`
FOR EACH ROW
BEGIN
    IF new.type != 'driving' AND new.type != 'written' THEN
		SIGNAL SQLSTATE '45000' SET message_text =	'Invalid test type';
	END IF;
END$$

USE `db14438496`$$
CREATE
DEFINER=`s14438496`@`%`
TRIGGER `db14438496`.`tests_BEFORE_UPDATE`
BEFORE UPDATE ON `db14438496`.`tests`
FOR EACH ROW
BEGIN
	IF new.type != 'driving' AND new.type != 'written' THEN
		SIGNAL SQLSTATE '45000' SET message_text =	'Invalid test type';
	END IF;
END$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
