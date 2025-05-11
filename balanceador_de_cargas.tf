resource "google_compute_health_check" "internal_hc" {
  name               = "internal-hc"
  check_interval_sec = 10
  timeout_sec        = 5
  healthy_threshold  = 2
  unhealthy_threshold = 2

  tcp_health_check {
    port = 80
  }
}

resource "google_compute_backend_service" "internal_backend" {
  name                            = "internal-backend-service"
  protocol                        = "TCP"
  health_checks                   = [google_compute_health_check.internal_hc.id]
  load_balancing_scheme           = "INTERNAL"
  backend {
    group = google_compute_instance_group.web_group.self_link
  }
}

resource "google_compute_forwarding_rule" "internal_forwarding_rule" {
  name                  = "internal-forwarding-rule"
  load_balancing_scheme = "INTERNAL"
  backend_service       = google_compute_backend_service.internal_backend.id
  ip_protocol           = "TCP"
  ports                 = ["80"]
  subnetwork            = google_compute_subnetwork.subnet.name
  region                = "us-central1"
  network               = google_compute_network.vpc_network.name
}

