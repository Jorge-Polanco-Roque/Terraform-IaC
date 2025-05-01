resource "google_project_iam_custom_role" "developer_custom_role" {
  role_id     = "customDeveloper"
  title       = "Custom Developer Role"
  description = "Rol con permisos limitados para desarrolladores"
  project     = "mi-proyecto-web"

  permissions = [
    "compute.instances.list",
    "compute.instances.start",
    "compute.instances.stop",
    "storage.objects.get",
    "storage.objects.list"
  ]
}

