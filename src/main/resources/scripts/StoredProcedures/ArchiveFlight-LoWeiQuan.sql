USE TSI
GO
BEGIN TRAN
GO
DROP PROCEDURE IF EXISTS  uspArchiveFlight
GO
CREATE PROCEDURE uspArchiveFlight
(
	@error_id INT OUTPUT,
	@archivedDate DATETIMEOFFSET(4),
	@maxRecordPerRun INT 
)
AS
BEGIN
 
	DECLARE @message nvarchar(max)= @archivedDate
	
	BEGIN TRY
		DROP TABLE IF EXISTS #TempArchiveFlightTable 
		CREATE TABLE #TempArchiveFlightTable( 
			Id INT NOT NULL,
			AircraftId INT NOT NULL,
			Code VARCHAR(50) NOT NULL,
			FlightState VARCHAR(50) NOT NULL,
			FirstClassPrice MONEY NOT NULL,
			BusinessClassPrice MONEY NOT NULL,
			PremiumClassPrice MONEY NOT NULL,
			EconomyClassPrice MONEY NOT NULL,
			RouteId INT NOT NULL,
			DepartureTime DATETIMEOFFSET(4) NOT NULL,
			ArrivalTime DATETIMEOFFSET(4) NOT NULL,
			NumOfMeal INT NOT NULL,
			CancelFeeChargeRate DECIMAL (5,4) NOT NULL, 
			ChangeFeeChargeRate  DECIMAL (5,4) NOT NULL,
			InfantChargeRate DECIMAL (5,4) NOT NULL,
			HasUnaccompaniedMinorService BIT NOT NULL,
			HasWheelchairService BIT NOT NULL
		)
		DECLARE @totalRecords int
		;WITH batch AS
        (	
			SELECT TOP (@maxRecordPerRun) Id
				  ,AircraftId
				  ,Code
				  ,FlightState
				  ,FirstClassPrice
				  ,BusinessClassPrice
				  ,PremiumClassPrice
				  ,EconomyClassPrice
				  ,RouteId
				  ,DepartureTime
				  ,ArrivalTime
				  ,NumOfMeal
				  ,CancelFeeChargeRate
				  ,ChangeFeeChargeRate
				  ,InfantChargeRate
				  ,HasUnaccompaniedMinorService
				  ,HasWheelchairService
			FROM dbo.Flight
			WHERE  DepartureTime < @archivedDate AND ArrivalTime < @archivedDate  
        )

		INSERT INTO #TempArchiveFlightTable (Id
				  ,AircraftId
				  ,Code
				  ,FlightState
				  ,FirstClassPrice
				  ,BusinessClassPrice
				  ,PremiumClassPrice
				  ,EconomyClassPrice
				  ,RouteId
				  ,DepartureTime
				  ,ArrivalTime
				  ,NumOfMeal
				  ,CancelFeeChargeRate
				  ,ChangeFeeChargeRate
				  ,InfantChargeRate
				  ,HasUnaccompaniedMinorService
				  ,HasWheelchairService)
		SELECT * FROM batch
		
		INSERT INTO dbo.ArchiveFlight(Id
				  ,AircraftId
				  ,Code
				  ,FlightState
				  ,FirstClassPrice
				  ,BusinessClassPrice
				  ,PremiumClassPrice
				  ,EconomyClassPrice
				  ,RouteId
				  ,DepartureTime
				  ,ArrivalTime
				  ,NumOfMeal
				  ,CancelFeeChargeRate
				  ,ChangeFeeChargeRate
				  ,InfantChargeRate
				  ,HasUnaccompaniedMinorService
				  ,HasWheelchairService)
		SELECT * FROM #TempArchiveFlightTable
		
		DELETE FROM dbo.Flight WHERE Id IN (SELECT Id FROM #TempArchiveFlightTable)
		
		SET @totalRecords = @@ROWCOUNT
		SET @message = CONCAT('Number of records to be archived: ', convert(varchar, @totalRecords))
	END TRY
	BEGIN CATCH
		SET @error_id = @@error --  https://docs.microsoft.com/en-us/sql/t-sql/functions/error-transact-sql?view=sql-server-ver15
		SET @message = 'Line: ' + convert( varchar, ERROR_LINE()) + ' Message: ' + ERROR_MESSAGE() + ' Severity: ' + convert( varchar, ERROR_SEVERITY()) + ' State: ' + convert( varchar, ERROR_STATE())
		GOTO Error
	END CATCH
	
	Done:
		Print @message
		RETURN 0
	Error:
		Print @message
		RETURN @error_id
END
GO
COMMIT TRAN
PRINT 'uspArchiveFlight is created'
GO

