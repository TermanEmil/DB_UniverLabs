DROP TRIGGER IF EXISTS inregistrare_noua;
GO

CREATE TRIGGER inregistrare_noua ON orarul
AFTER UPDATE
AS
    SET NOCOUNT ON;
BEGIN
    IF NOT UPDATE(Auditoriu)
        RETURN

    SELECT
        'Schimbare de auditoriu la '
        + 'Disciplina ' + Disciplina + ' '
        + 'Grupa ' + Cod_Grupa + ' '
        + 'Ziua ' + inserted.Zi + ' '
        + 'Ora ' + CAST(inserted.Ora AS VARCHAR) + ' '
        + 'Blocul ' + inserted.Bloc + ' '
        + 'Auditoriul '
            + CAST(deleted.Auditoriu AS VARCHAR)
            + ' -> '
            + CAST(inserted.Auditoriu AS VARCHAR)
        AS msg
    FROM
        deleted,
        (
            inserted
                JOIN grupe ON inserted.Id_Grupa = grupe.Id_Grupa
                JOIN discipline ON inserted.Id_Disciplina = discipline.Id_Disciplina
        )
    WHERE
        inserted.Auditoriu <> deleted.Auditoriu

END
GO

UPDATE orarul
SET Auditoriu = 43;