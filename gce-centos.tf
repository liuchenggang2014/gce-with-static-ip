
resource "google_compute_instance" "default" {
  name         = "cliu201-centos8"
  machine_type = "custom-1-2048"
  zone         = "us-central1-c"

  tags = ["http-server", "https-server"]

  boot_disk {
    initialize_params {
      image = "centos-8-v20201014"
    }
  }

  // Local SSD disk
#   scratch_disk {
#     interface = "SCSI"
#   }

  network_interface {
    network = "default"

    access_config {
      nat_ip = google_compute_address.ip_address.address
      // static IP
    }
  }

  hostname = "centos8.cliu201"

  allow_stopping_for_update = "true"

#   metadata = {
#     foo = "bar"
#   }

#   metadata_startup_script = "echo hi > /test.txt"

  service_account {
    scopes = ["cloud-platform"]
  }
}