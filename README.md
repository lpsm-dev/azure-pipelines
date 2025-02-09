<!-- BEGIN_DOCS -->
<div align="center">

<a name="readme-top"></a>

<img src="https://github.com/lpsm-dev/lpsm-dev/blob/c0a3ab229fd29a76e169dbe846412b5132af63b5/.github/assets/azure-pipelines.png" width="350"/>

## Azure Pipelines

Hello Human 👽! Bem-vindo ao meu repositório 👋

Vamos criar umas pipelines de CI/CD com o Azure DevOps? 🚀

[![Commitizen friendly](https://img.shields.io/badge/commitizen-friendly-brightgreen.svg)](https://www.conventionalcommits.org/en/v1.0.0/)
[![Semantic Release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://semantic-release.gitbook.io/semantic-release/usage/configuration)
[![Built with Devbox](https://jetpack.io/img/devbox/shield_galaxy.svg)](https://jetpack.io/devbox/docs/contributor-quickstart/)

</div>

# Sumário

<details>
  <summary><strong>Expandir</strong></summary>

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Description](#description)
- [Usage](#usage)
- [Versionamento](#versionamento)
- [Troubleshooting](#troubleshooting)
- [Show your support](#show-your-support)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

<p align="right">(<a href="#readme-top">back to top</a>)</p>

</details>

# Usando

## 1. Configurar a conexão de serviço com o GitHub

Recomenda-se utilizar um nome genérico, como `github`, para que forks do repositório possam configurar a mesma conexão. Para isso, acesse o painel do **Azure DevOps** e navegue até:

**`Project Settings => Service connections`**

Lá, você poderá criar uma nova conexão de serviço com o GitHub.

No exemplo abaixo, estou utilizando o nome do endpoint como `github`.

## 2. Adicionar a configuração no `azure-pipelines.yml`

Inclua o seguinte trecho no início do seu arquivo `azure-pipelines.yml`:

```yml
resources:
  repositories:
    - repository: lpmatos
      type: github
      endpoint: github
      name: <your-ref>
      ref: "refs/heads/master"
```

Essa configuração tornará os templates deste repositório acessíveis no namespace

<p align="right">(<a href="#readme-top">back to top</a>)</p>

# Versionamento

Para verificar o histórico de mudanças, acesse o arquivo [**CHANGELOG.md**](CHANGELOG.md).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

# Troubleshooting

Se você tiver algum problema, abra uma [issue](https://github.com/lpsm-dev/dotfiles/issues/new/choose) nesse projeto.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

# Show your support

<div align="center">

Dê uma ⭐️ para este projeto se ele te ajudou!

<img src="https://github.com/lpsm-dev/lpsm-dev/blob/0062b174ec9877e6dfc78817f314b4a0690f63ff/.github/assets/yoda.gif" width="225"/>

<br>
<br>

Feito com 💜 pelo **Time de DevOps** :wave: inspirado no [readme-md-generator](https://github.com/kefranabg/readme-md-generator)

</div>

<p align="right">(<a href="#readme-top">back to top</a>)</p>
<!-- END_DOCS -->
