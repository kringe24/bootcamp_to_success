terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.26.0"
    }
  }
}

provider "google" {
  # Configuration options

  project = "forsakened-project"
  region = "us-east1"
  zone = "us-east1-a"
  credentials = "forsakened-project-c26317bbdcfa.json"

}

resource "google_storage_bucket" "no-bucket-soon" {
  name          = "bucket-go-bye-bye"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}