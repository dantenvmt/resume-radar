
SELECT AVG(normalized_salary) as avg_salary , formatted_experience_level FROM resume_radar.postings GROUP BY formatted_experience_level ORDER BY avg_salary DESC

+--------------------+----------------------------+
|     avg_salary     | formatted_experience_level |
+--------------------+----------------------------+
|  963207.0742989415 | Internship                 |
| 246989.16679432383 | Entry level                |
|  220485.5063622287 | Mid-Senior level           |
| 201788.50369109955 | Executive                  |
| 172285.22779968477 | Director                   |
| 163601.30751631944 | NULL                       |
|  81875.99470830112 | Associate                  |
+--------------------+----------------------------+

-- since someone may post the hourly number into the yearly field or salary creating outliers, using meadian is better and took off all of the outliers completely

SELECT DISTINCT PERCENTILE_CONT(normalized_salary,0.5) OVER(PARTITION BY formatted_experience_level) as median_salary , formatted_experience_level FROM resume_radar.postings ORDER BY avg_salary DESC

+------------+----------------------------+
| avg_salary | formatted_experience_level |
+------------+----------------------------+
|   193750.0 | Executive                  |
|  167206.25 | Director                   |
|   107500.0 | Mid-Senior level           |
|    77500.0 | NULL                       |
|    72800.0 | Associate                  |
|    52213.2 | Entry level                |
|    48880.0 | Internship                 |
+------------+----------------------------+