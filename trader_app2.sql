SELECT distinct(apple.name) AS apple, (play.name) AS play, apple.rating AS Apple_rating, play.rating AS Play_rating, apple.price AS apple_price, play.price AS play_price
FROM app_store_apps AS apple	
	FULL JOIN play_store_apps AS play
		ON apple.name = play.name
WHERE apple.name = play.name
AND apple.rating = 5 AND play.rating >4
ORDER BY play.rating DESC, apple.price, play.price
LIMIT 5;

SELECT distinct(apple.name) AS apple, 
	apple.primary_genre AS apple_genre,
	(play.name) AS play, 
	play.genres AS play_genre,
	apple.rating AS Apple_rating, 
	play.rating AS Play_rating, 
	apple.price AS apple_price,
	play.price AS play_price
FROM app_store_apps AS apple	
	FULL JOIN play_store_apps AS play
		ON apple.name = play.name
WHERE apple.name = play.name
	AND apple.rating >= 4 AND play.rating >= 4
	AND apple.price <= 1
ORDER BY play.rating DESC, apple.price DESC, play.price;
