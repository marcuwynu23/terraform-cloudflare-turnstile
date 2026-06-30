
terraform {
  required_version = ">= 1.0"

  backend "gcs" {}

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 7.38"
    }
  }
}

provider "cloudflare" {
  # api_token = var.cloudflare_api_token
  email   = var.cloudflare_api_email != null ? var.cloudflare_api_email : null
  api_key = var.cloudflare_api_key != null ? var.cloudflare_api_key : null
}
