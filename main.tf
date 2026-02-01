module "networking" {
  source               = "./netwoking"
  vpc_cidr             = "10.0.0.0/16"
  vpc_name             = "bond-prod-ap1-vpc"
  name                 = "bond-prod-ap1"
  region               = "ap-south-1"
  cidr_public_subnet   = ["10.0.1.0/24", "10.0.2.0/24"]
  cidr_private_subnet  = ["10.0.3.0/24", "10.0.4.0/24"]
  ap_availability_zone = ["ap-south-1a", "ap-south-1b"]
}
