﻿CREATE PROC [dbo].[dv_source_table_hiearchy_insert] 
    @table_key int,
    @prior_table_key int,
	@release_number int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	declare @release_key int
	       ,@rc int
	select @release_key = [release_key] from [dv_release].[dv_release_master] where [release_number] = @release_number
	set @rc = @@rowcount
	if @rc <> 1 
		RAISERROR('Release Number %i Does Not Exist', 16, 1, @release_number)

	INSERT INTO [dbo].[dv_source_table_hiearchy] ([table_key], [prior_table_key],[release_key])
	SELECT @table_key, @prior_table_key, @release_key
	
	-- Begin Return Select <- do not remove
	SELECT [table_hiearchy_key], [table_key], [prior_table_key],[release_key]
	FROM   [dbo].[dv_source_table_hiearchy]
	WHERE  [table_hiearchy_key] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT
       RETURN SCOPE_IDENTITY()

