![Ben Weston — Cloud & Software Engineering](/assets/banner.png)

# `./files`

> Static assets that are referenced, read, or uploaded by Terraform, but **never executed**.   

## Purpose
* **`../scripts/`**: Executable code (Python, Bash) that runs logic.   
* **`../files/`**: Static configuration or data (JSON, YAML, Txt, Init configs).   

Terraform typically uses these files with the `file()`, `templatefile()`, or `jsonencode()` functions, or uploads them directly to services like Google Cloud Storage or Cloud Run functions.   

## Directory Structure

Organise files by resource type rather than environment to keep the structure flat.   

## :no_entry_sign: What NOT to Put Here
1. **Secrets:** Never commit passwords, API keys, or private keys here. Use a Secret Manager or environment variables.   
2. **Large Binaries:** Avoid committing files larger than **10MB**.   
   * _Alternative_: Upload large artifacts to a Google Cloud Storage bucket or Artifactory and reference the URL in Terraform.   
3. **Templated Logic:** If a file requires heavy logic (loops/conditionals) to generate, consider keeping it inside the Terraform module code using `templatefile()` rather than storing a static version here.   

## Usage Examples
**Reading a simple file:**   
```hcl
resource "google_monitoring_dashboard" "app_dashboard" {
  # Reads a static JSON definition for a Cloud Monitoring dashboard
  dashboard_json = file("${path.module}/../../files/dashboards/app-stats.json")
}
```
