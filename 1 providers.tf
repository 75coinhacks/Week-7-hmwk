# Defines providers for hashicorp/google and hashicorp/local.
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 7.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

provider "google" {
  project = "canopener1"
  region  = "asia-northeast1"
}
