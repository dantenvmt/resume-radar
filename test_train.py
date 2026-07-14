from train import split_data, train, evaluate
import pandas as pd 

toy_split = pd.DataFrame({
    "text": [f"posting number {i}" for i in range(10)],
    "formatted_experience_level": ["Entry level"] * 5 + ["Mid-Senior level"] * 5,
})

toy_train = pd.DataFrame({
    "text": ["python coding developer software"] * 10 + ["nursing patient hospital care"] * 10,
    "formatted_experience_level": ["Entry level"] * 10 + ["Mid-Senior level"] * 10,
})
def test_split_data():
    X_train, X_test, y_train, y_test = split_data(toy_split)
    assert X_train.shape[0] == 8 
    assert X_test.shape[0] == 2 
    assert (y_train.value_counts() == 4).all()
    assert (y_test.value_counts() == 1).all() # stratify held: each class still ~50% in y_train

def test_train_evaluate():
    vectorizer, model = train(toy_train["text"], toy_train["formatted_experience_level"])
    report = evaluate(model, vectorizer, toy_train["text"], toy_train["formatted_experience_level"])

    assert "accuracy" in report                    # "accuracy" is a key in report
    assert "Entry level" in report                    # "Entry level" is a key too
    assert report["accuracy"] == 1.0             # with those distinct vocabularies, accuracy should be perfect