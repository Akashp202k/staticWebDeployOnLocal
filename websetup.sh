#!/bin/bash

echo "##################################################"
echo "			 WEL_COME"
echo "##################################################" 

PACKAGE="vim httpd unzip wget"
WEBURL="https://www.tooplate.com/zip-templates/2121_wave_cafe.zip"
WEBSCRIPTS="2121_wave_cafe"
SRC="httpd"
echo "##################################################"
echo "                INSTALLING PACKAGES"
echo "##################################################"

sudo yum install $PACKAGE -y
echo "##################################################"
echo "               STARTING THE SERVICES"
echo "##################################################"
sudo systemctl start $SRC
sudo systemctl enable $SRC

echo "##################################################"
echo "              CREATING DIR IN TMP DIR"
echo "##################################################"

sudo mkdir -p /tmp/web
cd /tmp/web

echo "##################################################"
echo "              GETTING WEB-SCRIPTS"
echo "##################################################"
sudo wget $WEBURL
sudo unzip $WEBSCRIPTS.zip
echo "##################################################"
echo "         MOVING WEB-SCRIPTS TO THE SERVER"
echo "##################################################"
sudo mv $WEBSCRIPTS/* /var/www/html

echo "##################################################"
echo "                RESTARTING SERVICE"
echo "##################################################"
sudo systemctl restart $SRC


