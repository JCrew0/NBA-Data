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
