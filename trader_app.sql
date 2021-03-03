select *
from app_store_apps;
-- name, size_bytes, currency, price, review_count, rating, content_rating, primary_genre
select *
from play_store_apps;
-- name, category, rating, review_count, size, install_count, type, price, content_rating, genres

-- name, name					-- size_bytes, size
-- price, price					-- currency, null
-- review_count, review_count	-- primary_genre, genre
-- rating, rating					-- null, install_count
-- content_rating, content_rating	-- null, category

--1.Which apps are on both stores
SELECT distinct(apple.name), (play.name)
FROM app_store_apps AS apple	
	FULL JOIN play_store_apps AS play
		ON apple.name = play.name
WHERE apple.name = play.name;
--328 results

--2.Find which apps have the highest rating in AppleStore, PlayStore, both
-- AppleStore
SELECT name, rating
FROM app_store_apps as apple
ORDER BY rating desc;

--PlayStore
SELECT name, rating
FROM play_store_apps AS play
WHERE rating IS NOT NULL
ORDER BY rating desc;

--both
	SELECT apple.name, rating
	FROM app_store_apps AS apple	
		UNION play_store_apps AS play
			ON apple.name = play.name
	WHERE play.name = '0'
	GROUP BY name, rating = 5;
	
SELECT name
FROM app_store_apps AS apple	
	UNION 
SELECT name
FROM play_store_apps AS play;



-- difference in price from both stores
SELECT distinct(apple.name), (play.name), apple.rating AS apple_rating, play.rating AS play_rating, apple.price AS apple_price,play.price AS play_price, CAST (apple.price AS money) - CAST (play.price AS money) AS price_difference
FROM app_store_apps AS apple	
	FULL JOIN play_store_apps AS play
		ON apple.name = play.name
WHERE apple.name = play.name
AND apple.rating >= 4
ORDER BY apple.rating desc;


-- get all apps that are free, and compare with PAID apps and get an average rating
SELECT avg(rating)
FROM app_store_apps AS apple
WHERE price > 50;
-- FREE "3.37"   		price <> 0 "3.72"   price >4 "3.76"		price > 10 "3.44"

SELECT avg(rating)
FROM play_store_apps
WHERE CAST(CAST (price AS money) AS numeric) > 4;
-- FREE "4.18"			price <>0 "4.26"		price >4 "4.20"

-- it looks like the rating is lower when FREE app


-- how many apps are being installed - play store ONLY
SELECT install_count
FROM play_store_apps
CASE WHEN CAST(CAST (price AS money) AS numeric) = 0 THEN "FREE"
WHEN ;


-- Apple store TOP genre for 5 star rating
SELECT primary_genre, COUNT (primary_genre) AS number
FROM app_store_apps
WHERE rating = 5.0
	AND price > 0
GROUP BY primary_genre
ORDER BY number DESC;
-- Top genre = "GAME"

-- Play store
SELECT genres, COUNT(genres) AS number
FROM play_store_apps
WHERE rating = 5.0
	AND price LIKE '$%'
GROUP BY genres
ORDER BY number DESC;
-- TOP genre = "education" only for 5 starts reviews


