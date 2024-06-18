output "instance_state" {
  value = data.aws_instance.existing_instance.instance_state
}
output "ami_id" {
  value = aws_ami_from_instance.instance_ami_snapshot.id
}
