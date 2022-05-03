// Definindo tipo de resource que vai ser utilizado para o cluster
resource "google_container_cluster" "my-first-cluster"{
    // Definir nome do cluster
    name = var.cluster_name
    // Definir zona onde iremos disponibilizar nosso cluster
    location= var.zone
    // Remove a configuração padrão do kuberbetes e usa a configuração que será criada
    remove_default_node_pool = true
    // Define a quantidade inicial de nós(maquinas virutais) que serão utilizadas 
    initial_node_count = 1
    // Tipo de autenticação que será utilizado dentro do nó master
    master_auth {
        client_certificate_config{
            issue_client_certificate = false
        }
    }
}
// Definição de nós que serão utilizados
resource "google_container_node_pool" "my-first-cluster_node" {
    // nome do conjunto de nós
    name = var.cluster_name
    // Definir zona onde iremos disponibilizar nosso cluster
    location = var.zone
    // Usa o nome do cluster que foi criado para definir o valor atribuido a chave cluster
    cluster = google_container_cluster.my-first-cluster.name
    // Quantidade de nós que vamos utilizar 
    node_count = var.node_count
    // Configuração das máquinas que vão ser utilizadas
    node_config{
        preemptible = true
        // O tipo de máquina em cada nó
        machine_type = var.machine_type
        metadata = {
            disable-legacy-endpoints = "true"
        }
        oauth_scopes = [
            "https://www.googleapis.com/auth/cloud-platform"
        ]
    }
}