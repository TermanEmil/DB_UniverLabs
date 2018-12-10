EXEC sp_addumpdevice 'DISK', 'device1', '/Users/unicornslayer/Downloads/exercitiul2.bak'
GO

BACKUP DATABASE universitatea TO device1 WITH DIFFERENTIAL
GO

EXEC sp_dropdevice 'device1', 'delfile';
GO