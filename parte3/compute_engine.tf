## Define as instancia da máquina virtual
resource "google_compute_instance" "my-first-vm" {
  name         = var.vm_name
  machine_type = var.machine_type
  zone         = var.zone

  # Responsável por escolher a imagem de Sistema operacional
  boot_disk {
    initialize_params {
      image = var.image_so
    }
  }

// Define qual interface de rede vamos usar
  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }
// Define os metadados
  metadata = {
    foo = "bar"
  }
  // Define script inicial que será executado na máquina
  metadata_startup_script = "echo hi > /test.txt"

}