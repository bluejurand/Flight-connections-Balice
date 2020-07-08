# Fligths connections Balice 2019/2020
![pgAdmin 4.21](https://img.shields.io/badge/pgAdmin-4.21-blue) 
![PostGIS 3.0.1](https://img.shields.io/badge/PostGIS-3.0.1-lightblue) 
![QGIS 3.12.3](https://img.shields.io/badge/QGIS-3.12.3-green)  

![Balice flights](https://github.com/bluejurand/Flight-connections-Balice/tree/master/animation/Balice_flights_2019_2020.gif)  

This repository presents flights to and from Balice Airport (Airport located near Kraków - https://en.wikipedia.org/wiki/Krak%C3%B3w_John_Paul_II_International_Airport).
since the beging of 2019 till May 2020. Data was extracted with use of PostgreSQL and PostGIS (extension which that adds support for geographic
objects to the PostgreSQL). Subsequently qnimation was created in QGIS (open-source cross-platform desktop geographic information system
application that supports viewing, editing, and analysis of geospatial data).


## Motivation
Pracitce Structured Query Language, work with Geospatial Data using PostGIS.


## Installation



## Code examples

	CREATE TABLE BALICE_flights_2019_2020
	AS
	SELECT *
	FROM air_traffic_data_2019_2020
	WHERE origin LIKE 'EPKK' OR destination LIKE 'EPKK';
	
	DO $$
	DECLARE
		file_directory VARCHAR := '';
		file_name VARCHAR := '';
	BEGIN
		file_directory := 'C:/Users/Public/Documents/air_traffic/';
		FOR file_name IN SELECT * FROM pg_ls_dir(format('%s', file_directory)) LOOP
			EXECUTE format('COPY air_traffic_data_2019_2020 FROM ''%s%s'' WITH CSV HEADER;', file_directory, file_name);
		END LOOP;
	END; $$;

## Key Concepts
__SQL__

__GIS__

__PostGIS__

__QGIS__

## Summary  


## Resources
[1] 