module "simple_cos" {
  source = "../.."

  ibmcloud_api_key    = var.ibmcloud_api_key
  region              = var.region
  resource_group_name = "${var.prefix}-rg"
  cos_instance_name   = "${var.prefix}-cos"
  cos_plan            = "standard"
  tags                = ["terraform", "example"]
}