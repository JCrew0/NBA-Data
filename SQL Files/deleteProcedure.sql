USE project_two;

DROP PROCEDURE IF EXISTS deletePlayer;

DELIMITER //

CREATE PROCEDURE deletePlayer(IN playerName VARCHAR(50), IN seasonYear INT)
BEGIN

  DELETE FROM rosters
  WHERE player = playerName AND season = seasonYear;

END//

DELIMITER ;


DROP PROCEDURE IF EXISTS insertPlayer;
DELIMITER //

CREATE PROCEDURE insertPlayer(IN playerName VARCHAR(100), IN seasonYear INT, 
	IN playerNum INT, IN pos VARCHAR(5))
BEGIN 
	INSERT INTO rosters(tempID, season, leagueID, player, num, position, exp, playerID)
    VALUES(DEFAULT, seasonYear, 0, playerName, playerNum, pos, 'R', DEFAULT);
    
END// 
DELIMITER ;


/**** TRIGGERS *****************************************/

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
 


    
