resource "google_compute_firewall" "allow_http" {
  name    = "allow-http"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  direction = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["web-server"]
}

