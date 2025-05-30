# Objetivo: Asegurar que todas las acciones administrativas realizadas sobre recursos de GCP queden registradas en Cloud Audit Logs.

resource "google_project_iam_audit_config" "admin_audit_logs" {
  project = "mi-proyecto-web"
  service = "allServices"

  audit_log_config {
    log_type = "ADMIN_READ"
  }

  audit_log_config {
    log_type = "DATA_WRITE"
  }

  audit_log_config {
    log_type = "DATA_READ"
    exempted_members = [
      "user:developer@example.com"
    ]
  }
}

