--
-- This SQL script builds a monopoly database, deleting any pre-existing version.
--
-- @author kvlinden
-- @version Summer, 2015
--
SET search_path TO monopoly;

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS PlayerHouses;
DROP TABLE IF EXISTS PlayerGame;
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Player;

-- Create the schema.
CREATE TABLE Game (
	ID integer PRIMARY KEY,
	time timestamp
);

CREATE TABLE Player (
	ID integer PRIMARY KEY, 
	emailAddress varchar(50) NOT NULL,
	name varchar(50)
);

CREATE TABLE PlayerGame (
	gameID integer REFERENCES Game(ID), 
	playerID integer REFERENCES Player(ID),
	score integer,
	finished boolean DEFAULT FALSE,
	properties integer[],
	position integer
);

CREATE TABLE PlayerHouses (
	gameID integer,
	playerID integer,
	propertyNumber integer,
	numberHouses integer -- 0-4 is num houses, 5 is hotel
);

-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON PlayerGame TO PUBLIC;
GRANT SELECT ON PlayerHouses TO PUBLIC;

-- Add sample records.
INSERT INTO Game VALUES (1, '2006-06-28 13:20:00');
INSERT INTO Game VALUES (2, '2005-05-25 09:00:00');
INSERT INTO Game VALUES (3, '2024-10-31 10:00:00');

INSERT INTO Player(ID, emailAddress, name) VALUES (1, 'me@calvin.edu', 'will');
INSERT INTO Player(ID, emailAddress, name) VALUES (2, 'you@calvin.edu', 'keith');
INSERT INTO Player(ID, emailAddress, name) VALUES (3, 'him@calvin.edu', NULL);
INSERT INTO Player(ID, emailAddress, name) VALUES (4, 'her@gmail.com', 'suzy');
INSERT INTO Player(ID, emailAddress, name) VALUES (5, 'king@gmail.com', 'The King');


INSERT INTO PlayerGame VALUES (1, 1, 1, FALSE, '{37,39}', 35);
INSERT INTO PlayerGame VALUES (1, 2, 2001, FALSE, '{1,3}', 6);
INSERT INTO PlayerGame VALUES (1, 5, 5000, FALSE, '{3, 5, 10, 32}', 39);
INSERT INTO PlayerGame VALUES (2, 1, 1, TRUE, '{4, 5}', 10);
INSERT INTO PlayerGame VALUES (2, 2, 2300, TRUE, '{8, 19, 20}', 34);
INSERT INTO PlayerGame VALUES (3, 5, 230, TRUE, '{2, 32, 35, 17, 16}', 2);

INSERT INTO PlayerHouses VALUES (1, 1, 37, 5);
INSERT INTO PlayerHouses VALUES (1, 2, 1, 3);

