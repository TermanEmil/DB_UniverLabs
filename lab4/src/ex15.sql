SELECT DISTINCT Nume_Student, Prenume_Student
FROM
(
    SELECT Nume_Student, Prenume_Student, Data_Evaluare
    FROM studenti
    JOIN studenti_reusita AS sr
        ON studenti.Id_Student = sr.Id_Student
    JOIN profesori AS p
        ON sr.Id_Profesor = p.Id_Profesor
    WHERE
        Prenume_Profesor LIKE('Ion')

    INTERSECT

    SELECT Nume_Student, Prenume_Student, Data_Evaluare
    FROM studenti
    JOIN studenti_reusita AS sr
        ON studenti.Id_Student = sr.Id_Student
    JOIN profesori AS p
        ON sr.Id_Profesor = p.Id_Profesor
    WHERE
        Prenume_Profesor LIKE('Gabriel')
) A
WHERE
    YEAR(Data_Evaluare) = 2017