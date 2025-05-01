resource "google_service_account" "ci_account" {
  account_id   = "ci-service-account"
  display_name = "CI/CD Service Account"
}

resource "google_project_iam_member" "ci_role_binding" {
  role   = "roles/editor"
  member = "serviceAccount:${google_service_account.ci_account.email}"
}

