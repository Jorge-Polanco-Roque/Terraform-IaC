resource "google_compute_shared_vpc_host_project" "host" {
  project = "host-project-id"
}

resource "google_compute_shared_vpc_service_project" "service" {
  host_project    = "host-project-id"
  service_project = "service-project-id"
}

