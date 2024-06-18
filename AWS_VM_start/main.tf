provider "aws" {
  region  = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "terraform-bucket-bcs-demo"
    key            = "tf/terraformstart.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
  }
}
data "aws_instance" "existing_instance" {
  instance_id = var.instance_id
}

resource "aws_ec2_instance_state" "existing_instance" {
  instance_id = data.aws_instance.existing_instance.id
  state       = "running"
  provisioner "local-exec" {
    command = "echo Instance started."
  }
}
