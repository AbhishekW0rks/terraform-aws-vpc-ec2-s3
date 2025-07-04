provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"
}

module "ec2" {
  source    = "./modules/ec2"
  vpc_id    = module.vpc.vpc_id
  subnet_id = module.vpc.public_subnet_id
  key_name  = var.key_name
}

module "s3" {
  source = "./modules/s3"
}