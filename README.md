This is the project started to learn google cloud platform. upload resume -> matched job posting
stacks: BigQuery, Vertex AI, Gemini, FastAPI, Cloud Run

For the v1 of resume-radar, we gonna go with class-weight = "balanced", and the model is Logistic Regression. I went with the model with higher recall score and lower precision score
FOr a job matching product, failing to recognize users' senority (recall failure) is a critical failure that affect everything downstream, while over promoting a posting(precision failure) is a minor annoyance

updated model tested with hard slice on the title (meaning there is no job seniority on the tile). Model's accuracy stayed at 0.767, meaning the model still hold strong when using against jobs with no shortcut in the title