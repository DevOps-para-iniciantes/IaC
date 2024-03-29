# Conceitos Iniciais

## O que é Infraestrutura como Código?

Infraestrutura como Código ou *Infrastructure as Code* (IaC) é a utilização de uma linguagem de codificação descritiva de alto nível com a intenção de automatizar o provisionamento de uma infraestrutura para armazenamento de *software*. Essa automatização possibilita que desenvolvedores não precisem provisionar e gerenciar servidores manualmente, operar sistemas, conexões de banco de dados, armazenamento, além de outros elementos da infraestrutura sempre que precisam desenvolver, testar e realizar o deploy de aplicações. IaC também é uma
prática essencial do **DevOps** sendo indispensável para um ciclo de vida de entrega de **software** de forma acelerada.

## O que é o Terraform?

O Terraform é uma ferramenta utilizada como **IaC** que permite o **provisionamento, configuração e gerenciamento de infraestrutura** por meio do uso de uma **linguagem descritiva**. Essa ferramenta:

- É de Código Aberto (Open Source);
- Utiliza **linguagem declarativa**, ou seja, uma linguagem que define o resultado final a que se deseja chegar, sem a necessidade de explicitar como (passo a passo) deve-se chegar a esse resultado.

Assim, pode-se dizer que o Terraform é uma ferramenta para **provisionamento de infraestrutura**.

## Arquitetura do Terraform

![Arquitetura do Terraform](conceitos/images/arquitetura-terraform.png)

A arquitetura do Terraform é dividida nos seguintes componentes:

- **sources**
- **providers**

As **sources** são divididas em duas fontes de entradas de informação para realização das tarefas de configuração necessárias, que são:

- **TF-config** - arquivo **.tf** que define o que **criar/configurar** para que a infraestrutura atual passe para o estado desejado.
- **State** - arquivo **.tfstate** que mantém o estado atual da configuração.

Ao realizar a comparação entre **TF-config** e o **State** o Terraform define o que deve ser criado, atualizado ou destruído para que a infraestrutura passe do estado atual para o estado desejado.

Um **provider** nada mais é do que o provedor de serviços *cloud* em que você irá utilizar em suas aplicações. Nesse caso, estamos utilizando o Google Cloud, mas existem outros vários providers suportados como AWS e Azure.

Com um provider definido é possível acessar diferentes **resources** presentes nele. Cada provider possui seus próprios *resources* que podem ser utilizados na configuração da infraestrutura por meio do Terraform.

## Pré requisitos
Para executar o tutorial será necessário ter alguns pré requisitos instalados no seu computador e criado algumas contas:
- [Ter criado uma conta no gcloud](https://cloud.google.com/free?utm_source=google&utm_medium=cpc&utm_campaign=latam-BR-all-pt-dr-AKWS-all-all-trial-p-dr-1011454-LUAC0013595&utm_content=text-ad-none-any-DEV_c-CRE_512285710752-ADGP_Hybrid%20%7C%20BKWS%20-%20PHR%20%7C%20Txt%20~%20GCP_General-KWID_43700062788251482-kwd-464643078222&utm_term=KW_gcloud-ST_Gcloud&gclid=CjwKCAjwjZmTBhB4EiwAynRmD9TyiA9rpe6IX8DG9XnpKxpnLyBLMRtviYB4CTH_SRB63iJX-GaGPRoCetIQAvD_BwE&gclsrc=aw.ds)
- [Ter criado uma service account no gcloud](https://cloud.google.com/iam/docs/creating-managing-service-accounts#iam-service-accounts-create-gcloud)

obs: Quando estiver criando a conta de serviço dê permissão de proprietário para a service account. Após a criação entre na service account que você criou e vá em `chaves`, clique em adicionar nova chave, escolga o formato json e baixe, somente utilizaremos esssa chave na etapa 2, mas é bom já baixar e renomear para `/service_account.json`

- [Ter instalado o gcloud cli](https://cloud.google.com/sdk/docs/install)
- [Ter instalado o terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)

A próxima etapa do tutorial introduz a utilização do Terraform definindo com um provider local, pode ser acessada [aqui](parte1/main.md).

<!-- ## Welcome to GitHub Pages

You can use the [editor on GitHub](https://github.com/DevOps-para-iniciantes/IaC/edit/master/docs/index.md) to maintain and preview the content for your website in Markdown files.

Whenever you commit to this repository, GitHub Pages will run [Jekyll](https://jekyllrb.com/) to rebuild the pages in your site, from the content in your Markdown files.

### Markdown

Markdown is a lightweight and easy-to-use syntax for styling your writing. It includes conventions for

```markdown
Syntax highlighted code block

# Header 1
## Header 2
### Header 3

- Bulleted
- List

1. Numbered
2. List

**Bold** and _Italic_ and `Code` text

[Link](url) and ![Image](src)
```

For more details see [Basic writing and formatting syntax](https://docs.github.com/en/github/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax).

### Jekyll Themes

Your Pages site will use the layout and styles from the Jekyll theme you have selected in your [repository settings](https://github.com/DevOps-para-iniciantes/IaC/settings/pages). The name of this theme is saved in the Jekyll `_config.yml` configuration file.

### Support or Contact

Having trouble with Pages? Check out our [documentation](https://docs.github.com/categories/github-pages-basics/) or [contact support](https://support.github.com/contact) and we’ll help you sort it out. -->
