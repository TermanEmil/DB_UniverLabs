if exists (select * from sys.filegroups where name='userdatafgroup')
begin
    ALTER DATABASE universitatea 
    REMOVE FILEGROUP userdatafgroup;

    ALTER DATABASE universitatea
    REMOVE FILE index_lab6;
end;
GO

ALTER DATABASE universitatea 
ADD FILEGROUP userdatafgroup;
GO

ALTER DATABASE universitatea  
ADD FILE   
(  
    NAME = index_lab6,  
    FILENAME = '/Users/unicornslayer/emil.ndf',  
    SIZE = 10MB,  
    MAXSIZE = 100MB,  
    FILEGROWTH = 10%  
)   
TO FILEGROUP userdatafgroup;  
GO

create nonclustered index create_index on grupe(Id_Grupa) on [userdatafgroup]

GO

select * from sys.indexes