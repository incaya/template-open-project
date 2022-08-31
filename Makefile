export CURRENT_UID = $(shell id -u):$(shell id -g)
BRANCH := $(shell git rev-parse --abbrev-ref HEAD)

DC_DEV := docker-compose -p projet-incaya

help: ## Affichage des commandes disponibles
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

#-------------------
# Commandes usuelles
#-------------------

install: ## Installation des dépendance du projet
	@cp -n commit-msg .git/hooks
	@echo "Lancement de l'installation du projet"

start: ## Démarrer le projet
	@${DC_DEV} up -d

stop: ## Arrêter le projet
	@${DC_DEV} down

logs: ## Afficher les logs du projet
	@${DC_DEV} logs -f

#------
# Tests
#------

test: ## Lancer les tests
	@echo "Lancement des tests du projet"

#---------------
# Documentation
#---------------

doc-connect: ## Connexion au container de documentation
	@${DC_DEV} exec documentation bash

doc-new-adr: ## Créer un nouvel ADR
	@${DC_DEV} run --rm --no-deps documentation bash -ci '\
		cd /documentation && \
		./new-adr.sh \
	'

doc-new-doc: ## Créer un nouveau document
	@${DC_DEV} run --rm --no-deps documentation bash -ci '\
		cd /documentation && \
		./new-docs.sh \
	'

doc-generate: ## Génération des fichier statique de documentation
	@${DC_DEV} run --rm --no-deps documentation bash -ci '\
		cd /documentation && \
		hugo \
	'

#-------------
# Release
#-------------

release: ## Creation d'une nouvelle release
ifeq ($(BRANCH),main)
	cog bump --auto
else
	@echo "Il faut être sur la branche main pour générer une nouvelle release."
endif

.PHONY: install start stop logs test
