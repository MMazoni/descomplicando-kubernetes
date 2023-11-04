provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

module "vpc" {
  source = "./modules/vpc"

  vpc_name = "k8s-vpc"
  vpc_cidr_block = "10.1.0.0/20"
  availability_zone_name = var.az
}

module "security_group" {
  source = "./modules/security_group"

  security_group_name = "k8s-sg"
  vpc_id              = module.vpc.vpc_id
}

module "ec2" {
  source = "./modules/ec2"

  instance_name   = "k8s"
  vpc_id          = module.vpc.vpc_id
  subnet_id       = module.vpc.subnet_id
  security_groups = [module.security_group.security_group_id]
  aws_profile     = var.aws_profile
  aws_region      = var.aws_region
}
