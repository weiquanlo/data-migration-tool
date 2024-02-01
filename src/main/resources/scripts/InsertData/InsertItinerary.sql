USE TSI
GO
BEGIN TRAN
GO
SET IDENTITY_INSERT Itinerary ON
GO
SET NOCOUNT ON
GO
DELETE FROM Itinerary
GO
INSERT Itinerary (Id, BookingPassengerId, ItineraryState) VALUES (1, 1, 'ISSUED')
GO
INSERT Itinerary (Id, BookingPassengerId, ItineraryState) VALUES (2, 2, 'ONJOURNEY')
GO
INSERT Itinerary (Id, BookingPassengerId, ItineraryState) VALUES (3, 3, 'COMPLETED')
GO
INSERT Itinerary (Id, BookingPassengerId, ItineraryState) VALUES (4, 4, 'ISSUED')
GO
INSERT Itinerary (Id, BookingPassengerId, ItineraryState) VALUES (5, 5, 'COMPLETED')
GO
SET NOCOUNT OFF
GO
SET IDENTITY_INSERT Itinerary OFF
GO
COMMIT TRAN
PRINT 'Itinerary is inserted'
GO