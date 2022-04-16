USE project_two;

DROP PROCEDURE IF EXISTS deletePlayer;

DELIMITER //

CREATE PROCEDURE deletePlayer(IN playerName VARCHAR(50))
BEGIN

  DELETE FROM rosters
  WHERE player = playerName;

END//

DELIMITER ;

