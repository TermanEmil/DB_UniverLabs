USE universitatea
GO



EXEC sp_dropdevice 'device_full', 'delfile';
EXEC sp_dropdevice 'device_diff', 'delfile';
EXEC sp_dropdevice 'device_log', 'delfile';
GO

EXEC sp_addumpdevice 'DISK', 'device_full', '/Users/unicornslayer/Downloads/Backup_lab11/universitatea_full.bak'
GO

EXEC sp_addumpdevice 'DISK', 'device_diff', '/Users/unicornslayer/Downloads/Backup_lab11/universitatea_diff.bak'
GO

EXEC sp_addumpdevice 'DISK', 'device_log', '/Users/unicornslayer/Downloads/Backup_lab11/universitatea_log.bak'
GO

SELECT * FROM sys.backup_devices;

BACKUP DATABASE universitatea
TO [device_full] WITH FORMAT,
NAME = N'universitatea - FULL backup'
GO

BACKUP DATABASE universitatea
TO [device_diff] WITH DIFFERENTIAL,
NAME = N'test - DIFF backup'
GO

BACKUP LOG universitatea
TO [device_log] WITH 
NAME = N'test - LOG backup'
GO

RESTORE DATABASE university_lab11
FROM device_full WITH NORECOVERY, REPLACE,
MOVE 'universitatea' TO '/Users/unicornslayer/Downloads/Backup_lab11/universitatea.mdf',
move 'universitatea_File2' TO '/Users/unicornslayer/Downloads/Backup_lab11/universitatea_file2.mdf',
move 'universitatea_File3' TO '/Users/unicornslayer/Downloads/Backup_lab11/universitatea_file3.mdf',
MOVE 'universitatea_log' TO '/Users/unicornslayer/Downloads/Backup_lab11/universitatea_log.ldf'

-- Restore from differential
RESTORE DATABASE university_lab11
FROM device_diff WITH NORECOVERY, REPLACE

-- Restore from Log
RESTORE LOG university_lab11 FROM device_log WITH RECOVERY, REPLACE
