> Pensez bien à mettre à jour les contenus et les liens de ce fichier pour le nouveau projet ;)


# Template pour les projets publics d'Incaya

<!-- Une description succinct mais motivante du projet. -->

<img align="right" src="https://incaya.fr/images/logo_hu48204ac56d872c7eba4fc9701c1d9b38_4541_148x148_fit_box_3.png"  style="margin-right: 5px"/>

Ce dépôt sert de [template](https://github.blog/2019-06-06-generate-new-repositories-with-repository-templates/) pour les projets publiques [d'Incaya](https://incaya.fr). Ce dépôt inclut : 
- les fichiers de documentation de base d'un projet open-source (Readme, licence, code de conduite, guide de contribution ...),
- des templates de Pull requests et d'Issues Github,
- des [outils](https://github.com/incaya/incaya-documentation) pour maintenir une documentation ([Hugo](https://gohugo.io/) et [Excalidraw](https://excalidraw.com/)), sous la forme d'un site web statique publié sur [Github pages](https://pages.github.com/),
- des outils permettant de mettre en place la spécification [Conventional Commits](https://www.conventionalcommits.org/fr/v1.0.0/) et de s'en servir pour maintenir un fichier de [CHANGELOG](https://fr.wikipedia.org/wiki/Changelog)
- un [Makefile](https://fr.wikipedia.org/wiki/Make) de base permettant de lancer les commandes courantes du projet (initialisation, démarrage, tests, déploiements ...)

[![Conventional commits](https://github.com/incaya/template-open-project/actions/workflows/conventional-commit.yml/badge.svg?branch=main)](https://github.com/incaya/template-open-project/actions/workflows/conventional-commit.yml) [![Doc on GitHub Pages](https://github.com/incaya/template-open-project/actions/workflows/documentation.yml/badge.svg?branch=main)](https://github.com/incaya/template-open-project/actions/workflows/documentation.yml) ![Top language](https://img.shields.io/github/languages/top/incaya/template-open-project.svg) ![Contributors](https://img.shields.io/github/contributors/incaya/template-open-project.svg) ![License](https://img.shields.io/github/license/incaya/template-open-project.svg) ![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)

## Pré-requis

<!-- Quelles sont les briques logiciels obligatoirement présentes sur l'environnement de développement pour pouvoir lancer le projet. -->

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- [Python](https://www.python.org/downloads/) en v3 (pour le hook git)

En option pour gérer les releases, vous aurez besoin de :
- [cocogitto](https://docs.cocogitto.io/)

## Démarrage rapide

Le `Makefile` devrait idéalement comporter au moins les recettes suivantes :

- help
- install
- start
- test

En savoir plus sur le Makefile :

- [Self-Documented Makefile](https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html)
- [The Language Agnostic, All-Purpose, Incredible, Makefile](https://blog.mindlessness.life/2019/11/17/the-language-agnostic-all-purpose-incredible-makefile.html)
- [What is a Makefile and how does it work?](https://opensource.com/article/18/8/what-how-makefile)
- [Your Makefiles are wrong](https://tech.davis-hansson.com/p/make/)

On lance l'installation du projet avec :

```bash
make install
```

et on démarre le projet avec :

```bash
make start
```

Le projet est alors disponible:
- <http://localhost:xxxx> (en fonction du projet)
- la documentation du projet sur http://localhost:1313/nom-du-repo-github
- Excalidraw (pour faire les schémas de documentation) sur http://localhost:3001

## Participer au projet

Vous souhaitez participer ? Merci à vous :+1:

Et c’est très simple :

- Si vous ne savez pas par où commencer, vous pouvez jeter un coup d’œil aux [**issues**](https://github.com/incaya/template-open-project/issues).
- Une fois que vous savez quoi faire, vous pouvez consulter le [**guide du contributeur**](./docs/CONTRIBUTING.md) pour vous lancer.

Et si vous ne trouvez toujours pas quoi faire dans les issues existantes et/ou que vous avez d’autres idées, n’hésitez pas à créer une nouvelle issue.

## Trouver de la documentation

Certes, le [code et ses tests constituent une part importante de la documentation](https://martinfowler.com/bliki/CodeAsDocumentation.html). Mais, et c'est l'un des objectifs de ce template, il est important d'avoir du contexte sur un projet pour s'y investir. Vous trouverez donc une documentation du projet sur la page Github https://incaya.github.io/template-open-project.

Si vous avez besoin d'aide, n'hésitez pas à consulter [la page support](./docs/SUPPORT.md), [le guide de contribution](./docs/CONTRIBUTING.md) ou encore [la page "Architecture"](./docs/ARCHITECTURE.md)

## License

Les projets publics d'Incaya sont sous licence [GNU GPLv3](LICENSE)
