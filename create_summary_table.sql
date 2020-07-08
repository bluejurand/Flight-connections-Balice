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
/*
CREATE TABLE test
AS
SELECT date_trunc('month', flight_date::date) as mon, count(*)
FROM balice_flights_2019_2020
WHERE flight_date >= '2019-01-01' AND flight_date < '2019-07-01'
GROUP BY mon
ORDER BY mon;
*/
INSERT INTO test
SELECT date_trunc('month', flight_date::date) as mon, count(*)
FROM balice_flights_2019_2020
WHERE flight_date >= '2020-01-01' AND flight_date < '2020-07-01'
GROUP BY mon
ORDER BY mon;