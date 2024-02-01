USE TSI
GO
DROP TABLE IF EXISTS ArchiveFlight
GO
-- create archive table
CREATE TABLE ArchiveFlight(
	Id INT NOT NULL,
	AircraftId INT NOT NULL,
	Code VARCHAR(50) NOT NULL,
	FlightState VARCHAR(50) NOT NULL,
	FirstClassPrice MONEY NOT NULL,
	BusinessClassPrice MONEY NOT NULL,
	PremiumClassPrice MONEY NOT NULL,
	EconomyClassPrice MONEY NOT NULL,
	RouteId INT NOT NULL,
	DepartureTime DATETIMEOFFSET(4) NOT NULL,
	ArrivalTime DATETIMEOFFSET(4) NOT NULL,
	NumOfMeal INT NOT NULL,
	CancelFeeChargeRate DECIMAL (5,4) NOT NULL, 
	ChangeFeeChargeRate  DECIMAL (5,4) NOT NULL,
	InfantChargeRate DECIMAL (5,4) NOT NULL,
	HasUnaccompaniedMinorService BIT NOT NULL,
	HasWheelchairService BIT NOT NULL,
	ArchivedDate DATETIMEOFFSET(4) NOT NULL DEFAULT(GETDATE()),
 	CONSTRAINT PK_ArchiveFlight PRIMARY KEY CLUSTERED (Id ASC)
)  
GO
-- insert test data
INSERT INTO Flight (AircraftId, Code, FlightState, FirstClassPrice, BusinessClassPrice,PremiumClassPrice, EconomyClassPrice, RouteId, DepartureTime, ArrivalTime
           ,NumOfMeal,CancelFeeChargeRate,ChangeFeeChargeRate,InfantChargeRate,HasUnaccompaniedMinorService,HasWheelchairService)
     VALUES (5,'MH123', 'COMPLETED',1200,1000,900,700,5,'2021-01-18 07:34:09 +08:0','2021-01-18 13:34:09 +08:0'
           ,1,0.4,0.3,0.1,1,1)
GO
INSERT INTO Flight (AircraftId, Code, FlightState, FirstClassPrice, BusinessClassPrice,PremiumClassPrice, EconomyClassPrice, RouteId, DepartureTime, ArrivalTime
           ,NumOfMeal,CancelFeeChargeRate,ChangeFeeChargeRate,InfantChargeRate,HasUnaccompaniedMinorService,HasWheelchairService)
     VALUES (5,'MH143','COMPLETED',1200,1000,900,700,5,'2021-01-17 07:34:09 +08:0','2021-01-17 13:34:09 +08:0'
           ,1,0.4,0.3,0.1,1,1)
GO
INSERT INTO Flight (AircraftId, Code, FlightState, FirstClassPrice, BusinessClassPrice,PremiumClassPrice, EconomyClassPrice, RouteId, DepartureTime, ArrivalTime
           ,NumOfMeal,CancelFeeChargeRate,ChangeFeeChargeRate,InfantChargeRate,HasUnaccompaniedMinorService,HasWheelchairService)
     VALUES (5,'AK1443','DRAFT',1200,1000,900,700,5,'2021-01-16 07:34:09 +08:0','2021-01-16 13:34:09 +08:0'
           ,1,0.4,0.3,0.1,1,1)
GO

-- before archive
SELECT * FROM Flight
SELECT * FROM ArchiveFlight
GO
-- execute stored procedure
DECLARE	@return_value int,
		@error_id int

EXEC	@return_value = uspArchiveFlight
		@error_id = @error_id OUTPUT,
		@archivedDate = '2021-01-18 13:34:10 +08:0',
		@maxRecordPerRun = 2 --100

SELECT	@error_id as '@error_id'

SELECT	'Return Value' = @return_value

GO
-- after archive
SELECT * FROM Flight
SELECT * FROM ArchiveFlight