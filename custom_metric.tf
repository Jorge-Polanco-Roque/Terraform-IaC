# Crear una métrica personalizada que una app pueda usar para reportar eventos específicos, como registros de usuarios o errores críticos.

resource "google_monitoring_metric_descriptor" "user_signup_metric" {
  type        = "custom.googleapis.com/webapp/user_signups"
  metric_kind = "DELTA"
  value_type  = "INT64"
  unit        = "1"
  display_name = "User Signups"

  labels {
    key         = "region"
    value_type  = "STRING"
    description = "Region where the signup occurred"
  }

  description = "Tracks number of user signups"
}

