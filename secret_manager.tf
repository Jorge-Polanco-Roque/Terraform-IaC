resource "google_secret_manager_secret" "api_key_secret" {
  secret_id = "webapp-api-key"
  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "api_key_secret_version" {
  secret      = google_secret_manager_secret.api_key_secret.id
  secret_data = "s3cr3t-@p1-k3y"
}

