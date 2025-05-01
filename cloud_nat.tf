resource "google_compute_router" "nat_router" {
  name    = "webapp-nat-router"
  network = google_compute_network.vpc_network.name
  region  = "us-central1"
}

resource "google_compute_router_nat" "nat_config" {
  name                               = "webapp-nat-config"
  router                             = google_compute_router.nat_router.name
  region                             = "us-central1"
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}

