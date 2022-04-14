SET GLOBAL local_infile=1; /*Needed to remove errors on Windows */

DROP DATABASE IF EXISTS project_two;
CREATE DATABASE project_two; 
USE project_two;

DROP TABLE IF EXISTS rosters;
CREATE TABLE IF NOT EXISTS rosters (
	tempID BIGINT,
    teamID BIGINT,
    season INT,
    leagueID INT,
    player VARCHAR(100), 
    playerSlug VARCHAR(100), 
    num INT, 
    position VARCHAR(5), 
    height VARCHAR(5), 
    weight INT, 
    birthDate VARCHAR(50), 
    age DECIMAL, 
    exp VARCHAR(2), 
    school VARCHAR(100), 
    playerID BIGINT
);

LOAD DATA
    LOCAL INFILE 'C:/Users/justi/OneDrive/Documents/College/Senior Year/Spring/CS 3265/Project 2/rosters_2017.csv'
    INTO TABLE rosters
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
    
LOAD DATA
    LOCAL INFILE 'C:/Users/justi/OneDrive/Documents/College/Senior Year/Spring/CS 3265/Project 2/rosters_2018.csv'
    INTO TABLE rosters
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
    
LOAD DATA
    LOCAL INFILE 'C:/Users/justi/OneDrive/Documents/College/Senior Year/Spring/CS 3265/Project 2/rosters_2019.csv'
    INTO TABLE rosters
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
    
LOAD DATA
    LOCAL INFILE 'C:/Users/justi/OneDrive/Documents/College/Senior Year/Spring/CS 3265/Project 2/rosters_2020.csv'
    INTO TABLE rosters
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
    
LOAD DATA
    LOCAL INFILE 'C:/Users/justi/OneDrive/Documents/College/Senior Year/Spring/CS 3265/Project 2/rosters_2021.csv'
    INTO TABLE rosters
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;

-- shotcharts
DROP TABLE IF EXISTS shotchart;
CREATE TABLE IF NOT EXISTS shotchart(
		tempID INT, 
        gridType VARCHAR(100),
		gameID BIGINT,
        gameEventID INT, 
        playerID BIGINT, 
        player VARCHAR(100),
        teamID BIGINT,
        teamName VARCHAR(100),
        periodNum SMALLINT,
        minutesRemaining SMALLINT,
        secondsRemaining INT,
        eventType VARCHAR(100),
        actionType VARCHAR(100),
        shotType VARCHAR(100),
        shotZoneBasic VARCHAR(100),
        shotZoneArea VARCHAR(100),
        shotZoneRange VARCHAR(100),
        shotDistance INT,
        locX INT,
        locY INT,
        numShotsAttempted INT,
        numShotsMade INT,
        gameDate VARCHAR(100),
        homeTeam VARCHAR(10),
        visitingTeam VARCHAR(10)
	);
    
    LOAD DATA
    LOCAL INFILE 'C:/Users/justi/OneDrive/Documents/College/Senior Year/Spring/CS 3265/Project 2/shotchart_2017.csv'
    INTO TABLE shotchart
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
    
    LOAD DATA
    LOCAL INFILE 'C:/Users/justi/OneDrive/Documents/College/Senior Year/Spring/CS 3265/Project 2/shotchart_2018.csv'
    INTO TABLE shotchart
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
    
    LOAD DATA
    LOCAL INFILE 'C:/Users/justi/OneDrive/Documents/College/Senior Year/Spring/CS 3265/Project 2/shotchart_2019.csv'
    INTO TABLE shotchart
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
    
    LOAD DATA
    LOCAL INFILE 'C:/Users/justi/OneDrive/Documents/College/Senior Year/Spring/CS 3265/Project 2/shotchart_2020.csv'
    INTO TABLE shotchart
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
    
    LOAD DATA
    LOCAL INFILE 'C:/Users/justi/OneDrive/Documents/College/Senior Year/Spring/CS 3265/Project 2/shotchart_2021.csv'
    INTO TABLE shotchart
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
    
