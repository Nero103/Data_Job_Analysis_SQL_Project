# Introduction
Focusing on data and data analyst roles, then let's take a deep look into the job market. This project explores jobs with top salaries, in-demand skills, and where high skill demand meets high salaries.

If you want to see the SQL queries, take a look here: [project_sql folder](/project_sql/)

# Background
Curious to see and understand in-demand skills in the data analyst job market, both nationally and in Michigan, to create an effective job search strategy, this project was created to identify demanded skills and top salaries, which will help job seekers build a strategy toward optimal jobs.

The origin of the data for this project comes from Luke Barousse's [SQL Course](https://lukebarousse.com/sql).

### Questions that I wanted to answer via SQL queries within the project:

1. What are the top-paying data analyst jobs?
2. What skills are required for these top-paying jobs on a national and state of Michigan level?
3. What skills are most in demand for data analysts?
4. What skills are connected to high-end salaries on a national level and in Michigan?
5. What are the most optimal skills to learn overall and in Michigan?

# Tools
With several key tools, I leaped into the data analyst job market, wielding the power of the following:

- **SQL**: As the backbone of this project, I used it for analysis, allowing me to query the database to unveil meaningful insights.
- **PostgreSQL**: This was the database management system
 used for its efficient organization and management of job posting data.
 - **Visual Studio Code**: my integrated development environment (IDE) used for database management and running SQL queries.
 - **Git and GitHub**: Used for its robust version control and for sharing my SQL scripts.

# The Method/Analysis
Geared toward investigating the data analyst job market in this project, here is how I approached each question by using queries:

### 1. High-end Salary for Data Analyst Jobs
To uncover the highest paying roles, I filtered for data analyst roles by yearly average salary and job location, focusing on remote jobs or Michigan jobs. This query shows high salary opportunities in the field.

```sql
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
```

Here are the detailed insights from the query result-set.

The companies are ranked from highest to lowest average salary.
**AT&T** appears at the top, suggesting it offers the most competitive salary for Data Analyst roles among the companies listed.

The chart provides a quick comparison of salary ranges among leading companies, useful for understanding market standards and identifying employers that value data analysis skills highly.

![Top Paying Companies](assets\Top_10_Companies_by_Average_Salary.png)
*Bar graph visualizing the average salaries for various Data Analyst positions from the top 10 companies. ChatGPT generated this graph from my SQL query results*

### 2a. Top Data Analyst Job Skills (remote)

To uncover skills needed for top-paying data analyst jobs, I identified the 10 highest salaries from remote jobs.

```sql
WITH top_paying_jobs AS (
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
        job_title_short LIKE '%Data Analyst%'
        AND job_location LIKE 'Anywhere'
        AND salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    tpj.*,
    skills
FROM 
    top_paying_jobs AS tpj
    INNER JOIN skills_job_dim AS sjd
    ON tpj.job_id = sjd.job_id
    INNER JOIN skills_dim AS sd 
    ON sjd.skill_id = sd.skill_id
ORDER BY
    tpj.salary_year_avg DESC;
```
Here are the detailed insights from the query result-set.

**SQL is the most in-demand skill**, showing up in 8 job listings. This emphasizes the importance of database management and querying skills in the data analysis field.

**Python follows closely**, featured in 7 job listings. Its versatility for data manipulation, analysis, and machine learning makes it a crucial skill.

**Tableau's prominence** in 6 listings underscores the value of data visualization skills for data analysts, enabling them to present data insights effectively.

**Skills like R, AWS, Pandas, Excel, and Snowflake** each appear in 3 job listings, highlighting a mix of statistical programming, cloud computing, data manipulation, spreadsheet proficiency, and cloud data warehousing knowledge as important competencies.

![Top Skills in demand](assets\Top_10_Demanded_Skills.png)
*This is a bar graph showing the top skills by highest salary for Data Analyst jobs. ChatGPT generated this graph from my SQL query results*

### 2b. Top Data Job Skills (Michigan)

To uncover skills needed for top-paying data jobs, I identified the 10 highest salaries from Michigan jobs and filtered for Data and Intelligence jobs in general due to low row count in result-set.

```sql
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
```

Here are the detailed insights from the query result-set.

**Python appears to be the most in-demand skill**, with 12 occurrences across the dataset.

**SQL follows closely behind** with 8 occurrences.

**R, a powerful tool for statistical computing and graphics, is needed** in 6 job listings.

**Java, AWS (Amazon Web Services)**, both have 5 mentions.

![Top skills in demand - Michigan](assets\Top_10_Demanded_Skills_Michigan.png)
*This is a bar graph visualizing the most in-demand skills by salary for data analyst jobs in Michigan. ChatGPT generated this graph from my SQL query results*

### 3a. Top Skills Most In-Demand Overall
To uncover the most in-demand skills needed for data analyst roles, regardless of salary, I needed to focus on all job postings filtered in Michigan to identify the 5 skills.

```sql
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
GROUP BY
    skills
ORDER BY
    number_of_skills DESC
LIMIT 5
```

Here are the detailed insights from the query result-set.

