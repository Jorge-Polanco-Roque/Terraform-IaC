resource "google_storage_bucket" "retention_bucket" {
  name     = "webapp-logs-bucket"
  location = "US"
  
  retention_policy {
    retention_period = 60 * 60 * 24 * 30 # 30 días en segundos
    is_locked        = false
  }

  force_destroy = true
}

