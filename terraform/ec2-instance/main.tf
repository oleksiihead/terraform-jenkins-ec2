locals {
  ingress_rules = [{
    port        = 443
    description = "Ingress rules for port 443"
    },
    {
      port        = 80
      description = "Ingress rules for port 80"
    },
    {
      port        = 8080
      description = "Ingress rules for port 8080"
  }]
}

resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "${var.proj_name}-${var.env_prefix}-vpc"
  }
}

resource "aws_subnet" "subnet" {
  count             = var.subnet_count
  cidr_block        = var.subnet_cidr_blocks[count.index]
  vpc_id            = aws_vpc.vpc.id
  availability_zone = var.available_zone
  tags = {
    Name = "${var.proj_name}-${var.env_prefix}-subnet-${count.index}"
  }
}

resource "aws_internet_gateway" "inet_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.proj_name}-${var.env_prefix}-internet-gateway"
  }
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = var.route_table_cidr_block
    gateway_id = aws_internet_gateway.inet_gateway.id
  }

  # default route, mapping VPC CIDR block to "local", created implicitly and cannot be specified.

  tags = {
    Name = "${var.proj_name}-${var.env_prefix}-route-table"
  }
}

# Associate subnet with Route Table
resource "aws_route_table_association" "rta" {
  count          = var.subnet_count
  route_table_id = aws_route_table.route_table.id
  subnet_id      = aws_subnet.subnet[count.index].id
}

#data "aws_vpc" "current_vpc" {
#  tags = {
#    Name = "${var.proj_name}-${var.env_prefix}-vpc"
#  }
#}
#
#data "aws_subnet" "data_subnet" {
#  tags = {
#    Name = "${var.proj_name}-${var.env_prefix}-subnet"
#  }
#}

data "aws_availability_zones" "data_zone" {}

data "aws_ami" "aws_linux_image" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_security_group" "sec_group" {
  name   = var.sec_group_name
  vpc_id = data.aws_vpc.current_vpc.id

  dynamic "ingress" {
    for_each = local.ingress_rules

    content {
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      description = ingress.value.description
      protocol    = "tcp"
      cidr_blocks = [var.default_cidr_block]
    }
  }

  tags = {
    Name = "AWS security group dynamic block"
  }

  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = [var.my_ip]
  }

  egress {
    from_port       = 0
    protocol        = "-1"
    to_port         = 0
    cidr_blocks     = ["0.0.0.0/0"]
    prefix_list_ids = []
  }
}

resource "aws_key_pair" "deploy_ssh_key" {
  key_name   = var.ssh_public_key_name
  public_key = file(var.public_key)
}

resource "aws_instance" "ec2_vm" {
  count                       = 1
  ami                         = data.aws_ami.aws_linux_image.id
  instance_type               = var.ec2_instance_type
  key_name                    = aws_key_pair.deploy_ssh_key.key_name
  associate_public_ip_address = true
  subnet_id                   = data.aws_subnet.data_subnet.id
  vpc_security_group_ids      = [aws_security_group.sec_group.id]
  availability_zone           = data.aws_availability_zones.data_zone.names[0]

  tags = {
    Name = "${var.proj_name}-${var.env_prefix}-vm-${count.index}"
  }

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = var.instance_user
    private_key = file(var.private_key)
  }
}
