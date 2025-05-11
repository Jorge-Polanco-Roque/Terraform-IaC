# Objetivo: Asignar permisos a recursos etiquetados con un valor específico mediante IAM Conditions y etiquetas de recurso.

resource "google_tags_tag_key" "env_key" {
  short_name = "environment"
  parent     = "organizations/1234567890"
}

resource "google_tags_tag_value" "prod_value" {
  short_name = "prod"
  parent     = google_tags_tag_key.env_key.name
}

resource "google_tags_tag_binding" "bind_tag_to_bucket" {
  parent = "projects/_/buckets/webapp-logs-bucket"
  tag_value = google_tags_tag_value.prod_value.name
}

resource "google_project_iam_member" "access_if_tagged_prod" {
  project = "mi-proyecto-web"
  role    = "roles/storage.objectViewer"
  member  = "user:dev@example.com"

  condition {
    title       = "AllowIfTaggedProd"
    description = "Permitir acceso solo si el recurso está etiquetado como 'prod'"
    expression  = "resource.matchTag('environment', 'prod')"
  }
}

