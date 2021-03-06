# Fligths connections Balice 2019/2020
![pgAdmin 4.21](https://img.shields.io/badge/pgAdmin-4.21-blue) 
![PostGIS 3.0.1](https://img.shields.io/badge/PostGIS-3.0.1-lightblue) 
![QGIS 3.12.3](https://img.shields.io/badge/QGIS-3.12.3-green)  

![Balice flights](/animation/Balice_flights_2019_2020.gif)   

This repository presents flights to and from
[Balice Airport](https://en.wikipedia.org/wiki/Krak%C3%B3w_John_Paul_II_International_Airport "Kraków John Paul II International Airport")
(Airport located near Kraków) since the beging of 2019 till May 2020. Data [3] was extracted with use of PostgreSQL and PostGIS
(extension which adds support for geographic objects to the PostgreSQL). Subsequently animation was created in QGIS
(open-source cross-platform desktop geographic information system application that supports viewing, editing, and analysis of geospatial data).


## Balice airport general characteristics
![Balice general infographic](/work-airport-infographic/Balice_general_infographic.png)  
Source image link: <a href="http://www.freepik.com">Designed by macrovector / Freepik</a>

Table below presents histogram of flights frequency vs flight distance for Balice airport.  

| bucket | range in [km]     | freq | bar                            |
|--------|-------------------|------|--------------------------------|
| 1      | [4.06,299.50]     | 976  | ■■■■■■                         |
| 2      | [315.84,614.79]   | 1726 | ■■■■■■■■■■■                    |
| 3      | [614.83,919.98]   | 4588 | ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ |
| 4      | [920.41,1224.70]  | 3859 | ■■■■■■■■■■■■■■■■■■■■■■■■■      |
| 5      | [1227.20,1530.29] | 3061 | ■■■■■■■■■■■■■■■■■■■■           |
| 6      | [1531.22,1836.10] | 1452 | ■■■■■■■■■                      |
| 7      | [1836.50,2141.43] | 344  | ■■                             |
| 8      | [2141.63,2445.54] | 585  | ■■■■                           |
| 9      | [2447.81,2725.38] | 115  | ■                              |
| 10     | [2761.26,3021.12] | 120  | ■                              |
| 12     | [3488.32,3665.65] | 6    |                                |
| 13     | [3670.78,3915.45] | 25   |                                |
| 14     | [4111.26,4142.56] | 6    |                                |
| 25     | [7341.90,7636.23] | 101  | ■                              |
| 26     | [7638.19,7638.19] | 1    |                                |

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
 
![QGIS 3.12 interface](QGIS_3.12_interface.jpg)

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
PostGIS feauters enables to work with geographic data for PostgreSQL. Thanks to that tabularized geographic data can be transformed and analyzed.
Taking that into account from world flights data were extracted infromations for Kraków airport. Subsequenlty to visualize air connections the
QGIS deskopt was used. Presented GIF animation reveals the drastic decline in number of flights as a result of COVID-19 pandemic situation, which
caused flights suspension around the world. To present it in numbers the below table was generated. It shows that steady increase in number of
flights number between year 2019 and 2020 was interuptted by the Coronavirus.


| 2020/2019_month | connections_change_[%] |
|-----------------|------------------------|
| 2020/2019 01    | 33.03                  |
| 2020/2019 02    | 77.21                  |
| 2020/2019 03    | 52.76                  |
| 2020/2019 04    | -99.37                 |
| 2020/2019 05    | -100.00                |

## Resources
[1] https://en.wikipedia.org/wiki/PostGIS  
[2] https://en.wikipedia.org/wiki/QGIS  
[3] https://zenodo.org/record/3901482  