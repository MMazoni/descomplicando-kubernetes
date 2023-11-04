resource "aws_key_pair" "k8s_keypair" {
  key_name   = var.key_name
  public_key = file(var.public_key)
  tags = {
    Terraform = true
  }
}

resource "aws_instance" "k8s" {
  count                       = 3
  ami                         = var.ami
  instance_type               = var.instance_type
  vpc_security_group_ids      = var.security_groups
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  key_name                    = aws_key_pair.k8s_keypair.key_name
  tags = {
    Name      = "${var.instance_name}-${count.index + 1}"
    Terraform = true
  }
}
