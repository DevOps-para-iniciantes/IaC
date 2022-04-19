# Parte 1 - Entendendo o Terraform com Local Files

## Pré-requisitos para Execução

Para utilizar o projeto é necessário ter instalado previamente o Terraform na máquina. O passo a passo de como realizar
a instalação pode ser encontrado [aqui](https://learn.hashicorp.com/tutorials/terraform/install-cli).

## Como Executar

Para executar o projeto na linha de comando é necessário:

1) Clonar o projeto para o local desejado
2) Adentrar a pasta **parte1** do projeto clonado
3) Executar os seguintes comandos:

```
Terraform plan
Terraform apply
```

## Resultado Esperado

Com o projeto executado espera-se que:

1) Seja criado um arquivo chamado **tutorial.txt** dentro da pasta **parte1**
2) Seja realizado um print com o conteúdo do arquivo e seu **id** no Terraform