resource "aws_key_pair" "deployer" {
  key_name   = "terrafrom-automate"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJHzWbReEnnEmDiOjCBA4aEHIr6bX5N/eKcAzdtbjU/k rbbis@RB"

}

resource "aws_default_vpc" "my_default_vpc" {
  tags = {
    Name = "Default VPC"
  }
}


resource "aws_security_group" "my_group" {
  name   = "terrafrom-security-group"
  vpc_id = aws_default_vpc.my_default_vpc.id
}

resource "aws_vpc_security_group_ingress_rule" "allow_HTTPS" {
  security_group_id = aws_security_group.my_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.my_group.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_instance" "my_instance" {
  ami                    = "ami-0b6d9d3d33ba97d99"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.my_group.id]
  key_name               = aws_key_pair.deployer.key_name
  root_block_device {
    volume_size = 10
    volume_type = "gp3"
  }

  tags = {
    Name = "tf-automate-server"
  }

}

resource "aws_ec2_instance_state" "my_instance_state" {
  instance_id = aws_instance.my_instance.id
  state       = "running"
}