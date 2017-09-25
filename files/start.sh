#!/bin/bash

##########################################################################
##############  Script d'installation / démarrage Domoticz  ##############
##########################################################################


# Réinitialisation des logs
if [ -f /tmp/domoticz.log ]; then
    rm /tmp/domoticz.log
fi


# installation domoticz
if [ ! -f /home/pi/domoticz/domoticz ]; then

    echo -e "\n###############################################################"
    echo "###################  INSTALLATION DOMOTICZ  ###################"
    echo -e "###############################################################\n"
    sudo curl -L install.domoticz.com | bash

    # Kill du daemon Domoticz
    sudo service domoticz.sh stop

fi


# Démarrage Domoticz manuellement
#  port web 8080
#  db : /tmp/domoticz/db
#  log : /tmp/domoticz.log
/home/pi/domoticz/domoticz -www 8080 -dbase /tmp/domoticz.db -log /tmp/domoticz.log -loglevel=1 -nowwwpwd &> /dev/null &
