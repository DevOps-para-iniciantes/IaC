# Parte 4 - Criando um Compute Engine

## Pré-requisitos para Execução

Para utilizar o projeto é necessário:

1) Ter instalado previamente o Terraform na máquina. O passo a passo de como realizar
a instalação pode ser encontrado [aqui](https://learn.hashicorp.com/tutorials/terraform/install-cli).
2) Possuir uma conta no [Google Cloud Platform](https://cloud.google.com)
3) Possuir uma [conta de serviço](https://cloud.google.com/iam/docs/service-accounts?hl=pt-br) no Google Cloud Platform

## Como Executar

Para executar o projeto na linha de comando é necessário:

1) Clonar o projeto para o local desejado
2) Adentrar a pasta **parte3** do projeto clonado
3) Adicionar o arquivo **service_account.json** dentro da pasta com as credenciais da conta de serviço do Google Cloud utilizada
4) Executar os seguintes comandos:

```
terraform init
terraform plan
terraform apply
```

## Resultado Esperado

Com o projeto executado, o resultado final obtido será o mesmo dos projetos utilizados nas partes 3, sem nenhuma alteração.

Para maior compreensão do código e conceitos utilizados pode ser acessado o tutorial que este projeto faz parte [aqui](https://devops-para-iniciantes.github.io/IaC/parte3/main.html).
