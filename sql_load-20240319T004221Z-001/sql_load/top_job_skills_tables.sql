
/* Identify the top five skills most mentioned in job postings for Data Analyst. This will help job seekers
    - Know what skills to focus on in their career journey
    - Recommend the most important skill to know, hinting at a larning path to follow
*/

WITH remote_job_skills AS (
SELECT
    skill_id,
    COUNT(*) AS number_of_skills
FROM
    skills_job_dim AS stj
INNER JOIN job_postings_fact AS jpf
ON stj.job_id = jpf.job_id
WHERE
    jpf.job_work_from_home = True
    AND job_title_short LIKE '%Data Analyst%'
GROUP BY
    skill_id
)

SELECT
    rjs.skill_id,
    skills As skill_name,
    number_of_skills
FROM
    remote_job_skills AS rjs
INNER JOIN skills_dim AS sd
ON rjs.skill_id = sd.skill_id
ORDER BY
    number_of_skills DESC
LIMIT 5;
