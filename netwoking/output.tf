output "aws_vpc_id" {
    description = "The ID of the VPC"
    value = aws_vpc.bond-prod-ap1-vpc.id
  
}


output "internet_gateway_id" {
    description = "The ID of the Internet Gateway"
    value = aws_internet_gateway.bond-prod-ap1-igw.id   
  
}
