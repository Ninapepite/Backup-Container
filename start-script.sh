#!/bin/bash
#Mise en place des identifiants dans la configuration aws
aws configure set aws_access_key_id "$AccessKey"
aws configure set aws_secret_access_key "$AccessPass"
#Création d'un dossier backup avec la date
mkdir /backup-$(date +%Y-%m-%d)
#Tar de GLPI et Wordpress
tar -cvf /archive-glpi.tar /glpi_data
tar -cvf /archive-wps.tar /wps_data
#Connexion au conteneur de DB pour sauvegarder la base (ici x2 pour GLPI et Wordpress)
docker exec $ConteneurDB1 mysqldump -u $UserDB1 -p$PassDB1 --all-databases > /wps.sql
docker exec $ConteneurDB2 mysqldump -u $UserDB2 -p$PassDB2 --all-databases > /glpi.sql
#Copie des fichiers SQL et Tar dans le dossier backup
mv *.sql /backup-$(date +%Y-%m-%d)/
mv *.tar /backup-$(date +%Y-%m-%d)/
#Tar du dossier Backup
tar -cvf /backup-$(date +%Y-%m-%d).tar /backup-$(date +%Y-%m-%d)
#Copie sur le stockage S3 de Amazon
aws s3 cp /backup-$(date +%Y-%m-%d).tar "$AccessPoint"
