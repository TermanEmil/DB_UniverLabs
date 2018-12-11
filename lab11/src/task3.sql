EXEC sp_dropdevice 'device_log', 'delfile';
GO
EXEC sp_addumpdevice 'DISK','device_log', '/Users/unicornslayer/Downloads/exercitiul3.bak'

BACKUP LOG universitatea TO device_log