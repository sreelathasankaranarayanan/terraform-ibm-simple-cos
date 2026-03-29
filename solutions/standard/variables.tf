variable "ibmcloud_api_key" {
  description = "IBM Cloud API key used to deploy resources"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "IBM Cloud region where resources will be created"
  type        = string
  default     = "us-south"
}

variable "resource_group_name" {
  description = "Name of the resource group to create"
  type        = string
}

variable "cos_instance_name" {
  description = "Name of the Cloud Object Storage instance to create"
  type        = string
}

variable "cos_plan" {
  description = "Service plan for Cloud Object Storage (lite or standard)"
  type        = string
  default     = "standard"
}

variable "tags" {
  description = "List of tags to apply to all resources"
  type        = list(string)
  default     = ["deployable-architecture"]
}