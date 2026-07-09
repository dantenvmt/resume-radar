SELECT COUNT(ps.job_id) as no_of_jobs, s.skill_abr, s.skill_name  
FROM resume_radar.postings ps 
INNER JOIN resume_radar.job_skills js on ps.job_id = js.job_id 
INNER JOIN resume_radar.skills s on js.skill_abr = s.skill_abr 
group by s.skill_abr, s.skill_name 
order by no_of_jobs desc
-- there are only 35 skills in the entire dataset, and they're not really skills — they're broad categories. "Information Technology" tells you nothing about Python vs. Java vs. network administration. 
-- If Resume Radar matched resumes on this table alone, it would be garbage — every developer, DBA, and helpdesk tech collapses into one bucket. The real skill signal is buried in the free text of description
+------------+-----------+------------------------+
| no_of_jobs | skill_abr |       skill_name       |
+------------+-----------+------------------------+
|      25256 | IT        | Information Technology |
|      21193 | SALE      | Sales                  |
|      20385 | MGMT      | Management             |
|      17728 | MNFC      | Manufacturing          |
|      16675 | HCPR      | Health Care Provider   |
|      13304 | BD        | Business Development   |
|      12530 | ENG       | Engineering            |
|      12314 | OTHR      | Other                  |
|       8011 | FIN       | Finance                |
|       5400 | MRKT      | Marketing              |
|       4999 | ACCT      | Accounting/Auditing    |
|       4787 | ADM       | Administrative         |
|       4167 | CUST      | Customer Service       |
|       3825 | PRJM      | Project Management     |
|       3775 | ANLS      | Analyst                |
|       2928 | RSCH      | Research               |
|       2608 | HR        | Human Resources        |
|       2241 | CNSL      | Consulting             |
|       2229 | LGL       | Legal                  |
|       2217 | EDU       | Education              |
|       2207 | DSGN      | Design                 |
|       2164 | TRNG      | Training               |
|       1929 | GENB      | General Business       |
|       1752 | QA        | Quality Assurance      |
|       1637 | ART       | Art/Creative           |
|       1426 | WRT       | Writing/Editing        |
|       1313 | PRDM      | Product Management     |
|       1258 | PR        | Public Relations       |
|       1167 | SUPL      | Supply Chain           |
|       1158 | STRA      | Strategy/Planning      |
|        782 | SCI       | Science                |
|        753 | PROD      | Production             |
|        652 | ADVR      | Advertising            |
|        599 | PRCH      | Purchasing             |
|        409 | DIST      | Distribution           |
+------------+-----------+------------------------+