DO $$
DECLARE
	file_directory VARCHAR := '';
    file_name VARCHAR := '';
BEGIN
	file_directory := 'C:/Users/Public/Documents/air_traffic/';
	file_name := 'flightlist_20190101_20190131.csv';
	FOR file_name IN SELECT * FROM pg_ls_dir('C:/Users/Public/Documents/air_traffic/') LOOP
		EXECUTE format('COPY air_traffic_data_2019_2020 FROM ''C:/Users/Public/Documents/air_traffic/%s'' WITH CSV HEADER;', file_name);
    END LOOP;
END; $$;