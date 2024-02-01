USE TSI
GO
SET NOCOUNT ON
GO
--Insert Test Data
DECLARE @i INT
SET @i = 1

BEGIN TRAN
	WHILE @i<10000
	BEGIN
		INSERT INTO Flight
		( AircraftId, Code, FlightState, FirstClassPrice, BusinessClassPrice,PremiumClassPrice, EconomyClassPrice, RouteId, DepartureTime, ArrivalTime,
		NumOfMeal,CancelFeeChargeRate,ChangeFeeChargeRate,InfantChargeRate,HasUnaccompaniedMinorService,HasWheelchairService)
		VALUES
		(5,CONCAT('CA', @i),'DRAFT',1200,1000,900,700,5,'2022-09-18 07:34:09 +08:0','2022-09-18 13:34:09 +08:0' ,1,0.4,0.3,0.1,1,1 )
		SET @i=@i+1
	END
COMMIT TRAN
GO
-- Insert To FlightInfo
BEGIN TRAN
GO
INSERT FlightInfo (FlightId, AircraftId, Code, FlightState, RouteId, DepartureTime, ArrivalTime,
	NumOfMeal, HasUnaccompaniedMinorService, HasWheelchairService) 
SELECT Id, AircraftId, Code, FlightState, RouteId,	DepartureTime, ArrivalTime,	
	NumOfMeal, HasUnaccompaniedMinorService, HasWheelchairService 
	FROM Flight WHERE id > (SELECT MAX(FlightId) FROM FlightInfo )
GO
COMMIT TRAN
GO
-- Insert To FlightCharge
BEGIN TRAN
GO
INSERT FlightCharge(FlightId, FirstClassPrice, BusinessClassPrice, PremiumClassPrice, EconomyClassPrice,
	CancelFeeChargeRate, ChangeFeeChargeRate, InfantChargeRate) 
SELECT Id, FirstClassPrice, BusinessClassPrice, PremiumClassPrice, EconomyClassPrice,
	CancelFeeChargeRate, ChangeFeeChargeRate, InfantChargeRate 
	FROM Flight WHERE id > (SELECT MAX(FlightId) FROM FlightCharge )
GO
COMMIT TRAN
GO
SET NOCOUNT OFF
GO

----------Query Performance Test---------------------
SET STATISTICS IO ON
SET STATISTICS TIME ON
GO
PRINT '#Query From original table'
GO
SELECT Airline.Name AS 'Airline', Flight.DepartureTime, Flight.ArrivalTime 
FROM Airline
LEFT JOIN Flight ON Flight.AircraftId = Airline.Id 
WHERE Flight.Code LIKE  'CA%'
GO
PRINT '---------------------------------------------------------------'
GO
PRINT '#Query From partition table'
GO
SELECT  Airline.Name AS 'Airline', FlightInfo.DepartureTime, FlightInfo.ArrivalTime 
FROM Airline
LEFT JOIN FlightInfo ON FlightInfo.AircraftId = Airline.Id 
WHERE FlightInfo.Code LIKE  'CA%'
GO
SET STATISTICS IO OFF
SET STATISTICS TIME OFF