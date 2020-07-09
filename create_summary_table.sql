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
SELECT to_char(date_trunc('month', flight_date::date), 'YYYY') as "year", to_char(date_trunc('month', flight_date::date), 'MM') as "month",
count(*) as flights_number
FROM balice_flights_2019_2020
WHERE flight_date >= '2019-01-01' AND flight_date < '2019-05-21'
GROUP BY "year", "month"
ORDER BY "year", "month";

INSERT INTO monthly_flights_number
SELECT to_char(date_trunc('month', flight_date::date), 'YYYY') as "year", to_char(date_trunc('month', flight_date::date), 'MM') as "month",
count(*) as flights_number
FROM balice_flights_2019_2020
WHERE flight_date >= '2020-01-01' AND flight_date < '2020-06-01'
GROUP BY "year", "month"
ORDER BY "year", "month";

INSERT INTO monthly_flights_number
VALUES
	('2020', '05', 0);
/*
CREATE TABLE monthly_flights_percentage
AS
SELECT SUBSTRING(year_month, 6, 7) as "month", SUBSTRING(year_month, 1, 4) as "year"
FROM monthly_flights_number
--WHERE flight_date >= '2019-01-01' AND flight_date < '2019-05-21'
GROUP BY "month"
ORDER BY "month";
*/
SELECT * FROM monthly_flights_number;