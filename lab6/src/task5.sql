DROP TABLE IF EXISTS profesori_new;

CREATE TABLE profesori_new
(
    Id_Profesor INT PRIMARY KEY CLUSTERED,
    Nume_Profesor VARCHAR(60) NOT NULL,
    Prenume_Profesor VARCHAR(60) NOT NULL,
    Localitatea VARCHAR(255) DEFAULT 'mun.Chisinau',
    Adresa_1 VARCHAR(255),
    Adresa_2 VARCHAR(255),
);

DECLARE @cursor CURSOR;
DECLARE @id_prof INT;

SET @cursor = CURSOR FOR SELECT Id_Profesor FROM profesori;

OPEN @cursor FETCH NEXT FROM @cursor INTO @id_prof;
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Local Vars
    DECLARE @adresa_postala VARCHAR(255);

    DECLARE @localitatea VARCHAR(255);
    DECLARE @adresa_1 VARCHAR(255);
    DECLARE @adresa_2 VARCHAR(255);

    DECLARE @street_index INT;
    DECLARE @house_nb_index INT;


    SELECT @adresa_postala = Adresa_Postala_Profesor FROM profesori WHERE Id_Profesor = @id_prof;

    SET @street_index = CHARINDEX('bd.', @adresa_postala);
    if (@street_index = 0)
        SET @street_index = CHARINDEX('str.', @adresa_postala);
    if (@street_index = 0)
        SET @street_index = 255;

    SET @house_nb_index = PATINDEX('%[0-9]%', @adresa_postala);
    if (@house_nb_index = 0)
        SET @house_nb_index = 255;
    
    SET @localitatea = SUBSTRING(@adresa_postala, 0, @street_index - 2);
    SET @adresa_1 = SUBSTRING(@adresa_postala, @street_index, @house_nb_index - @street_index);
    SET @adresa_2 = SUBSTRING(@adresa_postala, @house_nb_index, 255 - @house_nb_index);

    -- Remove ', ' at the end, if found. Very confusing, but it works.
    SET @adresa_1 = SUBSTRING(@adresa_1, 0, LEN(@adresa_1))

    -- Transform to null if empty.
    if (@localitatea LIKE '')
        SET @localitatea = NULL;
    if (@adresa_1 LIKE '')
        SET @adresa_1 = NULL;
    if (@adresa_2 LIKE '')
        SET @adresa_2 = NULL;

    INSERT INTO profesori_new
    SELECT
        Id_Profesor,
        Nume_Profesor,
        Prenume_Profesor,
        @localitatea AS Localitatea,
        @adresa_1 AS Adresa_1,
        @adresa_2 AS Adresa_2
    FROM profesori
    WHERE Id_Profesor = @id_prof;

    FETCH NEXT FROM @cursor INTO @id_prof;
END;

SELECT * FROM profesori_new;