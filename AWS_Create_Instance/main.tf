provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket-bcs"
    key            = "tf/terraformvm.tfstate"
    region         = "us-east-1"
    use_lockfile  = true
  }
}

resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type

  vpc_security_group_ids = [var.security_group_id]
  subnet_id              = var.subnet_id
  key_name               = var.key_name

  root_block_device {
    volume_size = var.disk_size
    volume_type = var.disk_type
  }

  tags = {
    Name = var.instance_name
    Project = "test"
    Mail = "irfana.j@basiscloudsolutions.com"
  }
}


