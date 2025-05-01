resource "google_compute_global_address" "default" {
  name = "lb-ip"
}

resource "google_compute_backend_service" "default" {
  name        = "web-backend"
  protocol    = "HTTP"
  port_name   = "http"
  timeout_sec = 10
  backend {
    group = google_compute_instance_group.web_group.self_link
  }
}

resource "google_compute_url_map" "default" {
  name            = "web-map"
  default_service = google_compute_backend_service.default.self_link
}

resource "google_compute_target_http_proxy" "default" {
  name   = "web-proxy"
  url_map = google_compute_url_map.default.self_link
}

resource "google_compute_global_forwarding_rule" "default" {
  name       = "http-content-rule"
  ip_address = google_compute_global_address.default.address
  target     = google_compute_target_http_proxy.default.self_link
  port_range = "80"
}

