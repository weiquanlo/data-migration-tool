USE TSI
GO
BEGIN TRAN
GO
DROP PROCEDURE IF EXISTS CancelTicket
GO

CREATE PROC CancelTicket
@ticketid int

AS

If EXISTS (Select * from Ticket Where Id = @ticketid AND TicketState='ISSUED')
    Begin
	UPDATE Ticket
	set TicketState = 'CANCELLED_BY_PASSENGER'
	WHERE Id = @ticketid;

	UPDATE Itinerary
	set ItineraryState = 'CANCELLED_BY_PASSENGER'
	FROM Ticket t, Itinerary i
	WHERE t.Id = @ticketid AND t.ItineraryId=i.Id ;

	UPDATE ItineraryInvoice
	set CancelCharge = (t.TicketPrice*f.CancelFeeChargeRate)
	FROM Flight f, Ticket t, ItineraryInvoice iv
	WHERE t.Id = @ticketid AND t.FlightId=f.id AND iv.ItineraryId=t.ItineraryId

	Print 'Ticket is cancelled.' 
	End
ELSE
   Begin
    Print 'Invalid Ticket.' 
    END
GO
COMMIT TRAN
PRINT 'CancelTicket is created'
GO