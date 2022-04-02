module "vm" {
    source = "../parte3"
    zone = "us-central1-a"
    project = "tcc-iac"
    vm_name = "tcc-vm"
    machine_type = "e2-medium"
    image_so = "debian-cloud/debian-9"
}