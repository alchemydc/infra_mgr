# Compute VM Module

This module creates Google Compute Engine VM instances using the Cloud Foundation Fabric.

## Usage

```hcl
module "vm" {
  source = "../modules/compute-vm"

  project_id  = var.project_id
  name        = "example-vm"
  region      = "us-central1"
  zone        = "us-central1-a"
  machine_type = "n1-standard-1"

  network_interfaces = [{
    network    = "default"
    subnetwork = "default"
  }]

  boot_disk = {
    image = "debian-cloud/debian-11"
    type  = "pd-standard"
    size  = 50
  }

  service_account = {
    email  = "default"
    scopes = ["cloud-platform"]
  }

  tags = ["http-server", "https-server"]
}
```

## Variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project_id | The ID of the project | string | - | yes |
| name | The name of the VM instance | string | - | yes |
| region | The region where the VM will be created | string | - | yes |
| zone | The zone where the VM will be created | string | - | yes |
| machine_type | The machine type to use | string | "n1-standard-1" | no |
| network_interfaces | List of network interfaces | list(object) | - | yes |
| boot_disk | Boot disk configuration | object | - | yes |
| service_account | Service account configuration | object | - | yes |
| tags | Network tags to apply to the instance | list(string) | [] | no |

## Outputs

| Name | Description |
|------|-------------|
| instance_id | The ID of the created instance |
| instance_name | The name of the created instance |
| instance_self_link | The self link of the created instance |
| internal_ip | The internal IP of the instance |
| external_ip | The external IP of the instance (if enabled) |
