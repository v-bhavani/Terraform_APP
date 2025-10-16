vm_names       = "regvm15102025"
username       = "azureadmin"
password       = "azureadmin@123"
subnetname = "default" 
vnetname = "asr-vm-vnet"
RG = "cloud-demo"
location = "East US "
ip = "10.2.0.71"
snapuri = "${tfsnapoutput.snapshot_id.value}"
osdisksize = "32"
vm_size = "Standard D2as v5"
disktype = "Standard_LRS"
bootdiagnostic = "https://testcloud001423.blob.core.windows.net/"
resourcegroup = "cloud-demo"
diskname = "regdisk1"
st_acc_type = "Standard_LRS"
disksize = 32
lun = 1
project = "regression"
duration = "one day"
owner = "Irfana"




