volumes = {
  volume1 = {
    availability_zone = "us-east-1b"
    size              = 10
    type              = "standard"
    tag               = "terraform-test"
  },
  volume2 = {
    availability_zone = "us-east-1c"
    size              = 20
    type              = "standard"
    tag               = "terraform-test"
  }
}

instance_id = "$var.instanceid"  # Replace with your actual instance ID
volume_to_attach = "volume2"  # Replace with the key of the volume you want to attach
