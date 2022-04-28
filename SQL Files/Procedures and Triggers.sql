USE project_two;
SET SQL_SAFE_UPDATES=0;

-- Creating the procedure to delete players
DROP PROCEDURE IF EXISTS deletePlayer;

DELIMITER //

CREATE PROCEDURE deletePlayer(IN playerName VARCHAR(50), IN seasonYear INT)
BEGIN

  DELETE FROM rosters
  WHERE player = playerName AND season = seasonYear;

END//

DELIMITER ;

-- creating the procedure to insert players
DROP PROCEDURE IF EXISTS insertPlayer;
DELIMITER //

CREATE PROCEDURE insertPlayer(IN playerName VARCHAR(100), IN seasonYear INT, 
	IN playerNum INT, IN pos VARCHAR(5))
BEGIN 
	INSERT INTO rosters(tempID, teamID, season, leagueID, player, num, position, exp, playerID)
    VALUES(DEFAULT, 99999, seasonYear, 0, playerName, playerNum, pos, 'R', DEFAULT);
    INSERT INTO games(teamID, teamName)
    VALUES(99999, "Free Agent");
END// 
DELIMITER ;

-- creating the procedure to update players
DROP PROCEDURE IF EXISTS updatePlayer;

DELIMITER //

CREATE PROCEDURE updatePlayer(IN playerName VARCHAR(100), playerNum INT, IN pos VARCHAR(50), IN playerSchool VARCHAR(50), playerHeight VARCHAR(5), playerWeight INT)
BEGIN
	IF playerName != '' THEN 
		UPDATE rosters
		SET num = playerNum, position = pos, school = playerSchool, height = playerHeight, weight = playerWeight
		WHERE player = playerName;
	ELSE 
		SIGNAL SQLSTATE '22003'
		SET MESSAGE_TEXT = 'Player name should be populated',
		MYSQL_ERRNO = 1264;
	END IF;
END //
DELIMITER ;

/**CALL updatePlayer('Darius Garland', 2, '', 'Vanderbilt', '', 180);
SELECT * 
FROM rosters
WHERE player = 'Darius Garland';**/
			

/**** TRIGGERS *****************************************/

-- trigger to perform necessary checks on player before inserting
DROP TRIGGER IF EXISTS player_before_insert;

DELIMITER $$

CREATE TRIGGER player_before_insert
BEFORE INSERT 
ON rosters
FOR EACH ROW 
BEGIN
	IF NEW.player = '' OR NEW.player IS NULL THEN 
		SIGNAL SQLSTATE '22003'
		SET MESSAGE_TEXT = 'Player name should be populated',
		MYSQL_ERRNO = 1264;
	ELSEIF NEW.num IS NULL THEN  -- conditions for the trigger
		SIGNAL SQLSTATE '22003'
		SET MESSAGE_TEXT = 'Player age is less than minimum age of 19',
		MYSQL_ERRNO = 1264;
	ELSEIF NEW.position = '' THEN
		SIGNAL SQLSTATE '22003'
		SET MESSAGE_TEXT = 'Player experience is not R for rookie',
		MYSQL_ERRNO = 1264;
	END IF;
    
END $$
DELIMITER ; 

-- trigger to set appropriate emtpy fields to previous value before update
DROP TRIGGER IF EXISTS player_before_update;

DELIMITER $$

CREATE TRIGGER player_before_update
BEFORE UPDATE
ON rosters
FOR EACH ROW 
BEGIN 
	IF NEW.num = -99 THEN 
		SET NEW.num = OLD.num;
	END IF;
    
    IF NEW.position = '' THEN 
		SET NEW.position = OLD.position;
	END IF ;
    
    IF NEW.school = '' THEN 
		SET NEW.school = OLD.school;
	END IF ;
	
    IF NEW.height = '' THEN 
		SET NEW.height = OLD.height;
	END IF;
    
    IF NEW.weight = -99 THEN 
		SET NEW.weight = OLD.weight;
	END IF;
    
END $$
DELIMITER ;