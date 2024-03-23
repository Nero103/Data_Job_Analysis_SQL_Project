/* Question: What skills are needed for the top paying data analyst jobs in Michigan?
    - Identify the 10 highest paying data analyst roles that are remote
    - Focus on records with specified salary values (remove nulls)
    - Why? Gives a look at the skills job seekers would need for the top paying jobs

*/

WITH top_paying_jobs_mi AS (
    SELECT
        job_id,
        cd.name AS company_name,
        job_title,
        job_location,
        salary_year_avg
    FROM
        job_postings_fact AS jpf
        LEFT JOIN company_dim AS cd
        ON jpf.company_id = cd.company_id
    WHERE
        (job_title_short LIKE '%Data%' OR job_title_short LIKE '%Intelligence%')
        AND job_location LIKE '%MI'
        AND salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 20
)

SELECT 
    tpjm.*,
    skills
FROM 
    top_paying_jobs_mi AS tpjm
    INNER JOIN skills_job_dim AS sjd
    ON tpjm.job_id = sjd.job_id
    INNER JOIN skills_dim AS sd 
    ON sjd.skill_id = sd.skill_id
ORDER BY
    tpjm.salary_year_avg DESC;

/*
Top 10 Skills Required for Highest-Paying Jobs in Michigan 📊
Python appears to be the most in-demand skill, with 12 occurrences across the dataset.
SQL follows closely behind with 8 occurrences.
R, a powerful tool for statistical computing and graphics, is needed in 6 job listings.
Java, AWS (Amazon Web Services), both have 5 mentions.
Skills like Go, Spark, SAS, each show up 4 times.
Scala and Kafka round out the list with 3 mentions each.
Insights 📝
Python and SQL are highly sought-after skills, emphasizing their importance in data-related roles.
There's a good mix of programming languages, data processing frameworks (like Spark), and cloud services (AWS), indicating a diverse technological landscape.
The presence of R, SAS, and Scala suggests a demand for professionals skilled in statistical analysis, big data processing, and functional programming.
Understanding these top skills can guide those looking to enter or advance in Michigan's high-paying job market, especially in roles related to data analysis, software development, and cloud computing. ​​
*/

