project_id           = "$projectid"
region               = "$region"
network_name         = "$vpc"
subnet_name          = "$subnet"
service_account_email = "$service_account"
snapshot_name        = "$snapshot"
tags = ["$tag1", "$tag2"]
vms = [
  {
    name         = "$vmname"
    machine_type = "$vmtype"
    zone         = "$zone"
    private_ip   = "$private_ip"
    disks = [
      {
        name    = "$disk1_name"
        size_gb = $disk1_size
        type    = "$disk_type"
      },
      {
        name    = "$disk2_name"
        size_gb = $disk2_size
        type    = "$disk_type"
      }
    ]
  }
]
