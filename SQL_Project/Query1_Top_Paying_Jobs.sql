/*
   Question: What are the top paying Data Analyst jobs?
   - Identify top 10 highest-paying Data Analyst roles that are available remotely.
   - Focuses on job postings with specified salaries (remove nulls).
   - Then add which company offer this jobs
   - Why? Highlighting top paying jobs for Data Analyst roles in order to give insight employees about jobs.
*/


SELECT
    job_id,
    job_title,
    company_dim.name AS company,
    job_schedule_type,
    job_location,
    salary_year_avg,
    job_posted_date
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
LIMIT 10;



