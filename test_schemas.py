import pytest
from pydantic import ValidationError
from schemas import FitAnalysis

def test_rejects_score_over_100():
    with pytest.raises(ValidationError):
        FitAnalysis(match_score=1500, matched_skills = ['do it'],gap_skills = ['huh'] , rationale = "aaa")
def test_non_numeric_score():
    with pytest.raises(ValidationError):
        FitAnalysis(match_score='high', matched_skills = ['do it'],gap_skills = ['huh'] , rationale = "aaa")
def test_valid_payload():
    fa = FitAnalysis(match_score=80, matched_skills = ['do it'],gap_skills = ['huh'] , rationale = "aaa")
    assert fa.match_score == 80
def test_rejects_empty_rationale():
    with pytest.raises(ValidationError):
        FitAnalysis(match_score=80, matched_skills = ['do it'],gap_skills = ['huh'] , rationale = "")
def test_match_score():
    with pytest.raises(ValidationError):
        FitAnalysis(match_score='80', matched_skills = ['do it'],gap_skills = ['huh'] , rationale = "aasd")