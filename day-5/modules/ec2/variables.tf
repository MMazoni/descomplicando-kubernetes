variable "instance_name" {}
variable "vpc_id" {}
variable "subnet_id" {}
variable "security_groups" {
  type = list(string)
}
variable "aws_profile" {}
variable "aws_region" {}

variable "ami" {
  description = "Ubuntu Server 22.04 LTS"
  default     = "ami-0a695f0d95cefc163"
}
variable "instance_type" {
  description = "Instance type"
  default     = "t2.micro"
}
variable "key_name" {
  description = "Key pairs name"
  default     = "K8S-Key"
  type        = string
}
variable "public_key" {
  description = "Public SSH key pairs"
  default     = "~/.ssh/id_rsa.pub"
}

variable "private_key" {
  description = "Private SSH key"
  default     = "~/.ssh/id_rsa"
}
