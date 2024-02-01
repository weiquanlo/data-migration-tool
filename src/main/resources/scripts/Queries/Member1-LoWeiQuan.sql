USE TSI

GO
--i.	Create a query which shows direct flights only for given dates, source & destination. (2 marks)
SELECT f.Id, a.Name As Aircraft, f.Code, FlightState,
	r.OriginCity,
	CONCAT(o.Name, ', ', o.Country) AS [Source City],
	r.DestinationCity,
	CONCAT(d.Name, ', ', d.Country) AS [Destination City],
	DepartureTime, ArrivalTime,
	FirstClassPrice,BusinessClassPrice, PremiumClassPrice, EconomyClassPrice,
	NumOfMeal, CancelFeeChargeRate, ChangeFeeChargeRate, InfantChargeRate,
	HasUnaccompaniedMinorService, HasWheelchairService
FROM Flight f
  INNER JOIN  Aircraft a ON a.Id = f.AircraftId
  INNER JOIN  Route r ON r.Id = f.RouteId
  INNER JOIN City o ON o.Code = r.OriginCity
  INNER JOIN City d ON d.Code = r.DestinationCity
WHERE CAST(DepartureTime AS date)  = '2022-09-18' AND r.OriginCity = 'PEN' AND r.DestinationCity = 'BGK'
ORDER BY f.FlightState, [Source City]  
  
GO 
--ii.	Create a query which shows aircraft code, class code, and expected revenue for each class code
--, along with the total revenue of each aircraft for a given airline in a single journey. (2 marks)
WITH RevenueReport (FlightId, Airline, AircraftName, AircraftCode, ClassCode, TicketPrice, ExpectedRevenue)
AS
(
	SELECT Ticket.FlightId, Airline.Name, Aircraft.Name, Aircraft.SerialNo, Ticket.ClassesOption,  
		Ticket.TicketPrice,
		CASE
			WHEN Ticket.ClassesOption = 'FIRST' 
				THEN Flight.FirstClassPrice*Aircraft.NumOfFirstSeat
			WHEN Ticket.ClassesOption = 'BUSINESS' 
				THEN Flight.BusinessClassPrice*Aircraft.NumOfBusinessSeat
			WHEN Ticket.ClassesOption = 'ECONOMY' 
				THEN Flight.EconomyClassPrice*Aircraft.NumOfEconomySeat
			WHEN Ticket.ClassesOption = 'PREMIUM_ECONOMY' 
				THEN Flight.PremiumClassPrice*Aircraft.NumOfPremiumSeat
			ELSE Aircraft.NumOfFirstSeat
		END AS ExpectedRevenue 
	FROM Ticket   
	INNER JOIN Flight ON Flight.Id = Ticket.FlightId
	INNER JOIN  Aircraft ON Aircraft.Id = Flight.AircraftId
	INNER JOIN  Airline ON Airline.Id = Aircraft.AirlineId 
	WHERE Airline.Name = 'Malaysia Airlines'  
)
SELECT FlightId,Airline,AircraftName, AircraftCode, ClassCode, ExpectedRevenue, SUM(TicketPrice) AS TotalRevenue  FROM RevenueReport
GROUP BY FlightId, Airline,AircraftName, AircraftCode, ClassCode, ExpectedRevenue 

GO 
--iii. Create a query which shows all passenger numbers with their corresponding descriptions of reservation status 
--	for a specific airline. (2 marks)
SELECT   
	Airline.Name AS Airline ,
	Ticket.FlightId,
	Itinerary.ItineraryState AS [Reservation Status],
	COUNT(PassengerId) AS [Passenger Numbers]
FROM  Ticket 
	INNER JOIN Flight ON Flight.Id = Ticket.FlightId
	INNER JOIN  Aircraft ON Aircraft.Id = Flight.AircraftId
	INNER JOIN  Airline ON Airline.Id = Aircraft.AirlineId 
	INNER JOIN Itinerary ON Itinerary.Id = Ticket.ItineraryId
WHERE Airline.Name = 'Malaysia Airlines'
GROUP BY Airline.Name,  Ticket.FlightId, Itinerary.ItineraryState
ORDER BY Airline, Ticket.FlightId

GO 
--iv.	Create a query which shows the name of airline that has been most frequently travelled through by the passengers 
-- for specified source and destination in given range of dates. (2 marks) 
SELECT 
	Airline.Name,  
	COUNT(Ticket.Id) AS Frequency
FROM Ticket
INNER JOIN Flight ON Flight.Id = Ticket.FlightId
INNER JOIN Route ON Route.Id = Flight.RouteId
INNER JOIN Aircraft ON Aircraft.Id = Flight.AircraftId
INNER JOIN Airline ON Airline.Id = Aircraft.AirlineId 
WHERE Route.OriginCity = 'PEN' AND Route.DestinationCity = 'KUL' AND CAST(Flight.DepartureTime AS date) BETWEEN '2022-06-18' AND '2022-08-18'
GROUP BY Airline.Name
ORDER BY Frequency DESC

