variable "aws_region" {
  description = "AWS region where the instance is running"
  default     = "us-east-1"  # Replace with your AWS region
}

variable "instance_id" {
  description = "ID of the EC2 instance to stop"
}
