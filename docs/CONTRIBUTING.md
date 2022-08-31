---
title: Guide de contribution
slug: guide-de-contribution
date: 2022-03-15T10:43:23Z
draft: false
weight: 1
summary: 'Toutes les informations à connaitre pour pouvoir contribuer au projet.'
---

## Code de conduite

En participant, vous devez respecter le [code de conduite du projet](./CODE_OF_CONDUCT.md).

## Qu’est ce que je peux faire

Beaucoup de choses, l’écriture de code n’étant pas l’unique manière de contribuer au projet !

### Rapporter des bugs 

Il parait que chaque bug relevé sauve un chaton. En tout cas, la technique du [ZBSD (Zero-Bug Software Development)](https://medium.com/quality-functions/the-zero-bug-policy-b0bd987be684) semble porter ses fruits, comme le rapporte [Andrew Fulton](https://medium.com/@andrew.fulton/how-we-got-to-zero-bugs-and-implemented-a-zero-bug-policy-c77ee3f2e50b).
Donc, si à chaque bug rencontré quelqu’un [ouvre une issue](#ouvrir-une-issue) avec le label **Rapport de bug**, ce seront des familles entières de chats qui seront sauvées.

### Suggérer des améliorations ou de nouvelles fonctionnalités

Dans ce cas, ouvrez une nouvelle issue de type **Demande d'amélioration** en décrivant bien votre idée.

### Signaler des manques dans la documentation

Si pendant votre participation au projet (que ce soit en l'utilisant ou en participant au code) vous n'avez pas réussit à faire quelque chose par manque de solution, signalez le en ouvrant une issue de type **Demande de documentation**.

Et d'ailleurs n'hésitez pas à traiter cette issue en proposant un PR améliorant la documentation si vous avez trouvez une solution !

### Contribuer au code

Pour ce projet, il n'y a pas grand-chose à faire sur du code proprement dit ... Par contre, toutes contributions aux contenus éditoriaux sont les bienvenues ! 
<!-- Topo sur le projet -->

## L'environnement de développement

Quelle que soit votre type d’implication, ce peut-être une bonne chose que d’installer le projet sur votre machine pour pouvoir visualiser votre contribution avant de la proposer sur Github.

### Prérequis

<!-- Décrire ce qui doit-être disponible sur un environnement de développement afin de pouvoir installer le projet et le lancer en local -->
- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- [Python](https://www.python.org/downloads/) en v3 (pour le hook git)

En option pour gérer les releases, vous aurez besoin de :
- [cocogitto](https://docs.cocogitto.io/)

### L’organisation du code

```bash
.
├── cog.toml
├── commit-msg
├── docker-compose.yaml
├── docs
│   └── ...
├── hugo-config.toml
├── LICENSE.md
├── logo.png
├── Makefile
├── project-documentation
│   └── ...
├── published-documentation
│   └── ...
└── README.md
```

On trouve des fichiers de documentation (`README.md`, `LICENSE.md`, ...) et de configuration (`cog.toml`, `hugo-config.toml`, ...) à la racine du projet, mais aussi 3 répertoires :

- **/docs** : c'est le répertoire où l'on trouve les documents permettant au projet de répondre aux normes communautaires des projets libres et open-source [recommandées par Github](https://opensource.guide/). C'est la norme Github qui explique que c'est documents ne sont pas présent au sein du répertoire `/project-documentation`.
- **/project-documentation** : c'est le répertoire où l'on trouve les fichiers de documentations générés et gérés par Hugo.
- **/published-documentation** : c'est le répertoire où sont générés les fichiers statiques finaux de Hugo, avant publication sur la Github page. Ce répertoire est présent dans le code, mais son contenu est exclu de Git.
<!-- Description de l'organisation du code si cela vous semble utile. C'est souvent un plus dans la cas de monorepo ... -->

### Installer le projet

<!-- Les étapes nécessaires à l'installation du projet -->
```bash
make install
```

### Démarrer le projet

<!-- Comment lancer le projet en locale -->
```bash
make start
```

Le projet est alors disponible:
- <http://localhost:xxxx> (en fonction du projet)
- la documentation du projet sur http://localhost:1313/nom-du-repo-github
- Excalidraw (pour faire les schémas de documentation) sur http://localhost:3001

## La convention de codage (coding style)

<!-- Décrire les conventions de code du projet, et les outils de linting éventuels -->

### Utilisation des commits conventionnels

Par choix, le processus de déploiement sur les environnenments d'exploitation est assez manuel et repose sur des tags associés aux images Docker. Pour pouvoir suivre ce qui est déployé, nous nous basons sur les numéros de release (suivant la convention de [gestion sémantique de version](https://semver.org/lang/fr/)).

Et c'est là que l'utilisation des [commits conventionnels](https://www.conventionalcommits.org/fr/v1.0.0/) : ils permettent d'automatiser en parti la gestion des numéros de releases et la gestion du changelog.

Pour suivre la convention, le message du commit doit être structuré comme suit:

---

    <type>(optional scope): <description>

    [optional body]

    [optional footer(s)]

---

```bash
git commit -m "type: description courte mais significative"
git commit -m "type(scope): description courte mais significative"
```

**Le type**

Dans la convention, c'est le `type` qui est primordial. A certains types sont associés des changements de version de release :

| type                | description                                                                                                                                                                                                                      | versioning sémantique |
| ------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------- |
| **fix**             | un commit de type fix corrige un bogue dans le code                                                                                                                                                                              | **PATCH**             |
| **feat**            | un commit de type feat introduit une nouvelle fonctionnalité dans le code                                                                                                                                                        | **MINOR**             |
| **BREAKING CHANGE** | un commit qui a **dans le pied de page** le mot clef `BREAKING CHANGE:`, ou **ajoute un ! après le type/scope**, introduit un changement cassant l’API. Un BREAKING CHANGE peut faire partie des commits de n’importe quel type. | **MAJOR**             |
|                     |

Un exemple de commit conventionnel introduisant un BREAKING CHANGE :

```bash
git commit -m "feat!: nouveau plan de routing"
```

Mais il existe d'autres `type` qui n'auront eux pas d'impacte sur le numéro de release. Voici la liste compléte des types (sans le BREAKING CHANGE qui peut donc être associé à n'importe quel type) :

-   **build** : Change to build system
-   **chore** : General tooling/config/min refactor
-   **ci** : Change to CI pipeline/workflow
-   **docs** : Change to documentation only
-   **feat** : A new feature _(semver MINOR)_
-   **fix** : A bug fix _(semver PATCH)_
-   **perf** : Change that affects performance
-   **refactor** : Change not related to a bug or feat
-   **style** : Change to style
-   **test** : Change that adds/modifies tests

**Le scope**

Le `scope` est optionnel, mais pourra par exemple par faire référence à une carte de backlog (Github, Trello, Taiga, ...).

```bash
git commit -m "docs(TG-6): add documention about conventional commits"
```

**Le hook git**

Vous l'aurez compris, on compte sur les développeurs pour s'approprier cette convention de commit. Mais c'est contraignant, surtout au début. Souvent, on oublie de le faire, ou si on n’oublie pas, on oublie les types disponibles ...

Un hook git (le fichier `commit-msg`) est normalement automatiquement installer sur votre environnement lors de votre premier `make install`. Si cela n'est pas le cas, vous pouvez l'ajouter vous-même.

```bash
cp commit-msg .git/hooks/
git init
```

Vous pouvez aussi décider de le désactiver. Mais quoi qu'il en soit, nous avons mis en place une [Github action]([.github/workflows/conventional-commit.yml](https://github.com/incaya/template-open-project/actions/workflows/conventional-commit.yml)) testant la validité des commits directement sur Github.

## La documentation

Ce n'est pas toujours ce qu'il y a de plus facile à faire sur un projet : écrire une documentation permettant d'utiliser le produit, mais aussi permettant de participer à son élaboration. Et tout aussi difficile, maintenir cette documentation à jours.

Pourtant, et ceci d'expérience, ce sont le plus souvent les projets les mieux documentés qui gagnent l'adhésion de la communauté ! Voici donc les quelques méthodes et règle qui nous avons mis en place chez Incaya.

### Hugo

Nous utilisons un conteneur Docker contenant [Hugo](https://gohugo.io/) et [Excalidraw](https://excalidraw.com/) pour maintenir au plus près du code une documentation donnant du contexte, des guides ou toute autres information que l'on ne peut déduire du code.

Cette documentation est consultable sur l'environnement de développement (), mais elle est aussi automatiquement publiée lorsqu'elle est modifiée sur une Github Page : https://incaya.github.io/template-open-project/

Vous pouvez créer un nouveau fichier de documentatinon (il sera généré dans le répertoire `project-documentation/documentation`) avec la commande :

```bash
make doc-new-doc
```

### Les ADR.s

Nous utilisons les [ADR.s (Architectural Decision Records)](https://adr.github.io/) pour documenter les prises de décisions liées à l'architecture du projet. Les ADRs sont en fait gérés par Hugo, et vous pouvez créer un nouvel ADR grâce à la commande :

```bash
make doc-new-adr
```

## Les tests

Afin de faciliter l’intégration (le merge) de vos PR, surtout si elles ajoutent ou modifient du code, celles-ci devront contenir les tests couvrant vos propositions.

<!-- Décrire les outils de tests utilisés. -->

Les tests sont lancés sur la plateforme d’intégration continue de Github via les [Github actions](https://github.com/features/actions).

## Les bonnes pratiques

La bonne pratique, c’est de **faire des PR**, et puis c’est tout.

### Faire une Pull request

Si vous n’avez encore jamais fait de Pull Request (PR), la lecture du tutorial Github [Understanding the GitHub Flow](https://guides.github.com/introduction/flow/) est sûrement un bon point de départ.

Si vous n’aviez pas encore de compte Github, en voici une [bonne introduction](https://flaviocopes.com/github-guide/).

### le git flow

Pour le projet, nous utilisons le workflow suivant :

-   Le projet principal ne possède qu’une branche `main`.
-   Chaque participant réalise un [fork](https://guides.github.com/activities/forking/) du dépôt principal puis ouvre une [branche](https://help.github.com/articles/creating-and-deleting-branches-within-your-repository/) depuis son fork pour chaque nouvelle feature.
-   Une [PR](https://help.github.com/articles/about-pull-requests/) est créée depuis la branche du fork vers la branche `main` du dépôt principal.

Si vous vous sentez un peu perdu.e, la lecture de [Using the Fork-and-Branch Git Workflow](https://blog.scottlowe.org/2015/01/27/using-fork-branch-git-workflow/) devrait vous rendre plus serein.ne.

### Conseils

Mais voici quelques conseils qui peuvent les rendre encore meilleures :

-   Faites des commits [courts et bien commentés](http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html).
-   Faites des [PR courtes](https://dev.to/bosepchuk/optimal-pull-request-size-600), toute une tache (une issue) n’a pas forcement besoin d’être adressée dans une seule PR.
-   Faites référence à l’issue que la PR adresse.
-   N’hésitez pas à joindre des captures d’écran, fixes ou animées.
-   Ajouter une description et une _todo list_ en ouvrant la PR.
-   N’attendez pas que la PR soit terminée pour l’ouvrir : la communauté viendra plus facilement en aide en découvrant tôt la PR.
-   Utilisez les labels `WIP` (Work In Progress) et `RFR` (Ready For Review) pour indiquer l’avancement de la PR.
-   dernier point : tous les _textes_ (titre, description, commentaires, etc.) sont fait en **français**. En effet, même si la norme en opensource c’est l’anglais, nous avons collectivement décidé d’utiliser le français pour le projet.

## Trouver de l’aide

### Dans une issue

Le [système d’issues du Github](https://guides.github.com/features/issues/) est très bien pensé et permet de facilement réagir, commenter, noter... Donc si une issue vous intéresse mais qu’elle ne vous semble pas claire, c’est directement dans l’issue que vous pouvez poser des questions.

### Au cours d’une pull request

Si vous avez commencé une PR, mais que vous êtes bloqué, vous pouvez écrire un commentaire dessus décrivant votre problème et ajouter le label **Demande d'aide** :question:.
