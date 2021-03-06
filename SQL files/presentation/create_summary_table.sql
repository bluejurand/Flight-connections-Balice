CREATE TABLE monthly_flights_number
AS
SELECT to_char(date_trunc('year', flight_date::date), 'YYYY') as "year", to_char(date_trunc('month', flight_date::date), 'MM') as "month",
count(*) as flights_number
FROM balice_flights_2019_2020
WHERE flight_date >= '2019-01-01' AND flight_date < '2020-05-21'
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

CREATE TABLE monthly_flights_percentage
AS
SELECT "year", 
       "month",
       flights_number,
	   concat('2020/2019 ', "month") as "2020/2019_month",
       lead(flights_number) over (partition by "month" order by "month", "year" desc),
       round((flights_number/((lead(flights_number) over (partition by "month" order by "month", "year" desc))*1.0)-1.0)*100, 2)
	   as "connections_change_[%]"
FROM monthly_flights_number;

ALTER TABLE monthly_flights_percentage
ADD COLUMN id SERIAL PRIMARY KEY;

DELETE FROM monthly_flights_percentage
WHERE "connections_change_[%]" = 0 OR "connections_change_[%]" is NULL;

ALTER TABLE monthly_flights_percentage
DROP COLUMN "id",
DROP COLUMN "year",
DROP COLUMN flights_number,
DROP COLUMN "lead",
DROP COLUMN "month";

SELECT *
FROM monthly_flights_percentage;
