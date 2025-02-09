<!-- BEGIN_DOCS -->
<div align="center">

<a name="readme-top"></a>

<img src="https://github.com/lpsm-dev/lpsm-dev/blob/c0a3ab229fd29a76e169dbe846412b5132af63b5/.github/assets/azure-pipelines.png" width="350"/>

[![Commitizen friendly](https://img.shields.io/badge/commitizen-friendly-brightgreen.svg)](https://www.conventionalcommits.org/en/v1.0.0/)
[![Semantic Release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://semantic-release.gitbook.io/semantic-release/usage/configuration)
[![Built with Devbox](https://jetpack.io/img/devbox/shield_galaxy.svg)](https://jetpack.io/devbox/docs/contributor-quickstart/)

#### Hello Human 👽! Bem-vindo ao meu repositório 👋

Vamos criar umas pipelines de CI/CD com o Azure DevOps? 🚀

</div>

# Description

Azure pipelines is a cloud service that you can use to automatically build and test your code project and make it available to other users. It works with just about any language or project type.

Azure pipelines combines continuous integration (CI) and continuous delivery (CD) to constantly and consistently test and build your code and ship it to any target.

**Azure Marketplace**

- [SonarQube (Hosted version - The version we will use in this blog post)](https://marketplace.visualstudio.com/items?itemName=SonarSource.sonarqube)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

# Usage

> First configure a github service connection

It is suggested to use a generic name, such as `github` so forks can also configure the same. You can find this in `Project Settings => Service connections` in the `Azure Devops` dashboard for your project.

Below I'm using the endpoint name `github`.

> Next add this to the beginning of your azure-pipelines.yml

```yml
resources:
  repositories:
    - repository: lpmatos
      type: github
      endpoint: github
      name: lpmatos/azure-pipelines
      ref: "refs/heads/master"
```

this will make the templates in this repository available in the `lpmatos` namespace.

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
