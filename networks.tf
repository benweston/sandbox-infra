resource "google_compute_network" "infra_sandbox_vpc" {
  name                    = "infra-sandbox-vpc"
  description             = "Primary Infra - Sandbox VPC (Managed by Terraform)"
  project                 = google_project.infra_sandbox.project_id
  auto_create_subnetworks = false

  depends_on = [
    time_sleep.wait_for_apis
  ]
}

resource "google_compute_subnetwork" "infra_sandbox_subnet" {
  name          = "infra-sandbox-subnet"
  description   = "Primary Infra - Sandbox subnet in ${var.gcp_region} (Managed by Terraform)"
  project       = google_project.infra_sandbox.project_id
  region        = var.gcp_region
  network       = google_compute_network.infra_sandbox_vpc.id
  ip_cidr_range = var.infra_sandbox_subnet_cidr
}
