-- 2. Data Types

-- CREATE TABLE statement
USE scratch;

-- Pull code over from exercise file chapter 2

CREATE TABLE test (
    id INT, -- integer type data
    name VARCHAR(255), -- variable character string with limit of 255 characters
    address VARCHAR(255),
    city VARCHAR(255),
    state CHAR(2), -- fixed character string with limit of two
    zip CHAR(10)
);

-- Use DESCRIBE (DESC) for MySQL to show more information about each table
DESC test;

-- Different table characteristics can be collected using SHOW TABLE STATUS
SHOW TABLE STATUS;

/* USE SHOW CREATE TABLE to get the MySQL code for creating the table 
	Cut and paste is needed from the output
    */
SHOW CREATE TABLE test;
CREATE TABLE `test` (
  `id` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `zip` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3
; -- InnoDB engine is the default engine

-- Table can be dropped as below
DROP TABLE IF EXISTS test; 

-- MySQL Numeric Types
 
 /* MySQL numeric types include:
	1) Integer (INT) - 5 different types: TINYINT, SMALLINT, MEDIUMINT, INTEGER, BIGINT.
    2) Fixed Point
    3) and Floating point real-numbers
    */ 
    
/* Decimal(p, s): p = Precision; s = scale
	precision refers to the number of digits that will be stored (including those after the decimal).
	scale refers to the position of the decimal point.

	Ex: Numeric(9,2) <- Numeric is an alias for Decimal (it means the same thing) 
		1234567.89 
*/ 

-- MySQL has two floating point types: FLOAT and DOUBLE
	 
USE scratch;

DESC numerics;
SHOW CREATE TABLE numerics;

CREATE TABLE `numerics` (
  `id` int NOT NULL AUTO_INCREMENT,
  `da` decimal(10,2) DEFAULT NULL,
  `db` decimal(10,2) DEFAULT NULL,
  `fa` float DEFAULT NULL,
  `fb` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3
;

SELECT * FROM numerics;

-- when added, there is difference between the precision and the scale
SELECT da + db, fa + fb 
	FROM numerics;

-- evaluates to TRUE (==1)
SELECT da + db = 0.3
	FROM numerics;
-- evaluates to FALSE (==0)
SELECT fa + fb = 0.3
	FROM numerics;

-- Date and time types
USE scratch;

SELECT NOW(); -- YYYY-MM-DD HH:MM:SS This format is commonly used to make sorting easier.

SET time_zone = '+00:00'; -- sets time zone to UTC
SELECT NOW(); -- 2023-03-09 22:03:32 (MST 1503)

SET time_zone = 'SYSTEM'; -- returns time zone to the time zone of the system running MySQL
SELECT NOW(); -- 2023-03-09 15:04:27

 -- Code pulled over from sql-chap02.sql file 
 # obsolete TIMESTAMP
 DROP TABLE IF EXISTS temp;
CREATE TABLE temp (
  id INT UNSIGNED UNIQUE AUTO_INCREMENT PRIMARY KEY,
  stamp DATETIME DEFAULT current_timestamp ON update current_timestamp, -- line add a timestamp
  name VARCHAR(64)
);
DESC temp;

INSERT INTO temp (name) VALUES ('this');
INSERT INTO temp (name) VALUES ('that');
INSERT INTO temp (name) VALUES ('other');
SELECT * FROM temp;

DROP TABLE temp;

/* String types
	- Charcter strings
    - Binary strings
    - Fixed length (they will always be the same length [padded]
    - Variable length (non-padded)
    - Large objects - documents, media, etc.
    */

/* 
CHAR(5) - Character string that allows five characters, and will be padded if shorter. Use for predictable length (zip codes)
VARCHAR(5) - Character string that allows up to five characters, and there will be no padding.
*/

-- Enumeration types
USE scratch;
 
-- Code pulled over from sql-chap02.sql exercise folder
DROP TABLE IF EXISTS test;
CREATE TABLE test (
  id INT UNSIGNED UNIQUE AUTO_INCREMENT PRIMARY KEY,
  a ENUM( 'Pablo', 'Henri', 'Jackson' ) -- similiar to R, 'Pablo', 'Henri', 'Jackson' will be stored numerically as 1,2, and 3. 
);

INSERT INTO test ( a ) VALUES ( 'Pablo' );
INSERT INTO test ( a ) VALUES ( 'Henri' );
INSERT INTO test ( a ) VALUES ( 'Jackson' );
INSERT INTO test ( a ) VALUES ( 1 ); -- this will be populated with 'Pablo'
INSERT INTO test ( a ) VALUES ( 2 ); -- this will be populated with 'Henri'
INSERT INTO test ( a ) VALUES ( 3 ); -- -- this will be populated with 'Jackson'

SELECT * FROM test;

DROP TABLE IF EXISTS test;

-- The SERIAL type alias
DROP TABLE IF EXISTS test;
CREATE TABLE test (
  id INT UNSIGNED UNIQUE AUTO_INCREMENT PRIMARY KEY, # <- this assigns a unique primary key
  a ENUM( 'Pablo', 'Henri', 'Jackson' ) 
);

CREATE TABLE test (
  id SERIAL, # <- However, you can use SERIAL in place of 'INT UNSIGNED UNIQUE AUTO_INCREMENT PRIMARY KEY'
  a ENUM( 'Pablo', 'Henri', 'Jackson' ) 
);
DESC test; -- using SERIAL does make the id col non-NULL, primary key, and auto-increment. 

SHOW CREATE TABLE test;
CREATE TABLE `test` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT, # <- this prints instead of SERIAL
  `a` enum('Pablo','Henri','Jackson') DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3








