variable "aws_region" {
  description = "AWS region where the instance is located"
  default     = "us-east-1"  # Replace with your instance's region
}

variable "instance_id" {
  description = "ID of the instance to be started"
}
