/* 03/02/2023 LinkedIn Learning
MySQL Essential Training: 
Bill Weinman
*/ 

-- 1. Overview of SQL -- 
--
-- Selecting Rows
USE world;

-- selects all columns from country table. n = 239 rows
SELECT * FROM COUNTRY;

--  Selects name from country table, and orders alphabetically by name
SELECT Name FROM COUNTRY
	ORDER BY Name; 

-- Using 'AS' as an alias to rename a columns in place 
SELECT Name, LifeExpectancy AS 'Life Expectancy'
	FROM Country;
    
-- Using LIMIT to limit the number of rows returned
SELECT Name 
	FROM Country
		ORDER BY Name 
			LIMIT 5; -- Returns the top five rows

-- Using LIMIT to limit the number of rows returned
SELECT Name 
	FROM Country
		ORDER BY Name 
			LIMIT 5, 5; 
            -- LIMIT 5, 5 offsets to start at row 5, and returns the second 5 (rows 6-10). 

-- Selecting columns
USE World;

-- Selecting all columns from Country table, and ordering by country code
SELECT * FROM Country
	ORDER BY Code;

-- Choosing only columns of interest
SELECT Code, Name, Continent FROM Country
	ORDER BY Code;

-- Using aliases to change the name of columns in place
SELECT Code AS 'Country Code', Name AS 'Country Name', Continent, Population FROM Country
	ORDER BY Code;

-- Counting Rows
--
SELECT * FROM Country;

-- Using a function to aggregate data
SELECT Count(*)
	FROM Country; -- n = 239 countries

-- Using the WHERE clause to count only certain countries
SELECT Count(*)
	FROM Country
    WHERE Population > 1000000
    ; -- n = 154
    
-- Adding another condition to count countries based on population and continent
SELECT Count(*)
	FROM Country
    WHERE Population > 1000000 AND Continent = 'Asia'
    ; -- n = 44

-- Counting based on a specific column will ignore missing (null) values
SELECT Count(LifeExpectancy)
	FROM Country
    ; -- n = 222 

-- Inserting data into tables  
--
USE Scratch;
SELECT * FROM customer;

-- Inserting a new row into the customers tables
INSERT INTO customer (id, name, address, city, state, zip)
	VALUES (4, 'John Doe', '8101 E. Colfax', 'Denver', 'CO', 80220)
    ;
SELECT * FROM customer;

-- Data can be inserted into only selected columns
INSERT INTO customer (name, city, state)
	VALUES ('Peter Smith', 'Aurora', 'CO')
    ; -- missing cells are given null values
    
INSERT INTO customer (name, address, state) 
	VALUES ('Marty McFly', '2301 Lawrence St', 'CO')
    ;
    
SELECT * FROM customer;

-- Updating tables 
USE scratch;
SELECT * FROM customer;

SELECT * FROM customer 
	WHERE name LIKE 'Peter%' 
    ;
-- % is a wildcard in the LIKE clause to find 0 or more characters LIKE 'John'

SELECT * FROM customer
	WHERE address LIKE '2301%'
    ;

-- Use UPDATE and SET clauses to update select rows of data
UPDATE customer SET address = '1130 Park Ave West', zip = 80045
	WHERE name LIKE 'Peter%'
    ;

UPDATE customer SET city = 'Denver', zip = 80010
	WHERE name = 'Marty McFly'
    ;
    
-- Update can be used to set NULL values 
UPDATE customer SET city = NULL, zip = 80010
	WHERE name = 'Marty McFly'
    ;

SELECT * FROM customer;

-- Deleting data from tables
use scratch;

-- Creating table to practice using the DELETE clause

-- Use SHIFT, COMMMAND, ENTER to execute all code at once	
CREATE TABLE test (a INT,
		b VARCHAR(16),
			c VARCHAR(16))
            ;
-- Populating test table with data 
INSERT INTO test
	VALUES (1, "this", "right here!");
    
INSERT INTO test
	VALUES (2, "that", "over there!");
    
INSERT INTO test
	VALUES (3, "another", "nowhere");

INSERT INTO test
	VALUES (3, "duplicate", NULL);
    
SELECT * FROM test;

/* SELECT the records you want to delete before using the DELETE clause.
	This is best practice so you don't accidentally delete records you did not intend to 
    */ 
    
SELECT * FROM test
	WHERE a = 3
    ;

DELETE FROM test 
WHERE
    a = 3
;

SELECT * FROM test;

DROP TABLE IF EXISTS test;

-- Moving back to the customer table to delete records
SELECT * FROM customer;

-- Confirming the records to delete.
SELECT * FROM customer
	WHERE name LIKE 'Marty%' OR name LIKE 'Peter%'
    ;

DELETE FROM customer
	WHERE name LIKE 'Marty%' OR name LIKE 'Peter%'
    ;

SELECT * FROM customer;

-- Joining queries across tables
use album;

SELECT * FROM track;
 /* Use 'desc' to describe the table
*/
-- id = primary key 
desc track;

-- id = primary key 
SELECT * FROM album;
desc album;

-- Code pulled in from exercise files chapter one
SELECT a.artist AS Artist, a.title AS Album, t.track_number AS 'Track Num', 
    t.title AS Track, t.duration AS Seconds
  FROM album AS a
  JOIN track AS t ON a.id = t.album_id
  ORDER BY a.artist, a.title, t.track_number;

-- Another example of using a join not included in the exerecise files
SELECT a.artist AS Artist, a.title AS Album, a.label AS 'Record Label', t.title AS 'Song Name'
	FROM album AS a
    JOIN track AS t ON a.id = t.album_id
    ORDER BY a.artist
    ;

/* Finding databases, tables, and columns
	These statements may be unique to MySQL
    */

-- lists all the databases available on the server
SHOW DATABASES;

USE scratch;

-- shows the tables to the specific database
SHOW TABLES;

-- Use DESCRIBE (DESC) <table name> to list the columns
DESC customer;

-- This is the end of the content covered in chapter one


















