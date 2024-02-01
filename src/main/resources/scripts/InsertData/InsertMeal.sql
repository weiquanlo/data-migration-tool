USE TSI
GO
BEGIN TRAN
GO
SET IDENTITY_INSERT Meal ON
GO
SET NOCOUNT ON
GO
DELETE FROM Meal 
GO
INSERT Meal (Id, Name ,MealType ) VALUES (1, 'Nasi Lemak', 'NON_VEG')
GO
INSERT Meal (Id, Name ,MealType ) VALUES (2, 'Chicken Sandwich', 'NON_VEG')
GO
INSERT Meal (Id, Name ,MealType ) VALUES (3, 'Spaghetti Aglio e Olio', 'VEG')
GO
INSERT Meal (Id, Name ,MealType ) VALUES (4, 'Vegan Fried Rice', 'VEG')
GO
INSERT Meal (Id, Name ,MealType ) VALUES (5, 'Small Fries', 'CHILD')
GO
INSERT Meal (Id, Name ,MealType ) VALUES (6, 'Small Egg Sandwich', 'CHILD')
GO
SET NOCOUNT OFF
GO
SET IDENTITY_INSERT Meal OFF
GO
COMMIT TRAN
PRINT 'Meal is inserted'
GO
