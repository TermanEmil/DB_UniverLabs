ALTER TABLE grupe ADD CONSTRAINT set_unique UNIQUE (Cod_Grupa)

SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'grupe'