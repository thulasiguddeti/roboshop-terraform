terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.31.0" # AWS provider version, not terraform version
    }
  }

  backend "s3" {
    bucket = "daws-tfstate"
    key    = "vpn-1"
    region = "us-east-1"
    dynamodb_table = "daws-tflocking"
  }
}

provider "aws" {
  region = "us-east-1"
}