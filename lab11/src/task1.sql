EXEC sp_addumpdevice 'DISK', 'device0', '/Users/unicornslayer/Downloads/exercitiul1.bak'
GO

BACKUP DATABASE universitatea 
TO device0 
WITH FORMAT,
    NAME = 'universitatea backup';  

EXEC sp_dropdevice 'device0', 'delfile';
GO