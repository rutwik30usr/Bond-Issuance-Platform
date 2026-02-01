module "networking" {
  source               = "./netwoking"
  vpc_cidr             = var.vpc_cidr
  vpc_name             = var.vpc_name
  name                 = var.name
  region               = var.region
  cidr_public_subnet   = var.cidr_public_subnet
  cidr_private_subnet  = var.cidr_private_subnet
  ap_availability_zone = var.ap_availability_zone
}
