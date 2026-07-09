-- Question: how many postings per work type (full-time, contract, etc.)?
-- Expected: rows sum to 123,849; FULL_TIME should dominate.
SELECT
  formatted_work_type,
  COUNT(*) AS posting_count
FROM resume_radar.postings
GROUP BY formatted_work_type
ORDER BY posting_count DESC;