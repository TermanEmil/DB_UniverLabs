SELECT Nota, *
FROM studenti
JOIN studenti_reusita sr
    ON studenti.Id_Student = sr.Id_Student
WHERE
    Nota < (
        SELECT MAX(Nota) FROM studenti_reusita sr2 WHERE sr2.Id_Student = 100 AND Tip_Evaluare = 'Examen'
    )

SELECT Nota, *
FROM studenti
JOIN studenti_reusita sr
    ON studenti.Id_Student = sr.Id_Student
WHERE
    Nota < ANY (
        SELECT Nota FROM studenti_reusita sr2 WHERE sr2.Id_Student = 100 AND Tip_Evaluare = 'Examen'
    )