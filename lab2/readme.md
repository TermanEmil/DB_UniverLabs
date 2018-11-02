# Lab 2

## Control questions
### Types of files used in Microsoft SQL Server 2017
* **Primary**: The primary data file contains the startup information for the database and points to the other files in the database. User data and objects can be stored in this file or in secondary data files.

* **Secondary**: Secondary data files are optional, user-defined, and store user data. Secondary files can be used to spread data across multiple disks by putting each file on a different disk drive. Additionally, if a database exceeds the maximum size for a single Windows file, you can use secondary data files so the database can continue to grow.

* **Log**: Log files hold the log information that is used to recover the database.


### Page structure
* **Page header**: Each page begins with a 96-byte header that is used to store system information about the page. This information includes the page number, page type, the amount of free space on the page, and the allocation unit ID of the object that owns the page.

* **Data Rows**: Data rows are put on the page serially, starting immediately after the header.

* **Row offsets**: A row offset table starts at the end of the page, and each row offset table contains one entry for each row on the page. Each entry records how far the first byte of the row is from the start of the page. The entries in the row offset table are in reverse sequence from the sequence of the rows on the page.

### System databases
* **master**: records all the system-level information for an instance of SQL Server.
* **msdb**: is used by SQL Server Agent for scheduling alerts and jobs.
* **model**: is used as the template for all databases created on the instance of SQL Server. Modifications made to the model database, such as database size, collation, recovery model, and other database options, are applied to any databases created afterward.
* **Resource**: is a read-only database that contains system objects that are included with SQL Server. System objects are physically persisted in the Resource database, but they logically appear in the sys schema of every database.
* **tempdb**: is a workspace for holding temporary objects or intermediate result sets.

### Creating database using Azure Data Studio
For more info view this [link](https://docs.microsoft.com/en-us/sql/linux/quickstart-install-connect-docker?view=sql-server-2017)
1. Install Docker
2. Pull and run the container image
~~~
$ docker pull mcr.microsoft.com/mssql/server:2017-latest
$ docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=<YourStrong!Passw0rd>' \
   -p 1433:1433 --name sql1 \
   -d mcr.microsoft.com/mssql/server:2017-latest
~~~
3. Open Azure Data Studio. Insert the following.
~~~
Server: localhost
User name: sa
Password: <YourStrong!Passw0rd>
~~~
4. Write the sql script to create a db.

## Practical assignments
