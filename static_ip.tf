resource "google_compute_address" "static_ip" {
  name   = "webapp-static-ip"
  region = "us-central1"
}

