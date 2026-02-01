
#vpc creation
resource "aws_vpc" "bond-prod-ap1-vpc" {
  cidr_block = var.vpc_cidr

    tags = {
        Name = var.vpc_name
        created_by = "${var.name}-rutwik"     
    }
}


#Subnet Creation public resource
resource "aws_subnet" "bond-prod-ap1-subnet-public" {
    count = length(var.cidr_public_subnet)
    vpc_id = aws_vpc.bond-prod-ap1-vpc.id
    cidr_block =var.cidr_public_subnet[count.index]
    availability_zone = var.ap_availability_zone[count.index]

    tags={
        Name = "${var.name}-subnet-public"
        created_by = "${var.name}-rutwik"
    }

}


#subnet Creation for private resources
resource "aws_subnet" "bond-prod-ap1-subnet-private" {
    count=length(var.cidr_private_subnet)
    vpc_id = aws_vpc.bond-prod-ap1-vpc.id
    cidr_block = var.cidr_private_subnet[count.index]
    availability_zone = var.ap_availability_zone[count.index]

    tags={
        Name = "${var.name}-subnet-private"
        created_by = "${var.name}-rutwik"
    }
}



#route table creation for public subnet
resource "aws_route_table" "bond-prod-ap1-route-table-public" {
    vpc_id = aws_vpc.bond-prod-ap1-vpc.id

    route {
    cidr_block = "var.vpc_cidr"
    gateway_id = aws_internet_gateway.bond-prod-ap1-igw.id
  }

    tags={
        Name = "${var.name}-route-table-public"
        created_by = "${var.name}-rutwik"
    }
}   

#route table association
resource "aws_route_table_association" "bond-prod-ap1-route-table-association" {
    count = length(aws_subnet.bond-prod-ap1-subnet-public)
    subnet_id = aws_subnet.bond-prod-ap1-subnet-public[count.index].id
    route_table_id = aws_route_table.bond-prod-ap1-route-table-public.id
}


#route table creation for private subnet
resource "aws_route_table" "bond-prod-ap1-route-table-private" {
    vpc_id = aws_vpc.bond-prod-ap1-vpc.id

    tags={
        Name = "${var.name}-route-table-private"
        created_by = "${var.name}-rutwik"
    }
}

#route table association for private subnet
resource "aws_route_table_association" "bond-prod-ap1-route-table-private-association" {
    count = length(aws_subnet.bond-prod-ap1-subnet-private)
    subnet_id = aws_subnet.bond-prod-ap1-subnet-private[count.index].id
    route_table_id = aws_route_table.bond-prod-ap1-route-table-private.id
}

#internet gateway creation
resource "aws_internet_gateway" "bond-prod-ap1-igw" {
    vpc_id = aws_vpc.bond-prod-ap1-vpc.id

    tags={
        Name = "${var.name}-igw"
        created_by = "${var.name}-rutwik"
    }
}

#internet gateway attachment
resource "aws_internet_gateway_attachment" "bond-prod-ap1-igw-attachment" {
  internet_gateway_id = aws_internet_gateway.bond-prod-ap1-igw.id
  vpc_id              = aws_vpc.bond-prod-ap1-vpc.id
}
