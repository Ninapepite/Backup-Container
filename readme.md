# Conteneur de sauvegarde

## Présentation 

Le conteneur sauvegarde les volumes mappé et se connecte aux bases de données pour créer un .sql.
Déplace tous les fichiers dans un dossier backup.tar et le copie dans un Bucket S3 de Amazon.

## Utilisation

Il faut mapper les volumes à sauvegarder sur le conteneur et lui indiquer les chemins dans 'start-script.sh', de même pour les bases de données.
