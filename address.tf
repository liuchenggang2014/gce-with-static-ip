resource "google_compute_address" "ip_address" {
  name = "tf-address-1"
  region = "us-central1"
  address_type = "EXTERNAL"
}