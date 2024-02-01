USE TSI
GO
BEGIN TRAN
GO
SET NOCOUNT ON
GO
DELETE FROM TicketMeal
GO
INSERT TicketMeal (TicketId, MealId) VALUES (1, 1)
GO
INSERT TicketMeal (TicketId, MealId) VALUES (2, 2)
GO
INSERT TicketMeal (TicketId, MealId) VALUES (3, 3)
GO
INSERT TicketMeal (TicketId, MealId) VALUES (4, 4)
GO
INSERT TicketMeal (TicketId, MealId) VALUES (5, 5)
GO
SET NOCOUNT OFF
GO
COMMIT TRAN
PRINT 'TicketMeal is inserted'
GO