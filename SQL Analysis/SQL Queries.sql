-- Fetch All Data from Individual Table
select * from races limit 10;
select * from drivers limit 10;
select * from constructors limit 10;
select * from results limit 10;
select * from driver_standings limit 10;
select * from constructor_standings limit 10;

-- Fetch Column Names
select column_name
from information_schema.columns
where table_name='drivers'

-- Query 1 - All Time Top Winning Drivers:
Select
	d.forename || ' ' || d.surname as driver_name,
	COUNT(*) as total_wins
From results r
JOIN drivers d
ON r."driverId" = d."driverId"
WHERE r."positionOrder" = 1
GROUP BY driver_name
ORDER BY total_wins DESC
LIMIT 10;

-- Query 2 - Seasons Points Trend for a Specific Driver:
SELECT
	ra."year",ds."points"
FROM driver_standings ds
JOIN races ra
ON ds."raceId" = ra."raceId"
JOIN drivers d
ON ds."driverId"=d."driverId"
Where d."surname" = 'Hamilton'
AND d."dob" >= '1985-01-07'
ORDER BY ra."year"

-- Query 3 - Position lost/gained per race:

SELECT 
	ra."year", ra."name",
	d."forename" || ' ' || d."surname" as driver_name,
	r."positionOrder" as finishing_position,
	(r."grid" - r."positionOrder") as position_gained
FROM results r
JOIN races ra
ON r."raceId" = ra."raceId"
JOIN drivers d
ON r."driverId"=d."driverId"
WHERE ra."year" = 2024
ORDER BY position_gained DESC
LIMIT 10;

-- Query 4 - Constructor-Wise Average finishing position with Ranking:
SELECT
	c."name" as constructor,
	ROUND(AVG(r."positionOrder"),2) as avg_finishing_position,
	DENSE_RANK() OVER(ORDER BY AVG(r."positionOrder") ASC) as performance_rank	
FROM results r
JOIN constructors c
ON r."constructorId"=c."constructorId"
JOIN races ra
ON r."raceId"=ra."raceId"
WHERE ra."year" >=2020
GROUP BY constructor
ORDER BY avg_finishing_position;



















