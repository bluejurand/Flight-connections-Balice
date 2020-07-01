ALTER TABLE balice_flights_2019_2020 ADD COLUMN origin_geom geometry(Point, 4326);
UPDATE balice_flights_2019_2020 SET origin_geom = ST_SetSRID(ST_MakePoint(longitude_1, latitude_1), 4326);
