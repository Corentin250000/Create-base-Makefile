# Create-base-Makefile

Ce programme crée la base vide d'un Makefile (adapté à la convention d'Epitech), ainsi qu'un _gitignore_ afin d'éviter les possibles _pushs_ sur _Github_ des fichiers de tests unitaire.

## Comment utiliser le programme ?

Téléchargez le script shell nommé **create_makefile.sh**, et exécutez-le (`./create_makefile.sh`) dans le dossier où vous voulez mettre le Makefile. Si vous n'avez pas le droit d'exécution sur le fichier, ajoutez-le via la commande `chmod +x create_makefile.sh`.

Pour les plus avancés, vous pouvez ajouter un chemin (**PATH**) dans votre fichier **.bashrc** (si bash utilisé, pour les autres, renseignez-vous) avec cette commande : `export PATH=$PATH:` avec, après le ':', le chemin absolu vers votre dossier où se trouve le script. Cela vous permettra de pouvoir exécuter le script où que vous soyez dans vos dossiers (commmande à exécuter : `create_makefile.sh`).

**Attention, l'exécution du script effacera le précédent Makefile, si présent.**

## Instructions supplémentaires

- Il est **préférable** de mettre la fonction `main` dans un **fichier à part**, afin d'éviter tout problème avec la **compilation** des tests unitaires.

- Dans la variable `SRC`, mettez tous vos fichiers sources, sauf ceux servant aux tests unitaires.

- Dans la variable `SRC_UNIT_TESTS`, mettez tous vos fichiers sources (**sauf le fichier où se trouve la fonction main**), y compris ceux servant aux tests unitaires.

- La variable `NAME` sert à donner le nom d'éxécutable au fichier compilé.

- Enfin, les variables `CFLAGS` et `LIBS` sont à remplir si besoin.
