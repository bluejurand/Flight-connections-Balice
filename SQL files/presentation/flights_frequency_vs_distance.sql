WITH flight_length_stats AS (
    SELECT min(flight_length) as min,
           max(flight_length) as max
      FROM balice_flights_2019_2020
),
     histogram AS (
   SELECT width_bucket(flight_length, min, max, 25) as bucket,
		 numrange(min(flight_length), max(flight_length), '[]') as range,
		 count(*) as freq
		 FROM balice_flights_2019_2020, flight_length_stats
 GROUP BY bucket
 ORDER BY bucket
)
 SELECT bucket, range, freq,
        repeat('■',
               (   freq::float
                 / max(freq) over()
                 * 30
               )::int
        ) AS bar
   FROM histogram;