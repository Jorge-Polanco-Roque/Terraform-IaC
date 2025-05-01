resource "google_pubsub_topic" "task_trigger" {
  name = "scheduled-task-topic"
}

resource "google_cloud_scheduler_job" "task_scheduler" {
  name             = "trigger-function-job"
  schedule         = "*/5 * * * *" # Cada 5 minutos
  time_zone        = "America/Mexico_City"
  pubsub_target {
    topic_name = google_pubsub_topic.task_trigger.id
    data       = base64encode("{\"message\":\"Hola desde Cloud Scheduler\"}")
  }
}

