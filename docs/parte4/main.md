# Utilização de Clusters
- Nesse tópico iremos exemplificar como podemos criar um cluster de kubernetes utilizando o terraform de forma simples e rápida usando algumas IaC. Para aqueles que não sabem, o kubernetes é uma ferramenta de orquestração de containers, iremos criar um cluster principalmente para explicar a utilização do resource que utiliza algumas Compute Engines que foi o tópico da parte 3.

## Explicando o código
### Provider
- O provider que utilizaremos são os mesmos do exemplo 3, por esse motivo não irei me aprofundar nos detalhes de sua implementação.
### kubernetes Engine
- Para criar um kubernetes engine é necessário ter as seguintes variáveis setadas:

|  Variável |Definição   |
|---|---|
|zone   |   É a zona de disponibilidade onde iremos alocar nossa máquina virtual|
| project  | É o nome do nosso projeto no google cloud plataform   |
| cluster_name  | É o nome que daremos ao nosso cluster  |
|machine_type| É o tipo de máquina que vamos escolher, é possível criar máquinas com recursos diferentes(vcpu e memória), nesse caso usaremos uma máquina média|
|node_count| É a quantidade de nós(maquinas virtuais) iremos ter dentro do nosso cluster|


- Após setar essas variáveis em no arquivo `terraform.tfvars` vamos ter o arquivo `cluster.tf` onde tem as configurações referente ao nosso cluster kubernets.

Nesse nosso exemplo utilizaremos 2 resources diferentes para compor o kubernetes, fizemos isso para mostrar alguns detalhes sobre como utilizar resultados da criação de um recurso com outros, criando assim uma dependência.

O primeiro recurso que vamos criar é o cluster, onde temos o código comentado abaixo:

![resources cluster](images/resource-cluster.png)
- Podemos ver a definição de cada recurso e um comentário sobre cada linha onde fica claro a importância de cada variável para a criação do nosso resource.

O segundo resource que iremos criar é o node poll que é responsável por definir quais e quantas máquinas utilizaremos na criação do nosso cluseter como mostra a imagem abaixo:


![resources nós](images/resource-node.png)

- É importante ressaltar que nesse resource usamos algo um pouco diferente do que estamos acostumado, podemos ver que na linha 25 temos o seguinte:
```
cluster = google_container_cluster.my-first-cluster.name
```

- Essa forma de escrever o arquivo .tf nos permite pegar um dado de um recurso que será criado em tempo de execução, vamos supor que nesse caso precisariamos de um id do nosso resource, isso seria muito complicado de se saber antes de cria-lo, por esse motivo podemos setar valores para outros recurso dizendo o `tipo_do_resource.nome_do_resource.variavel_do_resource`.

Agora, antes de executarmos nossos famosos comandos em terraform é necessário fazer algo diferente dos resources anteriores, para criar um cluster no kubernetes engine é necessário acessar a api no gcloud e ativar, para que o terraform possa se comunicar com a API do kubernetes engine e seja criada. Para ativar a api bastar ir na aba de pesquisa pesquisar kubernets engine como e ativar, como mostra as imagens abaixo:

![search k8s](images/search-k8s.png)
![activate k8s](images/active-api.png)

- Depois de ativar, espere uns 3 minutinhos pois demora um tempinho até a API ficar disponível para acesso, e agora sim iremos executar os comando que estamos habituados.

Agora que entendemos todos os aquivos que compõe a criação do no _resource_ vamos executar os comandos abaixo:

```
terraform init
terraform plan
terraform apply
```

E teremos os seguintes resultados no terminal:

![result terminal k8s](images/result-terminal.png)

E teremos também o seguinte resultado no google cloud:
![result gcloud k8s](images/result-gcloud.png)

Extra: 
- Para acessar o cluster após estar com o gcloud totalmente configurado, basta executar o seguinte comando no seu terminal:

```
    gcloud container clusters get-credentials ${cluster_name} --region ${zone} --project ${project}
```
obs: substitua os valores entre `${}` pelos respectivos valores que foram setados dentro do `terraform.tf.vars`, no nosso caso que estamos o `cluster_name` como `tcc-cluster`, a `zone` como `us-central1` e o `project`como `steam-glass-345422` o comando fica dessa forma:

```
gcloud container clusters get-credentials tcc-cluster --region us-central1 --project steam-glass-345422
```  

Para deletar tudo que foi criado basta rodar o comando:
```
terraform destroy
```