This is the project started to learn google cloud platform. upload resume -> matched job posting
stacks: BigQuery, Vertex AI, Gemini, FastAPI, Cloud Run

v1 model: LinearSVC (class_weight="balanced") - chosen over Logistic Regression after a 4-model comparison (see MLflow): best accuracy (0.77) and macro F1 (0.70) while keeping minority-class recall solid, without logreg-balanced's precision collapse (0.40 on Executive).
FOr a job matching product, failing to recognize users' senority (recall failure) is a critical failure that affect everything downstream, while over promoting a posting(precision failure) is a minor annoyance

updated model tested with hard slice on the title (meaning there is no job seniority on the tile). Model's accuracy stayed at 0.767, meaning the model still hold strong when using against jobs with no shortcut in the title

in average, there are ~3910 chars per postings, with 10k postings, it is around 11.85 mil token. and for $0.15 per mil token, that's an estimated $1.78 for 10k postings. Actual billed: $1.20.

07/22:
learnt about something called template gravity, which happened when same company postings get pulled together in meaning-space regardless of the role because employers stamp every posting with the same boilerplate

08/11:
Metric	Result	What it measures
precision@3 (Week 4)	0.933	broad relevance — "same neighborhood?"
cert retention (today)	0/3	hard requirements — "passes the gate?"
so even though we will get pretty precise metric with the job title vs job description, it doesnt hold true when taken in account of the certification. We tested the CPA cert, and none of the first 3 has CPA as their requirement. So we gonna implement the hybrid-retrival plan (like add wthe requirement REGEXP_CONTAINS(p.description, r'\bCPAb\') to the sql for bigquery e.g.) 