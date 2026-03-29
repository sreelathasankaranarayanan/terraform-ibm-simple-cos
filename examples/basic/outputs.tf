output "resource_group_id" {
  description = "Resource group ID"
  value       = module.simple_cos.resource_group_id
}

output "cos_instance_crn" {
  description = "COS instance CRN"
  value       = module.simple_cos.cos_instance_crn
}

output "cos_bucket_name" {
  description = "COS bucket name"
  value       = module.simple_cos.cos_bucket_name
}