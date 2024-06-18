provider "aws" {
  region  = "us-east-1"
}
terraform {
  backend "s3" {
    bucket         = "terraform-bucket-bcs-demo"
    key            = "tf/terraformstop.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
  }
}
###This is applicable for taking snapshot of existing instance

data "aws_instance" "existing_instance" {
  instance_id = var.instance_id
}

resource "aws_ec2_instance_state" "existing_instance" {
  instance_id = data.aws_instance.existing_instance.id
  state       = "stopped"
  provisioner "local-exec" {
    command = "echo Instance stopped."
  }
}


# Create AMI snapshot from the stopped instance
resource "aws_ami_from_instance" "instance_ami_snapshot" {
  name    = "example-instance-ami"
  source_instance_id = data.aws_instance.existing_instance.id
  description = "AMI snapshot created from example instance"
  tags = {
    Name        = "example-instance-ami-bcs-devops"
    Environment = "dev"
  }
  depends_on = [aws_ec2_instance_state.existing_instance]
}
