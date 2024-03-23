/*
Question: what are the top skills based on the salary in Michigan?
    - Examine the average salary against each skill for a data analyst role
    - Focus on roles with specific salaries in all locations or remote
    - Why? It impacts how different skills affect salary levels for data analysts
        and it helps reveal the most financially beneficial skill
*/

SELECT
    skills,
    ROUND(AVG(salary_year_avg), 2) AS avg_salary
FROM 
    job_postings_fact AS jpf
    INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
    INNER JOIN skills_dim AS sd 
    ON sjd.skill_id = sd.skill_id
WHERE
    job_title_short LIKE '%Data%'
     AND salary_year_avg IS NOT NULL
     AND job_location LIKE '%MI'
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 30

/*
Splunk skills lead with an average salary of $169,000.
Skills in Go, C, VBA, and PHP also command high salaries, all above $140,000.
Technologies like AWS, GitLab, and Kubernetes offer competitive salaries ranging from $127,333 to $129,496.
The lowest salaries in the dataset are for skills in Linux, Snowflake, Airflow, and Matlab, but still notably high, around $115,000.
This data suggests a high demand for skills in Splunk, Go, and C, reflecting their value in the data job market in Michigan.
*/

[
  {
    "skills": "splunk",
    "avg_salary": "169000.00"
  },
  {
    "skills": "go",
    "avg_salary": "147581.56"
  },
  {
    "skills": "c",
    "avg_salary": "144234.00"
  },
  {
    "skills": "vba",
    "avg_salary": "140000.00"
  },
  {
    "skills": "php",
    "avg_salary": "140000.00"
  },
  {
    "skills": "aws",
    "avg_salary": "129496.48"
  },
  {
    "skills": "gitlab",
    "avg_salary": "127497.20"
  },
  {
    "skills": "kubernetes",
    "avg_salary": "127333.33"
  },
  {
    "skills": "cassandra",
    "avg_salary": "126642.00"
  },
  {
    "skills": "spring",
    "avg_salary": "126250.00"
  },
  {
    "skills": "jenkins",
    "avg_salary": "123000.00"
  },
  {
    "skills": "terraform",
    "avg_salary": "122500.00"
  },
  {
    "skills": "neo4j",
    "avg_salary": "122500.00"
  },
  {
    "skills": "aurora",
    "avg_salary": "122500.00"
  },
  {
    "skills": "jira",
    "avg_salary": "121250.00"
  },
  {
    "skills": "dynamodb",
    "avg_salary": "121250.00"
  },
  {
    "skills": "c#",
    "avg_salary": "120717.67"
  },
  {
    "skills": "git",
    "avg_salary": "120582.40"
  },
  {
    "skills": "postgresql",
    "avg_salary": "120000.00"
  },
  {
    "skills": "html",
    "avg_salary": "120000.00"
  },
  {
    "skills": "css",
    "avg_salary": "120000.00"
  },
  {
    "skills": "scala",
    "avg_salary": "118775.14"
  },
  {
    "skills": "alteryx",
    "avg_salary": "118551.94"
  },
  {
    "skills": "kafka",
    "avg_salary": "118325.11"
  },
  {
    "skills": "shell",
    "avg_salary": "117737.67"
  },
  {
    "skills": "github",
    "avg_salary": "117587.85"
  },
  {
    "skills": "linux",
    "avg_salary": "115942.67"
  },
  {
    "skills": "snowflake",
    "avg_salary": "115808.67"
  },
  {
    "skills": "airflow",
    "avg_salary": "115781.25"
  },
  {
    "skills": "matlab",
    "avg_salary": "115000.00"
  }
]