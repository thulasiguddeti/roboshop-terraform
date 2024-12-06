module "mongodb" {
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    vpc_id = data.aws_ssm_parameter.vpc_id.value 
    sg_name = "mongodb"
    sg_description = "SG for mongoDb"
    #sg_ingress_rules = var.mongodb_sg_ingress_rules
}

module "redis" {
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    vpc_id = data.aws_ssm_parameter.vpc_id.value 
    sg_name = "redis"
    sg_description = "SG for redis"
    #sg_ingress_rules = var.mongodb_sg_ingress_rules
}

module "mysql" {
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    vpc_id = data.aws_ssm_parameter.vpc_id.value 
    sg_name = "mysql"
    sg_description = "SG for mysql"
    #sg_ingress_rules = var.mongodb_sg_ingress_rules
}

module "rabbitmq" {
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    vpc_id = data.aws_ssm_parameter.vpc_id.value 
    sg_name = "rabbitmq"
    sg_description = "SG for rabbitmq"
    #sg_ingress_rules = var.mongodb_sg_ingress_rules
}

module "catalogue" {
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    vpc_id = data.aws_ssm_parameter.vpc_id.value 
    sg_name = "catalogue"
    sg_description = "SG for catalogue"
    #sg_ingress_rules = var.mongodb_sg_ingress_rules
}

module "user" {
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    vpc_id = data.aws_ssm_parameter.vpc_id.value 
    sg_name = "user"
    sg_description = "SG for User"
    #sg_ingress_rules = var.mongodb_sg_ingress_rules
}

module "cart" {
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    vpc_id = data.aws_ssm_parameter.vpc_id.value 
    sg_name = "cart"
    sg_description = "SG for cart"
    #sg_ingress_rules = var.mongodb_sg_ingress_rules
}

module "shipping" {
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    vpc_id = data.aws_ssm_parameter.vpc_id.value 
    sg_name = "shipping"
    sg_description = "SG for shipping"
    #sg_ingress_rules = var.mongodb_sg_ingress_rules
}

module "payment" {
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    vpc_id = data.aws_ssm_parameter.vpc_id.value 
    sg_name = "payment"
    sg_description = "SG for payment"
    #sg_ingress_rules = var.mongodb_sg_ingress_rules
}

module "web" {
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    vpc_id = data.aws_ssm_parameter.vpc_id.value 
    sg_name = "web"
    sg_description = "SG for web"
    #sg_ingress_rules = var.mongodb_sg_ingress_rules
}

## mongodb accepting connections from catalogue instance 
resource "aws_security_group_rule" "mongodb_catalogue" {
  source_security_group_id = module.catalogue.sg_id
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  security_group_id = module.mongodb.sg_id 
}

## mongodb accepting connections from user instance 
resource "aws_security_group_rule" "mongodb_user" {
  source_security_group_id = module.user.sg_id
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  security_group_id = module.mongodb.sg_id 
}

## redis accepting connections from user instance 
resource "aws_security_group_rule" "redis_user" {
  source_security_group_id = module.user.sg_id
  type              = "ingress"
  from_port         = 6379
  to_port           = 6379
  protocol          = "tcp"
  security_group_id = module.redis.sg_id 
}

## redis accepting connections from cart instance 
resource "aws_security_group_rule" "redis_cart" {
  source_security_group_id = module.cart.sg_id
  type              = "ingress"
  from_port         = 6379
  to_port           = 6379
  protocol          = "tcp"
  security_group_id = module.redis.sg_id 
}