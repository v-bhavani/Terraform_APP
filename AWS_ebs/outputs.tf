output "volume_ids" {
  value = { for k, v in aws_ebs_volume.example_volume : k => v.id }
}