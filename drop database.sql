
psql -h localhost postgres postgres

UPDATE pg_database SET datallowconn = 'false' WHERE datname = 'mydb';

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname = 'mydb';

DROP DATABASE mydb;
