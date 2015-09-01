﻿EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the procedure for which to return the Journal ON/OFF flag, if NULL or not found will return for the specified group', @level0type = N'SCHEMA', @level0name = N'log4', @level1type = N'FUNCTION', @level1name = N'GetJournalControl', @level2type = N'PARAMETER', @level2name = N'@ModuleName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the group for which to return the Journal ON/OFF flag, if NULL or not found will return the system default', @level0type = N'SCHEMA', @level0name = N'log4', @level1type = N'FUNCTION', @level1name = N'GetJournalControl', @level2type = N'PARAMETER', @level2name = N'@GroupName';

