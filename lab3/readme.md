# Lab 3
---
## Answers to Questions:

1. In SQL Server any column in a database table must have at least those properties specified:
    - **Name** - the name of the selected column.
    - **Data Type** - the data type for the selected column.
    - **Allow Nulls** - indicates whether this column allows nulls.

2. Some of the data types used in SQL Server:
    - Exact numerics (bigint, int, smallint, bit, decimal, etc.)
    - Approximate numerics (float, real)
    - Character Strings (char, varchar, text)
    - Date and time (date, datetime, smalldatetime, etc.)
    - Binary strings (binary, varbinary, image)
    - Other data types (cursor, hierarchyid, rowversion, etc.)
    - Unicode character strings (nchar, nvarchar, ntext)

3. Integrity constraints are used to ensure accuracy and consistency of data in a relational database. SQL Server uses following constraints:
    - **Not NULL** - disallows the entrance of NULL values into a column
    - **Unique** - value in that column for every row of data in the table must have a unique value.
    - **Primary Key** - identifies one or more columns in a table that make a row of data unique.
    - **Foreign Key** - references a primary key in the parent table.
    - **Check** - Check (CHK) constraints can be utilized to check the validity of data entered into particular table columns.

4. You cannot delete a column that has a CHECK constraint without deleting the constraint first. Also, it is not possible to delete a column that has PRIMARY KEY or FOREIGN KEY constraints or other dependencies except when using the Table Designer. When using Object Explorer or Transact-SQL, you must first remove all dependencies on the column.

5. Modifying the data type of a column that already contains data can result in the permanent loss of data when the existing data is converted to the new type. In addition, code and applications that depend on the modified column may fail. These include queries, views, stored procedures, user-defined functions, and client applications. Note that these failures will cascade. For example, a stored procedure that calls a user-defined function that depends on the modified column may fail.

## Practical assignments
1.  Which number can be put in a column with type `DECIMAL(4, 1)`?
    - `116,2` is the answer, because it has 3 digits before the decimal and 1 digit after the decimal.
2. Consider Col1 is `INT` and Col2 is `DECIMAL(2, 1)`. What type Col3 should be to contain the result of **Col1 * Col2**?

        | Col1 | Col2 | Col3 |
        |------|------|------|
        | 1    | 1.0  | ?    |
        | 2    | 1.0  | ?    |

  In order to save the result of multiplication Col3 must have DECIMAL(2, 1) as type, since `DECIMAL` has higher precedence than `INT`.

3. Create a database with default properties called university, for storing 2 tables groups & disciplines.

```SQL
CREATE DATABASE university;
USE university;

CREATE TABLE groups (
    id_group SMALLINT NOT NULL,
    group_code CHAR(6) NOT NULL,
    speciality VARCHAR(255),
    faculty_name VARCHAR(255)
);

CREATE TABLE disciplines (
    id_discipline INT NOT NULL,
    discipline VARCHAR(255) NOT NULL,
    nb_planned_hours SMALLINT
);
```

4. Insert some data.

```SQL
INSERT INTO disciplines
VALUES
    (100, 'Sisteme de operare', 60),
    (101, 'Programarea calculatoarelor', 60),
    (102, 'Infomatica aplicata', 46),
    ...

INSERT INTO groups
VALUES
    (1, 'CIB171', 'Cibernetica', 'Informatica si Cibernetica'),
    (2, 'INF171', 'Informatica', 'Informatica si Cibernetica'),
    (3, 'TI171', 'Tehnologii Informationale', 'Informatica si Cibernetica');
```
