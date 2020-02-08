terraform {
  required_version = ">= 0.12.8"
}

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region = "${var.region}"
}



#---------------------------------------------------------------------
# module
#---------------------------------------------------------------------
# label
module "label" {
  source    = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.14.1"
  namespace = "${var.namespace}"
  stage     = "${var.stage}"
  name      = "${var.name}"
}



#---------------------------------------------------------------------
# VPC
#---------------------------------------------------------------------
resource "aws_vpc" "vpc" {
  assign_generated_ipv6_cidr_block = "false"
  cidr_block                       = "10.100.0.0/16"
  enable_classiclink               = "false"
  enable_classiclink_dns_support   = "false"
  enable_dns_hostnames             = "false"
  enable_dns_support               = "false"
  instance_tenancy                 = "default"

  tags = {
    Name = "${module.label.id}-vpc"
  }
}
