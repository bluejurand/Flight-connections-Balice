SELECT round(AVG(montlhy_flights.montlhy_flights_count), 2) FROM
	(SELECT count(*) as montlhy_flights_count
	FROM balice_flights_2019_2020
	GROUP BY SUBSTRING(flight_date, 1, 7)) montlhy_flights;

SELECT * FROM 
(
    SELECT
        origin,
        count(*) cnt,
        rank() over (ORDER BY count(*) DESC)
    FROM balice_flights_2019_2020
    WHERE origin != 'EPKK'
    GROUP BY origin
) a

WHERE rank = 1;

SELECT * FROM 
(
    SELECT
        destination,
        count(*) cnt,
        rank() over (ORDER BY count(*) DESC)
    FROM balice_flights_2019_2020
    WHERE destination != 'EPKK'
    GROUP BY destination
) a

WHERE rank = 1;
/*
CREATE FUNCTION _final_median(anyarray) RETURNS float8 AS $$ 
  WITH q AS
  (
     SELECT val
     FROM unnest($1) val
     WHERE VAL IS NOT NULL
     ORDER BY 1
  ),
  cnt AS
  (
    SELECT COUNT(*) as c FROM q
  )
  SELECT AVG(val)::float8
  FROM 
  (
    SELECT val FROM q
    LIMIT  2 - MOD((SELECT c FROM cnt), 2)
    OFFSET GREATEST(CEIL((SELECT c FROM cnt) / 2.0) - 1,0)  
  ) q2;
$$ LANGUAGE sql IMMUTABLE;

CREATE AGGREGATE median(anyelement) (
  SFUNC=array_append,
  STYPE=anyarray,
  FINALFUNC=_final_median,
  INITCOND='{}'
);
*/
SELECT median(flight_length)
FROM balice_flights_2019_2020;

SELECT * FROM 
(
    SELECT
        SUBSTRING(destination, 2, 1),
        count(*) cnt,
        rank() over (ORDER BY count(*) DESC)
    FROM balice_flights_2019_2020
    WHERE destination != 'EPKK'
    GROUP BY SUBSTRING(destination, 2, 1)
) a

WHERE rank = 1;

SELECT * FROM 
(
    SELECT
        SUBSTRING(origin, 2, 1),
        count(*) cnt,
        rank() over (ORDER BY count(*) DESC)
    FROM balice_flights_2019_2020
    WHERE origin != 'EPKK'
    GROUP BY SUBSTRING(origin, 2, 1)
) a

WHERE rank = 1;