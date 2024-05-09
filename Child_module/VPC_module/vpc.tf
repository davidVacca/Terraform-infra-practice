locals {
  subnet_ids = [
    aws_subnet.public_Subnet_1.id,
    aws_subnet.public_Subnet_2.id,
    aws_subnet.public_Subnet_3.id
  ]
}

resource "aws_vpc" "aws_vpc_us_east_1" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"

  tags = {
    Name = var.tag_name
  }
}

resource "aws_subnet" "public_Subnet_1" {
  vpc_id     = aws_vpc.aws_vpc_us_east_1.id
  cidr_block = var.cidr_block_public1 #"192.168.21.0/24"

  tags = {
    Name = "public_Subnet_1"
  }
}

resource "aws_subnet" "public_Subnet_2" {
  vpc_id     = aws_vpc.aws_vpc_us_east_1.id
  cidr_block = var.cidr_block_public2 #"192.168.22.0/24"

  tags = {
    Name = "public_Subnet_2"
  }
}

resource "aws_subnet" "public_Subnet_3" {
  vpc_id     = aws_vpc.aws_vpc_us_east_1.id
  cidr_block = var.cidr_block_public3 #"192.168.23.0/24"

  tags = {
    Name = "public_Subnet_3"
  }
}

resource "aws_subnet" "private_Subnet_1" {
  vpc_id     = aws_vpc.aws_vpc_us_east_1.id
  cidr_block = var.cidr_block_private1 #"192.168.31.0/24"

  tags = {
    Name = "private_Subnet_1"
  }
}

resource "aws_subnet" "private_Subnet_2" {
  vpc_id     = aws_vpc.aws_vpc_us_east_1.id
  cidr_block = var.cidr_block_private2 #"192.168.32.0/24"

  tags = {
    Name = "private_Subnet_2"
  }
}

resource "aws_subnet" "private_Subnet_3" {
  vpc_id            = aws_vpc.aws_vpc_us_east_1.id
  cidr_block        = var.cidr_block_private3 #"192.168.33.0/24"
  availability_zone = ""

  tags = {
    Name = "private_Subnet_3"
  }
}


resource "aws_internet_gateway" "igw_vpc_virginia" {
  vpc_id = aws_vpc.aws_vpc_us_east_1.id

  tags = {
    Name = "igw_vpc_virginia"
  }
}

resource "aws_route_table" "public_Rt" {
  vpc_id = aws_vpc.aws_vpc_us_east_1.id

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.igw_vpc_virginia.id
  }

  tags = {
    Name = "public_Rt"
  }
}

resource "aws_route_table_association" "public_Rt_associate" {
  count          = length(local.subnet_ids)
  subnet_id      = local.subnet_ids[count.index]
  route_table_id = aws_route_table.public_Rt.id
}
