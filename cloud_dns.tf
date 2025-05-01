resource "google_dns_managed_zone" "public_zone" {
  name        = "webapp-zone"
  dns_name    = "webapp.example.com."
  description = "Zona DNS para la webapp"
  visibility  = "public"
}

resource "google_dns_record_set" "a_record" {
  name         = "www.webapp.example.com."
  type         = "A"
  ttl          = 300
  managed_zone = google_dns_managed_zone.public_zone.name
  rrdatas      = [google_compute_address.static_ip.address]
}


