SELECT skills,
--count(skills_job_dim.job_id) AS skill_count,
--max( salary_hour_avg)as Highest_salary,
--min(salary_hour_avg)as Lowest_salary,
round( avg(job_postings_fact.salary_year_avg),2) as Average_salary
 FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id=skills_dim.skill_id
WHERE job_postings_fact.job_title_short='Data Analyst' 
 AND job_postings_fact.salary_year_avg is NOT NULL
GROUP BY skills 
ORDER BY Average_salary DESC
LIMIT 25