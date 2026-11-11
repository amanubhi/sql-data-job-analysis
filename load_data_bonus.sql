-- Loads the Nov 2026 CSV drop (csv_files/csv_files_Nov_2026/) into sql_course_bonus.
-- Does NOT hardcode a machine-specific path: pass the data directory in via a
-- psql variable so this script is portable across machines/checkouts.
--
-- Note: \cd / \copy use psql's own (non-SQL) argument quoting, so the
-- variable must be substituted unquoted (:data_dir, not :'data_dir') --
-- the quoted form SQL-escapes embedded apostrophes (e.g. "Ubhi's Files")
-- in a way backslash commands don't understand.
--
-- Usage (from the repo root):
--   psql -d sql_course_bonus -v data_dir="$(pwd)/csv_files/csv_files_Nov_2026" -f load_data_bonus.sql
--
-- Order matters: dimension tables first, then the fact table, then the
-- job<->skill bridge table, so foreign keys always resolve.

\cd :data_dir
\copy company_dim FROM company_dim.csv WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8')
\copy skills_dim FROM skills_dim.csv WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8')
\copy job_postings_fact FROM job_postings_fact.csv WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8')
\copy skills_job_dim FROM skills_job_dim.csv WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8')
