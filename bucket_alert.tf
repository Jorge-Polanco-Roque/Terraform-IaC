# Configurar una política que envíe alertas cuando el uso de almacenamiento en un bucket supere cierto umbral.

resource "google_monitoring_alert_policy" "bucket_usage_alert" {
  display_name = "Bucket Storage Usage Alert"
  combiner     = "OR"

  conditions {
    display_name = "Storage Usage > 80GB"
    condition_threshold {
      filter = "metric.type=\"storage.googleapis.com/storage/total_bytes\" AND resource.type=\"gcs_bucket\" AND resource.label.\"bucket_name\"=\"webapp-assets-bucket\""
      comparison     = "COMPARISON_GT"
      threshold_value = 8e10  # 80 GB
      duration       = "60s"

      aggregations {
        alignment_period     = "60s"
        per_series_aligner   = "ALIGN_MAX"
        cross_series_reducer = "REDUCE_NONE"
      }
    }
  }

  notification_channels = []
}

