resource "google_storage_bucket" "webapp_bucket" {
  name     = "webapp-assets-bucket"
  location = "US"
  force_destroy = true

  versioning {
    enabled = true
  }

  uniform_bucket_level_access = true
}

