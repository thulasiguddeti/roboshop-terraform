variable "common_tags" {
  default = {
    Project = "roboshop"
    Environment = "dev"
    Terraform = "true"
  }
}

variable "sg_tags" {
  default = {}
}

variable "project_name" {
  default = "roboshop"
}

variable "environment" {
  default = "dev"
}
variable "mongodb_sg_ingress_rules" {
  default = [
    {
        description       = "Allow port 80" 
        from_port         = 80 #0 means all ports
        to_port           = 80
        protocol          = "tcp"
        cidr_blocks       = ["0.0.0.0/0"]
    },

    {
        description       = "Allow port 443" 
        from_port         = 443 #0 means all ports
        to_port           = 443
        protocol          = "tcp"
        cidr_blocks       = ["0.0.0.0/0"]
    }
  ]

}
