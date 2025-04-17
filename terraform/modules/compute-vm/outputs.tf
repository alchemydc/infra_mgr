output "instance_id" {
  description = "The ID of the created instance"
  value       = module.compute_instance.instance_id
}

output "instance_name" {
  description = "The name of the created instance"
  value       = module.compute_instance.name
}

output "instance_self_link" {
  description = "The self link of the created instance"
  value       = module.compute_instance.self_link
}

output "internal_ip" {
  description = "The internal IP address of the instance"
  value       = module.compute_instance.internal_ip
}

output "external_ip" {
  description = "The external IP address of the instance (if enabled)"
  value       = module.compute_instance.external_ip
}

output "service_account" {
  description = "The service account configuration used by the instance"
  value       = module.compute_instance.service_account
}

output "network_tags" {
  description = "Network tags assigned to the instance"
  value       = module.compute_instance.network_tags
}
