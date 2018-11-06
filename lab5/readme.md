# Lab 5

## Questions

### Tipuri de blocuri in Transact-SQL
  1. **Blocuri anonime**: acestea sunt blocuri Transact-SQL, care sunt definite in cadrul unei aplicatii si nu au nume;

  2. **Proceduri**: acestea sunt blocuri Transact-SQL, care au un nume, au parametri de intrare, dar nu au parametri de iesire expliciti;

  3. **Functii**: acestea sunt blocuri Transact-SQL, care au un nume, au parametri de intrare si tot timpul returneaza o valoare;

### Sa se explice functionarea buclei repetitive WHILE
~~~SQL
WHILE <expresie_booleana>
  { <instructiune_sql> | <bloc instructiuni sql> | BREAK | CONTINUE }
~~~

In timpul executarii, se evalueaza mai intai conditia buclei a ciirei valoare trebuie sa fie intreaga. Daca valoarea calculata este TRUE, atunci instructiunea se executa. Cand conditia, adica valoarea (inclusiv prima) a expresiei booleene din paranteze este FALSE, se face un salt la instructiunea de dupa corpul instructiunii WHILE, deci, instructiunea WHILE se termina. Astfel, instructiunea asociata cu WHILE se executa repetat, cat timp valoarea asociata conditiei este diferita de FALSE.


### Sa se explice functionarea expresiei CASE
~~~SQL
CASE <expresie_intrare>
   WHEN <expresie_comparare> THEN <expresie_rezultat>
  [WHEN <expresie_comparare> THEN <expresie_rezultat>...]
  [ELSE <expresie_rezultat_alternativ>]
END
~~~

Fiecare conditie WHEN este evaluata sub forma `<expresie_intrare> = <expresie_intrare>` si, daca rezultatul are valoarea TRUE, este returnata valoarea `<expresie_rezultat>` si nici o alta conditie WHEN nu mai este evaluata.

Daca nici una dintre conditiile **WHEN** nu este evaluata ca adevarata si exista o conditie ELSE, este returnata valoarea `<expresie_rezultat>` asociata conditiei **ELSE**.

Daca nici una dintre conditiile **WHEN** nu este evaluata ca adevarata si nu exista o conditie **ELSE**, este returnata valoarea **NULL**.

### Utilizarea si actiunile structurii alternative IF. ..ELSE
~~~SQL
IF <expresie_booleana>
  { <instructiune_sqll> I <bloc instructiuni sqll> }
[ ELSE
  { <instructiune_sql2> I <bloc instructiuni sql2> } ]
~~~

Instructiunea **IF...ELSE** impune urmatoarele conditii de executie: `<expresie_booleanii>` este TRUE, se executa instructiunea sau blocul `{<instrucfiune_sqll> | <bloc instrucfiuni sqll>)`. Clauza **ELSE** este optionala si aceasta este urmata de instructiunile, care trebuie sa fie executate, daca valoarea expresiei `<expresie_booleana>` este FALSE sau NULL.

### Ce este o exceptie? Captarea si tratarea exceptiilor
Exceptiile sunt problemele (de obicei, erorile), care nu permit programului sa continue. Acest lucru se intampla din lipsa de informatie suficienta si, de aceea, controlul se transmite altei plifti a programului. Tratarea exceptiilor este un mijloc relativ simplu de determinare a erorilor, prezinta mecanismul de indicare directa a erorii si vizualizarea si verificarea exceptiei m procesul de compilare.

~~~SQL
-- Porneste blocul de instructiuni "protejat de eroare"
BEGIN TRY
  {instructiune_sqllbloc_sql}
END TRY

-- incepe blocul de instructiuni de tratare a erorii
BEGIN CATCH
  [{instructiune_sqllbloc_sql}]
END CATCH [ ; ]
~~~

### Functia instructiunii RAISERROR
~~~SQL

RAISERROR ( { <id_msg> | <str_msg> | <@variabila_locala> }
  { , <severitatea> , <starea> }
  [ , <argument> [ ,...n] ] ) [WITH <optiune> [ ,...n] ]
~~~

In general, toate mesajele au acee~i structura: un numar de eroare, un mesaj de explicare a erorii, un indicator de severitate (gravitate), o stare, numele procedurii asociate erorii si numarul liniei care a
provocat eroarea.

## Practical assignments

### Task 1

#### Condition
Completati urmatorul cod pentru a afi~a eel mai mare numar dintre cele trei numere prezentate:

~~~SQL
DECLARE @N1 INT, @N2 INT, @N3 INT; DECLARE @MAI_MARE INT;
SET @N1 = 60 * RAND();
SET @N2 = 60 * RAND();
SET @N3 = 60 * RAND();

-- Aici ar trebui plasate IF-urile

PRINT @N1;
PRINT @N2;
PRINT @N3;
PRINT 'Mai mare = ' + CAST(@MAI_MARE AS VARCHAR(2));
~~~

**Solved**: [link to code](./src/task1.sql)

### Task 2

#### Condition
Afisati primele zece date (numele, prenumele studentului) in functie de valoarea notei (cu exceptia notelor 6 si 8) a studentului la primul test al disciplinei Baze de date, folosind structura de altemativa IF...ELSE. Sa se foloseasca variabilele.

**Solved**: [link to code](./src/task2.sql)

### Task 3

#### Condition
Rezolvati aceesi sarcina, 1, apeland la structura selectiva CASE.

**Solved**: [link to code](./src/task3.sql)

### Task 4

Modificati exercitiile din sarcinile 1 si 2 pentru a include procesarea erorilor cu TRY si CATCH, si RAISERRROR.

**Solved 4.1**: [link to code](./src/task4.1.sql)

**Solved 4.2**: [link to code](./src/task4.2.sql)

## Conclusion
There could be better exercises.
