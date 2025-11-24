/*
    Question: Find top skills for jobs specifically data analyst roles and remote jobs
    - Try to find top skills that required over 1000 Remote Data Analyst roles 
    - Why? job seekers want to know which skills they need more demanded.
*/

SELECT  
    skills AS skill_name,
    COUNT(job_postings_fact.job_id) AS job_count
FROM
    job_postings_fact
INNER JOIN
    skills_job_dim
ON
    job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim
ON
    skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND
    job_work_from_home = TRUE
GROUP BY
    skill_name
HAVING
    COUNT(job_postings_fact.job_id) > 1000
ORDER BY
    job_count DESC;
