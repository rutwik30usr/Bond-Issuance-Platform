resource "aws_vpc" "bond-prod-ap1-vpc" {
  cidr_block = var.vpc_cidr

    tags = {
        Name = var.vpc_name
        created_by = "terraform"     
    }
}