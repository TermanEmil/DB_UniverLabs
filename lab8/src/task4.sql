-- Test to check task3

-- This line produces the following error:
---- Msg 5074, Level 16, State 1, Line 3
---- The object 'lab4_ex5_unmodif' is dependent on column 'Nume_Student'.
---- Msg 4922, Level 16, State 9, Line 3
---- ALTER TABLE DROP COLUMN Nume_Student failed because one or more objects access this column.
ALTER TABLE studenti DROP COLUMN Nume_Student;