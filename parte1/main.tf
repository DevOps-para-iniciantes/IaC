# Definição de um resource do tipo 'local_file' e nome 'tutorial'
resource "local_file" "tutorial" {
    content  = var.conteudo_tutorial
    filename = "arquivos/tutorial.txt"
}

# Definição de uma variable do tipo 'string' e nome 'conteudo_tutorial'
variable "conteudo_tutorial" {
    type = string
    default = "Aproveite o tutorial!"
}
