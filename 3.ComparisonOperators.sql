-- Chapter three: Comparison operators 
SELECT 0=0; # <- TRUE
SELECT '0.0' = 0; # <- Still TRUE. SQL converts the string into a numeric.

-- SQL has the following comparison operators: >, <, =, != (not equal), <=, >= 

-- Using multiple conditions 
SELECT (9 > 7) AND (12 < 24); # TRUE
SELECT (9 > 7) OR (12 > 24); # TRUE

-- MySQL supports IS and IS NOT as boolean operators
SELECT (9 > 7) IS TRUE; # TRUE
SELECT (9 > 7) IS NOT TRUE; # FALSE

-- Logical Operators
SELECT 1 AND 1; # TRUE. Ones here are treated TRUE (Same as R). 
SELECT 1 OR 1; # TRUE

SELECT 1 OR 0; # Still TRUE as one of the operators is still TRUE

-- XOR requires one side of the operands to be TRUE, but not both
SELECT 1 XOR 0; # <- evaluates to TRUE
SELECT (1 < 0) XOR (1 < 0); # <- FALSE as neither side is TRUE
SELECT (1 < 0) XOR (1 > 0); # <- TRUE
SELECT (1 > 0) XOR (1 < 0); # <- TRUE

-- IS and IS NOT can be used with NULL
SELECT 1 IS NULL; # FALSE
SELECT 1 IS NOT NULL; # TRUE
SELECT NULL IS NULL; # TRUE
SELECT " " IS NULL; # FALSE. An empty string is not NULL. 

-- IN can be used to assess if a value is in a set
SELECT 7 IN (1, 5, 9); # FALSE
SELECT 7 IN (1, 5, 7); # TRUE
SELECT "John" IN ("John", " ", "David"); # TRUE
SELECT "John%" IN ("Johnny", " ", "David"); # FALSE. The wildcard (%) did not work here
SELECT (1, 2, 3) IN (1, 4, 5); # This does not work. SQL is not vectorized

USE world;

SELECT Name AS 'Country', ROUND(Population / 1000000) AS 'PopMM' 
  FROM Country 
  WHERE Population > 50000000 AND Continent IN ('Asia', 'Europe') -- Using IN here to select countries on those two continents
  ORDER BY Population DESC;

-- Using logical operator in a joined query
USE album;

SELECT t.title AS 'Track', t.track_number AS 'Track No', a.title AS 'Album', 
    a.artist AS 'Artist', t.duration AS 'Seconds'
  FROM Album AS a
  JOIN Track AS t ON t.album_id = a.id
  WHERE t.duration > 120 AND t.track_number > 3
  ORDER BY t.duration DESC;

SELECT * FROM album; -- Going to select songs from 'Two Men with the Blues' and 'Hendrix in the West'
SELECT * FROM track; -- Only going to select tracks > 200 seconds

SELECT a.title AS "Album", t.title AS "Song", t.duration AS "Length"
FROM album AS a
JOIN track AS t on t.album_id = a.id
WHERE a.title IN ('Two Men with the Blues', 'Hendrix in the West') AND t.duration > 200
ORDER BY t.duration DESC
;

-- Arithmetic operators

-- Standars options - +, -, *, /

-- DIV is not the same as /. DIV gives the integer
SELECT 5 / 3 ; # = 1.667
SELECT 5 DIV 3; # = 4

-- MOD (modulus) or the percent (%) gives the remainder
SELECT 5 MOD 3; # = 2
SELECT 5 % 3; # = 2 <- the % symbol may not be a modulus operator for other SQL plateforms. 

SELECT 5 / 0; # returns NULL

/* Operator precedence

PEDMAS
	Parentheses
    Exponents
    Division
    Multiplication
    Addition
    Substraction
    */
    
-- The CASE statement
-- 05 The CASE statement

USE scratch;

DROP TABLE IF EXISTS booltest;

CREATE TABLE booltest (a INTEGER, b INTEGER);

INSERT INTO booltest VALUES (1, 0);
INSERT INTO booltest VALUES (6, 1);

SELECT * FROM booltest;

SELECT
  CASE WHEN a < 5 THEN 'true' ELSE 'false' END AS boolA,
  CASE WHEN b > 0 THEN 'true' ELSE 'false' END AS boolB
  FROM booltest
;

SELECT
  CASE a WHEN 1 THEN 'true' ELSE 'false' END AS boolA, -- Of note: subtle difference here. 'CASE a WHEN' 
  CASE b WHEN 1 THEN 'true' ELSE 'false' END AS boolB 
  FROM booltest
;

DROP TABLE IF EXISTS booltest;

-- The IF function
CREATE TABLE booltest (a INTEGER, b INTEGER);

INSERT INTO booltest VALUES (1, 0);
INSERT INTO booltest VALUES (0, 1);

SELECT * FROM booltest;

-- The IF function is the same as Excel.
SELECT IF(a >= 1, "TRUE", "FALSE")
	FROM booltest; # = TRUE; FALSE

SELECT IF((a >= 1 AND b < 1), "TRUE", "FALSE") -- nested multiple condititions.
	FROM booltest; # = TRUE

DROP TABLE IF EXISTS booltest;




