provider "google" {
    project = "resume-radar-thuan"
    region = "us-central1"
    zone = "us-central1-c"

}

resource "google_storage_bucket" "raw_data" {
    name = "resume-radar-thuan-data"
    location = "us-central1"
}

resource "google_bigquery_dataset" "dataset"{
    dataset_id = "resume_radar"
    location = "us-central1"
}
resource "google_service_account" "service_account" {
    account_id = "resume-radar-app"
    display_name = "Resume Radar App"
}