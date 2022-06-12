
# forwarding rule
resource "google_compute_global_forwarding_rule" "default" {
  name                  = "l7-xlb-forwarding-rule"
  ip_protocol           = "TCP"
  load_balancing_scheme = "EXTERNAL"
  port_range            = "80"
  target                = google_compute_target_http_proxy.default.id
}

# http proxy
resource "google_compute_target_http_proxy" "default" {
  name     = "l7-xlb-target-http-proxy"
  url_map  = google_compute_url_map.default.self_link
}

# url map
resource "google_compute_url_map" "default" {
  name            = "l7-xlb-url-map"
  default_service = google_compute_backend_service.default.self_link
}

# backend service with custom request and response headers
resource "google_compute_backend_service" "default" {
  name                    = "backend-service"
  port_name               = "http"
  protocol                = "HTTP"
  load_balancing_scheme   = "EXTERNAL"
  health_checks           = google_compute_health_check.healthcheck.self_link

  backend {
    group                 = google_compute_instance_group_manager.gmanager.instance_group
    balancing_mode        = "RATE"
    max_rate_per_instance = 100
  }
}

resource "google_compute_health_check" "healthcheck" {
  name               = "healthcheck"
  timeout_sec        = 1
  check_interval_sec = 1
  http_health_check {
    port = 80
  }
}
}
