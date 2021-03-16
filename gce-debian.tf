resource "google_compute_instance" "debian10" {
  name         = "cliu201-debian10"
  machine_type = "custom-1-2048"
  zone         = "us-central1-c"

  tags = ["http-server", "https-server"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  // Local SSD disk
#   scratch_disk {
#     interface = "SCSI"
#   }

  network_interface {
    network = "default"

    access_config {
    #   nat_ip = google_compute_address.ip_address.address
      // static IP
    }
  }


  allow_stopping_for_update = "true"

#   metadata = {
#     foo = "bar"
#   }

#   metadata_startup_script = "echo hi > /test.txt"

  service_account {
    scopes = ["cloud-platform"]
  }
}