resource "aws_security_group" "k8s_sg" {
  name        = var.security_group_name
  description = "Allow inbound SSH and HTTP"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    self		= true
  }

  ingress {
    from_port   = 10250
    to_port     = 10259
    protocol    = "tcp"
    self		= true
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name      = var.security_group_name
    Terraform = true
  }
}
