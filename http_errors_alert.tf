# Objetivo: Crear una política de alerta en Cloud Monitoring que detecte un aumento en los errores 5xx servidos por una instancia backend de una aplicación web.

resource "google_monitoring_alert_policy" "http_5xx_alert" {
  display_name = "High HTTP 5xx Rate"
  combiner     = "OR"

  conditions {
    display_name = "5xx Errors > 5%"
    condition_threshold {
      filter = "metric.type=\"loadbalancing.googleapis.com/https/backend_response_count\" AND metric.label.\"response_code_class\"=\"5xx\""
      comparison     = "COMPARISON_GT"
      threshold_value = 0.05
      duration       = "60s"

      aggregations {
        alignment_period     = "60s"
        per_series_aligner   = "ALIGN_RATIO"
        cross_series_reducer = "REDUCE_MEAN"
      }
    }
  }

  notification_channels = []
}

