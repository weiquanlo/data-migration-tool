USE TSI
GO
BEGIN TRAN
GO
DROP PROCEDURE IF EXISTS ChangeTicket
GO
--	 Stock procedures 3# changeTicket()  //Yao Jin
CREATE PROC ChangeTicket
(
	@ticketid int,
	@FlightId int ,
	@TripOption VARCHAR(50), 
	@TripOrder INT ,
	@ClassesOption VARCHAR(50),
	@NeedUnaccompaniedMinorService BIT,
	@NeedWheelchairService BIT ,
	@DiscountedPrice MONEY,
	@TicketPrice MONEY
)

AS

--INSERT Ticket(Id, FlightId, TripOption, TripOrder, ClassesOption, NeedUnaccompaniedMinorService, 
	--NeedWheelchairService, DiscountedPrice, TicketPrice) 
	--VALUES (1, 1, 'ONE_WAY', 0, 'FIRST', 0, 0, 50, 100)

If EXISTS (Select * from Ticket Where Id = @ticketid AND TicketState='ISSUED')
    Begin
	UPDATE Ticket
	set TicketState = 'CHANGED_BY_PASSENGER',
		FlightId = @FlightId,
		TripOption = @TripOption,
		TripOrder = @TripOrder,
		ClassesOption = @ClassesOption,
		NeedUnaccompaniedMinorService = @NeedUnaccompaniedMinorService,
		NeedWheelchairService = @NeedWheelchairService,
		DiscountedPrice = @DiscountedPrice,
		TicketPrice = @TicketPrice
	WHERE Id = @ticketid;

	UPDATE Itinerary
	set ItineraryState = 'CHANGED_BY_PASSENGER'
	FROM Ticket t, Itinerary i
	WHERE t.Id = @ticketid AND t.ItineraryId=i.Id ;

	UPDATE ItineraryInvoice
	set ChangeCharge = (t.TicketPrice*f.ChangeFeeChargeRate)
	FROM Flight f, Ticket t, ItineraryInvoice iv
	WHERE t.Id = @ticketid AND t.FlightId=f.id AND iv.ItineraryId=t.ItineraryId

	Print 'Ticket is changed.' 
	End
ELSE
   Begin
    Print 'Invalid Ticket.' 
    END
GO
COMMIT TRAN
PRINT 'Change Ticket is created'
GO

