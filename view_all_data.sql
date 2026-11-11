/*
Quick sanity checks after loading the CSVs (see modify_tables.sql) --
confirms row counts and previews each table before running analysis queries.
*/

SELECT COUNT(*) AS company_rows FROM company_dim;
SELECT COUNT(*) AS skill_rows FROM skills_dim;
SELECT COUNT(*) AS job_posting_rows FROM job_postings_fact;
SELECT COUNT(*) AS skills_job_rows FROM skills_job_dim;

SELECT * FROM company_dim LIMIT 5;
SELECT * FROM skills_dim LIMIT 5;
SELECT * FROM job_postings_fact LIMIT 5;
SELECT * FROM skills_job_dim LIMIT 5;
