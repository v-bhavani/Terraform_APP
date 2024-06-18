volumes = {
  volume1 = {
    availability_zone = "us-east-1b"
    size              = 10
    type              = "gp2"
    tag               = "terraform-test"
  },
  volume2 = {
    availability_zone = "us-east-1c"
    size              = 20
    type              = "gp2"
    tag               = "terraform-test"
  }
}

instance_id = "i-0ce66b7be11c42040"  # Replace with your actual instance ID
volume_to_attach = "volume1"  # Replace with the key of the volume you want to attach