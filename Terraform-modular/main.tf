provider "aws" {
    region = "eu-north-1"
    shared_credentials_files = ["/home/muhammadnoumansaeed/.aws/credentials"]
}


module "vpc" {
    source = "./modules/vpc" 
    # cidr_block = "11.0.0.0/16"
    # public_subnet_cidr = "11.0.1.0/24"
    # private_subnet_cidr =  "11.0.3.0/24"   
}

module "s3" {
    source = "./modules/s3"
}

# terraform {
#   backend "s3" {
#     bucket = "tfstatefilebkt"
#     key = "home/muhammadnoumansaeed/devops/Terraform/modulebaselab"
#     region = "eu-north-1"
#     encrypt = true
    
#   }
# }

module "security_group" {
    source = "./modules/security_groups"
    vpc_id = module.vpc.vpc_id
  
}

module "ec2" {
    source = "./modules/ec2"
    subnet_id = module.vpc.public_subnet_id
    security_group_ids = [module.security_group.sg_id]
}

module "ecr" {
    source = "./modules/ecr"
}

module "ecs" {
    source = "./modules/ecs"
    task_definition_arn = module.ecs_task.task_definition_arn
    subnets = [module.vpc.public_subnet_id]
    security_groups = [module.security_group.sg_id]
}


module "ecs_task" {
    source = "./modules/ecs_task"
    family = "djangoo-app"
    execution_role_arn = module.iam.role_arn
    image = "604977880911.dkr.ecr.eu-north-1.amazonaws.com/nouman:1.1"
    container_port    = 8000
}

module "iam" {
    source = "./modules/iam"
}



