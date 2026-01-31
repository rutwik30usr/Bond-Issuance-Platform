resource "aws_vpc" "bond-prod-ap1-vpc" {
  cidr_block = var.vpc_cidr

    tags = {
        Name = var.vpc_name
        created_by = "terraform-rutwik"     
    }
}


#Subnet Creation
resource "aws_subnet" "bond-prod-ap1-subnet-public" {
    vpc_id = aws_vpc.bond-prod-ap1-vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-south-1a"

    tags={
        Name = "bond-prod-ap1-subnet"
        created_by = "terraform-rutwik"
    }

}


#subnet Creation
resource "aws_subnet" "bond-prod-ap1-subnet-private" {
    vpc_id = aws_vpc.bond-prod-ap1-vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "ap-south-1b"

    tags={
        Name = "bond-prod-ap1-subnet-private"
        created_by = "terraform-rutwik"
    }
}

#route table creation
resource "aws_route_table" "bond-prod-ap1-route-table" {
    vpc_id = aws_vpc.bond-prod-ap1-vpc.id

    tags={
        Name = "bond-prod-ap1-route-table"
        created_by = "terraform-rutwik"
    }
}   

#route table association
resource "aws_route_table_association" "bond-prod-ap1-route-table-association" {
    subnet_id = aws_subnet.bond-prod-ap1-subnet-public.id
    route_table_id = aws_route_table.bond-prod-ap1-route-table.id

}

#internet gateway creation
resource "aws_internet_gateway" "bond-prod-ap1-igw" {
    vpc_id = aws_vpc.bond-prod-ap1-vpc.id

    tags={
        Name = "bond-prod-ap1-igw"
        created_by = "terraform-rutwik"
    }
}

#gateway attachment
resource "aws_route" "bond-prod-ap1-route" {
    route_table_id = aws_route_table.bond-prod-ap1-route-table.id
    destination_cidr_block = "0.0.0.0/0"    
    gateway_id = aws_internet_gateway.bond-prod-ap1-igw.id
}