# Definição do provider e informações necessárias para acessá-lo
provider "google" {
    project = var.project
    credentials = file("./service_account.json")
    zone = var.zone
}
