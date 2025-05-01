resource "google_compute_vpn_gateway" "gcp_gateway" {
  name    = "webapp-vpn-gateway"
  network = google_compute_network.vpc_network.name
  region  = "us-central1"
}

resource "google_compute_vpn_tunnel" "gcp_tunnel" {
  name               = "webapp-vpn-tunnel"
  region             = "us-central1"
  target_vpn_gateway = google_compute_vpn_gateway.gcp_gateway.id
  peer_ip            = "203.0.113.1"  # IP del gateway on-premise
  shared_secret      = "supersecurevpnsecret"

  ike_version = 2

  local_traffic_selector  = ["10.0.0.0/24"]
  remote_traffic_selector = ["192.168.1.0/24"]
}

resource "google_compute_forwarding_rule" "esp" {
  name        = "vpn-esp"
  region      = "us-central1"
  ip_protocol = "ESP"
  target      = google_compute_vpn_gateway.gcp_gateway.id
}

resource "google_compute_forwarding_rule" "udp500" {
  name        = "vpn-udp500"
  region      = "us-central1"
  ip_protocol = "UDP"
  port_range  = "500"
  target      = google_compute_vpn_gateway.gcp_gateway.id
}

resource "google_compute_forwarding_rule" "udp4500" {
  name        = "vpn-udp4500"
  region      = "us-central1"
  ip_protocol = "UDP"
  port_range  = "4500"
  target      = google_compute_vpn_gateway.gcp_gateway.id
}

