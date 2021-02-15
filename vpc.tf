resource "aws_vpc" "main" {
  cidr_block       = "172.20.0.0/16"

  tags = {
    Name = format("loylogic-%s-vpc", var.account_environment)
  }
}

resource "aws_subnet" "public-subnet-1" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "172.20.10.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-2a"
    tags = {
        Name = format("loylogic-%s-public-subnet-1", var.account_environment)
    }
}

resource "aws_subnet" "public-subnet-2" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "172.20.11.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-2b"
    tags = {
        Name = format("loylogic-%s-public-subnet-2", var.account_environment)
    }
}

resource "aws_subnet" "private-subnet-1" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "172.20.20.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "us-east-2a"
    tags = {
        Name = format("loylogic-%s-private-subnet-1", var.account_environment)
    }
}

resource "aws_subnet" "private-subnet-2" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "172.20.21.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "us-east-2b"
    tags = {
        Name = format("loylogic-%s-private-subnet-2", var.account_environment)
    }
}

