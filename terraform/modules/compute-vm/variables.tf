variable "project_id" {
  description = "The ID of the project where this VM will be created"
  type        = string
}

variable "name" {
  description = "The name of the VM instance"
  type        = string
}

variable "region" {
  description = "The region where the VM will be created"
  type        = string
}

variable "zone" {
  description = "The zone where the VM will be created"
  type        = string
}

variable "machine_type" {
  description = "The machine type to use for the VM instance"
  type        = string
  default     = "n1-standard-1"
}

variable "network_interfaces" {
  description = "List of network interface configurations for the VM instance"
  type = list(object({
    network    = string
    subnetwork = string
    network_ip = optional(string)
    access_config = optional(list(object({
      nat_ip       = optional(string)
      network_tier = optional(string)
    })))
  }))
}

variable "boot_disk" {
  description = "Boot disk configuration for the VM instance"
  type = object({
    image = string
    type  = string
    size  = number
    auto_delete = optional(bool, true)
    encryption_key = optional(string)
  })
}

variable "service_account" {
  description = "Service account configuration for the VM instance"
  type = object({
    email  = string
    scopes = list(string)
  })
}

variable "tags" {
  description = "Network tags to apply to the VM instance"
  type        = list(string)
  default     = []
}

variable "metadata" {
  description = "Metadata key/value pairs to make available from within the instance"
  type        = map(string)
  default     = {}
}

variable "startup_script" {
  description = "Startup script to run when the VM instance starts"
  type        = string
  default     = ""
}

variable "labels" {
  description = "Labels to apply to the VM instance"
  type        = map(string)
  default     = {}
}

variable "deletion_protection" {
  description = "Enable deletion protection on this instance"
  type        = bool
  default     = false
}

variable "allow_stopping_for_update" {
  description = "Allow stopping the instance for updates to machine_type and other properties"
  type        = bool
  default     = true
}
