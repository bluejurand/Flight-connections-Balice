COPY air_traffic_data_2019_2020 FROM 
'C:/Users/Public/Documents/air_traffic/flightlist_20190101_20190131.csv'
DELIMITER ',' CSV HEADER;
--WITH (FORMAT csv);