# Configurar una política que defina cuánto tiempo deben retenerse los logs en una ubicación específica de Cloud Logging.

resource "google_logging_project_bucket_config" "log_bucket" {
  project        = "mi-proyecto-web"
  location       = "global"
  bucket_id      = "_Default"
  retention_days = 30
}

