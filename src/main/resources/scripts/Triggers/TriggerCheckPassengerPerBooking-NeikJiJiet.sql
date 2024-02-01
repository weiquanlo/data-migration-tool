USE TSI
GO
BEGIN TRAN
GO
DROP TRIGGER IF EXISTS CheckMaxPassengerPerBooking
GO

CREATE TRIGGER CheckMaxPassengerPerBooking
ON Ticket
AFTER INSERT
AS
	BEGIN 
	DECLARE @ticketID int;
	DECLARE @ItineraryId int;
	DECLARE @FlightID int;
	DECLARE @MaxPassengerPerBooking VARCHAR(10);
	DECLARE @Row int;

	SET @ItineraryId =(SELECT DISTINCT ItineraryId from inserted);
	SET @Row = (SELECT COUNT(Id) FROM inserted);
	SET @FlightID =(SELECT DISTINCT FlightID from inserted where ItineraryId=@ItineraryId);
	SET @MaxPassengerPerBooking=(SELECT DISTINCT AL.MaxPassengerPerBooking FROM Airline AL
							INNER JOIN Aircraft AC ON AC.AirlineId = AL.Id
							INNER JOIN Flight F ON F.AircraftId = AC.Id
							INNER JOIN Ticket T ON @FlightID = F.Id);

	IF @Row > 4
		IF @MaxPassengerPerBooking = 'True'
			BEGIN
				PRINT 'You have exceed the maximum booking number';
				ROLLBACK
			END
		ELSE
			SELECT * FROM inserted WHERE ItineraryId=@ItineraryId;
	SELECT * FROM inserted WHERE ItineraryId=@ItineraryId;
	END
GO
COMMIT TRAN
PRINT 'CheckMaxPassengerPerBooking is created'
GO