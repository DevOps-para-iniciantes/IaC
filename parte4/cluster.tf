// Definindo tipo de resource que vai ser utilizado para o nó master e cluster
resource "google_container_cluster" "my-first-cluster"{
    name = var.cluster_name
    location= var.zona

    remove_default_node_pool = true
    initial_node_count = 1

    master_auth {
        username = ""
        password = ""

        client_certificate_config{
            issue_client_certificate = false
        }
    }
}

resource "google_container_node_pool" "my-first-cluster_node" {
    name = "my-node-custom"
    location = "us-central1"
    cluster = google_container_cluster.my-first-cluster.name
    node_count = var.node_count

    node_config{
        preemptible = true
        machine_type = var.machine_type
        metadata = {
            disable-legacy-endpoints = "true"
        }
        oauth_scopes = [
            "https://www.googleapis.com/auth/cloud-platform"
        ]
    }
}