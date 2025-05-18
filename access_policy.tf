# Crear una política de acceso contextual que restrinja el acceso a recursos de GCP sólo desde ciertas ubicaciones IP.

resource "google_access_context_manager_access_policy" "org_policy" {
  parent = "organizations/1234567890"
  title  = "Org Access Policy"
}

resource "google_access_context_manager_access_level" "office_access" {
  parent = google_access_context_manager_access_policy.org_policy.name
  name   = "accessPolicies/${google_access_context_manager_access_policy.org_policy.name}/accessLevels/OfficeOnly"
  title  = "Office Only Access"

  basic {
    conditions {
      ip_subnetworks = ["203.0.113.0/24"]
    }
    combining_function = "AND"
  }
}

