USE TSI
GO
BEGIN TRAN
GO
SET IDENTITY_INSERT Ticket ON
GO
SET NOCOUNT ON
GO
DELETE FROM Ticket
GO
INSERT Ticket(Id, PassengerId, FlightId, TripOption, TripOrder, ClassesOption, TicketType, TicketState, NeedUnaccompaniedMinorService, 
	NeedWheelchairService, DiscountedPrice, TicketPrice, ItineraryId) 
	VALUES (1, 1, 1, 'ONE_WAY', 0, 'FIRST', 'IN_SEAT', 'ISSUED', 1, 0, 50, 100, 1)
GO
INSERT Ticket(Id, PassengerId, FlightId, TripOption, TripOrder, ClassesOption, TicketType, TicketState, NeedUnaccompaniedMinorService, 
	NeedWheelchairService, DiscountedPrice, TicketPrice, ItineraryId) 
	VALUES (2, 4, 1, 'ONE_WAY', 0, 'FIRST', 'IN_SEAT', 'ISSUED', 0, 0, 50, 100, 1)
GO
INSERT Ticket(Id, PassengerId, FlightId, TripOption, TripOrder, ClassesOption, TicketType, TicketState, NeedUnaccompaniedMinorService, 
	NeedWheelchairService, DiscountedPrice, TicketPrice, ItineraryId) 
	VALUES (3, 2, 1, 'ROUND_TRIP', 0, 'ECONOMY', 'IN_SEAT', 'COMPLETED', 0, 0, 50, 100, 2)
GO
INSERT Ticket(Id, PassengerId, FlightId, TripOption, TripOrder, ClassesOption, TicketType, TicketState, NeedUnaccompaniedMinorService, 
	NeedWheelchairService, DiscountedPrice, TicketPrice, ItineraryId) 
	VALUES (4, 2, 3, 'ROUND_TRIP', 1, 'ECONOMY', 'IN_SEAT', 'COMPLETED', 0, 0, 50, 100, 2)
GO
INSERT Ticket(Id, PassengerId, FlightId, TripOption, TripOrder, ClassesOption, TicketType, TicketState, NeedUnaccompaniedMinorService, 
	NeedWheelchairService, DiscountedPrice, TicketPrice, ItineraryId) 
	VALUES (5, 3, 1, 'MULTI_CITY', 0, 'BUSINESS', 'IN_SEAT', 'COMPLETED', 0, 0, 50, 100, 3)
GO
INSERT Ticket(Id, PassengerId, FlightId, TripOption, TripOrder, ClassesOption, TicketType, TicketState, NeedUnaccompaniedMinorService, 
	NeedWheelchairService, DiscountedPrice, TicketPrice, ItineraryId) 
	VALUES (6, 3, 2, 'MULTI_CITY', 1, 'BUSINESS', 'IN_SEAT', 'ONJOURNEY', 0, 0, 50, 100, 3)
GO
INSERT Ticket(Id, PassengerId, FlightId, TripOption, TripOrder, ClassesOption, TicketType, TicketState, NeedUnaccompaniedMinorService, 
	NeedWheelchairService, DiscountedPrice, TicketPrice, ItineraryId) 
	VALUES (7, 3, 8, 'MULTI_CITY', 2, 'BUSINESS', 'IN_SEAT', 'ISSUED', 0, 0, 50, 100, 3)
GO
INSERT Ticket(Id, PassengerId, FlightId, TripOption, TripOrder, ClassesOption, TicketType, TicketState, NeedUnaccompaniedMinorService, 
	NeedWheelchairService, DiscountedPrice, TicketPrice, ItineraryId) 
	VALUES (8, 5, 1, 'ONE_WAY', 0, 'BUSINESS', 'IN_SEAT', 'ISSUED', 0, 0, 50, 100, 1)
GO
INSERT Ticket(Id, PassengerId, FlightId, TripOption, TripOrder, ClassesOption, TicketType, TicketState, NeedUnaccompaniedMinorService, 
	NeedWheelchairService, DiscountedPrice, TicketPrice, ItineraryId) 
	VALUES (9, 10, 15, 'ONE_WAY', 0, 'ECONOMY', 'IN_LAP', 'ISSUED', 0, 0, 50, 200, 4)
GO
INSERT Ticket(Id, PassengerId, FlightId, TripOption, TripOrder, ClassesOption, TicketType, TicketState, NeedUnaccompaniedMinorService, 
	NeedWheelchairService, DiscountedPrice, TicketPrice, ItineraryId) 
	VALUES (10, 9, 15, 'ONE_WAY', 0, 'ECONOMY', 'IN_LAP', 'ISSUED', 0, 0, 50, 300, 4)
GO
INSERT Ticket(Id, PassengerId, FlightId, TripOption, TripOrder, ClassesOption, TicketType, TicketState, NeedUnaccompaniedMinorService, 
	NeedWheelchairService, DiscountedPrice, TicketPrice, ItineraryId) 
	VALUES (11, 8, 15, 'ONE_WAY', 0, 'ECONOMY', 'IN_SEAT', 'ISSUED', 0, 0, 50, 300, 4)
GO
INSERT Ticket(Id, PassengerId, FlightId, TripOption, TripOrder, ClassesOption, TicketType, TicketState, NeedUnaccompaniedMinorService, 
	NeedWheelchairService, DiscountedPrice, TicketPrice, ItineraryId) 
	VALUES (12, 8, 15, 'ONE_WAY', 0, 'ECONOMY', 'IN_SEAT', 'ISSUED', 0, 0, 0, 700, 5)
GO
SET NOCOUNT OFF
GO
SET IDENTITY_INSERT Ticket OFF
GO
COMMIT TRAN
PRINT 'Ticket is inserted'
GO