DROP TABLE IF EXISTS player_gamelogs;
CREATE TABLE IF NOT EXISTS player_gamelogs (
		tempID INT,
        seasonYear VARCHAR(100),
        playerID BIGINT,
        player VARCHAR(100),
        teamID BIGINT,
        teamAbv VARCHAR(10),
        teamName VARCHAR(100),
        gameID BIGINT,
        gameDate TIMESTAMP,
        matchup VARCHAR(100),
        winLoss VARCHAR(2),
        minutesPlayed DOUBLE,
        fieldGoalsMade INT,
        fieldGoalsAttempted INT,
        fieldGoalPercentage DECIMAL(4,3),
        threePointMade INT,
        threePointAttempted INT,
        threePointPercentage DECIMAL(4,3),
        freeThrowsMade INT,
        freeThrowsAttempted INT,
        freeThrowPercentage DECIMAL(4,3),
        offensiveRebounds INT,
        defensiveRebounds INT,
        rebounds INT,
        assists INT,
        turnovers INT,
        steals INT,
        blocks INT,
        blocksAgainst INT,
        personalFouls INT,
        personalFoulsDrawn INT,
        points INT,
        plusMinus INT,
        fantasyPoints DECIMAL(4,1),
        doubleDouble INT,
        tripleDouble INT,
        gamePercentageRank INT,
        winRank INT,
        lossRank INT,
        winPercentageRank INT,
        minutesRank INT,
        fieldGoalsMadeRank INT,
        fieldGoalsAttemptedRank INT,
        fieldGoalPercentageRank INT,
        threePointMadeRank INT,
        threePointAttemptedRank INT,
        threePointPercentageRank INT,
        freeThrowsMadeRank INT,
        freeThrowsAttemptedRank INT,
        freeThrowPercentageRank INT,
        offensiveReboundRank INT,
        defensiveReboundRank INT,
        reboundRank INT, 
        assistsRank INT,
        turnoversRank INT,
        stealsRank INT,
        blocksRank INT,
        blocksAgainstRank INT,
        personalFoulsRank INT,
        personalFoulsDrawnRank INT,
        pointsRank INT,
        plusMinusRank INT,
        fantasyPointsRank INT,
        doubleDoubleRank INT,
        tripleDoubleRank INT
) 	ENGINE = INNODB;

LOAD DATA
    LOCAL INFILE 'C:/Users/justi/OneDrive/Documents/College/Senior Year/Spring/CS 3265/Project 2/player_gamelogs_2017.csv'
    INTO TABLE player_gamelogs
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
    
LOAD DATA
    LOCAL INFILE 'C:/Users/justi/OneDrive/Documents/College/Senior Year/Spring/CS 3265/Project 2/player_gamelogs_2018.csv'
    INTO TABLE player_gamelogs
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
    
LOAD DATA
    LOCAL INFILE 'C:/Users/justi/OneDrive/Documents/College/Senior Year/Spring/CS 3265/Project 2/player_gamelogs_2019.csv'
    INTO TABLE player_gamelogs
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
    
LOAD DATA
    LOCAL INFILE 'C:/Users/justi/OneDrive/Documents/College/Senior Year/Spring/CS 3265/Project 2/player_gamelogs_2020.csv'
    INTO TABLE player_gamelogs
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
    
LOAD DATA
    LOCAL INFILE 'C:/Users/justi/OneDrive/Documents/College/Senior Year/Spring/CS 3265/Project 2/player_gamelogs_2021.csv'
    INTO TABLE player_gamelogs
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;

