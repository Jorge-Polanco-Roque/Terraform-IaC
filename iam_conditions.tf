# Otorgar permisos a una cuenta de servicio únicamente durante días laborales y horarios específicos usando IAM Conditions en Terraform.

resource "google_project_iam_member" "conditional_access" {
  project = "mi-proyecto-web"
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:ci@mi-proyecto-web.iam.gserviceaccount.com"

  condition {
    title       = "LunesAViernesHorarioLaboral"
    description = "Permitir acceso de 8am a 6pm de lunes a viernes"
    expression  = <<-EOT
      request.time.getDayOfWeek() >= 1 &&
      request.time.getDayOfWeek() <= 5 &&
      request.time.getHours() >= 8 &&
      request.time.getHours() <= 18
    EOT
  }
}

