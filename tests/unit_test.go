package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

// Test only variable validation (no plan needed)
func TestVariableValidation(t *testing.T) {
	t.Parallel()

	testCases := []struct {
		name          string
		vars          map[string]interface{}
		expectError   bool
		errorContains string
	}{
		{
			name: "invalid region",
			vars: map[string]interface{}{
				"ibmcloud_api_key":    "test-key",
				"region":              "invalid-region",
				"resource_group_name": "test-rg",
				"cos_instance_name":   "test-cos",
			},
			expectError:   true,
			errorContains: "Region must be a valid IBM Cloud region",
		},
		{
			name: "cos name too short",
			vars: map[string]interface{}{
				"ibmcloud_api_key":    "test-key",
				"region":              "us-south",
				"resource_group_name": "test-rg",
				"cos_instance_name":   "ab",
			},
			expectError:   true,
			errorContains: "must be between 3 and 63 characters",
		},
	}

	for _, tc := range testCases {
		tc := tc
		t.Run(tc.name, func(t *testing.T) {
			t.Parallel()

			terraformOptions := &terraform.Options{
				TerraformDir: "..",
				Vars:         tc.vars,
			}

			_, err := terraform.InitE(t, terraformOptions)
			assert.NoError(t, err, "Init should succeed")

			_, err = terraform.ValidateE(t, terraformOptions)
			
			if tc.expectError {
				assert.Error(t, err)
				if tc.errorContains != "" {
					assert.Contains(t, err.Error(), tc.errorContains)
				}
			} else {
				assert.NoError(t, err)
			}
		})
	}
}

// Test that valid configuration can be planned
func TestValidConfiguration(t *testing.T) {
	t.Parallel()

	terraformOptions := &terraform.Options{
		TerraformDir: "..",
		Vars: map[string]interface{}{
			"ibmcloud_api_key":    "test-key",
			"region":              "us-south",
			"resource_group_name": "test-rg",
			"cos_instance_name":   "test-cos-instance",
		},
	}

	// This should succeed
	_, err := terraform.InitAndPlanE(t, terraformOptions)
	assert.NoError(t, err, "Valid configuration should plan successfully")
}


