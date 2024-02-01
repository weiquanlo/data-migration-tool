USE TSI
GO
BEGIN TRAN
GO
DROP TRIGGER IF EXISTS MealTypeCheck
GO

CREATE TRIGGER MealTypeCheck ON Meal
AFTER INSERT
AS
DECLARE @TypeValue VARCHAR(50), @TypeCategory VARCHAR(50) = 'MealType'
SELECT @TypeValue = MealType FROM inserted
IF NOT EXISTS (SELECT ConstantsValue FROM Constants 
					WHERE ConstantsCategory = @TypeCategory AND ConstantsValue = @TypeValue 
					COLLATE Latin1_General_CS_AS -- for Case Sensitive
					)
BEGIN 
	PRINT CONCAT(@TypeCategory, ' value invalid.  Value "', @TypeValue, '" cannot found in Constants table.')
	ROLLBACK
END
GO

--# Type Check for the rest of tables  
-- Flight table
DROP TRIGGER IF EXISTS FlightStateCheck
GO

CREATE TRIGGER FlightStateCheck ON Flight
AFTER INSERT
AS
DECLARE @TypeValue VARCHAR(50), @TypeCategory VARCHAR(50) = 'FlightState'
SELECT @TypeValue = FlightState FROM inserted
IF NOT EXISTS ( SELECT ConstantsValue FROM Constants 
				WHERE ConstantsCategory = @TypeCategory AND ConstantsValue = @TypeValue
				COLLATE Latin1_General_CS_AS -- for Case Sensitive
				)
BEGIN 
	PRINT CONCAT(@TypeCategory, ' value invalid.  Value "', @TypeValue, '" cannot found in Constants table.')
	ROLLBACK
END
GO

--Itinerary table
DROP TRIGGER IF EXISTS ItineraryStateCheck
GO

CREATE TRIGGER ItineraryStateCheck ON Itinerary
AFTER INSERT
AS
DECLARE @TypeValue VARCHAR(50), @TypeCategory VARCHAR(50) = 'ItineraryState'
SELECT @TypeValue = ItineraryState FROM inserted
IF NOT EXISTS ( SELECT ConstantsValue FROM Constants 
				WHERE ConstantsCategory = @TypeCategory AND ConstantsValue = @TypeValue 
				COLLATE Latin1_General_CS_AS
				)
BEGIN 
	PRINT CONCAT(@TypeCategory, ' value invalid.  Value "', @TypeValue, '" cannot found in Constants table.')
	ROLLBACK
END
GO
--Aircraft table
DROP TRIGGER IF EXISTS AircraftStateCheck
GO

CREATE TRIGGER AircraftStateCheck ON Aircraft
AFTER INSERT
AS
DECLARE @TypeValue VARCHAR(50), @TypeCategory VARCHAR(50) = 'AircraftState'
SELECT @TypeValue = AircraftState FROM inserted
IF NOT EXISTS ( SELECT ConstantsValue FROM Constants 
				WHERE ConstantsCategory = @TypeCategory AND ConstantsValue = @TypeValue 
				COLLATE Latin1_General_CS_AS 
				)
BEGIN 
	PRINT CONCAT(@TypeCategory, ' value invalid.  Value "', @TypeValue, '" cannot found in Constants table.')
	ROLLBACK
END
GO
			
--Ticket table
DROP TRIGGER IF EXISTS ClassesOptionCheck
GO

CREATE TRIGGER ClassesOptionCheck ON Ticket
AFTER INSERT
AS
DECLARE @TypeValue VARCHAR(50), @TypeCategory VARCHAR(50) = 'ClassesOption'
SELECT @TypeValue = ClassesOption FROM inserted
IF NOT EXISTS ( SELECT ConstantsValue FROM Constants 
				WHERE ConstantsCategory = @TypeCategory AND ConstantsValue = @TypeValue
				COLLATE Latin1_General_CS_AS
				)
BEGIN 
	PRINT CONCAT(@TypeCategory, ' value invalid.  Value "', @TypeValue, '" cannot found in Constants table.')
	ROLLBACK
END
GO

DROP TRIGGER IF EXISTS TripOptionCheck
GO

CREATE TRIGGER TripOptionCheck ON Ticket
AFTER INSERT
AS
DECLARE @TypeValue VARCHAR(50), @TypeCategory VARCHAR(50) = 'TripOption'
SELECT @TypeValue = TripOption FROM inserted
IF NOT EXISTS ( SELECT ConstantsValue FROM Constants 
				WHERE ConstantsCategory = @TypeCategory AND ConstantsValue = @TypeValue
				COLLATE Latin1_General_CS_AS
				)
BEGIN 
	PRINT CONCAT(@TypeCategory, ' value invalid.  Value "', @TypeValue, '" cannot found in Constants table.')
	ROLLBACK
END
GO

DROP TRIGGER IF EXISTS TicketStateCheck
GO
CREATE TRIGGER TicketStateCheck ON Ticket
AFTER INSERT
AS
DECLARE @TypeValue VARCHAR(50), @TypeCategory VARCHAR(50) = 'TicketState'
SELECT @TypeValue = TicketState FROM inserted
IF NOT EXISTS ( SELECT ConstantsValue FROM Constants 
				WHERE ConstantsCategory = @TypeCategory AND ConstantsValue = @TypeValue
				COLLATE Latin1_General_CS_AS
				)
BEGIN 
	PRINT CONCAT(@TypeCategory, ' value invalid.  Value "', @TypeValue, '" cannot found in Constants table.')
	ROLLBACK
END
GO
COMMIT TRAN
PRINT 'TriggerConstantValueCheck is created'
GO

