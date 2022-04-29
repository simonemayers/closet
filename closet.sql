-- CREATED THE SHIRT DATABASE
CREATE DATABASE shirts_db;

-- CREATED THE shirts TABLE
CREATE TABLE shirts(
	shirt_id INT PRIMARY KEY, 
    article VARCHAR(20), 
    color VARCHAR(10), 
    shirt_size VARCHAR(2), 
	last_worn INT 	
);

-- populated the table
INSERT INTO shirts VALUES(1, 't-shirt', 'white', 'S', 10); 
INSERT INTO shirts VALUES(2, 't-shirt', 'green', 'S', 200); 
INSERT INTO shirts VALUES(3, 'polo shirt', 'black', 'M', 10); 
INSERT INTO shirts VALUES(4, 'tank top', 'blue', 'S', 50); 
INSERT INTO shirts VALUES(5, 't-shirt', 'pink', 'S', 0); 
INSERT INTO shirts VALUES(6, 'polo shirt', 'red', 'M', 5); 
INSERT INTO shirts VALUES(7, 'tank top', 'white', 'S', 200); 
INSERT INTO shirts VALUES(8, 'tank top', 'blue', 'M', 15); 

-- 1. GET ALL THAT DATA IN THERE WITH A SINGLE LINE
SELECT * FROM shirts;

-- 2. ADD A NEW SHIRT, PURPLE POLO SHIRT, SIZE M LAST WORN 50 DAYS AGO
INSERT INTO shirts VALUES(9, 'polo shirt', 'purple', 'M', 50);

-- 3. SELECT ALL SHIRTS BUT ONLY PRINT OUT ARTICLE AND COLOR
SELECT article, color 
FROM shirts; 

-- 4. SELECT ALL MEDIUM SHIRTS AND PRINT OUT EVERYTHING BUT shirt_id
SELECT article, color, shirt_size, last_worn
FROM shirts
WHERE shirt_size = 'M';

-- 5. UPDATE ALL POLO SHIRTS CHANGE THEIR SIZE TO L
UPDATE shirts
SET shirt_size = 'L'
WHERE article = 'polo shirt';

-- 6. UPDATE THE SHIRT LAST WORN 15 DAYS AHO CHANGE LAST_WORN TO ZERO('0')
UPDATE shirts
SET last_worn = 0
WHERE last_worn = 15; 

-- 7. UPDATE ALL WHITE SHIRTS AND CHANGE SIZE TO 'XS' AND COLOR TO 'OFF WHITE'
UPDATE shirts
SET color = 'off white', shirt_size = 'XS'
WHERE color = 'white';

-- 8. DELETE ALL OLD SHIRTS THAT WERE LAST WORN 200 DAYS AGO
DELETE FROM shirts
WHERE last_worn = 200;

-- 9. DELETE ALL TANK TOPS. YOUR TASTES HAVE CHANGED...
DELETE FROM shirts
WHERE article = 'tank top'; 

-- 10. DELETE ALL SHIRTS. YOU ARE DOING SOME MAJOR SPRING CLEANING!
DELETE FROM shirts;

-- 11. DROP THE ENTIRE SHIRTS TABLE. SCRAPING EVERYTHING... YOU MUST BE RICH OR SOMETHING!
DROP TABLE shirts;
