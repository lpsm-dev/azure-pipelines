<p align="center">
  <img alt="azure" src="https://cdn.dribbble.com/users/3847465/screenshots/10765125/media/e5f08353be5952c5bfd4a759903d5c5a.gif" width="350px" float="center"/>
</p>

<h2 align="center">🌊 Shared azure pipelines 🌊</h2>

<div align="center">

[![Semantic Release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)]()
[![Commitizen friendly](https://img.shields.io/badge/commitizen-friendly-brightgreen.svg)]()
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](/LICENSE)
[![Gitpod Ready-to-Code](https://img.shields.io/badge/Gitpod-Ready--to--Code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/lpmatos/azure-pipelines)

</div>

---

<p align="center">
  <img alt="pipelines" src="https://images.ctfassets.net/em6l9zw4tzag/7j79Xx5NqeJlvGj6w98JUX/ecd7317698578b9efa1482154d0188f4/configuringpipeline.gif" width="450px" float="center"/>
</p>

<p align="center">
  ✨ A collection of some templates to azure pipelines ✨
</p>

<p align="center">
  <a href="#about">About</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#getting-started">Getting Started</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#usage">Usage</a>
</p>

---

## ➤ Getting Started <a name = "getting-started"></a>

If you want contribute on this project, first you need to make a **git clone**:

> 1. git clone --depth 1 https://github.com/lpmatos/azure-pipelines.git -b master

This will give you access to the code on your **local machine**.

## ➤ Description <a name = "description"></a>

Azure pipelines is a cloud service that you can use to automatically build and test your code project and make it available to other users. It works with just about any language or project type.

Azure pipelines combines continuous integration (CI) and continuous delivery (CD) to constantly and consistently test and build your code and ship it to any target.

**Azure Marketplace**

- [SonarQube (Hosted version - The version we will use in this blog post)](https://marketplace.visualstudio.com/items?itemName=SonarSource.sonarqube)

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
