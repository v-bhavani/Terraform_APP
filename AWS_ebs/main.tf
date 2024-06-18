resource "aws_ebs_volume" "example_volume" {
  for_each          = var.volumes
  availability_zone = each.value.availability_zone
  size              = each.value.size
  type              = each.value.type

  tags = {
    Name = each.value.tag
  }
}

resource "aws_volume_attachment" "attach_volume" {
  device_name = "/dev/sdh"  # The device name to expose to the instance
  instance_id = var.instance_id
  volume_id   = aws_ebs_volume.example_volume[var.volume_to_attach].id
  force_detach = true  # Optional, if you want to force detach the volume if it's already attached
}