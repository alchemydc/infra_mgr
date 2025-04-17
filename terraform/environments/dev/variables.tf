# Project variables
variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The default GCP region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "The default GCP zone"
  type        = string
  default     = "us-central1-a"
}

# VM instance variables
variable "instance_name" {
  description = "The name of the VM instance"
  type        = string
}

variable "machine_type" {
  description = "The machine type for the VM instance"
  type        = string
  default     = "n1-standard-1"
}

variable "network_name" {
  description = "The name of the network to use"
  type        = string
  default     = "default"
}

variable "subnetwork_name" {
  description = "The name of the subnetwork to use"
  type        = string
  default     = "default"
}

variable "boot_disk_image" {
  description = "The boot disk image to use"
  type        = string
  default     = "debian-cloud/debian-11"
}

variable "boot_disk_size" {
  description = "The size of the boot disk in GB"
  type        = number
  default     = 50
}

variable "boot_disk_type" {
  description = "The type of the boot disk"
  type        = string
  default     = "pd-standard"
}

variable "service_account_email" {
  description = "The service account email to use for the instance"
  type        = string
  default     = ""  # Will use the default compute service account if empty
}

variable "tags" {
  description = "Network tags to apply to the instance"
  type        = list(string)
  default     = []
}

variable "labels" {
  description = "Labels to apply to the instance"
  type        = map(string)
  default     = {}
}
