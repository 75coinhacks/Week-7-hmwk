# Virtual Private Cloud (VPC) network

resource "google_compute_instance" "week7classroom" {
  name         = "week7classroom"
  machine_type = "e2-medium"
  zone         = "asia-northeast1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network    = google_compute_network.week7hmwk.id
    subnetwork = google_compute_subnetwork.tokyosound.id

    access_config {
      # Ephemeral public IP
    }
  }

  provisioner "file" {
    source      = "./infra"
    destination = "/home/your-ssh-user/infra"

    connection {
      type        = "ssh"
      user        = "your-ssh-user"
      private_key = file("~/.ssh/id_rsa")
      host        = self.network_interface[0].access_config[0].nat_ip
    }
  }
}
