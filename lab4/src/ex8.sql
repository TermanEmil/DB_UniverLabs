SELECT DISTINCT studenti.Id_Student, Nume_Student, Data_Evaluare
FROM studenti
INNER JOIN studenti_reusita AS sr
    ON studenti.Id_Student = sr.Id_Student
WHERE
    YEAR(Data_Evaluare) = 2018