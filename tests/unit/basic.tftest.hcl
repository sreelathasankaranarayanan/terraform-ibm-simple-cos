# Test variable validation
run "validate_region" {
  command = plan

  variables {
    ibmcloud_api_key    = "test-key"
    region              = "us-south"
    resource_group_name = "test-rg"
    cos_instance_name   = "test-cos"
  }

  assert {
    condition     = var.region == "us-south"
    error_message = "Region should be us-south"
  }
}

run "validate_cos_name_length" {
  command = plan

  variables {
    ibmcloud_api_key    = "test-key"
    region              = "us-south"
    resource_group_name = "test-rg"
    cos_instance_name   = "test-cos-instance"
  }

  assert {
    condition     = length(var.cos_instance_name) >= 3
    error_message = "COS instance name must be at least 3 characters"
  }
}
