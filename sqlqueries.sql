Column names:

trips table:

id - trip ID
date - trip date
pickup - pickup time stamp
dropoff - drop-off time stamp
rider_id - user ID
car_id - car ID
type - type of trip (X, POOL, XL)
cost - trip cost

riders table:

id - user ID
first - user first name
last - user last name
username - user handle
rating - user average rating
total_trips - total rides ridden
referred - referred by (user ID)

cars table:

id - car ID
model - car model
OS - operating system
status - active or maintenance
trips_completed - total trips completed

1. Analyzing three tables with data about Lyft trips and riders:

SELECT * FROM trips;
 
SELECT * FROM riders;
 
SELECT * FROM cars;

2. Creating a trip log using LEFT JOIN:

SELECT *
FROM trips
LEFT JOIN riders
on trips.rider_id = riders.id

3. Filtering data in trip log:

SELECT trips.date, 
   trips.pickup, 
   trips.dropoff, 
   trips.type, 
   trips.cost,
   riders.first, 
   riders.last,
   riders.username
FROM trips
LEFT JOIN riders 
  ON trips.rider_id = riders.id;
  
4. Creating a link between trips and cars:

SELECT *
FROM trips
JOIN cars
ON trips.car_id = cars.id;

5. Stacking one riders dataset on top of another:

SELECT *
FROM riders
UNION 
SELECT *
FROM riders2;

6. Calculating average cost for a trip:

SELECT ROUND(AVG(cost), 2)
FROM trips;

7. Finding all the riders who have used Lyft less than 500 times:

SELECT *
FROM riders
WHERE total_trips < 500;

8. Combining data from both tables to find the riders who have used Lyft less than 500 times:

SELECT *
FROM riders
WHERE total_trips < 500
UNION
SELECT *
FROM riders2
WHERE total_trips < 500;

9. Calculating the number of cars that are active:

SELECT COUNT(*)
FROM cars
WHERE status = 'active';

10. Finding the two cars that have teh highest trips_cpmpleted:

SELECT *
FROM cars
ORDER BY trips_completed DESC
LIMIT 2;

