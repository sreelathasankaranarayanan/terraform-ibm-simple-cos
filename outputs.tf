output "resource_group_id" {
  description = "ID of the created resource group"
  value       = ibm_resource_group.resource_group.id
}

output "resource_group_name" {
  description = "Name of the created resource group"
  value       = ibm_resource_group.resource_group.name
}

output "cos_instance_id" {
  description = "ID of the Cloud Object Storage instance"
  value       = ibm_resource_instance.cos_instance.id
}

output "cos_instance_crn" {
  description = "CRN of the Cloud Object Storage instance"
  value       = ibm_resource_instance.cos_instance.crn
}

output "cos_bucket_name" {
  description = "Name of the COS bucket"
  value       = ibm_cos_bucket.bucket.bucket_name
}

output "cos_bucket_crn" {
  description = "CRN of the COS bucket"
  value       = ibm_cos_bucket.bucket.crn
}