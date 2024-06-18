variable "aws_region" {
  description = "The AWS region where the instance is running"
  type        = string
}

variable "instance_id" {
  description = "The ID of the instance to create an AMI from"
  type        = string
}

variable "ami_name" {
  description = "The name for the new AMI"
  type        = string
}

