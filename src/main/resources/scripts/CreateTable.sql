USE master
GO
ALTER DATABASE [TSI] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
DROP DATABASE  IF EXISTS  TSI
GO
CREATE DATABASE TSI
GO
USE TSI
GO
-------- Table Create  -------- 
-- add audit column if there are free time
	-- [IsActive] [bit] NOT NULL,
	-- [CreatedBy] [int] NOT NULL,
	-- [CreatedDate] [DATETIMEOFFSET(4)] NOT NULL,
	-- [LastModifiedBy] [int] NULL,
	-- [LastModifiedDate] [DATETIMEOFFSET(4)] NULL,

-------- Constants Table  -------- 
-- ##Trigger 1# Add trigger to each related table for constants value check // Wei Quan 
CREATE TABLE  Constants(
	Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY, 
	ConstantsCategory VARCHAR(50) NOT NULL,
	ConstantsTitle VARCHAR(200) NOT NULL,
	ConstantsValue VARCHAR(50) NOT NULL,
	ConstantsDescription VARCHAR(MAX) NULL
)
GO

CREATE TABLE City(
	Code VARCHAR(10) PRIMARY KEY  NOT NULL,
	Name VARCHAR(200) NOT NULL,
	Country VARCHAR(200) NOT NULL
)
GO

CREATE TABLE Route(
	Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY, 
	OriginCity VARCHAR(10) NOT NULL REFERENCES City(Code),
	DestinationCity VARCHAR(10) NOT NULL REFERENCES City(Code),
	DistanceMiles INT NOT NULL CHECK(DistanceMiles >= 0),
	EstDurationHour INT NOT NULL CHECK(EstDurationHour >= 0),
	EstDurationMin INT NOT NULL CHECK(EstDurationMin >= 0 and EstDurationMin < 60),-- 00 to 59
 )
 GO

CREATE TABLE Passenger(
	Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY, 
	FName VARCHAR(200) NOT NULL,
	LName VARCHAR(200) NOT NULL,
	Gender VARCHAR(50) NOT NULL,
	BOD	DATE NOT NULL CHECK(BOD < GETDATE()),
	Email VARCHAR(200) NOT NULL
)
GO

CREATE TABLE Meal (
	Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY, 
	Name VARCHAR(200) NOT NULL,
	MealType VARCHAR(50) NOT NULL
)
GO

CREATE TABLE Airline(
	Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY, 
	Name VARCHAR(200) NOT NULL,
	UnaccompaniedMinorServiceFee MONEY NOT NULL,
	WheelchairServiceFee MONEY NOT NULL,
	MaxPassengerPerBooking BIT NOT NULL
)
GO 

CREATE TABLE Aircraft(
	Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	AirlineId INT NOT NULL REFERENCES Airline(Id),
	AircraftState VARCHAR(50) NOT NULL,
	Name VARCHAR(200) NOT NULL,
	SerialNo VARCHAR(200) NOT NULL,
	NumOfFirstSeat INT NOT NULL,
	NumOfBusinessSeat INT NOT NULL,
	NumOfPremiumSeat INT NOT NULL,
	NumOfEconomySeat INT NOT NULL,
	CONSTRAINT UC_Aircraft UNIQUE (Id,SerialNo)
 )	
GO
--	Stock procedures 1# host keeping, move the expired record to ArchiveJourney table  //WeiQuan 
--	Trigger 2# on adding Valid Today < DepartureTime < ArrivalTime //YaoJin
CREATE TABLE Flight( 
	Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	AircraftId INT NOT NULL REFERENCES Aircraft(Id),
	Code VARCHAR(50) NOT NULL,
	FlightState VARCHAR(50) NOT NULL,
	FirstClassPrice MONEY NOT NULL,
	BusinessClassPrice MONEY NOT NULL,
	PremiumClassPrice MONEY NOT NULL,
	EconomyClassPrice MONEY NOT NULL,
	RouteId INT NOT NULL REFERENCES Route(Id),
	DepartureTime DATETIMEOFFSET(4) NOT NULL,
	ArrivalTime DATETIMEOFFSET(4) NOT NULL,
	NumOfMeal INT NOT NULL,
	CancelFeeChargeRate DECIMAL (5,4) NOT NULL CHECK (CancelFeeChargeRate >= 0 and CancelFeeChargeRate < 1) , --(CancelFeeChargeRate between 0 and 1)
	ChangeFeeChargeRate  DECIMAL (5,4) NOT NULL CHECK (ChangeFeeChargeRate >= 0 and ChangeFeeChargeRate < 1) , --(ChangeFeeChargeRate between 0 and 1)
	InfantChargeRate DECIMAL (5,4) NOT NULL CHECK (InfantChargeRate >= 0 and InfantChargeRate < 1) , --(InfantChargeRate between 0 and 1)
	HasUnaccompaniedMinorService BIT NOT NULL,
	HasWheelchairService BIT NOT NULL
 )
 GO

CREATE TABLE Itinerary(
	Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	BookingPassengerId INT NOT NULL REFERENCES Passenger(Id),
	ItineraryState VARCHAR(50) NOT NULL

)
GO 
--   Trigger 3# valify multi-city Route
--		a. Route Country must be connected  A To B, B To C, C To D
--		b. Trip Order must be correct
--  Trigger 4# valify passenger age for TicketType On lap and Airline UnaccompaniedMinorService 
	-- some of the airlines offer unaccompanied minor service for children from 5 to 17 years of age 

--  Trigger 5# 1 Itinerary for valid 4 passengers only, not 4 tickets

--	 Stock procedures 2# getTicketTotalPrice() and add new record  //Yao Jin
--	 Stock procedures 3# cancelTicket() update relate table
--	 Stock procedures 3# changeTicket()
CREATE TABLE Ticket(
	Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	PassengerId INT NOT NULL REFERENCES Passenger(Id),
	FlightId INT NOT NULL REFERENCES Flight(Id),
	TripOption VARCHAR(50) NOT NULL,
	TripOrder INT NOT NULL, -- for round trip & multi-city, 0 index
	ClassesOption VARCHAR(50) NOT NULL,
	TicketType VARCHAR(50) NOT NULL,
	TicketState VARCHAR(50) NOT NULL,
 	NeedUnaccompaniedMinorService BIT NOT NULL,
	NeedWheelchairService BIT NOT NULL,
	DiscountedPrice MONEY NULL,
	TicketPrice MONEY NOT NULL,
	ItineraryId INT NULL REFERENCES Itinerary(Id),
)
GO

CREATE TABLE TicketMeal(
	Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	TicketId INT NOT NULL,
	MealId INT NOT NULL,
	CONSTRAINT FK_Ticket FOREIGN KEY (TicketId) REFERENCES Ticket (Id),
	CONSTRAINT FK_Meal FOREIGN KEY (MealId) REFERENCES Meal (Id)
)
GO

CREATE TABLE ItineraryInvoice(
	Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	ItineraryId INT NOT NULL REFERENCES Itinerary(Id),
	CancelCharge MONEY NULL,
	ChangeCharge MONEY NULL,
	ItineraryPrice MONEY NOT NULL
 )
GO

PRINT 'All Tables is created'
GO