# `./examples/`

> Example implementations and patterns for `sandbox-infra`.  Designed to demonstrate how to consume modules in this repository and provide standalone references for common infrastructure setups.   

### Prerequisites

Before running any example, ensure you have the following installed:   

- [Terraform](https://developer.hashicorp.com/terraform/install) (v1.3.0+)
- [Google Cloud SDK](https://docs.cloud.google.com/sdk/docs/install-sdk) (gcloud)   
- Access to a Google Cloud Project with billing enabled   

### General Usage

1.  **Navigate** to the specific example directory:
    ```bash
    cd examples/<example-module>
    ```

2.  **Authenticate** with your cloud provider:
    ```bash
    gcloud auth application-default login
    ```

3.  **Initialize** Terraform to download providers:
    ```bash
    terraform init
    ```

4.  **Configure** variables (copy the example file):
    ```bash
    cp terraform.tfvars.example terraform.tfvars
    # Edit terraform.tfvars with your specific Project ID and Region
    ```

5.  **Apply** the configuration:
    ```bash
    terraform apply
    ```