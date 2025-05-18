# Reemplazar periódicamente las claves de una cuenta de servicio en GCP para reforzar la seguridad, todo mediante Terraform.

resource "google_service_account" "automation_sa" {
  account_id   = "automation-sa"
  display_name = "Service Account for Automated Jobs"
}

resource "google_service_account_key" "active_key" {
  service_account_id = google_service_account.automation_sa.name
  keepers = {
    rotation_time = timestamp()
  }

  public_key_type  = "TYPE_X509_PEM_FILE"
  private_key_type = "TYPE_GOOGLE_CREDENTIALS_FILE"
}

