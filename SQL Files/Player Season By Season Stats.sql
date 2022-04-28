-- 2016-17
DROP TABLE IF EXISTS player_2016_stats;
CREATE TABLE IF NOT EXISTS player_2016_stats(
	SELECT
		rosters.playerID,
        rosters.player,
        player_gamelogs.teamID,
        player_gamelogs.teamName,
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
	GROUP BY rosters.playerID
	);

ALTER TABLE player_2016_stats
MODIFY playerID BIGINT NOT NULL;

ALTER TABLE player_2016_stats
ADD PRIMARY KEY (playerID);

ALTER TABLE player_2016_stats
ADD FOREIGN KEY (teamID) REFERENCES team_2016_stats(teamID);

-- 2017-2018
DROP TABLE IF EXISTS player_2017_stats;
CREATE TABLE IF NOT EXISTS player_2017_stats(
	SELECT
		rosters.playerID,
        rosters.player,
        player_gamelogs.teamID,
        player_gamelogs.teamName,
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
	GROUP BY rosters.playerID
	);

ALTER TABLE player_2017_stats
MODIFY playerID BIGINT NOT NULL;
    
ALTER TABLE player_2017_stats
ADD PRIMARY KEY (playerID);

ALTER TABLE player_2017_stats
ADD FOREIGN KEY (teamID) REFERENCES team_2017_stats(teamID);

-- 2018-19
DROP TABLE IF EXISTS player_2018_stats;
CREATE TABLE IF NOT EXISTS player_2018_stats(
	SELECT
		rosters.playerID,
        rosters.player,
        player_gamelogs.teamID,
        player_gamelogs.teamName,
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
	GROUP BY rosters.playerID
	);
    
ALTER TABLE player_2018_stats
MODIFY playerID BIGINT NOT NULL;
    
ALTER TABLE player_2018_stats
ADD PRIMARY KEY (playerID);

ALTER TABLE player_2018_stats
ADD FOREIGN KEY (teamID) REFERENCES team_2018_stats(teamID);

-- 2019-20
DROP TABLE IF EXISTS player_2019_stats;
CREATE TABLE IF NOT EXISTS player_2019_stats(
	SELECT
		rosters.playerID,
        rosters.player,
        player_gamelogs.teamID,
        player_gamelogs.teamName,
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
	GROUP BY rosters.playerID
	);

ALTER TABLE player_2019_stats
MODIFY playerID BIGINT NOT NULL;
    
ALTER TABLE player_2019_stats
ADD PRIMARY KEY (playerID);

ALTER TABLE player_2019_stats
ADD FOREIGN KEY (teamID) REFERENCES team_2019_stats(teamID);

-- 2020- 21
DROP TABLE IF EXISTS player_2020_stats;
CREATE TABLE IF NOT EXISTS player_2020_stats(
	SELECT
		rosters.playerID,
        rosters.player,
        player_gamelogs.teamID,
        player_gamelogs.teamName,
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
	GROUP BY rosters.playerID
	);

ALTER TABLE player_2020_stats
MODIFY playerID BIGINT NOT NULL;

ALTER TABLE player_2020_stats
ADD PRIMARY KEY (playerID);

ALTER TABLE player_2020_stats
ADD FOREIGN KEY (teamID) REFERENCES team_2020_stats(teamID);
