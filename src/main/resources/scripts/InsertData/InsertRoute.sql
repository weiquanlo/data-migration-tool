USE TSI
GO
BEGIN TRAN
GO
SET IDENTITY_INSERT Route ON
GO
SET NOCOUNT ON
GO
DELETE FROM Route
GO
INSERT Route (Id, OriginCity, DestinationCity, DistanceMiles, EstDurationHour, EstDurationMin) VALUES (1, 'PEN','KUL', 219, 1, 50)
GO
INSERT Route (Id, OriginCity, DestinationCity, DistanceMiles, EstDurationHour, EstDurationMin) VALUES (2, 'KUL','IPH', 123, 2, 30)
GO
INSERT Route (Id, OriginCity, DestinationCity, DistanceMiles, EstDurationHour, EstDurationMin) VALUES (3, 'KUL','PEN', 220, 8, 40)
GO
INSERT Route (Id, OriginCity, DestinationCity, DistanceMiles, EstDurationHour, EstDurationMin) VALUES (4, 'KBR','PEN', 211, 3, 50)
GO
INSERT Route (Id, OriginCity, DestinationCity, DistanceMiles, EstDurationHour, EstDurationMin) VALUES (5, 'BGK','PEN', 716, 2, 30)
GO
INSERT Route (Id, OriginCity, DestinationCity, DistanceMiles, EstDurationHour, EstDurationMin) VALUES (6, 'AOR','PEN', 73, 1, 20)
GO
INSERT Route (Id, OriginCity, DestinationCity, DistanceMiles, EstDurationHour, EstDurationMin) VALUES (7, 'PEN','BGK', 710, 2, 50)
GO
INSERT Route (Id, OriginCity, DestinationCity, DistanceMiles, EstDurationHour, EstDurationMin) VALUES (8, 'IPH','BGK', 93, 4, 30)
GO
SET NOCOUNT OFF
GO
SET IDENTITY_INSERT Route OFF
GO
COMMIT TRAN
PRINT 'Route is inserted'
GO