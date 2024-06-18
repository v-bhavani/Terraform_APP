provider "aws" {
  region  = "us-east-1"
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
