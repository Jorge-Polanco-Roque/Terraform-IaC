# Objetivo: Conceder acceso de lectura a un conjunto de datos de BigQuery solo si la solicitud proviene de una ubicación específica (por ejemplo, dentro de una red corporativa).

resource "google_bigquery_dataset_iam_member" "conditional_reader" {
  dataset_id = "user_analytics"
  project    = "mi-proyecto-web"
  role       = "roles/bigquery.dataViewer"
  member     = "user:analyst@example.com"

  condition {
    title       = "InternalAccessOnly"
    description = "Permite acceso solo desde IPs internas"
    expression  = "request.auth.claims.ip_address.startsWith('10.')"
  }
}

