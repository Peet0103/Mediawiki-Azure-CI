# Mediawiki-Azure-CI
This is intended for people who want to run small/medium sized wikis on Azure using Container Instances.

Base images are taken from https://hub.docker.com/_/mediawiki <br>
A few modifications are made to make it suitable for deploying on Azure as a stateless container.

It relies on Azure filestore attached volumes and symlinks to hold persistent data <br>
Two volumes are mounted to the container in Azure with the following mount points <br>
1) /var/www/html/LocalSettingsLink <br>
2) /var/www/html/imagesLink <br>
<br>
Symlinks are created for the persistent files <br>
The main configuration file: <br>
/var/www/html/LocalSettings.php is symlinked to /var/www/html/LocalSettingsLink/LocalSettings.php <br>
<br>
The logo that appears on all pages: <br>
/var/www/html/wiki.png is symlinked to /var/www/html/LocalSettingsLink/wiki.png <br>
<br>
The folder for holding all uploaded images: <br>
/var/www/html/images is symlinked to /var/www/html/imagesLink <br>
<br>
There is a known issue with Apache serving images from network attached storage that requires altering the apache2.conf file <br> 
/etc/apache2/apache2.conf was edited to include the following lines. <br>
<code>EnableSendfile Off <br>
  
EnableMMAP Off </code><br>

<b>Additional notes: </b><br>
I am using an Azure database for MySQL on a Flexible Server. <br>
When using this you will need to set the server parameter <b>require_secure_transport</b> to <b>OFF</b> (it defaults to ON during deployment) <br>

<b>System Diagram</b><br>
<a href="https://storage.googleapis.com/public-image-share/wiki-system-diag.png"><img src="https://storage.googleapis.com/public-image-share/wiki-system-diag.png" width="700" height="300"></a>
