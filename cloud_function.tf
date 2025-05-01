resource "google_storage_bucket" "function_bucket" {
  name     = "function-source-code-bucket"
  location = "US"
}

resource "google_storage_bucket_object" "function_zip" {
  name   = "function-source.zip"
  bucket = google_storage_bucket.function_bucket.name
  source = "path/to/function-source.zip" # Ruta local del código comprimido
}

resource "google_cloudfunctions_function" "hello_world" {
  name        = "helloWorld"
  description = "Mi función básica en GCP"
  runtime     = "python310"
  entry_point = "hello_world"
  source_archive_bucket = google_storage_bucket.function_bucket.name
  source_archive_object = google_storage_bucket_object.function_zip.name
  trigger_http = true
  available_memory_mb = 128
}

