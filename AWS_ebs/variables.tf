variable "volumes" {
  description = "Map of volumes to create"
  type        = map(object({
    availability_zone = string
    size              = number
    type              = string
    tag               = string
  }))
}

variable "instance_id" {
  description = "The ID of the instance to which the EBS volume will be attached"
  type        = string
}

variable "volume_to_attach" {
  description = "The key of the volume to attach from the ebs_volumes map"
  type        = string
} 