GO
--v.	Create a query which provides, for each age category of passengers, the following information:
--	The total number of infants, children, youths, adults & seniors travelling through specified flight in a single journey operated by a specified airline in given date. 
--		Result should contain both detailed breakup & summary for above mentioned categories along with overall summary.
--		Hint: you may wish to use rollup or cube statements with a query.  
--		Some marks will be awarded for the query structure, even if you cannot generate the totals.	(7 marks)
DECLARE @airline VARCHAR(200) = 'Malaysia Airlines', @DepartureDate DATE  = '2022-06-28'; 
WITH FlightReport (AirlineName, FlightId, PassengeId, PassengerAge) -- Report in given date and airline. 
AS 
(
SELECT Airline.Name, Ticket.FlightId,Ticket.PassengerId, DATEDIFF(hour,Passenger.BOD,GETDATE())/8766
FROM Ticket
INNER JOIN Passenger ON Passenger.Id = Ticket.PassengerId
INNER JOIN Flight ON Flight.Id = Ticket.FlightId
INNER JOIN  Aircraft ON Aircraft.Id = Flight.AircraftId
INNER JOIN  Airline ON Airline.Id = Aircraft.AirlineId
WHERE Airline.Name = @airline AND CAST(Flight.DepartureTime AS date) = @departureDate
) --SELECT * FROM FlightReport
SELECT 
	AirlineName,
	FlightId, 
	COUNT(CASE WHEN PassengerAge < 2 THEN 1 ELSE NULL END)  AS [Total Number of Infants],
	COUNT(CASE WHEN PassengerAge BETWEEN  2  AND 11 THEN 1 ELSE NULL END)  AS [Total Number of Children],
	COUNT(CASE WHEN PassengerAge BETWEEN  12  AND 17 THEN 1 ELSE NULL END)  AS [Total Number of Youths],
	COUNT(CASE WHEN PassengerAge BETWEEN  18  AND 64 THEN 1 ELSE NULL END)  AS [Total Number of Adults],
	COUNT(CASE WHEN PassengerAge > 64 THEN 1 ELSE NULL END)  AS [Total Number of Seniors]
FROM  FlightReport
GROUP BY ROLLUP (AirlineName, FlightId)

GO
--vi.	Create a query which shows the airline name offering maximum number of journey routes along with names of source and destination. (2 marks)
WITH cte(Airline,SourceCity,DestinationCity,JourneyMaxNum,RankNum) AS
(
  SELECT  
	Airline.Name,
	Route.OriginCity,
	Route.DestinationCity,
	COUNT(DISTINCT Flight.Id ),  
	DENSE_RANK() OVER (PARTITION BY Airline.Name ORDER BY COUNT(DISTINCT Flight.Id ) DESC)  
FROM Flight
INNER JOIN  Aircraft ON Aircraft.Id = Flight.AircraftId
INNER JOIN  Airline ON Airline.Id = Aircraft.AirlineId 
INNER JOIN Route ON Route.Id = Flight.RouteId
GROUP BY Airline.Name ,	Route.OriginCity,Route.DestinationCity
)
SELECT Airline,SourceCity,DestinationCity,JourneyMaxNum
FROM cte
WHERE RankNum = 1
ORDER BY JourneyMaxNum DESC

GO
--vii. Develop one additional query of your own which provides information that would be useful for the business. 
--	Marks will be awarded depending on the technical skills shown and the relevance of the query. (3 marks) 
-- Get Total,Average,Maximum, Minimum Travel Distance For Each Aircraft by a given Airline and Date Range -- TODO: Insert more testing data
SET STATISTICS IO ON
GO
DECLARE @airline VARCHAR(200) = 'Malaysia Airlines', @start DATE = '2022-06-18', @end DATE  = '2022-12-18'; -- scope
WITH FlightCTE AS -- use small join table
( 
	SELECT AircraftId, AirlineId, RouteId FROM Flight 
	INNER JOIN  Aircraft ON Aircraft.Id = Flight.AircraftId  
	WHERE FlightState = 'COMPLETED' AND CAST(DepartureTime AS date) BETWEEN @start AND @end 
),
AirlineCTE AS -- use small join table
(
	SELECT Id, Name FROM Airline WHERE Name = @airline
)  
SELECT 
	AirlineCTE.Name, 
	FlightCTE.AircraftId, 
	SUM(Route.DistanceMiles) AS TotalDistance,
	AVG(Route.DistanceMiles) AS 'Avg',
	MIN(Route.DistanceMiles) AS 'Min',
	MAX(Route.DistanceMiles) AS 'Max'
FROM FlightCTE 
INNER JOIN AirlineCTE ON FlightCTE.AirlineId = AirlineCTE.Id
INNER JOIN Route ON Route.Id = FlightCTE.RouteId
GROUP BY FlightCTE.AircraftId,AirlineCTE.Name
ORDER BY TotalDistance
GO
SET STATISTICS IO OFF
GO