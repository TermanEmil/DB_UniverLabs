SELECT DISTINCT Cod_Grupa
FROM grupe
INNER JOIN studenti_reusita AS sr
    ON grupe.Id_Grupa = sr.Id_Grupa
INNER JOIN studenti
    ON sr.Id_Student = studenti.Id_Student
WHERE
    Adresa_Postala_Student LIKE '%str. 31 August%'