# Separate VPC generated to not affect any pre existing vpc setups in the env
provider "google" {
  project = var.project_id
  region = var.region
}

# VPC
resource "google_compute_network" "vpc" {
  name = "${var.project_id}-${var.project_name}-vpc"
  auto_create_subnetworks = "false"
}

# Subnet
resource "google_compute_subnetwork" "subnet" {
  name = "${var.project_id}-${var.project_name}-subnet"
  region = var.region
  network = google_compute_network.vpc.name
  ip_cidr_range = "10.10.0.0/24"
}
