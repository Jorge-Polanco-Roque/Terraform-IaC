# Objetivo: Crear un servicio en Cloud Run para servir una aplicación estática desde una imagen de contenedor.

resource "google_cloud_run_service" "static_app" {
  name     = "static-webapp"
  location = "us-central1"

  template {
    spec {
      containers {
        image = "gcr.io/cloudrun/hello" # Puedes usar tu imagen personalizada
      }
    }
  }

  traffics {
    percent         = 100
    latest_revision = true
  }
}

resource "google_cloud_run_service_iam_member" "allow_all" {
  service  = google_cloud_run_service.static_app.name
  location = google_cloud_run_service.static_app.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}

