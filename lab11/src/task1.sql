EXEC sp_dropdevice 'device_full', 'delfile';
GO
EXEC sp_addumpdevice 'DISK', 'device_full', '/Users/unicornslayer/Downloads/exercitiul1.bak'
GO

BACKUP DATABASE universitatea 
TO device_full 
WITH FORMAT, NAME = N'backup1'