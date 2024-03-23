/*
Question: what are the most optimal skills (high-paying in-demand skills) to learn for a data analyst role?
    - Identify skills that are in-demand and provide a high-paying salary
    - Concentrate on remote positions with specific salaries.
    - Why? target skills htat provide market relvancy and a sustainable income, offering a strategic career path for 
        job seekers in data analysis.
*/

WITH skills_in_demand AS (
    SELECT
        sd.skill_id,
        sd.skills,
        COUNT(sjd.job_id) AS number_of_skills
    FROM 
        job_postings_fact AS jpf
        INNER JOIN skills_job_dim AS sjd
        ON jpf.job_id = sjd.job_id
        INNER JOIN skills_dim AS sd 
        ON sjd.skill_id = sd.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = TRUE
    GROUP BY
        sd.skill_id,
        sd.skills
),

average_salary AS (
    SELECT
        sjd.skill_id,
        ROUND(AVG(salary_year_avg), 2) AS avg_salary
    FROM 
        job_postings_fact AS jpf
        INNER JOIN skills_job_dim AS sjd
        ON jpf.job_id = sjd.job_id
        INNER JOIN skills_dim AS sd 
        ON sjd.skill_id = sd.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = TRUE
    GROUP BY
        sjd.skill_id
)

SELECT
    skills_in_demand.skill_id,
    skills_in_demand.skills,
    number_of_skills,
    avg_salary
FROM
    skills_in_demand
    INNER JOIN average_salary
    ON skills_in_demand.skill_id = average_salary.skill_id
WHERE number_of_skills > 10
ORDER BY
    avg_salary DESC, number_of_skills DESC 
LIMIT 30

--Rewriting query to be more concise

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
    job_title_short = 'Data Analyst'
    AND job_work_from_home = TRUE
    AND salary_year_avg IS NOT NULL
GROUP BY
    sd.skill_id,
    sd.skills
HAVING
    COUNT(sjd.job_id) > 10
ORDER BY
    avg_salary DESC, number_of_skills DESC
LIMIT 30
