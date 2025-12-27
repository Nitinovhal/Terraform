module "vpc" {
  source                 = "../../modules/vpc"
  name                   = "dev"
  cidr                   = "10.0.0.0/16"
  azs                    = var.azs
}

module "kms" {
  source = "../../modules/kms"
}

module "secrets" {
  source     = "../../modules/secrets-manager"
  name       = "dev/db-secrets"
  kms_key_id = module.kms.kms_key_id
}

module "rds" {
  source      = "../../modules/rds"
  subnet_ids  = module.vpc.private_subnet_ids
  username    = "app"
  password    = "changeme"
  kms_key_id  = module.kms.kms_key_id
}

module "deploy" {
  source      = "../../modules/deploy-docker-compose"
  ami_id      = var.ami_id
  instance_type = var.instance_type
  subnet_id   = element(module.vpc.private_subnet_ids, 0)
  vpc_id      = module.vpc.vpc_id
}

module "alb" {
  source          = "../../modules/lb"
  subnet_ids      = module.vpc.public_subnet_ids
  security_groups = [module.deploy.app_sg_id]
  vpc_id          = module.vpc.vpc_id
}

output "alb_dns" {
  value = module.alb.dns_name
}

output "db_endpoint" {
  value = module.rds.endpoint
}
