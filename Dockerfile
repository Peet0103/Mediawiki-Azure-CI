FROM mediawiki:latest
WORKDIR /var/www/html/
ADD Image-mods.sh ./
ADD LocalSettings.php ./
RUN bash /var/www/html/Image-mods.sh
#:(
