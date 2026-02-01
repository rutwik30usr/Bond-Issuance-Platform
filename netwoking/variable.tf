variable "vpc_cidr"{
    description ="cidr block for the vpc"
}

variable "vpc_name" {
    description = "Name tag for the VPC" 
}

variable "name" {
    description = "Name tag for resources"
}

variable "region" {
  description = "AWS region"
}

variable "cidr_public_subnet" {
    description = "CIDR block for the public subnet"
}

variable "cidr_private_subnet" {
    description = "CIDR block for the private subnet"
}

variable "ap_availability_zone" {
    description = "AWS Availability Zone"

}