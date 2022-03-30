FROM mediawiki:latest
WORKDIR /var/www/html/
ADD Image-mods.sh ./
RUN bash /var/www/html/Image-mods.sh