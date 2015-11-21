
SELECT t1.country_name,npop,nairports,CAST(nairports AS float)/npop*1000 AS pc

FROM 
    (SELECT country_name, SUM(population) AS npop
    FROM optd_por_public
    WHERE population IS NOT NULL
    GROUP BY country_name) AS t1,

    (SELECT country_name, COUNT(*) AS nairports
    FROM optd_por_public
    WHERE location_type='A' OR location_type='CA' 
    GROUP BY country_name) AS t2

WHERE t1.country_name = t2.country_name AND npop > 0
    
ORDER BY pc DESC LIMIT 10;








SELECT population.country_name, npop, nairports
FROM population
INNER JOIN airports
WHERE population.country_name = airports.country_name
ORDER BY npop DESC LIMIT 10;




codigo airline | num vuelos | nombre aerolinea


SELECT airline_code_2c, name, flight_freq
FROM ref_airline_nb_of_flights AS r
LEFT OUTER JOIN optd_airlines AS o
ON o."2char_code"=r.airline_code_2c;

-contamos:
select count(*) from ref_airline_nb_of_flights;


Ordenamos y limitamos a 10 - top ten de aerolineas con másvuelos por semana

SELECT airline_code_2c, name, flight_freq
FROM ref_airline_nb_of_flights AS r
LEFT OUTER JOIN optd_airlines AS o
ON o."2char_code"=r.airline_code_2c
ORDER BY flight_freq DESC LIMIT 10;


Cambiamos el orden de las tablas

SELECT airline_code_2c, name, flight_freq
FROM optd_airlines AS o
LEFT OUTER JOIN ref_airline_nb_of_flights AS r
ON o."2char_code"=r.airline_code_2c;



Cambiamos left join por right join: ahora vamos a tener tanto número de filas como haya en la tabla o


SELECT airline_code_2c, name, flight_freq
FROM ref_airline_nb_of_flights AS r
RIGHT OUTER JOIN optd_airlines AS o
ON o."2char_code"=r.airline_code_2c;


Queries equivalentes:

SELECT airline_code_2c, name, flight_freq
FROM ref_airline_nb_of_flights AS r
LEFT OUTER JOIN optd_airlines AS o
ON o."2char_code"=r.airline_code_2c
ORDER BY flight_freq DESC LIMIT 10;


SELECT airline_code_2c, name, flight_freq
FROM optd_airlines AS o
RIGHT OUTER JOIN ref_airline_nb_of_flights AS r
ON o."2char_code"=r.airline_code_2c
ORDER BY flight_freq DESC LIMIT 10;




Elevación por encima de la media

SELECT country_name, count(*) AS n
FROM optd_por_public
WHERE elevation > (
    SELECT avg(elevation) FROM optd_por_public
    WHERE elevation IS NOT NULL AND location_type='C'
)   AND location_type='C'
GROUP BY country_name
HAVING COUNT(*) >=3;



Ejercicio diapositiva 90

CREATE TABLE fabricantes(
    codigo INT PRIMARY KEY,
    nombre VARCHAR
);


CREATE TABLE articulos(
    codigo INT PRIMARY KEY,
    nombre VARCHAR,
    precio INT,
    fabricante INT REFERENCES fabricantes(codigo)
);

   -- Obtener el nombre de los fabricantes con artículos entre 60 y 200 euros

SELECT DISTINCT fabricantes.nombre 
FROM articulos
LEFT OUTER JOIN fabricantes
ON fabricantes.codigo=articulos.fabricante
WHERE precio BETWEEN 60 AND 200;












































