resource "aws_vpc" "ecsVPC" {
  cidr_block = "200.0.0.0/16"
  tags {
    Name = "ecsVPC"
  }
}

# Internet gateway for the public subnet
resource "aws_internet_gateway" "ecsIG" {
  vpc_id = "${aws_vpc.ecsVPC.id}"
  tags {
    Name = "ecsIG"
  }
}

# Public subnet
resource "aws_subnet" "PubSubnet" {
  vpc_id = "${aws_vpc.ecsVPC.id}"
  cidr_block = "200.0.0.0/24"
  availability_zone = "us-east-1a"
  tags {
    Name = "PubSubnet"
  }
}

# Routing table for public subnet
resource "aws_route_table" "PubSubnet" {
  vpc_id = "${aws_vpc.ecsVPC.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.ecsIG.id}"
  }
  tags {
    Name = "Pubsubnetroute"
  }
}

# Associate the routing table to public subnet
resource "aws_route_table_association" "Pubsubnetroute_associate" {
  subnet_id = "${aws_subnet.PubSubnet.id}"
  route_table_id = "${aws_route_table.Pubsubnetroute.id}"
}

# ECS Instance Security group

resource "aws_security_group" "test_public_sg" {
    name = "test_public_sg"
    description = "Test public access security group"
    vpc_id = "${aws_vpc.ecsVPC.id}"

   ingress {
       from_port = 22
       to_port = 22
       protocol = "tcp"
       cidr_blocks = [
          "0.0.0.0/0"]
   }

   ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = [
          "0.0.0.0/0"]
   }

   ingress {
      from_port = 8080
      to_port = 8080
      protocol = "tcp"
      cidr_blocks = [
          "0.0.0.0/0"]
    }

   ingress {
      from_port = 0
      to_port = 0
      protocol = "tcp"
      cidr_blocks = [
         "${var.test_public_01_cidr}",
         "${var.test_public_02_cidr}"]
    }

    egress {
        # allow all traffic to private SN
        from_port = "0"
        to_port = "0"
        protocol = "-1"
        cidr_blocks = [
            "0.0.0.0/0"]
    }

    tags { 
       Name = "test_public_sg"
     }
}
