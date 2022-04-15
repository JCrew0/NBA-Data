-- Player stats 2016-17
DROP VIEW IF EXISTS player_shooting_stats_2016_17;
CREATE VIEW player_shooting_stats_2016_17 AS 
	SELECT 
		player,
        seasonYear,
        SUM(fieldGoalsMade) /  SUM(fieldGoalsAttempted) * 100 AS player_fg_pct,
		SUM(threePointMade) / SUM(threePointAttempted) * 100 AS player_3_point_pct,
        SUM(freeThrowsMade) / SUM(freeThrowsAttempted) * 100 AS player_ft_pct
	FROM player_gamelogs
    WHERE seasonYear = '2016-17'
    GROUP BY player
    ORDER BY player;
    
SELECT *
FROM player_shooting_stats_2016_17;

-- Player stats 2017-18
DROP VIEW IF EXISTS player_shooting_stats_2017_18;
CREATE VIEW player_shooting_stats_2017_18 AS 
	SELECT 
		player,
        seasonYear,
        SUM(fieldGoalsMade) /  SUM(fieldGoalsAttempted) * 100 AS player_fg_pct,
		SUM(threePointMade) / SUM(threePointAttempted) * 100 AS player_3_point_pct,
        SUM(freeThrowsMade) / SUM(freeThrowsAttempted) * 100 AS player_ft_pct
	FROM player_gamelogs
    WHERE seasonYear = '2017-18'
    GROUP BY player
    ORDER BY player;
    
SELECT *
FROM player_shooting_stats_2017_18;

-- Player stats 2018-19
DROP VIEW IF EXISTS player_shooting_stats_2018_19;
CREATE VIEW player_shooting_stats_2018_19 AS 
	SELECT 
		player,
        seasonYear,
        SUM(fieldGoalsMade) /  SUM(fieldGoalsAttempted) * 100 AS player_fg_pct,
		SUM(threePointMade) / SUM(threePointAttempted) * 100 AS player_3_point_pct,
        SUM(freeThrowsMade) / SUM(freeThrowsAttempted) * 100 AS player_ft_pct
	FROM player_gamelogs
    WHERE seasonYear = '2018-19'
    GROUP BY player
    ORDER BY player;
    
SELECT *
FROM player_shooting_stats_2018_19;

-- Player stats 2019-20
DROP VIEW IF EXISTS player_shooting_stats_2019_20;
CREATE VIEW player_shooting_stats_2019_20 AS 
	SELECT 
		player,
        seasonYear,
        SUM(fieldGoalsMade) /  SUM(fieldGoalsAttempted) * 100 AS player_fg_pct,
		SUM(threePointMade) / SUM(threePointAttempted) * 100 AS player_3_point_pct,
        SUM(freeThrowsMade) / SUM(freeThrowsAttempted) * 100 AS player_ft_pct
	FROM player_gamelogs
    WHERE seasonYear = '2019-20'
    GROUP BY player
    ORDER BY player;
    
SELECT *
FROM player_shooting_stats_2019_20;

-- Player stats 2020-21
DROP VIEW IF EXISTS player_shooting_stats_2020_21;
CREATE VIEW player_shooting_stats_2020_21 AS 
	SELECT 
		player,
        seasonYear,
        SUM(fieldGoalsMade) /  SUM(fieldGoalsAttempted) * 100 AS player_fg_pct,
		SUM(threePointMade) / SUM(threePointAttempted) * 100 AS player_3_point_pct,
        SUM(freeThrowsMade) / SUM(freeThrowsAttempted) * 100 AS player_ft_pct
	FROM player_gamelogs
    WHERE seasonYear = '2020-21'
    GROUP BY player
    ORDER BY player;
    
    
-- Procedure to get points per game for a player in certain season
DROP PROCEDURE IF EXISTS getPPG;

DELIMITER $$
CREATE PROCEDURE getPPG(IN playerName VARCHAR(100), IN season VARCHAR(100), OUT ppg VARCHAR(100))

