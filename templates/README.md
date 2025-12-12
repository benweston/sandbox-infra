![Ben Weston — Cloud & Software Engineering](/assets/banner.png)

# `./templates`

> Template files that are processed dynamically using Terraform's [`templatefile`](https://developer.hashicorp.com/terraform/language/functions/templatefile) function.   

## Purpose
* **`../files/`**: Static assets (read exactly as-is).   
* **`../templates/`**: Dynamic configs containing placeholders (e.g., `${var_name}`) or logic (loops/if-statements).   

Terraform reads these files, injects the variables you provide in the module, and renders a final string to be used in your infrastructure.   

## File Naming Convention
Use the **`.tftpl`** extension (e.g., `startup.sh.tftpl` or `config.json.tftpl`).   
- **Why?** It clearly indicates that this file is a template and not valid code until rendered.   

## Usage Examples (Google Cloud)

### 1. The Template File
*Located at: `templates/startup-script.sh.tftpl`*
Notice the `${}` syntax. These are the variables Terraform must supply.
```bash
#!/bin/bash
echo "Starting server in environment: ${environment}"
echo "Database Connection: ${db_endpoint}"

# Conditional logic allowed by Terraform templates
%{ if enable_debugging }
echo "Debugging is ON"
set -x
%{ endif }
```
