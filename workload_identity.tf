# Objetivo: Permitir que un sistema externo (por ejemplo, GitHub Actions) acceda a recursos en GCP sin necesidad de claves estáticas, usando Workload Identity Federation.

resource "google_iam_workload_identity_pool" "github_pool" {
  workload_identity_pool_id = "github-pool"
  display_name              = "GitHub Identity Pool"
}

resource "google_iam_workload_identity_pool_provider" "github_provider" {
  workload_identity_pool_id          = google_iam_workload_identity_pool.github_pool.workload_identity_pool_id
  workload_identity_pool_provider_id = "github-provider"
  display_name                       = "GitHub OIDC Provider"
  attribute_mapping = {
    "google.subject"         = "assertion.sub"
    "attribute.repository"   = "assertion.repository"
  }
  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
}

resource "google_service_account_iam_member" "allow_github" {
  service_account_id = "projects/my-project/serviceAccounts/ci-deploy@my-project.iam.gserviceaccount.com"
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/projects/1234567890/locations/global/workloadIdentityPools/github-pool/attribute.repository/my-org/my-repo"
}

