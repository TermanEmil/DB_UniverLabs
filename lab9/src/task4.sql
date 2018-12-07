DROP PROCEDURE IF EXISTS reassign_prof_stuff
GO

CREATE PROCEDURE reassign_prof_stuff
    @prof_vechi_nume VARCHAR(60),
    @prof_vechi_prenume VARCHAR(60),
    @prof_nou_nume VARCHAR(60),
    @prof_nou_prenume VARCHAR(60),
    @disciplina CHAR(60)
AS
BEGIN
    IF
    (
        SELECT COUNT(*)
        FROM profesori
        WHERE
            Nume_Profesor = @prof_vechi_nume AND
            Prenume_Profesor = @prof_vechi_prenume
    ) <> 1
    BEGIN
        RAISERROR('Old teacher: none or too many with the same name', 16, 1);
    END

    IF
    (
        SELECT COUNT(*)
        FROM profesori
        WHERE
            Nume_Profesor = @prof_nou_nume AND
            Prenume_Profesor = @prof_nou_prenume
    ) <> 1
    BEGIN
        RAISERROR('New teacher: none or too many with the same name', 16, 1);
    END

    UPDATE studenti_reusita
    SET Id_Profesor =
    (
        SELECT Id_Profesor
        FROM profesori
        WHERE
            Nume_Profesor = @prof_nou_nume AND
            Prenume_Profesor = @prof_nou_prenume
    )
    WHERE Id_Profesor =
    (
        SELECT Id_Profesor
        FROM profesori
        WHERE
            
            Nume_Profesor = @prof_vechi_nume AND
            Prenume_Profesor = @prof_vechi_prenume
    ) AND Id_Disciplina = 
    (
        SELECT Id_Disciplina
        FROM discipline
        WHERE Disciplina = @disciplina
    )
END
GO

EXEC reassign_prof_stuff
    @prof_vechi_nume = 'Popescu',
    @prof_vechi_prenume = 'Gabriel',
    @prof_nou_nume = 'Micu',
    @prof_nou_prenume = 'Elena',
    @disciplina = 'Sisteme de operare'

EXEC reassign_prof_stuff
    @prof_vechi_nume = 'Micu',
    @prof_vechi_prenume = 'Elena',
    @prof_nou_nume = 'Popescu',
    @prof_nou_prenume = 'Gabriel',
    @disciplina = 'Sisteme de operare'