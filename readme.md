# Conteneur de sauvegarde

## Présentation 

Le conteneur sauvegarde les volumes mappé et se connecte aux bases de données pour créer un .sql.

Déplace tous les fichiers dans un dossier backup.tar et le copie dans un Bucket S3 de Amazon.

## Utilisation

Il faut mapper les volumes à sauvegarder sur le conteneur et lui indiquer les chemins dans 'start-script.sh'.

Pour les bases de données, il faut indiquer le nom du conteneur, utilisateur et mot de passe. Le conteneur va se connecter avec docker-cli.
