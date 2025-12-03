variable "do_token" {
  type        = string
  sensitive   = true
  description = "DigitalOcean API token"
}

variable "spaces_access_id" {
  type        = string
  sensitive   = true
  description = "DigitalOcean Spaces Object Storage Access Key"
}

variable "spaces_secret_key" {
  type        = string
  sensitive   = true
  description = "DigitalOcean Spaces Object Storage Secret Key"
}
