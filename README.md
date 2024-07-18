# Create-base-Makefile

Ce programme crée la base vide d'un Makefile (adapté à la convention de l'école).

## Comment utiliser le programme ?

Téléchargez le script shell nommé **create_makefile.sh**, et exécutez-le dans le dossier où vous voulez mettre le Makefile. Si vous n'avez pas le droit d'exécution sur le fichier, ajoutez-le via la commande `chmod +x create_makefile.sh`.

Pour les plus avancés, vous pouvez ajouter un chemin (**PATH**) dans votre fichier **.bashrc** (si bash utilisé, pour les autres, renseignez-vous) avec cette commande : `export PATH=$PATH:` avec, après le ':', le chemin absolu vers votre dossier où se trouve le script. Cela vous permettra de pouvoir exécuter le script où que vous soyez dans vos dossiers.

**Attention, l'exécution du script effacera le précédent Makefile, si présent.**
