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
    

