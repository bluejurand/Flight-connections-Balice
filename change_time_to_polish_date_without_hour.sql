UPDATE balice_flights_2019_2020
SET firstseen = LEFT(firstseen, 19);

ALTER TABLE balice_flights_2019_2020
  ALTER firstseen DROP DEFAULT
 ,ALTER firstseen type timestamp USING firstseen::timestamp
 ,ALTER firstseen SET DEFAULT '1970-01-01 01:00:00'::timestamp;

UPDATE balice_flights_2019_2020
SET firstseen = firstseen + interval '1h';

UPDATE balice_flights_2019_2020
SET lastseen = LEFT(lastseen, 19);

ALTER TABLE balice_flights_2019_2020
  ALTER lastseen DROP DEFAULT
 ,ALTER lastseen type timestamp USING lastseen::timestamp
 ,ALTER lastseen SET DEFAULT '1970-01-01 01:00:00'::timestamp;

UPDATE balice_flights_2019_2020
SET lastseen = lastseen + interval '1h';

UPDATE balice_flights_2019_2020
SET FLIGHT_DATE = LEFT(flight_date, 10);