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
