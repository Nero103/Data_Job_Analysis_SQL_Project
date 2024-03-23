/*
Question: what are the top skills based on the salary?
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
    job_title_short = 'Data Analyst'
     AND salary_year_avg IS NOT NULL
     AND job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 30

/*
High demand and high salary skills are prominently featured in Cloud Computing and Big Data, and Data Science and Machine Learning categories, showcasing the industry's emphasis on big data processing, analytics, and AI technologies.
DevOps and Collaboration Tools represent crucial roles in facilitating software development and operational efficiency, with tools like Docker and Jenkins being key for modern CI/CD pipelines.
Programming Languages and Frameworks highlight the necessity of versatile programming skills across different applications, from system programming with Linux to mobile app development with Swift.
Databases and Data Management skills underline the importance of managing, processing, and analyzing large datasets, indicating a broad need across industries for professionals who can handle complex data environments.
*/

[
  {
    "skills": "pyspark",
    "avg_salary": "208172.25"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "189154.50"
  },
  {
    "skills": "watson",
    "avg_salary": "160515.00"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515.00"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155485.50"
  },
  {
    "skills": "gitlab",
    "avg_salary": "154500.00"
  },
  {
    "skills": "swift",
    "avg_salary": "153750.00"
  },
  {
    "skills": "jupyter",
    "avg_salary": "152776.50"
  },
  {
    "skills": "pandas",
    "avg_salary": "151821.33"
  },
  {
    "skills": "golang",
    "avg_salary": "145000.00"
  },
  {
    "skills": "elasticsearch",
    "avg_salary": "145000.00"
  },
  {
    "skills": "numpy",
    "avg_salary": "143512.50"
  },
  {
    "skills": "databricks",
    "avg_salary": "141906.60"
  },
  {
    "skills": "linux",
    "avg_salary": "136507.50"
  },
  {
    "skills": "kubernetes",
    "avg_salary": "132500.00"
  },
  {
    "skills": "atlassian",
    "avg_salary": "131161.80"
  },
  {
    "skills": "twilio",
    "avg_salary": "127000.00"
  },
  {
    "skills": "airflow",
    "avg_salary": "126103.00"
  },
  {
    "skills": "scikit-learn",
    "avg_salary": "125781.25"
  },
  {
    "skills": "jenkins",
    "avg_salary": "125436.33"
  },
  {
    "skills": "notion",
    "avg_salary": "125000.00"
  },
  {
    "skills": "scala",
    "avg_salary": "124903.00"
  },
  {
    "skills": "postgresql",
    "avg_salary": "123878.75"
  },
  {
    "skills": "gcp",
    "avg_salary": "122500.00"
  },
  {
    "skills": "microstrategy",
    "avg_salary": "121619.25"
  },
  {
    "skills": "crystal",
    "avg_salary": "120100.00"
  },
  {
    "skills": "go",
    "avg_salary": "115319.89"
  },
  {
    "skills": "confluence",
    "avg_salary": "114209.91"
  },
  {
    "skills": "db2",
    "avg_salary": "114072.13"
  },
  {
    "skills": "hadoop",
    "avg_salary": "113192.57"
  }
]