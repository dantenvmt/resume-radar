WITH target AS (
  SELECT embedding FROM resume_radar.posting_embeddings WHERE job_id = 3901354005
)
SELECT
  p.title,
  ML.DISTANCE(target.embedding, o.embedding, 'COSINE') AS cos_dist
FROM resume_radar.posting_embeddings AS o
CROSS JOIN target
JOIN resume_radar.postings AS p ON p.job_id = o.job_id
WHERE o.job_id != 3901354005
ORDER BY cos_dist ASC      
LIMIT 10