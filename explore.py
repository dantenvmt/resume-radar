import pandas as pd

if __name__ == "__main__":
    df = pd.read_csv("data/postings.csv")

    # printing the number of row count
    print(f"Row count:{len(df)}")
    # printing columns names
    print(f"Column names {df.columns}")
    # printing top 10 most common job titles
    print(f"Top 10 most common job titlles {df.value_counts('title', sort=True).head(10)}")
    # % of postings missing a salary
    print(
        f"% of postings missing a salary: {df['normalized_salary'].isna().mean() * 100:.1f}%"
    )
    # the reason why i chose normalized salary is because it only missing when all others salary var is missing


def pct_missing_salary(df):
    missing_salary = df['normalized_salary'].isna().mean() * 100
    pct = round(missing_salary, 2)
    return pct
