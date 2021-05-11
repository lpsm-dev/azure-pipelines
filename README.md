<p align="center">
  <img alt="gitlab" src="https://res.cloudinary.com/practicaldev/image/fetch/s--goZ15AQs--/c_imagga_scale,f_auto,fl_progressive,h_900,q_auto,w_1600/https://dev-to-uploads.s3.amazonaws.com/i/ic17ec0lhrlqgeb727my.png" width="250px" float="center"/>
</p>

<h1 align="center">Welcome to azure pipelines repository</h1>

> Demonstration of the CI/CD process using Azure DevOps pipeline

## ➤ Menu

<p align="left">
  <a href="#-description">Description</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-usage">Usage</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-topics">Topics</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-features">Features</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-references">References</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-how-to-contribute">How to contribute</a>
</p>

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

## ➤ Links <a name = "links"></a>

- https://docs.microsoft.com/en-us/azure/devops/pipelines/repos/azure-repos-git
- https://docs.microsoft.com/en-us/azure/devops/pipelines/yaml-schema
- https://docs.microsoft.com/en-us/azure/devops/pipelines/process/templates
- https://docs.microsoft.com/en-us/azure/devops/pipelines/repos/multi-repo-checkout
- https://github.com/asottile/azure-pipeline-templates
- https://stackoverflow.com/questions/57180038/how-to-reuse-yaml-templates-in-different-azure-devops-team-project
- https://somakdas.medium.com/sonarqube-integration-with-azure-devops-a9ccd6d23fc9
- https://docs.microsoft.com/en-us/azure/devops/pipelines/build/variables?view=azure-devops&tabs=yaml
- https://www.padok.fr/en/blog/azure-devops-pipeline-service
- https://docs.microsoft.com/en-us/samples/azure-samples/azure-pipelines-remote-tasks/azure-pipeline-remote-tasks/
- https://docs.microsoft.com/pt-br/azure/devops/pipelines/process/expressions?view=azure-devops
- https://stackoverflow.com/questions/50739815/trying-to-add-sonarqube-sonaranalysis-task-in-yaml-build-template-for-vsts-as
- https://msftplayground.com/2019/02/combining-sonarqube-and-azure-devops/
- https://community.sonarsource.com/t/community-edition-with-vsts-to-use-the-property-sonar-branch-name-the-branch-plugin-is-required-but-not-installed/1686/15
- https://markpatton.cloud/2020/09/26/secret-scanning-protecting-your-code-in-azure-devops/
- https://damienaicheh.github.io/azure/devops/2020/11/12/extend-azure-devops-yaml-pipelines-en.html
- https://gist.github.com/justinyoo/baf3ecf3240df3037be0f84fe43b5425
- https://gist.github.com/mariomeyrelles/2cf7375c13e64e5193ea0b1a9e524f04
- https://dev.to/n3wt0n/azure-pipeines-yaml-template-demystified-9c6
- https://damienaicheh.github.io/xamarin/azure/devops/2019/11/21/reuse-your-azure-devops-pipeline-en.html
- https://medium.com/swlh/azure-pipelines-yaml-templates-194bd35e8aa6
- https://github.com/nordcloud/azure-pipelines-templates

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
