WITH verts(vert) AS
(
    SELECT 3
UNION ALL
    SELECT 
        CASE
            WHEN vert = 0 THEN 0
            WHEN vert = 1 THEN 0
            WHEN vert = 2 THEN 1
            WHEN vert = 3 THEN 2
            WHEN vert = 4 THEN 2
            WHEN vert = 5 THEN 0
        END
    FROM verts WHERE vert <> 0
) SELECT * FROM verts;