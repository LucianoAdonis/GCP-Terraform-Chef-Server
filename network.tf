### NETWORK ###

resource "google_compute_network" "energon" {
  name = "energon"
}

### FIREWALL ###

resource "google_compute_firewall" "chef-fw" {
  name    = "default-chef-ports"
  network = "${google_compute_network.energon.name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22","80", "443", "8080"]
  }

  source_tags = ["chef-firewall-rules"]
  source_ranges = ["0.0.0.0/0"]

}
