# Parte 2 - Google Cloud Storage

Agora, com um entendimento prévio de como funcionam os _resources_ no Terraform utilizando o _provider_ local, podemos verificar a utilização dos _resources_ por meio de um _provider_ externo, nesse caso, o [Google Cloud Platform](https://cloud.google.com/). Para isso, assume-se que o usuário possui uma [conta de serviço](https://cloud.google.com/iam/docs/service-accounts?hl=pt-br), que pode ser criada seguindo a documentação da plataforma.

## Definindo o Provider Google Cloud

Para se iniciar, dentro de uma pasta à sua escolha é necessário criar o primeiro arquivo de configuração do _provider_ com nome  **_provider.tf_**. Ao contrário do que foi feito na [Parte 1](../parte1/main.md), dessa vez criaremos o projeto com separação de arquivos por função a fim de manter uma boa organização do código, de acordo com boas práticas de utilização do Terraform. Assim, dentro do arquivo criado colocaremos o seguinte código:

![Definição inicial do provider](images/provider_config.png)

No código acima temos:

1. A definição do _provider_  ```google```. Lembrando que um _provider_ do Terraform leva sempre a estrutura:

```
    provider "nome_do_provider" {
        parametro_1 = valor
        parametro_2 = valor
        ...
    }
```

2. A utilização do parâmetro ```project```, referente ao nome do projeto que será utilizado no Google Cloud, com o valor ```var.project```.
3. A utilização do parâmetro ```credentials```, referente ao arquivo **_.json_** contendo as credenciais da conta de serviço do usuário. Nesse caso, o valor da variável é especificado como ```file(./service_account.json)```. A utilização do método ```file()``` é para garantir que o valor desejado seja buscado de um **arquivo** localizado no caminho passado.
4. A utilização do parâmetro ```zone```, referente à zona onde deverá estar armazenado o projeto utilizado, com o valor ```var.zone```.

É possível notar que no código acima os parâmetro ```project``` e ```zone``` foram configurados com valores vindos de variáveis ainda não especificadas. Para obter essas variáveis, iremos criar o arquivo que irá contê-las, com nome **_variables.tf_**. Dentro do arquivo criado teremos o seguinte código:

![Definição inicial de variáveis](images/variaveis_inicial.png)

Nesse código temos:

1. A definição da _variable_ ```project``` sem especificação de nenhum parâmetro.
2. A definição da _variable_ ```zone``` sem especificação de nenhum parâmetro.

Com isso, temos as variáveis criadas, porém é necessário especificar os valores que serão atribuídos a elas. Para isso, criaremos o arquivo ```terraform.tfvars```, que possui a extensão **_.tfvars_** que é específica para um arquivo onde serão atribuídos valores à variáveis do Terraform. Nesse arquivo teremos o seguinte código:

![Atribuição dos valores das variáveis](images/valores_variaveis.png)

Nesse código temos:

1. A atribuição do valor ```tcc-iac``` à variável ```project```. Lembrando que pode ser atribuído qualquer nome a essa variável.
2. A atribuição do valor ```us-central1-a``` à variável ```zone```.

Com todos os arquivos gerados corretamente, basta executar o ```plan```, para que o Terraform entenda quais mudanças devem ser realizadas para chegar ao estado desejado, e em seguida o ```apply```, para realização das mudanças planejadas.

Assim, o resultado final após a execução desse código será a criação de um projeto chamado ```tcc-iac``` dentro do Google Cloud. É importante saber que todos os arquivos **_.tf_** disponíveis na pasta onde está sendo executado o Terraform serão levados em consideração durante a criação/modificação da infraestrutura, o que torna possível a separação do código em diferentes arquivos, como foi realizado.
