#!/bin/bash

#Install nano for any manual mods later
apt-get update
apt-get install nano -y

#Modify the apache2 config file, wont serve files from network shares without modifications, gives http request errors
echo EnableSendfile Off >> /etc/apache2/apache2.conf
echo EnableMMAP Off >> /etc/apache2/apache2.conf

#set up symbolic links to mounted network shares. Azure cant mount to files only directories so symlinks are used to get around this
ln -sf /var/www/html/LocalSettingsLink/LocalSettings.php /var/www/html/LocalSettings.php
ln -sf /var/www/html/LocalSettingsLink/LocalSettings.php /var/lib/html/LocalSettings.php
ln -sf /var/www/html/LocalSettingsLink/LocalSettings.php /var/www/html/mediawiki/LocalSettings.php


ln -sf /var/www/html/LocalSettingsLink/wiki.png /var/www/html/wiki.png
ln -sf /var/www/html/imagesLink /var/www/html/images

