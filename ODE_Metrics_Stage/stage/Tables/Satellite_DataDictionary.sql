﻿CREATE TABLE [stage].[Satellite_DataDictionary] (
    [satellite_key]          INT                NULL,
    [Description]            VARCHAR (255)      NULL,
    [BusinessRule]           VARCHAR (8000)     NULL,
    [metrics_stage_run_time] DATETIMEOFFSET (7) DEFAULT (sysdatetimeoffset()) NULL
);

