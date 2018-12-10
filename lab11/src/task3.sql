EXEC sp_addumpdevice 'DISK','device2', '/Users/unicornslayer/Downloads/exercitiul3.bak'

BACKUP LOG universitatea TO device2

EXEC sp_dropdevice 'device2', 'delfile';
GO
