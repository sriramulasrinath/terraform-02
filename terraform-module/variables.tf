###Project ###
variable "project_name" {
    default = {}
}
variable "environment" {
    default = "dev"
}
variable "common_tags" {
    default = {
    }
}
## VPC ####
variable "vpc_tags" {
    default = {}
  
}
variable "vpc_cidr" {
    default = "10.0.0.0/16"
}
variable "dns_hostname" {
    default = true
  
}
### Internet Gateway ###
variable "ig_tags" {
    default = {}
}
### Public Subnet ###
variable "public_subnet_cidrs" {
    type = list 
    validation {
      condition = length(var.public_subnet_cidrs) == 2
      error_message = "Please provide 2 valid subnet CIDRS"
    }
}
variable "public_subnet_cidrs_tags" {
    default = {}
}
### Private Subnet ###
variable "private_subnet_cidrs" {
    type = list 
    validation {
      condition = length(var.private_subnet_cidrs) == 2
      error_message = "Please provide 2 valid subnet CIDRS"
    }
}
variable "private_subnet_cidrs_tags" {
    default = {}
}
### database Subnet ###
variable "database_subnet_cidrs" {
    type = list 
    validation {
      condition = length(var.database_subnet_cidrs) == 2
      error_message = "Please provide 2 valid subnet CIDRS"
    }
}
variable "database_subnet_cidrs_tags" {
    default = {}
}