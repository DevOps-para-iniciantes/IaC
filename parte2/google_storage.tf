# Definição de um resource do tipo 'google_storage_bucket' e nome 'tutorial_bucket'
resource "google_storage_bucket" "tutorial_bucket" {
    name = var.bucket_name
    project = var.project
    location = var.bucket_location
}

# Definição de resources do tipo 'google_storage_bucket_object' para upload dos arquivos state
resource "google_storage_bucket_object" "state" {
    name = "${var.state_folder}/terraform.tfstate"
    source = "./terraform.tfstate"
    bucket = var.bucket_name
    depends_on = [
        google_storage_bucket.tutorial_bucket
    ]
}

resource "google_storage_bucket_object" "state_backup" {
    name = "${var.state_folder}/terraform.tfstate.backup"
    source = "./terraform.tfstate.backup"
    bucket = var.bucket_name
    depends_on = [
        google_storage_bucket.tutorial_bucket
    ]
}
