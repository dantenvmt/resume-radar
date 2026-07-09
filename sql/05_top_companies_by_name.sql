--. TEKsystems, Insight Global — staffing agencies. The Job Network, Dice — job boards reposting other people's listings. Liberty Healthcare posting 1,108 times is likely the same handful of nursing roles duplicated across locations.
-- when your matcher recommends "jobs like your resume," do you want it drowning users in near-duplicate staffing-agency posts?

SELECT c.name, c.company_id, count(ps.job_id) as job_count from resume_radar.postings ps JOIN resume_radar.companies c ON ps.company_id = c.company_id group by c.name, c.company_id order by count(ps.job_id) DESC LIMIT 10


+------------------------------------------------+------------+------+
|                      name                      | company_id | f0_  |
+------------------------------------------------+------------+------+
| Liberty Healthcare and Rehabilitation Services |   53345529 | 1108 |
| The Job Network                                |     167757 | 1003 |
| J. Galt                                        |   73013724 |  604 |
| TEKsystems                                     |       2152 |  529 |
| Lowe's Companies, Inc.                         |       4128 |  527 |
| Ingersoll Rand                                 |       3175 |  517 |
| Capital One                                    |       1419 |  496 |
| Cogent Communications                          |     163139 |  476 |
| Insight Global                                 |      11056 |  418 |
| Dice                                           |       6849 |  415 |
+------------------------------------------------+------------+------+