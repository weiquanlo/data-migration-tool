-- TriggerConstantsValueCheck Test


-- Trigger Test - negetive
INSERT Meal (Name ,MealType ) VALUES ('Fillet Burger', 'FS')
SELECT * FROM MEAL

-- Trigger Test - positive
INSERT Meal (Name ,MealType ) VALUES ('Fillet Burger', 'NON_VEG')
SELECT * FROM MEAL

-- Trigger Test - negetive
INSERT Itinerary (BookingPassengerId, ItineraryState) VALUES (5, 'COMPLETE')

 