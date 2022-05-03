# Parte 2 - Google Cloud Storage

## Pré-requisitos para Execução

Para utilizar o projeto é necessário:

1) Ter instalado previamente o Terraform na máquina. O passo a passo de como realizar
a instalação pode ser encontrado [aqui](https://learn.hashicorp.com/tutorials/terraform/install-cli).
2) Possuir uma conta no [Google Cloud Platform](https://cloud.google.com)
3) Possuir uma [conta de serviço](https://cloud.google.com/iam/docs/service-accounts?hl=pt-br) no Google Cloud Platform

## Como Executar

Para executar o projeto na linha de comando é necessário:

1) Clonar o projeto para o local desejado
2) Adentrar a pasta **parte2** do projeto clonado
3) Adicionar o arquivo **service_account.json** dentro da pasta com as credenciais da conta de serviço do Google Cloud utilizada
4) Executar os seguintes comandos:

```
terraform init
terraform plan
terraform apply
```

## Resultado Esperado

Com o projeto executado espera-se que:

1) Seja criado o projeto **tcc-iac** no Google Cloud
2) Seja criado o _bucket_ **tutorial_iac** dentro do projeto **tcc-iac**
3) Seja criado os arquivos **terraform.tfstate** e **terraform.tfstate.backup** dentro da pasta **state** do _bucket_ **tutorial_iac**

Para maior compreensão do código e conceitos utilizados pode ser acessado o tutorial que este projeto faz parte [aqui](https://devops-para-iniciantes.github.io/IaC/parte2/main.html).
