# Objetivo: Permitir que una Cloud Run app acceda a secretos almacenados en Secret Manager mediante permisos IAM definidos por Terraform.

resource "google_secret_manager_secret" "db_password" {
  secret_id = "db-password"
  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "db_password_version" {
  secret      = google_secret_manager_secret.db_password.id
  secret_data = "s3cur3P@ssw0rd"
}

resource "google_project_iam_member" "cloud_run_secret_access" {
  project = "mi-proyecto-web"
  role    = "roles/secretmanager.secretAccessor"
  member  = "serviceAccount:cloud-run-sa@mi-proyecto-web.iam.gserviceaccount.com"
}

