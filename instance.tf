data "google_compute_zones" "available" {}

### CHEF SERVER ###

resource "google_compute_instance" "default" {
  project      = "${var.gcp_project_id}"
  zone         = "${var.region}"
  name         = "${var.name}${count.index}"
  machine_type = "${var.machine_type}"
  count        = 1
  depends_on = ["google_compute_firewall.chef-fw"]

  boot_disk {
    initialize_params {
      image = "${var.machine_image}"
    }
  }

  network_interface {
    network       = "${google_compute_network.energon.name}"
    access_config = {}
  }

  provisioner "file" {
    connection {
      type        = "ssh"
      user        = "${var.user_ssh}"
      private_key = "${file("~/.ssh/${var.user_key}")}"
    }

    source      = "scripts/"
    destination = "/tmp/"
  }

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      agent       = false
      user        = "${var.user_ssh}"
      port        = "22"
      timeout     = "5m"
      private_key = "${file("~/.ssh/${var.user_key}")}"
    }

    inline = [
      "sudo chmod +x /tmp/chef-server.sh",
      "sudo /tmp/chef-server.sh",
      "sudo rm -f /tmp/chef-server.sh"
    ]
  }
}

### CHEF NODES ###

# Meh

