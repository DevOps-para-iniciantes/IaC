# Definição de um resource do tipo 'google_storage_bucket' e nome 'tutorial_bucket'
resource "google_storage_bucket" "tutorial_bucket" {
    name = var.bucket_name
    project = var.project
    location = var.bucket_location
}
