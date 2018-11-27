-- Ignore a warning that doesn't make any sense to me.
SET ANSI_WARNINGS OFF;

-- Remove columns if they exist
if (exists (SELECT * FROM information_schema.COLUMNS WHERE TABLE_NAME = 'grupe' AND COLUMN_NAME = 'Sef_grupa')) 
begin
    ALTER TABLE grupe DROP COLUMN Sef_grupa
end

if (exists (SELECT * FROM information_schema.COLUMNS WHERE TABLE_NAME = 'grupe' AND COLUMN_NAME = 'Prof_Indrumator')) 
begin
    ALTER TABLE grupe DROP COLUMN Prof_Indrumator
end

-- Add the columns
ALTER TABLE grupe ADD Sef_grupa INT, Prof_Indrumator INT

-- Populate sef_grupa
DECLARE @cursor CURSOR;
DECLARE @grupa SMALLINT;

SET @cursor = CURSOR FOR SELECT Id_Grupa FROM grupe;

OPEN @cursor FETCH NEXT FROM @cursor INTO @grupa;
WHILE @@FETCH_STATUS = 0
BEGIN
    DECLARE @seful_grupei INT;
    DECLARE @seful_grupei_medie DECIMAL(6, 4);

    -- Find seful grupei
    SELECT TOP 1
        @seful_grupei = Id_Student,
        @seful_grupei_medie = AVG(Nota * 1.0)
    FROM studenti_reusita
    WHERE
        Id_Grupa = @grupa AND
        Id_Student NOT IN (SELECT Sef_grupa FROM grupe WHERE Sef_grupa IS NOT NULL)
    GROUP BY Id_Student
    ORDER BY AVG(Nota * 1.0) DESC;

    -- Find prof indrumator.
    DECLARE @prof_indrumator INT;
    DECLARE @nr_de_discipline INT;

    SELECT TOP 1
        @prof_indrumator = Id_Profesor,
        @nr_de_discipline = COUNT(DISTINCT Id_Disciplina)
    FROM studenti_reusita
    WHERE
        Id_Grupa = @grupa AND
        Id_Profesor NOT IN (SELECT Prof_Indrumator FROM grupe WHERE Prof_Indrumator IS NOT NULL)
    GROUP BY Id_Profesor
    ORDER BY COUNT(DISTINCT Id_Disciplina) DESC, Id_Profesor;

    -- Insert the new values.
    UPDATE grupe
    SET
        Sef_grupa = @seful_grupei,
        Prof_Indrumator = @prof_indrumator
    WHERE Id_Grupa = @grupa;

    -- Logging for seful grupei.
    PRINT
        'Added Sef_grupei id = ' + CAST(@seful_grupei as VARCHAR) +
        ' media = ' + CAST(@seful_grupei_medie AS VARCHAR) +
        ' for Id_Grupa = ' + CAST(@grupa as VARCHAR);

    -- Logging for prof indrumator.
    PRINT
        'Added prof indrumator id = ' + CAST(@prof_indrumator as VARCHAR) +
        ' nr de discipline = ' + CAST(@nr_de_discipline as VARCHAR) +
        ' Id_Grupa = ' + CAST(@grupa as VARCHAR);
    FETCH NEXT FROM @cursor INTO @grupa;
END;