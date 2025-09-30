select * from workers;
select * from departments;
select * from positions; 

-- Бэкап всей базы workers_db
pg_dump postgres_db > postgres_db_backup.sql

-- Восстановление из бэкапа
psql postgres_db < postgres_db_backup.sql

-- Экспорт таблицы workers в CSV-файл
\copy workers TO '/tmp/workers.csv' DELIMITER ',' CSV HEADER;

-- Импорт в таблицу workers из CSV
\copy workers FROM '/tmp/workers.csv' DELIMITER ',' CSV HEADER;

-- Только таблица workers
pg_dump -t workers postgres_db > workers_table_backup.sql

-- Восстановление
psql postgres_db < workers_table_backup.sql



