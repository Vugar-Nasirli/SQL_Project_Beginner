/*
    Question: What skills are required in the top paying job for Data Analyst roles
    - Using first query try to find top 10 high paying jobs and find skills they require
    - Why? Job seekers want to see which skills they need to find high payed jobs
*/

WITH high_payed_jobs AS 
(
SELECT
    job_id,
    job_title,
    company_dim.name AS company,
    salary_year_avg
FROM 
    job_postings_fact
LEFT JOIN
    company_dim
ON
    job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst'
    AND
    job_work_from_home = TRUE
    AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10
)

SELECT
    high_payed_jobs.job_id,
    job_title,
    skills_dim.skills,
    company,
    salary_year_avg
FROM
    high_payed_jobs
INNER JOIN
    skills_job_dim
ON
    skills_job_dim.job_id = high_payed_jobs.job_id
INNER JOIN
    skills_dim
ON
    skills_job_dim.skill_id = skills_dim.skill_id;