[
  {
    "job_id": 30744,
    "company_name": "Capital One",
    "job_title": "Director, Data Engineering - Card Data & Analytics",
    "job_location": "Kalamazoo, MI",
    "salary_year_avg": "308000.0",
    "skills": "go"
  },
  {
    "job_id": 30744,
    "company_name": "Capital One",
    "job_title": "Director, Data Engineering - Card Data & Analytics",
    "job_location": "Kalamazoo, MI",
    "salary_year_avg": "308000.0",
    "skills": "aws"
  },
  {
    "job_id": 1176495,
    "company_name": "Capital One",
    "job_title": "Director, Data Engineering - Card Data & Analytics",
    "job_location": "Kalamazoo, MI",
    "salary_year_avg": "288500.0",
    "skills": "go"
  },
  {
    "job_id": 1176495,
    "company_name": "Capital One",
    "job_title": "Director, Data Engineering - Card Data & Analytics",
    "job_location": "Kalamazoo, MI",
    "salary_year_avg": "288500.0",
    "skills": "aws"
  },
  {
    "job_id": 317099,
    "company_name": "Conexess Group, LLC",
    "job_title": "Director, Digital Data Science in Analytics & Insights - Direct...",
    "job_location": "Ann Arbor, MI",
    "salary_year_avg": "180000.0",
    "skills": "sql"
  },
  {
    "job_id": 317099,
    "company_name": "Conexess Group, LLC",
    "job_title": "Director, Digital Data Science in Analytics & Insights - Direct...",
    "job_location": "Ann Arbor, MI",
    "salary_year_avg": "180000.0",
    "skills": "python"
  },
  {
    "job_id": 317099,
    "company_name": "Conexess Group, LLC",
    "job_title": "Director, Digital Data Science in Analytics & Insights - Direct...",
    "job_location": "Ann Arbor, MI",
    "salary_year_avg": "180000.0",
    "skills": "r"
  },
  {
    "job_id": 317099,
    "company_name": "Conexess Group, LLC",
    "job_title": "Director, Digital Data Science in Analytics & Insights - Direct...",
    "job_location": "Ann Arbor, MI",
    "salary_year_avg": "180000.0",
    "skills": "tableau"
  },
  {
    "job_id": 317099,
    "company_name": "Conexess Group, LLC",
    "job_title": "Director, Digital Data Science in Analytics & Insights - Direct...",
    "job_location": "Ann Arbor, MI",
    "salary_year_avg": "180000.0",
    "skills": "alteryx"
  },
  {
    "job_id": 320886,
    "company_name": "Capital One",
    "job_title": "Senior Data Engineer",
    "job_location": "Kalamazoo, MI",
    "salary_year_avg": "173500.0",
    "skills": "python"
  },
  {
    "job_id": 320886,
    "company_name": "Capital One",
    "job_title": "Senior Data Engineer",
    "job_location": "Kalamazoo, MI",
    "salary_year_avg": "173500.0",
    "skills": "nosql"
  },
  {
    "job_id": 320886,
    "company_name": "Capital One",
    "job_title": "Senior Data Engineer",
    "job_location": "Kalamazoo, MI",
    "salary_year_avg": "173500.0",
    "skills": "scala"
  },
  {
    "job_id": 320886,
    "company_name": "Capital One",
    "job_title": "Senior Data Engineer",
    "job_location": "Kalamazoo, MI",
    "salary_year_avg": "173500.0",
    "skills": "java"
  },
  {
    "job_id": 320886,
    "company_name": "Capital One",
    "job_title": "Senior Data Engineer",
    "job_location": "Kalamazoo, MI",
    "salary_year_avg": "173500.0",
    "skills": "shell"
  },
  {
    "job_id": 320886,
    "company_name": "Capital One",
    "job_title": "Senior Data Engineer",
    "job_location": "Kalamazoo, MI",
    "salary_year_avg": "173500.0",
    "skills": "mongo"
  },
  {
    "job_id": 320886,
    "company_name": "Capital One",
    "job_title": "Senior Data Engineer",
    "job_location": "Kalamazoo, MI",
    "salary_year_avg": "173500.0",
    "skills": "cassandra"
  },
  {
    "job_id": 320886,
    "company_name": "Capital One",
    "job_title": "Senior Data Engineer",
    "job_location": "Kalamazoo, MI",
    "salary_year_avg": "173500.0",
    "skills": "azure"
  },
  {
    "job_id": 320886,
    "company_name": "Capital One",
    "job_title": "Senior Data Engineer",
    "job_location": "Kalamazoo, MI",
    "salary_year_avg": "173500.0",
    "skills": "aws"
  },
  {
    "job_id": 320886,
    "company_name": "Capital One",
    "job_title": "Senior Data Engineer",
    "job_location": "Kalamazoo, MI",
    "salary_year_avg": "173500.0",
    "skills": "redshift"
  },
  {
    "job_id": 320886,
    "company_name": "Capital One",
    "job_title": "Senior Data Engineer",
    "job_location": "Kalamazoo, MI",
    "salary_year_avg": "173500.0",
    "skills": "snowflake"
  },
  {
    "job_id": 320886,
    "company_name": "Capital One",
    "job_title": "Senior Data Engineer",
    "job_location": "Kalamazoo, MI",
    "salary_year_avg": "173500.0",
    "skills": "spark"
  },
  {
    "job_id": 320886,
    "company_name": "Capital One",
    "job_title": "Senior Data Engineer",
    "job_location": "Kalamazoo, MI",
    "salary_year_avg": "173500.0",
    "skills": "hadoop"
  },
  {
    "job_id": 320886,
    "company_name": "Capital One",
    "job_title": "Senior Data Engineer",
    "job_location": "Kalamazoo, MI",
    "salary_year_avg": "173500.0",
    "skills": "kafka"
  },
  {
    "job_id": 126970,
    "company_name": "Stefanini",
    "job_title": "Big Data Engineer",
    "job_location": "Dearborn, MI",
    "salary_year_avg": "169000.0",
    "skills": "sql"
  },
  {
    "job_id": 126970,
    "company_name": "Stefanini",
    "job_title": "Big Data Engineer",
    "job_location": "Dearborn, MI",
    "salary_year_avg": "169000.0",
    "skills": "python"
  },
  {
    "job_id": 126970,
    "company_name": "Stefanini",
    "job_title": "Big Data Engineer",
    "job_location": "Dearborn, MI",
    "salary_year_avg": "169000.0",
    "skills": "scala"
  },
  {
    "job_id": 126970,
    "company_name": "Stefanini",
    "job_title": "Big Data Engineer",
    "job_location": "Dearborn, MI",
    "salary_year_avg": "169000.0",
    "skills": "java"
  },
  {
    "job_id": 126970,
    "company_name": "Stefanini",
    "job_title": "Big Data Engineer",
    "job_location": "Dearborn, MI",
    "salary_year_avg": "169000.0",
    "skills": "shell"
  },
  {
    "job_id": 126970,
    "company_name": "Stefanini",
    "job_title": "Big Data Engineer",
    "job_location": "Dearborn, MI",
    "salary_year_avg": "169000.0",
    "skills": "aws"
  },
  {
    "job_id": 126970,
    "company_name": "Stefanini",
    "job_title": "Big Data Engineer",
    "job_location": "Dearborn, MI",
    "salary_year_avg": "169000.0",
    "skills": "spark"
  },
  {
    "job_id": 126970,
    "company_name": "Stefanini",
    "job_title": "Big Data Engineer",
    "job_location": "Dearborn, MI",
    "salary_year_avg": "169000.0",
    "skills": "airflow"
  },
  {
    "job_id": 126970,
    "company_name": "Stefanini",
    "job_title": "Big Data Engineer",
    "job_location": "Dearborn, MI",
    "salary_year_avg": "169000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 126970,
    "company_name": "Stefanini",
    "job_title": "Big Data Engineer",
    "job_location": "Dearborn, MI",
    "salary_year_avg": "169000.0",
    "skills": "linux"
  },
  {
    "job_id": 126970,
    "company_name": "Stefanini",
    "job_title": "Big Data Engineer",
    "job_location": "Dearborn, MI",
    "salary_year_avg": "169000.0",
    "skills": "splunk"
  },
  {
    "job_id": 126970,
    "company_name": "Stefanini",
    "job_title": "Big Data Engineer",
    "job_location": "Dearborn, MI",
    "salary_year_avg": "169000.0",
    "skills": "kubernetes"
  },
  {
    "job_id": 126970,
    "company_name": "Stefanini",
    "job_title": "Big Data Engineer",
    "job_location": "Dearborn, MI",
    "salary_year_avg": "169000.0",
    "skills": "docker"
  },
  {
    "job_id": 126970,
    "company_name": "Stefanini",
    "job_title": "Big Data Engineer",
    "job_location": "Dearborn, MI",
    "salary_year_avg": "169000.0",
    "skills": "github"
  },
  {
    "job_id": 401554,
    "company_name": "Stefanini, Inc",
    "job_title": "Data Engineer",
    "job_location": "Dearborn, MI",
    "salary_year_avg": "165000.0",
    "skills": "sql"
  },
  {
    "job_id": 401554,
    "company_name": "Stefanini, Inc",
    "job_title": "Data Engineer",
    "job_location": "Dearborn, MI",
    "salary_year_avg": "165000.0",
    "skills": "python"
  },
  {
    "job_id": 401554,
    "company_name": "Stefanini, Inc",
    "job_title": "Data Engineer",
    "job_location": "Dearborn, MI",
    "salary_year_avg": "165000.0",
    "skills": "bigquery"
  },
  {
    "job_id": 401554,
    "company_name": "Stefanini, Inc",
    "job_title": "Data Engineer",
    "job_location": "Dearborn, MI",
    "salary_year_avg": "165000.0",
    "skills": "gcp"
  },
  {
    "job_id": 401554,
    "company_name": "Stefanini, Inc",
    "job_title": "Data Engineer",
    "job_location": "Dearborn, MI",
    "salary_year_avg": "165000.0",
    "skills": "airflow"
  },
  {
    "job_id": 401554,
    "company_name": "Stefanini, Inc",
    "job_title": "Data Engineer",
    "job_location": "Dearborn, MI",
    "salary_year_avg": "165000.0",
    "skills": "kafka"
  },
  {
    "job_id": 401554,
    "company_name": "Stefanini, Inc",
    "job_title": "Data Engineer",
    "job_location": "Dearborn, MI",
    "salary_year_avg": "165000.0",
    "skills": "spring"
  },
  {
    "job_id": 401554,
    "company_name": "Stefanini, Inc",
    "job_title": "Data Engineer",
    "job_location": "Dearborn, MI",
    "salary_year_avg": "165000.0",
    "skills": "git"
  },
  {
    "job_id": 401554,
    "company_name": "Stefanini, Inc",
    "job_title": "Data Engineer",
    "job_location": "Dearborn, MI",
    "salary_year_avg": "165000.0",
    "skills": "jenkins"
  },
  {
    "job_id": 401554,
    "company_name": "Stefanini, Inc",
    "job_title": "Data Engineer",
    "job_location": "Dearborn, MI",
    "salary_year_avg": "165000.0",
    "skills": "terraform"
  },
  {
    "job_id": 401554,
    "company_name": "Stefanini, Inc",
    "job_title": "Data Engineer",
    "job_location": "Dearborn, MI",
    "salary_year_avg": "165000.0",
    "skills": "flow"
  },
  {
    "job_id": 558902,
    "company_name": "Travelers Insurance",
    "job_title": "Data Scientist",
    "job_location": "Lansing, MI",
    "salary_year_avg": "161500.0",
    "skills": "aws"
  },
  {
    "job_id": 1347337,
    "company_name": "Ally Financial",
    "job_title": "Principal Data Scientist",
    "job_location": "Detroit, MI",
    "salary_year_avg": "150000.0",
    "skills": "sql"
  },
  {
    "job_id": 1347337,
    "company_name": "Ally Financial",
    "job_title": "Principal Data Scientist",
    "job_location": "Detroit, MI",
    "salary_year_avg": "150000.0",
    "skills": "python"
  },
  {
    "job_id": 1347337,
    "company_name": "Ally Financial",
    "job_title": "Principal Data Scientist",
    "job_location": "Detroit, MI",
    "salary_year_avg": "150000.0",
    "skills": "r"
  },
  {
    "job_id": 118051,
    "company_name": "Illumina Inc",
    "job_title": "Sr. Staff, Staff, or Senior Clinical Data Scientist - Statistical...",
    "job_location": "Foster City, MI",
    "salary_year_avg": "150000.0",
    "skills": "sql"
  },
  {
    "job_id": 118051,
    "company_name": "Illumina Inc",
    "job_title": "Sr. Staff, Staff, or Senior Clinical Data Scientist - Statistical...",
    "job_location": "Foster City, MI",
    "salary_year_avg": "150000.0",
    "skills": "python"
  },
  {
    "job_id": 118051,
    "company_name": "Illumina Inc",
    "job_title": "Sr. Staff, Staff, or Senior Clinical Data Scientist - Statistical...",
    "job_location": "Foster City, MI",
    "salary_year_avg": "150000.0",
    "skills": "r"
  },
  {
    "job_id": 118051,
    "company_name": "Illumina Inc",
    "job_title": "Sr. Staff, Staff, or Senior Clinical Data Scientist - Statistical...",
    "job_location": "Foster City, MI",
    "salary_year_avg": "150000.0",
    "skills": "sas"
  },
  {
    "job_id": 118051,
    "company_name": "Illumina Inc",
    "job_title": "Sr. Staff, Staff, or Senior Clinical Data Scientist - Statistical...",
    "job_location": "Foster City, MI",
    "salary_year_avg": "150000.0",
    "skills": "tableau"
  },
  {
    "job_id": 118051,
    "company_name": "Illumina Inc",
    "job_title": "Sr. Staff, Staff, or Senior Clinical Data Scientist - Statistical...",
    "job_location": "Foster City, MI",
    "salary_year_avg": "150000.0",
    "skills": "sas"
  },
  {
    "job_id": 332177,
    "company_name": "Target",
    "job_title": "Lead Data Scientist - Digital Item (Applied Ml, Deep Learning...",
    "job_location": "Brooklyn, MI",
    "salary_year_avg": "150000.0",
    "skills": "sql"
  },
  {
    "job_id": 332177,
    "company_name": "Target",
    "job_title": "Lead Data Scientist - Digital Item (Applied Ml, Deep Learning...",
    "job_location": "Brooklyn, MI",
    "salary_year_avg": "150000.0",
    "skills": "python"
  },
  {
    "job_id": 332177,
    "company_name": "Target",
    "job_title": "Lead Data Scientist - Digital Item (Applied Ml, Deep Learning...",
    "job_location": "Brooklyn, MI",
    "salary_year_avg": "150000.0",
    "skills": "scala"
  },
  {
    "job_id": 332177,
    "company_name": "Target",
    "job_title": "Lead Data Scientist - Digital Item (Applied Ml, Deep Learning...",
    "job_location": "Brooklyn, MI",
    "salary_year_avg": "150000.0",
    "skills": "java"
  },
  {
    "job_id": 332177,
    "company_name": "Target",
    "job_title": "Lead Data Scientist - Digital Item (Applied Ml, Deep Learning...",
    "job_location": "Brooklyn, MI",
    "salary_year_avg": "150000.0",
    "skills": "r"
  },
  {
    "job_id": 332177,
    "company_name": "Target",
    "job_title": "Lead Data Scientist - Digital Item (Applied Ml, Deep Learning...",
    "job_location": "Brooklyn, MI",
    "salary_year_avg": "150000.0",
    "skills": "spark"
  },
  {
    "job_id": 1073308,
    "company_name": "Coupa Software, Inc.",
    "job_title": "Operations Research Scientist",
    "job_location": "Ann Arbor, MI",
    "salary_year_avg": "149653.0",
    "skills": "python"
  },
  {
    "job_id": 1073308,
    "company_name": "Coupa Software, Inc.",
    "job_title": "Operations Research Scientist",
    "job_location": "Ann Arbor, MI",
    "salary_year_avg": "149653.0",
    "skills": "c#"
  },
  {
    "job_id": 788424,
    "company_name": "May Mobility",
    "job_title": "Data Engineer II",
    "job_location": "Ann Arbor, MI",
    "salary_year_avg": "147500.0",
    "skills": "python"
  },
  {
    "job_id": 788424,
    "company_name": "May Mobility",
    "job_title": "Data Engineer II",
    "job_location": "Ann Arbor, MI",
    "salary_year_avg": "147500.0",
    "skills": "java"
  },
  {
    "job_id": 788424,
    "company_name": "May Mobility",
    "job_title": "Data Engineer II",
    "job_location": "Ann Arbor, MI",
    "salary_year_avg": "147500.0",
    "skills": "go"
  },
  {
    "job_id": 788424,
    "company_name": "May Mobility",
    "job_title": "Data Engineer II",
    "job_location": "Ann Arbor, MI",
    "salary_year_avg": "147500.0",
    "skills": "c++"
  },
  {
    "job_id": 788424,
    "company_name": "May Mobility",
    "job_title": "Data Engineer II",
    "job_location": "Ann Arbor, MI",
    "salary_year_avg": "147500.0",
    "skills": "cassandra"
  },
  {
    "job_id": 788424,
    "company_name": "May Mobility",
    "job_title": "Data Engineer II",
    "job_location": "Ann Arbor, MI",
    "salary_year_avg": "147500.0",
    "skills": "spark"
  },
  {
    "job_id": 788424,
    "company_name": "May Mobility",
    "job_title": "Data Engineer II",
    "job_location": "Ann Arbor, MI",
    "salary_year_avg": "147500.0",
    "skills": "kafka"
  },
  {
    "job_id": 788424,
    "company_name": "May Mobility",
    "job_title": "Data Engineer II",
    "job_location": "Ann Arbor, MI",
    "salary_year_avg": "147500.0",
    "skills": "jenkins"
  },
  {
    "job_id": 788424,
    "company_name": "May Mobility",
    "job_title": "Data Engineer II",
    "job_location": "Ann Arbor, MI",
    "salary_year_avg": "147500.0",
    "skills": "terraform"
  },
  {
    "job_id": 788424,
    "company_name": "May Mobility",
    "job_title": "Data Engineer II",
    "job_location": "Ann Arbor, MI",
    "salary_year_avg": "147500.0",
    "skills": "kubernetes"
  },
  {
    "job_id": 788424,
    "company_name": "May Mobility",
    "job_title": "Data Engineer II",
    "job_location": "Ann Arbor, MI",
    "salary_year_avg": "147500.0",
    "skills": "docker"
  },
  {
    "job_id": 788424,
    "company_name": "May Mobility",
    "job_title": "Data Engineer II",
    "job_location": "Ann Arbor, MI",
    "salary_year_avg": "147500.0",
    "skills": "gitlab"
  },
  {
    "job_id": 274876,
    "company_name": "US Defense Logistics Agency",
    "job_title": "Data Scientist (Artificial Intelligence/Machine Learning)",
    "job_location": "Battle Creek, MI",
    "salary_year_avg": "144234.0",
    "skills": "python"
  },
  {
    "job_id": 274876,
    "company_name": "US Defense Logistics Agency",
    "job_title": "Data Scientist (Artificial Intelligence/Machine Learning)",
    "job_location": "Battle Creek, MI",
    "salary_year_avg": "144234.0",
    "skills": "r"
  },
  {
    "job_id": 274876,
    "company_name": "US Defense Logistics Agency",
    "job_title": "Data Scientist (Artificial Intelligence/Machine Learning)",
    "job_location": "Battle Creek, MI",
    "salary_year_avg": "144234.0",
    "skills": "sas"
  },
  {
    "job_id": 274876,
    "company_name": "US Defense Logistics Agency",
    "job_title": "Data Scientist (Artificial Intelligence/Machine Learning)",
    "job_location": "Battle Creek, MI",
    "salary_year_avg": "144234.0",
    "skills": "go"
  },
  {
    "job_id": 274876,
    "company_name": "US Defense Logistics Agency",
    "job_title": "Data Scientist (Artificial Intelligence/Machine Learning)",
    "job_location": "Battle Creek, MI",
    "salary_year_avg": "144234.0",
    "skills": "c"
  },
  {
    "job_id": 274876,
    "company_name": "US Defense Logistics Agency",
    "job_title": "Data Scientist (Artificial Intelligence/Machine Learning)",
    "job_location": "Battle Creek, MI",
    "salary_year_avg": "144234.0",
    "skills": "databricks"
  },
  {
    "job_id": 274876,
    "company_name": "US Defense Logistics Agency",
    "job_title": "Data Scientist (Artificial Intelligence/Machine Learning)",
    "job_location": "Battle Creek, MI",
    "salary_year_avg": "144234.0",
    "skills": "sas"
  },
  {
    "job_id": 6376,
    "company_name": "Duo Security",
    "job_title": "Product Data Scientist - Duo Security",
    "job_location": "Ann Arbor, MI",
    "salary_year_avg": "140500.0",
    "skills": "sql"
  },
  {
    "job_id": 6376,
    "company_name": "Duo Security",
    "job_title": "Product Data Scientist - Duo Security",
    "job_location": "Ann Arbor, MI",
    "salary_year_avg": "140500.0",
    "skills": "python"
  },
  {
    "job_id": 6376,
    "company_name": "Duo Security",
    "job_title": "Product Data Scientist - Duo Security",
    "job_location": "Ann Arbor, MI",
    "salary_year_avg": "140500.0",
    "skills": "r"
  },
  {
    "job_id": 6376,
    "company_name": "Duo Security",
    "job_title": "Product Data Scientist - Duo Security",
    "job_location": "Ann Arbor, MI",
    "salary_year_avg": "140500.0",
    "skills": "git"
  },
  {
    "job_id": 197937,
    "company_name": "The Talent Advantage Group",
    "job_title": "Senior Data Scientist",
    "job_location": "Detroit, MI",
    "salary_year_avg": "140000.0",
    "skills": "sql"
  },
  {
    "job_id": 197937,
    "company_name": "The Talent Advantage Group",
    "job_title": "Senior Data Scientist",
    "job_location": "Detroit, MI",
    "salary_year_avg": "140000.0",
    "skills": "python"
  },
  {
    "job_id": 197937,
    "company_name": "The Talent Advantage Group",
    "job_title": "Senior Data Scientist",
    "job_location": "Detroit, MI",
    "salary_year_avg": "140000.0",
    "skills": "java"
  },
  {
    "job_id": 197937,
    "company_name": "The Talent Advantage Group",
    "job_title": "Senior Data Scientist",
    "job_location": "Detroit, MI",
    "salary_year_avg": "140000.0",
    "skills": "r"
  },
  {
    "job_id": 197937,
    "company_name": "The Talent Advantage Group",
    "job_title": "Senior Data Scientist",
    "job_location": "Detroit, MI",
    "salary_year_avg": "140000.0",
    "skills": "sas"
  },
  {
    "job_id": 197937,
    "company_name": "The Talent Advantage Group",
    "job_title": "Senior Data Scientist",
    "job_location": "Detroit, MI",
    "salary_year_avg": "140000.0",
    "skills": "matlab"
  },
  {
    "job_id": 197937,
    "company_name": "The Talent Advantage Group",
    "job_title": "Senior Data Scientist",
    "job_location": "Detroit, MI",
    "salary_year_avg": "140000.0",
    "skills": "vba"
  },
  {
    "job_id": 197937,
    "company_name": "The Talent Advantage Group",
    "job_title": "Senior Data Scientist",
    "job_location": "Detroit, MI",
    "salary_year_avg": "140000.0",
    "skills": "php"
  },
  {
    "job_id": 197937,
    "company_name": "The Talent Advantage Group",
    "job_title": "Senior Data Scientist",
    "job_location": "Detroit, MI",
    "salary_year_avg": "140000.0",
    "skills": "sql server"
  },
  {
    "job_id": 197937,
    "company_name": "The Talent Advantage Group",
    "job_title": "Senior Data Scientist",
    "job_location": "Detroit, MI",
    "salary_year_avg": "140000.0",
    "skills": "azure"
  },
  {
    "job_id": 197937,
    "company_name": "The Talent Advantage Group",
    "job_title": "Senior Data Scientist",
    "job_location": "Detroit, MI",
    "salary_year_avg": "140000.0",
    "skills": "aws"
  },
  {
    "job_id": 197937,
    "company_name": "The Talent Advantage Group",
    "job_title": "Senior Data Scientist",
    "job_location": "Detroit, MI",
    "salary_year_avg": "140000.0",
    "skills": "oracle"
  },
  {
    "job_id": 197937,
    "company_name": "The Talent Advantage Group",
    "job_title": "Senior Data Scientist",
    "job_location": "Detroit, MI",
    "salary_year_avg": "140000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 197937,
    "company_name": "The Talent Advantage Group",
    "job_title": "Senior Data Scientist",
    "job_location": "Detroit, MI",
    "salary_year_avg": "140000.0",
    "skills": "excel"
  },
  {
    "job_id": 197937,
    "company_name": "The Talent Advantage Group",
    "job_title": "Senior Data Scientist",
    "job_location": "Detroit, MI",
    "salary_year_avg": "140000.0",
    "skills": "sas"
  },
  {
    "job_id": 197937,
    "company_name": "The Talent Advantage Group",
    "job_title": "Senior Data Scientist",
    "job_location": "Detroit, MI",
    "salary_year_avg": "140000.0",
    "skills": "sap"
  },
  {
    "job_id": 197937,
    "company_name": "The Talent Advantage Group",
    "job_title": "Senior Data Scientist",
    "job_location": "Detroit, MI",
    "salary_year_avg": "140000.0",
    "skills": "spss"
  },
  {
    "job_id": 197937,
    "company_name": "The Talent Advantage Group",
    "job_title": "Senior Data Scientist",
    "job_location": "Detroit, MI",
    "salary_year_avg": "140000.0",
    "skills": "alteryx"
  }
]