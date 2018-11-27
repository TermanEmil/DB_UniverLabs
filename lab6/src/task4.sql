UPDATE studenti_reusita
SET Nota = Nota + 1
WHERE
    Nota < 10 AND
    Id_Student IN (SELECT Sef_grupa FROM grupe)
