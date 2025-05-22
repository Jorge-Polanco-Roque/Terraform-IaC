# Objetivo: Configurar una función en Cloud Functions que sólo usuarios autenticados puedan invocar, utilizando IAM.

resource "google_cloudfunctions_function" "secure_function" {
  name        = "secureFunction"
  description = "Función accesible solo con autenticación"
  runtime     = "python310"
  entry_point = "handler"
  source_archive_bucket = google_storage_bucket.source_bucket.name
  source_archive_object = google_storage_bucket_object.source_zip.name
  trigger_http = true
  available_memory_mb = 128
  region = "us-central1"
}

resource "google_cloudfunctions_function_iam_member" "invoker" {
  project        = google_cloudfunctions_function.secure_function.project
  region         = google_cloudfunctions_function.secure_function.region
  cloud_function = google_cloudfunctions_function.secure_function.name
  role           = "roles/cloudfunctions.invoker"
  member         = "user:authorized-user@example.com"
}