**SQL, Excel, and Python lead the list**. This suggests a broad need across industries for data manipulation, analysis, and programming capabilities. 📊🐍

**Tableau and Power BI indicate the significant value placed on data visualization** skills. These tools are essential for transforming data into actionable insights. 📈

**SQL as a Keystone Skill** shows its prominent position, with the highest number of mentions, highlights its status as a keystone skill for data professionals, reinforcing its critical role in data querying and management

|Skills	|Number of Skills|
|-----------|------------|
|SQL	    |110,380
|Excel	    |75,348
|Python	    |68,409
|Tableau	|56,569
|Power BI	|45,482      |
*Table of in-demand skills for Data Analyst jobs overall*

### 3b. Top Skills Most In-Demand in Michigan
To uncover the most in-demand skills needed for data analyst roles in Michigan, regardless of salary, I needed to focus on all job postings filtered in Michigan to identify the 5 skills.

```sql
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
```

Here are the detailed insights from the query result-set.

**SQL and Excel top the list**, indicating a strong demand for skills in data manipulation, analysis, and reporting. 📊

**The presence of SAP and Power BI** highlights the value of expertise in specific software tools used for business processes and data visualization, respectively. 🛠️

**Python's appearance** alongside traditional business tools emphasizes the growing importance of programming skills in data analysis and automation. 

|Skills	    |Number_of_skills|
|-----------|----------------|
|sql	    |74
|excel	    |58
|sap	    |45
|power bi	|40
|python	    |40              |
*Table of in-demand skills for Data Analyst jobs in Michigan*

### 4a. Top Paying Skills for Remote
To uncover the most in-demand skills needed for data analyst remote roles, I needed to filter for remote roles and calculate the average yearly salary on all job postings.

```sql
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
```

Here are the detailed insights from the query result-set.

**Cloud Computing and Big Data, and Data Science and Machine Learning categories** are prominently featured for high demand and high salary skills, showcasing the industry's emphasis on big data processing, analytics, and AI technologies.

**DevOps and Collaboration Tools** represent crucial roles in facilitating software development and operational efficiency, with tools like Docker and Jenkins being key for modern CI/CD pipelines.

**Programming Languages and Frameworks** highlight the necessity of versatile programming skills across different applications, from system programming with Linux to mobile app development with Swift.
Databases and Data Management skills underline the importance of managing, processing, and analyzing large datasets, indicating a broad need across industries for professionals who can handle complex data environments.

![Top In-Demand Skills by Salary](assets\Top_Skills_Demanded_By_Salary_Overall.png)
*This is a bar graph visualizing to most in-demand skills by highest salary. ChatGPT generated this graph from my SQL query results*

### 4b. Top Paying Skills in Michigan
To uncover the most in-demand skills needed for data analyst roles, I needed to filter for Michigan and Data roles in general due to the low row count in result-set and calculate the average yearly salary on all job postings.

```sql
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
```

Here are the detailed insights from the query result-set.

**Splunk** skills lead with an average salary of $169,000.

**Skills in Go, C, VBA, and PHP** also command high salaries, all above $140,000.

**Technologies like AWS, GitLab, and Kubernetes** offer competitive salaries ranging from $127,333 to $129,496.

**Linux, Snowflake, Airflow, and Matlab** are still notably high, though at the low end, around $115,000.

![Top In-Demand Skills by Salary MI](assets\Top_Skills_Demanded_By_Salary_MI.png)
*This is a bar graph visualizing to most in-demand skills by the highest salary in MI. ChatGPT generated this graph from my SQL query results*

### 5a. Top Most Optimal Skills for Remote
To uncover the most optimal skills for high-paying data analyst remote roles, I joined tables to query off of, filtered on Data Analyst and Remote roles, and filtered on demanded skills greater than 10. 

```sql
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
```

Here are the detailed insights from the query result-set.

**High Demand for Cloud and Big Data**: Skills related to cloud services (e.g., AWS, Azure) and big data technologies (e.g., Hadoop, BigQuery) are in the top 10, highlighting the high demand and lucrative opportunities in cloud computing and big data fields.

**Specialized Skills Pay Well**: Highly specialized skills like Go (a programming language) and Snowflake (cloud data warehousing) lead the list, indicating that niche technical skills can command top salaries.

**Versatility of Skills**: The list includes a mix of programming languages (Go, Java), cloud platforms (AWS, Azure), big data technologies (Hadoop, BigQuery), and tools for collaboration and development (Confluence, Jira). This suggests a broad range of skills valuable in the current remote work landscape.

**The Leading Skill**: Go, a programming language known for its efficiency and scalability, tops the list with an average salary of $115,319.89, showcasing the premium market for Go developers.


|Rank	|Skills	    |Avg. Salary
|-------|-----------|-----------|
|1	    |go	        |$115,319.89
|2	    |confluence	|$114,209.91
|3	    |hadoop	    |$113,192.57
|4	    |snowflake	|$112,947.97
|5	    |azure	    |$111,225.10
|6	    |bigquery	|$109,653.85
|7	    |aws	    |$108,317.30
|8	    |java	    |$106,906.44
|9	    |ssis	    |$106,683.33
|10	    |jira	    |$104,917.90|
*Table of optimal skills for Data Analyst remote jobs*

