# Objetivo: Otorgar acceso temporal a un recurso (como un bucket) que expire automáticamente después de una fecha específica.

resource "google_storage_bucket_iam_member" "temp_access" {
  bucket = "webapp-assets"
  role   = "roles/storage.objectViewer"
  member = "user:contractor@example.com"

  condition {
    title       = "AccessUntilEndOfMonth"
    description = "Permite acceso temporal hasta el 31 de mayo de 2025"
    expression  = "request.time < timestamp('2025-06-01T00:00:00Z')"
  }
}

