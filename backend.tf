terraform {
  backend "s3" {
    bucket = "bond-issuance-platform-terraform-state"
    key    = "s3://bond-issuance-platform-terraform-state/Data"
    region = "ap-south-1"
  }
}