BEGIN         
	IF season = '2016-17' OR season = '2017-18' OR season = '2018-19'
		OR season = '2019-20' OR season ='2020-21' THEN
        
		SELECT CONCAT(playerName, ' ', SUM(points)/COUNT(tempID))
		INTO ppg 
		FROM player_gamelogs
		WHERE seasonYear = season AND player = playerName;
	ELSE 
		SELECT CONCAT('Season inserted is NOT VALID- reenter in the correct format');
	END IF;
END $$

CALL getPPG('James Harden', '2016-17', @ppg);
SELECT @ppg;

CALL getPPG('Lebron James', '2016-17', @ppg);
SELECT @ppg;

CALL getPPG('Dwyane Wade', '2016-17', @ppg);
SELECT @ppg;

-- Incorrect call
CALL getPPG('Reggie Jackson', '2018-2019', @ppg);


-- Get rebounds per game for a certain player in a certain season
DROP PROCEDURE IF EXISTS getRPG;

DELIMITER $$
CREATE PROCEDURE getRPG(IN playerName VARCHAR(100), IN season VARCHAR(100), OUT rpg VARCHAR(100))

BEGIN         
	IF season = '2016-17' OR season = '2017-18' OR season = '2018-19'
		OR season = '2019-20' OR season ='2020-21' THEN
        
		SELECT CONCAT(playerName, ' ', SUM(rebounds)/COUNT(tempID))
		INTO rpg 
		FROM player_gamelogs
		WHERE seasonYear = season AND player = playerName;
	ELSE 
		SELECT CONCAT('Season inserted is NOT VALID- reenter in the correct format');
	END IF;
END $$

CALL getRPG('James Harden', '2016-17', @rpg);
SELECT @rpg;

CALL getRPG('Lebron James', '2016-17', @rpg);
SELECT @rpg;

CALL getRPG('Dwyane Wade', '2016-17', @rpg);
SELECT @rpg;

-- Incorrect call
CALL getRPG('Reggie Jackson', '2018-2019', @rpg);


-- Get rebounds per game for a certain player in a certain season
DROP PROCEDURE IF EXISTS getAPG;

DELIMITER $$
CREATE PROCEDURE getAPG(IN playerName VARCHAR(100), IN season VARCHAR(100), OUT apg VARCHAR(100))

BEGIN         
	IF season = '2016-17' OR season = '2017-18' OR season = '2018-19'
		OR season = '2019-20' OR season ='2020-21' THEN
        
		SELECT CONCAT(playerName, ' ', SUM(assists)/COUNT(tempID))
		INTO apg 
		FROM player_gamelogs
		WHERE seasonYear = season AND player = playerName;
	ELSE 
		SELECT CONCAT('Season inserted is NOT VALID- reenter in the correct format');
	END IF;
END $$
 
 -- testing
CALL getAPG('James Harden', '2016-17', @apg);
SELECT @apg;

CALL getAPG('Lebron James', '2016-17', @apg);
SELECT @apg;

CALL getAPG('Dwyane Wade', '2016-17', @apg);
SELECT @apg;

-- Incorrect call
CALL getAPG('Reggie Jackson', '2018-2019', @apg);


/******** TRIGGERS *************************/
DROP TRIGGER IF EXISTS player_before_insert;

DELIMITER $$

CREATE TRIGGER player_before_insert
BEFORE INSERT 
ON player_list_2016
FOR EACH ROW 
BEGIN
	IF NEW.age < 19 THEN  -- conditions for the trigger
		SIGNAL SQLSTATE '22003'
		SET MESSAGE_TEXT = 'Player age is less than minimum age of 19',
		MYSQL_ERRNO = 1264;
	ELSEIF NEW.exp != 'R' THEN
		SIGNAL SQLSTATE '22003'
		SET MESSAGE_TEXT = 'Player experience is not R for rookie',
		MYSQL_ERRNO = 1264;
	ELSEIF LENGTH(NEW.teamAbv) != 3 THEN
		SIGNAL SQLSTATE '22003'
		SET MESSAGE_TEXT = 'Team abbreviation is not valid',
		MYSQL_ERRNO = 1264;
	END IF;
    
END $$

-- Instance that activates the trigger with an invalid age    
INSERT INTO player_list_2016(playerID, player, teamAbv, exp, age, position)
VALUES(DEFAULT, 'John Wick', 'MIAI', '1', 19, 'F');
