INSERT INTO balice_flights_2019_2020 (firstseen)
VALUES
	(generate_series(timestamp '2020-04-15 00:00:00', '2020-05-31 00:00:00', '1 day'));