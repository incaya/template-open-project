.PHONY: install start stop logs test

help: ## Affichage des commandes disponibles
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

install: ## Installation des dépendance du projet
	@echo "Lancement de l'installation du projet"

start: ## Démarrer le projet
	@echo "Démarrage du projet sur votre environement local"

stop: ## Arrêter le projet
	@echo "Arrêter projet sur votre environement local"

logs: ## Afficher les logs du projet
	@echo "Afficher les logs du projet"

test: ## Lancer les tests
	@echo "Lancement des tests du projet"
