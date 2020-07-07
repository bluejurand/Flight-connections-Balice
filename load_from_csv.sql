/*COPY air_traffic_data_2019_2020 FROM 
'C:/Users/Public/Documents/air_traffic/flightlist_20190101_20190131.csv'
DELIMITER ',' CSV HEADER;
--WITH (FORMAT csv);
COPY air_traffic_data_2019_2020 FROM
'C:/Users/Public/Documents/air_traffic/flightlist_20190201_20190228.csv'
DELIMITER ',' CSV HEADER;
COPY air_traffic_data_2019_2020 FROM
'C:/Users/Public/Documents/air_traffic/flightlist_20190301_20190331.csv'
DELIMITER ',' CSV HEADER;
COPY air_traffic_data_2019_2020 FROM
'C:/Users/Public/Documents/air_traffic/flightlist_20190401_20190430.csv'
DELIMITER ',' CSV HEADER;
COPY air_traffic_data_2019_2020 FROM
'C:/Users/Public/Documents/air_traffic/flightlist_20190501_20190531.csv'
DELIMITER ',' CSV HEADER;
COPY air_traffic_data_2019_2020 FROM
'C:/Users/Public/Documents/air_traffic/flightlist_20190601_20190630.csv'
DELIMITER ',' CSV HEADER;
COPY air_traffic_data_2019_2020 FROM
'C:/Users/Public/Documents/air_traffic/flightlist_20190701_20190731.csv'
DELIMITER ',' CSV HEADER;
COPY air_traffic_data_2019_2020 FROM
'C:/Users/Public/Documents/air_traffic/flightlist_20190801_20190831.csv'
DELIMITER ',' CSV HEADER;
COPY air_traffic_data_2019_2020 FROM
'C:/Users/Public/Documents/air_traffic/flightlist_20190901_20190930.csv'
DELIMITER ',' CSV HEADER;
COPY air_traffic_data_2019_2020 FROM
'C:/Users/Public/Documents/air_traffic/flightlist_20191001_20191031.csv'
DELIMITER ',' CSV HEADER;
COPY air_traffic_data_2019_2020 FROM
'C:/Users/Public/Documents/air_traffic/flightlist_20191101_20191130.csv'
DELIMITER ',' CSV HEADER;
COPY air_traffic_data_2019_2020 FROM
'C:/Users/Public/Documents/air_traffic/flightlist_20191201_20191231.csv'
DELIMITER ',' CSV HEADER;
COPY air_traffic_data_2019_2020 FROM
'C:/Users/Public/Documents/air_traffic/flightlist_20200101_20200131.csv'
DELIMITER ',' CSV HEADER;
COPY air_traffic_data_2019_2020 FROM
'C:/Users/Public/Documents/air_traffic/flightlist_20200201_20200229.csv'
DELIMITER ',' CSV HEADER;
COPY air_traffic_data_2019_2020 FROM
'C:/Users/Public/Documents/air_traffic/flightlist_20200301_20200331.csv'
DELIMITER ',' CSV HEADER;
COPY air_traffic_data_2019_2020 FROM
'C:/Users/Public/Documents/air_traffic/flightlist_20200401_20200430.csv'
DELIMITER ',' CSV HEADER;
COPY air_traffic_data_2019_2020 FROM
'C:/Users/Public/Documents/air_traffic/flightlist_20200501_20200531.csv'
DELIMITER ',' CSV HEADER;
*/

--CREATE TABLE csv_files_names AS
--SELECT pg_ls_dir('C:/Users/Public/Documents/air_traffic/') as files_dir;

/*
DECLARE @file_number, @file_name;
SET @file_number = 1;
WHILE @file_number <= SELECT count(*) FROM csv_files_names; 
BEGIN
    SET @file_name = 'C:/Users/Public/Documents/air_traffic/' + SELECT * FROM csv_files_names LIMIT 1 OFFSET @file_number + '.csv' ;
    COPY air_traffic_data_2019_2020 FROM '@file_name' DELIMITER ',' ;
    SET @file_number = @file_number + 1;
END

DO $$
DECLARE
	file_number INTEGER := 1;
	file_full_path VARCHAR := '';
	file_name VARCHAR := '';
BEGIN
	WHILE file_number <= 17 LOOP
		SET file_name = 'C:/Users/Public/Documents/air_traffic/' + SELECT * FROM csv_files_names LIMIT 1 OFFSET file_number + '.csv' ;
		COPY air_traffic_data_2019_2020 FROM 'file_name' DELIMITER ',' 
		SET file_number = file_number + 1;
	END LOOP;
END $$;
*/

