USE [TAC_KANBAN]

DECLARE @PARTID INT;
DECLARE @MODELID INT;

SET @PARTID  = -1;
SET @MODELID  = -1;

DECLARE part_cursor CURSOR
    FOR SELECT ID FROM [MA_PART]
OPEN part_cursor
FETCH NEXT FROM part_cursor INTO @PARTID
WHILE @@FETCH_STATUS = 0
BEGIN
	SELECT @MODELID = ID FROM [MA_MODEL]
	ORDER BY NEWID()

	INSERT INTO [dbo].[MA_MODEL_STRUCTURE] ([PART_ID],[MODEL_ID],[LINE_SPEED])
		 VALUES (@PARTID,@MODELID,30);

	FETCH NEXT FROM part_cursor INTO @PARTID
END

CLOSE part_cursor;
DEALLOCATE part_cursor;