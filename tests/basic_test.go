package test

import (
	"fmt"
	"os"
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
)

func TestBasicExample(t *testing.T) {
	t.Parallel()

	// Generate a unique prefix for this test
	prefix := fmt.Sprintf("test-%s", strings.ToLower(random.UniqueId()))

	// Get IBM Cloud API key from environment
	apiKey := os.Getenv("TF_VAR_ibmcloud_api_key")
	require.NotEmpty(t, apiKey, "TF_VAR_ibmcloud_api_key environment variable must be set")

	// Configure Terraform options
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../examples/basic",
		Vars: map[string]interface{}{
			"ibmcloud_api_key": apiKey,
			"region":           "us-south",
			"prefix":           prefix,
		},
		// Upgrade providers and modules
		Upgrade: true,
	})

	// Clean up resources at the end of the test
	defer terraform.Destroy(t, terraformOptions)

	// Run terraform init and apply
	terraform.InitAndApply(t, terraformOptions)

	// Validate outputs
	resourceGroupID := terraform.Output(t, terraformOptions, "resource_group_id")
	assert.NotEmpty(t, resourceGroupID, "Resource group ID should not be empty")

	cosInstanceCRN := terraform.Output(t, terraformOptions, "cos_instance_crn")
	assert.NotEmpty(t, cosInstanceCRN, "COS instance CRN should not be empty")
	assert.Contains(t, cosInstanceCRN, "cloud-object-storage", "CRN should contain cloud-object-storage")

	cosBucketName := terraform.Output(t, terraformOptions, "cos_bucket_name")
	assert.NotEmpty(t, cosBucketName, "COS bucket name should not be empty")
	assert.Contains(t, cosBucketName, prefix, "Bucket name should contain prefix")
}