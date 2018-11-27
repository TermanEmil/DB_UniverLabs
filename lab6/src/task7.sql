INSERT INTO orarul(Id_Disciplina, Id_Profesor, Id_Grupa, Zi, Ora)
SELECT DISTINCT
    sr.Id_Disciplina, sr.Id_Profesor, sr.Id_Grupa, 'Luni' AS Zi, '08:00' AS Ora
FROM  studenti_reusita sr
JOIN discipline ON sr.Id_Disciplina = discipline.Id_Disciplina
JOIN grupe ON sr.Id_Grupa = grupe.Id_Grupa
JOIN profesori ON sr.Id_Profesor = profesori.Id_Profesor
WHERE
    Disciplina = 'Structuri de date si algoritmi' AND
    Cod_Grupa = 'INF171' AND
    Nume_Profesor = 'Bivol' AND Prenume_Profesor = 'Ion';

INSERT INTO orarul(Id_Disciplina, Id_Profesor, Id_Grupa, Zi, Ora)
SELECT DISTINCT
    sr.Id_Disciplina, sr.Id_Profesor, sr.Id_Grupa, 'Luni' AS Zi, '11:30' AS Ora
FROM  studenti_reusita sr
JOIN discipline ON sr.Id_Disciplina = discipline.Id_Disciplina
JOIN grupe ON sr.Id_Grupa = grupe.Id_Grupa
JOIN profesori ON sr.Id_Profesor = profesori.Id_Profesor
WHERE
    Disciplina = 'Programe aplicative' AND
    Cod_Grupa = 'INF171' AND
    Nume_Profesor = 'Mircea' AND Prenume_Profesor = 'Sorin';

INSERT INTO orarul(Id_Disciplina, Id_Profesor, Id_Grupa, Zi, Ora)
SELECT DISTINCT
    sr.Id_Disciplina, sr.Id_Profesor, sr.Id_Grupa, 'Luni' AS Zi, '13:00' AS Ora
FROM  studenti_reusita sr
JOIN discipline ON sr.Id_Disciplina = discipline.Id_Disciplina
JOIN grupe ON sr.Id_Grupa = grupe.Id_Grupa
JOIN profesori ON sr.Id_Profesor = profesori.Id_Profesor
WHERE
    Disciplina = 'Baze de date' AND
    Cod_Grupa = 'INF171' AND
    Nume_Profesor = 'Micu' AND Prenume_Profesor = 'Elena';

SELECT * FROM orarul;