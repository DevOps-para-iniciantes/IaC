provider "google" {
  credentials = file("./service_account.json")
  project = var.project
  zone = var.zona
}
