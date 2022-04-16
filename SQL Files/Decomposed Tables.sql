/*** PLAYER STATS ****/

-- 2016-17
DROP TABLE IF EXISTS player_2016_stats;
CREATE TABLE IF NOT EXISTS player_2016_stats(
	SELECT
		rosters.playerID,
        rosters.player,
        player_gamelogs.teamAbv,
        exp,
        age,
        position,
        SUM(points) AS totalPoints,
        SUM(rebounds) AS totalRebounds,
        SUM(defensiveRebounds) AS totalDRB,
        SUM(offensiveRebounds) AS totalORB,
        SUM(assists) AS totalAssists,
        SUM(steals) AS totalSteals,
        SUM(blocks) AS totalBlocks,
        SUM(blocksAgainst) AS totalBlocksAgainst,
        SUM(turnovers) AS totalTurnovers,
        SUM(personalFouls) AS totalFouls,
        SUM(personalFoulsDrawn) AS totalFoulsDrawn,
        SUM(plusMinus) AS totalPlusMinus,
        SUM(fieldGoalsMade) AS totalFGM,
        SUM(fieldGoalsAttempted) AS totalFGA,
        SUM(freeThrowsMade) AS totalFTM,
        SUM(freeThrowsAttempted) totalFTA,
        SUM(threePointMade) AS total3PM,
        SUM(threePointAttempted) AS total3PA,
        SUM(minutesPlayed) AS totalMinutes
	FROM rosters
		INNER JOIN player_gamelogs ON rosters.playerID = player_gamelogs.playerID
	WHERE rosters.season = 2016 AND player_gamelogs.seasonYear = '2016-17'
	GROUP BY rosters.player
	);
    
ALTER TABLE player_2016_stats
ADD PRIMARY KEY (playerID);
    
-- 2017-18
DROP TABLE IF EXISTS player_2017_stats;
CREATE TABLE IF NOT EXISTS player_2017_stats(
	SELECT
		rosters.playerID,
        rosters.player,
        player_gamelogs.teamAbv,
        exp,
        age,
        position,
        SUM(points) AS totalPoints,
        SUM(rebounds) AS totalRebounds,
        SUM(defensiveRebounds) AS totalDRB,
        SUM(offensiveRebounds) AS totalORB,
        SUM(assists) AS totalAssists,
        SUM(steals) AS totalSteals,
        SUM(blocks) AS totalBlocks,
        SUM(blocksAgainst) AS totalBlocksAgainst,
        SUM(turnovers) AS totalTurnovers,
        SUM(personalFouls) AS totalFouls,
        SUM(personalFoulsDrawn) AS totalFoulsDrawn,
        SUM(plusMinus) AS totalPlusMinus,
        SUM(fieldGoalsMade) AS totalFGM,
        SUM(fieldGoalsAttempted) AS totalFGA,
        SUM(freeThrowsMade) AS totalFTM,
        SUM(freeThrowsAttempted) totalFTA,
        SUM(threePointMade) AS total3PM,
        SUM(threePointAttempted) AS total3PA,
        SUM(minutesPlayed) AS totalMinutes
	FROM rosters
		INNER JOIN player_gamelogs ON rosters.playerID = player_gamelogs.playerID
	WHERE rosters.season = 2017 AND player_gamelogs.seasonYear = '2017-18'
	GROUP BY rosters.player
	);
    
