project_id           = "sapspecific"
region               = "us-central1"
network_name         = "pay-pal"
subnet_name          = "pay-subnet"
service_account_email = "forsymphony@sapspecific.iam.gserviceaccount.com"
snapshot_name        = "pay-pal-golden-snap-v3"
tags = ["web", "production"]
vms = [
  {
    name         = "demovm"
    machine_type = "e2-standard-8"
    zone         = "us-central1-a"
    private_ip   = "10.0.0.30"
    disks = [
      {
        name    = "demovm-disk1"
        size_gb = 32
        type    = "pd-standard"
      },
      {
        name    = "demovm-disk2"
        size_gb = 32
        type    = "pd-standard"
      }
    ]
  }
]