/*
create function pg_ls_dir2(text) as
	SELECT pg_ls_dir($1)
language sql SECURITY DEFINER;
*/

--select pg_ls_dir2('C:/Users/Public/Documents/air_traffic/')
--SELECT * FROM pg_ls_dir('C:/Users/Public/Documents/air_traffic/')
/*
DO $$
DECLARE
	filename  VARCHAR := '';
BEGIN
	FOR filename IN SELECT * FROM pg_ls_dir('C:/Users/Public/Documents/air_traffic/') LOOP
		--IF (filename ~ '.csv$') THEN
			--COPY 'C:/Users/Public/Documents/air_traffic/' || filename TO air_traffic_data_2019_2020
		--END IF;
		COPY 'C:/Users/Public/Documents/air_traffic/' || filename TO air_traffic_data_2019_2020
	END LOOP;
END; $$;
*/
/*
DO $$
DECLARE 
    filename VARCHAR := '';
BEGIN 
    RAISE NOTICE 'Get ready to be amazed…';
    FOR filename IN SELECT * FROM pg_ls_dir('C:/Users/Public/Documents/air_traffic/') LOOP
		--COPY 'C:/Users/Public/Documents/air_traffic/%', filename TO air_traffic_data_2019_2020;
		--COPY air_traffic_data_2019_2020 FROM 'C:/Users/Public/Documents/air_traffic/%', filename
		--DELIMITER ',' CSV HEADER;
        RAISE NOTICE 'C:/Users/Public/Documents/air_traffic/%', filename;
    END LOOP;
END; $$;
*/
--COPY air_traffic_data_2019_2020 FROM 'C:/Users/Public/Documents/air_traffic/%', filename
--DELIMITER ',' CSV HEADER;
/*
DO $$
DECLARE
    filename VARCHAR := '';
BEGIN
	filename := 'C:/Users/Public/Documents/air_traffic/flightlist_20190101_20190131.csv';
	EXECUTE format('COPY air_traffic_data_2019_2020 FROM %L WITH CSV HEADER;', filename);
	--RAISE NOTICE 'C:/Users/Public/Documents/air_traffic/%', filename;
--COPY air_traffic_data_2019_2020 FROM format('C:/Users/Public/Documents/air_traffic/%s', 'flightlist_20190101_20190131.csv')
--DELIMITER ',' CSV HEADER;
END; $$;
*/

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

--EXECUTE format($$ COPY air_traffic_data_2019_2020 FROM %s WITH CSV HEADER;$$, filename);
--SELECT format('INSERT INTO %I VALUES(%L)', 'locations', 'C:\Program Files');
--EXECUTE format('\COPY %I FROM %L DELIMITER '','' CSV HEADER;', 'air_traffic_data_2019_2020', 'C:/Users/Public/Documents/air_traffic/flightlist_20190101_20190131.csv');

--SELECT FORMAT('Hello, %s','PostgreSQL');
--COPY air_traffic_data_2019_2020 FROM 'C:/Users/Public/Documents/air_traffic/flightlist_20190101_20190131.csv'
--WITH CSV HEADER;
--DELIMITER ',' CSV HEADER;
/*
DO $$
DECLARE
	someval  VARCHAR := 'test';
	RAISE NOTICE 'C:/Users/Public/Documents/air_traffic/' || 'test';
--'(' || someval || ')';
END; $$;
*/
--select concat_ws('/', 'owner_addr1', 'owner_addr2', 'owner_addr3')
/*
CREATE FUNCTION f_loop2(OUT str text)
  RETURNS text AS
$func$
DECLARE
   i text;
BEGIN
str := '';

FOR i IN
   SELECT regexp_split_to_table('33,55,66,88', ',')
LOOP
  str :=  str || ',' || i;
END LOOP;

END
$func$ LANGUAGE plpgsql;
*/