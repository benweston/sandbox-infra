terraform {
  backend "gcs" {
    bucket = "tfstate-393781"
    prefix = "infra-sandbox/sandbox/"
  }
}
