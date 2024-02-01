USE TSI

--	Trigger 2# on adding Valid Today < DepartureTime < ArrivalTime 
GO
BEGIN TRAN
GO
DROP TRIGGER IF EXISTS FlightTimeCheck
GO

CREATE TRIGGER FlightTimeCheck ON Flight
AFTER INSERT
AS
	DECLARE @DepartureTime DATETIMEOFFSET(4), @ArrivalTime DATETIMEOFFSET(4), @Now DATETIMEOFFSET(7) = SYSDATETIMEOFFSET()
	SELECT @DepartureTime = DepartureTime FROM inserted
	SELECT @ArrivalTime = ArrivalTime FROM inserted
	IF (@Now > @DepartureTime)
		BEGIN 
			PRINT 'Departure Time cannot past the current date'
			ROLLBACK
		END
	ELSE IF (@DepartureTime > @ArrivalTime)
 		BEGIN 
			PRINT 'Departure Time cannot past the Arrival Time '
			ROLLBACK
		END

	ELSE IF (@Now > @ArrivalTime)
		BEGIN 
			PRINT 'Arrival Time cannot past the current date'
			ROLLBACK
		END
	ElSE
		BEGIN 
			PRINT 'Flight Successfully Inserted'
			 
		END

GO
COMMIT TRAN
PRINT 'FlightTimeCheck is created'
GO
 --CAST(@dto AS DATETIME)
-- GETDATE(),