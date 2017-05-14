-- Table definitions for the tournament project.
--
-- Clean up any previous tournament databases
DROP DATABASE IF EXISTS tournament;

-- Create the database and tables
CREATE DATABASE tournament;
\connect tournament;

CREATE TABLE players(
  id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE matches(
  winner INTEGER references players(id),
  loser INTEGER references players(id),
  PRIMARY KEY (win, lose)
);

-- Create a view that tallies total matches per player
CREATE OR REPLACE VIEW view1 AS
SELECT players.id, COUNT(matches.*) AS match
FROM players LEFT JOIN matches
ON players.id = matches.win OR players.id = matches.lose
GROUP BY players.id;

-- Create the "Wins" view
CREATE MATERIALIZED VIEW view_wins AS
    SELECT players.badge AS player, count(matches.win) AS wins
    FROM players LEFT JOIN matches
    ON players.badge = matches.win
    GROUP BY players.badge, matches.win
    ORDER BY players.badge

-- Create the "Losses" view
CREATE MATERIALIZED VIEW view_losses AS
    SELECT players.badge AS player, count(matches.lose) AS losses
    FROM players LEFT JOIN matches
    ON players.badge = matches.lose
    GROUP BY players.badge, matches.lose
    ORDER BY players.badge
