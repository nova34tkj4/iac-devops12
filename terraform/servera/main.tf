terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }
}

provider "google" {
  project = "devops-batch-4" # Replace with your actual GCP Project ID
  region  = "us-central1"
}



resource "google_storage_bucket" "my_bucket" {
  name          = "bucket-digitalskolahdevops12" # Must be globally unique across GCP
  location      = "US"                        # Can be multi-region (e.g., US, EU) or single region
  storage_class = "STANDARD"

  # Enforces uniform bucket-level access (Recommended for security)
  uniform_bucket_level_access = true

  # Prevents accidental deletion if the bucket contains data
  force_destroy = false 

  # Optional: Automatically delete or transition objects after a specified time
  lifecycle_rule {
    condition {
      age = 30 # Days
    }
    action {
      type = "Delete"
    }
  }
}
