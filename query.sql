-- Retrieve a list of all the games, ordered by date with the most recent game coming first
SELECT * from Game ORDER BY time DESC;

-- Retrieve all the games that occurred in the past week.
SELECT * from Game WHERE time >= NOW()::DATE - 7;

-- Retrieve a list of players who have (non-NULL) names.
SELECT * from Player WHERE name IS NOT NULL;

-- Retrieve a list of IDs for players who have some game score larger than 2000.
SELECT DISTINCT ID from Player, PlayerGame WHERE PlayerGame.score > 2000 AND Player.ID = playerID;

-- Retrieve a list of players who have GMail accounts.
SELECT * from Player WHERE emailAddress LIKE '%gmail%';

-- PART 2
-- Retrieve all “The King”’s game scores in decreasing order. 
SELECT score from Player, PlayerGame WHERE Player.name = 'The King' AND Player.ID = playerID;

-- Retrieve the name of the winner of the game played on 2006-06-28 13:20:00. 
SELECT Player.name FROM Player, PlayerGame, Game WHERE Player.ID = playerID AND PlayerGame.gameID = Game.ID AND Game.time = '2006-06-28 13:20:00' ORDER BY score DESC LIMIT 1;

-- So what does that P1.ID < P2.ID clause do in the last example query (i.e., the from SQL Examples)? 
-- ANSWER: It makes sure that you don't get the same player, and that you don't double count players with the same name by only counting the time you have a lesser ID than the other.

-- The query that joined the Player table to itself seems rather contrived. Can you think of a realistic situation in which you’d want to join a table to itself? 
-- ANSWER: When trying to override data that is outdated with new data that is relevant. For example, when the price and quantity of tacos recieved when ordering a plate of Taco Bell tacos was 5 bucks for 2 tacos, but now it's 10 bucks for 3 tacos.