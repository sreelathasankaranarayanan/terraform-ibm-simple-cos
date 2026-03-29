variable "ibmcloud_api_key" {
  description = "IBM Cloud API key"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "IBM Cloud region where resources will be created"
  type        = string
  default     = "us-south"
  
  validation {
    condition     = can(regex("^(us-south|us-east|eu-gb|eu-de|jp-tok|au-syd)$", var.region))
    error_message = "Region must be a valid IBM Cloud region"
  }
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  
  validation {
    condition     = can(regex("^[a-zA-Z0-9-_]+$", var.resource_group_name))
    error_message = "Resource group name must contain only alphanumeric characters, hyphens, and underscores"
  }
}

variable "cos_instance_name" {
  description = "Name of the Cloud Object Storage instance"
  type        = string
  
  validation {
    condition     = length(var.cos_instance_name) >= 3 && length(var.cos_instance_name) <= 63
    error_message = "COS instance name must be between 3 and 63 characters"
  }
}

variable "cos_plan" {
  description = "Service plan for Cloud Object Storage"
  type        = string
  default     = "standard"
  
  validation {
    condition     = contains(["lite", "standard"], var.cos_plan)
    error_message = "COS plan must be either 'lite' or 'standard'"
  }
}

variable "tags" {
  description = "List of tags to apply to resources"
  type        = list(string)
  default     = []
}