# Fligths connections Balice 2019/2020
![pgAdmin 4.21](https://img.shields.io/badge/pgAdmin-4.21-blue) 
![PostGIS 3.0.1](https://img.shields.io/badge/PostGIS-3.0.1-lightblue) 
![QGIS 3.12.3](https://img.shields.io/badge/QGIS-3.12.3-green)  

![Balice flights](https://github.com/bluejurand/Flight-connections-Balice/tree/master/animation/Balice_flights_2019_2020.gif)
<img src="https://github.com/bluejurand/Flight-connections-Balice/tree/master/animation/Balice_flights_2019_2020.gif"  width="800" height="268">  

This repository presents flights to and from
[Balice Airport](https://en.wikipedia.org/wiki/Krak%C3%B3w_John_Paul_II_International_Airport "Kraków John Paul II International Airport")
(Airport located near Kraków) since the beging of 2019 till May 2020. Data was extracted with use of PostgreSQL and PostGIS
(extension which that adds support for geographic objects to the PostgreSQL). Subsequently qnimation was created in QGIS
(open-source cross-platform desktop geographic information system application that supports viewing, editing, and analysis of geospatial data).


## Motivation
Pracitce Structured Query Language, work with Geospatial Data using PostGIS. Visualise impact of
[COVID-19](https://en.wikipedia.org/wiki/Coronavirus_disease_2019 "Coronavirus disease 2019")
pandemic to air traffic on the basis of flights to and from regional European airport.


## Installation

__Installing PostgreSQL__  
PostgreSQL is a requirement (PostgreSQL 4.21 or greater). Recommended enviroment is EDB Postgres to install PostgreSQL (https://www.enterprisedb.com/downloads/postgresql).

__Installing PostGIS__  
PostGIS  is an open source software program that adds support for geographic objects to the PostgreSQL object-relational database [1].
Process of installation is described [here](https://postgis.net/install/ "PostGIS-Installation").
To enable PostGIS functionality execute following SQL commands.  
  
	CREATE EXTENSION postgis;
	CREATE EXTENSION postgis_topology;

__Installing QGIS__  
To install QGIS download from following [link](https://www.qgis.org/pl/site/forusers/download.html).
QGIS is a free and open-source cross-platform desktop geographic information system (GIS) application that supports viewing,
editing, and analysis of geospatial data [2]. Exemplary QGIS interface screenshot below. In this project QGIS was used to create a world map
and visualise flights with animation. Documentation for QGIS is located [here](https://docs.qgis.org/3.10/en/docs/index.html).
 
![QGIS 3.12 interface](https://github.com/bluejurand/Flight-connections-Balice/tree/master/QGIS_3.12_interface.jpg)
<img src="https://github.com/bluejurand/Flight-connections-Balice/tree/master/QGIS_3.12_interface.jpg"  width="650" height="300">  

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

__COVID-19__

__Civil aviation__

## Summary  


## Resources
[1] https://en.wikipedia.org/wiki/PostGIS
[2] https://en.wikipedia.org/wiki/QGIS