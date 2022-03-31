provider "google" {
  project = var.project
  credentials = file("./service_account.json")
  zone = var.zone
}
