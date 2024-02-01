/*Q xv*/

SELECT 
	MIN(EstDurationHour) As [Minimum Duration],
	MAX(EstDurationHour) As [Maximum Duration],
	AVG(EstDurationHour) As [Average Duration]
FROM Route WHERE DestinationCity = 'PEN';

/*Q xvi*/
SELECT
F.DepartureTime AS 'Journey Date',
COUNT(T.Id) AS 'Number of booked seats',
STRING_AGG(T.ClassesOption, ',') AS 'Class'
FROM Ticket T
INNER JOIN Flight F ON F.Id = T.FlightId
WHERE T.PassengerId =3
GROUP BY F.DepartureTime;

/*Q xvii*/
SELECT M.Id, M.Name FROM Meal M WHERE M.Id NOT IN (SELECT T.MealId FROM TicketMeal T)

/*Q xviii*/
SELECT 
P.*
FROM Passenger P
INNER JOIN Ticket T ON T.PassengerId = P.Id
INNER JOIN Flight F ON T.FlightId = F.Id
INNER JOIN Aircraft AC ON AC.Id = F.AircraftId
INNER JOIN Airline AL ON AL.Id = AC.AirlineId
WHERE T.TripOption='MULTI_CITY' AND
CAST(F.DepartureTime AS DATE) = '2022-06-18' AND
AL.Name='Malaysia Airlines'

/*Q xix*/
SELECT unaccompanied.AirlineName, COUNT(unaccompanied.Id) As Total
FROM
(SELECT P.Id, AL.Name AS AirlineName
FROM Passenger P 
INNER JOIN Ticket T ON (T.PassengerId = P.Id AND T.NeedUnaccompaniedMinorService='True')
INNER JOIN Flight F ON T.FlightId = F.Id
INNER JOIN Aircraft AC ON AC.Id = F.AircraftId
INNER JOIN Airline AL ON AL.Id = AC.AirlineId
WHERE CAST(F.DepartureTime AS DATE) = '2022-06-18')
AS unaccompanied
GROUP BY ROLLUP(AirlineName)


/*Q xx*/
SELECT 
P.*
FROM Passenger P
INNER JOIN Ticket T ON T.PassengerId = P.Id
INNER JOIN Flight F ON T.FlightId = F.Id
WHERE (T.NeedUnaccompaniedMinorService='True' OR T.NeedWheelchairService='True' ) AND
CAST(F.DepartureTime AS DATE) = '2022-06-18' 


/*Q xxi*/ 
SELECT 
	MIN(UnaccompaniedMinorServiceFee) As [Minimum Unaccompanied Minor Service Fee],
	MAX(UnaccompaniedMinorServiceFee) As [Maximum Unaccompanied Minor Service Fee],
	AVG(UnaccompaniedMinorServiceFee) As [Average Unaccompanied Minor Service Fee]
FROM Airline;