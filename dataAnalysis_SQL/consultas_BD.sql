-- Import DATA
/*
CREATE TABLE roles (
    id INT,
    film_id INT,
    person_id INT,
    role VARCHAR,
);

CREATE TABLE films (
    id INT,
    title VARCHAR,
    release_year INT,
    country VARCHAR,
    duration INT,
    language VARCHAR,
    certifaction VARCHAR,
    gross INT,
    budget INT
);

CREATE TABLE people (
    id INT,
    name VARCHAR,
    birthdate DATE,
    deathdate DATE
);

CREATE TABLE reviews (
    id INT,
    film_id INT,
    num_user INT,
    num_critic INT,
    imdb_score FLOAT,
    num_votes INT,
    facebook_likes INT
);

BULK INSERT dbo.films
FROM '/films.csv'
WITH
(
    FORMAT = 'CSV',
    FIRSTROW = 1
)
GO

UPDATE dbo.films
SET release_year = LEFT(release_year, LEN(release_year)-1)
WHERE release_year IS NOT NULL;

SELECT SUM(gross)
FROM films;

USE MASTER;
GO
DROP TABLE reviews;
GO





---- CONSULTAR BASES DE DATOS ----

-- COUNT()
SELECT COUNT(birthdate) AS count_birthdate
FROM people;

SELECT COUNT(*) as total_records
FROM people;

-- DISTINCT -> Valores únicos
SELECT language 
FROM films; 

SELECT DISTINCT language 
FROM films;

-- Combinar COUNTR() con DISTINCT
SELECT COUNT(DISTINCT birthdate) AS count_distinct_birthdates
FROM people;

-- El número de peliculas únicas en la tabla reviews
SELECT COUNT(DISTINCT film_id)
FROM reviews;


-- EJECUCIÓN DE CONSULTAS -- 
SELECT TOP 10 name
FROM people;

-------------------------
---- FILTRAR NÚMEROS ----
-------------------------
SELECT title
FROM films
WHERE release_year > 1960;

SELECT title
FROM films
WHERE release_year <= 1960;

-- Diferente a: <>
SELECT title
FROM films
WHERE release_year <> 1960;

SELECT title
FROM films
WHERE country = 'Japan';

SELECT TOP 5 title
FROM films
WHERE country = 'Japan';

-- Cuenta las películas en español
SELECT COUNT(language) AS count_spanish
FROM films
WHERE language = 'Spanish';

-- Múltiples criterios (OR, AND, BETWEEN) --
SELECT *
FROM films
WHERE language = 'Spanish' OR language = 'English';

SELECT *
FROM films
WHERE language = 'Spanish' AND language = 'English';

SELECT *
FROM films
WHERE duration BETWEEN 40 AND 100;

SELECT title
FROM films
WHERE release_year = 1994 OR release_year = 2000;

SELECT title
FROM films
WHERE release_year > 1994 AND release_year < 2000;

SELECT title
FROM films
WHERE (release_year = 1994 OR release_year = 1995)
AND (certification = 'PG' OR certification = 'R');

SELECT title
FROM films
WHERE release_year
    BETWEEN 1994 AND 2000;

-- BETWEEN es inclusivo 

-- FILTRAR TEXTO (LIKE, NOT LIKE, IN)--
-- con %
SELECT name 
FROM people
WHERE name LIKE 'Ade%';

-- con _
SELECT name 
FROM people
WHERE name LIKE 'Ev_';

-- No tienen como parte A.
-- Se distingue entre minusculas y mayusculas.
SELECT name 
FROM people 
WHERE name NOT LIKE 'A.%';

-- Todas las personas que terminen en r
SELECT name 
FROM people 
WHERE name LIKE '%r';


-- Pesonas que la tercera letra sea t
SELECT name 
FROM people
WHERE name LIKE '__t%';

-- IN nos permite establecer fácilmente numerosas condiciones OR
SELECT title
FROM films
WHERE release_year IN (1920,1930,1940);

SELECT *
FROM films 
WHERE language IN ('Spanish', 'French');

-- Valores NULL --
-- datos faltantes IS NULL
SELECT name
FROM people
WHERE birthdate IS NULL;

-- contar fechas de nacimiento que faltan
SELECT COUNT(*) AS no_birthdates
FROM people
WHERE birthdate IS NULL;

-- Contar solo los valores no NULL con (IS NOT NULL) --
SELECT COUNT(name) AS count_birthdates 
FROM people 
WHERE birthdate IS NOT NULL;


-----------------------------
---- FUNCIONES AGREGADAS ----
-----------------------------
-- Resumiendo datos (AVG(), SUM(), MIN(), MAX(), COUNT()) --
SELECT AVG(budget)
FROM films;

SELECT SUM(budget)
FROM films;

SELECT MIN(budget)
FROM films;

SELECT MAX(budget)
FROM films;

SELECT MIN(country)
FROM films;

SELECT MAX(country)
FROM films;

SELECT country, avg(budget) as budget_average
FROM films 
WHERE LANGUAGE IN ('Spanish','English')
GROUP BY country;

-- Resumen de subconjuntos --
SELECT AVG(budget) AS avg_budget
FROM films 
WHERE release_year >= 2010;
SELECT SUM(budget) AS sum_budget
FROM films 
WHERE release_year >= 2010;

SELECT MIN(budget) AS min_budget
FROM films 
WHERE release_year >= 2010;

SELECT MAX(budget) AS max_budget
FROM films
WHERE release_year = 2010;

-- ROUND()
SELECT ROUND(AVG(budget),2) AS avg_budget
FROM films
WHERE release_year >= 2010;

-- ROUND() con parámetro negativo
SELECT ROUND(AVG(budget),-3) AS avg_budget_thousands
FROM films; 

-- Aliasing y aritmética
-- las funciones aritmeticas realizan la operación
-- por columnas y los simbolos aritmeticos por filas.
SELECT (gross - budget) profit
FROM films;

-- Clasificación de resultados
-- ORDER BY (ordenada de forma ascendente)
SELECT title, budget
FROM films
WHERE budget IS NOT NULL
ORDER BY budget ASC;

-- De forma descendente
SELECT title, budget
FROM films
WHERE budget IS NOT NULL
ORDER BY budget DESC;

SELECT title, release_year
FROM films
ORDER BY release_year;

-- ORDER BY multiples campos
SELECT title, duration, budget
FROM films
WHERE duration IS NOT NULL AND budget IS NOT NULL
ORDER BY duration, budget DESC;

-- Agrupación de datos.
SELECT certification, language, COUNT(title) AS title_count
FROM films
GROUP BY certification, language;

SELECT TOP(3) certification, COUNT(title) AS title_count
FROM films
GROUP BY certification
ORDER BY title_count DESC;

-- Filtrado de datos agrupados (con funciones)
SELECT release_year, COUNT(title) AS title_count
FROM films
GROUP BY release_year
HAVING COUNT(title) > 10;
*/

SELECT TOP(3) certification, COUNT(title) AS title_count
FROM films
WHERE certification IN ('G','PG','PG-13')
GROUP BY certification
HAVING COUNT(title) > 500
ORDER BY title_count DESC;