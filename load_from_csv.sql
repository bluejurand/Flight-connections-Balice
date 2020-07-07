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