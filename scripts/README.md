# `./scripts`

> Custom scripts used by Terraform to perform tasks that fall outside the capabilities of native Terraform providers.   

These scripts are typically invoked by Terraform resources using the `external` data source or `local-exec` provisioners.   

## :warning: "Terraform First" Policy
**Note:** This directory should be used sparingly. Before adding a script here, please verify:   
1. Does a native Terraform provider already exist for this task?   
2. Can this be achieved using standard Terraform functions?   

Native HCL is preferred over custom scripts to maintain state consistency and portability.   

## Usage & Contract

### 1. Invocation
These scripts are designed to run non-interactively. They generally accept inputs via **STDIN** or **Arguments** and output JSON to **STDOUT**.   

**Example Terraform Call:**   
```hcl
data "external" "example" {
  program = ["bash", "${path.module}/../../scripts/example-lookup.sh"]

  query = {
    environment = var.environment
  }
}
```
