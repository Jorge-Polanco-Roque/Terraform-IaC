resource "google_monitoring_alert_policy" "cpu_alert" {
  display_name = "High CPU Usage Alert"
  combiner     = "OR"

  conditions {
    display_name = "VM Instance CPU Usage"
    condition_threshold {
      filter     = "metric.type=\"compute.googleapis.com/instance/cpu/utilization\" AND resource.type=\"gce_instance\""
      duration   = "60s"
      comparison = "COMPARISON_GT"
      threshold_value = 0.8

      aggregations {
        alignment_period     = "60s"
        per_series_aligner   = "ALIGN_MEAN"
        cross_series_reducer = "REDUCE_NONE"
      }
    }
  }

  notification_channels = []
}

