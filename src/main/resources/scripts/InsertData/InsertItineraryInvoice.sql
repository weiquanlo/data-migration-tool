USE TSI
GO
BEGIN TRAN
GO
SET IDENTITY_INSERT ItineraryInvoice ON
GO
SET NOCOUNT ON
GO
DELETE FROM ItineraryInvoice
GO
INSERT ItineraryInvoice (Id, ItineraryId, CancelCharge, ChangeCharge, ItineraryPrice) VALUES (1, 1, 0, 0, 100)
GO
INSERT ItineraryInvoice (Id, ItineraryId, CancelCharge, ChangeCharge, ItineraryPrice) VALUES (2, 2, 0, 0, 100)
GO
INSERT ItineraryInvoice (Id, ItineraryId, CancelCharge, ChangeCharge, ItineraryPrice) VALUES (3, 3, 0, 0, 100)
GO
INSERT ItineraryInvoice (Id, ItineraryId, CancelCharge, ChangeCharge, ItineraryPrice) VALUES (4, 4, 0, 0, 100)
GO
INSERT ItineraryInvoice (Id, ItineraryId, CancelCharge, ChangeCharge, ItineraryPrice) VALUES (5, 5, 0, 0, 100)
GO
SET NOCOUNT OFF
GO
SET IDENTITY_INSERT ItineraryInvoice OFF
GO
COMMIT TRAN
PRINT 'ItineraryInvoice is inserted'
GO