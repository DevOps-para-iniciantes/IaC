provider "google" {
  project = var.project
  credentials = file("./service_account.json")
  zone = var.zone
}

terraform {
  backend "gcs" {
    bucket  = "tutorial_iac"
    prefix  = "terraform/state"
    credentials = "./service_account.json"
  }
}