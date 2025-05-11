# Objetivo: Crear una estructura organizacional en GCP para aislar entornos (dev, staging, prod) mediante Terraform.

resource "google_folder" "dev_folder" {
  display_name = "dev"
  parent       = "organizations/1234567890"
}

resource "google_project" "dev_project" {
  name       = "webapp-dev"
  project_id = "webapp-dev-123"
  org_id     = "1234567890"
  folder_id  = google_folder.dev_folder.name
  billing_account = "000000-000000-000000"
}

