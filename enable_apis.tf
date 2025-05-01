resource "google_project_service" "compute_api" {
  service = "compute.googleapis.com"
}

resource "google_project_service" "cloudfunctions_api" {
  service = "cloudfunctions.googleapis.com"
}

