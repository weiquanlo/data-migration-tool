USE TSI
GO
BEGIN TRAN
GO
SET IDENTITY_INSERT Flight ON
GO
SET NOCOUNT ON
GO
DELETE FROM Flight
GO
INSERT INTO Flight (Id, AircraftId, Code, FlightState, FirstClassPrice, BusinessClassPrice,PremiumClassPrice, EconomyClassPrice, RouteId, DepartureTime, ArrivalTime
           ,NumOfMeal,CancelFeeChargeRate,ChangeFeeChargeRate,InfantChargeRate,HasUnaccompaniedMinorService,HasWheelchairService)
     VALUES (1, 1,'MH2710','COMPLETED',1500,1200,1000,900,1,'2022-06-18 10:34:09 +08:0','2022-06-18 14:34:09 +08:0'
           ,1,0.5,0.3,0.12,1,1)
GO

INSERT INTO Flight (Id, AircraftId, Code, FlightState, FirstClassPrice, BusinessClassPrice,PremiumClassPrice, EconomyClassPrice, RouteId, DepartureTime, ArrivalTime
           ,NumOfMeal,CancelFeeChargeRate,ChangeFeeChargeRate,InfantChargeRate,HasUnaccompaniedMinorService,HasWheelchairService)
     VALUES (2, 2,'MH2043','PUBLISHED',800,500,400,300,2,'2022-06-28 10:34:09 +08:0','2022-06-28 15:34:09 +08:0'
           ,2,0.5,0.3,0.14,1,1)
GO
INSERT INTO Flight (Id, AircraftId, Code, FlightState, FirstClassPrice, BusinessClassPrice,PremiumClassPrice, EconomyClassPrice, RouteId, DepartureTime, ArrivalTime
           ,NumOfMeal,CancelFeeChargeRate,ChangeFeeChargeRate,InfantChargeRate,HasUnaccompaniedMinorService,HasWheelchairService)
     VALUES (3, 3,'MH370','ONJOURNEY',1000,900,800,700,3,'2022-07-18 08:34:09 +08:0','2022-07-18 14:34:09 +08:0'
           ,1,0.6,0.3,0.13,0,0)
GO
INSERT INTO Flight (Id, AircraftId, Code, FlightState, FirstClassPrice, BusinessClassPrice,PremiumClassPrice, EconomyClassPrice, RouteId, DepartureTime, ArrivalTime
           ,NumOfMeal,CancelFeeChargeRate,ChangeFeeChargeRate,InfantChargeRate,HasUnaccompaniedMinorService,HasWheelchairService)
     VALUES (4, 4,'AK5237','PUBLISHED',1300,1200,1000,800,4,'2022-08-18 09:34:09 +08:0','2022-08-18 12:34:09 +08:0'
           ,2,0.4,0.3,0.12,1,0)
GO
INSERT INTO Flight (Id, AircraftId, Code, FlightState, FirstClassPrice, BusinessClassPrice,PremiumClassPrice, EconomyClassPrice, RouteId, DepartureTime, ArrivalTime
           ,NumOfMeal,CancelFeeChargeRate,ChangeFeeChargeRate,InfantChargeRate,HasUnaccompaniedMinorService,HasWheelchairService)
     VALUES (5, 5,'OD1621','DRAFT',1200,1000,900,700,5,'2022-09-18 07:34:09 +08:0','2022-09-18 13:34:09 +08:0'
           ,1,0.4,0.3,0.1,1,1)
GO
INSERT INTO Flight (Id, AircraftId, Code, FlightState, FirstClassPrice, BusinessClassPrice,PremiumClassPrice, EconomyClassPrice, RouteId, DepartureTime, ArrivalTime
           ,NumOfMeal,CancelFeeChargeRate,ChangeFeeChargeRate,InfantChargeRate,HasUnaccompaniedMinorService,HasWheelchairService)
     VALUES (6, 5,'OD1621','PUBLISHED',1200,1000,900,700,6,'2022-09-18 07:34:09 +08:0','2022-09-18 13:34:09 +08:0'
           ,1,0.4,0.3,0.1,1,1)
GO
INSERT INTO Flight (Id, AircraftId, Code, FlightState, FirstClassPrice, BusinessClassPrice,PremiumClassPrice, EconomyClassPrice, RouteId, DepartureTime, ArrivalTime
           ,NumOfMeal,CancelFeeChargeRate,ChangeFeeChargeRate,InfantChargeRate,HasUnaccompaniedMinorService,HasWheelchairService)
     VALUES (7, 5,'OD1621','PUBLISHED',1200,1000,900,700,7,'2022-09-18 07:34:09 +08:0','2022-09-18 13:34:09 +08:0'
           ,1,0.4,0.3,0.1,1,1)
