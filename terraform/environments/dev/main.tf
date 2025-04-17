# Configure provider from root
provider "google" {
  project = var.project_id
  region  = var.region
}

provider "google-beta" {
  project = var.project_id
  region  = var.region
}

# Create VM instance using our module
module "vm_instance" {
  source = "../../modules/compute-vm"

  project_id = var.project_id
  name       = var.instance_name
  region     = var.region
  zone       = var.zone

  machine_type = var.machine_type

  network_interfaces = [{
    network    = var.network_name
    subnetwork = var.subnetwork_name
    access_config = [{
      nat_ip       = null
      network_tier = "PREMIUM"
    }]
  }]

  boot_disk = {
    image = var.boot_disk_image
    type  = var.boot_disk_type
    size  = var.boot_disk_size
  }

  service_account = {
    email  = coalesce(var.service_account_email, "default")
    scopes = ["cloud-platform"]
  }

  tags = var.tags

  labels = merge(var.labels, {
    environment = "dev"
    managed_by  = "terraform"
  })

  metadata = {
    enable-oslogin = "TRUE"
  }

  deletion_protection    = false
  allow_stopping_for_update = true
}
