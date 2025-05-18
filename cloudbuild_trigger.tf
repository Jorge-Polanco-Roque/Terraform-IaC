# Crear un trigger de Cloud Build que se active automáticamente cuando se realice un push a la rama principal de un repositorio de GitHub.

resource "google_cloudbuild_trigger" "github_trigger" {
  name        = "webapp-ci-trigger"
  description = "Trigger CI/CD on push to main"

  github {
    owner = "mi-organizacion"
    name  = "mi-repositorio"
    push {
      branch = "^main$"
    }
  }

  build {
    steps {
      name = "gcr.io/cloud-builders/docker"
      args = ["build", "-t", "gcr.io/$PROJECT_ID/webapp", "."]
    }

    images = ["gcr.io/$PROJECT_ID/webapp"]
  }
}

