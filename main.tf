
resource "google_compute_target_pool" "default-target" {
  region = var.region
  name   = var.target-pool-name
}


resource "google_compute_autoscaler" "asg" {
  zone   = var.zone
  name   = var.autoscaler
  target = google_compute_instance_group_manager.gmanager.id
  autoscaling_policy {
    max_replicas    = var.max_replicas
    min_replicas    = var.min_replicas
    cooldown_period = var.cooldown_period
    cpu_utilization {
      target = var.target
    }
  }
}


resource "google_compute_instance_group_manager" "gmanager" {
  zone = var.zone
  name = var.instance_group_manager_name
  version {
    instance_template = google_compute_instance_template.gcpteam-template.id
    name              = "primary"
  }
  target_pools       = [google_compute_target_pool.default-target.self_link]
  base_instance_name = "gcpteam-base-instance"
}


resource "google_compute_instance_template" "gcpteam-template" {
  name                    = var.instance_template_name
  machine_type            = var.machine_type
  can_ip_forward          = false
#   metadata_startup_script = file("startup.sh")
  metadata = {
    ssh-keys = "centos7:${file("~/.ssh/id_rsa.pub")}"
  }
  disk {
    source_image = var.source_image
  }
  network_interface {
    network = google_compute_network.vpc_network.self_link
    access_config {
    }
  }
}

resource "google_compute_firewall" "allow-http" {
  name    = "test-firewall"
  network = google_compute_network.vpc_network.self_link

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80",]
  }

  source_tags = ["web"]
}
