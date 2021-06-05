<div align="center">

<p align="center">
  <img alt="azure" src="https://cdn.dribbble.com/users/3847465/screenshots/10765125/media/e5f08353be5952c5bfd4a759903d5c5a.gif" width="250px" float="center"/>
</p>

<h1 align="center">Shared Pipeline</h1>

[![Semantic Release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://gitlab.com/dry-group/cluster-management)
[![Commitizen friendly](https://img.shields.io/badge/commitizen-friendly-brightgreen.svg)](https://gitlab.com/dry-group/cluster-management)

<p align="center">
  <img alt="pipelines" src="https://images.ctfassets.net/em6l9zw4tzag/7j79Xx5NqeJlvGj6w98JUX/ecd7317698578b9efa1482154d0188f4/configuringpipeline.gif" width="450px" float="center"/>
</p>

<p align="center">  
  <h3>Demonstration of the CI/CD process using Azure DevOps pipeline</h3>
</p>

</div>

---

## ➤ Getting Started <a name = "getting-started"></a>

If you want contribute on this project, first you need to make a **git clone**:

>
> 1. git clone --depth 1 https://github.com/lpmatos/azure-pipelines.git -b master
>

This will give you access to the code on your **local machine**.

## ➤ Prerequisites <a name = "prerequisites"></a>

Before starting to develop you need to install some tools on your local machine:

### Support tools 

- **npm**, **make**, **gitleaks**

For more information, access the [CONTRIBUTING](CONTRIBUTING.md) file.

## ➤ Installing <a name = "installing"></a>

### Support dependencies

To install support dependencies that handle commit and release standards, run the command:

```bash
make install
```

This shareable configuration use the following dependencies:

- ⮚ [Semantic Release](https://github.com/semantic-release) + Plugins de configuração
  - [`semantic-release`](https://github.com/semantic-release/semantic-release)
  - [`@semantic-release/git`](https://github.com/semantic-release/git)
  - [`@semantic-release/github`](https://github.com/semantic-release/github)
  - [`@semantic-release/changelog`](https://github.com/semantic-release/changelog)
  - [`@semantic-release/commit-analyzer`](https://github.com/semantic-release/commit-analyzer)
  - [`@semantic-release/release-notes-generator`](https://github.com/semantic-release/release-notes-generator)
- ⮚ [Commit Lint](https://github.com/conventional-changelog/commitlint) usando o [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/).
  - [`commitizen`](https://github.com/commitizen/cz-cli)
  - [`@commitlint/cli`](https://github.com/conventional-changelog/commitlint)
  - [`@commitlint/config-conventional`](https://github.com/conventional-changelog/commitlint)
- ⮚ Git Hooks com [Husky](https://github.com/typicode/husky).
  - [`husky`](https://github.com/semantic-release/git)

For more information, access the [CONTRIBUTING](CONTRIBUTING.md) file.

### Hooks

Configure husky `commit-msg` and `pre-commit` hooks:

```bash
bash scripts/hooks.sh
```

## ➤ Usage <a name = "usage"></a>

>
> First configure a github service connection
>

It is suggested to use a generic name, such as `github` so forks can also configure the same. You can find this in `Project Settings => Service connections` in the `Azure Devops` dashboard for your project.

Below I'm using the endpoint name `github`.

>
> Next add this to the beginning of your azure-pipelines.yml
>

```yml
resources:
  repositories:
    - repository: lpmatos
      type: github
      endpoint: github
      name: lpmatos/azure-pipelines
      ref: 'refs/heads/master'
```

this will make the templates in this repository available in the `lpmatos` namespace.

## ➤ Description <a name = "description"></a>

<p align="center">
  <img alt="secret" src="https://media3.giphy.com/media/5ziQ5kjh4lgCd29WOR/200w.gif?cid=82a1493b0uufgvz9tw6byen3bed3y7h9u0ilzpcuthz7a5ne&rid=200w.gif" width="250px" float="center"/>
</p>

Azure Pipelines is a cloud service that you can use to automatically build and test your code project and make it available to other users. It works with just about any language or project type. Azure Pipelines combines continuous integration (CI) and continuous delivery (CD) to constantly and consistently test and build your code and ship it to any target.

### Azure Marketplace

- SonarQube (Hosted version. The version we will use in this blog post) - https://marketplace.visualstudio.com/items?itemName=SonarSource.sonarqube

## ➤ Author <a name = "author"></a>

👤 **Lucca Pessoa**

Hey!! If you like this project or if you find some bugs feel free to contact me in my channels:

>
> * Email: luccapsm@protonmail.com
> * Website: https://github.com/lpmatos
> * Github: [@lpmatos](https://github.com/lpmatos)
> * GitLab: [@lpmatos](https://gitlab.com/lpmatos)
> * LinkedIn: [@luccapessoa](https://www.linkedin.com/in/luccapessoa/)
>

## ➤ Versioning <a name = "versioning"></a>

To check the change history, please access the [**CHANGELOG.md**](CHANGELOG.md) file.

## ➤ Contributing <a name = "contributing"></a>

Contributions, issues and feature requests are welcome. Feel free to check issues page if you want to contribute. [Check the contributing guide](CONTRIBUTING.md).

## ➤ Troubleshooting <a name = "troubleshooting"></a>

If you have any problems, please contact [me](luccapsm@protonmail.com).

## ➤ Show your support <a name = "show-your-support"></a>

Give a ⭐️ if this project helped you!

---

Made with 💜 by [me](https://github.com/lpmatos) :wave: inspired on [readme-md-generator](https://github.com/kefranabg/readme-md-generator)
