/*
Question: What are the top-paying Data Analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely.
- Focus on job postings with specified salaries (remove nulls).
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into
  employment options and location flexibility.
*/

SELECT
    job_id,
    job_title,
    name AS company_name,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere'
    AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;

/*
Results snapshot:
- Wide salary range: top 10 paying Data Analyst roles span from $184,000 to $650,000,
  showing significant salary potential in the field.
- Diverse employers: companies like Meta, AT&T, and Pinterest appear among the top
  payers, showing high salaries are not limited to one industry.
- Job title variety: titles range from "Data Analyst" to "Director of Analytics",
  reflecting a wide variety of roles and specializations within data analytics.
*/
