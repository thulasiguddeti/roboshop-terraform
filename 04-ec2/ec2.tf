module "mongodb" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  ami = data.aws_ami.centos8.id

  name = "${local.ec2_name}-mongodb"

  instance_type          = "t3.small"
  vpc_security_group_ids = [data.aws_ssm_parameter.mongodb_sg_id.value]
  subnet_id              = local.database_subnet_id
  tags = merge(
    var.common_tags,
    {
        component = "mongodb"
    },
    {
        Name = "${local.ec2_name}-mongodb"
    }
  )
}