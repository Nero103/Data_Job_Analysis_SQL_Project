/* Question: What are the top paying data analyst jobs?
    - Identify the 10 highest paying data analyst roles that are remote
    - Focus on records with specified salary values (remove nulls)
    - Why? Emphasize the top paying opportunities for data analysts, offering insihts into each
*/

SELECT
    job_id,
    cd.name AS company_name,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM
    job_postings_fact AS jpf
    LEFT JOIN company_dim AS cd
    ON jpf.company_id = cd.company_id
WHERE
    job_title_short LIKE '%Data Analyst%'
    AND (job_location = 'Anywhere' OR job_location LIKE '%MI')
    AND salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;
