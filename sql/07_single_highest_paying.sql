--QUESTION: the single highest-paying posting per experience level — title, company, salary, level
WITH rankedposting as (
    Select title, company_id, formatted_experience_level,
    ROW_NUMBER() OVER (PARTITION BY formatted_experience_level ORDER BY normalized_salary DESC) as rn
    FROM resume_radar.postings
)

SELECT *
From rankedposting
where rn =1;
+-------------------------------------------------------------+-------------+----------------------------+-------------------+----+
|                            title                            | company_id  | formatted_experience_level | normalized_salary | rn |
+-------------------------------------------------------------+-------------+----------------------------+-------------------+----+
| Manager - Clinical Applications Support - Ancillary Systems |     29531.0 | NULL                       |       2.3042344E8 |  1 |
| React UI Developer                                          |   1379045.0 | Associate                  |         1200000.0 |  1 |
| Litigation Partner                                          |   2379623.0 | Director                   |          750000.0 |  1 |
| Intellectual Property Associate (246215)                    |      9814.0 | Entry level                |           5.356E8 |  1 |
| Chief Information Security Officer (CISO)                   | 8.4108929E7 | Executive                  |          631800.0 |  1 |
| Student Nurse (Intern)                                      |      1550.0 | Internship                 |       4.7179392E7 |  1 |
| Case Manager RN, Pedi Rheumatology                          |      1550.0 | Mid-Senior level           |        3.624088E8 |  1 |
+-------------------------------------------------------------+-------------+----------------------------+-------------------+----+
-- rogues' gallery of your earlier discovery: a $230 million clinical apps manager, a $535M entry-level associate, a student nurse intern on $47M. 
-- That E8 notation is science-speak for "eight zeros," and each one of these is the mean-wrecking garbage you diagnosed with the median