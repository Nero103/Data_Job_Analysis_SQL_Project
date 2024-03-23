SELECT
    sd.skill_id,
    sd.skills,
    COUNT(sjd.job_id) AS number_of_skills,
    ROUND(AVG(salary_year_avg), 2) AS avg_salary
FROM
    job_postings_fact AS jpf
        INNER JOIN skills_job_dim AS sjd
        ON jpf.job_id = sjd.job_id
        INNER JOIN skills_dim AS sd 
        ON sjd.skill_id = sd.skill_id
WHERE
    job_title_short LIKE '%Data%'
    AND job_location LIKE '%MI'
    AND salary_year_avg IS NOT NULL
GROUP BY
    sd.skill_id,
    sd.skills
HAVING
    COUNT(sjd.job_id) > 10
ORDER BY
    avg_salary DESC, number_of_skills DESC
LIMIT 10
