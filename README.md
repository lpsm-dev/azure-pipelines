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

## ➤ Getting Started

If you want use this repository you need to make a **git clone**:


>
> 1. git clone --depth 1 https://github.com/lpmatos/azure-pipelines.git -b master
>


This will give access on your **local machine**.

## ➤ Description

Azure Pipelines is a cloud service that you can use to automatically build and test your code project and make it available to other users. It works with just about any language or project type.

Azure Pipelines combines continuous integration (CI) and continuous delivery (CD) to constantly and consistently test and build your code and ship it to any target.

## ➤ Usage

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

## ➤ Topics

* [Agents](./docs/Agents.md)
* [Concepts](./docs/Concepts.md)
* [DevOps](./docs/DevOps.md)

## ➤ Features

* Default gitignore and editorconfig.
* GitLeaks file.
* Semantic Release file.
* NPM modules automation.
  * Commitlint - Conventional Commits.
  * Git Hooks with Husky.

## ➤ References

* https://docs.microsoft.com/en-us/azure/devops/pipelines/repos/azure-repos-git
* https://docs.microsoft.com/en-us/azure/devops/pipelines/yaml-schema
* https://docs.microsoft.com/en-us/azure/devops/pipelines/process/templates
* https://docs.microsoft.com/en-us/azure/devops/pipelines/repos/multi-repo-checkout
* https://github.com/asottile/azure-pipeline-templates
* https://stackoverflow.com/questions/57180038/how-to-reuse-yaml-templates-in-different-azure-devops-team-project

## ➤ How to contribute

>
> 1. Make a **Fork**.
> 2. Follow the project organization.
> 3. Add the file to the appropriate level folder - If the folder does not exist, create according to the standard.
> 4. Make the **Commit**.
> 5. Open a **Pull Request**.
> 6. Wait for your pull request to be accepted.. 🚀
>

Remember: There is no bad code, there are different views/versions of solving the same problem. 😊

## ➤ Add to git and push

You must send the project to your GitHub after the modifications

>
> 1. git add -f .
> 2. git commit -m "Added - Fixing somethings"
> 3. git push origin master
>

## ➤ Versioning

- We currently do not have a CHANGELOG.md generated.

## ➤ Author

👤 **Lucca Pessoa**

Hey!! If you like this project or if you find some bugs feel free to contact me in my channels:

>
> * Email: luccapsm@gmail.com
> * Website: https://github.com/lpmatos
> * Github: [@lpmatos](https://github.com/lpmatos)
> * GitLab: [@lpmatos](https://gitlab.com/lpmatos)
> * LinkedIn: [@luccapessoa](https://www.linkedin.com/in/luccapessoa/)
>

## ➤ Show your support

Give a ⭐️ if this project helped you!

---

_This README was generated with ❤️ by me_
