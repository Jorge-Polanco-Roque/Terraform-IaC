# Objetivo: Forzar que todos los recursos creados en un proyecto incluyan etiquetas específicas como env, team, o cost_center.

resource "google_org_policy_policy" "require_labels" {
  name = "projects/mi-proyecto-web/policies/constraints/gcp.resourceLocations"

  spec {
    rules {
      condition {
        expression = "resource.matchTag('env', '*') && resource.matchTag('team', '*')"
      }
      enforce = true
    }
  }
}

