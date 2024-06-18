provider "aws" {
  region = var.aws_region
}

# S3 backend configuration for state storage
terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket-bcs"
    key            = "tf/stateami.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}

# Fetch details about the existing instance
data "aws_instance" "existing_instance" {
  instance_id = var.instance_id
}

# Create an AMI from the existing instance
resource "aws_ami_from_instance" "example" {
  name               = var.ami_name
  source_instance_id = var.instance_id
}
