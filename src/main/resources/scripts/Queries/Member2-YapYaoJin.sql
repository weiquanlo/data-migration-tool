--viii.	Create a query which displays flight details, such as, the aircraft code, regular fare, and discounted fare for the first class. 
--A 25% discount is being offered. Label the columns as Aircraft, Regular First Class fare, and Discounted First Class fare.(2 marks)
SELECT 
	a.AircraftId AS 'Aircraft ID', 
	a.Code AS 'Aircraft Code',
	a.FirstClassPrice AS 'Regular First Class Fare (RM)',
	(a.FirstClassPrice)*0.75 AS 'Discounted First Class Fare (RM)'
FROM  Flight a

--ix. Create a query which displays the sorted details of flights to given city code with the least duration flight displayed first.(2 marks)
SELECT 
	f.Id, 
	f.AircraftId AS 'Aircraft ID', 
	f.Code,
	r.DestinationCity AS 'City Code', 
	r.EstDurationHour AS 'Duration (Hours)',
	r.EstDurationMin AS 'Duration (Min)'
FROM flight f 
INNER JOIN Route r ON f.RouteId = r.Id
ORDER BY 
	r.EstDurationHour Asc, r.EstDurationMin Asc

--x. Create a query which displays the types of non-vegetarian meals offered on flights.(2 marks)
SELECT DISTINCT
	m.Id, 
	m.Name AS 'Meal Name', 
	m.MealType AS 'Meal Type'
FROM Meal m 

WHERE 
	m.MealType = 'NON_VEG'

--xi. Create a query which shows the names of countries to which TSI provides flight reservations. Ensure that duplicate country names are eliminated from the list.(2 marks)
SELECT DISTINCT	
	c.Country  AS Country
FROM City c 
INNER JOIN Route r
	ON r.OriginCity = c.Code 

-- xii.	Create a query which provides, for each airline, the following information:
--The total number of flights scheduled in a given date. Result should contain both detailed breakup & summary for flights for each airline along with overall summary.
--Hint: you may wish to use rollup or cube statements with a query.  Some marks will be awarded for the query structure, even if you cannot generate the totals.(7 marks)
SELECT
		f.Id AS 'Flight ID',
		al.Name AS 'Airline Name',
		count ( f.Id ) AS 'Total Flights on 18-06-2022',
		f.DepartureTime AS ' Flight Departure Time'

	FROM flight f
	INNER JOIN aircraft ac
		ON f.AircraftId = ac.Id
	INNER JOIN airline al
		ON al.Id = ac.AirlineId
	WHERE 
		f.DepartureTime BETWEEN '2022-06-18 00:00:00.0000 +08:00' and '2022-06-18 23:59:59.0000 +08:00'
	GROUP BY ROLLUP
		(f.Id,al.Name, f.DepartureTime)

-- xiii. Create a query which shows the names of the meal options available on the given airline.(2 marks)
SELECT 
a.AirlineId,
a.AirlineName AS ' AirLine Name',
m.MealName AS ' Meal Name',
m.MealType AS ' Meal Type'

FROM Airline a
INNER JOIN Airline_Meal am
	ON a.AirlineId = am.AirlineId
INNER JOIN Meal m
	ON am.MealId = m.MealId
WHERE a.AirlineName = 'Air Asia'

-- xiv.	Develop one additional query of your own which provides information that would be useful for the business. 
-- Marks will be awarded depending on the technical skills shown and the relevance of the query.(3 marks) 
SELECT 
	al.Name,
	COUNT(t.PassengerId) AS total,
	c.Country
FROM Ticket t
INNER JOIN Flight f ON f.Id = t.FlightId
INNER JOIN Aircraft ac ON ac.Id = f.AircraftId
INNER JOIN Airline al ON al.Id = ac.AirlineId
INNER JOIN Route r ON r.Id = f.RouteId
INNER JOIN City c ON c.Code = r.OriginCity
WHERE r.DestinationCity = 'IPH'
GROUP BY ROLLUP 
(al.Name,c.Country,t.PassengerId)

