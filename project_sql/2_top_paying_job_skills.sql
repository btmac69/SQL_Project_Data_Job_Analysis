/*
Question: What are the top-paying data analyst jobs, and what skills are required? 
Identify the top 10 highest-paying Data Analyst jobs and the specific skills required for these roles.
Filters for roles with specified salaries that are remote
Why? It provides a detailed look at which high-paying jobs demand certain skills, helping job seekers understand which skills to develop that align with top salaries
*/

WITH top10_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
        LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL AND
        job_location = 'Anywhere'
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT
    top10_jobs.job_id,
    company_name,
    job_title,
    skills,
    salary_year_avg
FROM
    top10_jobs
    INNER JOIN skills_job_dim ON top10_jobs.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC

/*
ChatGPT used the following Python to display insights:
import pandas as pd

# Load the CSV file
file_path = "/mnt/data/Top 10 Paying Skills.csv"
df = pd.read_csv(file_path)

# Display the first few rows to understand the structure
df.head()

### Insights from the Skills Analysis:

1. **Most In-Demand Skills (Top 10 Most Common)**
   - **SQL** (8 mentions) – The most frequently listed skill, essential for querying databases.
   - **Python** (7 mentions) – A key programming language for data analysis and machine learning.
   - **Tableau** (6 mentions) – A popular data visualization tool.
   - **R, AWS, Pandas, Excel, Snowflake** (3 mentions each) – Essential for statistical analysis, cloud computing, and data processing.
   - **Oracle, Confluence** (2 mentions each) – Database management and collaboration tools.

2. **Highest-Paying Skills (Top 10)**
   - **Pyspark, PowerPoint, Databricks, Jupyter** – All averaging **$255,829.50** in salary.
   - **Hadoop** – $232,423.00, indicating demand for big data expertise.
   - **R, Azure, Power BI** – Between $222K-$225K, showing strong demand for statistical computing and cloud-based analytics.
   - **Crystal, Flow** – $217,000.00, possibly related to specific enterprise data solutions.

### Key Takeaways:
- **SQL, Python, and Tableau dominate** the demand, making them essential skills for data analysts.
- **Big Data and Cloud Computing (Pyspark, Databricks, Hadoop, Azure, Snowflake, AWS)** command high salaries.
- **Visualization & Reporting tools (Power BI, Tableau, PowerPoint, Crystal)** are both in-demand and high-paying.
- **Specialized tools like Jupyter and Confluence also appear**, hinting at collaborative and interactive computing importance.

Would you like further breakdowns, such as trends over companies or job roles?

Asking ChatGPT to visualize this data, it used the following python code resulting in the charts:

import matplotlib.pyplot as plt
import seaborn as sns

# Set visualization style
sns.set(style="whitegrid")

# Create a figure with subplots
fig, axes = plt.subplots(1, 2, figsize=(14, 5))

# Bar plot for most common skills
sns.barplot(x=top_skills.values, y=top_skills.index, palette="Blues_r", ax=axes[0])
axes[0].set_title("Top 10 Most In-Demand Skills")
axes[0].set_xlabel("Number of Job Postings")

# Bar plot for highest-paying skills
sns.barplot(x=top_paying_skills.values, y=top_paying_skills.index, palette="Reds_r", ax=axes[1])
axes[1].set_title("Top 10 Highest-Paying Skills")
axes[1].set_xlabel("Average Salary ($)")

# Show the plots
plt.tight_layout()
plt.show()

Output image

Here are the visualizations:
c:\Users\btmac\AppData\Local\Temp\a2872bbd-515f-46f8-8d11-ac6d9b66ae71.png

    Top 10 Most In-Demand Skills – SQL, Python, and Tableau lead the list, showing their strong presence in job postings.
    Top 10 Highest-Paying Skills – Pyspark, Databricks, and Jupyter offer the highest salaries, highlighting the value of big data and cloud expertise.
*/