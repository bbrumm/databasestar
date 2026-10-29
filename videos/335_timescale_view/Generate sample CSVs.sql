\copy (SELECT (now() - interval '365 days' + make_interval(secs => (n::double precision / 125000000) * 31536000)) AS recorded_at, (random() * 100)::int + 1 AS device_id, round((random() * 40 + 10)::numeric, 2) AS temperature, round((random() * 60 + 20)::numeric, 2) AS humidity FROM generate_series(1, 125000000) AS n) TO 'chunk_1.csv' WITH CSV

\copy (SELECT (now() - interval '319 days' + make_interval(secs => (n::double precision / 125000000) * 31536000)) AS recorded_at, (random() * 100)::int + 1 AS device_id, round((random() * 40 + 10)::numeric, 2) AS temperature, round((random() * 60 + 20)::numeric, 2) AS humidity FROM generate_series(1, 125000000) AS n) TO 'chunk_2.csv' WITH CSV

\copy (SELECT (now() - interval '273 days' + make_interval(secs => (n::double precision / 125000000) * 31536000)) AS recorded_at, (random() * 100)::int + 1 AS device_id, round((random() * 40 + 10)::numeric, 2) AS temperature, round((random() * 60 + 20)::numeric, 2) AS humidity FROM generate_series(1, 125000000) AS n) TO 'chunk_3.csv' WITH CSV

\copy (SELECT (now() - interval '227 days' + make_interval(secs => (n::double precision / 125000000) * 31536000)) AS recorded_at, (random() * 100)::int + 1 AS device_id, round((random() * 40 + 10)::numeric, 2) AS temperature, round((random() * 60 + 20)::numeric, 2) AS humidity FROM generate_series(1, 125000000) AS n) TO 'chunk_4.csv' WITH CSV

\copy (SELECT (now() - interval '181 days' + make_interval(secs => (n::double precision / 125000000) * 31536000)) AS recorded_at, (random() * 100)::int + 1 AS device_id, round((random() * 40 + 10)::numeric, 2) AS temperature, round((random() * 60 + 20)::numeric, 2) AS humidity FROM generate_series(1, 125000000) AS n) TO 'chunk_5.csv' WITH CSV


\copy (SELECT (now() - interval '135 days' + make_interval(secs => (n::double precision / 125000000) * 31536000)) AS recorded_at, (random() * 100)::int + 1 AS device_id, round((random() * 40 + 10)::numeric, 2) AS temperature, round((random() * 60 + 20)::numeric, 2) AS humidity FROM generate_series(1, 125000000) AS n) TO 'chunk_6.csv' WITH CSV


\copy (SELECT (now() - interval '89 days' + make_interval(secs => (n::double precision / 125000000) * 31536000)) AS recorded_at, (random() * 100)::int + 1 AS device_id, round((random() * 40 + 10)::numeric, 2) AS temperature, round((random() * 60 + 20)::numeric, 2) AS humidity FROM generate_series(1, 125000000) AS n) TO 'chunk_7.csv' WITH CSV

\copy (SELECT (now() - interval '43 days' + make_interval(secs => (n::double precision / 125000000) * 31536000)) AS recorded_at, (random() * 100)::int + 1 AS device_id, round((random() * 40 + 10)::numeric, 2) AS temperature, round((random() * 60 + 20)::numeric, 2) AS humidity FROM generate_series(1, 125000000) AS n) TO 'chunk_8.csv' WITH CSV


