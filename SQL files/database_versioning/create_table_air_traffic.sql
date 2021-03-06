CREATE TABLE air_traffic_data_2019_2020(
	CALLSIGN varchar,
	NMB varchar,
	ICAO24 varchar,
	REGISTRATION varchar,
	TYPECODE varchar,
	ORIGIN varchar,
	DESTINATION varchar,
	FIRSTSEEN varchar,
	LASTSEEN varchar,
	FLIGHT_DATE varchar,
	LATITUDE_1 float8,
	LONGITUDE_1 float8,
	ALTITUDE_1 float8,
	LATITUDE_2 float8,
	LONGITUDE_2 float8,
	ALTITUDE_2 float8);
CREATE INDEX org_dest_idx ON air_traffic_data_2019_2020 (ORIGIN, DESTINATION);