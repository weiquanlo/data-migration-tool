USE TSI
GO
BEGIN TRAN
GO
SET NOCOUNT ON
GO
TRUNCATE TABLE Constants -- DELETE TABLE Constants
GO
INSERT Constants (
ConstantsCategory, 
ConstantsTitle, 
ConstantsValue, 
ConstantsDescription
) 
VALUES 
('Gender', 'Male', 'M', 'Constant value for Gender'),
('Gender', 'Female', 'F', 'Constant value for Gender'),
('Gender', 'Unknown', 'U', 'Constant value for Gender')
GO
INSERT Constants (
ConstantsCategory, 
ConstantsTitle, 
ConstantsValue, 
ConstantsDescription
) 
VALUES 
('TicketType', 'In lap', 'IN_LAP', 'Constant value for TicketType'),
('TicketType', 'In seat', 'IN_SEAT', 'Constant value for TicketType')
GO
INSERT Constants (
ConstantsCategory, 
ConstantsTitle, 
ConstantsValue, 
ConstantsDescription
) 
VALUES 
('ClassesOption', 'First Class', 'FIRST', 'Constant value for ClassesOption'),
('ClassesOption', 'Business Class', 'BUSINESS', 'Constant value for ClassesOption'),
('ClassesOption', 'Premium Economy Class', 'PREMIUM_ECONOMY', 'Constant value for ClassesOption'),
('ClassesOption', 'Economy Class', 'ECONOMY', 'Constant value for ClassesOption')
GO
INSERT Constants (
ConstantsCategory, 
ConstantsTitle, 
ConstantsValue, 
ConstantsDescription
) 
VALUES 
('TripOption', 'One-way', 'ONE_WAY', 'Constant value for TripOption'),
('TripOption', 'Round-trip', 'ROUND_TRIP', 'Constant value for TripOption'),
('TripOption', 'Multi-city', 'MULTI_CITY', 'Constant value for TripOption') 
GO
INSERT Constants (
ConstantsCategory, 
ConstantsTitle, 
ConstantsValue, 
ConstantsDescription
) 
VALUES 
('MealType', 'Non-vegetarian', 'NON_VEG', 'Constant value for MealType'),
('MealType', 'Vegetarian', 'VEG', 'Constant value for MealType'),
('MealType', 'Child-Special', 'CHILD', 'Constant value for MealType') 
 GO
 INSERT Constants (
ConstantsCategory, 
ConstantsTitle, 
ConstantsValue, 
ConstantsDescription
) 
VALUES 
('AircraftState', 'Arrival', 'ARRIVAL', 'Constant value for AircraftState'),
('AircraftState', 'Onboarding', 'ONBOARDING', 'Constant value for AircraftState'),
('AircraftState', 'OnJourney', 'ONJOURNEY', 'Constant value for AircraftState')
 GO
 INSERT Constants (
ConstantsCategory, 
ConstantsTitle, 
ConstantsValue, 
ConstantsDescription
) 
VALUES 
('FlightState', 'Draft', 'DRAFT', 'Constant value for FlightState'),
('FlightState', 'Published', 'PUBLISHED', 'Constant value for FlightState'),
('FlightState', 'OnJourney', 'ONJOURNEY', 'Constant value for FlightState'),
('FlightState', 'Completed', 'COMPLETED', 'Constant value for FlightState'),
('FlightState', 'Cancelled', 'CANCELLED', 'Constant value for FlightState') 
 GO
 INSERT Constants (
ConstantsCategory, 
ConstantsTitle, 
ConstantsValue, 
ConstantsDescription
) 
VALUES 
('ItineraryState', 'Issued', 'ISSUED', 'Constant value for ItineraryState'),
('ItineraryState', 'OnJourney', 'ONJOURNEY', 'Constant value for ItineraryState'),
('ItineraryState', 'Completed', 'COMPLETED', 'Constant value for ItineraryState'),
('ItineraryState', 'Cancelled By Passenger', 'CANCELLED_BY_PASSENGER', 'Constant value for ItineraryState'),
('ItineraryState', 'Changed By Passenger', 'CHANGED_BY_PASSENGER', 'Constant value for ItineraryState')
 GO
 INSERT Constants (
ConstantsCategory, 
ConstantsTitle, 
ConstantsValue, 
ConstantsDescription
) 
VALUES 
('TicketState', 'Issued', 'ISSUED', 'Constant value for TicketState'),
('TicketState', 'Checked In', 'CHECKED_IN', 'Constant value for TicketState'),
('TicketState', 'OnJourney', 'ONJOURNEY', 'Constant value for TicketState'),
('TicketState', 'Completed', 'COMPLETED', 'Constant value for TicketState'),
('TicketState', 'Overdue', 'OVERDUE', 'Constant value for TicketState'),
('TicketState', 'Cancelled By Passenger', 'CANCELLED_BY_PASSENGER', 'Constant value for TicketState'),
('TicketState', 'Changed By Passenger', 'CHANGED_BY_PASSENGER', 'Constant value for TicketState')
GO
SET NOCOUNT OFF
GO
COMMIT TRAN
PRINT 'Constants is inserted'
GO