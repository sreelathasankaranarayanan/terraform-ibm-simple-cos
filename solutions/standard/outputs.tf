output "resource_group_id" {
  description = "ID of the created resource group"
  value       = module.simple_cos.resource_group_id
}

output "resource_group_name" {
  description = "Name of the created resource group"
  value       = module.simple_cos.resource_group_name
}

output "cos_instance_id" {
  description = "ID of the Cloud Object Storage instance"
  value       = module.simple_cos.cos_instance_id
}

output "cos_instance_crn" {
  description = "CRN of the Cloud Object Storage instance"
  value       = module.simple_cos.cos_instance_crn
}

output "cos_bucket_name" {
  description = "Name of the COS bucket"
  value       = module.simple_cos.cos_bucket_name
}

output "cos_bucket_crn" {
  description = "CRN of the COS bucket"
  value       = module.simple_cos.cos_bucket_crn
}