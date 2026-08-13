This is the project started to learn google cloud platform. upload resume -> matched job posting
stacks: BigQuery, Vertex AI, Gemini, FastAPI, Cloud Run

v1 model: LinearSVC (class_weight="balanced") - chosen over Logistic Regression after a 4-model comparison (see MLflow): best accuracy (0.77) and macro F1 (0.70) while keeping minority-class recall solid, without logreg-balanced's precision collapse (0.40 on Executive).
for a job matching product, failing to recognize users' seniority (recall failure) is a critical failure that affects everything downstream, while over promoting a posting(precision failure) is a minor annoyance

updated model tested with hard slice on the title (meaning there is no job seniority on the title). Model's accuracy stayed at 0.767, meaning the model still hold strong when using against jobs with no shortcut in the title

on average, there are ~3910 chars per postings, with 10k postings, it is around 11.85 mil token. and for $0.15 per mil token, that's an estimated $1.78 for 10k postings. Actual billed: $1.20.

07/22:
learnt about something called template gravity, which happened when same company postings get pulled together in meaning-space regardless of the role because employers stamp every posting with the same boilerplate

08/11:
Metric	Result	What it measures
precision@3 (Week 4)	0.933	broad relevance — "same neighborhood?"
cert retention (08/11)	0/3	hard requirements — "passes the gate?"
so even though we will get pretty precise metric with the semantic search, it doesnt hold true when taken in account of the certification. We tested the CPA cert, and none of the first 3 has CPA as their requirement. So we gonna implement the hybrid-retrieval plan (like add the requirement REGEXP_CONTAINS(p.description, r'\bCPA\b') to the sql for bigquery e.g.) 
My first dedup keyed on description alone - but one description can cover many real jobs (Cogent stamped the same text on fiber-tech roles in six cities), so it wrongly deleted 86 postings. The fix keys on title + description - the exact string that was embedded - so 'duplicate' means the same thing to the dedup table and the vector index.
8/12
so with high precision@3 0.933 next to 0/3 pre-dedup top-3, 0/5 post-dedup top-5 CPA retention, the  semantic retrieval is requirement blind at the moment. 
the embedding dropped CPA, but the ai gen caught it. Retrieval scored 0/5 on cert retention but gemini reading raw posting text put CPA in gap_skill without prompting. The pydantic catch the shape, not the meaning. The thing that catches shape valid but wrong is an eval harness.