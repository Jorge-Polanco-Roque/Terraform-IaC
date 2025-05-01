resource "google_org_policy_policy" "restrict_services" {
  name     = "organizations/1234567890/policies/constraints/serviceuser.services"
  
  spec {
    rules {
      allow_all = false
      condition {
        expression = "resource.matchTag('env', 'production')"
      }
    }
    rules {
      values {
        allowed_values = [
          "compute.googleapis.com",
          "storage.googleapis.com",
          "pubsub.googleapis.com",
        ]
      }
    }
  }
}

