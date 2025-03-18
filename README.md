# Create-base-Makefile

Ce programme crée la base vide d'un Makefile (adapté à la convention d'Epitech), ainsi qu'un _gitignore_ afin d'éviter les possibles _pushs_ sur _Github_ des fichiers de tests unitaire.

## Comment utiliser le programme ?

Téléchargez le script shell nommé **create_makefile.sh**, et exécutez-le (`./create_makefile.sh [année]`) dans le dossier où vous voulez mettre le Makefile. Si vous n'avez pas le droit d'exécution sur le fichier, ajoutez-le via la commande `chmod +x create_makefile.sh`. Le paramètre **année** sert pour inscrire l'année donnée dans **l'en-tête du Makefile**.

Pour les plus avancés, vous pouvez ajouter un chemin (**PATH**) dans votre fichier **.bashrc** (si bash utilisé, pour les autres, renseignez-vous) avec cette commande : `export PATH=$PATH:` avec, après le ':', le chemin absolu vers votre dossier où se trouve le script. Cela vous permettra de pouvoir exécuter le script où que vous soyez dans vos dossiers (commmande à exécuter : `create_makefile.sh [année]`).

**Attention, l'exécution du script effacera le précédent Makefile, si présent.**

## Instructions supplémentaires

- Il est **préférable** de mettre la fonction `main` dans un **fichier à part**, afin d'éviter tout problème avec la **compilation** des tests unitaires.

- Dans la variable `SRC`, mettez tous vos **fichiers sources**, sauf ceux servant aux **tests unitaires**.

- Dans la variable `SRC_UNIT_TESTS`, mettez tous vos **fichiers sources** (**_sauf le fichier où se trouve la fonction main_**), y compris ceux servant aux tests **unitaires**.

- La variable `NAME` sert à donner le nom d'éxécutable au fichier compilé.

- Les variables `FLAGS` et `LIBS` sont à remplir si besoin (le **-I** dans les `FLAGS` est à remplir avec **votre dossier** où se trouve vos **fichiers .h** [dans le cas du C], comme ceci : `-I[chemin vers le dossier]`). **Surtout**, n'oubliez pas de **remplir ou supprimer** l'option **-I**, car, si vous la laissez vide, le Makefile provoquera une **erreur**.

- Enfin, si vous utilisez une **bibliothèque statique compilée** avec un autre Makefile, vous pouvez **décommenter** la ligne qui compile la bibliothèque.
Si vous utilisez un autre dossier que `lib`, n'hésitez pas à le changer pour correspondre à votre cas, tout en suivant cette **règle** : `make re -C [chemin vers le dossier du Makefile]`. De plus, n'hésitez pas à retirer la redirection vers le `/dev/null` si vous avez besoin des affichages dans le terminal.
