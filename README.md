# docker-domoticz-dev
## Description
* Dockerfile pour créer un container Docker de développement Domoticz sous Debian x86
* Fichiers annexes :
  * ./files/start.sh : script d'installation et de démarrage de Domoticz dans le container
  * ./container_sync.sh : script de synchronisation des fichiers de l'hôte vers le container

## Utilisation
* Créer une image Docker :

  Exécuter : docker build -t domoticz-dev .

* Créer et lancer un container la 1ere fois :
	1. Mettre à jour la sauvegarde de la base de données Domoticz : ./files/domoticz.db
	2. docker run -it -p 8080:8080 --name domoticz-dev3.8153 -v ${PWD}/files/domoticz.db:/tmp/domoticz.db  domoticz-dev
	3. Pour sortir et stopper le container : Ctrl-D

Les scripts LUA, python et les plugins python doivent être synchronisés à la main avec le script ./container_sync.sh

* Pour relancer le container déjà créé :
	docker start -i domoticz-dev3.8153

* Pour installer la version beta dans le container :
	bash /home/pi/domoticz/updatebeta

* Le serveur web Domoticz est accessible à l'adresse :
	http://localhost:8080 

## Commandes Docker utiles
 * Voir tous les containers en cours d'exécution :
	docker ps
 * Voir tous les containers :
	docker ps -a
 * Voir toutes les images en local :
	docker images

 * Copier fichier vers container :
	docker cp fichier container:/target_dir/
  
 * Supprimer tous les containers qui ne sont pas en cours d'exécution :
	docker rm $(docker ps -q -f status=exited) 
 * Supprimer tous les containers :
	docker rm $(docker ps -a -q)
 * Supprimer toutes les images qui ne sont pas utilisées par des containers :
	docker rmi $(docker images -f "dangling=true" -q)
 * Supprimer toutes les images :
	docker rmi $(docker images -q)
 * Supprimer tous les containers/voumes/networks/images non utilisés :
	docker system prune