DROP TABLE IF EXISTS play_by_play;
CREATE TABLE IF NOT EXISTS play_by_play (
		tempID INT, 
        gameID BIGINT,
        eventNum INT,
        eventMsgType INT, 
        eventMsgAction INT,
        periodNum INT,
        westCoastTimeString TIME,
        pctTimeString TIME,
        homeDescription VARCHAR(100),
        neutralDescription VARCHAR(100),
        visitorDescription VARCHAR(100),
        score VARCHAR(50),
        scoreMargin INT
)	ENGINE = INNODB;

LOAD DATA
    LOCAL INFILE 'C:/Users/justi/OneDrive/Documents/College/Senior Year/Spring/CS 3265/Project 2/play_by_play_2017.csv'
    INTO TABLE play_by_play
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
    
LOAD DATA
    LOCAL INFILE 'C:/Users/justi/OneDrive/Documents/College/Senior Year/Spring/CS 3265/Project 2/play_by_play_2018.csv'
    INTO TABLE play_by_play
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
    
LOAD DATA
    LOCAL INFILE 'C:/Users/justi/OneDrive/Documents/College/Senior Year/Spring/CS 3265/Project 2/play_by_play_2019.csv'
    INTO TABLE play_by_play
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
    
LOAD DATA
    LOCAL INFILE 'C:/Users/justi/OneDrive/Documents/College/Senior Year/Spring/CS 3265/Project 2/play_by_play_2020.csv'
    INTO TABLE play_by_play
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
    
LOAD DATA
    LOCAL INFILE 'C:/Users/justi/OneDrive/Documents/College/Senior Year/Spring/CS 3265/Project 2/play_by_play_2021.csv'
    INTO TABLE play_by_play
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
        
DROP TABLE IF EXISTS games;
CREATE TABLE IF NOT EXISTS games(
		tempID INT,
        seasonID INT,
        teamID BIGINT,
        teamAbv VARCHAR(10),
		teamName VARCHAR(100),
        gameID BIGINT,
        gameDate DATE,
        matchup VARCHAR(100),
        winloss VARCHAR(2),
        minutes INT,
        points INT,
        fieldGoalsMade INT,
        fieldGoalsAttempted INT,
        fieldGoalPercentage DECIMAL(4,3),
        threePointMade INT,
        threePointAttempted INT,
        threePointPercentage DECIMAL(4,3),
        freeThrowsMade INT,
        freeThrowsAttempted INT,
        freeThrowPercentage DECIMAL(4,3),
        offensiveRebounds INT,
        defensiveRebounds INT,
        rebounds INT,
        assists INT,
        steals INT,
        blocks INT,
        turnovers INT,
        personalFouls INT,
        plusMinus INT
) ENGINE = INNODB;

LOAD DATA
    LOCAL INFILE 'C:/Users/justi/OneDrive/Documents/College/Senior Year/Spring/CS 3265/Project 2/games_2017.csv'
    INTO TABLE games
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
    
LOAD DATA
    LOCAL INFILE 'C:/Users/justi/OneDrive/Documents/College/Senior Year/Spring/CS 3265/Project 2/games_2018.csv'
    INTO TABLE games
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
    
LOAD DATA
    LOCAL INFILE 'C:/Users/justi/OneDrive/Documents/College/Senior Year/Spring/CS 3265/Project 2/games_2019.csv'
    INTO TABLE games
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
    
LOAD DATA
    LOCAL INFILE 'C:/Users/justi/OneDrive/Documents/College/Senior Year/Spring/CS 3265/Project 2/games_2020.csv'
    INTO TABLE games
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;
    
LOAD DATA
    LOCAL INFILE 'C:/Users/justi/OneDrive/Documents/College/Senior Year/Spring/CS 3265/Project 2/games_2021.csv'
    INTO TABLE games
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;

SELECT * 
FROM games
LIMIT 100;

SELECT *
FROM play_by_play
LIMIT 100;
    
SELECT *
FROM player_gamelogs
LIMIT 100;

SELECT *
FROM rosters
LIMIT 100;

SELECT *
FROM shotchart
LIMIT 100;