module "networking" {
  source   = "./netwoking"
  vpc_cidr = "10.0.0.0/16"
  vpc_name = "bond-prod-ap1-vpc"
}
