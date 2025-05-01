resource "google_service_account_key" "ci_key" {
  service_account_id = google_service_account.ci_account.name
  public_key_type    = "TYPE_X509_PEM_FILE"
  private_key_type   = "TYPE_GOOGLE_CREDENTIALS_FILE"
}