ALTER TABLE player_2017_stats
ADD PRIMARY KEY (playerID);
    
    
-- 2018-19 Player stats
DROP TABLE IF EXISTS player_2018_stats;
CREATE TABLE IF NOT EXISTS player_2018_stats(
	SELECT
		rosters.playerID,
        rosters.player,
        player_gamelogs.teamAbv,
        exp,
        age,
        position,
        SUM(points) AS totalPoints,
        SUM(rebounds) AS totalRebounds,
        SUM(defensiveRebounds) AS totalDRB,
        SUM(offensiveRebounds) AS totalORB,
        SUM(assists) AS totalAssists,
        SUM(steals) AS totalSteals,
        SUM(blocks) AS totalBlocks,
        SUM(blocksAgainst) AS totalBlocksAgainst,
        SUM(turnovers) AS totalTurnovers,
        SUM(personalFouls) AS totalFouls,
        SUM(personalFoulsDrawn) AS totalFoulsDrawn,
        SUM(plusMinus) AS totalPlusMinus,
        SUM(fieldGoalsMade) AS totalFGM,
        SUM(fieldGoalsAttempted) AS totalFGA,
        SUM(freeThrowsMade) AS totalFTM,
        SUM(freeThrowsAttempted) totalFTA,
        SUM(threePointMade) AS total3PM,
        SUM(threePointAttempted) AS total3PA,
        SUM(minutesPlayed) AS totalMinutes
	FROM rosters
		INNER JOIN player_gamelogs ON rosters.playerID = player_gamelogs.playerID
	WHERE rosters.season = 2018 AND player_gamelogs.seasonYear = '2018-19'
	GROUP BY rosters.player
	);
    
ALTER TABLE player_2018_stats
ADD PRIMARY KEY (playerID);

-- Player 2019-20 stats
DROP TABLE IF EXISTS player_2019_stats;
CREATE TABLE IF NOT EXISTS player_2019_stats(
	SELECT
		rosters.playerID,
        rosters.player,
        player_gamelogs.teamAbv,
        exp,
        age,
        position,
        SUM(points) AS totalPoints,
        SUM(rebounds) AS totalRebounds,
        SUM(defensiveRebounds) AS totalDRB,
        SUM(offensiveRebounds) AS totalORB,
        SUM(assists) AS totalAssists,
        SUM(steals) AS totalSteals,
        SUM(blocks) AS totalBlocks,
        SUM(blocksAgainst) AS totalBlocksAgainst,
        SUM(turnovers) AS totalTurnovers,
        SUM(personalFouls) AS totalFouls,
        SUM(personalFoulsDrawn) AS totalFoulsDrawn,
        SUM(plusMinus) AS totalPlusMinus,
        SUM(fieldGoalsMade) AS totalFGM,
        SUM(fieldGoalsAttempted) AS totalFGA,
        SUM(freeThrowsMade) AS totalFTM,
        SUM(freeThrowsAttempted) totalFTA,
        SUM(threePointMade) AS total3PM,
        SUM(threePointAttempted) AS total3PA,
        SUM(minutesPlayed) AS totalMinutes
	FROM rosters
		INNER JOIN player_gamelogs ON rosters.playerID = player_gamelogs.playerID
	WHERE rosters.season = 2019 AND player_gamelogs.seasonYear = '2019-20'
	GROUP BY rosters.player
	);
    
ALTER TABLE player_2019_stats
ADD PRIMARY KEY (playerID);

-- Player 2020-21 stats
DROP TABLE IF EXISTS player_2020_stats;
CREATE TABLE IF NOT EXISTS player_2020_stats(
	SELECT
		rosters.playerID,
        rosters.player,
        player_gamelogs.teamAbv,
        exp,
        age,
        position,
        SUM(points) AS totalPoints,
        SUM(rebounds) AS totalRebounds,
        SUM(defensiveRebounds) AS totalDRB,
        SUM(offensiveRebounds) AS totalORB,
        SUM(assists) AS totalAssists,
        SUM(steals) AS totalSteals,
        SUM(blocks) AS totalBlocks,
        SUM(blocksAgainst) AS totalBlocksAgainst,
        SUM(turnovers) AS totalTurnovers,
        SUM(personalFouls) AS totalFouls,
        SUM(personalFoulsDrawn) AS totalFoulsDrawn,
        SUM(plusMinus) AS totalPlusMinus,
        SUM(fieldGoalsMade) AS totalFGM,
        SUM(fieldGoalsAttempted) AS totalFGA,
        SUM(freeThrowsMade) AS totalFTM,
        SUM(freeThrowsAttempted) totalFTA,
        SUM(threePointMade) AS total3PM,
        SUM(threePointAttempted) AS total3PA,
        SUM(minutesPlayed) AS totalMinutes
	FROM rosters
		INNER JOIN player_gamelogs ON rosters.playerID = player_gamelogs.playerID
	WHERE rosters.season = 2020 AND player_gamelogs.seasonYear = '2020-21'
	GROUP BY rosters.player
	);
    
