
resource "aws_security_group" "instance_sg" {
  name   = "terraform-lab-instance-sg"
  vpc_id = var.vpc_id

  tags = {
    Name = "terraform-lab-instance-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tcp_ipv4" {
  security_group_id = aws_security_group.instance_sg.id
  cidr_ipv4         = var.admin_cidr
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.instance_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["137112412989"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "instance" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t3.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.instance_sg.id]

  tags = {
    Name = "terraform-lab-instance"
  }
}
