import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.metrics import classification_report
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.svm import LinearSVC
import mlflow

def load_data(path):
    df = pd.read_csv(path, usecols= ["title","description","formatted_experience_level"])
    df = df.dropna(subset="formatted_experience_level")
    df['text'] = df['title'] + " "+df["description"].fillna("")
    return df

def split_data(df):
    X = df['text']
    y = df["formatted_experience_level"]
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size= 0.2, random_state=42, stratify=y)
    return X_train, X_test, y_train,y_test

def train(X_train, y_train):
    vectorizer = TfidfVectorizer()
    X_train_transformed = vectorizer.fit_transform(X_train)
    model = LinearSVC(class_weight="balanced")
    model.fit(X_train_transformed, y_train)
    return vectorizer, model

def evaluate(model, vectorizer, X_test, y_test):
    X_test_transformed  = vectorizer.transform(X_test)
    y_pred = model.predict(X_test_transformed)
    model_report = classification_report(y_test, y_pred, output_dict=True)
    return model_report

if __name__ == "__main__":
    df = load_data("data/postings.csv")
    X_train, X_test, y_train, y_test = split_data(df)
    vectorizer, model = train(X_train, y_train)
    model_report = evaluate(model, vectorizer, X_test, y_test)
    #add the mlflow here
    mlflow.set_tracking_uri("sqlite:///mlflow.db")
    mlflow.set_experiment("experience-classifier")
    with mlflow.start_run(run_name="linearsvc-balanced"):
        mlflow.log_param("model_type", "LinearSVC")
        mlflow.log_param("class_weight", "Balanced")
        mlflow.log_param("test_size", 0.2)
        mlflow.log_metric("accuracy", model_report['accuracy'])
        mlflow.log_metric("macro_f1", model_report['macro avg']['f1-score'])
        mlflow.log_metric("executive_recall", model_report['Executive']['recall'])
        mlflow.log_metric("executive_precision", model_report['Executive']['precision'])
    print(f"accuracy: {model_report['accuracy']}")
    print(f"macro F1: {model_report['macro avg']['f1-score']}")