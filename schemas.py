from pydantic import BaseModel, Field

class FitAnalysis(BaseModel):
    match_score: int = Field(ge=0, le=100, strict = True)
    matched_skills: list[str]
    gap_skills: list[str]
    rationale: str = Field(min_length=1)