resource "google_sql_database_instance" "postgres_instance" {
  name             = "webapp-postgres"
  database_version = "POSTGRES_14"
  region           = "us-central1"

  settings {
    tier = "db-f1-micro"

    backup_configuration {
      enabled = true
    }
  }
}

resource "google_sql_database" "app_db" {
  name     = "webapp_db"
  instance = google_sql_database_instance.postgres_instance.name
}

resource "google_sql_user" "app_user" {
  name     = "appuser"
  instance = google_sql_database_instance.postgres_instance.name
  password = "changeme123" # Se recomienda usar secretos o variables sensibles
}

