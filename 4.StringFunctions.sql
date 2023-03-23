-- Chapter 4 String functions

-- String comparisons
USE world;

/* Selecting all countries with the letter 'a' in the second position
 The underscore (_) is a single value wildcard, and the % sign is a multivarlue wild card
 */
SELECT name FROM country 
		WHERE name LIKE '_a%'
			ORDER BY name;

-- STRCMP() function evaluates how many values are sorted above or below a particular string value
SELECT name FROM country
	WHERE STRCMP(name, 'France') <= 0
		ORDER BY name; # returns a list of all country names that alphabetically are below France (inclusive).

SELECT name FROM country
	WHERE STRCMP(name, 'Algeria') <= 0
		ORDER BY name;

/* Regular expressions
	Regular expressions are a language for searching through text.
*/
USE world;
SELECT name FROM country;

-- Selecting all countries that end in the letter 'Y'
SELECT name FROM country WHERE name RLIKE 'y$' ORDER BY name; # RLIKE is similar to LIKE, but of regular expressions

-- Selecting countries that have an 'x' or a 'y' followed by and 'a' or an 'i'
SELECT name FROM country WHERE name RLIKE '[xy][ai]' ORDER BY name;

-- Example to select Andora and the Netherlands (amongst numerous other counteries).
SELECT name FROM country WHERE name RLIKE '[dh][oe]' ORDER BY name;

/* String concatenation 

	MySQL does not support the standard SQL concatenation, but instead uses a function. 
    However, below is an example of standard SQL concatenation:
    
    SELECT 'This ' || 'and' || 'that'; <-- MySQL uses '|' as the 'OR' operator
	Thus, MySQL evaluates the above to "String" OR "String" OR "Strine" = FALSE (0)
    
    */

-- MySQL uses the concat() function.alter
SELECT concat('This ', 'and', ' that');

SELECT concat(name,",", " ", continent) FROM country;

-- Trimming and padding 
USE scratch;

SELECT * FROM customer WHERE name LIKE TRIM('  Bill Smith  '); # Trims both leading spaces and ending spaces.

-- LTRIM trims the left; and RTRIM trims the Right
SELECT * FROM customer WHERE name LIKE LTRIM('  Bill Smith');
SELECT * FROM customer WHERE name LIKE RTRIM('Bill Smith  ');

-- TRIM can also trim characters
SELECT * FROM customer WHERE name LIKE TRIM('x' FROM 'xxxBill Smithxxx');

-- Padding 
SELECT LPAD('Price', 10, '.');
SELECT RPAD('Price', 10, '.'); # Allows for length of 10 characters, not 10 periods. 

-- Case conversion
USE scratch;

SELECT UPPER(name) FROM customer;
SELECT UCASE(name) FROM customer; # same function as UPPER.

SELECT LOWER(name) FROM customer;
SELECT LCASE(name) FROM customer; # same function as LOWER

-- Substrings 
SELECT substring('This is a string',6); # Removes the first six characters.
SELECT substr('This is a string',6); # Alias for substring.

-- Second argument tells how many characters to return
SELECT substr('This is a string', 6, 2); # 'is' 

-- A negative number returns 6 characters starting from the right. 
SELECT substr('This is a string', -6); # 'string'

-- substring_index() returns all the characters prior to the number of delimiters specified in the second argument.
select substring_index('this is a string', ' ', 1); # 'this' 
select substring_index('this is a string', ' ', 2); # 'this is' 
select substring_index('this is a string', ' ', 3); # 'this is a'

-- Use a minus sign to reverse the delimiter 
select substring_index('this is a string', ' ', -1); # 'string'

SELECT TRUE || 
	CONCAT('Hello', 'world');
 
SELECT TRUE OR 
	CONCAT('Hello', 'world');
 







