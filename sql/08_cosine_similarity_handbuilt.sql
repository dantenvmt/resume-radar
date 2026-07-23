WITH target AS (
  SELECT embedding
  FROM resume_radar.posting_embeddings
  WHERE job_id = 3901354005
)

SELECT
  p.title,
  SUM(t_val * o_val)
    / ( SQRT(SUM(t_val * t_val)) * SQRT(SUM(o_val * o_val)) ) AS cosine_sim
FROM resume_radar.posting_embeddings AS o
CROSS JOIN target
JOIN resume_radar.postings AS p ON p.job_id = o.job_id,
UNNEST(target.embedding) AS t_val WITH OFFSET ti,
UNNEST(o.embedding) AS o_val WITH OFFSET oi
WHERE ti = oi       
  AND o.job_id != 3901354005
GROUP BY o.job_id, p.title
ORDER BY cosine_sim DESC
LIMIT 10