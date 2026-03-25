project_id           = "mymigration-322809"
region               = "us-central1"
network_name         = "appserver-testing"
subnet_name          = "appserver-testing1"
service_account_email = "gcp-terraform@mymigration-322809.iam.gserviceaccount.com"
snapshot_name        = "ansiblegloden"
tags = ["project", "terraform"]
vms = [
  {
    name         = "terraformvm"
    machine_type = "e2-standard-4"
    zone         = "us-central1-a"
    private_ip   = "10.10.20.20"
    disks = [
      {
        name    = "terraformvmdisk1"
        size_gb = "4"
        type    = "pd-standard"
      },
      {
        name    = "terraformvmdisk2"
        size_gb = "10"
        type    = "pd-standard"
      }
    ]
  }
]
