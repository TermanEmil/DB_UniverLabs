EXEC sp_dropdevice 'device_diff', 'delfile';
GO
EXEC sp_addumpdevice 'DISK', 'device_diff', '/Users/unicornslayer/Downloads/exercitiul2.bak'
GO

BACKUP DATABASE universitatea TO device_diff WITH DIFFERENTIAL
GO