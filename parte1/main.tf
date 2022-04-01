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

# Recuperando o conteúdo do arquivo 'tutorial.txt' e mostrando na linha de comando
data "local_file" "arquivo_recuperado" {
    filename = resource.local_file.tutorial.filename
    depends_on = [
      local_file.tutorial
    ]
}

output "arquivo_recuperado_output" {
    value = "Id: ${data.local_file.arquivo_recuperado.id}\nConteúdo: ${data.local_file.arquivo_recuperado.content}"
}
