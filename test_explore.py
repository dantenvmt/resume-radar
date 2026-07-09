import pandas as pd
from explore import pct_missing_salary

def test():
    df = pd.DataFrame({"normalized_salary": [1.0, None, 1.0]})
    result = pct_missing_salary(df)
    assert result == 33.33