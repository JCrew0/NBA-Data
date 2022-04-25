/**** TEAM STATS **************/
-- 2016-17 
DROP TABLE IF EXISTS team_2016_stats;
CREATE TABLE IF NOT EXISTS team_2016_stats (
	SELECT
		seasonID, 
        teamID, 
        teamAbv,
        teamName, 
        SUM(points) AS totalPoints,
        SUM(rebounds) AS totalRebounds,
        SUM(defensiveRebounds) AS totalDRB,
        SUM(offensiveRebounds) AS totalORB,
        SUM(assists) AS totalAssists,
        SUM(steals) AS totalSteals,
        SUM(blocks) AS totalBlocks,
        SUM(turnovers) AS totalTurnovers,
        SUM(personalFouls) AS totalFouls,
        SUM(plusMinus) AS totalPlusMinus,
        SUM(fieldGoalsMade) AS totalFGM,
        SUM(fieldGoalsAttempted) AS totalFGA,
        SUM(freeThrowsMade) AS totalFTM,
        SUM(freeThrowsAttempted) totalFTA,
        SUM(threePointMade) AS total3PM,
        SUM(threePointAttempted) AS total3PA
	FROM games
    WHERE seasonID = 22016
	GROUP BY games.teamName);
    
ALTER TABLE team_2016_stats
ADD PRIMARY KEY (teamID);


-- 2017-18
DROP TABLE IF EXISTS team_2017_stats;
CREATE TABLE IF NOT EXISTS team_2017_stats (
	SELECT
		seasonID, 
        teamID, 
        teamAbv,
        teamName, 
        SUM(points) AS totalPoints,
        SUM(rebounds) AS totalRebounds,
        SUM(defensiveRebounds) AS totalDRB,
        SUM(offensiveRebounds) AS totalORB,
        SUM(assists) AS totalAssists,
        SUM(steals) AS totalSteals,
        SUM(blocks) AS totalBlocks,
        SUM(turnovers) AS totalTurnovers,
        SUM(personalFouls) AS totalFouls,
        SUM(plusMinus) AS totalPlusMinus,
        SUM(fieldGoalsMade) AS totalFGM,
        SUM(fieldGoalsAttempted) AS totalFGA,
        SUM(freeThrowsMade) AS totalFTM,
        SUM(freeThrowsAttempted) totalFTA,
        SUM(threePointMade) AS total3PM,
        SUM(threePointAttempted) AS total3PA
	FROM games
    WHERE seasonID = 22017
	GROUP BY games.teamName);
    
ALTER TABLE team_2017_stats
ADD PRIMARY KEY (teamID);


-- 2018-19 stats
DROP TABLE IF EXISTS team_2018_stats;
CREATE TABLE IF NOT EXISTS team_2018_stats (
	SELECT
		seasonID, 
        teamID, 
        teamAbv,
        teamName, 
        SUM(points) AS totalPoints,
        SUM(rebounds) AS totalRebounds,
        SUM(defensiveRebounds) AS totalDRB,
        SUM(offensiveRebounds) AS totalORB,
        SUM(assists) AS totalAssists,
        SUM(steals) AS totalSteals,
        SUM(blocks) AS totalBlocks,
        SUM(turnovers) AS totalTurnovers,
        SUM(personalFouls) AS totalFouls,
        SUM(plusMinus) AS totalPlusMinus,
        SUM(fieldGoalsMade) AS totalFGM,
        SUM(fieldGoalsAttempted) AS totalFGA,
        SUM(freeThrowsMade) AS totalFTM,
        SUM(freeThrowsAttempted) totalFTA,
        SUM(threePointMade) AS total3PM,
        SUM(threePointAttempted) AS total3PA
	FROM games
    WHERE seasonID = 22018
	GROUP BY games.teamName);
    
ALTER TABLE team_2018_stats
ADD PRIMARY KEY (teamID);


-- 2019-20 stats
DROP TABLE IF EXISTS team_2019_stats;
CREATE TABLE IF NOT EXISTS team_2019_stats (
	SELECT
		seasonID, 
        teamID, 
        teamAbv,
        teamName, 
        SUM(points) AS totalPoints,
        SUM(rebounds) AS totalRebounds,
        SUM(defensiveRebounds) AS totalDRB,
        SUM(offensiveRebounds) AS totalORB,
        SUM(assists) AS totalAssists,
        SUM(steals) AS totalSteals,
        SUM(blocks) AS totalBlocks,
        SUM(turnovers) AS totalTurnovers,
        SUM(personalFouls) AS totalFouls,
        SUM(plusMinus) AS totalPlusMinus,
        SUM(fieldGoalsMade) AS totalFGM,
        SUM(fieldGoalsAttempted) AS totalFGA,
        SUM(freeThrowsMade) AS totalFTM,
        SUM(freeThrowsAttempted) totalFTA,
        SUM(threePointMade) AS total3PM,
        SUM(threePointAttempted) AS total3PA
	FROM games
    WHERE seasonID = 22019
	GROUP BY games.teamName);
    
ALTER TABLE team_2019_stats
ADD PRIMARY KEY (teamID);



-- 2020-21 stats
DROP TABLE IF EXISTS team_2020_stats;
CREATE TABLE IF NOT EXISTS team_2020_stats (
	SELECT
		seasonID, 
        teamID, 
        teamAbv,
        teamName, 
        SUM(points) AS totalPoints,
        SUM(rebounds) AS totalRebounds,
        SUM(defensiveRebounds) AS totalDRB,
        SUM(offensiveRebounds) AS totalORB,
        SUM(assists) AS totalAssists,
        SUM(steals) AS totalSteals,
        SUM(blocks) AS totalBlocks,
        SUM(turnovers) AS totalTurnovers,
        SUM(personalFouls) AS totalFouls,
        SUM(plusMinus) AS totalPlusMinus,
        SUM(fieldGoalsMade) AS totalFGM,
        SUM(fieldGoalsAttempted) AS totalFGA,
        SUM(freeThrowsMade) AS totalFTM,
        SUM(freeThrowsAttempted) totalFTA,
        SUM(threePointMade) AS total3PM,
        SUM(threePointAttempted) AS total3PA
	FROM games
    WHERE seasonID = 22020
	GROUP BY games.teamName);
    
ALTER TABLE team_2020_stats
ADD PRIMARY KEY (teamID);





SELECT *
FROM team_2016_stats;

SELECT *
FROM team_2017_stats;

SELECT *
FROM team_2018_stats;

SELECT * 
FROM team_2019_stats;

SELECT *
FROM team_2020_stats;