ALTER TABLE player_2020_stats
ADD PRIMARY KEY (playerID);


-- ****** Player list each season **************************************
-- 2016-2017
DROP TABLE IF EXISTS player_list_2016;
CREATE TABLE IF NOT EXISTS player_list_2016(
	SELECT 
		rosters.playerID,
        rosters.player,
        school,
        player_gamelogs.teamAbv,
        exp,
        age,
        position
	FROM rosters
		INNER JOIN player_gamelogs ON rosters.playerID = player_gamelogs.playerID
	WHERE rosters.season = 2016 AND player_gamelogs.seasonYear = '2016-17'
	GROUP BY rosters.player
);

ALTER TABLE player_list_2016
ADD PRIMARY KEY (playerID);


-- player list 2017-18
DROP TABLE IF EXISTS player_list_2017;
CREATE TABLE IF NOT EXISTS player_list_2017(
	SELECT 
		rosters.playerID,
        rosters.player,
        school,
        player_gamelogs.teamAbv,
        exp,
        age,
        position
	FROM rosters
		INNER JOIN player_gamelogs ON rosters.playerID = player_gamelogs.playerID
	WHERE rosters.season = 2017 AND player_gamelogs.seasonYear = '2017-18'
	GROUP BY rosters.player
);

ALTER TABLE player_list_2017
ADD PRIMARY KEY (playerID);


-- player list 2018-19
DROP TABLE IF EXISTS player_list_2018;
CREATE TABLE IF NOT EXISTS player_list_2018(
	SELECT 
		rosters.playerID,
        rosters.player,
        school,
        player_gamelogs.teamAbv,
        exp,
        age,
        position
	FROM rosters
		INNER JOIN player_gamelogs ON rosters.playerID = player_gamelogs.playerID
	WHERE rosters.season = 2018 AND player_gamelogs.seasonYear = '2018-19'
	GROUP BY rosters.player
);

ALTER TABLE player_list_2018
ADD PRIMARY KEY (playerID);


-- player list 2019-20
DROP TABLE IF EXISTS player_list_2019;
CREATE TABLE IF NOT EXISTS player_list_2019(
	SELECT 
		rosters.playerID,
        rosters.player,
        school,
        player_gamelogs.teamAbv,
        exp,
        age,
        position
	FROM rosters
		INNER JOIN player_gamelogs ON rosters.playerID = player_gamelogs.playerID
	WHERE rosters.season = 2019 AND player_gamelogs.seasonYear = '2019-20'
	GROUP BY rosters.player
);

ALTER TABLE player_list_2019
ADD PRIMARY KEY (playerID);


-- player list 2019-19
DROP TABLE IF EXISTS player_list_2020;
CREATE TABLE IF NOT EXISTS player_list_2020(
	SELECT 
		rosters.playerID,
        rosters.player,
        school,
        player_gamelogs.teamAbv,
        exp,
        age,
        position
	FROM rosters
		INNER JOIN player_gamelogs ON rosters.playerID = player_gamelogs.playerID
	WHERE rosters.season = 2020 AND player_gamelogs.seasonYear = '2020-21'
	GROUP BY rosters.player
);

ALTER TABLE player_list_2020
ADD PRIMARY KEY (playerID);

SELECT *
FROM player_2016_stats;

SELECT *
FROM player_list_2016;

SELECT *
FROM player_2017_stats;

SELECT *
FROM player_list_2017;

SELECT *
FROM player_2018_stats;

SELECT *
FROM player_list_2018;

SELECT *
FROM player_2019_stats;

SELECT *
FROM player_list_2019;

SELECT *
FROM player_2020_stats;

SELECT *
FROM player_list_2020;