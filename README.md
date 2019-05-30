# MDI - Docker (OpenCV)

Le but de ce TP était, à travers l'exemple de l'utilisation de la librairie **OpenCV** (et non OpenAI), d'essayer de "conteneriser" un applicatif à l'aide de **Docker**.
Nous avons, dans un premier temps, suivi les étapes nécessaires à la compilation d'OpenCV, à partir du code source disponible sur le GitHub associé.
Chaque commande/étape était copiée dans un fichier texte pour permettre de construire un **récapitulatif** de la marche complète à suivre pour obtenir le fichier .jar nécessaire à l'applicatif final.
Nous avons eu beaucoup de soucis à essayer de produire ce fichier, bien que nous ayons suivi la documentation officielle et autres tutoriels pour arriver à cette fin.

Finalement, une fois le .jar produit, on peut alors lancer le build de l'application via Maven et exposer le port que le frontend de l'applicatif utilise pour que celu-ci soit accessible dans notre navigateur.

Globalement, ce TP offre une utilisation et un exemple concret de l'utilité de Docker et sur la manière de "conteneriser" un logiciel.
On évite alors les problèmes de **configuration et d'environnement** que chaque machine possède, et qui peut alors rendre le **déploiement** compliqué.

Cependant, nous avons passé énormément de temps à la compilation de la librairie OpenCV, qui n'est qu'une dépendence du logiciel final.
Nous aurions probablement préféré un exercice avec moins de compréhension et de manipulation "techniques" pour prioriser la vraie utilisation de Docker comme, par exemple, "conteneriser" une application Node.JS utilisant une base MongoDB et proposant un front simple.

### Manipulation

```
git clone https://github.com/Theomariee/MDI_DockerOpenAI.git
cd MDI_DockerOpenAI
docker build -t opencvmaven .
```

Puis accéder à l'applicatif via `http://localhost:8080`

**NOTE :** Il peut arriver que le .jar ne soit pas produit, nous n'avons pas trouvé d'explication plausible et ce soucis a été rencontré par plusieurs groupes.
