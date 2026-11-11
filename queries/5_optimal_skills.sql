/*
Question: What are the most optimal skills to learn (high demand AND high paying)?
- Identify skills in high demand and associated with high average salaries for
  Data Analyst roles.
- Concentrate on remote positions with specified salaries.
- Why? Targets skills that offer job security (high demand) and financial
  benefits (high salaries), offering strategic insights for career development
  in data analysis.
*/

SELECT
    skills_dim.skill_id,
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
GROUP BY skills_dim.skill_id, skills
HAVING COUNT(skills_job_dim.job_id) > 10
ORDER BY avg_salary DESC, demand_count DESC
LIMIT 10;

/*
Results snapshot:
- High-demand programming languages: Python and R stand out for their
  substantial average salaries, meaning proficiency in these languages is
  highly valued but also highly common, indicating a strong but competitive
  market.
- Cloud tools & technologies: skills in specialized technologies such as
  Snowflake, Azure, AWS, and BigQuery show significant salaries, reflecting
  the growing importance of cloud platforms and big data tools in analytics.
- BI & visualization tools: Tableau and Looker, show a presence in job
  postings with competitive salaries, underscoring the importance of data
  visualization and business intelligence in deriving actionable insights
  from data.
*/
