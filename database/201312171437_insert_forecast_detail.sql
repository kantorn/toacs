DECLARE @FOID int
DECLARE @MONTHQUANTITY int
DECLARE @TOTALQUANTITY int
DECLARE @MONTHSTART int
DECLARE @MONTHEND int
DECLARE @CURRENT int

SET @MONTHEND =1
SET @CURRENT =1


DECLARE forcast_cursor CURSOR
    FOR SELECT ID,QUANTITY,MONTH_START,MONTH_END FROM [dbo].[FORECAST_ORDER]
OPEN forcast_cursor
FETCH NEXT FROM forcast_cursor INTO @FOID,@TOTALQUANTITY,@MONTHSTART,@MONTHEND

WHILE @@FETCH_STATUS = 0
BEGIN
	SET @MONTHQUANTITY = @TOTALQUANTITY/(@MONTHEND - @MONTHSTART +1)
	SET @CURRENT = @MONTHSTART
	WHILE (@CURRENT <= @MONTHEND)
	BEGIN	
	    
		INSERT INTO [dbo].[FORECAST_ORDER_DETAIL]([MONTH],[FORECAST_QTY],[PLAN_QTY],[FORCAST_ID])
		SELECT @CURRENT as [MONTH],@MONTHQUANTITY as [FORECAST_QTY],@MONTHQUANTITY as [PLAN_QTY], @FOID as [FORCAST_ID]

		SET @CURRENT = @CURRENT+1
	END 
	 
	FETCH NEXT FROM forcast_cursor INTO @FOID,@TOTALQUANTITY,@MONTHSTART,@MONTHEND
END

CLOSE forcast_cursor;
DEALLOCATE forcast_cursor;