module "vm" {
    source = "../parte3"
    zone = "us-central1-a"
    project = "tcc-iac"
    vm_name = "tcc-vm"
    machine_type = "e2-medium"
    image_so = "debian-cloud/debian-9"
}

module "k8s"{
    source = "../parte4"
    zona = "us-central1"
    project = "tcc-iac"
    node_count  = 1
    cluster_name = "tcc-cluster"
    machine_type = "e2-small"
}