ALTER TABLE balice_flights_2019_2020 ADD COLUMN origin_geom geometry(Point, 4326);
UPDATE balice_flights_2019_2020 SET origin_geom = ST_SetSRID(ST_MakePoint(longitude_1, latitude_1), 4326);
ALTER TABLE balice_flights_2019_2020 ADD COLUMN destination_geom geometry(Point, 4326);
UPDATE balice_flights_2019_2020 SET destination_geom = ST_SetSRID(ST_MakePoint(longitude_2, latitude_2), 4326);
ALTER TABLE balice_flights_2019_2020 ADD COLUMN flights_trajectories geometry(Linestring, 4326);
UPDATE balice_flights_2019_2020
SET flights_trajectories =  
  (ST_Segmentize(
  (ST_MakeLine(origin_geom, destination_geom)::geography)
  ,100000)::geometry);
ALTER TABLE balice_flights_2019_2020 ADD COLUMN flight_length numeric;
UPDATE balice_flights_2019_2020 SET flight_length = ST_Distance(ST_MakePoint(longitude_1, latitude_1)::geography,
																ST_MakePoint(longitude_2, latitude_2)::geography);
