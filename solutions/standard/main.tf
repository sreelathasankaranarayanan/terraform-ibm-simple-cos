##############################################################################
# Simple COS Deployable Architecture
##############################################################################

module "simple_cos" {
  source = "../.."

  ibmcloud_api_key    = var.ibmcloud_api_key
  region              = var.region
  resource_group_name = var.resource_group_name
  cos_instance_name   = var.cos_instance_name
  cos_plan            = var.cos_plan
  tags                = var.tags
}