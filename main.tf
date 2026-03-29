# Resource Group
resource "ibm_resource_group" "resource_group" {
  name = var.resource_group_name
  tags = var.tags
}

# Cloud Object Storage Instance
resource "ibm_resource_instance" "cos_instance" {
  name              = var.cos_instance_name
  service           = "cloud-object-storage"
  plan              = var.cos_plan
  location          = "global"
  resource_group_id = ibm_resource_group.resource_group.id
  tags              = var.tags
}

# COS Bucket
resource "ibm_cos_bucket" "bucket" {
  bucket_name          = "${var.cos_instance_name}-bucket"
  resource_instance_id = ibm_resource_instance.cos_instance.id
  region_location      = var.region
  storage_class        = "standard"
}