### 5b. Top Most Optimal Skills in Michigan
To uncover the most optimal skills for high-paying data analyst roles in Michigan, I joined tables to query off of, filtered on Data roles in general within Michigan due to low row count in result-set roles, and filtered on demanded skills greater than 10. 

```sql
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
```

Here are the detailed insights from the query result-set.

**Cloud and Data Analytics Focus**: AWS tops the list at $129,496.48, showing a premium for cloud expertise. Other skills include data analytics (R, Python, Spark) and database management (SQL).

**Programming and Data Science**: Strong representation of data science (R, Python) and traditional programming (Java), along with big data technologies (Hadoop, Spark).

**High Demand for AWS Skills**: AWS expertise stands out as the most lucrative, suggesting strong demand for cloud skills in Michigan.


|Rank	|Skills	    |Avg. Salary
|-------|-----------|-----------|
|1	    |aws	    |$129,496.48
|2	    |r	        |$114,442.71
|3	    |java	    |$112,273.67
|4	    |python	    |$109,764.89
|5	    |spark	    |$109,643.14
|6	    |sql	    |$105,842.37
|7	    |sql server	|$103,458.25
|8	    |hadoop	    |$102,631.79
|9	    |azure	    |$102,613.98
|10	    |sas	    |$101,562.02|
*Table of optimal skills for Data Analyst jobs in Michigan*

# Conclusion
### Insights

1. **High-end Salary for Data Analyst Jobs**: It appears that AT&T provides top paying salary, suggesting it offers a competitive salary for likely a high-ranked Data Analyst role of over $250,000 among the companies listed.
2. **Top Data Analyst Job Skills by Salary**
    - **Remote**: Among the tools a data analyst would use, SQL is most in-demand in job listings for data analysts, emphasizing its importance. Tools such as Python** and Tableau follow, underscoring the value of data visualization with Excel and Snowflake highlighting a mix of statistical programming, cloud computing, and data manipulation.
    - **Michigan**: In Michigan, Python leads the count for in-demand skills with SQL following closely behind. R, Java, and Amazon Web Services seem popular as well.
3. **Top Skills Most In-Demand**
    - **Remote**: It appears that SQL, Excel, and Python top the list, suggesting a need across industries for data manipulation, analysis, and programming capabilities. Meanwhile, Tableau and Power BI indicate they are the top data visualization skills desired. These tools are essential for transforming data into actionable insights. However, SQL is the keystone skill to have.
    - **Michigan**: Much like remote roles for data analysis, SQL and Excel are highly desired. With SAP and Power BI present, these two skills highlight the need for tools used in business processes and data visualization, Lastly, Python emphasizes the growing importance of programming skills and automation.
4.  **Top Paying Skills for Remote**
    - **Remote**: For the remote data analyst skills for high-end salaries, cloud computing and Big Data along with Data Science and Machine Learning categories are high salary skills, making up over $100,000. DevOps and collaboration tools are also relatively high-paying skills along with **Programming Languages and Frameworks from system programming to mobile app development. Databases and Data Management skills show the industry's need to handle complex data.
    - **Michigan**: In Michigan, having Splunk skills for Data roles suggests a high average salary of over $160,000 while Go, C, VBA, and PHP** can potentially garner a salary of around $140,000. AWS, GitLab, and Kubernetes** offer competitive salaries ranging from $120,00 to $129,00 and **Linux, Snowflake, Airflow, and Matlab skills can fetch around $115,000.
5. **Top Most Optimal Skills**
    - **Remote**: For remote data analyst jobs, skills such as Go and Snowflake, the former garnering an average salary of approximately $115,000 indicate that specialized skills can garner top salaries. AWS, Azure, and big data technologies (e.g., Hadoop and BigQuery) seem to be the most optimal skills for being in demand and having a high salary.
    - **Michigan**: For Michigan, AWS appears again as a  top skill to know with an average salary of around $130,000. Skills such as SQL, which pulls in around $105,000, along with R, Python, Java, and Spark are also optimal skills to know for data jobs in high salary ranges.

# Discussion

### What I learned

After taking this journey, I have leveled up my SQL skillset with some versatile tools

- **Data Aggregation**: Got comfortable with GROUP BY and aggregate functions such as AVG() and COUNT() to summarize data for reporting.

- **Complex Querying**: Used advanced SQL and stealthily merged tables, built common table expressions (CTEs), and optimized query performance by modifying scripts.

- **Analytical Mastermind**: Developed my real-world problem-solving skills, translating questions into meaningful and actionable insights like a decoder, and debugged script errors with rapid succession.

### Closing Thoughts

This project further developed my SQL skills and enhanced my understanding of the data job market, especially the data analytics job market. Exploring and analyzing this data emphasizes the importance of continuous learning and the importance of understanding trends within industries and market environments. By doing this analysis, the project findings serve as a resource for suggesting skill development and job searching. Knowing the most optimal skills can help equip job seekers in the job market with top in-demand skills and high-paying salary skills. 

