// Forwarding rule for Internal Load Balancing
resource "google_compute_forwarding_rule" "default" {
  name   = "website-forwarding-rule"
  region = var.region

  load_balancing_scheme = "INTERNAL"
  backend_service       = google_compute_region_backend_service.backend.id
  all_ports             = true
  network               = google_compute_network.vpc_network.self_link
  
}

resource "google_compute_region_backend_service" "backend" {
  name          = "website-backend"
  region        = var.region
  health_checks = [google_compute_health_check.hc.id]
}

resource "google_compute_health_check" "hc" {
  name               = "check-website-backend"
  check_interval_sec = 1
  timeout_sec        = 1

  tcp_health_check {
    port = "3306"
  }
}