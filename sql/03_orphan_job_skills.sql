-- Question: count exactly how many job_ids in job_skills have no match in postings
SELECT COUNT(DISTINCT js.job_id) 
from resume_radar.job_skills js 
left join resume_radar.postings ps 
on js.job_id = ps.job_id 
where ps.job_id is null