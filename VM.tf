provider "google" {
  project = "mi-proyecto-web"
  region  = "us-central1"
  zone    = "us-central1-a"
}

resource "google_compute_instance" "default" {
  name         = "web-app-vm"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    sudo apt update
    sudo apt install -y nginx
  EOT
}

