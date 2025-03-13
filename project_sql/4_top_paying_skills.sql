/*
Question: What are the top skills based on salary? 
Look at the average salary associated with each skill for Data Analyst positions.
Focuses on roles with specified salaries, regardless of location.
Why? It reveals how different skills impact salary levels for Data Analysts and helps identify the most financially rewarding skills to acquire or improve.
*/

SELECT
    skills,
    ROUND(AVG(job_postings_fact.salary_year_avg),0) AS avg_salary
FROM
    job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 100;

/*
Insights from the Top 100 Highest-Paying Data Analyst Skills:

    Big Data & Cloud Technologies Dominate
        Pyspark ($182K), Databricks ($135K), Hadoop ($115K), Snowflake ($115K), BigQuery ($115K), Redshift ($102K)
        These indicate a strong demand for handling large-scale data processing and cloud-based analytics.

    Machine Learning & AI-Related Skills Pay Well
        Keras ($185K), TensorFlow ($140K), PyTorch ($140K), Scikit-Learn ($125K), Datarobot ($128K)
        High salaries suggest that companies are willing to pay more for data analysts with ML/AI expertise.

    Programming Languages with High Salaries
        Python ($106K), Golang ($161K), Rust ($138K), Scala ($133K), Swift ($147K), Java ($113K)
        Specialized languages like Golang and Rust command much higher salaries than traditional data languages.

    Visualization & BI Tools in Demand
        MicroStrategy ($130K), Looker ($111K), Power BI ($100K), Tableau ($103K), Qlik ($104K)
        These show that advanced visualization and dashboarding skills are well-compensated.

    DevOps, Version Control, and Collaboration Tools Matter
        Bitbucket ($189K), GitLab ($154K), Git ($111K), Jenkins ($125K), Confluence ($111K), Notion ($125K)
        High salaries for these tools suggest that version control and workflow automation are key for high-paying roles.

    Database & SQL-Related Skills Stay Relevant
        PostgreSQL ($113K), Oracle ($108K), SQL Server ($102K), NoSQL ($108K), Cassandra ($140K), MySQL ($94K)
        While SQL itself is foundational, NoSQL databases and cloud-based solutions are paying more.

Key Takeaways:

    Cloud, AI, and Big Data skills are the top earners.
    Specialized programming (e.g., Golang, Rust) and ML frameworks (Keras, PyTorch) are highly valued.
    Version control, DevOps, and collaboration tools (Bitbucket, GitLab, Jenkins, Notion) show an increasing need for automation and structured workflows.
    BI, analytics, and database management remain essential but command slightly lower salaries compared to AI and cloud-based technologies.

Would you like a visual representation of these trends?
*/