module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr     = var.vpc_cidr
  project_name = var.project_name
  environment  = var.environment

  public_subnet_cidr   = var.public_subnet_cidr
  public_subnet_2_cidr = var.public_subnet_2_cidr

  private_subnet_cidr   = var.private_subnet_cidr
  private_subnet_2_cidr = var.private_subnet_2_cidr
}

module "security_group" {
  source = "../../modules/security-group"
  vpc_id = module.vpc.vpc_id
}

module "alb" {
  source = "../../modules/alb"

  project_name = var.project_name
  environment  = var.environment

  alb_security_group_id = module.security_group.alb_security_group_id

  public_subnet_1_id = module.vpc.public_subnet_1_id
  public_subnet_2_id = module.vpc.public_subnet_2_id

  vpc_id = module.vpc.vpc_id

  instance_1_id = module.ec2.instance_1_id
  instance_2_id = module.ec2.instance_2_id
}

module "iam" {
  source       = "../../modules/iam"
  project_name = var.project_name
}

module "ec2" {
  source                = "../../modules/ec2"
  project_name          = var.project_name
  environment           = var.environment
  instance_type         = "t2.nano"
  ec2_security_group_id = module.security_group.ec2_security_group_id
  instance_profile_name = module.iam.instance_profile_name
  private_subnet_1_id   = module.vpc.private_subnet_1_id
  private_subnet_2_id   = module.vpc.private_subnet_2_id
}

module "vpc_endpoints" {
  source                = "../../modules/vpc-endpoints"
  vpc_id                = module.vpc.vpc_id
  private_subnet_1_id   = module.vpc.private_subnet_1_id
  private_subnet_2_id   = module.vpc.private_subnet_2_id
  project_name          = var.project_name
  environment           = var.environment
  ec2_security_group_id = module.security_group.ec2_security_group_id
}