CREATE TABLE BALICE_flights_2019_2020
AS
SELECT *
FROM air_traffic_data_2019_2020
WHERE origin='EPKK' OR destination='EPKK';