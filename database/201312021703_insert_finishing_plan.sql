USE [TAC_KANBAN]


DECLARE @PLAN_FIN_ID INT
DECLARE @MODEL_STRUCTURE_ID INT
DECLARE @LOT_NO INT
DECLARE @LINE_ID INT
DECLARE @START_DATE DATE
DECLARE @END_DATE DATE
DECLARE @STATUS NCHAR(10)
DECLARE @MANUAL BIT
DECLARE @CAR_SIZE INT
DECLARE @LOT_SIZE INT
DECLARE @CIRCLE_TIME INT
DECLARE @UPDATE_BY INT
DECLARE @UPDATE_DATE DATE
DECLARE @QUANTITY INT
DECLARE @LINE_SPEED INT
DECLARE @counter INT
DECLARE @totalcount INT
DECLARE @kanbancount INT
DECLARE @tagprefix varchar(20);
DECLARE @tagid varchar(20);
DECLARE @KANBAN_ID INT



DECLARE model_structure_cursor CURSOR
    FOR SELECT pf.ID,pf.MODEL_STRUCTURE_ID,pf.[QUANTITY],ms.LOT_SIZE,ms.LINE_SPEED FROM [dbo].[PLAN_FIN] pf
	INNER JOIN MA_MODEL_STRUCTURE ms on pf.MODEL_STRUCTURE_ID = ms.ID

OPEN model_structure_cursor
FETCH NEXT FROM model_structure_cursor INTO @PLAN_FIN_ID,@MODEL_STRUCTURE_ID,@QUANTITY,@LOT_SIZE,@LINE_SPEED

SET @totalcount = 1;
SET @kanbancount = 1;
SET @tagprefix = 'K0000000';

WHILE @@FETCH_STATUS = 0
BEGIN

	--random number to devide quantity 
	SELECT @CIRCLE_TIME = @QUANTITY/@LOT_SIZE;
	SELECT  @tagid = RIGHT(@tagprefix+ CONVERT(VARCHAR,@kanbancount),10)

	INSERT INTO [dbo].[KANBAN_EXT]
    ([TAG_ID],[MODEL_STRUCTURE_ID],[FORECAST_ID],[QUANTITY],[STATUS],[LOST_SIZE],[CIRCLE])
	SELECT @tagid,@MODEL_STRUCTURE_ID,@PLAN_FIN_ID,@QUANTITY,NULL,@LOT_SIZE,@CIRCLE_TIME

	SELECT @KANBAN_ID = MAX(ID)  FROM  [dbo].[KANBAN_EXT]

	SET @counter = 1;
	WHILE (@counter <= @CIRCLE_TIME) 
	BEGIN
	
		INSERT INTO [dbo].[PLAN_EXT]
		([KANBAN_ID],[MODEL_STRUCTURE_ID],[LOT_NO],[LINE_ID],[START_DATE],[END_DATE],[STATUS],[MANUAL],[CAR_SIZE],[LOT_SIZE],[CIRCLE_TIME])
		SELECT @KANBAN_ID,@MODEL_STRUCTURE_ID,@totalcount, 1,GETDATE(),DATEADD(day, 1, GETDATE()),NULL,0,@LOT_SIZE,@LOT_SIZE,@CIRCLE_TIME

		SET @counter = @counter +1;
		SET @totalcount = @totalcount +1;
	END
	SET @kanbancount = @kanbancount +1;
		
	FETCH NEXT FROM model_structure_cursor  INTO @PLAN_FIN_ID,@MODEL_STRUCTURE_ID,@QUANTITY,@LOT_SIZE,@LINE_SPEED
END

CLOSE model_structure_cursor;
DEALLOCATE model_structure_cursor;

