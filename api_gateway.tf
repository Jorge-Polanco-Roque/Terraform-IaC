# Objetivo: Desplegar una puerta de enlace (API Gateway) en GCP que autentique solicitudes usando API Keys, protegiendo funciones de Cloud Functions o Cloud Run.

resource "google_api_gateway_api" "webapp_api" {
  api_id = "webapp-api"
}

resource "google_api_gateway_api_config" "webapp_api_config" {
  api      = google_api_gateway_api.webapp_api.id
  config_id = "v1"

  openapi_documents {
    document {
      path     = "openapi-spec.yaml"
      contents = file("openapi-spec.yaml")
    }
  }
}

resource "google_api_gateway_gateway" "webapp_gateway" {
  gateway_id = "webapp-gateway"
  api_config = google_api_gateway_api_config.webapp_api_config.id
  location   = "us-central1"
}

