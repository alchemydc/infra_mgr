locals {
  network_interfaces = [
    for interface in var.network_interfaces : {
      network    = interface.network
      subnetwork = interface.subnetwork
      network_ip = lookup(interface, "network_ip", null)
      access_config = lookup(interface, "access_config", null) != null ? [
        for config in interface.access_config : {
          nat_ip       = lookup(config, "nat_ip", null)
          network_tier = lookup(config, "network_tier", "PREMIUM")
        }
      ] : []
    }
  ]
}

module "compute_instance" {
  source = "github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/compute-vm"

  project_id = var.project_id
  name       = var.name
  zone       = var.zone
  region     = var.region

  network_interfaces = local.network_interfaces
  
  instance_type = var.machine_type
  
  boot_disk = {
    image        = var.boot_disk.image
    type         = var.boot_disk.type
    size         = var.boot_disk.size
    auto_delete  = coalesce(var.boot_disk.auto_delete, true)
    encrypt      = var.boot_disk.encryption_key != null
    kms_key_self_link = var.boot_disk.encryption_key
  }

  service_account = {
    email  = var.service_account.email
    scopes = var.service_account.scopes
  }

  tags = var.tags

  metadata = merge(
    var.metadata,
    var.startup_script != "" ? {
      startup-script = var.startup_script
    } : {}
  )

  labels = var.labels

  deletion_protection    = var.deletion_protection
  allow_stopping_for_update = var.allow_stopping_for_update
}
