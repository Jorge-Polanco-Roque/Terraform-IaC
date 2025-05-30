# Objetivo: Crear un bucket con políticas de ciclo de vida para borrar automáticamente backups antiguos después de cierto tiempo.

resource "google_storage_bucket" "backup_bucket" {
  name     = "webapp-backups"
  location = "US"
  force_destroy = true

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 30  # Elimina archivos después de 30 días
    }
  }

  versioning {
    enabled = true
  }
}