GO
INSERT INTO Flight (Id, AircraftId, Code, FlightState, FirstClassPrice, BusinessClassPrice,PremiumClassPrice, EconomyClassPrice, RouteId, DepartureTime, ArrivalTime
           ,NumOfMeal,CancelFeeChargeRate,ChangeFeeChargeRate,InfantChargeRate,HasUnaccompaniedMinorService,HasWheelchairService)
     VALUES (8, 5,'OD1621','PUBLISHED',1200,1000,900,700,8,'2022-09-18 07:34:09 +08:0','2022-09-18 13:34:09 +08:0'
           ,1,0.4,0.3,0.1,1,1)
GO
INSERT INTO Flight (Id, AircraftId, Code, FlightState, FirstClassPrice, BusinessClassPrice,PremiumClassPrice, EconomyClassPrice, RouteId, DepartureTime, ArrivalTime
           ,NumOfMeal,CancelFeeChargeRate,ChangeFeeChargeRate,InfantChargeRate,HasUnaccompaniedMinorService,HasWheelchairService)
     VALUES (9, 5,'OD1622','COMPLETED',1200,1000,900,700,8,'2022-09-18 07:34:09 +08:0','2022-09-18 13:34:09 +08:0'
           ,1,0.4,0.3,0.1,1,1)
GO
INSERT INTO Flight (Id, AircraftId, Code, FlightState, FirstClassPrice, BusinessClassPrice,PremiumClassPrice, EconomyClassPrice, RouteId, DepartureTime, ArrivalTime
           ,NumOfMeal,CancelFeeChargeRate,ChangeFeeChargeRate,InfantChargeRate,HasUnaccompaniedMinorService,HasWheelchairService)
     VALUES (10, 1,'MH2043','COMPLETED',1200,1000,900,700,8,'2022-09-18 07:34:09 +08:0','2022-09-18 13:34:09 +08:0'
           ,1,0.4,0.3,0.1,1,1)
GO
INSERT INTO Flight (Id, AircraftId, Code, FlightState, FirstClassPrice, BusinessClassPrice,PremiumClassPrice, EconomyClassPrice, RouteId, DepartureTime, ArrivalTime
           ,NumOfMeal,CancelFeeChargeRate,ChangeFeeChargeRate,InfantChargeRate,HasUnaccompaniedMinorService,HasWheelchairService)
     VALUES (11, 1,'MH2043','COMPLETED',1200,1000,900,700,8,'2022-09-18 07:34:09 +08:0','2022-09-18 13:34:09 +08:0'
           ,1,0.4,0.3,0.1,1,1)
GO
INSERT INTO Flight (Id, AircraftId, Code, FlightState, FirstClassPrice, BusinessClassPrice,PremiumClassPrice, EconomyClassPrice, RouteId, DepartureTime, ArrivalTime
           ,NumOfMeal,CancelFeeChargeRate,ChangeFeeChargeRate,InfantChargeRate,HasUnaccompaniedMinorService,HasWheelchairService)
     VALUES (12, 1,'MH2043','COMPLETED',1200,1000,900,700,8,'2022-09-18 07:34:09 +08:0','2022-09-18 13:34:09 +08:0'
           ,1,0.4,0.3,0.1,1,1)
GO
INSERT INTO Flight (Id, AircraftId, Code, FlightState, FirstClassPrice, BusinessClassPrice,PremiumClassPrice, EconomyClassPrice, RouteId, DepartureTime, ArrivalTime
           ,NumOfMeal,CancelFeeChargeRate,ChangeFeeChargeRate,InfantChargeRate,HasUnaccompaniedMinorService,HasWheelchairService)
     VALUES (13, 2,'MH2043','COMPLETED',1200,1000,900,700,8,'2022-09-18 07:34:09 +08:0','2022-09-18 13:34:09 +08:0'
           ,1,0.4,0.3,0.1,1,1)
GO
INSERT INTO Flight (Id, AircraftId, Code, FlightState, FirstClassPrice, BusinessClassPrice,PremiumClassPrice, EconomyClassPrice, RouteId, DepartureTime, ArrivalTime
           ,NumOfMeal,CancelFeeChargeRate,ChangeFeeChargeRate,InfantChargeRate,HasUnaccompaniedMinorService,HasWheelchairService)
     VALUES (14, 2,'MH2043','COMPLETED',1200,1000,900,700,8,'2022-09-18 07:34:09 +08:0','2022-09-18 13:34:09 +08:0'
           ,1,0.4,0.3,0.1,1,1)
GO
INSERT INTO Flight (Id, AircraftId, Code, FlightState, FirstClassPrice, BusinessClassPrice,PremiumClassPrice, EconomyClassPrice, RouteId, DepartureTime, ArrivalTime
           ,NumOfMeal,CancelFeeChargeRate,ChangeFeeChargeRate,InfantChargeRate,HasUnaccompaniedMinorService,HasWheelchairService)
     VALUES (15, 2,'MH2043','COMPLETED',1200,1000,900,700,8,'2022-06-28 10:34:09 +08:0','2022-06-28 15:34:09 +08:0'
           ,1,0.4,0.3,0.1,1,1)
GO
SET NOCOUNT OFF
GO
SET IDENTITY_INSERT Flight OFF
GO
COMMIT TRAN
PRINT 'Flight is inserted'
GO