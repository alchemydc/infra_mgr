# Store Terraform state in a GCS bucket
terraform {
  backend "gcs" {
    # These values should be configured during initialization:
    # bucket  = "your-terraform-state-bucket"
    # prefix  = "dev/compute"
  }
}
