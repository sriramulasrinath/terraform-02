### VPC ###
resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = var.dns_hostname
  tags = merge(
    var.common_tags,
    var.vpc_tags,
  {
    Name = local.resource_name
  }
  ) 
}
### INTERNET GATEWAY ###
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.common_tags,
    var.ig_tags,
  {
    Name = local.resource_name
  }
  ) 
}

### Create Public Subnet ###
resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidrs)
  vpc_id     = aws_vpc.main.id
  availability_zone = local.az_names[count.index]
  cidr_block = var.public_subnet_cidrs[count.index]

  tags = merge(
    var.common_tags,
    var.public_subnet_cidrs_tags,
  {
    Name = "${local.resource_name}-Public-${local.az_names[count.index]}"
  }
  )
}
### Create Private Subnet ###
resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidrs)
  vpc_id     = aws_vpc.main.id
  availability_zone = local.az_names[count.index]
  cidr_block = var.private_subnet_cidrs[count.index]

  tags = merge(
    var.common_tags,
    var.private_subnet_cidrs_tags,
  {
    Name = "${local.resource_name}-Private-${local.az_names[count.index]}"
  }
  )
}
### Create database Subnet ###
resource "aws_subnet" "database" {
  count = length(var.database_subnet_cidrs)
  vpc_id     = aws_vpc.main.id
  availability_zone = local.az_names[count.index]
  cidr_block = var.database_subnet_cidrs[count.index]

  tags = merge(
    var.common_tags,
    var.database_subnet_cidrs_tags,
  {
    Name = "${local.resource_name}-database-${local.az_names[count.index]}"
  }
  )
}