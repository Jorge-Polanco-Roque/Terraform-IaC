# Objetivo: Limitar el uso de una API específica (como Vision API o Maps API) dentro de un proyecto de GCP usando IaC.

resource "google_project_service_identity" "vision_api_sa" {
  provider = google-beta
  project  = "mi-proyecto-web"
  service  = "vision.googleapis.com"
}

resource "google_service_usage_consumer_quota_override" "vision_quota_limit" {
  provider = google-beta
  parent   = "projects/mi-proyecto-web/services/vision.googleapis.com"
  metric   = "vision.googleapis.com/requests"
  unit     = "1/min/{project}"

  override_value = "100"  # Limita a 100 solicitudes por minuto
}

