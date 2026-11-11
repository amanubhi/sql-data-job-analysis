/*
Question: Which skills are associated with the highest average salaries for Data Analysts?
- Look at the average salary associated with each skill for Data Analyst positions.
- Filter to skills attached to at least 10 job postings, to avoid outliers skewing results.
- Why? It reveals how different skills impact salary levels for Data Analysts and
  helps identify the most financially rewarding skills to acquire or improve.
*/

SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
GROUP BY skills
HAVING COUNT(skills_job_dim.job_id) > 10
ORDER BY avg_salary DESC
LIMIT 10;

/*
Results snapshot:
- Big data & ML tools dominate: Kafka ($129,999), PyTorch ($125,226), and
  TensorFlow ($120,647) top the list, showing analysts who can bridge into
  data engineering/ML command the highest premiums.
- DevOps & orchestration skills pay well too: Airflow, Scala, and Linux all
  land in the top 10, suggesting value in pipeline and infrastructure fluency.
- Niche/legacy languages like Perl still command high averages, likely due
  to scarcity of skilled talent rather than high overall demand.
*/
