// main.tf

provider "aws" {
	region = "us-east-1"
}

locals {
	tags = {
		ResourceOwner = var.email
		Name = var.name
		BusinessUnit = "CTP-TERRAFORM"
		EndDate = formatdate("YYYY-MMM-DD", timeadd(timestamp(), "12h"))
	}
}

//resource "aws_instance" "example" {
//	ami = data.aws_ami.amazon_linux_latest.id
//	instance_type = "t2.small"
//	tags = local.tags
//	volume_tags = local.tags
//}

data "aws_ami" "amazon_linux_latest" {
	most_recent = true
	owners = ["amazon"]

	filter {
		name = "name"
		values = ["amzn-ami-hvm-*"]
	}

	filter {
		name = "virtualization-type"
		values = ["hvm"]
	}
}

variable "email" {
	
}

variable "name" {
	
}