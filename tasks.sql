-- Calculate the average price of cars for each model, ordered by average price descending.


SELECT model, AVG(price) AS average_price
FROM cars
GROUP BY model
ORDER BY average_price DESC;


-- Find the oldest and newest car years for each make.

SELECT 
  brand,
  MIN(year) AS oldest_year,
  MAX(year) AS newest_year
FROM 
  cars
GROUP BY 
  brand;


-- List models with more than 1 car, along with the count of cars.

SELECT model, COUNT(*) as car_count
FROM cars 
GROUP BY model
HAVING 
COUNT(*) > 1



-- List makes that have at least one car with the 'GPS' feature (use an EXISTS subquery)

SELECT c.brand
FROM cars c
WHERE EXISTS (
    SELECT 1
    FROM car_features cf
    JOIN features f ON cf.feature_id = f.id
    WHERE cf.car_id = c.id
      AND f.name = 'GPS'
);



-- .Retrieve cars from models that have no features assigned (use a NOT EXISTS subquery).

SELECT c.id, c.brand, c.model, c.year, c.price
FROM cars c
WHERE NOT EXISTS (
    SELECT 1
    FROM car_features cf
    WHERE cf.car_id = c.id
);



-- Extract the first 5 characters of each VIN and show them alongside the full VIN.


SELECT vin, SUBSTRING(vin, 1, 5) as vmi
FROM cars
WHERE vin IS NOT NULL



-- Find all cars that have both 'GPS' and 'Sunroof' features.

SELECT c.id, c.brand, c.model, c.year, c.price
FROM cars c
JOIN car_features cf1 ON c.id = cf1.car_id
JOIN car_features cf2 ON c.id = cf2.car_id
JOIN features f1 ON cf1.feature_id = f1.id
JOIN features f2 ON cf2.feature_id = f2.id
WHERE f1.name = 'GPS' AND f2.name = 'Sunroof';


-- List makes with the total number of unique features across all their cars.


SELECT c.brand, COUNT(DISTINCT f.name) AS unique_features_count
FROM cars c
JOIN car_features cf ON c.id = cf.car_id
JOIN features f ON cf.feature_id = f.id
GROUP BY c.brand;


-- Retrieve cars that have more than 2 features, along with a concatenated list of feature names.


SELECT c.id, c.model, c.brand, GROUP_CONCAT(f.name ORDER BY f.name SEPARATOR ', ') AS features, 
COUNT(f.id) AS feature_count
FROM cars c
JOIN car_features cf ON c.id = cf.car_id
JOIN features f ON cf.feature_id = f.id
GROUP BY c.id, c.model, c.brand;











































