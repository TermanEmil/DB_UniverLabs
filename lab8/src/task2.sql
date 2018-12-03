-- For this task, task1.sql must be run first.

-- Remove if exists
DELETE FROM lab4_ex5
WHERE
    Nume_Student = 'Ku' OR
    Nume_Student = 'Keku';

-- Add Keku Kekosu to Students
INSERT INTO lab4_ex5 (Id_Student, Nume_Student, Prenume_Student)
VALUES (49, 'Keku', 'Kekosu');

-- Change the name from Keku to Ku
UPDATE lab4_ex5
    SET Nume_Student = 'Ku'
    WHERE Nume_Student = 'Keku';


SELECT * FROM lab4_ex5;