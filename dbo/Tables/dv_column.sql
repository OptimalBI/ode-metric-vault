﻿CREATE TABLE [dbo].[dv_column] (
    [column_key]                 INT                IDENTITY (1, 1) NOT NULL,
    [table_key]                  INT                NOT NULL,
    [column_name]                VARCHAR (128)      NOT NULL,
    [column_type]                VARCHAR (30)       NOT NULL,
    [column_length]              INT                NULL,
    [column_precision]           INT                NULL,
    [column_scale]               INT                NULL,
    [Collation_Name]             [sysname]          NULL,
    [bk_ordinal_position]        INT                CONSTRAINT [DF__dv_column__bk_or__31EC6D26] DEFAULT ((0)) NOT NULL,
    [source_ordinal_position]    INT                NOT NULL,
    [satellite_ordinal_position] INT                NOT NULL,
    [is_source_date]             BIT                CONSTRAINT [DF__dv_column__is_so__32E0915F] DEFAULT ((0)) NOT NULL,
    [discard_flag]               BIT                CONSTRAINT [DF__dv_column__disca__33D4B598] DEFAULT ((0)) NOT NULL,
    [deleted_column_flag]        BIT                CONSTRAINT [DF__dv_column__delet__34C8D9D1] DEFAULT ((0)) NOT NULL,
    [release_key]                INT                CONSTRAINT [DF_dv_column_release_key] DEFAULT ((0)) NOT NULL,
    [version_number]             INT                CONSTRAINT [DF__dv_column__versi__35BCFE0A] DEFAULT ((1)) NOT NULL,
    [updated_by]                 VARCHAR (30)       CONSTRAINT [DF__dv_column__updat__36B12243] DEFAULT (user_name()) NULL,
    [update_date_time]           DATETIMEOFFSET (7) CONSTRAINT [DF__dv_column__updat__37A5467C] DEFAULT (sysdatetimeoffset()) NULL,
    CONSTRAINT [PK__dv_colum__448C9D1E0C33CF7F] PRIMARY KEY CLUSTERED ([column_key] ASC),
    CONSTRAINT [FK__dv_column__dv_source_table] FOREIGN KEY ([table_key]) REFERENCES [dbo].[dv_source_table] ([table_key]),
    CONSTRAINT [FK_dv_column_dv_release_master] FOREIGN KEY ([release_key]) REFERENCES [dv_release].[dv_release_master] ([release_key]),
    CONSTRAINT [dv_column_unique] UNIQUE NONCLUSTERED ([table_key] ASC, [column_name] ASC)
);



