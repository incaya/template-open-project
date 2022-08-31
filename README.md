> Pensez bien à mettre à jour les contenus et les liens de ce fichier pour le nouveau projet ;)

# Template pour les projets publiques d'Incaya

<!-- Une description succinct mais motivante du projet. -->

<img align="right" src="https://incaya.fr/images/logo_hu48204ac56d872c7eba4fc9701c1d9b38_4541_148x148_fit_box_3.png"  style="margin-right: 5px"/>

Ce dépôt sert de [template](https://github.blog/2019-06-06-generate-new-repositories-with-repository-templates/) pour les projets publiques d'[Incaya](https://incaya.fr). Ce dépôt inclue : 
- les fichiers de documentation de base (Readme, license, code de conduite, ...)
- des templates de PR et d'Issues Github
- des [outils](https://github.com/incaya/incaya-documentation) pour maintenir une documentation
- des outils permettant de mettre en place la spécification [Conventional Commits](https://www.conventionalcommits.org/fr/v1.0.0/) et de s'en servir pour maintenir un fichier de [CHANGELOG](https://fr.wikipedia.org/wiki/Changelog)
- un [Makefile](https://fr.wikipedia.org/wiki/Make) de base permettant de lancer les commandes courantes du projet (initialisation, démarrage, tests, déploiements, ...)

![Top language](https://img.shields.io/github/languages/top/incaya/template-open-project.svg) ![Contributors](https://img.shields.io/github/contributors/incaya/template-open-project.svg) ![License](https://img.shields.io/github/license/incaya/template-open-project.svg)

<!-- LES BADGES
![Tests](https://github.com/incaya/template-open-project/workflows/phpunit/badge.svg?branch=main) ![Top language](https://img.shields.io/github/languages/top/incaya/template-open-project.svg) ![Contributors](https://img.shields.io/github/contributors/incaya/template-open-project.svg) ![License](https://img.shields.io/github/license/incaya/template-open-project.svg) ![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg) -->

## Pré-requis

Quelles sont les briques logiciels obligatoirement présentes sur l'environnement de développement pour pouvoir lancer le projet.

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- Python (pour le hook git)

## Démarrage rapide

Le `Makefile` devra idéalement comporter au moins les recettes suivantes :

- help
- install
- start
- test

En savoir plus sur le Makefile :

- [Self-Documented Makefile](https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html)
- [The Language Agnostic, All-Purpose, Incredible, Makefile](https://blog.mindlessness.life/2019/11/17/the-language-agnostic-all-purpose-incredible-makefile.html)
- [What is a Makefile and how does it work?](https://opensource.com/article/18/8/what-how-makefile)
- [Your Makefiles are wrong](https://tech.davis-hansson.com/p/make/)

Une fois le Makefile en place, on lance l'installation du projet avec :

```bash
make install
```

et on démarre le projet avec :

```bash
make start
```

Le projet est alors disponible sur <http://localhost:xxxx>

## Participer au projet

Vous souhaitez participer ? Merci à vous :+1:

Et c’est très simple :

- Si vous ne savez pas par où commencer, vous pouvez jeter un coup d’œil aux [**issues**](https://github.com/incaya/template-open-project/issues).
- Une fois que vous savez quoi faire, vous pouvez consulter le [**guide du contributeur**](.docs/CONTRIBUTING.md) pour vous lancer.

Et si vous ne trouvez toujours pas quoi faire dans les issues existantes et/ou que vous avez d’autres idées, n’hésitez pas à créer une nouvelle issue.

## Trouver de la documentation

Certes, le [code et ses tests pose une bonne pierre dans la documentation](https://martinfowler.com/bliki/CodeAsDocumentation.html).

Mais si vous avez besoin d'aide, n'hésitez pas à consulter notre [guide de support](./docs/SUPPORT.md) ou encore notre page ["Architecture"](./docs/ARCHITECTURE.md)

## License

Les projets publiques d'Incaya sont sous license [GNU GPLv3](LICENSE)
