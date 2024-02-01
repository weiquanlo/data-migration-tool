USE TSI
GO
-- Create partition table,  flight table had divine into 2 vertically table
CREATE TABLE FlightInfo(
	FlightId INT NOT NULL,
	AircraftId INT NOT NULL REFERENCES Aircraft(Id),
	Code VARCHAR(50) NOT NULL,
	FlightState VARCHAR(50) NOT NULL,
	RouteId INT NOT NULL REFERENCES Route(Id),
	DepartureTime DATETIMEOFFSET(4) NOT NULL,
	ArrivalTime DATETIMEOFFSET(4) NOT NULL,
	NumOfMeal INT NOT NULL,
	HasUnaccompaniedMinorService BIT NOT NULL,
	HasWheelchairService BIT NOT NULL,
	CONSTRAINT PK_FlightInfo PRIMARY KEY CLUSTERED (FlightId),
	CONSTRAINT FK_FlightInfo FOREIGN KEY (FlightId) REFERENCES Flight(id)
 )
GO
 CREATE TABLE FlightCharge( 
	FlightId INT NOT NULL,
	FirstClassPrice MONEY NOT NULL,
	BusinessClassPrice MONEY NOT NULL,
	PremiumClassPrice MONEY NOT NULL,
	EconomyClassPrice MONEY NOT NULL,
	CancelFeeChargeRate DECIMAL (5,4) NOT NULL CHECK (CancelFeeChargeRate >= 0 and CancelFeeChargeRate < 1) , --(CancelFeeChargeRate between 0 and 1)
	ChangeFeeChargeRate  DECIMAL (5,4) NOT NULL CHECK (ChangeFeeChargeRate >= 0 and ChangeFeeChargeRate < 1) , --(ChangeFeeChargeRate between 0 and 1)
	InfantChargeRate DECIMAL (5,4) NOT NULL CHECK (InfantChargeRate >= 0 and InfantChargeRate < 1) --(InfantChargeRate between 0 and 1)
	CONSTRAINT PK_FlightCharge PRIMARY KEY CLUSTERED (FlightId),
	CONSTRAINT FK_FlightCharge FOREIGN KEY (FlightId) REFERENCES Flight(id)
 )
GO
BEGIN TRAN
GO
SET NOCOUNT ON
GO
INSERT FlightInfo (FlightId, AircraftId, Code, FlightState, RouteId, DepartureTime, ArrivalTime,
	NumOfMeal, HasUnaccompaniedMinorService, HasWheelchairService) 
SELECT Id, AircraftId, Code, FlightState, RouteId,	DepartureTime, ArrivalTime,	
	NumOfMeal, HasUnaccompaniedMinorService, HasWheelchairService FROM Flight 
GO
INSERT FlightCharge(FlightId, FirstClassPrice, BusinessClassPrice, PremiumClassPrice, EconomyClassPrice,
	CancelFeeChargeRate, ChangeFeeChargeRate, InfantChargeRate) 
SELECT Id, FirstClassPrice, BusinessClassPrice, PremiumClassPrice, EconomyClassPrice,
	CancelFeeChargeRate, ChangeFeeChargeRate, InfantChargeRate FROM Flight
GO
SET NOCOUNT OFF
GO
COMMIT TRAN
GO