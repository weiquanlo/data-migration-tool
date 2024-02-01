USE TSI
GO
BEGIN TRAN
GO
SET IDENTITY_INSERT Aircraft ON
GO
SET NOCOUNT ON
GO
DELETE FROM Aircraft 
GO
INSERT Aircraft (Id, AirlineId,AircraftState, Name, SerialNo,NumOfFirstSeat, NumOfBusinessSeat, NumOfPremiumSeat, NumOfEconomySeat ) 
	  VALUES (1, 2,'ARRIVAL','Boeing 777','HXUEG-2GKPI',20, 30, 50, 320)
GO
INSERT Aircraft (Id, AirlineId,AircraftState, Name, SerialNo,NumOfFirstSeat, NumOfBusinessSeat, NumOfPremiumSeat, NumOfEconomySeat ) 
	  VALUES (2, 2,'ONBOARDING','Airbus A380','DJSBP-AR3L4',4, 10, 20, 200)
GO
INSERT Aircraft (Id, AirlineId,AircraftState, Name, SerialNo,NumOfFirstSeat, NumOfBusinessSeat, NumOfPremiumSeat, NumOfEconomySeat ) 
	  VALUES (3, 1,'ONBOARDING','Airbus A320','9EQ88-JCE8P',20, 30, 50, 300)
GO
INSERT Aircraft (Id, AirlineId,AircraftState, Name, SerialNo,NumOfFirstSeat, NumOfBusinessSeat, NumOfPremiumSeat, NumOfEconomySeat ) 
	  VALUES (4, 1,'ONJOURNEY','Boeing 140','9VTH9-NGAJR',0, 5, 5, 50)
GO
INSERT Aircraft (Id, AirlineId,AircraftState, Name, SerialNo,NumOfFirstSeat, NumOfBusinessSeat, NumOfPremiumSeat, NumOfEconomySeat ) 
	  VALUES (5, 3,'ONJOURNEY','Boeing 747','2FNFD-9MKZO',10, 30, 50, 320)
GO
INSERT Aircraft (Id, AirlineId,AircraftState, Name, SerialNo,NumOfFirstSeat, NumOfBusinessSeat, NumOfPremiumSeat, NumOfEconomySeat ) 
	  VALUES (6, 4,'ARRIVAL','Boeing 247','AIU4J-BHXUE',0, 0, 10, 30)
GO
INSERT Aircraft (Id, AirlineId,AircraftState, Name, SerialNo,NumOfFirstSeat, NumOfBusinessSeat, NumOfPremiumSeat, NumOfEconomySeat ) 
	  VALUES (7, 5,'ONJOURNEY','Airbus A500','G2GKP-I4AB9',0, 0, 10, 100)
GO
INSERT Aircraft (Id, AirlineId,AircraftState, Name, SerialNo,NumOfFirstSeat, NumOfBusinessSeat, NumOfPremiumSeat, NumOfEconomySeat ) 
	  VALUES (8, 6,'ARRIVAL','Boeing 747','DTY3O-XW7AC',10, 30, 50, 320)
GO
SET NOCOUNT OFF
GO
SET IDENTITY_INSERT Aircraft OFF
GO
COMMIT TRAN
PRINT 'Aircraft is inserted'
GO
