/*
Question: What are the most demanded skills for data analysts roles?
    - Identify the top 5 in-demand skills for data analsts
    - Focus on all job postings
    - Why? Get the top five skills in-demand in the job market,
    providing recommendations for skills to learn for job seekers in the market 
*/

SELECT
    skills,
    COUNT(sjd.job_id) AS number_of_skills
FROM 
    job_postings_fact AS jpf
    INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
    INNER JOIN skills_dim AS sd 
    ON sjd.skill_id = sd.skill_id
WHERE
    job_title_short LIKE '%Data Analyst%'
    AND job_location LIKE '%MI'
GROUP BY
    skills
ORDER BY
    number_of_skills DESC
LIMIT 5
