-- Import DATA

-- CONSULTAR BASES DE DATOS

-- COUNT()
SELECT COUNT(birthdate) AS count_birthdate
FROM people;

SELECT COUNT(*) as total_records
FROM people;

-- DISTINCT -> Valores únicos
SELECT language 
FROM films; 