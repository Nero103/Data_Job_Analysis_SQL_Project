
/* 
What are the job postings in the first quarter that with salary greater than $70,000 
- Combine job posting tables from 2023 to make first quarte
- Get job postings with salary grater than $70,000
Goal: find out which data jobs were most prevalent with over $70,000  
*/

SELECT 
    job_title_short,
    job_location,
    job_via,
    job_posted_date::DATE,
    salary_year_avg
FROM (
    SELECT *
    FROM january_jobs
    UNION ALL
    SELECT *
    FROM february_jobs
    UNION ALL
    SELECT *
    FROM march_jobs
) AS quarter1_job_postings
WHERE
    salary_year_avg > 70000 AND
    job_title_short LIKE '%Data Analyst%'
ORDER BY
    salary_year_avg DESC;
