/*
SELECT type, 
       sum(case when place  = 'home' then 1 else 0 end) as Home,
       sum(case when  place  = 'school' then 1 else 0 end) as school,
       sum(case when  place  = 'work' then 1 else 0 end) as work,
       sum(case when  place  = 'cafe' then 1 else 0 end) as cafe,
       sum(case when  place  = 'friends' then 1 else 0 end) as friends,
       sum(case when  place  = 'mall' then 1 else 0 end) as mall
  from reports
 group by type
*/
/*
SELECT count(*)
FROM balice_flights_2019_2020
WHERE flight_date >= '2019-01-01' AND flight_date < '2019-02-01';
*/
--SELECT EXTRACT(MONTH FROM TIMESTAMP '2001-02-16 20:38:40');

CREATE TABLE monthly_flights_number
AS
SELECT to_char(date_trunc('month', flight_date::date), 'YYYY-MM') as "year_month", count(*) as flights_number
FROM balice_flights_2019_2020
WHERE flight_date >= '2019-01-01' AND flight_date < '2019-05-21'
GROUP BY "year_month"
ORDER BY "year_month";

INSERT INTO monthly_flights_number
SELECT to_char(date_trunc('month', flight_date::date), 'YYYY-MM') as "year_month", count(*) as flights_number
FROM balice_flights_2019_2020
WHERE flight_date >= '2020-01-01' AND flight_date < '2020-06-01'
GROUP BY "year_month"
ORDER BY "year_month";

INSERT INTO monthly_flights_number
VALUES
	('2020-05', 0);

SELECT * FROM monthly_flights_number;