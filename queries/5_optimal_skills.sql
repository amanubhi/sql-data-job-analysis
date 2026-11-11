/*
Question: Among salary-disclosing Data Analyst postings, which skills show up
most often, and what's the average salary for jobs requiring each one?

IMPORTANT — this is a demand ranking, not a combined demand+salary score:
skills are ordered by demand_count first; avg_salary only breaks ties between
skills with the same demand_count. A skill near the top of this list is common
among the (small) subset of postings that disclose a salary -- it is not
necessarily the highest-paying skill. See 4_top_paying_skills.sql for skills
ranked by salary instead.

- Filters to Data Analyst postings with a disclosed annual salary.
- The remote-only filter is intentionally left commented out: this query
  looks across all work locations, not just "Anywhere" postings. Uncomment
  it to restrict to remote roles and compare.
- HAVING COUNT(...) > 10 drops skills with too few postings to be meaningful.
*/

SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    -- AND job_work_from_home = TRUE
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    demand_count DESC,
    avg_salary DESC
LIMIT 25;
